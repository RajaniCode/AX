// SOAP Extension for debugging.
//
// To use,
// 1. Add this file to the Web Service project.
// 2. To enable tracing of SOAP requests and responses, do one of the following:
//    * Globally:
//      Add the following to the Web.config file under the /configuration/system.web/webServices node.
//      <soapExtensionTypes>
//        <add type="Microsoft.Samples.BizTalk.WoodgroveBank.OrchProxy.Adapter.TraceExtension, Microsoft.Samples.BizTalk.WoodgroveBank.OrchProxy.Adapter" priority="1" group="0" />
//      </soapExtensionTypes>
//    * Selectively:
//      Add [TraceExtensionAttribute()] custom attribute to web methods.
// 3. Rebuild the Web Service project.
//
// By default, the SOAP request and SOAP response log is stored under the ASPNET temporary folder:
// * %SystemDrive%\Documents and Settings\%COMPUTERNAME%\ASPNET\Local Settings\Temp\BizTalkWebServices
//
// References:
// 1. <soapExtensionTypes> Element
//    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/gngrfsoapextensionreflectortypes.asp
// 2. Altering the SOAP Message Using SOAP Extensions
//    ms-help://MS.VSCC.2003/MS.MSDNQTR.2003FEB.1033/cpguide/html/cpconalteringsoapmessageusingsoapextensions.htm
//
using System;

namespace Microsoft.Samples.BizTalk.WoodgroveBank.OrchProxy.Adapter
{
	/// <summary>
	/// SOAP Extension that traces the SOAP request and SOAP response
	/// for the web method the SOAP extension is applied to.
	/// </summary>
	public class TraceExtension : System.Web.Services.Protocols.SoapExtension 
	{
		/// <summary>
		/// Initializes a new instance of the TraceExtension class.
		/// </summary>
		public TraceExtension()
		{
		}

		System.IO.Stream oldStream;
		System.IO.Stream newStream;
		string pathname;

		/// <summary>
		/// Override. Allows this SOAP extension access to the memory buffer
		/// containing the SOAP request or response.
		/// </summary>
		/// <param name="stream"></param>
		/// <returns></returns>
		public override System.IO.Stream ChainStream(System.IO.Stream stream)
		{
			this.oldStream = stream;
			this.newStream = new System.IO.MemoryStream();
			return newStream;
		}

		/// <summary>
		/// Override. Allows this SOAP extension to initialize data
		/// specific to an XML Web service method at a one time performance cost.
		/// </summary>
		/// <param name="methodInfo"></param>
		/// <param name="attribute"></param>
		/// <returns></returns>
		public override object GetInitializer(System.Web.Services.Protocols.LogicalMethodInfo methodInfo, System.Web.Services.Protocols.SoapExtensionAttribute attribute)
		{
			string pathname = ((TraceExtensionAttribute)attribute).Pathname;
			return pathname;
		}

		/// <summary>
		/// Override. Allows this SOAP extension to initialize data
		/// specific to an XML Web service method at a one time performance cost.
		/// </summary>
		/// <param name="webServiceType"></param>
		/// <returns></returns>
		public override object GetInitializer(System.Type webServiceType) 
		{
			string temp = System.IO.Path.Combine(System.IO.Path.GetTempPath(), "BizTalkWebServices");
			System.Reflection.AssemblyName aname = System.Reflection.Assembly.GetExecutingAssembly().GetName();
			string path = System.IO.Path.Combine(temp, aname.Name + "_" + aname.Version.ToString());
			string pathname = System.IO.Path.Combine(path, webServiceType.FullName + ".log");
			return pathname;
		}

		/// <summary>
		/// Override. Allows this SOAP extension to initialize itself
		/// using the data cached in the GetInitializer method.
		/// </summary>
		/// <param name="initializer"></param>
		public override void Initialize(object initializer) 
		{
			this.pathname = (string)initializer;
			string path = System.IO.Path.GetDirectoryName(this.pathname);
			if (!System.IO.Directory.Exists(path))
			{
				System.IO.Directory.CreateDirectory(path);
			}
		}

		/// <summary>
		/// Override. Allows this SOAP extension to receive a SoapMessage to process
		/// at each SoapMessageStage.
		/// </summary>
		/// <param name="message"></param>
		public override void ProcessMessage(System.Web.Services.Protocols.SoapMessage message) 
		{
			switch (message.Stage)
			{
				case System.Web.Services.Protocols.SoapMessageStage.BeforeDeserialize:
					this.WriteInput(message);
					break;

				case System.Web.Services.Protocols.SoapMessageStage.AfterDeserialize:
					break;

				case System.Web.Services.Protocols.SoapMessageStage.BeforeSerialize:
					break;

				case System.Web.Services.Protocols.SoapMessageStage.AfterSerialize:
					this.WriteOutput(message);
					break;

				default:
					throw new System.InvalidOperationException("Invalid SoapMessageStage");
			}
		}

		/// <summary>
		/// Writes SOAP request received from web client to trace file.
		/// </summary>
		/// <param name="message"></param>
		private void WriteInput(System.Web.Services.Protocols.SoapMessage message)
		{
			this.Copy(this.oldStream, this.newStream);
			using (System.IO.FileStream fs = new System.IO.FileStream(this.pathname, System.IO.FileMode.Append, System.IO.FileAccess.Write))
			{
				using (System.IO.StreamWriter writer = new System.IO.StreamWriter(fs))
				{
					string messageType = "Message";
					if (message is System.Web.Services.Protocols.SoapServerMessage)
					{
						messageType = "Request";
					}
					else if (message is System.Web.Services.Protocols.SoapClientMessage)
					{
						messageType = "Response";
					}
					writer.WriteLine("===== Input SOAP " + messageType + " at " + System.DateTime.Now + " =====");
					writer.Flush();
					this.newStream.Position = 0;
					this.Copy(this.newStream, fs);
				}
			}
			newStream.Position = 0;
		}

		/// <summary>
		/// Writes SOAP response sent to web client to trace file.
		/// </summary>
		/// <param name="message"></param>
		private void WriteOutput(System.Web.Services.Protocols.SoapMessage message)
		{
			using (System.IO.FileStream fs = new System.IO.FileStream(this.pathname, System.IO.FileMode.Append, System.IO.FileAccess.Write))
			{
				using (System.IO.StreamWriter writer = new System.IO.StreamWriter(fs))
				{
					string messageType = "Message";
					if (message is System.Web.Services.Protocols.SoapServerMessage)
					{
						messageType = "Response";
					}
					else if (message is System.Web.Services.Protocols.SoapClientMessage)
					{
						messageType = "Request";
					}
					writer.WriteLine("===== Output SOAP " + messageType + " at " + System.DateTime.Now + " =====");
					writer.Flush();
					newStream.Position = 0;
					this.Copy(this.newStream, fs);
					writer.WriteLine(string.Empty);
					writer.Flush();
				}
				newStream.Position = 0;
				this.Copy(this.newStream, this.oldStream);
			}
		}

		/// <summary>
		/// Copies source stream to destination stream.
		/// </summary>
		/// <param name="fromStream"></param>
		/// <param name="toStream"></param>
		private void Copy(System.IO.Stream fromStream, System.IO.Stream toStream) 
		{
			System.IO.TextReader reader = new System.IO.StreamReader(fromStream);
			System.IO.TextWriter writer = new System.IO.StreamWriter(toStream);
			writer.WriteLine(reader.ReadToEnd());
			writer.Flush();
		}
	}

	/// <summary>
	/// SoapExtensionAttribute that can be applied to a web method.
	/// </summary>
	[System.AttributeUsageAttribute(System.AttributeTargets.Method)]
	public class TraceExtensionAttribute : System.Web.Services.Protocols.SoapExtensionAttribute
	{
		/// <summary>
		/// Initializes a new instance of the TraceExtensionAttribute class.
		/// </summary>
		public TraceExtensionAttribute()
		{
			string temp = System.IO.Path.Combine(System.IO.Path.GetTempPath(), "BizTalkWebServices");
			System.Reflection.AssemblyName aname = System.Reflection.Assembly.GetExecutingAssembly().GetName();
			string path = System.IO.Path.Combine(temp, aname.Name + "_" + aname.Version.ToString());
			this.pathname = System.IO.Path.Combine(path, typeof(TraceExtension).Name + ".log");
		}

		private int priority = 0;
		private string pathname;

		/// <summary>
		/// Override. Gets the Type of the SOAP extension.
		/// </summary>
		public override System.Type ExtensionType 
		{
			get { return typeof(TraceExtension); }
		}

		/// <summary>
		/// Override. Gets or sets the priority of the SOAP extension.
		/// </summary>
		public override int Priority 
		{
			get { return this.priority; }
			set { this.priority = value; }
		}

		/// <summary>
		/// Gets or sets the pathname of the trace file.
		/// </summary>
		public string Pathname 
		{
			get { return this.pathname; }
			set { this.pathname = value; }
		}
	}
}
