--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

/* Dropping Hws Tracking Tables */
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Actors]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_Actors]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActivityFlows]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_ActivityFlows]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActionInstances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_ActionInstances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Tasks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_Tasks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_TaskResponses]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_TaskResponses]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActivityFlowsActorLinks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_ActivityFlowsActorLinks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActionInstanceLinks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_ActionInstanceLinks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActivityModelActivationInstances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_ActivityModelActivationInstances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_TaskReassignment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_TaskReassignment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ParentActionInstanceActivationBlocks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Hws_ParentActionInstanceActivationBlocks]
GO

/* Creation of the Hws Tracking Tables */
CREATE TABLE [dbo].[Hws_Actors] (
	[ActorID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [nvarchar] (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE  UNIQUE CLUSTERED INDEX [uni_Actors_ActorID] ON [dbo].[Hws_Actors]([ActorID])
GO

CREATE  UNIQUE  INDEX [uni_Actors_UserID] ON [dbo].[Hws_Actors]([UserID])
GO

CREATE TABLE [dbo].[Hws_ActivityFlowsActorLinks] (
	[ActivityFlowID] [uniqueidentifier] NOT NULL ,
	[ActivityFlowInternalID] [bigint] NOT NULL ,
	[ActorID] [int] NOT NULL ,
	[IsCreator] [bit] NOT NULL ,
	[IsIgnore] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [idx_Hws_ActivityFlowsActorLinks_ActivityFlowID] ON [dbo].[Hws_ActivityFlowsActorLinks] ([ActivityFlowID])

GO

CREATE CLUSTERED INDEX [idx_Hws_ActivityFlowsActorLinks_ActivityFlowInternalID] ON [dbo].[Hws_ActivityFlowsActorLinks] ( [ActivityFlowInternalID] )

GO

CREATE NONCLUSTERED INDEX [idx_Hws_ActivityFlowsActorLinks_ActorID_IsIgnore] ON [dbo].[Hws_ActivityFlowsActorLinks] ( [ActorID], [IsIgnore] )

GO

CREATE UNIQUE INDEX [pk_Hws_ActivityFlowsActorLinks] ON [dbo].[Hws_ActivityFlowsActorLinks] ([ActivityFlowID],[ActorID]) WITH IGNORE_DUP_KEY

GO

CREATE TABLE [dbo].[Hws_ActivityFlows] (
	[ActivityFlowID] [uniqueidentifier] NOT NULL ,
	[ActivityFlowInternalID] [bigint] NOT NULL identity (1,1) ,
	[ActivityFlowDescription] [nvarchar](255) NULL ,
	[CreatorActorID] [int] NOT NULL ,
	[StartTime] [datetime] NOT NULL ,
	[Status] [int] NOT NULL ,
	[ActivityFlowProperties] [ntext] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [idx_Hws_ActivityFlow_CreatorActorID] ON [dbo].[Hws_ActivityFlows]([CreatorActorID])
GO

CREATE NONCLUSTERED INDEX [idx_Hws_ActivityFlow_Status] ON [dbo].[Hws_ActivityFlows]([Status])
GO

CREATE CLUSTERED INDEX [idx_Hws_ActivityFlows_ActivityFlowInternalID_StartTime] ON [dbo].[Hws_ActivityFlows] ( [ActivityFlowInternalID], [StartTime] )
GO

CREATE UNIQUE NONCLUSTERED INDEX [pk_Hws_ActivityFlows] ON [dbo].[Hws_ActivityFlows] ([ActivityFlowID])
GO


CREATE TABLE [dbo].[Hws_ActionInstances] (
	[ActivityFlowID] [uniqueidentifier] NOT NULL ,
	[ActivityFlowInternalID] [bigint] NOT NULL ,
	[ActionInstanceID] [uniqueidentifier] NOT NULL ,
	[ActionTypeID] [uniqueidentifier] NOT NULL ,
	[ActivityModelTypeID] [uniqueidentifier] NOT NULL ,
	[ActivityModelInstanceID] [uniqueidentifier] NOT NULL ,
	[ActivityModelStepID] [int] NOT NULL ,
	[parentTaskID] [uniqueidentifier] NOT NULL ,
	[Title] [nvarchar] (256) NOT NULL ,
	[InitiatorActorID] [int] NOT NULL ,
	[Status] [int] NOT NULL ,
	[StartTime] [datetime] NOT NULL ,
	[EndTime] [datetime] NOT NULL ,
	[ActivateMessageID] [uniqueidentifier] NOT NULL ,
	[ActionProperties] [ntext] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [pk_Hws_ActionInstances] ON [dbo].[Hws_ActionInstances]([ActionInstanceID])
GO

CREATE NONCLUSTERED INDEX [idx_Hws_ActionInstances_ActivityFlowID] ON [dbo].[Hws_ActionInstances]([ActivityFlowID])
GO

CREATE NONCLUSTERED INDEX [idx_Hws_ActionInstances_InitiatorActorID] ON [dbo].[Hws_ActionInstances]([InitiatorActorID])
GO

CREATE NONCLUSTERED INDEX idx_Hws_ActionInstances_ActivityFlowInternalId_ActivityModelTypeId ON [dbo].[Hws_ActionInstances]([ActivityFlowInternalID],[ActivityModelTypeID])

GO

CREATE TABLE [dbo].[Hws_ActionInstanceLinks] (
	[ActivityFlowID] [uniqueidentifier] NOT NULL,
	[ParentActionInstanceID] [uniqueidentifier] NOT NULL,
	[ChildActionInstanceID] [uniqueidentifier] NOT NULL,
        [IsDependent] [bit] NOT NULL
) ON [PRIMARY]

GO

CREATE UNIQUE INDEX [pk_Hws_ActionInstanceLinks] ON [dbo].[Hws_ActionInstanceLinks]([ActivityFlowID], [ParentActionInstanceID], [ChildActionInstanceID])

GO

CREATE NONCLUSTERED INDEX [idx_Hws_ActionInstanceLinks_ActivityFlowID] ON [dbo].[Hws_ActionInstanceLinks] ([ActivityFlowID])

GO

CREATE TABLE [dbo].[Hws_Tasks] (
	[ActivityFlowID] [uniqueidentifier] NOT NULL ,
	[ActivityFlowInternalID] [bigint] NOT NULL ,
	[ActionInstanceID] [uniqueidentifier] NOT NULL ,
	[TaskID] [uniqueidentifier] NOT NULL ,
	[InitiatorActorID] [int] NOT NULL ,
	[TargetActorID] [int] NOT NULL ,
	[ActorElementXPath] [nvarchar](512) NOT NULL ,
	[TargetNamespaceUri] [nvarchar] (256) NOT NULL ,
	[CurrentTaskStatusID] [int] NOT NULL ,
	[CurrentPercentageComplete] [int] NOT NULL ,
	[NumberOfResponses] [int] NULL , -- null means undefined number of responses accepted
	[TaskMessageID] [uniqueidentifier] NOT NULL ,
	[TaskMessage] [ntext] NOT NULL, 
	[TaskTime] [datetime] NOT NULL ,
	[Title] [nvarchar] (256) NOT NULL ,
	[TaskProperties] [ntext] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE NONCLUSTERED INDEX [pk_Hws_Tasks] ON [dbo].[Hws_Tasks]([TaskID])
GO

CREATE NONCLUSTERED INDEX [idx_Hws_Tasks_ActivityFlowID] ON [dbo].[Hws_Tasks]([ActivityFlowID])
GO

CREATE NONCLUSTERED INDEX [idx_Hws_Tasks_ActionInstanceID] ON [dbo].[Hws_Tasks]([ActionInstanceID])
GO

CREATE NONCLUSTERED INDEX [idx_Hws_Tasks_InitiatorActorID_TargetActorID] ON [dbo].[Hws_Tasks]([InitiatorActorID],[TargetActorID])
GO

CREATE CLUSTERED INDEX [idx_Hws_Tasks_ActivityFlowInternalID_TaskTime] ON [dbo].[Hws_Tasks]( [ActivityFlowInternalID], [TaskTime] )
GO

CREATE TABLE [dbo].[Hws_TaskReassignment] (
	[TaskID] [uniqueidentifier] NOT NULL ,
	[ReassignedToTaskID] [uniqueidentifier] NULL ,
	[FirstTaskID] [uniqueidentifier] NOT NULL
)
GO

-- A task can only be reassigned once and can only be the target of one reassignment
CREATE UNIQUE INDEX [uni_Hws_TaskReassignment_TaskID] ON [dbo].[Hws_TaskReassignment]([TaskID])
GO

CREATE INDEX [uni_Hws_TaskReassignment_ReassignedToTaskID] ON [dbo].[Hws_TaskReassignment]([ReassignedToTaskID])
GO

CREATE INDEX [idx_Hws_TaskReassignment_FirstTaskID] ON [dbo].[Hws_TaskReassignment]([FirstTaskID])
GO

CREATE TABLE [dbo].[Hws_TaskResponses] (
	[ActivityFlowID] [uniqueidentifier] NOT NULL ,
	[ActionInstanceID] [uniqueidentifier] NOT NULL ,
	[TaskID] [uniqueidentifier] NOT NULL ,
	[TaskResponseID] [uniqueidentifier] NOT NULL ,
	[ResponseTime] [datetime] NOT NULL ,
	[ResponseMessageID] [uniqueidentifier] NOT NULL ,
	[ResponseActorID] [int] NOT NULL ,
	[TaskStatusID] [int] NOT NULL ,
	[PercentageComplete] [int] NOT NULL ,
	[ResponseProperties] [ntext] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Hws_TaskResponses] WITH NOCHECK ADD 
	CONSTRAINT [PK_TaskResponses] PRIMARY KEY NONCLUSTERED 
	(
		[TaskResponseID]
	)  ON [PRIMARY] 
GO

CREATE UNIQUE INDEX [idx_Hws_TaskResponses_TaskResponseID] ON [dbo].[Hws_TaskResponses]([TaskResponseID])

GO

CREATE NONCLUSTERED INDEX [idx_Hws_TaskResponses_ActivityFlowID] ON [dbo].[Hws_TaskResponses]([ActivityFlowID])

GO

CREATE NONCLUSTERED INDEX [idx_Hws_TaskResponses_TaskID] ON [dbo].[Hws_TaskResponses]([TaskID])

GO

CREATE NONCLUSTERED INDEX [idx_Hws_TaskResponses_ActionInstanceID] ON [dbo].[Hws_TaskResponses]( [ActionInstanceID] )

GO

CREATE NONCLUSTERED INDEX [idx_Hws_TaskResponses_ResponseTime] ON [dbo].[Hws_TaskResponses]( [ResponseTime] )

GO


CREATE TABLE [dbo].[Hws_ActivityModelActivationInstances] (
	[ActivityFlowID] [uniqueidentifier] NOT NULL,
	[ParentActionInstanceID] [uniqueidentifier] NOT NULL,
	[ActivityModelTypeID] [uniqueidentifier] NOT NULL ,
	[ActivityModelStepID] [int] NOT NULL
) ON [PRIMARY]

GO

CREATE UNIQUE INDEX [pk_Hws_ActivityModelActivationInstances] ON [dbo].[Hws_ActivityModelActivationInstances]([ActivityFlowID], [ParentActionInstanceID], [ActivityModelTypeID], [ActivityModelStepID])

GO

CREATE TABLE [dbo].[Hws_ParentActionInstanceActivationBlocks] (
	[ActivityFlowID] [uniqueidentifier] NOT NULL ,
	[ParentActionInstanceID] [uniqueidentifier] NOT NULL ,
	[ActivationBlockID] [uniqueidentifier] NOT NULL ,
	[ActivationBlockRootStepID] [int] NOT NULL 
) ON [PRIMARY]

GO

CREATE INDEX [IX_Hws_ParentActionInstanceActivationBlocks] ON [dbo].[Hws_ParentActionInstanceActivationBlocks]([ParentActionInstanceID])
GO
