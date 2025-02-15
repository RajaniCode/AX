﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.20702.0
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Microsoft.Samples.ConfigHierarchicalModel.ServiceReference6 {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://Microsoft.Samples.ConfigHierarchicalModel", ConfigurationName="ServiceReference6.IDesc")]
    public interface IDesc {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/ListEndpoints", ReplyAction="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/ListEndpointsResponse")]
        string[] ListEndpoints();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/ListServiceBehaviors", ReplyAction="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/ListServiceBehaviorsRespon" +
            "se")]
        string[] ListServiceBehaviors();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/ListEndpointBehaviors", ReplyAction="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/ListEndpointBehaviorsRespo" +
            "nse")]
        string[] ListEndpointBehaviors();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/HttpGetEnabled", ReplyAction="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/HttpGetEnabledResponse")]
        bool HttpGetEnabled();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/IncludeExceptionDetailInFa" +
            "ults", ReplyAction="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/IncludeExceptionDetailInFa" +
            "ultsResponse")]
        bool IncludeExceptionDetailInFaults();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/HttpGetUrl", ReplyAction="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/HttpGetUrlResponse")]
        string HttpGetUrl();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/HttpHelpPageUrl", ReplyAction="http://Microsoft.Samples.ConfigHierarchicalModel/IDesc/HttpHelpPageUrlResponse")]
        string HttpHelpPageUrl();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IDescChannel : Microsoft.Samples.ConfigHierarchicalModel.ServiceReference6.IDesc, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class DescClient : System.ServiceModel.ClientBase<Microsoft.Samples.ConfigHierarchicalModel.ServiceReference6.IDesc>, Microsoft.Samples.ConfigHierarchicalModel.ServiceReference6.IDesc {
        
        public DescClient() {
        }
        
        public DescClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public DescClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DescClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DescClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string[] ListEndpoints() {
            return base.Channel.ListEndpoints();
        }
        
        public string[] ListServiceBehaviors() {
            return base.Channel.ListServiceBehaviors();
        }
        
        public string[] ListEndpointBehaviors() {
            return base.Channel.ListEndpointBehaviors();
        }
        
        public bool HttpGetEnabled() {
            return base.Channel.HttpGetEnabled();
        }
        
        public bool IncludeExceptionDetailInFaults() {
            return base.Channel.IncludeExceptionDetailInFaults();
        }
        
        public string HttpGetUrl() {
            return base.Channel.HttpGetUrl();
        }
        
        public string HttpHelpPageUrl() {
            return base.Channel.HttpHelpPageUrl();
        }
    }
}
