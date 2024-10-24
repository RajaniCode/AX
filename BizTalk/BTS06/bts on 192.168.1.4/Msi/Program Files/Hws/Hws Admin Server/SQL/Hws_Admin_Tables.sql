--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_TrustedUsers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_TrustedUsers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_Service_Hws_Core]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_Service] DROP CONSTRAINT FK_Hws_Service_Hws_Core
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Core]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_Core]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Service]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_Service]
GO


CREATE TABLE [dbo].[Hws_Core] (
	[ID]  uniqueidentifier ROWGUIDCOL DEFAULT (newid()) NOT NULL ,
	[BizTalkServerLocation] [nvarchar] (256) NOT NULL ,
	[ActivationMessageURL] [nvarchar] (256) NOT NULL ,
	[InterruptMessageURL] [nvarchar] (256) NOT NULL ,
	[TrackingDatabaseMachineName] [nvarchar] (256) NOT NULL ,
	[TrackingDatabaseName] [nvarchar] (256) NOT NULL ,
	[ConstraintDatabaseMachineName] [nvarchar] (256) NOT NULL ,
	[ConstraintDatabaseName] [nvarchar] (256) NOT NULL ,
	[ConstraintsUsedAsGuidance] [bit] NOT NULL ,
	[BizTalkManagementDBName] [nvarchar] (256) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Hws_Service] (
	[ServiceUrl] [nvarchar] (2048) NOT NULL ,
	[MachineName] [nvarchar] (256) NOT NULL ,
	[WebSiteID] [bigint] NOT NULL ,
	[HwsCoreID] [uniqueidentifier] NOT NULL 
) ON [PRIMARY]

CREATE TABLE [dbo].[Hws_TrustedUsers] (
	[DomainName] [nvarchar] (50) NOT NULL ,
	[UserName] [nvarchar] (50) NOT NULL ,
	[HwsCoreId] [uniqueidentifier] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Hws_Core] ADD 
	CONSTRAINT [DF_Hws_Hws_Core_ConstraintsUsedAsGuidance] DEFAULT (0) FOR [ConstraintsUsedAsGuidance],
	CONSTRAINT [PK_Hws_Core] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Hws_TrustedUsers] ADD 
	CONSTRAINT [PK_Hws_TrustedUsers] PRIMARY KEY  CLUSTERED 
	(
		[DomainName],
		[UserName]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Hws_TrustedUsers] ADD 
	CONSTRAINT [FK_Hws_TrustedUsers_Hws_Core] FOREIGN KEY 
	(
		[HwsCoreId]
	) REFERENCES [dbo].[Hws_Core] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Hws_Service] ADD 
	CONSTRAINT [PK_Hws_Service] PRIMARY KEY  CLUSTERED 
	(
		[MachineName]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Hws_Service] ADD 
	CONSTRAINT [FK_Hws_Service_Hws_Core] FOREIGN KEY 
	(
		[HwsCoreID]
	) REFERENCES [dbo].[Hws_Core] (
		[ID]
	)
GO

