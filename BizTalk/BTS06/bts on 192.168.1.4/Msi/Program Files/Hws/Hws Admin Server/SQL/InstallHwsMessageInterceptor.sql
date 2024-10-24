--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

delete from TrackinginterceptorVersions where uidRootInterceptorID = '{d3bffaf9-8291-4b82-9052-707aecab84a3}'
delete from Trackinginterceptor where uidInterceptorID = '{d3bffaf9-8291-4b82-9052-707aecab84a3}'

insert Trackinginterceptor (uidInterceptorID, InterceptorType, AssemblyName, TypeName) 
values
('{d3bffaf9-8291-4b82-9052-707aecab84a3}', 0, 'Microsoft.BizTalk.Hws.HwsMessageInterceptor, Culture=neutral, PublicKeyToken=31bf3856ad364e35, Version=3.0.1.0', 'Microsoft.BizTalk.Hws.Runtime.HwsMessageInterceptor')

insert into TrackinginterceptorVersions (uidRootInterceptorID, uidInterceptorID, AssemblyName, TypeName, dtDeploymentTime) 
values
('{d3bffaf9-8291-4b82-9052-707aecab84a3}', '{d3bffaf9-8291-4b82-9052-707aecab84a3}', 'Microsoft.BizTalk.Hws.HwsMessageInterceptor, Culture=neutral, PublicKeyToken=31bf3856ad364e35, Version=3.0.1.0', 'Microsoft.BizTalk.Hws.Runtime.HwsMessageInterceptor', GETUTCDATE())

delete from StaticTrackingInfo where uidInterceptorId = '{d3bffaf9-8291-4b82-9052-707aecab84a3}'

GO
