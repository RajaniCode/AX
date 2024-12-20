//---------------------------------------------------------------------
// File: OpsTransmitAdapterBatch.cs
// 
// Summary: This class is the implementation of the batched transmit-
// adapter. Make your changes to the SendOpsRequest
// function. In general there is no need to alter any other code in 
// this class.
//
// NOTE: The batch size for this adapter is limited to one.
// The adapter loads the configured assembly and looks for a interface
// "IOpsAIC". It then invokes a method Execute() into the Interface.
//---------------------------------------------------------------------
// This file is part of the Microsoft BizTalk Server 2004-2005 SDK
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// This source code is intended only as a supplement to Microsoft BizTalk
// Server 2006 release and/or on-line documentation. See these other
// materials for detailed information regarding Microsoft code samples.
//
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
// PURPOSE.
//---------------------------------------------------------------------

using System;
using System.Text;
using System.IO;
using System.Xml;
using System.Collections;
using System.Threading;
using System.Diagnostics;
using System.Transactions;
using Microsoft.BizTalk.TransportProxy.Interop;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.Samples.BizTalk.Adapter.Common;
using System.Reflection;
using System.Security.Permissions;
using System.Collections.Specialized;
using System.Resources;
using Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter;


namespace Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.RunTime.OpsTransmitAdapter
{
    /// <summary>
    /// Summary description for OpsTransmitAdapterBatch.
    /// </summary>
	[CLSCompliant(false)]
    public class OpsTransmitAdapterBatch : AsyncTransmitterBatch
	{
        private static ResourceManager resourceManager = new ResourceManager("Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.OpsTxAdapter.Properties.Resources", Assembly.GetExecutingAssembly());
        public const string InterfaceError = "Error occurred while handling IOpsAIC interface.";

        private static HybridDictionary assemblyCache = new HybridDictionary();

        // Delegate for the BatchWorker. 
        private delegate void BatchWorkerDelegate(string outboundTransportLocation, ArrayList batch);
        private BatchWorkerDelegate batchWorker;
        private ControlledTermination control;

		#region General OpsTransmitAdapterBatch functions
        [CLSCompliant(false)]
        public OpsTransmitAdapterBatch(int maxBatchSize, Type endpointType, string propertyNamespace, IPropertyBag handlerPropertyBag, IBTTransportProxy transportProxy, ControlledTermination controlledTermination, AsyncTransmitter asyncTransmitter) :
			base(maxBatchSize,endpointType, propertyNamespace, handlerPropertyBag, transportProxy, asyncTransmitter)
		{
            this.batchWorker = new BatchWorkerDelegate(BatchWorker);
            this.control = controlledTermination;
		}

        #region SortMessagesIntoBatches
        // Sort the messages into batches
        /// <summary>
        /// Sorts the heterogenous batch into a set of homogenous batches.
        /// </summary>
        /// <remarks>
        /// A batch contains a set of message for a given transport.
        /// It is the adapter's responsibility to sort which message in the
        /// batch goes to which configured destination.
        /// </remarks>
        /// <returns>hashtable of homogenous batches</returns>
        private Hashtable SortMessagesIntoBatches()
        {
            Hashtable batches = new Hashtable();

            //  this.Messages is what we get from the BaseAdaper (EPM)
            foreach (IBaseMessage transmitterMessage in this.Messages)
            {
                SystemMessageContext context = new SystemMessageContext(transmitterMessage.Context);
                string outboundTransportLocation = context.OutboundTransportLocation;

                ArrayList batch = null;
                if (!batches.ContainsKey(outboundTransportLocation))
                {
                    batch = new ArrayList();
                    batches.Add(outboundTransportLocation, batch);
                }
                else
                {
                    batch = (ArrayList)batches[outboundTransportLocation];
                }
                batch.Add(transmitterMessage);
            }

            return batches;
        }

        #endregion

        /// <summary>
        /// Called by EPM to work on a given batch.
        /// Worker will distribute homogenous batchs to BatchWorkers
        /// </summary>
        protected override void Worker()
        {
            try
            {
                foreach (DictionaryEntry entry in SortMessagesIntoBatches())
                {
                    this.batchWorker.BeginInvoke((string)entry.Key, (ArrayList)entry.Value, null, null);
                }
            }
            catch (Exception e)
            {
                this.transportProxy.SetErrorInfo(e);
                // not re-throwing as the worker is supposed to set the error information and continue
            }
        }

		/// <summary>
		/// Works on a batch from a thread
		/// </summary>
		/// <param name="outboundTransportLocation">send location uri</param>
		/// <param name="messages">homogenous batch of messages</param>
        private void BatchWorker(string outboundTransportLocation, ArrayList messages)
        {
            if (null == messages)
            {
                ArgumentNullException e = new ArgumentNullException("messages");
                Trace.WriteLine(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Exception caught in OpsAdapterWorkItem.ProcessWorkItem(): {0}", e), "Configuration error");
                this.transportProxy.SetErrorInfo(e);
                return;
            }

            //  we did an enter for every message - so we should ensure we have a correspending leave
            int leaveCount = messages.Count;

            try
            {
                // Get the adapter location properties
                // all the message in this batch should have the same properties
                OpsAdapterProperties opsProps = GetLocationConfiguration((IBaseMessage)messages[0], outboundTransportLocation);

                // Get the appropriate AIC
                // Since this is a homogenous batch then all of the messages are destined for the same AIC
                IOpsAIC aic = GetAIC(opsProps);

                foreach (IBaseMessage message in messages)
                {
                    CommittableTransaction transaction = null;

                    try
                    {
                        IBaseMessagePart bodyPart = message.BodyPart;
                        Stream s;

                        if (null != bodyPart && (null != (s = bodyPart.GetOriginalDataStream())))
                        {
                            transaction = new CommittableTransaction();

                            //  give the CommittableTransaction to the batch and it will take the responsibility to Commit it.
                            using (Batch txBatch = new TransactionalDeleteBatch(this.transportProxy, this.control, transaction))
                            {
                                using (TransactionScope ts = new TransactionScope(transaction, TimeSpan.FromHours(1), EnterpriseServicesInteropOption.Full))
                                {
                                    // Try to send the message and, if successfull, delete the message
                                    // from the AppQ
                                    // If we successfully sent the message, delete it from the AppQueue...
                                    aic.Initialize(opsProps.InitializationData);
                                    aic.Execute(GetBuffer(s));

                                    //  an exception will skip this next line
                                    ts.Complete();
                                }

                                //  IMPORTANT: a Delete is part of the same transaction as the send operation
                                txBatch.DeleteMessage(message);

                                //  IMPORTANT: if there was a response to submit it would be added here
                                //  - in the same batch and same transaction as the Delete

                                txBatch.Done();
                            }
                        }
                    }
                    catch (Exception e)
                    {
                        // in this scenario we will explicitly Rollback the transaction on failure
                        if (null != transaction)
                        {
                            transaction.Rollback();
                        }

                        HandleMessageFailure(message, e);
                    }

                    // an exception will skip this line - an exception means the Done hasn't been called or was successful so we have a leave to do
                    leaveCount--;
                }
            }
            catch (Exception outerEx)
            {
                // Make sure we handle the rest of the messages in the batch that weren't handled above
                for (int i = messages.Count - leaveCount; i < messages.Count; i++)
                {
                    try
                    {
                        HandleMessageFailure((IBaseMessage)messages[i], outerEx);

                        leaveCount--;
                    }
                    catch (Exception innerEx)
                    {
                        Trace.WriteLine(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Exception caught on message {0} in OpsAdapterWorkItem.ProcessWorkItem(): {1}", i, innerEx), "Configuration error");
                        this.transportProxy.SetErrorInfo(innerEx);
                    }
                }

                Trace.WriteLine(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Exception caught in OpsAdapterWorkItem.ProcessWorkItem(): {0}", outerEx), "Configuration error");
                this.transportProxy.SetErrorInfo(outerEx);
            }
            finally
            {
                // perform any remaining leaves - hopefully none - if everything was successful then leaveCount will be 0
                for (int i = 0; i < leaveCount; i++)
                {
                    this.control.Leave();
                }
            }
        }

        /// <summary>
        /// Handle message failures in a batch
        /// </summary>
        /// <param name="message">message to handle</param>
        /// <param name="e">exception thrown</param>
        private void HandleMessageFailure(IBaseMessage message, Exception e)
        {
            //  Remember to set the exception on the message itself - this will now appear in tracking in addition to the EventLog
            Trace.WriteLine(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Exception caught in OpsAdapterWorkItem.ProcessWorkItem(): {0}", e), "Ops Transmit Adapter: Error");
            if (e.GetType() == typeof(TargetInvocationException))
            {
                // the exception thrown by remoting components is the inner exception
                message.SetErrorInfo(e.InnerException);
            }
            else
            {
                message.SetErrorInfo(e);
            }

            //  Any failures need to be retried or suspended - but the change of state back on BizTalk is outside of the transaction
            //  that has been used to attempt to send the message - after all that transaction will undoubtedly get rollback with the failure.
            //  We say this batch is "non-transactional" from the adapter's point of view - though internally in BizTalk its still a transaction.
            using (TransmitResponseBatch batch = new TransmitResponseBatch(this.transportProxy, new TransmitResponseBatch.AllWorkDoneDelegate(AllWorkDone)))
            {
                if (e.GetType() == typeof(OpsAdapterException))
                {
                    // Interface or object invocation errors are suspended
                    batch.MoveToSuspendQ(message);
                }
                else
                {
                    // other types of errors should be retried.
                    batch.Resubmit(message, false, null);
                }
                batch.Done();
            }
        }

        /// <summary>
        /// Delegate called when Done is complete
        /// </summary>
        private void AllWorkDone()
        {
            this.asyncTransmitter.Leave();
        }

        /// <summary>
        /// Gets the location configuration properties
        /// </summary>
        /// <param name="message">message containing adapter properties</param>
        /// <param name="outboundTransportLocation">the uri for the send location</param>
        /// <returns>OpsAdapter properties</returns>
        private OpsAdapterProperties GetLocationConfiguration(IBaseMessage message, string outboundTransportLocation)
        {
            OpsAdapterProperties opsProps = new OpsAdapterProperties(outboundTransportLocation);
            string config = (string)message.Context.Read("AdapterConfig", this.propertyNamespace);
            //  the config can be null all that means is that we are doing a dynamic send
            if (null != config)
            {
                XmlDocument locationConfigDom = new XmlDocument();
                locationConfigDom.LoadXml(config);
                opsProps.LocationConfiguration(locationConfigDom);
            }
            else
            {
                //  For Dynamic Sends the destination is taken from the outboundLocation URI
                opsProps.UpdateUriForDynamicSend();
            }

            return opsProps;
        }

        #endregion //General OpsTransmitAdapterBatch functions

        /// <summary>
        /// Gets a byte array from a stream
        /// </summary>
        /// <param name="s">stream to get byte array from</param>
        /// <returns>byte array buffer</returns>
        /// <remarks>Warning: for large messages you are pulling the entire message into memory</remarks>
        private static byte[] GetBuffer(Stream s)
        {
            const int bufferSize = 4096;
            byte[] msgBuffer = new byte[bufferSize];
            int msgLength = 0;
            if (s.CanSeek)
            {
                // Can only get the length of a seekable stream
                msgLength = (int)s.Length;
            }
            else
            {
                // Since we don't know the actual size of the message
                // initialize it to the buffer size
                msgLength = bufferSize;
            }

            using (MemoryStream memStream = new MemoryStream(msgLength))
            {
                int bytesRead = 0;
                long totalRead = 0;
                do
                {
                    // read the stream bufferSize bytes at a time
                    bytesRead = s.Read(msgBuffer, 0, bufferSize);
                    totalRead += bytesRead;
                    memStream.Write(msgBuffer, 0, bytesRead);
                } while (bytesRead != 0);

                memStream.Flush();
                memStream.Seek(0, SeekOrigin.Begin);

                return memStream.GetBuffer();
            }
        }

        /// <summary>
        /// Gets the appropriate configured component to call
        /// </summary>
        /// <param name="opsProps">adapter properties for message</param>
        /// <returns>component to call</returns>
        private static IOpsAIC GetAIC(OpsAdapterProperties opsProps)
        {
            IOpsAIC aic;

            try // to use reflection to load the assembly and query the interface
            {
                // Gets the assembly from a cache
                Assembly dotNetAssembly = GetAssembly(opsProps.DotNetAssemblyStrongName);

                // Create an instance of the class
                Type type = dotNetAssembly.GetType(opsProps.DotNetClassName);

                // Construct the AIC
                aic = Activator.CreateInstance(type) as IOpsAIC;
            }
            catch (Exception ex)
            {
                //Caught a unhandled exception while handling the Assembly
                //Set the exception to filter the message for suspension
                //The message is moved to SuspendQ and not resubmitted
                throw new OpsAdapterException(InterfaceError, ex);
            }

            return aic;
        }

        /// <summary>
        /// Gets the assembly with the strong name from the cache or GAC
        /// </summary>
        /// <param name="assemblyStrongName">assembly to load</param>
        /// <returns>assembly</returns>
        private static Assembly GetAssembly(string assemblyStrongName)
        {
            Assembly assembly = assemblyCache[assemblyStrongName] as Assembly;
            if (null == assembly)
            {
                // Loads assembly from GAC
                assembly = Assembly.Load(assemblyStrongName);
                assemblyCache[assemblyStrongName] = assembly;
            }

            return assembly;
        }
	}

    /// <summary>
    /// Transactional batch for deleting successful messages from the message box
    /// </summary>
    sealed class TransactionalDeleteBatch : TxnBatch
    {
        public TransactionalDeleteBatch(IBTTransportProxy transportProxy, ControlledTermination control, CommittableTransaction transaction)
            : base(transportProxy, control, transaction, null, true)
        {
        }
        protected override void DeleteSuccess(IBaseMessage message, Int32 hrStatus, object userData)
        {
            base.SetComplete();
        }
        protected override void DeleteFailure(IBaseMessage message, Int32 hrStatus, object userData)
        {
            base.SetAbort();
        }
    }

}
