//---------------------------------------------------------------------
// File: OpsAdapterExceptions.cs
// 
// Summary: This class holds a custom adapter exception. If you need 
// more exception interfaces you can add them here. Otherwise, there
// is no need to alter this code.
//
//
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
using System.Runtime.Serialization;

namespace Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.RunTime.OpsTransmitAdapter
{
    /// <summary>
    /// OpsAdapteException thrown from Ops Adapter when an exception is found.
    /// </summary>
    internal class OpsAdapterException : ApplicationException
	{
		#region Adapter exception class
		public static string UnhandledTransmit_Error = "The OpsAdapter encounted an error transmitting a batch of messages.";

		public OpsAdapterException () { }

		public OpsAdapterException (string msg) : base(msg) { }

		public OpsAdapterException (Exception inner) : base(String.Empty, inner) { }

		public OpsAdapterException (string msg, Exception e) : base(msg, e) { }

        protected OpsAdapterException(SerializationInfo info, StreamingContext context) : base(info, context) { }
		#endregion //Adapter exception class
	}
}

