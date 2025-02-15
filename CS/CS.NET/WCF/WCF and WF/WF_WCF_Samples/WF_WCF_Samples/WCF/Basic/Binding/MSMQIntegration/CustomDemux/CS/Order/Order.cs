﻿//----------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//----------------------------------------------------------------

using System;
using System.Text;

namespace Microsoft.Samples.MSMQCustomDemux
{
    // Define the Purchase Order Line Item
    [Serializable]
    public class PurchaseOrderLineItem
    {
        
        public string productId;
        public float unitCost;
        public int quantity;

        public override string ToString()
        {
            String displayString = "Order LineItem: " + quantity + " of " + productId + " @unit price: $" + unitCost + "\n";
            return displayString;
        }

        public float TotalCost
        {
            get { return unitCost * quantity; }
        }
    }
    
    public enum OrderStates
    {
        Pending,
        Processed,
        Shipped
    }

    // Define Purchase Order
    [Serializable]
    public class PurchaseOrder
    {
	public static string[] orderStates = { "Pending", "Processed", "Shipped" };
        public string poNumber;
        public string customerId;
        public PurchaseOrderLineItem[] orderLineItems;
        public OrderStates orderStatus;

        public float TotalCost
        {
            get
            {
                float totalCost = 0;
                foreach (PurchaseOrderLineItem lineItem in orderLineItems)
                    totalCost += lineItem.TotalCost;
                return totalCost;
            }
        }

        public OrderStates Status
        {
            get
            {
                return orderStatus;
            }
            set
            {
                orderStatus = value;
            }
        }

        public override string ToString()
        {
            StringBuilder strbuf = new StringBuilder("Purchase Order: " + poNumber + "\n");
            strbuf.Append("\tCustomer: " + customerId + "\n");
            strbuf.Append("\tOrderDetails\n");

            foreach (PurchaseOrderLineItem lineItem in orderLineItems)
            {
                strbuf.Append("\t\t" + lineItem.ToString());
            }

            strbuf.Append("\tTotal cost of this order: $" + TotalCost + "\n");
            strbuf.Append("\tOrder status: " + Status + "\n");
            return strbuf.ToString();
        }
    }

}
