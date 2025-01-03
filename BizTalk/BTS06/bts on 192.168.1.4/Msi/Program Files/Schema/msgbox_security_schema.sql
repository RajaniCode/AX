--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  
------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrustedUsers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrustedUsers]
GO

CREATE TABLE [dbo].[TrustedUsers] (
	[nvcUserName] [nvarchar] (128) NOT NULL ,
	[nvcApplicationName] [nvarchar] (128) NOT NULL ,
)
GO
