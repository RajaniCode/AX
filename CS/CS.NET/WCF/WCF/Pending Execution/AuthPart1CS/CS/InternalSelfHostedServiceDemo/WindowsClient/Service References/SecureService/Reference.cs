﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4016
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WindowsClient.SecureService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="SecureService.ISecureService")]
    public interface ISecureService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ISecureService/SayHello", ReplyAction="http://tempuri.org/ISecureService/SayHelloResponse")]
        string SayHello();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ISecureService/ReportSales", ReplyAction="http://tempuri.org/ISecureService/ReportSalesResponse")]
        decimal ReportSales();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public interface ISecureServiceChannel : WindowsClient.SecureService.ISecureService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public partial class SecureServiceClient : System.ServiceModel.ClientBase<WindowsClient.SecureService.ISecureService>, WindowsClient.SecureService.ISecureService {
        
        public SecureServiceClient() {
        }
        
        public SecureServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public SecureServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public SecureServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public SecureServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string SayHello() {
            return base.Channel.SayHello();
        }
        
        public decimal ReportSales() {
            return base.Channel.ReportSales();
        }
    }
}
