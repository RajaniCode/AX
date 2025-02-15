//---------------------------------------------------------------------
// File: AdapterManagement.cs
// 
// Summary: This class does the designtime property-management. If you 
// add or remove properties to or from your adapter be sure to add
// some code to the appropriate validation routines.
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
using System.IO;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Xml;
using System.Runtime.Serialization;
using Microsoft.Win32;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Adapter.Framework;

namespace Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.OpsDesignTime
{
    /// <summary>
    /// Class AdapterManagement implements
    /// IAdapterConfig and IStaticAdapterConfig interfaces for
    /// management to illustrate a static adapter that uses the
    /// adapter framework
    /// </summary>
    public class AdapterManagement : IAdapterConfig, IStaticAdapterConfig, IAdapterConfigValidation 
	{
		#region General adapter management functions
        private static ResourceManager resourceManager = new ResourceManager("Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.OpsDesignTime.Properties.Resources", Assembly.GetExecutingAssembly());
																																				  
		/// <summary>
		/// Gets the localized configuration in xml
		/// </summary>
		/// <param name="schema">shema defining configuration properties</param>
		/// <returns>localized configurations properties in xml</returns>
        protected static string LocalizeSchema (string schema)
		{
            if (null == AdapterManagement.resourceManager)
            {
                throw new ArgumentNullException("resourceManager");
            }

            XmlDocument document = new XmlDocument();
			document.LoadXml(schema);

			XmlNodeList nodes = document.SelectNodes("/descendant::*[@_locID]");
			foreach (XmlNode node in nodes)
			{
				string locID = node.Attributes["_locID"].Value;
                node.InnerText = AdapterManagement.resourceManager.GetString(locID);
			}

			StringWriter writer = new StringWriter(System.Globalization.CultureInfo.InvariantCulture);
			document.WriteTo(new XmlTextWriter(writer));

			string localizedSchema = writer.ToString();
			return localizedSchema;
        }
        #region IAdapterConfig implementations
        /// <summary>
        /// Returns the configuration schema as a string.
        /// (Implements IAdapterConfig)
        /// </summary>
        /// <param name="type">Configuration schema to return</param>
        /// <returns>Selected xsd schema as a string</returns>
        public string GetConfigSchema(ConfigType type) 
		{
            switch (type) 
			{            
                case ConfigType.TransmitHandler:
                    return AdapterManagement.LocalizeSchema(GetResource("Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.OpsDesignTime.TransmitHandler.xsd"));

                case ConfigType.TransmitLocation:
                    return AdapterManagement.LocalizeSchema(GetResource("Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.OpsDesignTime.TransmitLocation.xsd"));

                default: // There is no receive side of this adapter
                    return null;
            }
        }

        /// <summary>
        /// Acquire externally referenced xsd's
        /// </summary>
        /// <param name="xsdLocation">Location of schema</param>
        /// <param name="xsdNamespace">Namespace</param>
        /// <param name="XSDFileName">Schema file name (return)</param>
        /// <returns>Outcome of acquisition</returns>
        public Result GetSchema(string xsdLocation,
                                string xsdNamespace,
                                out string xsdSchema)
        {
            xsdSchema = null;
            return Result.Continue;
        }
        #endregion // IAdapterConfig implementations

        #region IStaticAdapterConfig
        /// <summary>
        /// Get the WSDL file name for the selected WSDL
        /// </summary>
        /// <param name="wsdls">place holder</param>
        /// <returns>An empty string[]</returns>
        public string[] GetServiceDescription(string[] wsdls) 
		{
            string[] result = null;
            return result;
        }

        /// <summary>
        /// Gets the XML instance of TreeView that needs to be rendered
        /// </summary>
        /// <param name="endpointConfiguration"></param>
        /// <param name="nodeIdentifier"></param>
        /// <returns>Location of TreeView xml instance</returns>
        [CLSCompliant(false)]
        public string GetServiceOrganization(IPropertyBag endpointConfiguration,
                                             string nodeIdentifier) 
		{
            string result = string.Empty;
            return result;
        }
        #endregion //IStaticAdapterConfig

        #region IAdapterConfigValidation
        /// <summary>
        /// Validate xmlInstance against configuration. In this example it does nothing.
        /// </summary>
        /// <param name="type">Type of port or location being configured</param>
        /// <param name="xmlInstance">Instance value to be validated</param>
        /// <returns>Validated configuration.</returns>
        public string ValidateConfiguration(ConfigType configType,
            string xmlInstance) 
		{
            string validXml = String.Empty;

            switch (configType) 
			{
				// There is no receive handler for this adapter
                case ConfigType.ReceiveHandler:
				case ConfigType.ReceiveLocation:
					break;

				case ConfigType.TransmitHandler:
					validXml = xmlInstance; 
					break;

				case ConfigType.TransmitLocation:
					validXml = AdapterManagement.ValidateTransmitLocation(xmlInstance); 
					break;
            }

            return validXml;
        }
        #endregion //IAdapterConfigValidation
        #endregion //General adapter management functions


        /// <summary>
        /// Helper to get resource from manifest.
        /// </summary>
        /// <param name="resource">Full resource name</param>
        /// <returns>Resource value</returns>
        private string GetResource(string resource) 
		{
            string value = null;
            if (!string.IsNullOrEmpty(resource))
            {
                Assembly assem = this.GetType().Assembly;
                Stream stream = assem.GetManifestResourceStream(resource);
                StreamReader reader = null;

                using (reader = new StreamReader(stream))
                {
                    value = reader.ReadToEnd();
                }
            }

            return value;
        }

        /// <summary>
        /// Generate uri entry based on DotNetAssemblyStrongName and DotNetClassName values
        /// </summary>
        /// <param name="type">Type of port or location being configured</param>
        /// <param name="xmlInstance">Instance value to be validated</param>
        /// <returns>Validated configuration.</returns>
        private static string ValidateTransmitLocation(string xmlInstance) 
		{
            // Load up document
            XmlDocument document = new XmlDocument();
            document.LoadXml(xmlInstance);
            
			XmlNode DotNetAssemblyStrongName = document.SelectSingleNode("Config/DotNetAssemblyStrongName");
			// Ensure that the DotNetAssemblyStrongName supplied is not empty
            if (DotNetAssemblyStrongName == null || string.IsNullOrEmpty(DotNetAssemblyStrongName.InnerText))
            {
                throw new OpsAdapterValidationException("Transport properties validation failed.  Value for required adapter property \"DotNetAssemblyStrongName\" is not specified.");
            }

			XmlNode DotNetClassName = document.SelectSingleNode("Config/DotNetClassName");
			// Ensure that the DotNetClassName supplied is not empty
            if (DotNetClassName == null || string.IsNullOrEmpty(DotNetClassName.InnerText))
            {
                throw new OpsAdapterValidationException("Transport properties validation failed.  Value for required adapter property \"DotNetClassName\" is not specified.");
            }


			XmlNode uri = document.SelectSingleNode("Config/uri");
			if (null == uri) 
			{
				uri = document.CreateElement("uri");
				document.DocumentElement.AppendChild(uri);
			}
			uri.InnerText = "OPS://" + DotNetAssemblyStrongName.InnerText + "/" + DotNetClassName.InnerText;
                           
            return document.OuterXml;
        }
	}

    /// <summary>
    /// OpsAdapterValidationException thrown when Ops adapter management fails to validate configuration
    /// </summary>
    internal class OpsAdapterValidationException : ApplicationException
    {
        public OpsAdapterValidationException() { }

        public OpsAdapterValidationException(string msg) : base(msg) { }

        public OpsAdapterValidationException(Exception inner) : base(String.Empty, inner) { }

        public OpsAdapterValidationException(string msg, Exception e) : base(msg, e) { }

        protected OpsAdapterValidationException(SerializationInfo info, StreamingContext context) : base(info, context) { }
    }
}
