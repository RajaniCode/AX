--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_AdapterObjectRel_Hws_Adapters]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_AdapterObjectRel] DROP CONSTRAINT FK_Hws_AdapterObjectRel_Hws_Adapters
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_ConstraintClause_Hws_Clauses]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_ConstraintClause] DROP CONSTRAINT FK_Hws_ConstraintClause_Hws_Clauses
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DF_Hws_ConstraintClause_ConstraintClauseRelID]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_Clauses] DROP CONSTRAINT DF_Hws_ConstraintClause_ConstraintClauseRelID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_ActionInterop_Hws_Actions]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_ActionInterop] DROP CONSTRAINT FK_Hws_ActionInterop_Hws_Actions
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_ActionInterop_Hws_Actions2]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_ActionInterop] DROP CONSTRAINT FK_Hws_ActionInterop_Hws_Actions2
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_Constraints_Hws_Actions]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_Constraints] DROP CONSTRAINT FK_Hws_Constraints_Hws_Actions
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_Constraints_Hws_ActivityModels]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_Constraints] DROP CONSTRAINT FK_Hws_Constraints_Hws_ActivityModels
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_AdapterObjectRel_Hws_Objects]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_AdapterObjectRel] DROP CONSTRAINT FK_Hws_AdapterObjectRel_Hws_Objects
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_Properties_Hws_Objects]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_Properties] DROP CONSTRAINT FK_Hws_Properties_Hws_Objects
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_ConstraintClause_Hws_Constraints]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_ConstraintClause] DROP CONSTRAINT FK_Hws_ConstraintClause_Hws_Constraints
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_Constraints_Hws_ConstraintGroups]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_ConstraintGroups] DROP CONSTRAINT FK_Hws_Constraints_Hws_ConstraintGroups
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_ClauseValues_Hws_Clauses]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_ClauseValues] DROP CONSTRAINT FK_Hws_ClauseValues_Hws_Clauses
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_ActivityModelRoleRightsRel_Hws_ActivityModelRights]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_ActivityModelRoleRightsRel] DROP CONSTRAINT FK_Hws_ActivityModelRoleRightsRel_Hws_ActivityModelRights
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_ActivityModelRoleRightsRel_Hws_ActivityModelRoles]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_ActivityModelRoleRightsRel] DROP CONSTRAINT FK_Hws_ActivityModelRoleRightsRel_Hws_ActivityModelRoles
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_Constraints_Hws_ActivityModelRoles]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_Constraints] DROP CONSTRAINT FK_Hws_Constraints_Hws_ActivityModelRoles
GO

/****** Object:  Trigger dbo.UpdateAdapterInfo    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateAdapterInfo]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[UpdateAdapterInfo]
GO

/****** Object:  Trigger dbo.DeleteClauseValues    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteClauseValues]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[DeleteClauseValues]
GO

/****** Object:  Trigger dbo.UpdateActionLastModifiedTable    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateActionLastModifiedTable]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[UpdateActionLastModifiedTable]
GO

/****** Object:  Trigger dbo.Hws_TriggerDeleteAction    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_TriggerDeleteAction]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Hws_TriggerDeleteAction]
GO

/****** Object:  Trigger dbo.UpdateMostRecentModification    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateMostRecentModification]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[UpdateMostRecentModification]
GO

/****** Object:  Trigger dbo.DeleteUnreferenceObjects    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteUnreferenceObjects]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[DeleteUnreferenceObjects]
GO

/****** Object:  Trigger dbo.UpdateActivityModelLastModifiedTable    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateActivityModelLastModifiedTable]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[UpdateActivityModelLastModifiedTable]
GO

/****** Object:  Trigger dbo.Hws_TriggerDeleteActivityModel    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_TriggerDeleteActivityModel]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Hws_TriggerDeleteActivityModel]
GO

/****** Object:  Trigger dbo.Hws_TriggerDeleteConstraint    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_TriggerDeleteConstraint]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Hws_TriggerDeleteConstraint]
GO

/****** Object:  Trigger dbo.UpdateLastModifiedTable    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateLastModifiedTable]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[UpdateLastModifiedTable]
GO

/****** Object:  Trigger dbo.Hws_TriggerDeleteClause    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_TriggerDeleteClause]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Hws_TriggerDeleteClause]
GO

/****** Object:  Trigger dbo.Hws_TriggerDeleteGroup    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_TriggerDeleteGroup]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Hws_TriggerDeleteGroup]
GO

/****** Object:  Trigger dbo.RemoveNonReferenceClauses    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RemoveNonReferenceClauses]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[RemoveNonReferenceClauses]
GO

/****** Object:  Stored Procedure dbo.sp_AddConstraint    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_AddConstraint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_AddConstraint]
GO

/****** Object:  Stored Procedure dbo.sp_ModifyConstraint    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ModifyConstraint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ModifyConstraint]
GO


/****** Object:  Stored Procedure dbo.sp_InternalAddConstraint    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InternalAddConstraint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InternalAddConstraint]
GO

/****** Object:  Stored Procedure dbo.sp_InternalModifyConstraint    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InternalModifyConstraint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InternalModifyConstraint]
GO

/****** Object:  Stored Procedure dbo.sp_SetHwsConstraints    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_SetHwsConstraints]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_SetHwsConstraints]
GO


/****** Object:  Stored Procedure dbo.sp_AddClause    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_AddClause]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_AddClause]
GO

/****** Object:  Stored Procedure dbo.sp_AddNewClause    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_AddNewClause]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_AddNewClause]
GO

/****** Object:  Stored Procedure dbo.sp_AddClauseValues    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_AddClauseValues]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_AddClauseValues]
GO

/****** Object:  Stored Procedure dbo.sp_HwsInitConstraintInfo    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_HwsInitConstraintInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_HwsInitConstraintInfo]
GO

/****** Object:  Stored Procedure dbo.sp_HwsRefreshConstraintInfo    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_HwsRefreshConstraintInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_HwsRefreshConstraintInfo]
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveConstraints    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RetrieveConstraints]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RetrieveConstraints]
GO

/****** Object:  Stored Procedure dbo.sp_AddFactStoreAdapter    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_AddFactStoreAdapter]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_AddFactStoreAdapter]
GO

/****** Object:  Stored Procedure dbo.sp_AddFactStoreObject    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_AddFactStoreObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_AddFactStoreObject]
GO

/****** Object:  Stored Procedure dbo.sp_AddFactStoreProperty    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_AddFactStoreProperty]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_AddFactStoreProperty]
GO

/****** Object:  Stored Procedure dbo.sp_HwsGetConstraintInfo    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_HwsGetConstraintInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_HwsGetConstraintInfo]
GO

/****** Object:  Stored Procedure dbo.sp_CheckIfPropertyIsEnumerable    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_CheckIfPropertyIsEnumerable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_CheckIfPropertyIsEnumerable]
GO

/****** Object:  Stored Procedure dbo.sp_GetHwsConstraints    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetHwsConstraints]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetHwsConstraints]
GO

/****** Object:  Stored Procedure dbo.sp_ConstraintAdminInitialize    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ConstraintAdminInitialize]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ConstraintAdminInitialize]
GO

/****** Object:  Stored Procedure dbo.sp_GetObjectProperties    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetObjectProperties]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetObjectProperties]
GO

/****** Object:  Stored Procedure dbo.sp_GetUsableObjects    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RetrieveHwsRoles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RetrieveHwsRoles]
GO

/****** Object:  Stored Procedure dbo.sp_GetUsableObjects    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetUsableObjects]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetUsableObjects]
GO

/****** Object:  Stored Procedure dbo.sp_RegisterAction    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RegisterAction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RegisterAction]
GO

/****** Object:  Stored Procedure dbo.sp_RemoveConstraint    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RemoveConstraint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RemoveConstraint]
GO

/****** Object:  Stored Procedure dbo.sp_UnregisterAction    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UnregisterAction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UnregisterAction]
GO

/****** Object:  Stored Procedure dbo.SP_GetAdapters    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_GetAdapters]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_GetAdapters]
GO

/****** Object:  Stored Procedure dbo.sp_EditFactStoreAdapter    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_EditFactStoreAdapter]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_EditFactStoreAdapter]
GO

/****** Object:  Stored Procedure dbo.sp_RemoveFactStoreAdapter    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RemoveFactStoreAdapter]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RemoveFactStoreAdapter]
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveAction    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RetrieveAction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RetrieveAction]
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveActions    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RetrieveActions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RetrieveActions]
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveFactStoreAdapters    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RetrieveFactStoreAdapters]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RetrieveFactStoreAdapters]
GO

/****** Object:  Stored Procedure dbo.sp_UpdateAction    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdateAction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateAction]
GO

/****** Object:  Stored Procedure dbo.Hws_GetHwsActions    Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetHwsActions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetHwsActions]
GO

/****** Object:  Stored Procedure dbo.Hws_GetActivityModelRights	Script Date: 2/16/2003 2:28:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityModelRights]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityModelRights]
GO












if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActivityModelRights]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	CREATE TABLE [dbo].[Hws_ActivityModelRights] (
		[ActivityModelRightID] [uniqueidentifier] NOT NULL ,
		[Name] [nvarchar] (255) NOT NULL ,
		[Description] [nvarchar] (255) NOT NULL 
	) ON [PRIMARY]

	ALTER TABLE [dbo].[Hws_ActivityModelRights] WITH NOCHECK ADD 
		CONSTRAINT [PK_Hws_ActivityModelRights] PRIMARY KEY  CLUSTERED 
		(
			[ActivityModelRightID]
		)  ON [PRIMARY] 
	
	ALTER TABLE [dbo].[Hws_ActivityModelRights] ADD 
		CONSTRAINT [IX_Hws_ActivityModelRights] UNIQUE  NONCLUSTERED 
		(
			[ActivityModelRightID]
		)  ON [PRIMARY] 
 end
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActivityModelRoleRightsRel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	CREATE TABLE [dbo].[Hws_ActivityModelRoleRightsRel] (
		[ActivityModelRoleID] [uniqueidentifier] NOT NULL ,
		[ActivityModelRightID] [uniqueidentifier] NOT NULL 
	) ON [PRIMARY]
 end
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActivityModelRoles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	CREATE TABLE [dbo].[Hws_ActivityModelRoles] (
		[ActivityModelRoleID] [uniqueidentifier] NOT NULL ,
		[Name] [nvarchar] (255) NOT NULL ,
		[Description] [nvarchar] (255) NOT NULL 
	) ON [PRIMARY]


	ALTER TABLE [dbo].[Hws_ActivityModelRoles] ADD 
		CONSTRAINT [IX_Hws_ActivityModelRoles] UNIQUE  NONCLUSTERED 
		(
			[ActivityModelRoleID]
		)  ON [PRIMARY] 
 end
GO



/****** Object:  Table [dbo].[Hws_Adapters]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Adapters]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_Adapters]    Script Date: 2/16/2003 2:28:16 PM ******/
	CREATE TABLE [dbo].[Hws_Adapters] (
		[AdapterID]  uniqueidentifier ROWGUIDCOL  NOT NULL ,
		[Name] [nvarchar] (256) NOT NULL ,
		[AssemblyName] [nvarchar] (256) NOT NULL ,
		[Version] [nvarchar] (50) NOT NULL ,
		[Culture] [nvarchar] (50) NOT NULL ,
		[PublicKey] [nvarchar] (50) NOT NULL ,
		[ConnectionInfo] [nvarchar] (256) NOT NULL ,
		[TypeName] [nvarchar] (256) NOT NULL ,
		[Description] [nvarchar] (256) NULL ,
		[IsIntrinsic] [bit] NOT NULL ,
		[LastModified] [datetime] NOT NULL 
	) ON [PRIMARY]


	ALTER TABLE [dbo].[Hws_Adapters] WITH NOCHECK ADD 
		CONSTRAINT [PK_Hws_Adapters] PRIMARY KEY  CLUSTERED 
		(
			[AdapterID]
		)  ON [PRIMARY] 

	ALTER TABLE [dbo].[Hws_Adapters] ADD 
		CONSTRAINT [DF_Hws_Adapters_AdapterID] DEFAULT (newid()) FOR [AdapterID],
		CONSTRAINT [DF_Hws_Adapters_LastTimeStamp] DEFAULT (GETUTCDATE()) FOR [LastModified],
		CONSTRAINT [IX_Hws_Adapters] UNIQUE  NONCLUSTERED 
		(
			[Name]
		)  ON [PRIMARY] ,
		CONSTRAINT [CK_Hws_Adapters] CHECK (len([Name]) > 0 and len([AssemblyName]) > 0 and len([Version]) > 0 and len([Culture]) > 0 and len([PublicKey]) > 0 and len([ConnectionInfo]) > 0 and len([TypeName]) > 0)

 end
GO


/****** Object:  Table [dbo].[Hws_Actions]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Actions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_Actions]    Script Date: 2/16/2003 2:28:17 PM ******/
	CREATE TABLE [dbo].[Hws_Actions] (
		[ActionID]  uniqueidentifier ROWGUIDCOL  NOT NULL ,
		[Name] [nvarchar] (256) NOT NULL ,
		[Description] [nvarchar] (256) NULL ,
		[LastModified] [datetime] NOT NULL 
	) ON [PRIMARY]


	ALTER TABLE [dbo].[Hws_Actions] WITH NOCHECK ADD 
		CONSTRAINT [PK_Hws_Actions] PRIMARY KEY  CLUSTERED 
		(
			[ActionID]
		)  ON [PRIMARY] 

	ALTER TABLE [dbo].[Hws_Actions] ADD 
		CONSTRAINT [DF_Hws_Actions_ActionID] DEFAULT (newid()) FOR [ActionID],
		CONSTRAINT [DF_Hws_Actions_LastTimeStamp] DEFAULT (GETUTCDATE()) FOR [LastModified],
		CONSTRAINT [IX_Hws_Actions] UNIQUE  NONCLUSTERED 
		(
			[Name]
		)  ON [PRIMARY] 
 end
GO



/****** Object:  Table [dbo].[Hws_MostRecentModification]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_MostRecentModification]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_MostRecentModification]    Script Date: 2/16/2003 2:28:17 PM ******/
	CREATE TABLE [dbo].[Hws_MostRecentModification] (
		[MostRecentModification] [datetime] NOT NULL 
	) ON [PRIMARY]
 end
GO


/****** Object:  Table [dbo].[Hws_Objects]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Objects]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_Objects]    Script Date: 2/16/2003 2:28:17 PM ******/
	CREATE TABLE [dbo].[Hws_Objects] (
		[ObjectID]  uniqueidentifier ROWGUIDCOL  NOT NULL ,
		[Name] [nvarchar] (256) NOT NULL ,
		[DisplayName] [nvarchar] (256) NOT NULL ,
		[Description] [nvarchar] (256) NOT NULL ,
		[KeyProperty] [nvarchar] (256) NOT NULL 
	) ON [PRIMARY]

	ALTER TABLE [dbo].[Hws_Objects] WITH NOCHECK ADD 
		CONSTRAINT [PK_Hws_Objects] PRIMARY KEY  CLUSTERED 
		(
			[ObjectID]
		)  ON [PRIMARY] 

	ALTER TABLE [dbo].[Hws_Objects] ADD 
		CONSTRAINT [DF_Hws_Objects_ObjectID] DEFAULT (newid()) FOR [ObjectID]
 end
GO


/****** Object:  Table [dbo].[Hws_RemovedEntities]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_RemovedEntities]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_RemovedEntities]    Script Date: 2/16/2003 2:28:17 PM ******/
	CREATE TABLE [dbo].[Hws_RemovedEntities] (
		[AdapterID] [uniqueidentifier] NULL ,
		[ActionID] [uniqueidentifier] NULL ,
		[ActivityModelID] [uniqueidentifier] NULL ,
	  	[ActivityModelStepID] [int] NULL ,
		[ActivityModelRoleID] [uniqueidentifier] NULL ,
		[ConstraintType] [tinyint] NULL ,
		[ConstraintID] [uniqueidentifier] NULL ,
		[IsPositive] [bit] NULL ,
		[ClauseID] [uniqueidentifier] NULL ,
		[GroupID] [uniqueidentifier] NULL ,
		[LastModified] [datetime] NOT NULL 
	) ON [PRIMARY]


	ALTER TABLE [dbo].[Hws_RemovedEntities] ADD 
		CONSTRAINT [DF_Hws_RemovedEntities_LastTimeStamp] DEFAULT (GETUTCDATE()) FOR [LastModified]
 end
GO



/****** Object:  Table [dbo].[Hws_AdapterObjectRel]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_AdapterObjectRel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_AdapterObjectRel]    Script Date: 2/16/2003 2:28:18 PM ******/
	CREATE TABLE [dbo].[Hws_AdapterObjectRel] (
		[AdapterID] [uniqueidentifier] NOT NULL ,
		[ObjectID] [uniqueidentifier] NOT NULL 
	) ON [PRIMARY]

 end
GO


/****** Object:  Table [dbo].[Hws_ActionInterop]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActionInterop]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_ActionInterop]    Script Date: 2/16/2003 2:28:18 PM ******/
	CREATE TABLE [dbo].[Hws_ActionInterop] (
		[ActionID] [uniqueidentifier] NOT NULL ,
		[DependableAction] [uniqueidentifier] NOT NULL 
	) ON [PRIMARY]

 end
GO



/****** Object:  Table [dbo].[Hws_ConstraintClause]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ConstraintClause]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	CREATE TABLE [dbo].[Hws_ConstraintClause] (
		[ConstraintClauseRelID] [uniqueidentifier] NOT NULL ,
		[ConstraintID] [uniqueidentifier] NOT NULL ,
		[ClauseID] [uniqueidentifier] NULL ,
		[AllowAll] [bit] NOT NULL ,
		[ClauseType] [tinyint] NOT NULL ,
		[XPath] [nvarchar] (256) NULL 
	) ON [PRIMARY]

	ALTER TABLE [dbo].[Hws_ConstraintClause] ADD 
		CONSTRAINT [DF_Hws_ConstraintClause_ConstraintClauseRelID] DEFAULT (newid()) FOR [ConstraintClauseRelID]

	ALTER TABLE [dbo].[Hws_ConstraintClause] ADD 
		CONSTRAINT [PK_Hws_ConstraintClause] PRIMARY KEY  CLUSTERED 
		(
			[ConstraintClauseRelID]
		)  ON [PRIMARY] 
 end
GO


/****** Object:  Table [dbo].[Hws_Constraints]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Constraints]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	CREATE TABLE [dbo].[Hws_Constraints] (
		[ConstraintID]  uniqueidentifier ROWGUIDCOL  NOT NULL ,
		[ActionID] [uniqueidentifier] NULL ,
		[ActivityModelID] [uniqueidentifier] NULL ,
		[ActivityModelStepID] [int] NULL ,
		[ConstraintType] [tinyint] NOT NULL ,
		[ActivityModelRoleID] [uniqueidentifier] NULL ,
		[IsPositive] [bit] NOT NULL ,
		[LastModified] [datetime] NOT NULL 
	) ON [PRIMARY]


	ALTER TABLE [dbo].[Hws_Constraints] WITH NOCHECK ADD 
		CONSTRAINT [PK_Hws_Constraints] PRIMARY KEY  CLUSTERED 
		(
			[ConstraintID]
		)  ON [PRIMARY] 

	ALTER TABLE [dbo].[Hws_Constraints] ADD 
		CONSTRAINT [DF_Hws_Constraints_ConstraintID] DEFAULT (newid()) FOR [ConstraintID],
		CONSTRAINT [DF_Hws_Constraints_LastTimeStamp] DEFAULT (GETUTCDATE()) FOR [LastModified]
 end
GO

/****** Object:  Table [dbo].[Hws_Properties]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Properties]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_Properties]    Script Date: 2/16/2003 2:28:18 PM ******/
	CREATE TABLE [dbo].[Hws_Properties] (
		[PropertyID]  uniqueidentifier ROWGUIDCOL  NOT NULL ,
		[ObjectID] [uniqueidentifier] NOT NULL ,
		[Name] [nvarchar] (256) NOT NULL ,
		[DisplayName] [nvarchar] (256) NOT NULL ,
		[Description] [nvarchar] (256) NOT NULL ,
		[IsMultiValued] [bit] NOT NULL ,
		[IsEnumerable] [bit] NOT NULL ,
		[PropertyType] [int] NOT NULL ,
		[IsUsed] [bit] NOT NULL 
	) ON [PRIMARY]


	ALTER TABLE [dbo].[Hws_Properties] WITH NOCHECK ADD 
		CONSTRAINT [PK_Hws_Properties] PRIMARY KEY  CLUSTERED 
		(
			[PropertyID]
		)  ON [PRIMARY] 

	ALTER TABLE [dbo].[Hws_Properties] ADD 
		CONSTRAINT [DF_Hws_Properties_PropertyID] DEFAULT (newid()) FOR [PropertyID],
		CONSTRAINT [DF_Hws_Properties_IsUsed] DEFAULT (0) FOR [IsUsed]
 end
GO

/****** Object:  Table [dbo].[Hws_Clauses]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Clauses]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_Clauses]    Script Date: 2/16/2003 2:28:18 PM ******/
	CREATE TABLE [dbo].[Hws_Clauses] (
		[ClauseID]  uniqueidentifier ROWGUIDCOL  NOT NULL ,
		[AdapterID] [uniqueidentifier] NOT NULL ,
		[PropertyID] [uniqueidentifier] NOT NULL ,
		[Operator] [tinyint] NOT NULL ,
		[NumValues] [int] NOT NULL ,
		[LastModified] [datetime] NOT NULL 
	) ON [PRIMARY]


	ALTER TABLE [dbo].[Hws_Clauses] WITH NOCHECK ADD 
		CONSTRAINT [PK_Hws_Clauses] PRIMARY KEY  CLUSTERED 
		(
			[ClauseID]
		)  ON [PRIMARY] 



	ALTER TABLE [dbo].[Hws_Clauses] ADD 
		CONSTRAINT [DF_Hws_Clauses_ClauseID] DEFAULT (newid()) FOR [ClauseID],
		CONSTRAINT [DF_Hws_Clauses_LastTimeStamp] DEFAULT (GETUTCDATE()) FOR [LastModified]


 end
GO

/****** Object:  Table [dbo].[Hws_ConstraintGroups]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ConstraintGroups]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_ConstraintGroups]    Script Date: 2/16/2003 2:28:19 PM ******/
	CREATE TABLE [dbo].[Hws_ConstraintGroups] (
		[GroupID]  uniqueidentifier ROWGUIDCOL  NOT NULL ,
		[GroupName] [nvarchar] (256) NOT NULL ,
		[GroupDescription] [nvarchar] (256) NULL ,
		[ConstraintID] [uniqueidentifier] NOT NULL ,
		[XPath] [nvarchar] (50) NULL ,
		[LastModified] [datetime] NOT NULL 
	) ON [PRIMARY]

	ALTER TABLE [dbo].[Hws_ConstraintGroups] ADD 
		CONSTRAINT [DF_Hws_ConstraintGroups_GroupID] DEFAULT (newid()) FOR [GroupID],
		CONSTRAINT [DF_Hws_ConstraintGroups_LastTimeStamp] DEFAULT (GETUTCDATE()) FOR [LastModified]
 end
GO

/****** Object:  Table [dbo].[Hws_ClauseValues]    Script Date: 2/16/2003 2:28:15 PM ******/
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ClauseValues]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 begin
	/****** Object:  Table [dbo].[Hws_ClauseValues]    Script Date: 2/16/2003 2:28:19 PM ******/
	CREATE TABLE [dbo].[Hws_ClauseValues] (
		[ClauseID] [uniqueidentifier] NOT NULL ,
		[StringValue] [nvarchar] (256) NULL ,
		[IntegerValue] [int] NULL ,
		[FloatValue] [decimal](28, 12) NULL ,
		[BooleanValue] [bit] NULL ,
		[DateTimeValue] [datetime] NULL ,
		[RelateToSource] [bit] NOT NULL ,
		[RelateToEnactedOn] [bit] NOT NULL ,
		[AdapterID] [uniqueidentifier] NULL ,
		[PropertyID] [uniqueidentifier] NULL 
	) ON [PRIMARY]

	ALTER TABLE [dbo].[Hws_ClauseValues] ADD 
		CONSTRAINT [DF_Hws_ClauseValues_RelateToSource] DEFAULT (0) FOR [RelateToSource],
		CONSTRAINT [DF_Hws_ClauseValues_RelateToEnactedOn] DEFAULT (0) FOR [RelateToEnactedOn]
 end
GO

if object_id('FK_Hws_ActionInterop_Hws_Actions') is null
 begin
	ALTER TABLE [dbo].[Hws_ActionInterop] ADD 
		CONSTRAINT [FK_Hws_ActionInterop_Hws_Actions] FOREIGN KEY 
		(
			[ActionID]
		) REFERENCES [dbo].[Hws_Actions] (
			[ActionID]
		) ON DELETE CASCADE
 end
GO

if object_id('FK_Hws_ActionInterop_Hws_Actions2') is null
 begin
	ALTER TABLE [dbo].[Hws_ActionInterop] ADD 
		CONSTRAINT [FK_Hws_ActionInterop_Hws_Actions2] FOREIGN KEY 
		(
			[DependableAction]
		) REFERENCES [dbo].[Hws_Actions] (
			[ActionID]
		)
 end
GO

if object_id('FK_Hws_ConstraintClause_Hws_Clauses') is null
 begin
	ALTER TABLE [dbo].[Hws_ConstraintClause] WITH NOCHECK ADD 
		CONSTRAINT [FK_Hws_ConstraintClause_Hws_Clauses] FOREIGN KEY 
		(
			[ClauseID]
		) REFERENCES [dbo].[Hws_Clauses] (
			[ClauseID]
		) ON DELETE CASCADE
 end
GO

if object_id('FK_Hws_AdapterObjectRel_Hws_Adapters') is null	
 begin
	ALTER TABLE [dbo].[Hws_AdapterObjectRel] ADD 
		CONSTRAINT [FK_Hws_AdapterObjectRel_Hws_Adapters] FOREIGN KEY 
		(
			[AdapterID]
		) REFERENCES [dbo].[Hws_Adapters] (
			[AdapterID]
		) ON DELETE CASCADE
 end
GO

if object_id('FK_Hws_AdapterObjectRel_Hws_Objects') is null	
 begin
	ALTER TABLE [dbo].[Hws_AdapterObjectRel] ADD 
		CONSTRAINT [FK_Hws_AdapterObjectRel_Hws_Objects] FOREIGN KEY 
		(
			[ObjectID]
		) REFERENCES [dbo].[Hws_Objects] (
			[ObjectID]
		)
 end
GO

if object_id('FK_Hws_ConstraintClause_Hws_Constraints') is null
 begin
	ALTER TABLE [dbo].[Hws_ConstraintClause] ADD 
		CONSTRAINT [FK_Hws_ConstraintClause_Hws_Constraints] FOREIGN KEY 
		(
			[ConstraintID]
		) REFERENCES [dbo].[Hws_Constraints] (
			[ConstraintID]
		) ON DELETE CASCADE 
 end
GO



if object_id('FK_Hws_Constraints_Hws_Actions') is null
 begin
	ALTER TABLE [dbo].[Hws_Constraints] ADD 
		CONSTRAINT [FK_Hws_Constraints_Hws_Actions] FOREIGN KEY 
		(
			[ActionID]
		) REFERENCES [dbo].[Hws_Actions] (
			[ActionID]
		) ON DELETE CASCADE 
 end
GO
if object_id('FK_Hws_Constraints_Hws_ActivityModels') is null
 begin
	ALTER TABLE [dbo].[Hws_Constraints] ADD 
		CONSTRAINT [FK_Hws_Constraints_Hws_ActivityModels] FOREIGN KEY 
		(
			[ActivityModelID]
		) REFERENCES [dbo].[ActivityModels] (
			[ActivityModelGuid]
		) ON DELETE CASCADE
 end
GO
if object_id('FK_Hws_Constraints_Hws_ActivityModelRoles') is null
 begin
	ALTER TABLE [dbo].[Hws_Constraints] ADD 
		CONSTRAINT [FK_Hws_Constraints_Hws_ActivityModelRoles] FOREIGN KEY 
		(
			[ActivityModelRoleID]
		) REFERENCES [dbo].[Hws_ActivityModelRoles] (
			[ActivityModelRoleID]
		)
 end
GO
if object_id('FK_Hws_Properties_Hws_Objects') is null
 begin
	ALTER TABLE [dbo].[Hws_Properties] ADD 
		CONSTRAINT [FK_Hws_Properties_Hws_Objects] FOREIGN KEY 
		(
			[ObjectID]
		) REFERENCES [dbo].[Hws_Objects] (
			[ObjectID]
		) ON DELETE CASCADE 
 end
GO


if object_id('FK_Hws_Constraints_Hws_ConstraintGroups') is null
 begin
	ALTER TABLE [dbo].[Hws_ConstraintGroups] ADD 
		CONSTRAINT [FK_Hws_Constraints_Hws_ConstraintGroups] FOREIGN KEY 
		(
			[ConstraintID]
		) REFERENCES [dbo].[Hws_Constraints] (
			[ConstraintID]
		) ON DELETE CASCADE 
 end
GO

if object_id('FK_Hws_ClauseValues_Hws_Clauses') is null
 begin
	ALTER TABLE [dbo].[Hws_ClauseValues] ADD 
		CONSTRAINT [FK_Hws_ClauseValues_Hws_Clauses] FOREIGN KEY 
		(
			[ClauseID]
		) REFERENCES [dbo].[Hws_Clauses] (
			[ClauseID]
		) ON DELETE CASCADE 
 end
GO

if object_id('FK_Hws_ActivityModelRoleRightsRel_Hws_ActivityModelRights') is null
 begin
	ALTER TABLE [dbo].[Hws_ActivityModelRoleRightsRel] ADD 
		CONSTRAINT [FK_Hws_ActivityModelRoleRightsRel_Hws_ActivityModelRights] FOREIGN KEY 
		(
			[ActivityModelRightID]
		) REFERENCES [dbo].[Hws_ActivityModelRights] (
			[ActivityModelRightID]
		)
 end
GO

if object_id('FK_Hws_ActivityModelRoleRightsRel_Hws_ActivityModelRoles') is null
 begin
	ALTER TABLE [dbo].[Hws_ActivityModelRoleRightsRel] ADD
		CONSTRAINT [FK_Hws_ActivityModelRoleRightsRel_Hws_ActivityModelRoles] FOREIGN KEY 
		(
			[ActivityModelRoleID]
		) REFERENCES [dbo].[Hws_ActivityModelRoles] (
			[ActivityModelRoleID]
		)
 end

GO

/****** Object:  Stored Procedure dbo.Hws_GetActivityModelRights	Script Date: 1/30/2003 6:07:43 PM ******/
CREATE procedure [dbo].[Hws_GetActivityModelRights]
as
set nocount on
Select BR.ActivityModelRightID, BR.Name from Hws_ActivityModelRights BR

GO

grant execute on [dbo].[Hws_GetActivityModelRights] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivityModelRights] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.Hws_GetHwsActions    Script Date: 2/16/2003 2:28:19 PM ******/

/****** Object:  Stored Procedure dbo.Hws_GetHwsActions    Script Date: 1/30/2003 6:07:43 PM ******/

CREATE procedure Hws_GetHwsActions
(
	@HwsID uniqueidentifier
)
as
set nocount on
select * from [dbo].[Hws_Actions] where ActionID=@HwsID


GO
grant execute on [dbo].[Hws_GetHwsActions] to HWS_WS_USER
grant execute on [dbo].[Hws_GetHwsActions] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.SP_GetAdapters    Script Date: 2/16/2003 2:28:19 PM ******/

CREATE PROCEDURE dbo.SP_GetAdapters
AS
BEGIN
 SELECT count(*) from [dbo].[Hws_Adapters] where IsIntrinsic=0
 Select [Name], AssemblyName, Version, Culture, PublicKey, ConnectionInfo, TypeName, AdapterID from [dbo].[Hws_Adapters] where IsIntrinsic=0
END


GO
grant execute on [dbo].[SP_GetAdapters] to HWS_WS_USER
grant execute on [dbo].[SP_GetAdapters] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_EditFactStoreAdapter    Script Date: 2/16/2003 2:28:19 PM ******/

/****** Object:  Stored Procedure dbo.sp_EditFactStoreAdapter    Script Date: 1/30/2003 6:07:43 PM ******/

CREATE PROCEDURE dbo.sp_EditFactStoreAdapter
(
	@AdapterID	uniqueidentifier,
	@AdapterName	nvarchar(256),
	@ConnectionInfo nvarchar(256),
	@Description nvarchar(256)
)
AS
BEGIN	

	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)
		
	declare @localized_string_Hws_DuplicateAdapter_sp_EditFactStoreAdapter nvarchar(100)
	set @localized_string_Hws_DuplicateAdapter_sp_EditFactStoreAdapter = N'sp_EditFactStoreAdapter failed updating Fact Retriever due to duplicate connection information'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

             Declare @AssemblyName	nvarchar(256),
	@AssemblyCulture nvarchar(50),
	@AssemblyPublicKey nvarchar(50),
	@AssemblyVersion nvarchar(50),
	@TypeName nvarchar(256)

	Select @AssemblyName=AssemblyName, @AssemblyCulture=Culture, @AssemblyPublicKey=PublicKey, @AssemblyVersion=Version, @TypeName=TypeName 
		From  [dbo].[Hws_Adapters] Where AdapterID=@AdapterID
	 
	if (select count(*) From [dbo].[Hws_Adapters] where  AssemblyName=@AssemblyName and ConnectionInfo=@ConnectionInfo and
		Version=@AssemblyVersion and PublicKey=@AssemblyPublicKey and TypeName=@TypeName and  Culture=@AssemblyCulture and Not(AdapterID=@AdapterID)) > 0
	  BEGIN
		SET @ErrorDesc = @localized_string_Hws_DuplicateAdapter_sp_EditFactStoreAdapter
		GOTO ROLLBACKTRAN
	  END
	  
	Update [dbo].[Hws_Adapters]
		Set [Name]=@AdapterName, ConnectionInfo=@ConnectionInfo, [Description]=@Description, LastModified=GETUTCDATE()
		where AdapterID=@AdapterID And IsIntrinsic=0
		
	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:
	RETURN @Ret
End

GO
grant execute on [dbo].[sp_EditFactStoreAdapter] to HWS_ADMIN_USER
GO


/****** Object:  Stored Procedure dbo.sp_GetHwsConstraints    Script Date: 2/16/2003 2:28:19 PM ******/

/****** Object:  Stored Procedure dbo.sp_GetHwsConstraints    Script Date: 1/30/2003 6:07:43 PM ******/
CREATE PROCEDURE dbo.sp_GetHwsConstraints
(
	@ActivityModelID uniqueidentifier
)
AS
BEGIN	

Declare @counter int

Set @counter = (Select count(*) From ActivityModels Where ActivityModelGuid=@ActivityModelID And IsActive=1)

If @counter=1
Begin

Declare @ConstraintIDTable table (ConstraintID uniqueidentifier, ConstraintClauseID uniqueidentifier, ClauseID uniqueidentifier)

Insert @ConstraintIDTable Select A.ConstraintID, B.ConstraintClauseRelID, B.ClauseID from [dbo].[Hws_Constraints] A, [dbo].[Hws_ConstraintClause] B 
	where A.ActivityModelID=@ActivityModelID And A.ConstraintID=B.ConstraintID

select @counter 

-- get clauses
Select A.ClauseID, A.AdapterID, A.PropertyID, B.PropertyType, A.Operator, A.NumValues From [dbo].[Hws_Clauses] A, [dbo].[Hws_Properties] B Where 
	ClauseID in (Select ClauseID from @ConstraintIDTable) And A.PropertyID=B.PropertyID

-- get clause values
Select ClauseID, StringValue, IntegerValue, FloatValue, BooleanValue, DateTimeValue, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID 
	From [dbo].[Hws_ClauseValues] Where ClauseID in (Select ClauseID from @ConstraintIDTable)

-- get constraints
Select ConstraintID, ActionID, ActivityModelID, ActivityModelStepID, IsPositive, LastModified, ConstraintType, ActivityModelRoleID
	From [dbo].[Hws_Constraints] Where ActivityModelID=@ActivityModelID

-- get constraint clauses
Select ConstraintID, ConstraintClauseRelID, ClauseID, AllowAll, ClauseType, XPath From [dbo].[Hws_ConstraintClause] Where
	ConstraintClauseRelID in (Select ConstraintClauseID from @ConstraintIDTable)

-- get constraint groups
Select ConstraintID, GroupName, GroupDescription, XPath From [dbo].[Hws_ConstraintGroups] Where
	ConstraintID in (Select ConstraintID From @ConstraintIDTable)
End

End

GO
grant execute on [dbo].[sp_GetHwsConstraints] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_GetHwsConstraints] to HWS_AM_DESIGNER
GO

/****** Object:  Stored Procedure dbo.sp_RemoveFactStoreAdapter    Script Date: 2/16/2003 2:28:19 PM ******/

/****** Object:  Stored Procedure dbo.sp_RemoveFactStoreAdapter    Script Date: 1/30/2003 6:07:43 PM ******/
CREATE PROCEDURE dbo.sp_RemoveFactStoreAdapter
(
	@AdapterID	uniqueidentifier
)
AS
BEGIN	
delete from [dbo].[Hws_Adapters] where AdapterID=@AdapterID and IsIntrinsic=0
End


GO
grant execute on [dbo].[sp_RemoveFactStoreAdapter] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveAction    Script Date: 2/16/2003 2:28:20 PM ******/


CREATE PROCEDURE dbo.sp_RetrieveAction
(
	@ActionID	uniqueidentifier
)
AS
set nocount on
select * from  [dbo].[Hws_Actions] 
where ActionID=@ActionID

GO
grant execute on [dbo].[sp_RetrieveAction] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveActions    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_RetrieveActions    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_RetrieveActions
AS
BEGIN	
select count(*) From [dbo].[Hws_Actions]
Select ActionID, [Name], [Description] From [dbo].[Hws_Actions]
End

GO
grant execute on [dbo].[sp_RetrieveActions] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_RetrieveActions] to HWS_AM_DESIGNER
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveFactStoreAdapters    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_RetrieveFactStoreAdapters    Script Date: 1/30/2003 6:07:43 PM ******/
CREATE PROCEDURE dbo.sp_RetrieveFactStoreAdapters

AS
BEGIN	
select count(*) from [dbo].[Hws_Adapters]
Select * from [dbo].[Hws_Adapters]
End
GO
grant execute on [dbo].[sp_RetrieveFactStoreAdapters] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_RetrieveFactStoreAdapters] to HWS_AM_DESIGNER
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveHwsRoles    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_RetrieveHwsRoles    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_RetrieveHwsRoles
As
BEGIN	

Declare @num int

Set @num = (select count(*) From [dbo].[Hws_ActivityModelRoles])
Select @num
if (@num > 0)
Begin
	Select ActivityModelRoleID, [Name], [Description] From [dbo].[Hws_ActivityModelRoles]
End


End

GO
grant execute on [dbo].[sp_RetrieveHwsRoles] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_RetrieveHwsRoles] to HWS_AM_DESIGNER
GO

/****** Object:  Stored Procedure dbo.sp_UpdateAction    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_UpdateAction    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_UpdateAction
(
	@ActionID	uniqueidentifier,
	@ActionName	nvarchar(128),
	@Description 	nvarchar(128)
)
As
BEGIN	
Update [dbo].[Hws_Actions] Set [Name]=@ActionName, [Description]=@Description, [LastModified]=GETUTCDATE() Where ActionID=@ActionID
return @@rowcount
End


GO
grant execute on [dbo].[sp_UpdateAction] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_AddFactStoreAdapter    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_AddFactStoreAdapter    Script Date: 1/30/2003 6:07:43 PM ******/
CREATE PROCEDURE dbo.sp_AddFactStoreAdapter
(
	@AdapterID	uniqueidentifier,
	@AdapterName	nvarchar(256),
	@AssemblyName	nvarchar(256),
	@ConnectionInfo nvarchar(256),
	@AssemblyCulture nvarchar(50),
	@AssemblyPublicKey nvarchar(50),
	@AssemblyVersion nvarchar(50),
	@Description nvarchar(256),
	@TypeName nvarchar(256)
)
AS
BEGIN

	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_Hws_AdaptersInsFailed_sp_AddFactStoreAdapter nvarchar(100)
	set @localized_string_Hws_AdaptersInsFailed_sp_AddFactStoreAdapter = N'sp_AddFactStoreAdapter failed inserting into Hws_Adapters'

	declare @localized_string_Hws_DuplicateAdapter_sp_AddFactStoreAdapter nvarchar(100)
	set @localized_string_Hws_DuplicateAdapter_sp_AddFactStoreAdapter = N'sp_AddFactStoreAdapter failed inserting duplicate Fact Retriever'

	declare @localized_string_AdapterIdSelFailed_sp_AddFactStoreAdapter nvarchar(100)
	set @localized_string_AdapterIdSelFailed_sp_AddFactStoreAdapter = N'sp_AddFactStoreAdapter failed selecting AdapterId'

	declare @localized_string_CursorOpenFailed_sp_AddFactStoreAdapter nvarchar(100)
	set @localized_string_CursorOpenFailed_sp_AddFactStoreAdapter = N'sp_AddFactStoreAdapter failed opening ObjectCursor'

	declare @localized_string_CursorFetchFailed_sp_AddFactStoreAdapter nvarchar(100)
	set @localized_string_CursorFetchFailed_sp_AddFactStoreAdapter = N'sp_AddFactStoreAdapter failed fetching data from ObjectCursor'

	declare @localized_string_Hws_AdapterObjectRelInsFailed_sp_AddFactStoreAdapter nvarchar(100)
	set @localized_string_Hws_AdapterObjectRelInsFailed_sp_AddFactStoreAdapter = N'sp_AddFactStoreAdapter failed inserting into Hws_AdapterObjectRel'

	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END


	Declare @ExistingAdapterID uniqueidentifier
	Declare @ObjectID uniqueidentifier
	
	if (select count(*)  From [dbo].[Hws_Adapters] where  AssemblyName=@AssemblyName and ConnectionInfo=@ConnectionInfo and
		Version=@AssemblyVersion and PublicKey=@AssemblyPublicKey and TypeName=@TypeName and Culture=@AssemblyCulture) > 0
	  BEGIN
		SET @ErrorDesc = @localized_string_Hws_DuplicateAdapter_sp_AddFactStoreAdapter
		GOTO ROLLBACKTRAN
	  END

	Insert into [dbo].[Hws_Adapters]
		(AdapterID, [Name], AssemblyName, Version, Culture, PublicKey, ConnectionInfo, TypeName, [Description], IsIntrinsic)
		values (@AdapterID, @AdapterName, @AssemblyName, @AssemblyVersion, @AssemblyCulture, @AssemblyPublicKey, @ConnectionInfo, @TypeName, @Description, 0)

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_AdaptersInsFailed_sp_AddFactStoreAdapter
		GOTO ROLLBACKTRAN
	 END
	
	if (select count(*)  From [dbo].[Hws_Adapters] where  AssemblyName=@AssemblyName and
		Version=@AssemblyVersion and PublicKey=@AssemblyPublicKey and TypeName=@TypeName) > 1
	BEGIN
		Set @ExistingAdapterID = (Select Top 1 AdapterID From [dbo].[Hws_Adapters] where  AssemblyName=@AssemblyName and Version=@AssemblyVersion and PublicKey=@AssemblyPublicKey and 
			TypeName=@TypeName And AdapterID <> @AdapterID)
	
		IF @@ERROR <> 0
		 BEGIN
			SET @ErrorDesc = @localized_string_AdapterIdSelFailed_sp_AddFactStoreAdapter
			GOTO ROLLBACKTRAN
		 END
		
		Declare ObjectCursor Cursor For SELECT ObjectID From [dbo].[Hws_AdapterObjectRel] Where AdapterID=@ExistingAdapterID
		
		-- open and try to fetch in the first clause
		Open ObjectCursor

		IF @@ERROR <> 0
		 BEGIN
			SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_AddFactStoreAdapter
			GOTO ROLLBACKTRAN
		 END

		FETCH NEXT FROM ObjectCursor INTO @ObjectID

		IF @@ERROR <> 0
		 BEGIN
			Close ObjectCursor
			DeAllocate ObjectCursor

			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddFactStoreAdapter
			GOTO ROLLBACKTRAN
		 END
		
		-- loop for each clause
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Insert into [dbo].[Hws_AdapterObjectRel] (AdapterID, ObjectID) values (@AdapterID, @ObjectID)

			IF @@ERROR <> 0
			 BEGIN
				Close ObjectCursor
				DeAllocate ObjectCursor

				SET @ErrorDesc = @localized_string_Hws_AdapterObjectRelInsFailed_sp_AddFactStoreAdapter
				GOTO ROLLBACKTRAN
			 END

			FETCH NEXT FROM ObjectCursor INTO @ObjectID

			IF @@ERROR <> 0
			 BEGIN
				Close ObjectCursor
				DeAllocate ObjectCursor

				SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddFactStoreAdapter
				GOTO ROLLBACKTRAN
			 END
		END
		
		Close ObjectCursor
		DeAllocate ObjectCursor
	End

	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:
	RETURN @Ret

End


GO
grant execute on [dbo].[sp_AddFactStoreAdapter] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_AddFactStoreObject    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_AddFactStoreObject    Script Date: 1/30/2003 6:07:43 PM ******/
CREATE PROCEDURE dbo.sp_AddFactStoreObject
(
	@AdapterID	uniqueidentifier,
	@ObjectID	uniqueidentifier,
	@ObjectName		nvarchar(256),
	@DisplayName nvarchar(256),
	@KeyProperty nvarchar(256),
	@Description nvarchar(256)
)
AS
BEGIN	

	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_Hws_ObjectsInsFailed_sp_AddFactStoreObject nvarchar(100)
	set @localized_string_Hws_ObjectsInsFailed_sp_AddFactStoreObject = N'sp_AddFactStoreObject failed inserting into Hws_Objects'

	declare @localized_string_Hws_AdapterObjectRelInsFailed_sp_AddFactStoreObject nvarchar(100)
	set @localized_string_Hws_AdapterObjectRelInsFailed_sp_AddFactStoreObject = N'sp_AddFactStoreObject failed inserting into Hws_AdapterObjectRel'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

	Insert into [dbo].[Hws_Objects] 
		(ObjectID, [Name], KeyProperty, Description, DisplayName)
		values (@ObjectID, @ObjectName, @KeyProperty, @Description, @DisplayName)	
	
	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_ObjectsInsFailed_sp_AddFactStoreObject
		GOTO ROLLBACKTRAN
	 END

	Insert into [dbo].[Hws_AdapterObjectRel] (ObjectID, AdapterID) Values (@ObjectID, @AdapterID)

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_AdapterObjectRelInsFailed_sp_AddFactStoreObject
		GOTO ROLLBACKTRAN
	 END

	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:
	RETURN @Ret

End


GO
grant execute on [dbo].[sp_AddFactStoreObject] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_AddFactStoreProperty    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_AddFactStoreProperty    Script Date: 1/30/2003 6:07:43 PM ******/
CREATE PROCEDURE dbo.sp_AddFactStoreProperty
(
	@PropertyID	uniqueidentifier,
	@ObjectID	uniqueidentifier,
	@PropertyName	nvarchar(256),
	@DisplayName nvarchar(256),
	@IsMultiValued bit,
	@IsEnumerable bit,
	@PropertyType int,
	@Description nvarchar(256)
)
AS
BEGIN	
Insert into [dbo].[Hws_Properties]
	(PropertyID, [Name], DisplayName, IsMultiValued, IsEnumerable, PropertyType, [Description], ObjectID)
	values (@PropertyID, @PropertyName, @DisplayName, @IsMultiValued, @IsEnumerable, @PropertyType, @Description, @ObjectID)

End


GO
grant execute on [dbo].[sp_AddFactStoreProperty] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_HwsGetConstraintInfo    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_HwsGetConstraintInfo    Script Date: 1/30/2003 6:07:43 PM ******/

CREATE PROCEDURE dbo.sp_HwsGetConstraintInfo
(
	@LastTimeStamp	datetime
)
AS
BEGIN	


	/*
		jdwest 2/26/2003
		Refined error handling
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_AdaptersTableInsFailed_sp_HwsGetConstraintInfo nvarchar(100)
	set @localized_string_AdaptersTableInsFailed_sp_HwsGetConstraintInfo = N'sp_HwsGetConstraintInfo failed inserting into @AdaptersTable'

	declare @localized_string_ActionTableInsFailed_sp_HwsGetConstraintInfo nvarchar(100)
	set @localized_string_ActionTableInsFailed_sp_HwsGetConstraintInfo = N'sp_HwsGetConstraintInfo failed inserting into @ActionTable'

	declare @localized_string_ConstraintsTableInsFailed_sp_HwsGetConstraintInfo nvarchar(100)
	set @localized_string_ConstraintsTableInsFailed_sp_HwsGetConstraintInfo = N'sp_HwsGetConstraintInfo failed inserting into @ConstraintsTable'
	

	declare @ActionTable table(ActionID uniqueidentifier, ActionName nvarchar(128))
	declare @AdaptersTable table(ObjectID uniqueidentifier, AdapterName nvarchar(128), ObjectName nvarchar(128), IsIntrinsic bit)
	declare @ConstraintsTable table(ActionID uniqueidentifier, ConstraintID uniqueidentifier, IsPositive bit)

	insert @AdaptersTable select distinct(B.ObjectID), A.Name, B.Name, A.IsIntrinsic from [dbo].[Hws_Adapters] A, [dbo].[Hws_Objects] B, [dbo].[Hws_AdapterObjectRel] C
		 where A.LastModified > @LastTimeStamp and A.AdapterID=C.AdapterID and C.ObjectID=B.ObjectID

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_AdaptersTableInsFailed_sp_HwsGetConstraintInfo
		GOTO FAILED
	 END

	select * from @AdaptersTable
	select B.PropertyID, B.ObjectID, B.Name, B.PropertyType, B.IsMultiValued from @AdaptersTable A, Hws_Properties B where B.ObjectID in 
			(select ObjectID from @AdaptersTable)

	insert @ActionTable select ActionID, Name from [dbo].[Hws_Actions] where LastModified > @LastTimeStamp

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_ActionTableInsFailed_sp_HwsGetConstraintInfo
		GOTO FAILED
	 END

	select * from @ActionTable
	select * from [dbo].[Hws_ActionInterop] where ActionID in (select ActionID from @ActionTable) or 
						DependableAction in (select ActionID from @ActionTable)

	insert @ConstraintsTable select ActionID, ConstraintID, IsPositive from [dbo].[Hws_Constraints] where ActionID in (select ActionID from @ActionTable)

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_ConstraintsTableInsFailed_sp_HwsGetConstraintInfo
		GOTO FAILED
	 END

	select * from @ConstraintsTable
	select A.ActionID, A.ConstraintID, A.IsPositive, B.ClauseID from @ConstraintsTable A, Hws_SourceConstraints B where A.ConstraintID=B.ConstraintID
	select A.ActionID, A.ConstraintID, A.IsPositive, B.ClauseID from @ConstraintsTable A, Hws_EnactedOnConstraints B where A.ConstraintID=B.ConstraintID
	select A.ActionID, A.ConstraintID, A.IsPositive, B.ClauseID from @ConstraintsTable A, Hws_TargetConstraints B where A.ConstraintID=B.ConstraintID

	GOTO DONE

FAILED:
	RAISERROR( @ErrorDesc, 16, -1 )
	RETURN -1

DONE:
	RETURN 0

End



GO
grant execute on [dbo].[sp_HwsGetConstraintInfo] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_CheckIfPropertyIsEnumerable    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_CheckIfPropertyIsEnumerable    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_CheckIfPropertyIsEnumerable
(
	@AdapterID	uniqueidentifier,
	@PropertyID	uniqueidentifier
)
AS
BEGIN	
select prop.IsEnumerable, adapt.IsIntrinsic, adapt.Name, obj.Name, prop.Name from [dbo].[Hws_Adapters] adapt, [dbo].[Hws_AdapterObjectRel] adaptObj, 
	[dbo].[Hws_Objects] obj, [dbo].[Hws_Properties] prop Where adapt.AdapterID=@AdapterID And adapt.AdapterID=adaptObj.AdapterID And adaptObj.ObjectID=obj.ObjectID And 
	obj.ObjectID=prop.ObjectID And prop.PropertyID=@PropertyID
End


GO
grant execute on [dbo].[sp_CheckIfPropertyIsEnumerable] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_CheckIfPropertyIsEnumerable] to HWS_AM_DESIGNER
GO

/****** Object:  Stored Procedure dbo.sp_ConstraintAdminInitialize    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_ConstraintAdminInitialize    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_ConstraintAdminInitialize
AS
BEGIN	

 -- Retrieve all the newly added Actions
   Select ActionID From [dbo].[Hws_Actions]

   -- Retrieve all the newly adapter and properties
   Select A.AdapterID, C.PropertyID, C.PropertyType, C.IsMultiValued From [dbo].[Hws_Adapters] A, [dbo].[Hws_Objects] B, [dbo].[Hws_Properties] C, [dbo].[Hws_AdapterObjectRel] D 
	Where A.AdapterID=D.AdapterID And D.ObjectID=B.ObjectID And B.ObjectID=C.ObjectID
	Order By A.AdapterID
End


GO
grant execute on [dbo].[sp_ConstraintAdminInitialize] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_ConstraintAdminInitialize] to HWS_AM_DESIGNER
GO

/****** Object:  Stored Procedure dbo.sp_GetObjectProperties    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_GetObjectProperties    Script Date: 1/30/2003 6:07:43 PM ******/

CREATE PROCEDURE dbo.sp_GetObjectProperties
(
	@ObjectID	uniqueidentifier
)
AS
BEGIN	
declare @propsTable table(propertyID uniqueidentifier, objectName nvarchar(256), properetyName nvarchar(256), propertyDisplayName nvarchar(256), 
propertyDescription nvarchar(256),propertyType int, IsEnumerable bit, IsMultiValued bit)

insert @propsTable select prop.PropertyID, obj.Name, prop.Name, prop.DisplayName, prop.Description, prop.PropertyType, prop.IsEnumerable, prop.IsMultiValued
	From [dbo].[Hws_Objects] obj, [dbo].[Hws_Properties] prop 
	Where obj.ObjectID=@ObjectID And obj.ObjectID=prop.ObjectID 

select count(*) from @propsTable
select * from @propsTable

End

GO
grant execute on [dbo].[sp_GetObjectProperties] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_GetObjectProperties] to HWS_AM_DESIGNER
GO


/****** Object:  Stored Procedure dbo.sp_GetUsableObjects    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_GetUsableObjects    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_GetUsableObjects
(
	@AdapterID	uniqueidentifier
)
AS
BEGIN	

declare @objTable table(ObjectID uniqueidentifier, [Name] nvarchar(256),  [Description] nvarchar(256), DisplayName nvarchar(256), KeyProperty nvarchar(128))

insert @objTable select A.ObjectID, A.[Name], A.[Description], A.DisplayName, A.KeyProperty from [dbo].[Hws_Adapters] B, [dbo].[Hws_Objects] A, [dbo].[Hws_AdapterObjectRel] C
	where B.AdapterID=@AdapterID and B.AdapterID=C.AdapterID and A.ObjectID=C.ObjectID

select count(*) from @objTable
select * from @objTable
End


GO
grant execute on [dbo].[sp_GetUsableObjects] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_GetUsableObjects] to HWS_AM_DESIGNER
GO

/****** Object:  Stored Procedure dbo.sp_RegisterAction    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_RegisterAction    Script Date: 1/30/2003 6:07:43 PM ******/

CREATE PROCEDURE dbo.sp_RegisterAction
(
	@ActionID	uniqueidentifier,
	@ActionName	nvarchar(255),
	@Description	nvarchar(255),
	@ActionXML	ntext
)
AS
BEGIN	
	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@LocalRet						int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_sp_RegisterAction nvarchar(100)
	set @localized_string_CursorOpenFailed_sp_RegisterAction = N'sp_RegisterAction failed opening cursor'

	declare @localized_string_CursorFetchFailed_sp_RegisterAction nvarchar(100)
	set @localized_string_CursorFetchFailed_sp_RegisterAction = N'sp_RegisterAction failed fetching from cursor'

	declare @localized_string_Hws_ActionsInsFailed_sp_RegisterAction nvarchar(100)
	set @localized_string_Hws_ActionsInsFailed_sp_RegisterAction = N'sp_RegisterAction failed inserting into Hws_Actions'

	declare @localized_string_Hws_ActionInteropInsFailed_sp_RegisterAction nvarchar(100)
	set @localized_string_Hws_ActionInteropInsFailed_sp_RegisterAction = N'sp_RegisterAction failed inserting into Hws_ActionInterop'

	declare @localized_string_sp_xml_preparedocumentFailed_sp_RegisterAction nvarchar(100)
	set @localized_string_sp_xml_preparedocumentFailed_sp_RegisterAction = N'sp_RegisterAction failed calling sp_xml_preparedocument'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

	insert [dbo].[Hws_Actions] (ActionID, Name, [Description]) Values (@ActionID, @ActionName, @Description)

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_ActionsInsFailed_sp_RegisterAction
	 END
	
	Declare @idoc int
	Declare @interOp uniqueidentifier
	Declare @IsChild bit
	
	--  prepare the xml document
	EXEC @LocalRet = sp_xml_preparedocument @idoc OUTPUT, @ActionXML

	IF @@ERROR <> 0 OR @LocalRet <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_sp_xml_preparedocumentFailed_sp_RegisterAction
		GOTO ROLLBACKTRAN
	 END
	
	Declare ActionCursor Cursor For SELECT ActionID, InterOp From OPENXML (@idoc, '/Root/Action',1) 
					WITH (ActionID uniqueidentifier, InterOp bit)
	
	Open ActionCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_RegisterAction
		GOTO ROLLBACKTRAN
	 END

	FETCH NEXT FROM ActionCursor INTO @interOp, @IsChild

	IF @@ERROR <> 0
	 BEGIN
		Close ActionCursor
		DeAllocate ActionCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_RegisterAction
		GOTO ROLLBACKTRAN
	 END
	
	-- loop for each clause
	WHILE @@FETCH_STATUS = 0
	BEGIN
		if @IsChild=1
		 BEGIN
			Insert [dbo].[Hws_ActionInterop] (ActionID, DependableAction) Values (@ActionID, @interOp)
			
			IF @@ERROR <> 0
			 BEGIN
				Close ActionCursor
				DeAllocate ActionCursor
	
				SET @ErrorDesc = @localized_string_Hws_ActionInteropInsFailed_sp_RegisterAction
				GOTO ROLLBACKTRAN
			 END
		 END
		else
		 BEGIN
			Insert [dbo].[Hws_ActionInterop] (ActionID, DependableAction) Values (@interOp, @ActionID)
			
			IF @@ERROR <> 0
			 BEGIN
				Close ActionCursor
				DeAllocate ActionCursor

				SET @ErrorDesc = @localized_string_Hws_ActionInteropInsFailed_sp_RegisterAction
				GOTO ROLLBACKTRAN
			 END
		 END
	
		FETCH NEXT FROM ActionCursor INTO @interOp, @IsChild

		IF @@ERROR <> 0
		 BEGIN
			Close ActionCursor
			DeAllocate ActionCursor

			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_RegisterAction
			GOTO ROLLBACKTRAN
		 END
	End
	
	-- close and deallocate cursor
	Close ActionCursor
	DeAllocate ActionCursor
	
	-- remove the xmldocument
	Execute sp_xml_removedocument @idoc

	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:
	RETURN @Ret

End



GO
grant execute on [dbo].[sp_RegisterAction] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_RemoveConstraint    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_RemoveConstraint    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_RemoveConstraint
(
	@ConstraintID 		uniqueidentifier,
	@LastModifiedDate	datetime
)
As
Begin
   if not Exists(Select ConstraintID from [dbo].[Hws_Constraints] Where ConstraintID=@ConstraintID)
      Return 1

   Delete From [dbo].[Hws_Constraints] Where ConstraintID=@ConstraintID And DateDiff(Second, @LastModifiedDate, LastModified) = 0
 
   if @@rowcount = 0
      Return 2
  
   Return 0
End


GO
grant execute on [dbo].[sp_RemoveConstraint] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_UnregisterAction    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_UnregisterAction    Script Date: 1/30/2003 6:07:44 PM ******/

CREATE PROCEDURE dbo.sp_UnregisterAction
(
	@ActionID	uniqueidentifier
)
AS
BEGIN	

	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_Hws_ActionInteropDelFailed_sp_UnregisterAction nvarchar(100)
	set @localized_string_Hws_ActionInteropDelFailed_sp_UnregisterAction = N'sp_UnregisterAction failed deleting from Hws_ActionInterop'

	declare @localized_string_Hws_ActionsDelFailed_sp_UnregisterAction nvarchar(100)
	set @localized_string_Hws_ActionsDelFailed_sp_UnregisterAction = N'sp_UnregisterAction failed deleting from Hws_Actions'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END
	
	delete from [dbo].[Hws_ActionInterop] where DependableAction = @ActionID

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_ActionInteropDelFailed_sp_UnregisterAction
		GOTO ROLLBACKTRAN
	 END

	delete from [dbo].[Hws_Actions] where ActionID = @ActionID

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_ActionsDelFailed_sp_UnregisterAction
		GOTO ROLLBACKTRAN
	 END
	
	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:
	RETURN @Ret

End

GO
grant execute on [dbo].[sp_UnregisterAction] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_AddClauseValues    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_AddClauseValues    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_AddClauseValues
(
	@ClauseRelationID	uniqueidentifier,
	@NewClauseID		uniqueidentifier,
	@PropertyType		int,
	@idoc			int
)
As
Begin
     
   DECLARE @StringValue 		nvarchar(256)
   DECLARE @RelateToSource 		bit
   DECLARE @RelateToEnactedOn 		bit
   Declare @ClauseAdapterID		uniqueidentifier
   Declare @ClausePropertyID		uniqueidentifier
   DECLARE @BooleanValue 		bit
   DECLARE @DateTimeValue 		DateTime  
   DECLARE @FloatValue 			Decimal(28,12)
   DECLARE @IntegerValue 		int

	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorFetchFailed_sp_AddClauseValues nvarchar(100)
	set @localized_string_CursorFetchFailed_sp_AddClauseValues = N'sp_AddClauseValues failed fetching from curosor'

	declare @localized_string_CursorOpenFailed_sp_AddClauseValues nvarchar(100)
	set @localized_string_CursorOpenFailed_sp_AddClauseValues = N'sp_AddClauseValues failed opening cursor'

	declare @localized_string_Hws_ClauseValuesInsFailed_sp_AddClauseValues nvarchar(100)
	set @localized_string_Hws_ClauseValuesInsFailed_sp_AddClauseValues = N'sp_AddClauseValues failed inserting into Hws_ClauseValues'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

	Declare ClauseValueCursor Cursor For SELECT Value, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID
		FROM OPENXML (@idoc, '/Root/Constraint/Clause/ClauseValue',1) 
		WITH (Value nvarchar(256), RelateToSource bit, RelateToEnactedOn bit, AdapterID uniqueidentifier, PropertyID uniqueidentifier, 
				ClauseRelationID uniqueidentifier '../@ClauseRelationID' )
		Where ClauseRelationID = @ClauseRelationID
	
	OPEN ClauseValueCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_AddClauseValues
		GOTO ROLLBACKTRAN
	 END
	
	-- insert the Clause Values
	if @PropertyType<2 -- for UserID and string Type
	 Begin
		Fetch NEXT From ClauseValueCursor INTO @StringValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseValueCursor
			DEALLOCATE ClauseValueCursor

			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
			GOTO ROLLBACKTRAN
		 END		
	
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Insert [dbo].[Hws_ClauseValues] (ClauseID, StringValue, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID) 
			Values (@NewClauseID, @StringValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID)

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor

				SET @ErrorDesc = @localized_string_Hws_ClauseValuesInsFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END

			-- This is executed as long as the previous fetch succeeds.
			Fetch NEXT From ClauseValueCursor INTO @StringValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor
	
				SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END
		End
	 End
	else if @PropertyType=2 -- for boolean type
	 Begin
		Fetch NEXT From ClauseValueCursor INTO @BooleanValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseValueCursor
			DEALLOCATE ClauseValueCursor

			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
			GOTO ROLLBACKTRAN
		 END
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Insert [dbo].[Hws_ClauseValues] (ClauseID, BooleanValue, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID) 
			Values (@NewClauseID, @BooleanValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID)

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor

				SET @ErrorDesc = @localized_string_Hws_ClauseValuesInsFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END

			-- This is executed as long as the previous fetch succeeds.
			Fetch NEXT From ClauseValueCursor INTO @BooleanValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor
	
				SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END
		End
	 End
	else if @PropertyType=3 -- for integer type
	 Begin
		Fetch NEXT From ClauseValueCursor INTO @IntegerValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseValueCursor
			DEALLOCATE ClauseValueCursor

			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
			GOTO ROLLBACKTRAN
		 END
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Insert [dbo].[Hws_ClauseValues] (ClauseID, IntegerValue, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID) 
			Values (@NewClauseID, @IntegerValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID)

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor

				SET @ErrorDesc = @localized_string_Hws_ClauseValuesInsFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END

			-- This is executed as long as the previous fetch succeeds.
			Fetch NEXT From ClauseValueCursor INTO @IntegerValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor
	
				SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END
		End
	 End
	else if @PropertyType=4 -- for float type
	 Begin  
		Fetch NEXT From ClauseValueCursor INTO @FloatValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseValueCursor
			DEALLOCATE ClauseValueCursor

			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
			GOTO ROLLBACKTRAN
		 END
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Insert [dbo].[Hws_ClauseValues] (ClauseID, FloatValue, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID) 
			Values (@NewClauseID, @FloatValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID)

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor

				SET @ErrorDesc = @localized_string_Hws_ClauseValuesInsFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END

			-- This is executed as long as the previous fetch succeeds.
			Fetch NEXT From ClauseValueCursor INTO @FloatValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor
	
				SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END
		End
	 End
	else  -- for Date/Time/DateTime type
	 Begin  
		Fetch NEXT From ClauseValueCursor INTO @StringValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID
		Set @DateTimeValue=convert(datetime,  @StringValue , 101)

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseValueCursor
			DEALLOCATE ClauseValueCursor

			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
			GOTO ROLLBACKTRAN
		 END
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Insert [dbo].[Hws_ClauseValues] (ClauseID, DateTimeValue, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID) 
			Values (@NewClauseID, @DateTimeValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID)

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor

				SET @ErrorDesc = @localized_string_Hws_ClauseValuesInsFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END

			-- This is executed as long as the previous fetch succeeds.
			Fetch NEXT From ClauseValueCursor INTO @StringValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID
			Set @DateTimeValue=convert(datetime,  @StringValue , 101)

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor
	
				SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClauseValues
				GOTO ROLLBACKTRAN
			 END
		End
	 End

	CLOSE ClauseValueCursor
	DEALLOCATE ClauseValueCursor
	
	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:
	RETURN @Ret

End


GO
grant execute on [dbo].[sp_AddClauseValues] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_HwsInitConstraintInfo    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_HwsInitConstraintInfo    Script Date: 1/30/2003 6:07:44 PM ******/

create PROCEDURE dbo.sp_HwsInitConstraintInfo
AS
BEGIN	

Declare @ActivityModelInfo table (ActivityModelID uniqueidentifier, ActionID uniqueidentifier, ActivityModelStepID int)

/* retrieving adapters that are used and objects within the adapters that are usable */
select A.AdapterID, A.Name, B.Name, A.IsIntrinsic, KeyProperty from [dbo].[Hws_Adapters] A, [dbo].[Hws_Objects] B, [dbo].[Hws_AdapterObjectRel] C
	 where A.AdapterID=C.AdapterID and B.ObjectID=C.ObjectID

/* retrieving property information */
select A.PropertyID,A.Name,A.PropertyType,A.IsMultiValued from [dbo].[Hws_Properties] A

/* retrieving associated adapters for each property - there may be more than 1 adapter of the same type in the system */
select A.PropertyID, B.AdapterID From [dbo].[Hws_Properties] A, [dbo].[Hws_Adapters] B, [dbo].[Hws_Objects] C, [dbo].[Hws_AdapterObjectRel] D 
	where B.AdapterID=D.AdapterID And D.ObjectID=C.ObjectID And C.ObjectID=A.ObjectID

/* ActivityModel Roles and Rights */
select ActivityModelRoleID, ActivityModelRightID From [dbo].[Hws_ActivityModelRoleRightsRel]

/* retrieving ActivityModel stuff */
Insert @ActivityModelInfo Select ActivityModelGuid, ActionTypeId, ActivityModelStepId From [dbo].[ActivityModelSteps] Where
	IsRootStep = 1
select A.ActivityModelGuid, A.ActivityModelName, A.IsMutable, B.ActivityModelStepID, B.ActionID, ActivityModelDescription From [dbo].[ActivityModels] A, @ActivityModelInfo B Where
	A.ActivityModelGuid=B.ActivityModelID And A.IsActive = 1

/* retrieving Action and Action Interop information */
select ActionID, Name, Description From [dbo].[Hws_Actions]
Select * From [dbo].[Hws_ActionInterop]

/* retrieving Constraints and which clauses they contain*/
select ActionID, ActivityModelID, ActivityModelStepID, ConstraintID, IsPositive, ConstraintType, ActivityModelRoleID
	from [dbo].[Hws_Constraints] 

select B.ActionID, ActivityModelID, ActivityModelStepID,  A.ConstraintID, A.GroupID, A.GroupName, A.GroupDescription, A.XPath, ConstraintType From [dbo].[Hws_ConstraintGroups] A, [dbo].[Hws_Constraints] B WHere
	A.ConstraintID=B.ConstraintID

/* retrieving Clause definitions */
select ClauseID, AdapterID, PropertyID, Operator, NumValues from [dbo].[Hws_Clauses]

select A.ClauseID, C.PropertyType, A.RelateToSource, A.RelateToEnactedOn, A.StringValue, A.IntegerValue, A.FloatValue, A.BooleanValue, A.DateTimeValue, 
	A.AdapterID, A.PropertyID
	from [dbo].[Hws_ClauseValues] A, [dbo].[Hws_Clauses] B, [dbo].[Hws_Properties] C
	where A.ClauseID=B.ClauseID and B.PropertyID=C.PropertyID

/* retrieving constraint to clause relation */
select C.ActionID, A.ConstraintID, A.ClauseID, C.IsPositive, A.AllowAll, A.ClauseType, A.XPath, ActivityModelID, ActivityModelStepID, ConstraintType, ActivityModelRoleID From [dbo].[Hws_ConstraintClause] A,
	[dbo].[Hws_Constraints] C where A.ConstraintID=C.ConstraintID


/* selecting to see if constraints are simply used as guidance */
select ConstraintsUsedAsGuidance From [dbo].[Hws_Core]

End



GO

grant execute on [dbo].[sp_HwsInitConstraintInfo] to HWS_WS_USER
grant execute on [dbo].[sp_HwsInitConstraintInfo] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_HwsRefreshConstraintInfo    Script Date: 2/16/2003 2:28:20 PM ******/
/****** Object:  Stored Procedure dbo.sp_HwsRefreshConstraintInfo    Script Date: 1/30/2003 6:07:44 PM ******/

CREATE PROCEDURE dbo.sp_HwsRefreshConstraintInfo
(
	@LastTimeStamp	datetime output
)
AS
BEGIN	

declare @MostRecentModification datetime
Set @MostRecentModification = (Select Top 1 MostRecentModification From Hws_MostRecentModification)
Set @LastTimeStamp = @MostRecentModification

-- check to see if there was a modification
if (@MostRecentModification > @LastTimeStamp)
Begin

/* to retrieve the entities that have been deleted */
select AdapterID from [dbo].[Hws_RemovedEntities] where LastModified > @LastTimeStamp and AdapterID is not null

select ActionID from [dbo].[Hws_RemovedEntities] where LastModified > @LastTimeStamp and ActionID is not null and ConstraintID is null

select ActivityModelID from [dbo].[Hws_RemovedEntities] where LastModified > @LastTimeStamp and ActivityModelID is not null and ConstraintID is null

select ConstraintID, ActionID, ActivityModelID, ActivityModelStepID, ActivityModelRoleID, IsPositive from [dbo].[Hws_RemovedEntities] where LastModified > @LastTimeStamp and ConstraintID is not null 

select ClauseID from [dbo].[Hws_RemovedEntities] where LastModified > @LastTimeStamp and ClauseID is not null

select GroupID from [dbo].[Hws_RemovedEntities] where LastModified > @LastTimeStamp and GroupID is not null



-- *******************************************************************************************************************
-- *******************************************************************************************************************
-- *******************************************************************************************************************
-- *******************************************************************************************************************

/* getting the new ifnormation */
Declare @adapterTable table(AdapterID uniqueidentifier, AdapterName nvarchar(256), ObjectName nvarchar(256), IsIntrinsice bit, 
				KeyProperty nvarchar(256))
Declare @ActionTable table(ActionID uniqueidentifier, Name nvarchar(256))
Declare @constraintTable table(ActionID uniqueidentifier, ActivityModelID uniqueidentifier, ActivityModelStepID int,
	ConstraintID uniqueidentifier, IsPositive bit, ConstraintType tinyint )
Declare @EmptyTable table (foo int)
Declare @ActivityModelInfo table (ActivityModelID uniqueidentifier, ActionID uniqueidentifier, ActivityModelStepID int)

/* ********************************************************************************************************* */
/* ********************************************************************************************************* */
/* retrieving adapters that are used and objects within the adapters that are usable */
insert @adapterTable select A.AdapterID, A.Name, B.Name, A.IsIntrinsic, KeyProperty from [dbo].[Hws_Adapters] A, [dbo].[Hws_Objects] B, [dbo].[Hws_AdapterObjectRel] C
	 where A.AdapterID=C.AdapterID and B.ObjectID=C.ObjectID And IsIntrinsic=0 And LastModified > @LastTimeStamp

select * from @adapterTable

if (Select Count(*) From @adapterTable) > 0
Begin
   /* retrieving property information */
   select A.PropertyID, A.Name, A.PropertyType, A.IsMultiValued from [dbo].[Hws_Properties] A, [dbo].[Hws_AdapterObjectRel] C Where A.ObjectID=C.ObjectID And
	C.AdapterID in (select AdapterID From @adapterTable)

   /* retrieving associated adapters for each property - there may be more than 1 adapter of the same type in the system */
   select A.PropertyID, B.AdapterID From [dbo].[Hws_Properties] A, [dbo].[Hws_Adapters] B, [dbo].[Hws_Objects] C, [dbo].[Hws_AdapterObjectRel] D 
	where B.AdapterID=D.AdapterID And D.ObjectID=C.ObjectID And C.ObjectID=A.ObjectID
End
Else
Begin
select * from @adapterTable
select * from @adapterTable
End


/* ********************************************************************************************************* */
/* ********************************************************************************************************* */
/* retrieving Action and Action Interop information */
insert @ActionTable select ActionID, Name From Hws_Actions Where LastModified > @LastTimeStamp

select * From @ActionTable

if (Select Count(*) From @ActionTable) > 0
Begin
   Select * From [dbo].[Hws_ActionInterop] Where ActionID in (Select ActionID From @ActionTable) Or 
		DependableAction In (Select ActionID From @ActionTable)
End
Else
Begin
Select * from @ActionTable
End

/* ********************************************************************************************************* */
/* ********************************************************************************************************* */
/* retrieving  empty list for Hws roles */
select * from @EmptyTable


/* retrieving ActivityModel stuff */
Insert @ActivityModelInfo Select A.ActivityModelGuid, A.ActionTypeId, A.ActivityModelStepId From [dbo].[ActivityModelSteps] A, [dbo].[ActivityModels] B Where
	A.ActivityModelGuid=B.ActivityModelGuid And B.LastModified > @LastTimeStamp And A.ActivityModelStepId Not In (Select ChildStepId From [dbo].[ActivityModelStepRel]) 
select A.ActivityModelGuid, A.ActivityModelName, A.IsMutable, B.ActivityModelStepID, B.ActionID From [dbo].[ActivityModels] A, @ActivityModelInfo B Where
	A.ActivityModelGuid=B.ActivityModelID

/* ********************************************************************************************************* */
/* ********************************************************************************************************* */
/* retrieving Constraints and which clauses they contain*/
Insert @constraintTable select ActionID, ActivityModelID, ActivityModelStepID, ConstraintID, IsPositive, ConstraintType 
	from [dbo].[Hws_Constraints] where LastModified > @LastTimeStamp

Select * from @constraintTable

if (Select Count(*) From @constraintTable) > 0
Begin

   -- constraint group information
   select B.ActionID, B.ActivityModelID, B.ActivityModelStepID, A.ConstraintID, A.GroupID, A.GroupName, A.GroupDescription, A.XPath, B.ConstraintType From [dbo].[Hws_ConstraintGroups] A, [dbo].[Hws_Constraints] B WHere
	A.ConstraintID=B.ConstraintID And A.LastModified > @LastTimeStamp

   /* retrieving Clause definitions */
   Declare @clauseTable table(ClauseID uniqueidentifier, AdapterID uniqueidentifier, PropertyID uniqueidentifier, Operator tinyint, NumValues int)

   insert @clauseTable select ClauseID, AdapterID, PropertyID, Operator, NumValues from [dbo].[Hws_Clauses] Where LastModified > @LastTimeStamp

   -- clauses
   Select * from @clauseTable

   -- clause values
   select A.ClauseID, C.PropertyType, A.RelateToSource, A.RelateToEnactedOn, A.StringValue, A.IntegerValue, A.FloatValue, A.BooleanValue, A.DateTimeValue, 
	A.AdapterID, A.PropertyID
	from [dbo].[Hws_ClauseValues] A, [dbo].[Hws_Clauses] B, [dbo].[Hws_Properties] C
	where A.ClauseID=B.ClauseID and B.PropertyID=C.PropertyID And A.ClauseID in (Select ClauseID From @clauseTable)

   /* retrieving constraint to clause relation */
   select C.ActionID, A.ConstraintID, A.ClauseID, C.IsPositive, A.AllowAll, A.ClauseType, A.XPath, C.ActivityModelID, C.ActivityModelStepID, 
		C.ConstraintType, C.ActivityModelRoleID From [dbo].[Hws_ConstraintClause] A,
		[dbo].[Hws_Constraints] C where A.ConstraintID=C.ConstraintID And A.ConstraintID in 
	(Select ConstraintID From @constraintTable)
End
Else
Begin
Select * from @constraintTable
Select * from @constraintTable
Select * from @constraintTable
Select * from @constraintTable
End

End
End



GO
grant execute on [dbo].[sp_HwsRefreshConstraintInfo] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_RetrieveConstraints    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_RetrieveConstraints    Script Date: 2/3/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_RetrieveConstraints
(
	@ActionID 		uniqueidentifier
)
As
Begin
Declare @numConstraint int

   Declare @ActivityModelTable table(ActivityModelID uniqueidentifier)
   Declare @ConstraintTable table(ConstraintID uniqueidentifier, ActionID uniqueidentifier, ActivityModelID uniqueidentifier, IsPositive bit, LastModified datetime)
   Declare @ClauseRelTable table(ConstraintClauseRelID uniqueidentifier)
   Declare @ClauseTable table(ClauseID uniqueidentifier)

   Insert @ActivityModelTable Select ActivityModelGuid From ActivityModels Where IsActive=1

   If @ActionID is null
	Insert @ConstraintTable select ConstraintID, ActionID, ActivityModelID, IsPositive, LastModified from [dbo].[Hws_Constraints] Where ConstraintType=0 And (ActivityModelID Is Null Or ActivityModelID In (Select ActivityModelID From @ActivityModelTable))
   Else
	Insert @ConstraintTable select ConstraintID, ActionID, ActivityModelID, IsPositive, LastModified from [dbo].[Hws_Constraints] where ActionID=@ActionID And ConstraintType=0 And (ActivityModelID Is Null Or ActivityModelID In (Select ActivityModelID From @ActivityModelTable))

   if (select count(*) From @ConstraintTable) > 0
   Begin
      Insert @ClauseRelTable select ConstraintClauseRelID from [dbo].[Hws_ConstraintClause] Where ConstraintID in (select ConstraintID from @ConstraintTable)

      Insert @ClauseTable Select ClauseID From [dbo].[Hws_ConstraintClause] Where ConstraintClauseRelID in (Select ConstraintClauseRelID From @ClauseRelTable)

      Select A.ClauseID, A.AdapterID, A.PropertyID, B.PropertyType, A.Operator, A.NumValues from [dbo].[Hws_Clauses] A, [dbo].[Hws_Properties] B where 
	A.PropertyID=B.PropertyID And A.ClauseID in (Select ClauseID From @ClauseTable)

      Select ClauseID, StringValue, IntegerValue, FloatValue, BooleanValue, DateTimeValue, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID
	from [dbo].[Hws_ClauseValues] where ClauseID in (Select ClauseID From @ClauseTable)

      select ConstraintID, ActionID, ActivityModelID, ActivityModelStepID, IsPositive, LastModified, ConstraintType from [dbo].[Hws_Constraints]  
Where ConstraintID in 
	(select ConstraintID from @ConstraintTable)

      select A.ConstraintID, A.ConstraintClauseRelID, A.ClauseID, A.AllowAll, A.ClauseType, A.XPath  from [dbo].[Hws_ConstraintClause] A 
 Where A.ConstraintID in 
	(select ConstraintID from @ConstraintTable)

      select A.ConstraintID, A.GroupName, A.GroupDescription, A.XPath  from [dbo].[Hws_ConstraintGroups] A Where A.ConstraintID in 
	(select ConstraintID from @ConstraintTable)
   End 

End

GO
grant execute on [dbo].[sp_RetrieveConstraints] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_AddNewClause    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_AddNewClause    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_AddNewClause
(
	@ConstraintID 		uniqueidentifier,
	@ClauseRelationID	uniqueidentifier,
	@AdapterID		uniqueidentifier,
	@PropertyID		uniqueidentifier,
	@NumValues		int,
	@Operator		int,
	@PropertyType		int,
	@idoc			int,
	@AddedClauseID		uniqueidentifier OutPut,
	@LastModified		datetime OutPut
)
As
Begin
   Set @AddedClauseID = NewID()
   Set @LastModified = GETUTCDATE()
   
	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@localRet						int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_Hws_ClausesInsFailed_sp_AddNewClause nvarchar(100)
	set @localized_string_Hws_ClausesInsFailed_sp_AddNewClause = N'sp_AddNewClause failed inserting into Hws_Clauses'

	declare @localized_string_sp_AddClauseValuesFailed_sp_AddNewClause nvarchar(100)
	set @localized_string_sp_AddClauseValuesFailed_sp_AddNewClause = N'sp_AddNewClause failed executing sp_AddClauseValues'

	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

	-- insert the clause
	Insert [dbo].[Hws_Clauses] (ClauseID, AdapterID, PropertyID, Operator, NumValues, LastModified) 
	Values (@AddedClauseID, @AdapterID, @PropertyID, @Operator, @NumValues, @LastModified)

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_ClausesInsFailed_sp_AddNewClause
		GOTO ROLLBACKTRAN
	 END	
	
	-- insert the Clause Values
	Execute @localRet = sp_AddClauseValues @ClauseRelationID, @AddedClauseID, @PropertyType, @idoc

	IF @@ERROR <> 0 OR @localRet <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_sp_AddClauseValuesFailed_sp_AddNewClause
		GOTO ROLLBACKTRAN
	 END	
		
	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	SELECT @Ret = -1, @AddedClauseID = NULL 
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:
	RETURN @Ret

End


GO
grant execute on [dbo].[sp_AddNewClause] to HWS_ADMIN_USER
GO

/****** Object:  Stored Procedure dbo.sp_AddClause    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_AddClause    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_AddClause
(
	@ConstraintID 		uniqueidentifier,
	@ClauseRelationID	uniqueidentifier,
	@AdapterID		uniqueidentifier,
	@PropertyID		uniqueidentifier,
	@NumValues		int,
	@PropertyType		int,
	@Operator		int,
	@idoc			int,
	@AddedClauseID		uniqueidentifier OutPut,
        @LastModified		datetime OutPut
)
AS
BEGIN	
	DECLARE @ClauseValue 		varchar(256)
	DECLARE @RelateToSource 	bit
	DECLARE @RelateToEnactedOn 	bit
	Declare @ClauseAdapterID	uniqueidentifier
	Declare @ClausePropertyID	uniqueidentifier
	Declare @MatchingClauseID 	uniqueidentifier 
	Declare @MatchingLastModified 	datetime
	Declare @tmpDateTime 	datetime
	Declare @ClauseIDTable 		table(ClauseID uniqueidentifier, LastModified datetime)  

	/*
		jdwest 2/26/2003
		Refined error handling
	*/
	DECLARE @Ret							int
		,@localRet						int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_sp_AddClause nvarchar(100)
	set @localized_string_CursorOpenFailed_sp_AddClause = N'sp_AddClause failed opening cursor'

	declare @localized_string_CursorFetchFailed_sp_AddClause nvarchar(100)
	set @localized_string_CursorFetchFailed_sp_AddClause = N'sp_AddClause failed fetching from cursor'

	declare @localized_string_ClauseIDTableInsFailed_sp_AddClause nvarchar(100)
	set @localized_string_ClauseIDTableInsFailed_sp_AddClause = N'sp_AddClause failed inserting into @ClauseIDTable'

	declare @localized_string_sp_AddNewClause_sp_AddClause nvarchar(100)
	set @localized_string_sp_AddNewClause_sp_AddClause = N'sp_AddClause failed calling sp_AddNewClause'


	Declare ClauseValueCursor Cursor For SELECT Value, RelateToSource, RelateToEnactedOn, AdapterID, PropertyID
		FROM OPENXML (@idoc, '/Root/Constraint/Clause/ClauseValue',1) 
		WITH (Value nvarchar(256), RelateToSource bit, RelateToEnactedOn bit, AdapterID uniqueidentifier, PropertyID uniqueidentifier, 
				ClauseRelationID uniqueidentifier '../@ClauseRelationID' )
		Where ClauseRelationID = @ClauseRelationID

	OPEN ClauseValueCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_AddClause
		GOTO FAILED
	 END
	
	Fetch NEXT From ClauseValueCursor INTO @ClauseValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

	IF @@ERROR <> 0
	 BEGIN
		CLOSE ClauseValueCursor
		DEALLOCATE ClauseValueCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClause
		GOTO FAILED
	 END
	
	WHILE @@FETCH_STATUS = 0
	 BEGIN
		If @RelateToSource=0 And @RelateToEnactedOn=0
		 BEGIN
			If @PropertyType<2 -- UserID, String PropertyType
			 BEGIN
				Insert @ClauseIDTable Select A.ClauseID, A.LastModified From [dbo].[Hws_Clauses] A, [dbo].[Hws_ClauseValues] B Where A.ClauseID=B.ClauseID And
				A.AdapterID=@AdapterID And A.PropertyID=@PropertyID And A.Operator=@Operator And A.NumValues=@NumValues And 
				B.StringValue=@ClauseValue And B.RelateToSource=0 And B.RelateToEnactedOn=0

				IF @@ERROR <> 0
				 BEGIN
					CLOSE ClauseValueCursor
					DEALLOCATE ClauseValueCursor
			
					SET @ErrorDesc = @localized_string_ClauseIDTableInsFailed_sp_AddClause
					GOTO FAILED
				 END
			 END
			Else If @PropertyType=2 -- Boolean PropertyType
			 BEGIN
				Insert @ClauseIDTable Select A.ClauseID, A.LastModified From [dbo].[Hws_Clauses] A, [dbo].[Hws_ClauseValues] B Where A.ClauseID=B.ClauseID And
				A.AdapterID=@AdapterID And A.PropertyID=@PropertyID And A.Operator=@Operator And A.NumValues=@NumValues And  
				B.BooleanValue=Cast(@ClauseValue as bit) And B.RelateToSource=0 And B.RelateToEnactedOn=0

				IF @@ERROR <> 0
				 BEGIN
					CLOSE ClauseValueCursor
					DEALLOCATE ClauseValueCursor
			
					SET @ErrorDesc = @localized_string_ClauseIDTableInsFailed_sp_AddClause
					GOTO FAILED
				 END
			 END
			Else If @PropertyType=3 -- int PropertyType
			 BEGIN
				Insert @ClauseIDTable Select A.ClauseID, A.LastModified From [dbo].[Hws_Clauses] A, [dbo].[Hws_ClauseValues] B Where  A.ClauseID=B.ClauseID And
				A.AdapterID=@AdapterID And A.PropertyID=@PropertyID And A.Operator=@Operator And A.NumValues=@NumValues  And
				B.IntegerValue=Cast(@ClauseValue as int) And B.RelateToSource=0 And B.RelateToEnactedOn=0

				IF @@ERROR <> 0
				 BEGIN
					CLOSE ClauseValueCursor
					DEALLOCATE ClauseValueCursor
			
					SET @ErrorDesc = @localized_string_ClauseIDTableInsFailed_sp_AddClause
					GOTO FAILED
				 END
			 END
			Else If @PropertyType=4 -- float PropertyType
			 BEGIN
				Insert @ClauseIDTable Select A.ClauseID, A.LastModified From [dbo].[Hws_Clauses] A, [dbo].[Hws_ClauseValues] B Where A.ClauseID=B.ClauseID And
				A.AdapterID=@AdapterID And A.PropertyID=@PropertyID And A.Operator=@Operator And A.NumValues=@NumValues And  
				B.FloatValue=Cast(@ClauseValue as decimal(28,12)) And B.RelateToSource=0 And B.RelateToEnactedOn=0

				IF @@ERROR <> 0
				 BEGIN
					CLOSE ClauseValueCursor
					DEALLOCATE ClauseValueCursor
			
					SET @ErrorDesc = @localized_string_ClauseIDTableInsFailed_sp_AddClause
					GOTO FAILED
				 END
			 END
			Else
			 BEGIN
				Insert @ClauseIDTable Select A.ClauseID, A.LastModified From [dbo].[Hws_Clauses] A, [dbo].[Hws_ClauseValues] B Where A.ClauseID=B.ClauseID And
				A.AdapterID=@AdapterID And A.PropertyID=@PropertyID And A.Operator=@Operator And A.NumValues=@NumValues And  
				B.DateTimeValue=convert(datetime, @ClauseValue, 101) And B.RelateToSource=0 And B.RelateToEnactedOn=0

				IF @@ERROR <> 0
				 BEGIN
					CLOSE ClauseValueCursor
					DEALLOCATE ClauseValueCursor
			
					SET @ErrorDesc = @localized_string_ClauseIDTableInsFailed_sp_AddClause
					GOTO FAILED
				 END
			 END
		 End
		Else
		 BEGIN
			Insert @ClauseIDTable Select A.ClauseID, A.LastModified From [dbo].[Hws_Clauses] A, [dbo].[Hws_ClauseValues] B Where A.ClauseID=B.ClauseID And 
			A.AdapterID=@AdapterID And A.PropertyID=@PropertyID And A.Operator=@Operator And A.NumValues=@NumValues And 
			B.RelateToSource=@RelateToSource And B.RelateToEnactedOn=@RelateToEnactedOn And B.AdapterID=@ClauseAdapterID And 
			B.PropertyID=@ClausePropertyID

			IF @@ERROR <> 0
			 BEGIN
				CLOSE ClauseValueCursor
				DEALLOCATE ClauseValueCursor
		
				SET @ErrorDesc = @localized_string_ClauseIDTableInsFailed_sp_AddClause
				GOTO FAILED
			 END
		 END
	
		-- This is executed as long as the previous fetch succeeds.
		Fetch NEXT From ClauseValueCursor INTO @ClauseValue, @RelateToSource, @RelateToEnactedOn, @ClauseAdapterID, @ClausePropertyID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseValueCursor
			DEALLOCATE ClauseValueCursor
	
			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_AddClause
			GOTO FAILED
		 END
	End
	
	CLOSE ClauseValueCursor
	DEALLOCATE ClauseValueCursor


	
	Select @MatchingClauseID=ClauseID, @MatchingLastModified=LastModified From @ClauseIDTable Group By ClauseID, LastModified
	Having Count(*)=@NumValues
	
	-- now we know if there was a clause in there
	if @MatchingClauseID is NULL 
	-- this means that we have to insert a new clause into the db
	Execute @localRet = sp_AddNewClause @ConstraintID, @ClauseRelationID, @AdapterID, @PropertyID, @NumValues, @Operator, @PropertyType, @idoc, 
	@MatchingClauseID OutPut, @MatchingLastModified OutPut

	IF @@ERROR <> 0 OR @localRet <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_sp_AddNewClause_sp_AddClause
		GOTO FAILED
	 END
	
	Set @AddedClauseID = @MatchingClauseID
	Set @LastModified=@MatchingLastModified	


	SET @Ret = 0
	GOTO DONE

FAILED:
	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

DONE:
	RETURN @Ret

END

GO



GO
grant execute on [dbo].[sp_AddClause] to HWS_ADMIN_USER
GO


/****** Object:  Stored Procedure dbo.sp_InternalAddConstraint    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_InternalAddConstraint    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_InternalAddConstraint
(
	@ConstraintID 		uniqueidentifier,
	@ActionID		uniqueidentifier,
	@ActivityModelID		uniqueidentifier,
	@ActivityModelStep	int,
	@ConstraintType		tinyint,
	@ActivityModelRoleID	uniqueidentifier,
	@IsPositive		bit,
	@idoc			int
)
As
Begin
	Declare @GroupID		uniqueidentifier
	Declare @AdapterID 		uniqueidentifier
	Declare @ClauseRelationID 	uniqueidentifier
	Declare @PropertyID 		uniqueidentifier
	Declare @PropertyType 		int
	Declare @Operator 		int
	Declare @ClauseType 		tinyint
	Declare @NumValues 		int
	Declare @XPath 			nvarchar(256)
	Declare @GroupName 		nvarchar(256)
	Declare @GroupDescription	nvarchar(256)
	Declare @RetClauseID 		uniqueidentifier
	Declare @LastModified		datetime
	Declare	@IsClauseInserted	bit
	Declare @ShouldFetchNext	bit

	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@LocalRet						int
		,@Error							int
		,@Rowcount						int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_sp_InternalAddConstraint nvarchar(100)
	set @localized_string_CursorOpenFailed_sp_InternalAddConstraint = N'sp_InternalAddConstraint failed opening cursor'

	declare @localized_string_CursorFetchFailed_sp_InternalAddConstraint nvarchar(100)
	set @localized_string_CursorFetchFailed_sp_InternalAddConstraint = N'sp_InternalAddConstraint failed fetching from cursor'

	declare @localized_string_Hws_ConstraintsInsFailed_sp_InternalAddConstraint nvarchar(100)
	set @localized_string_Hws_ConstraintsInsFailed_sp_InternalAddConstraint = N'sp_InternalAddConstraint failed inserting into Hws_Constraints'

	declare @localized_string_Hws_ConstraintClauseInsFailed_sp_InternalAddConstraint nvarchar(100)
	set @localized_string_Hws_ConstraintClauseInsFailed_sp_InternalAddConstraint = N'sp_InternalAddConstraint failed inserting into Hws_ConstraintClause'

	declare @localized_string_sp_AddClauseFailed_sp_InternalAddConstraint nvarchar(100)
	set @localized_string_sp_AddClauseFailed_sp_InternalAddConstraint = N'sp_InternalAddConstraint failed calling sp_AddClause'

	declare @localized_string_Hws_ConstraintClauseRelInsFailed_sp_InternalAddConstraint nvarchar(100)
	set @localized_string_Hws_ConstraintClauseRelInsFailed_sp_InternalAddConstraint = N'sp_InternalAddConstraint failed inserting into Hws_ConstraintRelClause'

	declare @localized_string_Hws_ConstraintClauseRelUpdFailed_sp_InternalAddConstraint nvarchar(100)
	set @localized_string_Hws_ConstraintClauseRelUpdFailed_sp_InternalAddConstraint = N'sp_InternalAddConstraint failed updating Hws_ConstraintRelClause'

	declare @localized_string_Hws_ConstraintGroupsInsFailed_sp_InternalAddConstraint nvarchar(100)
	set @localized_string_Hws_ConstraintGroupsInsFailed_sp_InternalAddConstraint = N'sp_InternalAddConstraint failed inserting into Hws_ConstraintGroups'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END
	
	-- insert constraint information
	Insert [dbo].[Hws_Constraints] (ConstraintID, ActionID, ActivityModelID, ActivityModelStepID, ConstraintType, ActivityModelRoleID, IsPositive, LastModified)
	Values (@ConstraintID, @ActionID, @ActivityModelID, @ActivityModelStep, @ConstraintType, @ActivityModelRoleID, @IsPositive, GETUTCDATE())

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_ConstraintsInsFailed_sp_InternalAddConstraint
		GOTO ROLLBACKTRAN
	 END
	
	-- create a cursor to goes through all the clauses in the constraint
	Declare ClauseCursor Cursor For SELECT ClauseRelationID, AdapterID, PropertyID, PropertyType, Operator, ClauseType, NumValues, XPath
					From OPENXML (@idoc, '/Root/Constraint/Clause',1) 
					WITH (ClauseRelationID uniqueidentifier, AdapterID uniqueidentifier, PropertyID uniqueidentifier, PropertyType int, Operator int,
						ClauseType tinyint, NumValues int, XPath nvarchar(256), ConstraintID uniqueidentifier '../@ConstraintID')
						Where ConstraintID = @ConstraintID
	
	-- open and try to fetch in the first clause
	Open ClauseCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_InternalAddConstraint
		GOTO ROLLBACKTRAN
	 END

	FETCH NEXT FROM ClauseCursor INTO @ClauseRelationID, @AdapterID, @PropertyID, @PropertyType, @Operator, @ClauseType, @NumValues, @XPath

	IF @@ERROR <> 0
	 BEGIN
		CLOSE ClauseCursor
		DEALLOCATE ClauseCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalAddConstraint
		GOTO ROLLBACKTRAN
	 END

	Set @IsClauseInserted = 0
	Set @ShouldFetchNext = 0

	-- loop for each clause
	WHILE @@FETCH_STATUS = 0
	 BEGIN
		if (@IsClauseInserted = 0)
		Begin

		if (@NumValues = 0)
		Insert [dbo].[Hws_ConstraintClause] (ConstraintClauseRelID, ConstraintID, AllowAll, ClauseType, XPath) 
				         Values (@ClauseRelationID, @ConstraintID, 1, @ClauseType, @XPath) 
		Else
		Insert [dbo].[Hws_ConstraintClause] (ConstraintClauseRelID, ConstraintID, AllowAll, ClauseType, XPath) 
				         Values (@ClauseRelationID, @ConstraintID, 0, @ClauseType, @XPath) 
				
		IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
		 BEGIN
			CLOSE ClauseCursor
			DEALLOCATE ClauseCursor
			
			SET @ErrorDesc = @localized_string_Hws_ConstraintClauseInsFailed_sp_InternalAddConstraint
			GOTO ROLLBACKTRAN
		 END
		
		Set @IsClauseInserted = 1
		End

		If @NumValues > 0
		 Begin
			-- call helper function to add the clause
			Execute @LocalRet = sp_AddClause @ConstraintID, @ClauseRelationID, @AdapterID, @PropertyID, @NumValues, @PropertyType, @Operator, @idoc, @RetClauseID OutPut, @LastModified OutPut

			IF @@ERROR <> 0 OR @LocalRet <> 0
			 BEGIN
				CLOSE ClauseCursor
				DEALLOCATE ClauseCursor
		
				SET @ErrorDesc = @localized_string_sp_AddClauseFailed_sp_InternalAddConstraint
				GOTO ROLLBACKTRAN
			 END

			Update [dbo].[Hws_ConstraintClause] Set ClauseID=@RetClauseID Where ConstraintClauseRelID=@ClauseRelationID And 
			Exists(Select ClauseID From [dbo].[Hws_Clauses] Where ClauseID=@RetClauseID And LastModified=@LastModified)

			if (@@RowCount <> 0)
				Set @ShouldFetchNext = 1

			IF @@ERROR <> 0 OR @LocalRet <> 0
			 BEGIN
				CLOSE ClauseCursor
				DEALLOCATE ClauseCursor
		
				SET @ErrorDesc = @localized_string_sp_AddClauseFailed_sp_InternalAddConstraint
				GOTO ROLLBACKTRAN
			 END
		End
		Else
		Begin
		 	Set @ShouldFetchNext = 1
		End
		
		if (@ShouldFetchNext = 1)
		Begin
		-- This is executed as long as the previous fetch succeeds.
		-- only fetch the next row if this relation has been recorded
		FETCH NEXT FROM ClauseCursor INTO @ClauseRelationID, @AdapterID, @PropertyID, @PropertyType, @Operator, @ClauseType, @NumValues, @XPath

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseCursor
			DEALLOCATE ClauseCursor
		
			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalAddConstraint
			GOTO ROLLBACKTRAN
		 END

		Set @ShouldFetchNext = 0
		Set @IsClauseInserted = 0
		End
	END

	-- close and deallocate cursor
	CLOSE ClauseCursor
	DEALLOCATE ClauseCursor

	Declare GroupCursor Cursor For SELECT XPath, GroupName, GroupDescription
					From OPENXML (@idoc, '/Root/Constraint/Group',1) 
					WITH (XPath nvarchar(256), GroupName nvarchar(256), GroupDescription nvarchar(256), ConstraintID uniqueidentifier '../@ConstraintID')
						Where ConstraintID = @ConstraintID
	
	-- open and try to fetch in the first clause
	Open GroupCursor

	FETCH NEXT FROM GroupCursor INTO @XPath, @GroupName, @GroupDescription

	IF @@ERROR <> 0
	 BEGIN
		CLOSE GroupCursor
		DEALLOCATE GroupCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalAddConstraint
		GOTO ROLLBACKTRAN
	 END

	-- loop for each clause
	WHILE @@FETCH_STATUS = 0
	 BEGIN
		Insert [dbo].[Hws_ConstraintGroups] (ConstraintID, GroupName, GroupDescription, XPath) Values (@ConstraintID, @GroupName, @GroupDescription, @XPath)

		IF @@ERROR <> 0
		 BEGIN
			CLOSE GroupCursor
			DEALLOCATE GroupCursor
	
			SET @ErrorDesc = @localized_string_Hws_ConstraintGroupsInsFailed_sp_InternalAddConstraint
			GOTO ROLLBACKTRAN
		 END

		FETCH NEXT FROM GroupCursor INTO @XPath, @GroupName, @GroupDescription

		IF @@ERROR <> 0
		 BEGIN
			CLOSE GroupCursor
			DEALLOCATE GroupCursor
	
			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalAddConstraint
			GOTO ROLLBACKTRAN
		 END
	 END
	
	-- close and deallocate cursor
	CLOSE GroupCursor
	DEALLOCATE GroupCursor

	
	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	RAISERROR( @ErrorDesc, 16, -1 )
	SET @Ret = -1
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:

	RETURN @Ret
	
END


GO
grant execute on [dbo].[sp_InternalAddConstraint] to HWS_ADMIN_USER
GO


/****** Object:  Stored Procedure dbo.sp_InternalModifyConstraint    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_InternalModifyConstraint    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_InternalModifyConstraint
(
	@ConstraintID 		uniqueidentifier,
	@ActionID		uniqueidentifier,
	@ActivityModelID		uniqueidentifier,
	@ConstraintType		tinyint,
	@IsPositive		bit,
	@idoc			int, 
	@ConstraintLastModified	datetime,
	@ReturnCode		int OutPut
)
As
Begin

	Declare @LastModified 	datetime
	
	Set @LastModified = (select LastModified From Hws_Constraints Where ConstraintID=@ConstraintID)
	
	if @LastModified is not null
	 Begin
		Declare @ClauseRelationID 	uniqueidentifier
		Declare @AdapterID 		uniqueidentifier
		Declare @PropertyID 		uniqueidentifier
		Declare @GroupID 		uniqueidentifier
		Declare @PropertyType 		int
		Declare @Operator 		int
		Declare @ClauseType 		tinyint
		Declare @NumValues 		int
		Declare @XPath 			nvarchar(256)
		Declare @GroupName 		nvarchar(256)
		Declare @GroupDescription	nvarchar(256)
		Declare @IsClauseInserted 	bit
		Declare @ShouldFetchNext 	bit
		Declare @AllowAll		bit
		Declare @RetClauseID 		uniqueidentifier
		Declare @ClauseLastModified	datetime
		Declare @TimeDifference		int
		Declare @SourceCount		int
		Declare @TargetCount		int
		Declare @ClauseCount		int
		
		set @TimeDifference = DateDiff(Second, @LastModified, @ConstraintLastModified)
		
		if @TimeDifference > 1 Or @TimeDifference < -1
		 Begin
			Set @ReturnCode = 2 -- the constraint has been modified by another process so the data is dirty
			Return 0
		 End
		
		/*
			jdwest 2/26/2003
			Refined transaction handling
		*/
		DECLARE @LocalTran 						bit
			,@Ret							int
			,@LocalRet						int
			,@Error							int
			,@Rowcount						int
			,@ErrorDesc						nvarchar(200)

		declare @localized_string_CursorOpenFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_CursorOpenFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed opening cursor'

		declare @localized_string_CursorFetchFailed_sp_InternalModifyConstraint nvarchar(100)		
		set @localized_string_CursorFetchFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed fetching from cursor'

		declare @localized_string_Hws_ConstraintClauseInsFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintClauseInsFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed inserting into Hws_ConstraintClause'

		declare @localized_string_Hws_ConstraintClauseUpdFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintClauseUpdFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed updating Hws_ConstraintClause'

		declare @localized_string_Hws_ConstraintClauseDelFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintClauseDelFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed deleting Hws_ConstraintClause'

		declare @localized_string_sp_AddClauseFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_sp_AddClauseFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed executing sp_AddClause'

		declare @localized_string_Hws_ConstraintClauseRelInsFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintClauseRelInsFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed inserting into Hws_ConstraintClauseRel'

		declare @localized_string_Hws_ConstraintClauseRelUpdFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintClauseRelUpdFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed updating Hws_ConstraintClauseRel'

		declare @localized_string_Hws_ConstraintClauseRelDelFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintClauseRelDelFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed deleting Hws_ConstraintClauseRel'

		declare @localized_string_Hws_ConstraintGroupsDelFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintGroupsDelFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed deleting Hws_ConstraintGroupsDel'

		declare @localized_string_Hws_ConstraintGroupsInsFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintGroupsInsFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed inserting into Hws_ConstraintGroups'

		declare @localized_string_Hws_ConstraintUpdFailed_sp_InternalModifyConstraint nvarchar(100)
		set @localized_string_Hws_ConstraintUpdFailed_sp_InternalModifyConstraint = N'Hws_InternalModifyConstraint failed updating Hws_Constraint'
	
		declare @localized_string_Hws_InvalidNumberOfClauses_sp_InternalModifyConstraint nvarchar(200)
		set @localized_string_Hws_InvalidNumberOfClauses_sp_InternalModifyConstraint = N'The procedure Hws_InternalModifyConstraint failed.  The constraint must have at least 1 source and 1 target clause.'
			
		declare @localized_string_Hws_InvalidClauseID_sp_InternalModifyConstraint nvarchar(200)
		set @localized_string_Hws_InvalidClauseID_sp_InternalModifyConstraint = N'The procedure Hws_InternalModifyConstraint failed.  There is a clause in the constraint with an invalid clauseID.'
			
		IF @@TRANCOUNT = 0
 		 BEGIN	
			SET @LocalTran = 1
			BEGIN TRANSACTION
		 END
		ELSE
		 BEGIN
			SET @LocalTran = 0
		 END
		
		
		-- add the new clauses
		Declare NewClauseCursor Cursor For SELECT ClauseRelationID, AdapterID, PropertyID, PropertyType, Operator, 
							ClauseType, NumValues, XPath
							From OPENXML (@idoc, '/Root/Constraint/Clause',1) 
							WITH (ClauseRelationID uniqueidentifier, AdapterID uniqueidentifier, PropertyID uniqueidentifier, 
							PropertyType int, Operator int,	ClauseType tinyint, NumValues int, XPath nvarchar(256), 
							IsNew bit, ConstraintID uniqueidentifier '../@ConstraintID')
							Where ConstraintID = @ConstraintID And IsNew=1
		
		Open NewClauseCursor
		
		IF @@ERROR <> 0
		 BEGIN
			SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END
		
		FETCH NEXT FROM NewClauseCursor INTO @ClauseRelationID, @AdapterID, @PropertyID, @PropertyType, @Operator, @ClauseType, @NumValues, @XPath
		
		
		IF @@ERROR <> 0
		 BEGIN
			CLOSE NewClauseCursor
			DEALLOCATE NewClauseCursor
			
			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END
		
		Set @IsClauseInserted = 0
	Set @ShouldFetchNext = 0

	-- loop for each clause
	WHILE @@FETCH_STATUS = 0
	 BEGIN
		if (@IsClauseInserted = 0)
		Begin
		if @NumValues > 0
                   Begin
			Insert [dbo].[Hws_ConstraintClause] (ConstraintClauseRelID, ConstraintID, AllowAll, ClauseType, XPath) 
				         Values (@ClauseRelationID, @ConstraintID, 0, @ClauseType, @XPath) 
	           End
                Else
		   Begin
			Insert [dbo].[Hws_ConstraintClause] (ConstraintClauseRelID, ConstraintID, AllowAll, ClauseType, XPath) 
				         Values (@ClauseRelationID, @ConstraintID, 1, @ClauseType, @XPath) 
	           End
				
		IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
		 BEGIN
			CLOSE ClauseCursor
			DEALLOCATE ClauseCursor
			
			SET @ErrorDesc = @localized_string_Hws_ConstraintClauseInsFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END
		
		Set @IsClauseInserted = 1
		End

		If @NumValues > 0
		 Begin
			-- call helper function to add the clause
			Execute @LocalRet = sp_AddClause @ConstraintID, @ClauseRelationID, @AdapterID, @PropertyID, @NumValues, @PropertyType, @Operator, @idoc, @RetClauseID OutPut, @LastModified OutPut

			IF @@ERROR <> 0 OR @LocalRet <> 0
			 BEGIN
				CLOSE ClauseCursor
				DEALLOCATE ClauseCursor
		
				SET @ErrorDesc = @localized_string_sp_AddClauseFailed_sp_InternalModifyConstraint
				GOTO ROLLBACKTRAN
			 END

			Update [dbo].[Hws_ConstraintClause] Set ClauseID=@RetClauseID Where ConstraintClauseRelID=@ClauseRelationID And 
			Exists(Select ClauseID From [dbo].[Hws_Clauses] Where ClauseID=@RetClauseID And LastModified=@LastModified)

			if (@@RowCount <> 0)
				Set @ShouldFetchNext = 1

			IF @@ERROR <> 0 OR @LocalRet <> 0
			 BEGIN
				CLOSE ClauseCursor
				DEALLOCATE ClauseCursor
		
				SET @ErrorDesc = @localized_string_sp_AddClauseFailed_sp_InternalModifyConstraint
				GOTO ROLLBACKTRAN
			 END
		End
		Else
		Begin
		 	Set @ShouldFetchNext = 1
		End
		
		if (@ShouldFetchNext = 1)
		Begin
		-- This is executed as long as the previous fetch succeeds.
		-- only fetch the next row if this relation has been recorded
		FETCH NEXT FROM NewClauseCursor INTO @ClauseRelationID, @AdapterID, @PropertyID, @PropertyType, @Operator, @ClauseType, @NumValues, @XPath

		IF @@ERROR <> 0
		 BEGIN
			CLOSE NewClauseCursor
			DEALLOCATE NewClauseCursor
		
			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END

		Set @ShouldFetchNext = 0
		Set @IsClauseInserted = 0
		End
	END
		
		Close NewClauseCursor
		DeAllocate NewClauseCursor
		

		-- *********************************************************************************************************
		-- for the modified clauses
		Declare ModifiedClauseCursor Cursor For SELECT ClauseRelationID, AdapterID, PropertyID, PropertyType, Operator, 
						ClauseType, NumValues, XPath
						From OPENXML (@idoc, '/Root/Constraint/Clause',1) 
						WITH (ClauseRelationID uniqueidentifier, AdapterID uniqueidentifier, PropertyID uniqueidentifier, 
						PropertyType int, Operator int,	ClauseType tinyint, NumValues int, XPath nvarchar(256), 
						IsModified bit, ConstraintID uniqueidentifier '../@ConstraintID')
						Where ConstraintID = @ConstraintID And IsModified=1
		
		Open ModifiedClauseCursor
		
		IF @@ERROR <> 0
		 BEGIN
			SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN		
		 END
		
		FETCH NEXT FROM ModifiedClauseCursor INTO @ClauseRelationID, @AdapterID, @PropertyID, @PropertyType, @Operator, @ClauseType, @NumValues, @XPath
		
		IF @@ERROR <> 0
		 BEGIN
			CLOSE ModifiedClauseCursor
			DEALLOCATE ModifiedClauseCursor
			
			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN		
		 END
		
		WHILE @@FETCH_STATUS = 0
		 BEGIN		
		 
		    -- check to see if the constraintClauseID is really present in the database
			set @ClauseCount = (Select count(*) From [dbo].[Hws_ConstraintClause] Where ConstraintClauseRelID=@ClauseRelationID)
			
			If @ClauseCount=0
			Begin
				SET @ErrorDesc = @localized_string_Hws_InvalidClauseID_sp_InternalModifyConstraint
				GOTO ROLLBACKTRAN
			End
			
			If @NumValues = 0
			 Begin
				-- this means the clause is allow all
				-- update the relation if the clause has not been modified by someone else
				Update [dbo].[Hws_ConstraintClause] Set AllowAll=1, ClauseType=@ClauseType, ClauseID=null, XPath=@XPath Where ConstraintClauseRelID=@ClauseRelationID 
				/*
					jdwest 3/4/2003
					Now that error handling has been added we
					need to save the affected rowcount for use below
				*/
				SELECT @Error = @@ERROR
					,@Rowcount = @@ROWCOUNT
				
				IF @Error <> 0
				 BEGIN
					CLOSE ModifiedClauseCursor
					DEALLOCATE ModifiedClauseCursor
					
					SET @ErrorDesc = @localized_string_Hws_ConstraintClauseUpdFailed_sp_InternalModifyConstraint
					GOTO ROLLBACKTRAN		
		 		 END
			 End 
			Else
			 Begin
				-- call helper function to add the clause
				Execute @LocalRet = sp_AddClause @ConstraintID, @ClauseRelationID, @AdapterID, @PropertyID, @NumValues, @PropertyType, @Operator, @idoc, @RetClauseID OutPut, @ClauseLastModified OutPut
				
				IF @@ERROR <> 0 OR @LocalRet <> 0
				 BEGIN
					CLOSE ModifiedClauseCursor
					DEALLOCATE ModifiedClauseCursor
					
					SET @ErrorDesc = @localized_string_sp_AddClauseFailed_sp_InternalModifyConstraint
					GOTO ROLLBACKTRAN		
				 END
								
				-- update the relation if the clause has not been modified by someone else
				Update [dbo].[Hws_ConstraintClause] Set AllowAll=0, ClauseType=@ClauseType, ClauseID=@RetClauseID ,XPath=@XPath Where ConstraintClauseRelID=@ClauseRelationID And 
				Exists(Select ClauseID From [dbo].[Hws_Clauses] Where ClauseID=@RetClauseID And LastModified=@ClauseLastModified)
				
				SELECT @Error = @@ERROR
				,@Rowcount = @@ROWCOUNT
				
				IF @Error <> 0
				 BEGIN
					CLOSE ModifiedClauseCursor
					DEALLOCATE ModifiedClauseCursor
					
					SET @ErrorDesc = @localized_string_Hws_ConstraintClauseUpdFailed_sp_InternalModifyConstraint
					GOTO ROLLBACKTRAN		
				 END
			 End
			
			-- if this clause was modified by someone else, then don't fetch the next column and try this again
			if @Rowcount=1
			 Begin
				-- only fetch the next row if this relation has been recorded
				FETCH NEXT FROM ModifiedClauseCursor INTO @ClauseRelationID, @AdapterID, @PropertyID, @PropertyType, @Operator, @ClauseType, @NumValues, @XPath
			 End
			else
			 Begin
			    	if ((Select count(*) From [dbo].[Hws_ConstraintClause] Where ConstraintClauseRelID=@ClauseRelationID) < 1)
				BEGIN
					CLOSE ModifiedClauseCursor
					DEALLOCATE ModifiedClauseCursor
					
					SET @ErrorDesc = @localized_string_Hws_ConstraintClauseUpdFailed_sp_InternalModifyConstraint
					GOTO ROLLBACKTRAN		
				 END
			 End
		 END
		
		Close ModifiedClauseCursor
		DeAllocate ModifiedClauseCursor
		
		Delete From [dbo].[Hws_ConstraintGroups] Where ConstraintID=@ConstraintID
		
		IF @@ERROR <> 0
		 BEGIN
			SET @ErrorDesc = @localized_string_Hws_ConstraintGroupsDelFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END
		
		Declare GroupCursor Cursor For SELECT XPath, GroupName, GroupDescription
						From OPENXML (@idoc, '/Root/Constraint/Group',1) 
						WITH (XPath nvarchar(256), GroupName nvarchar(256), GroupDescription nvarchar(256), ConstraintID uniqueidentifier '../@ConstraintID')
						Where ConstraintID = @ConstraintID
		
		-- open and try to fetch in the first clause
		Open GroupCursor
		
		IF @@ERROR <> 0
		 BEGIN
			SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END
		
		FETCH NEXT FROM GroupCursor INTO @XPath, @GroupName, @GroupDescription
		
		IF @@ERROR <> 0
		 BEGIN
			CLOSE GroupCursor
			DEALLOCATE GroupCursor
			
			SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END
		
		-- loop for each clause
		WHILE @@FETCH_STATUS = 0
		 BEGIN
			Insert [dbo].[Hws_ConstraintGroups] (ConstraintID, GroupName, GroupDescription, XPath) Values (@ConstraintID, @GroupName, @GroupDescription, @XPath)
			
			IF @@ERROR <> 0
			 BEGIN
				CLOSE GroupCursor
				DEALLOCATE GroupCursor
				
				SET @ErrorDesc = @localized_string_Hws_ConstraintGroupsInsFailed_sp_InternalModifyConstraint
				GOTO ROLLBACKTRAN
			 END
			
			FETCH NEXT FROM GroupCursor INTO @XPath, @GroupName, @GroupDescription
			
			IF @@ERROR <> 0
			 BEGIN
				CLOSE GroupCursor
				DEALLOCATE GroupCursor
				
				SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_InternalModifyConstraint
				GOTO ROLLBACKTRAN
			 END
		END
		
		-- close and deallocate cursor
		Close GroupCursor
		DeAllocate GroupCursor
		
		-- delete the relations which are not present (this means teh relation was deleted within this constraint)
		Delete From [dbo].[Hws_ConstraintClause] Where ConstraintID=@ConstraintID And ConstraintClauseRelID Not In 
				(SELECT ClauseRelationID From OPENXML (@idoc, '/Root/Constraint/Clause',1) 
				WITH (ClauseRelationID uniqueidentifier, ConstraintID uniqueidentifier '../@ConstraintID')
				Where ConstraintID = @ConstraintID)
		
		IF @@ERROR <> 0
		 BEGIN
			SET @ErrorDesc = @localized_string_Hws_ConstraintClauseDelFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END
		
		-- Check to see that the constraint has at least 1 source and 1 target clause (bug 59219)
		Set @SourceCount = (Select count(*) From [dbo].[Hws_ConstraintClause] Where ConstraintID=@ConstraintID And
								ClauseType=0)
		
		Set @TargetCount = (Select count(*) From [dbo].[Hws_ConstraintClause] Where ConstraintID=@ConstraintID And
								ClauseType=2)
								
		if (@SourceCount = 0 Or @TargetCount = 0)
		BEGIN
			SET @ErrorDesc = @localized_string_Hws_InvalidNumberOfClauses_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		END
		
		-- Update ConstraintInformation
		Update [dbo].[Hws_Constraints] Set ActionID=@ActionID, ActivityModelID=@ActivityModelID, 
		ConstraintType=@ConstraintType, IsPositive=@IsPositive, LastModified=GETUTCDATE() 
		Where ConstraintID=@ConstraintID And (datediff(second, LastModified, @ConstraintLastModified) < 2 Or
							datediff(second, LastModified, @ConstraintLastModified) > -2)
		
		SELECT 	@Error = @@ERROR
			,@Rowcount = @@ROWCOUNT
		
		IF @@ERROR <> 0
		 BEGIN
			SET @ErrorDesc = @localized_string_Hws_ConstraintUpdFailed_sp_InternalModifyConstraint
			GOTO ROLLBACKTRAN
		 END
		
		Delete From [dbo].[Hws_Clauses] Where ClauseID Not In (Select ClauseID From [dbo].[Hws_ConstraintClause] Where ClauseID Is Not null)
				
		If @Rowcount=0
			Set @ReturnCode=3
		Else
			-- Execute sp_RetrieveConstraint @ConstraintID
			Set @ReturnCode=0  -- success, everything worked
	 End
	Else
		Set @ReturnCode=1 -- trying to modify a constraint that does not exist in the database
	
	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	RAISERROR( @ErrorDesc, 16, -1 )
	SET @Ret = -1
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:
	RETURN @Ret

END


GO
grant execute on [dbo].[sp_InternalModifyConstraint] to HWS_ADMIN_USER
GO



/****** Object:  Stored Procedure dbo.sp_AddConstraint    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_AddConstraint    Script Date: 1/30/2003 6:07:43 PM ******/
CREATE PROCEDURE dbo.sp_AddConstraint
(
	@ConstraintID 		uniqueidentifier,
	@ActionID		uniqueidentifier,
	@ActivityModelID		uniqueidentifier,
	@ConstraintType		tinyint,
	@IsPositive		bit,
	@ConstraintXML		ntext
)
As 
Begin

   Declare @idoc int
   
   --  prepare the xml document
   EXEC sp_xml_preparedocument @idoc OUTPUT, @ConstraintXML

   -- call helper method 
   Execute sp_InternalAddConstraint @ConstraintID, @ActionID, @ActivityModelID, null, @ConstraintType, null, @IsPositive, @idoc

   -- remove the xmldocument
   Execute sp_xml_removedocument @idoc

   -- retrieve the constraint for output
   -- Execute sp_RetrieveConstraint @ConstraintID
End 



GO
grant execute on [dbo].[sp_AddConstraint] to HWS_ADMIN_USER
GO

CREATE PROCEDURE dbo.sp_SetHwsConstraints
(
	@ActivityModelID uniqueidentifier,
	@ConstraintXML nText
)
As
BEGIN	

	DECLARE @LocalTran 						bit
		,@Ret							int
		,@LocalRet						int
		,@Error							int
		,@Rowcount						int
		,@ErrorDesc						nvarchar(100)
	
	declare @localized_string_CursorOpenFailed_sp_SetHwsConstraints nvarchar(100)
	set @localized_string_CursorOpenFailed_sp_SetHwsConstraints = N'sp_SetHwsConstraints failed opening cursor'

	declare @localized_string_CursorFetchFailed_sp_SetHwsConstraints nvarchar(100)
	set @localized_string_CursorFetchFailed_sp_SetHwsConstraints = N'sp_SetHwsConstraints failed fetching from cursor'

	declare @localized_string_Hws_ConstraintInsFailed_sp_SetHwsConstraints nvarchar(100)
	set @localized_string_Hws_ConstraintInsFailed_sp_SetHwsConstraints = N'sp_SetHwsConstraints failed inserting into Hws_Constraints'

	declare @localized_string_Hws_RemovedOldConstraintsFailed_sp_SetHwsConstraints nvarchar(100)
	set @localized_string_Hws_RemovedOldConstraintsFailed_sp_SetHwsConstraints = N'sp_SetHwsConstraints failed removing existing constraints'

	declare @localized_string_sp_InternalAddConstraint_sp_SetHwsConstraints nvarchar(100)
	set @localized_string_sp_InternalAddConstraint_sp_SetHwsConstraints = N'sp_SetHwsConstraints failed calling InternalAddConstraint'

	declare @localized_string_Hws_ConstraintClauseRelUpdFailed_sp_SetHwsConstraints nvarchar(100)
	set @localized_string_Hws_ConstraintClauseRelUpdFailed_sp_SetHwsConstraints = N'sp_SetHwsConstraints failed updating Hws_ConstraintRelClause'

	declare @localized_string_Hws_ConstraintGroupsInsFailed_sp_SetHwsConstraints nvarchar(100)
	set @localized_string_Hws_ConstraintGroupsInsFailed_sp_SetHwsConstraints = N'sp_SetHwsConstraints failed inserting into Hws_ConstraintGroups'

	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

Declare @ConstraintID uniqueidentifier
Declare @ActionID uniqueidentifier
Declare @ActivityModelStep int
Declare @ConstraintType tinyint
Declare @ActivityModelRoleID uniqueidentifier
Declare @IsPositive bit
Declare @idoc int
   
--  prepare the xml document
EXEC sp_xml_preparedocument @idoc OUTPUT, @ConstraintXML

-- delete the existing constraint for this ActivityModel
Delete From [dbo].[Hws_Constraints] Where ActivityModelID = @ActivityModelID

IF @@ERROR <> 0
BEGIN
	SET @ErrorDesc = @localized_string_Hws_RemovedOldConstraintsFailed_sp_SetHwsConstraints
	GOTO ROLLBACKTRAN
END


-- set each constraint in the ActivityModel
Declare ConstraintCursor Cursor For SELECT ConstraintID, Action, ActivityModelStepID, ConstraintType, ActivityModelRoleID, IsPositive
					From OPENXML (@idoc, '/Root/Constraint',1) 
					WITH (ConstraintID uniqueidentifier, Action uniqueidentifier, ActivityModelStepID int, 
							ConstraintType tinyint, ActivityModelRoleID uniqueidentifier, IsPositive bit)




Open ConstraintCursor

IF @@ERROR <> 0
BEGIN
	SET @ErrorDesc = @localized_string_CursorOpenFailed_sp_SetHwsConstraints
	GOTO ROLLBACKTRAN
END

FETCH NEXT FROM ConstraintCursor INTO @ConstraintID, @ActionID, @ActivityModelStep, @ConstraintType, @ActivityModelRoleID, @IsPositive

IF @@ERROR <> 0
 BEGIN
	CLOSE ConstraintCursor
	DEALLOCATE ConstraintCursor

	SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_SetHwsConstraints
	GOTO ROLLBACKTRAN
 END



WHILE @@FETCH_STATUS = 0
 BEGIN
	-- call helper method 
   	Execute sp_InternalAddConstraint @ConstraintID, @ActionID, @ActivityModelID, @ActivityModelStep, @ConstraintType, @ActivityModelRoleID, @IsPositive, @idoc

	IF @@ERROR <> 0
	 BEGIN
		CLOSE ConstraintCursor
		DEALLOCATE ConstraintCursor
		
		SET @ErrorDesc = @localized_string_sp_InternalAddConstraint_sp_SetHwsConstraints
		GOTO ROLLBACKTRAN
	 END

	FETCH NEXT FROM ConstraintCursor INTO @ConstraintID, @ActionID, @ActivityModelStep, @ConstraintType, @ActivityModelRoleID, @IsPositive

	IF @@ERROR <> 0
	 BEGIN
		CLOSE ConstraintCursor
		DEALLOCATE ConstraintCursor
		
		SET @ErrorDesc = @localized_string_CursorFetchFailed_sp_SetHwsConstraints
		GOTO ROLLBACKTRAN
	 END
 End
	
	-- close and deallocate cursor
	CLOSE ConstraintCursor
	DEALLOCATE ConstraintCursor

	
	GOTO COMMITTRAN

ROLLBACKTRAN:
	
	IF @LocalTran = 1 AND @@TRANCOUNT > 0 -- check again in case we got an error that rollback for us
		ROLLBACK TRANSACTION

	RAISERROR( @ErrorDesc, 16, -1 )
	SET @Ret = -1
	GOTO DONE

COMMITTRAN:

	IF @LocalTran = 1
		COMMIT TRANSACTION

	SET @Ret = 0
	GOTO DONE

DONE:

	RETURN @Ret

End


GO
grant execute on [dbo].[sp_SetHwsConstraints] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[sp_SetHwsConstraints] to HWS_AM_DESIGNER
GO

/****** Object:  Stored Procedure dbo.sp_ModifyConstraint    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Stored Procedure dbo.sp_ModifyConstraint    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE PROCEDURE dbo.sp_ModifyConstraint
(
	@ConstraintID 		uniqueidentifier,
	@ActionID		uniqueidentifier,
	@ActivityModelID		uniqueidentifier,
	@ConstraintType		tinyint,
	@IsPositive		bit,
	@ConstraintXML		ntext, 
	@LastModifiedDate	datetime,
	@ReturnCode		int OutPut
)
As
Begin
   Declare @idoc int
   EXEC sp_xml_preparedocument @idoc OUTPUT, @ConstraintXML

   Exec sp_InternalModifyConstraint @ConstraintID, @ActionID, @ActivityModelID, @ConstraintType, @IsPositive, 
		@idoc, @LastModifiedDate, @ReturnCode OutPut

   EXEC sp_xml_removedocument @idoc
End



GO
grant execute on [dbo].[sp_ModifyConstraint] to HWS_ADMIN_USER
GO

/****** Object:  Trigger dbo.UpdateAdapterInfo    Script Date: 2/16/2003 2:28:20 PM ******/
/****** Object:  Trigger dbo.UpdateAdapterInfo    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER [UpdateAdapterInfo] ON [dbo].[Hws_Adapters] 
FOR INSERT, UPDATE, DELETE 
AS
Update Hws_MostRecentModification set MostRecentModification=GETUTCDATE()


GO


/****** Object:  Trigger dbo.DeleteClauseValues    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Trigger dbo.DeleteClauseValues    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER [DeleteClauseValues] ON [dbo].[Hws_Adapters] 
FOR DELETE 
AS
BEGIN
	Declare @AdapterID uniqueidentifier
	declare @clauseIDs table(clauseID uniqueidentifier)

	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_Hws_Adapters nvarchar(100)
	set @localized_string_CursorOpenFailed_Hws_Adapters = N'DeleteClauseValues failed opening cursor'

	declare @localized_string_CursorFetchFailed_Hws_Adapters nvarchar(100)
	set @localized_string_CursorFetchFailed_Hws_Adapters = N'DeleteClauseValues failed fetching from cursor'

	declare @localized_string_PropertyIdsInsFailed_Hws_Adapters nvarchar(100)
	set @localized_string_PropertyIdsInsFailed_Hws_Adapters = N'DeleteClauseValues failed inserting into @PropertyIds'

	declare @localized_string_ClauseIdsInsFailed_Hws_Adapters nvarchar(100)
	set @localized_string_ClauseIdsInsFailed_Hws_Adapters = N'DeleteClauseValues failed inserting into @clauseIDs'

	declare @localized_string_Hws_ConstraintsDelFailed_Hws_Adapters nvarchar(100)
	set @localized_string_Hws_ConstraintsDelFailed_Hws_Adapters = N'DeleteClauseValues failed deleting from Hws_Constraints'

	declare @localized_string_Hws_RemovedEntitiesInsFailed_Hws_Adapters nvarchar(100)
	set @localized_string_Hws_RemovedEntitiesInsFailed_Hws_Adapters = N'DeleteClauseValues failed inserting into Hws_RemovedEntities'
	
	Declare adapterCursor Cursor For SELECT AdapterID from deleted

	Open adapterCursor

	IF @@ERROR <> 0
	 BEGIN
		SELECT	@ErrorDesc = @localized_string_CursorOpenFailed_Hws_Adapters
		GOTO ERROR
	 END

	FETCH NEXT FROM adapterCursor INTO @AdapterID

	IF @@ERROR <> 0
	 BEGIN
		CLOSE AdapterCursor
		DEALLOCATE AdapterCursor

		SELECT	@ErrorDesc = @localized_string_CursorFetchFailed_Hws_Adapters
		GOTO ERROR
	 END

	-- loop for each clause
	WHILE @@FETCH_STATUS = 0
	 BEGIN
		

		insert @clauseIDs select distinct A.ClauseID From Hws_Clauses A Where A.AdapterID=@AdapterID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE AdapterCursor
			DEALLOCATE AdapterCursor
	
			SELECT	@ErrorDesc = @localized_string_ClauseIdsInsFailed_Hws_Adapters
			GOTO ERROR
		 END

		insert @clauseIDs select distinct A.ClauseID From Hws_ClauseValues A Where A.AdapterID=@AdapterID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE AdapterCursor
			DEALLOCATE AdapterCursor
	
			SELECT	@ErrorDesc = @localized_string_ClauseIdsInsFailed_Hws_Adapters
			GOTO ERROR
		 END

		Delete From [dbo].[Hws_Constraints] Where ConstraintID in (select B.ConstraintID From Hws_ConstraintClause B Where B.ClauseID in (select clauseID from @clauseIDs))

		IF @@ERROR <> 0
		 BEGIN
			CLOSE AdapterCursor
			DEALLOCATE AdapterCursor
	
			SELECT	@ErrorDesc = @localized_string_Hws_ConstraintsDelFailed_Hws_Adapters
			GOTO ERROR
		 END

		Delete From [dbo].[Hws_Clauses] Where ClauseID in (select clauseID from @clauseIDs)

		IF @@ERROR <> 0
		 BEGIN
			CLOSE AdapterCursor
			DEALLOCATE AdapterCursor
	
			SELECT	@ErrorDesc = @localized_string_Hws_ConstraintsDelFailed_Hws_Adapters
			GOTO ERROR
		 END

		insert [dbo].[Hws_RemovedEntities] (AdapterID, LastModified) values (@AdapterID, GETUTCDATE())

		IF @@ERROR <> 0
		 BEGIN
			CLOSE AdapterCursor
			DEALLOCATE AdapterCursor
	
			SELECT	@ErrorDesc = @localized_string_Hws_RemovedEntitiesInsFailed_Hws_Adapters
			GOTO ERROR
		 END

		FETCH NEXT FROM adapterCursor INTO @AdapterID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE AdapterCursor
			DEALLOCATE AdapterCursor
	
			SELECT	@ErrorDesc = @localized_string_CursorFetchFailed_Hws_Adapters
			GOTO ERROR
		 END
	 End
	
	Close adapterCursor
	DeAllocate adapterCursor

	GOTO DONE
	
ERROR:
	RAISERROR( @ErrorDesc, 16, -1 )


DONE:

END



GO


/****** Object:  Trigger dbo.UpdateActionLastModifiedTable    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Trigger dbo.UpdateActionLastModifiedTable    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER UpdateActionLastModifiedTable ON [dbo].[Hws_Actions] 
FOR INSERT, UPDATE, DELETE 
AS
Update [dbo].[Hws_MostRecentModification] Set MostRecentModification=(GETUTCDATE())


GO

/****** Object:  Trigger dbo.Hws_TriggerDeleteAction    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Trigger dbo.Hws_TriggerDeleteAction    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER Hws_TriggerDeleteAction
ON dbo.Hws_Actions
FOR DELETE 
AS
BEGIN

	/*
		jdwest 2/26/2003
		Refined transaction handling
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_Hws_TriggerDeleteAction nvarchar(100)
	set @localized_string_CursorOpenFailed_Hws_TriggerDeleteAction = N'Hws_TriggerDeleteAction failed opening cursor'

	declare @localized_string_CursorFetchFailed_Hws_TriggerDeleteAction nvarchar(100)
	set @localized_string_CursorFetchFailed_Hws_TriggerDeleteAction = N'Hws_TriggerDeleteAction failed fetching from cursor'

	declare @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteAction nvarchar(100)
	set @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteAction = N'Hws_TriggerDeleteAction failed inserting into Hws_RemovedEntities'

	Declare @ActionID uniqueidentifier
	Declare ActionCursor Cursor For SELECT ActionID from deleted

	Open ActionCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_Hws_TriggerDeleteAction
		GOTO ERROR
	 END

	FETCH NEXT FROM ActionCursor INTO @ActionID

	IF @@ERROR <> 0
	 BEGIN
		CLOSE ActionCursor
		DEALLOCATE ActionCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_TriggerDeleteAction
		GOTO ERROR
	 END


	WHILE @@FETCH_STATUS = 0
	 Begin
		insert [dbo].[Hws_RemovedEntities] (ActionID, LastModified) values (@ActionID, GETUTCDATE())

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ActionCursor
			DEALLOCATE ActionCursor
	
			SET @ErrorDesc = @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteAction
			GOTO ERROR
		 END

		FETCH NEXT FROM ActionCursor INTO @ActionID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ActionCursor
			DEALLOCATE ActionCursor
	
			SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_TriggerDeleteAction
			GOTO ERROR
		 END
	 End
	
	CLOSE ActionCursor
	DEALLOCATE ActionCursor

	GOTO DONE
	
ERROR:
	RAISERROR( @ErrorDesc, 16, -1 )

DONE:

END

GO


/****** Object:  Trigger dbo.UpdateMostRecentModification    Script Date: 2/16/2003 2:28:20 PM ******/
/****** Object:  Trigger dbo.UpdateMostRecentModification    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER [UpdateMostRecentModification] ON dbo.Hws_RemovedEntities 
FOR INSERT 
AS
Update [dbo].[Hws_MostRecentModification] Set MostRecentModification=(GETUTCDATE())

GO


/****** Object:  Trigger dbo.DeleteUnreferenceObjects    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Trigger dbo.DeleteUnreferenceObjects    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER [DeleteUnreferenceObjects] ON [dbo].[Hws_AdapterObjectRel] 
FOR DELETE 
AS

BEGIN

	/*
		jdwest 2/26/2003
		Refined error handling
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_Hws_AdapterObjectRel nvarchar(100)
	set @localized_string_CursorOpenFailed_Hws_AdapterObjectRel = N'DeleteUnreferenceObjects failed opening cursor'

	declare @localized_string_CursorFetchFailed_Hws_AdapterObjectRel nvarchar(100)
	set @localized_string_CursorFetchFailed_Hws_AdapterObjectRel = N'DeleteUnreferenceObjects failed fetching from cursor'

	declare @localized_string_Hws_ObjectsDelFailed_Hws_AdapterObjectRel nvarchar(100)
	set @localized_string_Hws_ObjectsDelFailed_Hws_AdapterObjectRel = N'DeleteUnreferenceObjects failed deleting from Hws_Objects'

	Declare @ObjectID uniqueidentifier
	Declare ObjectCursor Cursor For Select ObjectID From deleted

	Open ObjectCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_Hws_AdapterObjectRel
		GOTO ERROR
	 END

	FETCH NEXT FROM ObjectCursor INTO @ObjectID

	IF @@ERROR <> 0
	 BEGIN
		CLOSE ObjectCursor
		DEALLOCATE ObjectCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_AdapterObjectRel
		GOTO ERROR
	 END
	   
	WHILE @@FETCH_STATUS = 0
	BEGIN
		Delete From [dbo].[Hws_Objects] Where ObjectID=@ObjectID And (Select Count(*) From 
			[dbo].[Hws_AdapterObjectRel] Where ObjectID=@ObjectID)=0

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ObjectCursor
			DEALLOCATE ObjectCursor
	
			SET @ErrorDesc = @localized_string_Hws_ObjectsDelFailed_Hws_AdapterObjectRel
			GOTO ERROR
		 END
		
		FETCH NEXT FROM ObjectCursor INTO @ObjectID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ObjectCursor
			DEALLOCATE ObjectCursor
	
			SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_AdapterObjectRel
			GOTO ERROR
		 END
	End
	
	Close ObjectCursor
	DeAllocate ObjectCursor

	GOTO DONE
	
ERROR:
	RAISERROR( @ErrorDesc, 16, -1 )

DONE:


END

GO


/****** Object:  Trigger dbo.Hws_TriggerDeleteConstraint    Script Date: 2/16/2003 2:28:20 PM ******/

CREATE TRIGGER dbo.Hws_TriggerDeleteConstraint
ON dbo.Hws_Constraints
FOR DELETE 
AS
  Begin
	Declare @ConstraintID uniqueidentifier
	Declare @ActionID uniqueidentifier
	Declare @ActivityModelID uniqueidentifier
	Declare @ActivityModelStepID int
	Declare @ConstraintType tinyint
	Declare @IsPositive bit
	Declare ConstraintCursor Cursor For select ConstraintID, ActionID, ActivityModelID, ActivityModelStepID, ConstraintType, IsPositive From deleted

	/*
		jdwest 2/26/2003
		Refined error handling
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_Hws_TriggerDeleteConstraint nvarchar(100)
	set @localized_string_CursorOpenFailed_Hws_TriggerDeleteConstraint = N'Hws_TriggerDeleteConstraint failed opening cursor'

	declare @localized_string_CursorFetchFailed_Hws_TriggerDeleteConstraint nvarchar(100)
	set @localized_string_CursorFetchFailed_Hws_TriggerDeleteConstraint = N'Hws_TriggerDeleteConstraint failed fetching from cursor'

	declare @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteConstraint nvarchar(100)
	set @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteConstraint = N'Hws_TriggerDeleteConstraint failed inserting into Hws_RemovedEntities'

	-- open and try to fetch in the first clause
	Open ConstraintCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_Hws_TriggerDeleteConstraint
		GOTO ERROR
	 END

	FETCH NEXT FROM ConstraintCursor INTO @ConstraintID, @ActionID, @ActivityModelID, @ActivityModelStepID, @ConstraintType, @IsPositive

	IF @@ERROR <> 0
	 BEGIN
		CLOSE ConstraintCursor
		DEALLOCATE ConstraintCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_TriggerDeleteConstraint
		GOTO ERROR
	 END	

	-- loop for each clause
	WHILE @@FETCH_STATUS = 0
	BEGIN
		insert [dbo].[Hws_RemovedEntities] (ConstraintID, ActionID, ActivityModelID, ActivityModelStepID, ConstraintType, IsPositive, LastModified) 
			values  (@ConstraintID, @ActionID, @ActivityModelID, @ActivityModelStepID, @ConstraintType, @IsPositive, GETUTCDATE())

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ConstraintCursor
			DEALLOCATE ConstraintCursor
	
			SET @ErrorDesc = @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteConstraint
			GOTO ERROR
		 END	

		FETCH NEXT FROM ConstraintCursor INTO @ConstraintID, @ActionID, @ActivityModelID, @ActivityModelStepID, @ConstraintType, @IsPositive

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ConstraintCursor
			DEALLOCATE ConstraintCursor
	
			SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_TriggerDeleteConstraint
			GOTO ERROR
		 END	
	End
	
	Close ConstraintCursor
	DeAllocate ConstraintCursor

	GOTO DONE
	
ERROR:
	RAISERROR( @ErrorDesc, 16, -1 )

DONE:


End


GO


/****** Object:  Trigger dbo.UpdateLastModifiedTable    Script Date: 2/16/2003 2:28:20 PM ******/

/****** Object:  Trigger dbo.UpdateLastModifiedTable    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER UpdateLastModifiedTable ON [dbo].[Hws_Constraints] 
FOR INSERT, UPDATE, DELETE 
AS
Update [dbo].[Hws_MostRecentModification] Set MostRecentModification=(GETUTCDATE())



GO


/****** Object:  Trigger dbo.	    Script Date: 2/16/2003 2:28:21 PM ******/

/****** Object:  Trigger dbo.Hws_TriggerDeleteClause    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER Hws_TriggerDeleteClause
ON dbo.Hws_Clauses
FOR DELETE 
AS
BEGIN  
	Declare @ClauseID uniqueidentifier
	Declare ClauseCursor Cursor For select ClauseID From deleted

	/*
		jdwest 2/26/2003
		Refined error handling
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_Hws_TriggerDeleteClause nvarchar(100)
	set @localized_string_CursorOpenFailed_Hws_TriggerDeleteClause = N'Hws_TriggerDeleteClause failed opening cursor'

	declare @localized_string_CursorFetchFailed_Hws_TriggerDeleteClause nvarchar(100)
	set @localized_string_CursorFetchFailed_Hws_TriggerDeleteClause = N'Hws_TriggerDeleteClause failed fetching from cursor'

	declare @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteClause nvarchar(100)
	set @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteClause = N'Hws_TriggerDeleteClause failed inserting into Hws_RemovedEntities'

	-- open and try to fetch in the first clause
	Open ClauseCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_Hws_TriggerDeleteClause
		GOTO ERROR
	 END

	FETCH NEXT FROM ClauseCursor INTO @ClauseID

	IF @@ERROR <> 0
	 BEGIN
		CLOSE ClauseCursor
		DEALLOCATE ClauseCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_TriggerDeleteClause
		GOTO ERROR
	 END
	
	-- loop for each clause
	WHILE @@FETCH_STATUS = 0
	BEGIN
		insert [dbo].[Hws_RemovedEntities] (ClauseID, LastModified) values  (@ClauseID, GETUTCDATE())

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseCursor
			DEALLOCATE ClauseCursor
	
			SET @ErrorDesc = @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteClause
			GOTO ERROR
		 END

		FETCH NEXT FROM ClauseCursor INTO @ClauseID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE ClauseCursor
			DEALLOCATE ClauseCursor
	
			SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_TriggerDeleteClause
			GOTO ERROR
		 END
	End
	
	Close ClauseCursor
	DeAllocate ClauseCursor

	GOTO DONE
	
ERROR:
	RAISERROR( @ErrorDesc, 16, -1 )

DONE:

END

GO


/****** Object:  Trigger dbo.Hws_TriggerDeleteGroup    Script Date: 2/16/2003 2:28:21 PM ******/

/****** Object:  Trigger dbo.Hws_TriggerDeleteConstraint    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER dbo.Hws_TriggerDeleteGroup
ON dbo.Hws_ConstraintGroups
FOR DELETE 
AS
  Begin
	/*
		jdwest 2/26/2003
		Refined error handling
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_Hws_TriggerDeleteGroup nvarchar(100)
	set @localized_string_CursorOpenFailed_Hws_TriggerDeleteGroup = N'Hws_TriggerDeleteGroup failed opening cursor'

	declare @localized_string_CursorFetchFailed_Hws_TriggerDeleteGroup nvarchar(100)
	set @localized_string_CursorFetchFailed_Hws_TriggerDeleteGroup = N'Hws_TriggerDeleteGroup failed fetching from cursor'

	declare @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteGroup nvarchar(100)
	set @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteGroup = N'Hws_TriggerDeleteGroup failed inserting into Hws_RemovedEntities'


	Declare @GroupID uniqueidentifier
	Declare GroupCursor Cursor For select GroupID From deleted
	
	-- open and try to fetch in the first clause
	Open GroupCursor

	IF @@ERROR <> 0
	 BEGIN
		SET @ErrorDesc = @localized_string_CursorOpenFailed_Hws_TriggerDeleteGroup
		GOTO ERROR
	 END

	FETCH NEXT FROM GroupCursor INTO @GroupID

	IF @@ERROR <> 0
	 BEGIN
		CLOSE GroupCursor
		DEALLOCATE GroupCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_TriggerDeleteGroup
		GOTO ERROR
	 END
	
	-- loop for each clause
	WHILE @@FETCH_STATUS = 0
	BEGIN
		insert [dbo].[Hws_RemovedEntities] (GroupID, LastModified) values  (@GroupID, GETUTCDATE())

		IF @@ERROR <> 0
		 BEGIN
			CLOSE GroupCursor
			DEALLOCATE GroupCursor
	
			SET @ErrorDesc = @localized_string_Hws_RemovedEntitiesInsFailed_Hws_TriggerDeleteGroup
			GOTO ERROR
		 END

		FETCH NEXT FROM GroupCursor INTO @GroupID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE GroupCursor
			DEALLOCATE GroupCursor
	
			SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_TriggerDeleteGroup
			GOTO ERROR
		 END
	End
	
	Close GroupCursor
	DeAllocate GroupCursor

	GOTO DONE
	
ERROR:
	RAISERROR( @ErrorDesc, 16, -1 )

DONE:


End

GO


/****** Object:  Trigger dbo.RemoveNonReferenceClauses    Script Date: 2/16/2003 2:28:21 PM ******/

/****** Object:  Trigger dbo.RemoveNonReferenceClauses    Script Date: 1/30/2003 6:07:44 PM ******/
CREATE TRIGGER [RemoveNonReferenceClauses] ON [dbo].[Hws_ConstraintClause] 
FOR DELETE 
AS
BEGIN
	Declare @ClauseID uniqueidentifier
	Declare DeletedCursor cursor for Select ClauseID From deleted

	/*
		jdwest 2/26/2003
		Refined error handling
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_Hws_ConstraintClause nvarchar(100)
	set @localized_string_CursorOpenFailed_Hws_ConstraintClause = N'RemoveNonReferenceClauses failed opening cursor'

	declare @localized_string_CursorFetchFailed_Hws_ConstraintClause nvarchar(100)
	set @localized_string_CursorFetchFailed_Hws_ConstraintClause = N'RemoveNonReferenceClauses failed fetching from cursor'

	declare @localized_string_Hws_ClausesDelFailed_Hws_ConstraintClause nvarchar(100)
	set @localized_string_Hws_ClausesDelFailed_Hws_ConstraintClause = N'RemoveNonReferenceClauses failed deleting from Hws_Clauses'

		
	Open DeletedCursor

	IF @@ERROR <> 0
	 BEGIN
		CLOSE DeletedCursor
		DEALLOCATE DeletedCursor

		SET @ErrorDesc = @localized_string_CursorOpenFailed_Hws_ConstraintClause
		GOTO ERROR
	 END

	Fetch Next From DeletedCursor into @ClauseID

	IF @@ERROR <> 0
	 BEGIN
		CLOSE DeletedCursor
		DEALLOCATE DeletedCursor

		SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_ConstraintClause
		GOTO ERROR
	 END

	
	While @@Fetch_Status = 0
	 Begin
		Delete From [dbo].[Hws_Clauses] Where ClauseID=@ClauseID And 
		(Select count(*) From [dbo].[Hws_ConstraintClause] C Where C.ClauseID=@ClauseID) = 0

		IF @@ERROR <> 0
		 BEGIN
			CLOSE DeletedCursor
			DEALLOCATE DeletedCursor
	
			SET @ErrorDesc = @localized_string_Hws_ClausesDelFailed_Hws_ConstraintClause
			GOTO ERROR
		 END

		
		Fetch Next From DeletedCursor into @ClauseID

		IF @@ERROR <> 0
		 BEGIN
			CLOSE DeletedCursor
			DEALLOCATE DeletedCursor
	
			SET @ErrorDesc = @localized_string_CursorFetchFailed_Hws_ConstraintClause
			GOTO ERROR
		 END
	End
	
	Close DeletedCursor
	DeAllocate DeletedCursor


	GOTO DONE

ERROR:
	RAISERROR( @ErrorDesc, 16, -1 )

DONE:

END


GO


-- *********************************************************************************
-- inserting intrinsic adapter information
declare @adapterid uniqueIdentifier
declare @objectid uniqueIdentifier
Set @adapterid='{0A385380-77EB-4DFD-A3E1-9DC954643194}'
Set @objectid='{05E05D0D-BBF2-4CCB-8684-8697AC40A03B}'

declare @localized_string_IntrinsicAdapterName nvarchar(128)
declare @localized_string_IntrinsicAdapterDescription nvarchar(128)
declare @localized_string_IntrinsicAdapterObjectName nvarchar(128)
declare @localized_string_IntrinsicAdapterObjectDescription nvarchar(128)
declare @localized_string_CurrentDate nvarchar(128)
declare @localized_string_CurrentMonth nvarchar(128)
declare @localized_string_CurrentTime nvarchar(128)
declare @localized_string_DayOfWeek nvarchar(128)
declare @localized_string_UserName nvarchar(128)
declare @localized_string_CurrentDateDescription nvarchar(128)
declare @localized_string_CurrentMonthDescription nvarchar(128)
declare @localized_string_CurrentTimeDescription nvarchar(128)
declare @localized_string_DayOfWeekDescription nvarchar(128)
declare @localized_string_UserNameDescription nvarchar(128)
declare @localized_string_Observer nvarchar(128)
declare @localized_string_ObserverDescription nvarchar(128)
declare @localized_string_ObserveRight nvarchar(128)
declare @localized_string_ObserveRightDescription nvarchar(128)
declare @localized_string_Owner nvarchar(128)
declare @localized_string_OwnerDescription nvarchar(128)
declare @localized_string_OwnRight nvarchar(128)
declare @localized_string_OwnRightDescription nvarchar(128)
declare @localized_string_NotApplicable nvarchar(128)
set @localized_string_Observer = N'Observer'
set @localized_string_ObserverDescription = N'Observer'
set @localized_string_ObserveRight = N'Observe Right'
set @localized_string_ObserveRightDescription = N'Observe Right'
set @localized_string_Owner = N'Owner'
set @localized_string_OwnerDescription = N'Owner'
set @localized_string_OwnRight = N'Owner Right'
set @localized_string_OwnRightDescription = N'Owner Right'
set @localized_string_IntrinsicAdapterName = N'Intrinsic'
set @localized_string_IntrinsicAdapterDescription = N'Intrinsic Fact Retriever'
set @localized_string_IntrinsicAdapterObjectName = N'Intrinsic'
set @localized_string_IntrinsicAdapterObjectDescription = N'Intrinsic Object'
set @localized_string_CurrentDate = N'Current Date'
set @localized_string_CurrentMonth = N'Current Month'
set @localized_string_CurrentTime = N'Current Time'
set @localized_string_DayOfWeek = N'Current Day Of Week'
set @localized_string_UserName = N'User Name'
set @localized_string_CurrentDateDescription = N'The current date.'
set @localized_string_CurrentMonthDescription = N'The current month.'
set @localized_string_CurrentTimeDescription = N'The current time.'
set @localized_string_DayOfWeekDescription = N'The current day of the week.'
set @localized_string_UserNameDescription = N'The user name'
set @localized_string_NotApplicable = N'Not Applicable'


if not exists ( select 1 from [dbo].[Hws_Adapters] where [AdapterID] = @adapterid )
	insert [dbo].[Hws_Adapters] (AdapterID, Name, AssemblyName, Version, Culture, PublicKey, ConnectionInfo, TypeName, Description, IsIntrinsic) 
		values (@adapterid, @localized_string_IntrinsicAdapterName, @localized_string_NotApplicable, @localized_string_NotApplicable, @localized_string_NotApplicable, @localized_string_NotApplicable, @localized_string_NotApplicable, @localized_string_NotApplicable, @localized_string_IntrinsicAdapterDescription, 1)

if not exists ( select 1 from [dbo].[Hws_Objects] where [ObjectID] = @objectid )
	insert [dbo].[Hws_Objects] (ObjectID, Name, Description, KeyProperty, DisplayName) values (@objectid, @localized_string_IntrinsicAdapterObjectName, @localized_string_IntrinsicAdapterObjectDescription, @localized_string_NotApplicable, @localized_string_IntrinsicAdapterObjectDescription)

if not exists ( select 1 from [dbo].[Hws_AdapterObjectRel] where AdapterID = @adapterid and ObjectID = @objectid )
	insert [dbo].[Hws_AdapterObjectRel] (AdapterID, ObjectID) values (@adapterid, @objectid)

if not exists ( select 1 from [dbo].[Hws_Properties] where [PropertyID]='{10267C9F-01FC-4C80-BB01-F97E047A1041}')
	insert into [dbo].[Hws_Properties] (PropertyID, ObjectID, Name, DisplayName, Description, IsMultiValued, IsEnumerable, PropertyType, IsUsed) values 
	('{10267C9F-01FC-4C80-BB01-F97E047A1041}', @objectid, 'CurrentDate', @localized_string_CurrentDate, @localized_string_CurrentDateDescription, 0, 0, 5, 0)

if not exists ( select 1 from [dbo].[Hws_Properties] where [PropertyID]='{BC606CDA-3BCC-4201-B8B8-F3870CCCC108}' )
	insert into [dbo].[Hws_Properties] (PropertyID, ObjectID, Name, DisplayName, Description, IsMultiValued, IsEnumerable, PropertyType, IsUsed) values 
	('{BC606CDA-3BCC-4201-B8B8-F3870CCCC108}', @objectid, 'CurrentMonth', @localized_string_CurrentMonth, @localized_string_CurrentMonthDescription, 0, 1, 3, 0)

if not exists ( select 1 from [dbo].[Hws_Properties] where [PropertyID]='{E8B61041-4FE5-402E-AECC-AF33A0B53CD2}' )
	insert into [dbo].[Hws_Properties] (PropertyID, ObjectID, Name, DisplayName, Description, IsMultiValued, IsEnumerable, PropertyType, IsUsed) values 
	('{E8B61041-4FE5-402E-AECC-AF33A0B53CD2}', @objectid, 'CurrentTime', @localized_string_CurrentTime, @localized_string_CurrentTimeDescription, 0, 0, 6, 0)

if not exists ( select 1 from [dbo].[Hws_Properties] where [PropertyID]='{EF89F95B-362F-4111-A937-C29F0CD55AAA}' )
	insert into [dbo].[Hws_Properties] (PropertyID, ObjectID, Name, DisplayName, Description, IsMultiValued, IsEnumerable, PropertyType, IsUsed) values 
	('{EF89F95B-362F-4111-A937-C29F0CD55AAA}', @objectid, 'DayOfWeek', @localized_string_DayOfWeek, @localized_string_DayOfWeekDescription, 0, 1, 3, 0)

if not exists ( select 1 from [dbo].[Hws_Properties] where [PropertyID]='{D6AE92A2-BD7A-48AA-AE58-3C6C8497250D}' )
	insert into [dbo].[Hws_Properties] (PropertyID, ObjectID, Name, DisplayName, Description, IsMultiValued, IsEnumerable, PropertyType, IsUsed) values 
	('{D6AE92A2-BD7A-48AA-AE58-3C6C8497250D}', @objectid, 'IntrinsicUserName', @localized_string_UserName, @localized_string_UserNameDescription, 0, 0, 0, 0)

if not exists ( select 1 from [dbo].[Hws_MostRecentModification] )
	insert into [dbo].[Hws_MostRecentModification] (MostRecentModification) values (GETUTCDATE())

if not exists ( select 1 from [dbo].[Hws_ActivityModelRoles] where ActivityModelRoleID = '{CD5D008B-B8EC-4fff-B511-61C7E98D3EC3}')
	insert into [dbo].[Hws_ActivityModelRoles] (ActivityModelRoleID, [Name], [Description]) values ('{CD5D008B-B8EC-4fff-B511-61C7E98D3EC3}', @localized_string_Observer, @localized_string_ObserverDescription)

if not exists ( select 1 from [dbo].[Hws_ActivityModelRoles] where ActivityModelRoleID = '{AB26F848-6012-488c-B4C6-4BE6D7A311F1}' )
	insert into [dbo].[Hws_ActivityModelRoles] (ActivityModelRoleID, [Name], [Description]) values ('{AB26F848-6012-488c-B4C6-4BE6D7A311F1}', @localized_string_Owner, @localized_string_OwnerDescription)

if not exists ( select 1 from [dbo].[Hws_ActivityModelRights] where ActivityModelRightID = '{E88C1DA8-FF83-4f1d-9A0F-4FEB7DF61440}' )
	insert into [dbo].[Hws_ActivityModelRights] (ActivityModelRightID, [Name], [Description]) values ('{E88C1DA8-FF83-4f1d-9A0F-4FEB7DF61440}', @localized_string_ObserveRight, @localized_string_ObserveRightDescription)

if not exists ( select 1 from [dbo].[Hws_ActivityModelRights] where ActivityModelRightID = '{56909F1C-73BA-4c92-985E-EA9B3C8CFD3A}' )
	insert into [dbo].[Hws_ActivityModelRights] (ActivityModelRightID, [Name], [Description]) values ('{56909F1C-73BA-4c92-985E-EA9B3C8CFD3A}', @localized_string_OwnRight, @localized_string_OwnRightDescription)

if not exists ( select 1 from [dbo].[Hws_ActivityModelRoleRightsRel] where ActivityModelRoleID = '{CD5D008B-B8EC-4fff-B511-61C7E98D3EC3}' and ActivityModelRightID = '{E88C1DA8-FF83-4f1d-9A0F-4FEB7DF61440}' )
	insert into [dbo].[Hws_ActivityModelRoleRightsRel] (ActivityModelRoleID, ActivityModelRightID) values ('{CD5D008B-B8EC-4fff-B511-61C7E98D3EC3}', '{E88C1DA8-FF83-4f1d-9A0F-4FEB7DF61440}')

if not exists ( select 1 from [dbo].[Hws_ActivityModelRoleRightsRel] where ActivityModelRoleID = '{AB26F848-6012-488c-B4C6-4BE6D7A311F1}' and ActivityModelRightID = '{56909F1C-73BA-4c92-985E-EA9B3C8CFD3A}' )
	insert into [dbo].[Hws_ActivityModelRoleRightsRel] (ActivityModelRoleID, ActivityModelRightID) values ('{AB26F848-6012-488c-B4C6-4BE6D7A311F1}', '{56909F1C-73BA-4c92-985E-EA9B3C8CFD3A}')

-- during upgrade, need to remove this unnecessary permission
if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Query_BizTalkDBVersion]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) 
begin
	if exists (select * from sysusers where name = N'HWS_ADMIN_USER' and issqlrole = 1)
		REVOKE EXECUTE ON [dbo].[adm_Query_BizTalkDBVersion] TO [HWS_ADMIN_USER]
end
GO

