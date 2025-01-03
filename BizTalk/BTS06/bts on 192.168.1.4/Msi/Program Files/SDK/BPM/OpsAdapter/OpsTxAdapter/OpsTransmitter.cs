//---------------------------------------------------------------------
// File: OpsTransmitter.cs
// 
// Summary: This class receives batched requests from BizTalk server and 
// delegates these requests to a threadpool. In general there is no need
// to alter any code in this class.
//
//NOTE: MaxBatchSize property is overrided and it always returns one.
//---------------------------------------------------------------------
// This file is part of the Microsoft BizTalk Server 2006 SDK
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
using System.Xml;
using Microsoft.Samples.BizTalk.Adapter.Common;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.TransportProxy.Interop;

namespace Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.RunTime.OpsTransmitAdapter
{
	/// <summary>
    /// Summary description for OpsTransmitter.
    /// </summary>
    [CLSCompliant(false)]
	sealed public class OpsTransmitter : AsyncTransmitter
	{
		//Batch size is limited to one for this adapter.
		const int MAX_BATCH_SIZE = 1;
		
		#region OpsTransmitter functions
        public OpsTransmitter() : base(
			"Ops Transmit Adapter",
			"1.0",
			"Ops Transmit Adapter",
			"Ops",
			new Guid("fb1659a6-9a71-46aa-be4a-03488f0ca6a1"),
			"http://schemas.microsoft.com/Samples/BizTalk/SouthridgeVideo/Adapters/OpsAdapter",
			typeof(OpsTransmitAdapterBatch),
            MAX_BATCH_SIZE)
        {
		}

        // Used when there are updates to the adapter configuration properties
        // there are no adapter level configuration properties
        //protected override void HandlerPropertyBagLoaded()
        //{
        //}

		protected override int MaxBatchSize
		{
			get
			{
				return MAX_BATCH_SIZE;
			}
        }

        [CLSCompliant(false)]
        protected override IBTTransmitterBatch CreateAsyncTransmitterBatch()
        {
            return new OpsTransmitAdapterBatch(
                this.MaxBatchSize,
                this.EndpointType,
                this.PropertyNamespace,
                this.HandlerPropertyBag,
                this.TransportProxy,
                this.ControlledTermination,
                this);
        }
        #endregion //OpsTransmitter functions
    }
}
