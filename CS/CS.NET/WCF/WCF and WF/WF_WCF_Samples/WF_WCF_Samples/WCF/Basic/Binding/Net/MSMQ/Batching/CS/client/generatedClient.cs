﻿//----------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//----------------------------------------------------------------
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.42
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: System.Runtime.Serialization.ContractNamespaceAttribute("http://Microsoft.Samples.MSMQBatching", ClrNamespace="Microsoft.Samples.MSMQBatching")]
namespace Microsoft.Samples.MSMQBatching
{
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class PurchaseOrder : object, System.Runtime.Serialization.IExtensibleDataObject
    {
        
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string CustomerIdField;
        
        private string PONumberField;

        private Microsoft.Samples.MSMQBatching.PurchaseOrderLineItem[] orderLineItemsField;
        
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData
        {
            get
            {
                return this.extensionDataField;
            }
            set
            {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CustomerId
        {
            get
            {
                return this.CustomerIdField;
            }
            set
            {
                this.CustomerIdField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string PONumber
        {
            get
            {
                return this.PONumberField;
            }
            set
            {
                this.PONumberField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public Microsoft.Samples.MSMQBatching.PurchaseOrderLineItem[] orderLineItems
        {
            get
            {
                return this.orderLineItemsField;
            }
            set
            {
                this.orderLineItemsField = value;
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class PurchaseOrderLineItem : object, System.Runtime.Serialization.IExtensibleDataObject
    {
        
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string ProductIdField;
        
        private int QuantityField;
        
        private float UnitCostField;
        
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData
        {
            get
            {
                return this.extensionDataField;
            }
            set
            {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string ProductId
        {
            get
            {
                return this.ProductIdField;
            }
            set
            {
                this.ProductIdField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Quantity
        {
            get
            {
                return this.QuantityField;
            }
            set
            {
                this.QuantityField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public float UnitCost
        {
            get
            {
                return this.UnitCostField;
            }
            set
            {
                this.UnitCostField = value;
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://Microsoft.Samples.MSMQBatching", ConfigurationName="Microsoft.Samples.MSMQBatching.IOrderProcessor")]
    public interface IOrderProcessor
    {
        
        [System.ServiceModel.OperationContractAttribute(IsOneWay=true, Action="http://Microsoft.Samples.MSMQBatching/IOrderProcessor/SubmitPurchaseOrder")]
        void SubmitPurchaseOrder(Microsoft.Samples.MSMQBatching.PurchaseOrder po);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IOrderProcessorChannel : Microsoft.Samples.MSMQBatching.IOrderProcessor, System.ServiceModel.IClientChannel
    {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class OrderProcessorClient : System.ServiceModel.ClientBase<Microsoft.Samples.MSMQBatching.IOrderProcessor>, Microsoft.Samples.MSMQBatching.IOrderProcessor
    {
        
        public OrderProcessorClient()
        {
        }
        
        public OrderProcessorClient(string endpointConfigurationName) : 
                base(endpointConfigurationName)
        {
        }
        
        public OrderProcessorClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress)
        {
        }
        
        public OrderProcessorClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress)
        {
        }
        
        public OrderProcessorClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress)
        {
        }
        
        public void SubmitPurchaseOrder(Microsoft.Samples.MSMQBatching.PurchaseOrder po)
        {
            base.Channel.SubmitPurchaseOrder(po);
        }
    }
}

