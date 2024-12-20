--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelDependentBlocks_ActivityModelActivationBlocks_ActivationBlockGuid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelDependentBlocks] DROP CONSTRAINT FK_ActivityModelDependentBlocks_ActivityModelActivationBlocks_ActivationBlockGuid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelActivationBlocks_ActivityModelSteps_IndependentStepId]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelActivationBlocks] DROP CONSTRAINT FK_ActivityModelActivationBlocks_ActivityModelSteps_IndependentStepId
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelDependentBlocks_ActivityModelSteps_DependentStepId]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelDependentBlocks] DROP CONSTRAINT FK_ActivityModelDependentBlocks_ActivityModelSteps_DependentStepId
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelStepRel_ActivityModelSteps_ChildStepId]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelStepRel] DROP CONSTRAINT FK_ActivityModelStepRel_ActivityModelSteps_ChildStepId
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelStepRel_ActivityModelSteps_ParentStepId]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelStepRel] DROP CONSTRAINT FK_ActivityModelStepRel_ActivityModelSteps_ParentStepId
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelStepRelInfo_ActivityModelSteps_ChildStepId]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelStepRelInfo] DROP CONSTRAINT FK_ActivityModelStepRelInfo_ActivityModelSteps_ChildStepId
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelStepRelInfo_ActivityModelSteps_ParentStepId]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelStepRelInfo] DROP CONSTRAINT FK_ActivityModelStepRelInfo_ActivityModelSteps_ParentStepId
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelActivationBlocks_ActivityModels_ActivityModelGuid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelActivationBlocks] DROP CONSTRAINT FK_ActivityModelActivationBlocks_ActivityModels_ActivityModelGuid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelDependentBlocks_ActivityModels_ActivityModelGuid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelDependentBlocks] DROP CONSTRAINT FK_ActivityModelDependentBlocks_ActivityModels_ActivityModelGuid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelStepRel_ActivityModels_ActivityModelGuid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelStepRel] DROP CONSTRAINT FK_ActivityModelStepRel_ActivityModels_ActivityModelGuid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelStepRelInfo_ActivityModels_ActivityModelGuid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelStepRelInfo] DROP CONSTRAINT FK_ActivityModelStepRelInfo_ActivityModels_ActivityModelGuid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ActivityModelActions_ActivityModels_ActivityModelGuid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActivityModelSteps] DROP CONSTRAINT FK_ActivityModelActions_ActivityModels_ActivityModelGuid
GO
/*
	Due to rerun issues in set we need to drop the fk that constraints creates.
*/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Hws_Constraints_Hws_ActivityModels]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Hws_Constraints] DROP CONSTRAINT FK_Hws_Constraints_Hws_ActivityModels
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelsInsertTrigger]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[ActivityModelsInsertTrigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelsUpdateTrigger]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[ActivityModelsUpdateTrigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelStepRelInfoDeleteTrigger]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[ActivityModelStepRelInfoDeleteTrigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelTargetXPathsDeleteTrigger]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[ActivityModelTargetXPathsDeleteTrigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelTargetXPathsInsertTrigger]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[ActivityModelTargetXPathsInsertTrigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelTaskMessageTypesDeleteTrigger]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[ActivityModelTaskMessageTypesDeleteTrigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelTaskMessageTypesInsertTrigger]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[ActivityModelTaskMessageTypesInsertTrigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteActivityModel]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[DeleteActivityModel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelActivationBlocks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModelActivationBlocks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelDependentBlocks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModelDependentBlocks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelRuntimeTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModelRuntimeTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelStepRel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModelStepRel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelStepRelInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModelStepRelInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelSteps]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModelSteps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelTargetXPaths]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModelTargetXPaths]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModelTaskMessageTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModelTaskMessageTypes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActivityModels]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActivityModels]
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivationBlockDescription' )
exec sp_droptype N'Hws_type_ActivationBlockDescription'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivationBlockId' )
exec sp_droptype N'Hws_type_ActivationBlockId'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActionInstanceId' )
exec sp_droptype N'Hws_type_ActionInstanceId'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActionName' )
exec sp_droptype N'Hws_type_ActionName'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActionTypeId' )
exec sp_droptype N'Hws_type_ActionTypeId'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityFlowId' )
exec sp_droptype N'Hws_type_ActivityFlowId'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelAuthor' )
exec sp_droptype N'Hws_type_ActivityModelAuthor'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelDescription' )
exec sp_droptype N'Hws_type_ActivityModelDescription'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelId' )
exec sp_droptype N'Hws_type_ActivityModelId'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelInstanceId' )
exec sp_droptype N'Hws_type_ActivityModelInstanceId'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelName' )
exec sp_droptype N'Hws_type_ActivityModelName'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelStepDescription' )
exec sp_droptype N'Hws_type_ActivityModelStepDescription'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelStepId' )
exec sp_droptype N'Hws_type_ActivityModelStepId'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelStepName' )
exec sp_droptype N'Hws_type_ActivityModelStepName'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_ActivityModelVersion' )
exec sp_droptype N'Hws_type_ActivityModelVersion'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_HwsTaskMessageType' )
exec sp_droptype N'Hws_type_HwsTaskMessageType'
GO

if 1 = (select	top 1
			case
				when t.name is not null and c.name is null then 1 -- ok to drop if we have a type but no record in syscolumns references it
				when t.name is not null and c.name is not null then 0 -- can't drop if type exists and it's referenced
				when t.name is null then 0 -- can't drop if type doesn't exist
				else 0 -- default to do not drop
			end
	from		systypes t
	left outer join	syscolumns c
	on		t.xtype = c.xtype
	where		t.name = N'Hws_type_TargetXPath' )
exec sp_droptype N'Hws_type_TargetXPath'
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivationBlockDescription' )
EXEC sp_addtype N'Hws_type_ActivationBlockDescription', N'nvarchar (255)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivationBlockId' )
EXEC sp_addtype N'Hws_type_ActivationBlockId', N'uniqueidentifier', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActionInstanceId' )
EXEC sp_addtype N'Hws_type_ActionInstanceId', N'uniqueidentifier', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActionName' )
EXEC sp_addtype N'Hws_type_ActionName', N'nvarchar (255)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActionTypeId' )
EXEC sp_addtype N'Hws_type_ActionTypeId', N'uniqueidentifier', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityFlowId' )
EXEC sp_addtype N'Hws_type_ActivityFlowId', N'uniqueidentifier', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelAuthor' )
EXEC sp_addtype N'Hws_type_ActivityModelAuthor', N'nvarchar (255)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelDescription' )
EXEC sp_addtype N'Hws_type_ActivityModelDescription', N'nvarchar (512)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelId' )
EXEC sp_addtype N'Hws_type_ActivityModelId', N'uniqueidentifier', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelInstanceId' )
EXEC sp_addtype N'Hws_type_ActivityModelInstanceId', N'uniqueidentifier', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelName' )
EXEC sp_addtype N'Hws_type_ActivityModelName', N'nvarchar (255)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelStepDescription' )
EXEC sp_addtype N'Hws_type_ActivityModelStepDescription', N'nvarchar (255)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelStepId' )
EXEC sp_addtype N'Hws_type_ActivityModelStepId', N'int', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelStepName' )
EXEC sp_addtype N'Hws_type_ActivityModelStepName', N'nvarchar (255)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_ActivityModelVersion' )
EXEC sp_addtype N'Hws_type_ActivityModelVersion', N'nvarchar (25)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_HwsTaskMessageType' )
EXEC sp_addtype N'Hws_type_HwsTaskMessageType', N'nvarchar (4000)', N'not null'
GO

setuser
GO

setuser
GO

if not exists( select 1 from systypes where name = N'Hws_type_TargetXPath' )
EXEC sp_addtype N'Hws_type_TargetXPath', N'nvarchar (4000)', N'not null'
GO

setuser
GO

CREATE TABLE [dbo].[ActivityModelActivationBlocks] (
	[ActivityModelGuid] [Hws_type_ActivityModelId] NOT NULL ,
	[ActivationBlockGuid] [Hws_type_ActivationBlockId] NOT NULL ,
	[IndependentStepId] [Hws_type_ActivityModelStepId] NOT NULL ,
	[ActivationBlockDescription] [Hws_type_ActivationBlockDescription] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ActivityModelDependentBlocks] (
	[ActivityModelGuid] [Hws_type_ActivityModelId] NOT NULL ,
	[ActivationBlockGuid] [Hws_type_ActivationBlockId] NOT NULL ,
	[DependentBlockGuid] [Hws_type_ActivationBlockId] NOT NULL ,
	[DependentStepId] [Hws_type_ActivityModelStepId] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ActivityModelRuntimeTable] (
	[ActivityModelGuid] [Hws_type_ActivityModelId] NOT NULL ,
	[ActivityFlowGuid] [Hws_type_ActivityFlowId] NOT NULL ,
	[ActivityModelInstanceGuid] [Hws_type_ActivityModelInstanceId] NOT NULL ,
	[ParentStepId] [Hws_type_ActivityModelStepId] NOT NULL ,
	[ParentActionInstanceId] [Hws_type_ActionInstanceId] NOT NULL ,
	[ChildStepId] [Hws_type_ActivityModelStepId] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ActivityModelStepRel] (
	[ActivityModelGuid] [Hws_type_ActivityModelId] NOT NULL ,
	[ParentStepId] [Hws_type_ActivityModelStepId] NOT NULL ,
	[ChildStepId] [Hws_type_ActivityModelStepId] NOT NULL ,
	[IsDependentOnParent] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ActivityModelStepRelInfo] (
	[ActivityModelGuid] [Hws_type_ActivityModelId] NOT NULL ,
	[ParentStepId] [Hws_type_ActivityModelStepId] NOT NULL ,
	[ChildStepId] [Hws_type_ActivityModelStepId] NOT NULL ,
	[TaskMessageTypeId] [int] NOT NULL ,
	[TargetXPathId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ActivityModelSteps] (
	[ActivityModelGuid] [Hws_type_ActivityModelId] NOT NULL ,
	[ActivityModelStepId] [Hws_type_ActivityModelStepId] NOT NULL ,
	[ActivityModelStepName] [Hws_type_ActivityModelStepName] NULL ,
	[ActionName] [Hws_type_ActionName] NULL,
	[ActivityModelStepDescription] [Hws_type_ActivityModelStepDescription] NULL ,
	[ActionTypeId] [Hws_type_ActionTypeId] NOT NULL ,
	[DefaultActivationMessage] [ntext] NULL ,
	[IsActivationMessageImmutable] [bit] NULL,
	[IsRootStep] bit NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[ActivityModelTargetXPaths] (
	[TargetXPathId] [int] IDENTITY (1, 1) NOT NULL ,
	[XPathFromParentStep] [Hws_type_TargetXPath] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ActivityModelTaskMessageTypes] (
	[TaskMessageTypeId] [int] IDENTITY (1, 1) NOT NULL ,
	[TaskMessageType] [Hws_type_HwsTaskMessageType] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ActivityModels] (
	[ActivityModelGuid] [Hws_type_ActivityModelId] NOT NULL ,
	[ActivityModelName] [Hws_type_ActivityModelName] NOT NULL ,
	[ActivityModelDescription] [Hws_type_ActivityModelDescription] NULL ,
	[Version] [Hws_type_ActivityModelVersion] NULL ,
	[ActivityModelBlob] [ntext] NULL ,
	[ActivityModelAuthor] [Hws_type_ActivityModelAuthor] NOT NULL ,
	[IsVisibilityOpen] [bit] NOT NULL ,
	[IsMutable] [bit] NOT NULL ,
	[IsActive] [bit] NOT NULL ,
	[LastModified] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ActivityModelActivationBlocks] ADD 
	CONSTRAINT [PK_ActivityModelActivationBlocks] PRIMARY KEY  CLUSTERED 
	(
		[ActivityModelGuid],
		[ActivationBlockGuid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActivityModelDependentBlocks] ADD 
	CONSTRAINT [PK_ActivityModelDependentBlocks] PRIMARY KEY  CLUSTERED 
	(
		[ActivityModelGuid],
		[ActivationBlockGuid],
		[DependentBlockGuid],
		[DependentStepId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActivityModelRuntimeTable] ADD 
	CONSTRAINT [PK_ActivityModelRuntimeTable] PRIMARY KEY  CLUSTERED 
	(
		[ActivityModelGuid],
		[ActivityFlowGuid],
		[ActivityModelInstanceGuid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActivityModelStepRel] ADD 
	CONSTRAINT [PK_ActivityModelActionRel] PRIMARY KEY  CLUSTERED 
	(
		[ActivityModelGuid],
		[ParentStepId],
		[ChildStepId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActivityModelStepRelInfo] ADD 
	CONSTRAINT [PK_ActivityModelStepRelInfo] PRIMARY KEY  CLUSTERED 
	(
		[ActivityModelGuid],
		[ParentStepId],
		[ChildStepId],
		[TaskMessageTypeId],
		[TargetXPathId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActivityModelSteps] ADD 
	CONSTRAINT [PK_ActivityModelActions] PRIMARY KEY  CLUSTERED 
	(
		[ActivityModelGuid],
		[ActivityModelStepId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActivityModelTargetXPaths] ADD 
	CONSTRAINT [PK_TargetXPaths] PRIMARY KEY  CLUSTERED 
	(
		[TargetXPathId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActivityModelTaskMessageTypes] ADD 
	CONSTRAINT [PK_TaskMessageTypes] PRIMARY KEY  CLUSTERED 
	(
		[TaskMessageTypeId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActivityModels] ADD 
	CONSTRAINT [DF_ActivityModels_IsMutable] DEFAULT (1) FOR [IsMutable],
	CONSTRAINT [DF_Hws_ActivityModels_LastTimeStamp] DEFAULT (GETUTCDATE()) FOR [LastModified],
	CONSTRAINT [PK_ActivityModels] PRIMARY KEY  CLUSTERED 
	(
		[ActivityModelGuid]
	)  ON [PRIMARY]
GO

ALTER TABLE [dbo].[ActivityModelActivationBlocks] ADD 
	CONSTRAINT [FK_ActivityModelActivationBlocks_ActivityModels_ActivityModelGuid] FOREIGN KEY 
	(
		[ActivityModelGuid]
	) REFERENCES [dbo].[ActivityModels] (
		[ActivityModelGuid]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_ActivityModelActivationBlocks_ActivityModelSteps_IndependentStepId] FOREIGN KEY 
	(
		[ActivityModelGuid],
		[IndependentStepId]
	) REFERENCES [dbo].[ActivityModelSteps] (
		[ActivityModelGuid],
		[ActivityModelStepId]
	)
GO

ALTER TABLE [dbo].[ActivityModelDependentBlocks] ADD 
	CONSTRAINT [FK_ActivityModelDependentBlocks_ActivityModelActivationBlocks_ActivationBlockGuid] FOREIGN KEY 
	(
		[ActivityModelGuid],
		[ActivationBlockGuid]
	) REFERENCES [dbo].[ActivityModelActivationBlocks] (
		[ActivityModelGuid],
		[ActivationBlockGuid]
	),
	CONSTRAINT [FK_ActivityModelDependentBlocks_ActivityModels_ActivityModelGuid] FOREIGN KEY 
	(
		[ActivityModelGuid]
	) REFERENCES [dbo].[ActivityModels] (
		[ActivityModelGuid]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_ActivityModelDependentBlocks_ActivityModelSteps_DependentStepId] FOREIGN KEY 
	(
		[ActivityModelGuid],
		[DependentStepId]
	) REFERENCES [dbo].[ActivityModelSteps] (
		[ActivityModelGuid],
		[ActivityModelStepId]
	)
GO

ALTER TABLE [dbo].[ActivityModelStepRel] ADD 
	CONSTRAINT [FK_ActivityModelStepRel_ActivityModels_ActivityModelGuid] FOREIGN KEY 
	(
		[ActivityModelGuid]
	) REFERENCES [dbo].[ActivityModels] (
		[ActivityModelGuid]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_ActivityModelStepRel_ActivityModelSteps_ChildStepId] FOREIGN KEY 
	(
		[ActivityModelGuid],
		[ChildStepId]
	) REFERENCES [dbo].[ActivityModelSteps] (
		[ActivityModelGuid],
		[ActivityModelStepId]
	),
	CONSTRAINT [FK_ActivityModelStepRel_ActivityModelSteps_ParentStepId] FOREIGN KEY 
	(
		[ActivityModelGuid],
		[ParentStepId]
	) REFERENCES [dbo].[ActivityModelSteps] (
		[ActivityModelGuid],
		[ActivityModelStepId]
	)
GO

ALTER TABLE [dbo].[ActivityModelStepRelInfo] ADD 
	CONSTRAINT [FK_ActivityModelStepRelInfo_ActivityModels_ActivityModelGuid] FOREIGN KEY 
	(
		[ActivityModelGuid]
	) REFERENCES [dbo].[ActivityModels] (
		[ActivityModelGuid]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_ActivityModelStepRelInfo_ActivityModelSteps_ChildStepId] FOREIGN KEY 
	(
		[ActivityModelGuid],
		[ChildStepId]
	) REFERENCES [dbo].[ActivityModelSteps] (
		[ActivityModelGuid],
		[ActivityModelStepId]
	),
	CONSTRAINT [FK_ActivityModelStepRelInfo_ActivityModelSteps_ParentStepId] FOREIGN KEY 
	(
		[ActivityModelGuid],
		[ParentStepId]
	) REFERENCES [dbo].[ActivityModelSteps] (
		[ActivityModelGuid],
		[ActivityModelStepId]
	)
GO

ALTER TABLE [dbo].[ActivityModelSteps] ADD 
	CONSTRAINT [FK_ActivityModelActions_ActivityModels_ActivityModelGuid] FOREIGN KEY 
	(
		[ActivityModelGuid]
	) REFERENCES [dbo].[ActivityModels] (
		[ActivityModelGuid]
	) ON DELETE CASCADE 
GO


