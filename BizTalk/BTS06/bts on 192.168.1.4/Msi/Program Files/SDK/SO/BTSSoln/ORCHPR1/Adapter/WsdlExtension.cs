// SOAP Extension Reflector for customizing WSDL.
//
// To use,
// 1. Add this file to the Web Service project.
// 2. To enable WSDL customization,
//    Add the following to the Web.config file under the /configuration/system.web/webServices node.
//      <soapExtensionReflectorTypes>
//        <add type="Microsoft.Samples.BizTalk.WoodgroveBank.OrchProxy.Adapter.WsdlExtension, Microsoft.Samples.BizTalk.WoodgroveBank.OrchProxy.Adapter" />
//      </soapExtensionReflectorTypes>
// 3. Rebuild the Web Service project.
// 4. Create a \xsd folder in the web service's virtual directory.
// 5. Add .xsd files for schemas to replace in the generated WSDL.
//
// Schema replacement in the WSDL is done as follows:
// For each .xsd file in the \xsd folder,
//   if the target namespace of of .xsd file schema matches the target namespace of a schema in the WSDL,
//     the schema in the WSDL is replaced with the .xsd file schema.
//
// References:
// 1. <soapExtensionReflectorTypes> Element
//    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/gngrfsoapextensionreflectortypes.asp
// 2. Extend the ASP.NET WebMethod Framework by Adding XML Schema Validation
//    http://msdn.microsoft.com/msdnmag/issues/03/07/XMLSchemaValidation/default.aspx
//
using System;

namespace Microsoft.Samples.BizTalk.WoodgroveBank.OrchProxy.Adapter
{
	/// <summary>
	/// SOAP Extension Reflector that enables WSDL customization.
	/// </summary>
	public class WsdlExtension : System.Web.Services.Description.SoapExtensionReflector 
	{
		/// <summary>
		/// Initializes a new instance of the WsdlExtension class.
		/// </summary>
		public WsdlExtension()
		{
		}

		/// <summary>
		/// Returns local file path of web service folder.
		/// </summary>
		/// <returns></returns>
		private string WebServiceFolder()
		{
			System.Reflection.Assembly assembly = System.Reflection.Assembly.GetExecutingAssembly();
			System.Uri codeBase = new System.Uri(assembly.CodeBase);
			string webServiceFolder = System.IO.Path.GetDirectoryName(System.IO.Path.GetDirectoryName(codeBase.LocalPath));
			return webServiceFolder;
		}

		/// <summary>
		/// Returns schema loaded from specified pathname.
		/// </summary>
		/// <param name="pathname"></param>
		/// <returns></returns>
		private System.Xml.Schema.XmlSchema LoadSchemaFromFile(string pathname)
		{
			System.Xml.Schema.XmlSchema schema = null;

			System.Xml.XmlTextReader reader = new System.Xml.XmlTextReader(pathname);
			schema = System.Xml.Schema.XmlSchema.Read(reader, null);
			reader.Close();

			return schema;
		}

		/// <summary>
		/// Override. Allows this SOAP extension reflector to customize the WSDL file.
		/// </summary>
		public override void ReflectMethod()
		{
			System.Web.Services.Description.ProtocolReflector reflector = this.ReflectionContext;

			// TODO: Customize WSDL

			// Replace schemas in WSDL produced by ASP.NET
			// with schemas from \xsd folder in the web service's virtual directory.
			string xsdFolder = System.IO.Path.Combine(this.WebServiceFolder(), "xsd");
			string[] schemaFiles = System.IO.Directory.GetFiles(xsdFolder, "*.xsd");
			foreach (string pathname in schemaFiles)
			{
				System.Xml.Schema.XmlSchema schema = LoadSchemaFromFile(pathname);
				System.Xml.Schema.XmlSchema existingSchema = reflector.ServiceDescription.Types.Schemas[schema.TargetNamespace];
				if (existingSchema != null)
				{
					System.Diagnostics.Debug.WriteLine("Replacing schema " + existingSchema.TargetNamespace + " in WSDL.");
					reflector.ServiceDescription.Types.Schemas.Remove(existingSchema);
					reflector.ServiceDescription.Types.Schemas.Add(schema);
				}
			}
		}
	}
}
