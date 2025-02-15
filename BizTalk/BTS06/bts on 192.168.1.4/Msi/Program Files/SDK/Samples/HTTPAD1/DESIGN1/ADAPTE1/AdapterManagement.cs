//---------------------------------------------------------------------
// File: AdapterManagement.cs
// 
// Summary: Implementation of adapter framework interfaces for sample
// adapters.
//
// Sample: Adapter framework adapter.
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
using System.Windows.Forms;
using System.Xml;
using Microsoft.Win32;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Adapter.Framework;

namespace Microsoft.Samples.BizTalk.Adapters.Designtime
{
    /// <summary>
    /// Class StaticAdapterManagement implements
    /// IAdapterConfig and IStaticAdapterConfig interfaces for
    /// management to illustrate a static adapter that uses the
    /// adapter framework
    /// </summary>
    public class HttpAdapterSample : IAdapterConfig, IStaticAdapterConfig, IAdapterConfigValidation 
	{
		private static ResourceManager resourceManager = new ResourceManager("AdapterManagement.HttpAdapterResource", Assembly.GetExecutingAssembly());
																																				  
		
		protected string LocalizeSchema (string schema, ResourceManager resourceManager)
		{
			XmlDocument document = new XmlDocument();
			document.LoadXml(schema);

			XmlNodeList nodes = document.SelectNodes("/descendant::*[@_locID]");
			foreach (XmlNode node in nodes)
			{
				string locID = node.Attributes["_locID"].Value;
				node.InnerText = resourceManager.GetString(locID);
			}

			StringWriter writer = new StringWriter();
			document.WriteTo(new XmlTextWriter(writer));

			string localizedSchema = writer.ToString();
			return localizedSchema;
		}

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
				case ConfigType.ReceiveHandler:
					return LocalizeSchema(GetResource("AdapterManagement.ReceiveHandler.xsd"), resourceManager);

				case ConfigType.ReceiveLocation:
					return LocalizeSchema(GetResource("AdapterManagement.ReceiveLocation.xsd"), resourceManager);
	            
				case ConfigType.TransmitHandler:
					return LocalizeSchema(GetResource("AdapterManagement.TransmitHandler.xsd"), resourceManager);

				case ConfigType.TransmitLocation:
					return LocalizeSchema(GetResource("AdapterManagement.TransmitLocation.xsd"), resourceManager);

				default:
					return null;
            }
        }

        /// <summary>
        /// Get the WSDL file name for the selected WSDL
        /// </summary>
        /// <param name="wsdls">place holder</param>
        /// <returns>An empty string[]</returns>
        public string[] GetServiceDescription(string[] wsdls) 
		{
            string[] result = new string[1];
            result[0] = GetResource("AdapterManagement.service1.wsdl");
            return result;
        }

        /// <summary>
        /// Gets the XML instance of TreeView that needs to be rendered
        /// </summary>
        /// <param name="endPointConfiguration"></param>
        /// <param name="NodeIdentifier"></param>
        /// <returns>Location of TreeView xml instance</returns>
        public string GetServiceOrganization(IPropertyBag endPointConfiguration,
                                             string NodeIdentifier) 
		{
            string result = GetResource("AdapterManagement.CategorySchema.xml");
            return result;
        }

        
        /// <summary>
        /// Acquire externally referenced xsd's
        /// </summary>
        /// <param name="xsdLocation">Location of schema</param>
        /// <param name="xsdNamespace">Namespace</param>
        /// <param name="XSDFileName">Schmea file name (return)</param>
        /// <returns>Outcome of acquisition</returns>
        public Result GetSchema(string xsdLocation,
                                string xsdNamespace,
								out string xsdSchema) 
		{
            xsdSchema = null;
            return Result.Continue;
        }

        /// <summary>
        /// Validate xmlInstance against configuration.  In this example it does nothing.
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
				case ConfigType.ReceiveHandler:
					validXml = xmlInstance; 
					break;

				case ConfigType.ReceiveLocation:
					validXml = ValidateReceiveLocation(xmlInstance); 
					break;

				case ConfigType.TransmitHandler:
					validXml = xmlInstance; 
					break;

				case ConfigType.TransmitLocation:
					validXml = ValidateTransmitLocation(xmlInstance); 
					break;
            }

            return validXml;
        }

        /// <summary>
        /// Helper to get resource from manafest.  Replace with 
        /// ResourceManager.GetString if .resources or
        /// .resx files are used for managing this assemblies resources.
        /// </summary>
        /// <param name="resource">Full resource name</param>
        /// <returns>Resource value</returns>
        private string GetResource(string resource) 
		{
            string value = null;
            if (null != resource) 
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
		/// Generate uri entry based on directory and fileMask values
		/// </summary>
		/// <param name="type">Type of port or location being configured</param>
		/// <param name="xmlInstance">Instance value to be validated</param>
		/// <returns>Validated configuration.</returns>
		private string ValidateReceiveLocation(string xmlInstance) 
		{
			// Load up document
			XmlDocument document = new XmlDocument();
			document.LoadXml(xmlInstance);
            
			// Build up inner text
			StringBuilder builder = new StringBuilder();
            
			XmlNode virtualDirectory = document.SelectSingleNode("Config/virtualDirectory");

			XmlNode uri = document.SelectSingleNode("Config/uri");
			if (null == uri) 
			{
				uri = document.CreateElement("uri");
				document.DocumentElement.AppendChild(uri);
			}

			uri.InnerText = virtualDirectory.InnerText;
                           
			return document.OuterXml;
		}

        /// <summary>
        /// Generate uri entry based on directory and fileName values
        /// </summary>
        /// <param name="type">Type of port or location being configured</param>
        /// <param name="xmlInstance">Instance value to be validated</param>
        /// <returns>Validated configuration.</returns>
        private string ValidateTransmitLocation(string xmlInstance) 
		{
            // Load up document
            XmlDocument document = new XmlDocument();
            document.LoadXml(xmlInstance);
            
            // Build up inner text
            StringBuilder builder = new StringBuilder();
            
            XmlNode destinationUrl = document.SelectSingleNode("Config/destinationUrl");

			// Ensure that the destination URL supplied is not empty
			if ( destinationUrl == null || destinationUrl.InnerText == String.Empty ) 
				throw new ApplicationException("Transport properties validation failed.  Value for required adapter property \"Destination Url\" is not specified.");			
			
			// This adapter only supports HTTP, it does not support HTTPS...
			if ( !destinationUrl.InnerText.StartsWith("http://") )
				throw new ApplicationException("The Url must start with HTTP://");				

            XmlNode uri = document.SelectSingleNode("Config/uri");
            if (null == uri) 
			{
                uri = document.CreateElement("uri");
                document.DocumentElement.AppendChild(uri);
            }
            uri.InnerText = destinationUrl.InnerText;
                           
            return document.OuterXml;
        }

		// debug code
		protected string GetSchemaFromFile (string name)
		{
			RegistryKey bts30 = Registry.LocalMachine.OpenSubKey("SOFTWARE").OpenSubKey("Microsoft").OpenSubKey("BizTalk Server").OpenSubKey("3.0");
			string installPath = (string)bts30.GetValue("InstallPath");
			string productLanguage = (string)bts30.GetValue("ProductLanguage");
			string fullName = installPath + productLanguage + "\\" + name;
			StreamReader reader = new StreamReader(fullName);

			string schema = reader.ReadToEnd();
			return schema;
		}
	} 
}
