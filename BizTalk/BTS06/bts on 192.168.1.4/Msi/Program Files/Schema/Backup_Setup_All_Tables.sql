--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 			

/**************************************************************************************************
 Create the table to write the marking transaction to 
**************************************************************************************************/
if not exists (select * from sysobjects where id = object_id(N'dbo.MarkLog') AND 
	   OBJECTPROPERTY(id, N'IsTable') = 1)
	CREATE TABLE [dbo].[MarkLog] (
		[MarkName] [nvarchar] (128) 
	) ON [PRIMARY]
GO
