﻿//  Copyright (c) Microsoft Corporation. All rights reserved.

using System.Security.Permissions;
using System.ServiceModel;


namespace Microsoft.Samples.WS2007FederationHttpBinding
{
    // Define a service contract.
    [ServiceContract(Namespace = "http://Microsoft.Samples.WS2007FederationHttpBinding")]
    public interface ICalculator
    {
        [OperationContract]
        double Add(double n1, double n2);
        [OperationContract]
        double Subtract(double n1, double n2);
        [OperationContract]
        double Multiply(double n1, double n2);
        [OperationContract]
        double Divide(double n1, double n2);
    }
}

