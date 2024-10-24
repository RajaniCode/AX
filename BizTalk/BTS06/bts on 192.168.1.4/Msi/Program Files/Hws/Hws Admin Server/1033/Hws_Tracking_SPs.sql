--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

/* Dropping Hws Tracking Sproks */
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityFlow]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityFlow]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityFlowWithActionInstances]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityFlowWithActionInstances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetDeepActivityFlow]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetDeepActivityFlow]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActionInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActionInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetDeepActionInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetDeepActionInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetTask]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetTask]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetTaskMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetTaskMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetAllTasksForUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetAllTasksForUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityFlowsForUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityFlowsForUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetAllActivityFlows]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetAllActivityFlows]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_InsertActor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_InsertActor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_InsertTask]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_InsertTask]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_InsertTaskResponse]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_InsertTaskResponse]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_InsertActionInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_InsertActionInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_InsertActionInstanceLink]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_InsertActionInstanceLink]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_UpdateActionInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_UpdateActionInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_UpdateActivityFlow]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_UpdateActivityFlow]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ValidateExistActivityFlowID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_ValidateExistActivityFlowID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ValidateActorInActivityFlowID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_ValidateActorInActivityFlowID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ValidateActivityFlowActorWithInstanceID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_ValidateActivityFlowActorWithInstanceID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ValidateActivityFlowActorWithTaskID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_ValidateActivityFlowActorWithTaskID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_RemoveActivityFlow]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_RemoveActivityFlow]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityFlowsByCreationDate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityFlowsByCreationDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityFlowsByLastActivityDate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityFlowsByLastActivityDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_InsertActionInstanceLink]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_InsertActionInstanceLink]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetTasks]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetTasks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetTaskResponses]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetTaskResponses]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_UpdateIgnoreActivityFlow]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_UpdateIgnoreActivityFlow]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivationBlocksForParent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivationBlocksForParent]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_InsertActivationBlock]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_InsertActivationBlock]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_RemoveActivationBlock]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_RemoveActivationBlock]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActionStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActionStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'Hws_GetActivityFlowStatus') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityFlowStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_DeleteInterruptedActivationBlock]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_DeleteInterruptedActivationBlock]
GO

/* Creation of the Hws Tracking sproks */
/*******************************************************************************************************

					SELECT Procs

*******************************************************************************************************/
CREATE PROCEDURE [dbo].[Hws_GetActivityFlow]
 @ActivityFlowID uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON

  SELECT BF.StartTime, BA.UserID, BF.Status, BF.ActivityFlowProperties, BF.ActivityFlowDescription
    FROM [dbo].[Hws_ActivityFlows] as BF 
      Inner Join [dbo].[Hws_Actors] as BA
        On BF.CreatorActorID = BA.ActorID
    WHERE [ActivityFlowID] = @ActivityFlowID
END

GO

grant execute on [dbo].[Hws_GetActivityFlow] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivityFlow] to HWS_ADMIN_USER
GO

/*
** Date:	5/2/2003
** Purpose:	Consolidate standard selects from Hws_Tasks
*/
Create Procedure [dbo].[Hws_GetTasks]
 @ActivityFlowID	uniqueidentifier = NULL
,@ActionInstanceID	uniqueidentifier = NULL
,@TaskID		uniqueidentifier = NULL
,@UserName		nvarchar(50)	 = NULL
,@Status		int		 = NULL -- Only valid when @UserName non null
,@StartTimeStart	datetime	 = NULL -- Only valid when @UserName non null
,@StartTimeEnd		datetime	 = NULL -- Only valid when @UserName non null
AS
 BEGIN
	SET NOCOUNT ON

	declare @localized_string_Hws_GetTasks_Invalid_Args_NULL nvarchar(100)
	set @localized_string_Hws_GetTasks_Invalid_Args_NULL = N'Hws_GetTasks failed - One parameter must be non null'

	declare @localized_string_Hws_GetTasks_Invalid_Args nvarchar(100)
	set @localized_string_Hws_GetTasks_Invalid_Args = N'Hws_GetTasks failed - Invalid parameters'

	/*
		Make sure we only have 1 non null parameter
	*/
	IF ( @ActivityFlowID IS NOT NULL AND @ActionInstanceID IS NOT NULL )
	OR ( @ActivityFlowID IS NOT NULL AND @TaskID IS NOT NULL )
	OR ( @ActivityFlowID IS NOT NULL AND @UserName IS NOT NULL )
	OR ( @ActionInstanceID IS NOT NULL AND @TaskID IS NOT NULL )
	OR ( @ActionInstanceID IS NOT NULL AND @UserName IS NOT NULL )
	OR ( @TaskID IS NOT NULL AND @UserName IS NOT NULL )
	OR ( @UserName IS NULL AND ( @Status IS NOT NULL OR @StartTimeStart IS NOT NULL OR @StartTimeEnd IS NOT NULL ) )
	 BEGIN
		RAISERROR( @localized_string_Hws_GetTasks_Invalid_Args, 16, -1 )
		GOTO DONE		
	 END

	IF @ActivityFlowID IS NOT NULL
	 BEGIN
		Select 		BT.ActivityFlowID, BT.ActionInstanceID, BT.TaskID, BT.Title, BT.TargetNamespaceUri, BA_Target.UserID, BA_Initiator.UserID, BT.TaskTime, BT.ActorElementXPath, BT.CurrentTaskStatusID, BT.CurrentPercentageComplete, BT.TaskProperties, trPrevious.TaskID as 'PreviousTaskID', tr.ReassignedToTaskID as 'NextTaskID', tr.FirstTaskID as 'FirstTaskID', trLast.TaskID as 'LastTaskID'
		From 		[dbo].[Hws_Tasks] as BT
		Inner Join 	[dbo].[Hws_Actors] as BA_Initiator
		On 		BT.InitiatorActorID=BA_Initiator.ActorID
		Inner Join 	[dbo].[Hws_Actors] as BA_Target
		On 		BT.TargetActorID=BA_Target.ActorID
		Left Outer Join	[dbo].[Hws_TaskReassignment] tr
		On		BT.TaskID = tr.TaskID
		Left Outer Join	[dbo].[Hws_TaskReassignment] trLast
		On		tr.FirstTaskID = trLast.FirstTaskID
		Left Outer Join [dbo].[Hws_TaskReassignment] trPrevious
		On		tr.TaskID = trPrevious.ReassignedToTaskID
		Where 		BT.ActivityFlowID = @ActivityFlowID
		And		trLast.ReassignedToTaskID IS NULL
	 END
	ELSE IF @ActionInstanceID IS NOT NULL
	 BEGIN
		Select 		BT.ActivityFlowID, BT.ActionInstanceID, BT.TaskID, BT.Title, BT.TargetNamespaceUri, BA_Target.UserID, BA_Initiator.UserID, BT.TaskTime, BT.ActorElementXPath, BT.CurrentTaskStatusID, BT.CurrentPercentageComplete, BT.TaskProperties, trPrevious.TaskID as 'PreviousTaskID', tr.ReassignedToTaskID as 'NextTaskID', tr.FirstTaskID as 'FirstTaskID', trLast.TaskID as 'LastTaskID'
		From 		[dbo].[Hws_Tasks] as BT
		Inner Join 	[dbo].[Hws_Actors] as BA_Initiator
		On 		BT.InitiatorActorID=BA_Initiator.ActorID
		Inner Join 	[dbo].[Hws_Actors] as BA_Target
		On 		BT.TargetActorID=BA_Target.ActorID
		Left Outer Join	[dbo].[Hws_TaskReassignment] tr
		On		BT.TaskID = tr.TaskID
		Left Outer Join	[dbo].[Hws_TaskReassignment] trLast
		On		tr.FirstTaskID = trLast.FirstTaskID
		Left Outer Join [dbo].[Hws_TaskReassignment] trPrevious
		On		tr.TaskID = trPrevious.ReassignedToTaskID
		Where 		BT.ActionInstanceID = @ActionInstanceID
		And		trLast.ReassignedToTaskID IS NULL
	 END
	ELSE IF @UserName IS NOT NULL
	 BEGIN
		/*
			Get all tasks where the user is the initiator or target

			Getting actorid seperately saves searching hws_actors and means 
			that joins to this table are only for getting names from ids
		*/
		DECLARE @ActorID int
		
		SELECT 	@ActorID = ActorID
		FROM	[dbo].[Hws_Actors]
		WHERE	UserID = @UserName

		Select 		BT.ActivityFlowID, BT.ActionInstanceID, BT.TaskID, BT.Title, BT.TargetNamespaceUri, BA_Target.UserID, BA_Initiator.UserID, BT.TaskTime, BT.ActorElementXPath, BT.CurrentTaskStatusID, BT.CurrentPercentageComplete, BT.TaskProperties, trPrevious.TaskID as 'PreviousTaskID', tr.ReassignedToTaskID as 'NextTaskID', tr.FirstTaskID as 'FirstTaskID', trLast.TaskID as 'LastTaskID'
		From 		[dbo].[Hws_Tasks] as BT
		Inner Join 	[dbo].[Hws_Actors] as BA_Initiator
		On 		BT.InitiatorActorID=BA_Initiator.ActorID
		Inner Join 	[dbo].[Hws_Actors] as BA_Target
		On 		BT.TargetActorID=BA_Target.ActorID
		Inner Join	[dbo].[Hws_ActivityFlowsActorLinks] al
		On		BT.ActivityFlowInternalID = al.ActivityFlowInternalID
		Left Outer Join	[dbo].[Hws_TaskReassignment] tr
		On		BT.TaskID = tr.TaskID
		Left Outer Join	[dbo].[Hws_TaskReassignment] trLast
		On		tr.FirstTaskID = trLast.FirstTaskID
		Left Outer Join [dbo].[Hws_TaskReassignment] trPrevious
		On		tr.TaskID = trPrevious.ReassignedToTaskID
		Where 		( BT.InitiatorActorID = @ActorID OR BT.TargetActorID = @ActorID )
		And		( BT.TaskTime between @StartTimeStart And @StartTimeEnd OR @StartTimeStart IS NULL )
		And		( BT.CurrentTaskStatusID = @Status Or @Status IS NULL )
		And		trLast.ReassignedToTaskID IS NULL
		And		al.ActorID = @ActorID
		And		al.IsIgnore = 0
	 END
	ELSE IF @TaskID IS NOT NULL
	 BEGIN		
		Select 		BT.ActivityFlowID, BT.ActionInstanceID, BT.TaskID, BT.Title, BT.TargetNamespaceUri, BA_Target.UserID, BA_Initiator.UserID, BT.TaskTime, BT.ActorElementXPath, BT.CurrentTaskStatusID, BT.CurrentPercentageComplete, BT.TaskProperties, trPrevious.TaskID as 'PreviousTaskID', tr.ReassignedToTaskID as 'NextTaskID', tr.FirstTaskID as 'FirstTaskID', trLast.TaskID as 'LastTaskID'
		From 		[dbo].[Hws_Tasks] as BT
		Inner Join 	[dbo].[Hws_Actors] as BA_Initiator
		On 		BT.InitiatorActorID=BA_Initiator.ActorID
		Inner Join 	[dbo].[Hws_Actors] as BA_Target
		On 		BT.TargetActorID=BA_Target.ActorID
		Left Outer Join	[dbo].[Hws_TaskReassignment] tr
		On		BT.TaskID = tr.TaskID
		Left Outer Join	[dbo].[Hws_TaskReassignment] trLast
		On		tr.FirstTaskID = trLast.FirstTaskID
		Left Outer Join [dbo].[Hws_TaskReassignment] trPrevious
		On		tr.TaskID = trPrevious.ReassignedToTaskID
		Where 		BT.TaskID = @TaskID
		And		trLast.ReassignedToTaskID IS NULL
	 END
	ELSE
	 BEGIN
		/*
			Nothing was non null, error
		*/
		RAISERROR( @localized_string_Hws_GetTasks_Invalid_Args_NULL, 16, -1 )
		GOTO DONE
	 END

	GOTO DONE

DONE:

 END
GO


grant execute on [dbo].[Hws_GetTasks] to HWS_WS_USER
grant execute on [dbo].[Hws_GetTasks] to HWS_ADMIN_USER
GO

CREATE PROCEDURE [dbo].[Hws_GetTaskResponses]
	@ActivityFlowID		uniqueidentifier = NULL
	,@ActionInstanceID	uniqueidentifier = NULL
	,@TaskID		uniqueidentifier = NULL
	,@UserName		nvarchar(50)	 = NULL
	,@Status		int		 = NULL
	,@StartTimeStart	datetime	 = NULL
	,@StartTimeEnd		datetime	 = NULL
AS
 BEGIN
	SET NOCOUNT ON

	declare @localized_string_Hws_GetTaskResponses_Invalid_Args_NULL nvarchar(100)
	set @localized_string_Hws_GetTaskResponses_Invalid_Args_NULL = N'Hws_GetTaskResponses failed - One parameter must be non null'

	declare @localized_string_Hws_GetTaskResponses_Invalid_Args nvarchar(100)
	set @localized_string_Hws_GetTaskResponses_Invalid_Args = N'Hws_GetTaskResponses failed - Invalid arguments'

	/*
		Make sure we only have 1 non null parameter
	*/
	IF ( @ActivityFlowID IS NOT NULL AND @ActionInstanceID IS NOT NULL )
	OR ( @ActivityFlowID IS NOT NULL AND @TaskID IS NOT NULL )
	OR ( @ActivityFlowID IS NOT NULL AND @UserName IS NOT NULL )
	OR ( @ActionInstanceID IS NOT NULL AND @TaskID IS NOT NULL )
	OR ( @ActionInstanceID IS NOT NULL AND @UserName IS NOT NULL )
	OR ( @TaskID IS NOT NULL AND @UserName IS NOT NULL )
	OR ( @UserName IS NULL AND ( @Status IS NOT NULL OR @StartTimeStart IS NOT NULL OR @StartTimeEnd IS NOT NULL ) )
	 BEGIN
		RAISERROR( @localized_string_Hws_GetTaskResponses_Invalid_Args, 16, -1 )
		GOTO DONE		
	 END

	IF @ActivityFlowID IS NOT NULL
	 BEGIN
		Select		BTR.TaskID, BTR.ResponseTime, ACT.UserID, BTR.TaskStatusID, BTR.PercentageComplete, BTR.ResponseProperties        
		From 		[dbo].[Hws_TaskResponses] as BTR
		Inner join	[dbo].[Hws_Actors] ACT
		on		BTR.ResponseActorID = ACT.ActorID
		Where 		BTR.ActivityFlowID = @ActivityFlowID
	 END
	ELSE IF @ActionInstanceID IS NOT NULL
	 BEGIN
		Select		BTR.TaskID, BTR.ResponseTime, ACT.UserID, BTR.TaskStatusID, BTR.PercentageComplete, BTR.ResponseProperties        
		From 		[dbo].[Hws_TaskResponses] as BTR
		Inner join	[dbo].[Hws_Actors] ACT
		on		BTR.ResponseActorID = ACT.ActorID
		Where 		BTR.ActionInstanceID = @ActionInstanceID
	 END
	ELSE IF @TaskID IS NOT NULL
	 BEGIN
		Select 		BTR.TaskID, BTR.ResponseTime, ACT.UserID, BTR.TaskStatusID, BTR.PercentageComplete, BTR.ResponseProperties        
		From 		[dbo].[Hws_TaskResponses] as BTR
		Inner join	[dbo].[Hws_Actors] ACT
		on		BTR.ResponseActorID = ACT.ActorID
		Where 		BTR.TaskID = @TaskID
	 END
	ELSE IF @UserName IS NOT NULL
 	 BEGIN
		/*
			Get all tasks where the user is the initiator or target
			
			Resolving the actorid first completely eliminates 2 joins
			and allows searching on int instead of nvarchar values
		*/
		DECLARE @ActorID int
		
		SELECT 	@ActorID = ActorID
		FROM	[dbo].[Hws_Actors]
		WHERE	UserID = @UserName

		Select 		BT.TaskID, BTR.ResponseTime, ACT.UserID, BTR.TaskStatusID, BTR.PercentageComplete, BTR.ResponseProperties
		From 		[dbo].[Hws_TaskResponses] as BTR
		Inner Join 	[dbo].[Hws_Tasks] as BT
		On 		BT.TaskID=BTR.TaskID
		Inner join	[dbo].[Hws_Actors] ACT
		on		BTR.ResponseActorID = ACT.ActorID
		Inner Join	[dbo].[Hws_ActivityFlowsActorLinks] al
		on		BT.ActivityFlowInternalID = al.ActivityFlowInternalID
		Where 		( BT.InitiatorActorID = @ActorID OR BT.TargetActorID = @ActorID )
		And		( BT.TaskTime between @StartTimeStart And @StartTimeEnd OR @StartTimeStart IS NULL )
		And		( BT.CurrentTaskStatusID = @Status Or @Status IS NULL )
		And		al.ActorID = @ActorID
		And		al.IsIgnore = 0
	 END
	ELSE
	 BEGIN
		/*
			Nothing was non null, error
		*/
		RAISERROR( @localized_string_Hws_GetTaskResponses_Invalid_Args_NULL, 16, -1 )
		GOTO DONE
	 END

	GOTO DONE


DONE:

 END
GO

grant execute on [dbo].[Hws_GetTaskResponses] to HWS_WS_USER
grant execute on [dbo].[Hws_GetTaskResponses] to HWS_ADMIN_USER
GO


CREATE Procedure [dbo].[Hws_GetActivityFlowWithActionInstances]
 @ActivityFlowID uniqueidentifier
As
Begin

	SET NOCOUNT ON

 --Getting the ActivityFlow info
 Select BF.StartTime, BA_Creator.UserID, BF.Status, BF.ActivityFlowProperties, BF.ActivityFlowDescription    
   From [dbo].[Hws_ActivityFlows] as BF
     Inner Join [dbo].[Hws_Actors] as BA_Creator
       On BF.CreatorActorID=BA_Creator.ActorID
   Where BF.ActivityFlowID = @ActivityFlowID

 --Getting the [dbo].[Hws_ActionInstances] info
 Select BAI.ActionInstanceID, BAI.ActionTypeID, 
	BAI.ActivityModelTypeID, BAI.ActivityModelStepID, BAI.ActivityModelInstanceID, 
        BAI.parentTaskID, BAI.Title,
        BA_Initiator.UserID, BAI.Status, BAI.StartTime, BAI.EndTime,
        BAI.ActivateMessageID,BAI.ActionProperties       
   From [dbo].[Hws_ActionInstances] as BAI
     Inner Join [dbo].[Hws_Actors] as BA_Initiator
       On BAI.InitiatorActorID=BA_Initiator.ActorID
   Where BAI.ActivityFlowID = @ActivityFlowID

 --Getting the [dbo].[Hws_ActionInstanceLinks] info
 Select ParentActionInstanceID, ChildActionInstanceID, IsDependent
   From [dbo].[Hws_ActionInstanceLinks]
   Where ActivityFlowID = @ActivityFlowID

--Getting the [dbo].[Hws_Tasks] info
 exec [dbo].[Hws_GetTasks] @ActivityFlowID = @ActivityFlowID

End

GO

grant execute on [dbo].[Hws_GetActivityFlowWithActionInstances] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivityFlowWithActionInstances] to HWS_ADMIN_USER
GO


Create Procedure [dbo].[Hws_GetDeepActivityFlow]
 @ActivityFlowID uniqueidentifier
As
Begin
	SET NOCOUNT ON

 --Getting the ActivityFlow info
 Select BF.StartTime, BA_Creator.UserID, BF.Status, BF.ActivityFlowProperties, BF.ActivityFlowDescription      
   From [dbo].[Hws_ActivityFlows] as BF
     Inner Join [dbo].[Hws_Actors] as BA_Creator
       On BF.CreatorActorID=BA_Creator.ActorID
   Where BF.ActivityFlowID = @ActivityFlowID

 --Getting the [dbo].[Hws_ActionInstances] info
 Select BAI.ActionInstanceID, BAI.ActionTypeID, 
	BAI.ActivityModelTypeID, BAI.ActivityModelStepID, BAI.ActivityModelInstanceID, 
        BAI.parentTaskID, BAI.Title,
        BA_Initiator.UserID, BAI.Status, BAI.StartTime, BAI.EndTime,
        BAI.ActivateMessageID,BAI.ActionProperties       
   From [dbo].[Hws_ActionInstances] as BAI
     Inner Join [dbo].[Hws_Actors] as BA_Initiator
       On BAI.InitiatorActorID=BA_Initiator.ActorID
   Where BAI.ActivityFlowID = @ActivityFlowID

 --Getting the [dbo].[Hws_ActionInstanceLinks] info
 Select ParentActionInstanceID, ChildActionInstanceID, IsDependent
   From [dbo].[Hws_ActionInstanceLinks]
   Where ActivityFlowID = @ActivityFlowID

 exec [dbo].[Hws_GetTasks] @ActivityFlowID = @ActivityFlowID

 exec [dbo].[Hws_GetTaskResponses] @ActivityFlowID = @ActivityFlowID

End

GO

grant execute on [dbo].[Hws_GetDeepActivityFlow] to HWS_WS_USER
grant execute on [dbo].[Hws_GetDeepActivityFlow] to HWS_ADMIN_USER
GO

Create Procedure [dbo].[Hws_GetActionInstance]
 @ActionInstanceID uniqueidentifier
As
Begin
	SET NOCOUNT ON

 Select BAI.ActivityFlowID, BAI.ActionTypeID, 
	BAI.ActivityModelTypeID, BAI.ActivityModelStepID, BAI.ActivityModelInstanceID, 
        BAI.parentTaskID, BAI.Title,
        BA_Initiator.UserID, BAI.Status, BAI.StartTime, BAI.EndTime,
        BAI.ActivateMessageID,BAI.ActionProperties       
   From [dbo].[Hws_ActionInstances] as BAI 
     Inner Join [dbo].[Hws_Actors] as BA_Initiator
       On BAI.InitiatorActorID=BA_Initiator.ActorID

   Where BAI.ActionInstanceID = @ActionInstanceID

 --Getting the [dbo].[Hws_ActionInstanceLinks] info
 Select ParentActionInstanceID, IsDependent
   From [dbo].[Hws_ActionInstanceLinks]
   Where ChildActionInstanceID = @ActionInstanceID

End

GO

grant execute on [dbo].[Hws_GetActionInstance] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActionInstance] to HWS_ADMIN_USER
GO

Create Procedure [dbo].[Hws_GetDeepActionInstance]
 @ActionInstanceID uniqueidentifier
As
Begin

 SET NOCOUNT ON
 --Getting the [dbo].[Hws_ActionInstances] info
 Select BAI.ActivityFlowID, BAI.ActionTypeID, 
	BAI.ActivityModelTypeID, BAI.ActivityModelStepID, BAI.ActivityModelInstanceID, 
        BAI.parentTaskID, BAI.Title,
        BA_Initiator.UserID, BAI.Status, BAI.StartTime, BAI.EndTime,
        BAI.ActivateMessageID,BAI.ActionProperties       
   From [dbo].[Hws_ActionInstances] as BAI
     Inner Join [dbo].[Hws_Actors] as BA_Initiator
       On BAI.InitiatorActorID=BA_Initiator.ActorID
   Where BAI.ActionInstanceID = @ActionInstanceID

 --Getting the [dbo].[Hws_ActionInstanceLinks] info
 Select ParentActionInstanceID, IsDependent
   From [dbo].[Hws_ActionInstanceLinks]
   Where ChildActionInstanceID = @ActionInstanceID

 exec [dbo].[Hws_GetTasks] @ActionInstanceID = @ActionInstanceID

 exec [dbo].[Hws_GetTaskResponses] @ActionInstanceID = @ActionInstanceID

End
GO

grant execute on [dbo].[Hws_GetDeepActionInstance] to HWS_WS_USER
grant execute on [dbo].[Hws_GetDeepActionInstance] to HWS_ADMIN_USER
GO

Create Procedure [dbo].[Hws_GetTask]
 @TaskID uniqueidentifier
As
Begin
 SET NOCOUNT ON

 exec [dbo].[Hws_GetTasks] @TaskID = @TaskID

 exec [dbo].[Hws_GetTaskResponses] @TaskID = @TaskID

End

GO

grant execute on [dbo].[Hws_GetTask] to HWS_WS_USER
grant execute on [dbo].[Hws_GetTask] to HWS_ADMIN_USER
GO

Create Procedure [dbo].[Hws_GetTaskMessage]
 @TaskID uniqueidentifier,
 @UserName nvarchar(50)
As
Begin

 SET NOCOUNT ON

 --Getting the [dbo].[Hws_Tasks] info
   Select BT.TaskMessage
   From [dbo].[Hws_Tasks] as BT
     Inner Join [dbo].[Hws_Actors] as BA_Initiator
       On BT.InitiatorActorID=BA_Initiator.ActorID
     Inner Join [dbo].[Hws_Actors] as BA_Target
       On BT.TargetActorID=BA_Target.ActorID
   Where BT.TaskID = @TaskID and ( BA_Initiator.UserID=@UserName OR BA_Target.UserID=@UserName )
End

GO

grant execute on [dbo].[Hws_GetTaskMessage] to HWS_WS_USER
grant execute on [dbo].[Hws_GetTaskMessage] to HWS_ADMIN_USER
GO

Create Procedure [dbo].[Hws_GetAllTasksForUser]
	@UserName nvarchar(50)
	,@Status		int		 = NULL
	,@StartTimeStart	datetime	 = NULL
	,@StartTimeEnd		datetime	 = NULL
As
Begin

 SET NOCOUNT ON

 --Getting the [dbo].[Hws_Tasks] info
 exec [dbo].[Hws_GetTasks] 		@UserName 	= @UserName
					,@Status	= @Status
					,@StartTimeStart= @StartTimeStart
					,@StartTimeEnd	= @StartTimeEnd

 --Getting the [dbo].[Hws_TaskResponses] info
 exec [dbo].[Hws_GetTaskResponses] 	@UserName = @UserName
					,@Status	= @Status
					,@StartTimeStart= @StartTimeStart
					,@StartTimeEnd	= @StartTimeEnd

End
GO

grant execute on [dbo].[Hws_GetAllTasksForUser] to HWS_WS_USER
grant execute on [dbo].[Hws_GetAllTasksForUser] to HWS_ADMIN_USER
GO

CREATE Procedure [dbo].[Hws_GetActivityFlowsForUser]
  @UserID nvarchar(50)
 ,@Status int = null
 ,@StartTimeStart datetime = null
 ,@StartTimeEnd datetime = null
 ,@ModelTypeIdsForObserver nvarchar(4000) = null
As
Begin

	SET NOCOUNT ON
	/*
		@UserID			User name 
		@Status		1:	Active
				2:	InActive
				3:	Completed
				NULL:	return all records without regard to Status
		@StartTimeStart
					Date range of StartTime values for activity flows.  
					ActivityFlows with a StartTime value between @StartTimeStart and @StartTimeEnd 
					will be returned - @StartTimeEnd does not take last activity/modified date into account
				NULL:	return all records without regard to StartTime
		@StartTimeEnd		
	*/
	SET NOCOUNT ON

	declare @localized_string_InvalidDateRange_Hws_GetActivityFlowsForUser nvarchar(100)
	set @localized_string_InvalidDateRange_Hws_GetActivityFlowsForUser = N'Hws_GetActivityFlowsForUser failed:  invalid date range @StartTimeStart and @StartTimeEnd must both be null or non null'
	
	IF ( @StartTimeStart IS NULL AND @StartTimeEnd IS NOT NULL ) OR ( @StartTimeStart IS NOT NULL AND @StartTimeEnd IS NULL )
	 BEGIN
		RAISERROR( @localized_string_InvalidDateRange_Hws_GetActivityFlowsForUser, 16 ,-1 )	
		GOTO DONE
	 END

	DECLARE @ActorID int
	/*
		Look up the actor id first.  Doing this as a seperate step
		allows the use of a case statement to determine IsCreator (below)
		instead of reading it from the table.   This means all
		data we need from Hws_ActivityFlowsActorLinks is contained 
		in indexes so we don't have to actually go to the table for anything
	*/
	SELECT 	@ActorID = ActorID
	FROM	[dbo].[Hws_Actors]
	WHERE	UserID = @UserID

	DECLARE @stmtParticipant nvarchar(4000), @stmtObserver nvarchar(4000), @whereParticipant nvarchar(256), @whereObserver nvarchar(256), @union nvarchar(32)

	SELECT 	@stmtParticipant = N'', @whereParticipant = N'', @stmtObserver = N'', @whereObserver = N'', @union = N''
	
	IF @ActorID IS NOT NULL
	BEGIN
	SELECT	@stmtParticipant = N'
		SELECT 		BF.ActivityFlowID
				,BF.StartTime
				,BF.Status
				,''IsCreator''=
				case 
					when BF.CreatorActorID = ' + cast( @ActorID as nvarchar(10) ) + ' then cast(1 as bit) 
					else cast(0 as bit) 
				end
				,BF.ActivityFlowDescription
		FROM 		[dbo].[Hws_ActivityFlows] as BF
		INNER JOIN 	[dbo].[Hws_ActivityFlowsActorLinks] as BFL
		ON 		BF.ActivityFlowInternalID=BFL.ActivityFlowInternalID 
		WHERE 		BFL.ActorID = ' + cast( @ActorID as nvarchar(10) ) + ' AND BFL.IsIgnore = cast(0 as bit) '
	END	
	
	/*
		Build optional time/status where clause that applies
		to all activity flows, participant or observer
	*/
	IF @StartTimeStart IS NOT NULL
	 BEGIN
		SELECT @whereParticipant = @whereParticipant + N'
		AND		BF.StartTime between convert(datetime,''' + convert( nvarchar(32), @StartTimeStart, 121 ) + ''',121) and convert(datetime,''' + convert( nvarchar(32), @StartTimeEnd, 121 ) + ''',121)'
	 END

	IF @Status IS NOT NULL
	 BEGIN
		SELECT @whereParticipant = @whereParticipant + N'
		AND		BF.Status = ' + cast( @Status as nvarchar(10) )
	 END

	IF @ModelTypeIdsForObserver IS NOT NULL AND len( @ModelTypeIdsForObserver ) > 0
	 BEGIN
		/*
			Clean the input string and ensure that all value are valid guids
			by splitting on , and casting to uniqueidentifier
		*/
		DECLARE @tmp nvarchar(4000),@pos int, @next int, @len int, @guid nvarchar(36)
		
		SELECT 	@ModelTypeIdsForObserver = ltrim(rtrim(@ModelTypeIdsForObserver))
			,@tmp=N''
			,@pos = 1
		
		WHILE( @pos > 0 )
		 BEGIN
			/*
				Skip past ,
			*/
			IF substring( @ModelTypeIdsForObserver, @pos, 1 ) = N','
				SELECT @pos = @pos +1
			/*
				Skip whitespace
			*/
			WHILE( substring( @ModelTypeIdsForObserver, @pos, 1 ) = N' ' )
				SELECT @pos = @pos + 1		
			/*
				Once we hit something other than whitespace attempt to force the next 36 chars into a guid
				Even though it ends up in a string the cast forces a type check that the string is a valid guid
				If this fails the proc fails
			*/
			SELECT @guid = cast( substring( @ModelTypeIdsForObserver, @pos, 36 ) as uniqueidentifier )
			/*
				Append valid guid to string
			*/
			IF len( @tmp ) > 0
				SELECT @tmp = @tmp + ','

			SELECT @tmp = @tmp + '''' + @guid + ''''
			/*
				Set up for the next loop
			*/
			SELECT @pos = charindex( ',', @ModelTypeIdsForObserver, @pos )
		
			IF @pos > 0
				SELECT @pos = @pos + 1-- skip ahead one to position on the char after the next comma
		 END 
		/*
			Make sure nothing went wrong
			If tmp is null or empty we won't execute the observer portion of the query because there isn't a where clause
		*/
		IF @tmp IS NOT NULL AND len( @tmp ) > 0
		 BEGIN
			/*
				@tmp now contains a string that is clean for use in EXEC
			*/
			SELECT @ModelTypeIdsForObserver = @tmp
	
			IF @ActorID IS NULL
			BEGIN
				SELECT @stmtObserver = N'
				SELECT 		BF.ActivityFlowID
						,BF.StartTime
						,BF.Status
						,''IsCreator''=cast(0 as bit)
						,BF.ActivityFlowDescription
				FROM 		[dbo].[Hws_ActivityFlows] as BF
				INNER JOIN	[dbo].[Hws_ActionInstances] as AI
				ON		BF.ActivityFlowInternalID=AI.ActivityFlowInternalID 
				WHERE		AI.ActivityModelTypeId in ( '
			END
			ELSE
			BEGIN
				SELECT @stmtObserver = N'
				SELECT 		BF.ActivityFlowID
						,BF.StartTime
						,BF.Status
						,''IsCreator''=
						case 
							when BF.CreatorActorID = ' + cast( @ActorID as nvarchar(10) ) + ' then cast(1 as bit) 
							else cast(0 as bit) 
						end
						,BF.ActivityFlowDescription
				FROM 		[dbo].[Hws_ActivityFlows] as BF
				INNER JOIN	[dbo].[Hws_ActionInstances] as AI
				ON		BF.ActivityFlowInternalID=AI.ActivityFlowInternalID 
				WHERE		AI.ActivityModelTypeId in ( '
			END
			
			SELECT @whereObserver = N' ) ' + @whereParticipant
		 END
	 END

	IF len(@stmtParticipant) > 0 AND len(@stmtObserver) > 0
	BEGIN
		SELECT @union = N' UNION '
	END
	
	/*
		Don't attempt to cache plan, the result set may vary tremendously query to query
	*/
	exec ( @stmtParticipant + @whereParticipant + @union + @stmtObserver + @ModelTypeIdsForObserver + @whereObserver )
	

DONE:

End
GO


grant execute on [dbo].[Hws_GetActivityFlowsForUser] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivityFlowsForUser] to HWS_ADMIN_USER
GO

Create Procedure [dbo].[Hws_GetAllActivityFlows]
 @Status 		int	= NULL
,@AllIgnoring		bit	= NULL
,@StartTimeStart	datetime= NULL
,@StartTimeEnd		datetime= NULL
As
Begin
/*
	@Status		1:	Active
			2:	InActive
			3:	Completed
			NULL:	return all records without regard to Status
	@AllIgnoring	0:	return all records that at least 1 user isn't ignoring
			1:	return only records that all users are ignoring
			NULL:	return all records without regard to isignore
	@StartTimeStart
				Date range of StartTime values for activity flows.  
				ActivityFlows with a StartTime value between @StartTimeStart and @StartTimeEnd 
				will be returned - @StartTimeEnd does not take last activity/modified date into account
	@StartTimeEnd		
*/
	SET NOCOUNT ON
	/*
		This proc is only called via the MMC
		Because it is not frequently called
		it was decided that it was better to lookup
		certain details rather than do a
		store and update process as updates would
		be frequent
	*/	
	DECLARE @Ignore table ( ActivityFlowInternalID bigint, AllIgnoring bit )
	/*
		Create a table that holds whether all actors have chosen
		to ignore a given activityflow.
		Use a table var instead of temp table to avoid proc recompiles
	*/
	INSERT @Ignore ( 
			ActivityFlowInternalID
			,AllIgnoring
	)
	SELECT		ActivityFlowInternalID
			,'AllIgnoring'=case
				when count(IsIgnore) = sum(cast(IsIgnore as tinyint)) then 1
				else 0
			end
	FROM		[dbo].[Hws_ActivityFlowsActorLinks]
	GROUP BY	ActivityFlowInternalID
	
	
	SELECT 		BF.ActivityFlowID
			,BF.StartTime
			,max( ai.EndTime ) as LastActivityTime
			,BF.Status
			,BA.UserID
			,i.AllIgnoring
			,BF.ActivityFlowDescription
	FROM 		[dbo].[Hws_ActivityFlows] as BF
	INNER JOIN 	[dbo].[Hws_Actors] as BA
	ON 		BF.CreatorActorID =  BA.ActorID
	INNER JOIN	[dbo].[Hws_ActionInstances] ai
	ON		BF.ActivityFlowID = ai.ActivityFlowID
	INNER JOIN	@Ignore i
	ON		BF.ActivityFlowInternalID = i.ActivityFlowInternalID
	WHERE		( i.AllIgnoring = @AllIgnoring OR @AllIgnoring IS NULL )
	AND		( BF.Status = @Status OR @Status IS NULL )
	AND		( BF.StartTime between @StartTimeStart and @StartTimeEnd OR @StartTimeStart IS NULL )
	GROUP BY	BF.ActivityFlowID
			,BF.StartTime
			,BF.Status
			,BA.UserID
			,i.AllIgnoring
			,BF.ActivityFlowDescription
End

GO

grant execute on [dbo].[Hws_GetAllActivityFlows] to HWS_WS_USER
grant execute on [dbo].[Hws_GetAllActivityFlows] to HWS_ADMIN_USER
GO





Create Procedure [dbo].[Hws_GetActivationBlocksForParent]
	@ParentActionInstanceID uniqueidentifier
As
Begin

	SET NOCOUNT ON
	Select ActivationBlockID from Hws_ParentActionInstanceActivationBlocks
	Where ParentActionInstanceID = @ParentActionInstanceID
	Order By ActivationBlockID Desc	

End
GO

grant execute on [dbo].[Hws_GetActivationBlocksForParent] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivationBlocksForParent] to HWS_ADMIN_USER
GO





CREATE PROCEDURE [dbo].[Hws_InsertActor]
						@UserId		nvarchar(50)
						,@ActorId	int OUTPUT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @LocalActorID int
	SET @LocalActorID = 0

	/*
		2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)
		,@LocalRet						int

	declare @localized_string_Hws_ActorsSelFailed_Hws_InsertActor nvarchar(100)
	set @localized_string_Hws_ActorsSelFailed_Hws_InsertActor = N'Hws_InsertActor failed selecting from Hws_Actor'

	declare @localized_string_Hws_ActorsInsFailed_Hws_InsertActor nvarchar(100)
	set @localized_string_Hws_ActorsInsFailed_Hws_InsertActor = N'Hws_InsertActor failed inserting into Hws_Actor'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

	/*		
		Race condition exists - depending on how this proc is called
		other threads may insert between this threads decision to insert
		and the actual insert.  This will violate the unique index and 
		generate a 3604.  If this happens just try to select the user.
	*/
	INSERT [dbo].[Hws_Actors] (
		[UserID]
	) 
	VALUES (
		@UserId
	)
	/*
		Must use SCOPE_IDENTITY here - using @@identity
		can produce some strange side effects if the connection
		is not disconnected between calls to this proc.
	*/
	SELECT @Error = @@ERROR, @LocalActorID = SCOPE_IDENTITY()
	/*
		3604 - 	Warning duplicate key ignored - does not raise exception to client
			This occurs when index specifies IGNORE_DUP_KEY
		2601 - 	Violation of unique index - does raise exception to client			
			This check is here in case the index does not specify IGNORE_DUP_KEY
	*/
	IF @Error IN (3604, 2601) OR @LocalActorID = 0 OR @LocalActorID IS NULL
	 BEGIN
		SELECT 	@LocalActorID=[ActorID] 
		FROM 	[dbo].[Hws_Actors] 
		WHERE 	[UserID]=@UserId

		IF @@ERROR <> 0
		 BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_ActorsSelFailed_Hws_InsertActor
			GOTO ROLLBACKTRAN
		 END
	 END
	ELSE IF @Error NOT IN ( 3604, 2601, 0 )
	 BEGIN
		/*
			If we have an error (not 0) and 
			the error number is not 3604 or 2601
			Then we have a fatal error situation
		*/
		SELECT @ErrorDesc = @localized_string_Hws_ActorsInsFailed_Hws_InsertActor
		GOTO ROLLBACKTRAN
	 END
	
	SELECT @ActorId = @LocalActorID
	
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

END

GO

grant execute on [dbo].[Hws_InsertActor] to BTS_HOST_USERS
GO

CREATE PROCEDURE [dbo].[Hws_GetActor]
						@UserId		nvarchar(50)
						,@ActorId	int OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	/*
		2/26/2003
		Refined transaction handling
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_Hws_ActorsSelFailed_Hws_GetActor nvarchar(100)
	set @localized_string_Hws_ActorsSelFailed_Hws_GetActor = N'Hws_GetActor failed attempting to select user data from Hws_Actors'

	declare @localized_string_Hws_InsertActorFailed_Hws_GetActor nvarchar(100)
	set @localized_string_Hws_InsertActorFailed_Hws_GetActor = N'Hws_GetActor failed executing Hws_InsertActor'
	
	DECLARE @LocalActorID int
	SET @LocalActorID = 0

	SELECT 		@LocalActorID=[ActorID] 
	FROM 		[dbo].[Hws_Actors] 
	WHERE 		[UserID]=@UserId

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActorsSelFailed_Hws_GetActor
		GOTO FAILED
	 END

	IF @LocalActorID = 0 
	 BEGIN
		select @ActorId=-1
		EXEC @Ret = [dbo].[Hws_InsertActor] @UserId = @UserId, @ActorId = @LocalActorID OUTPUT

		IF @Ret <> 0
		 BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_InsertActorFailed_Hws_GetActor
			GOTO FAILED
		 END
	 END
	/*
		Set out param and return value
	*/
	SELECT 	@ActorId = @LocalActorID
		,@Ret = 0
	
	GOTO DONE

FAILED:
	/*
		Make sure out param is null and 
		indicate proc failure for return value
	*/
	SELECT	@ActorId = NULL
		,@Ret = -1

	RAISERROR( @ErrorDesc, 16, -1 )

DONE:
	RETURN @Ret

END

GO

grant execute on [dbo].[Hws_GetActor] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_GetActor] to BTS_HOST_USERS
GO


/*******************************************************************************************************

					SELECT Procs for Delete

*******************************************************************************************************/

CREATE PROCEDURE [dbo].[Hws_GetActivityFlowsByCreationDate]	@CreationDate DateTime
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_ActivityFlowSelectFailed_Hws_GetActivityFlowsByCreationDate nvarchar(100)
	set @localized_string_ActivityFlowSelectFailed_Hws_GetActivityFlowsByCreationDate = N'Hws_GetActivityFlowsByCreationDate failed selecting from Hws_ActivityFlows'

	SELECT	ActivityFlowID
	FROM	[dbo].[Hws_ActivityFlows]
	WHERE	StartTime <= @CreationDate

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_ActivityFlowSelectFailed_Hws_GetActivityFlowsByCreationDate
		GOTO FAILED
	 END

	SET @Ret = 0

	GOTO DONE

FAILED:
	/*
		Indicate a hard error in the return value
	*/
	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

DONE:
	/*
		Returns:	0	Success
				-1	Hard error
	*/
	RETURN @Ret

END

GO
grant execute on [dbo].[Hws_GetActivityFlowsByCreationDate] to HWS_ADMIN_USER
GO

CREATE PROCEDURE [dbo].[Hws_GetActivityFlowsByLastActivityDate]	@ActivityDate DateTime
AS
BEGIN
	SET NOCOUNT ON

	/*
		To avoid overfilling tempdb we are not running a transaction around the 
		entire delete process.  The delete of each ActivityFlow (and all associated tables)
		is handled in it's own transaction (by Hws_removeActivityFlow).
		The result is that if one Hws_removeActivityFlow call fails this proc will continue.		
	*/
	DECLARE @Ret							int
		,@Error							int
		,@ErrorCount						int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_CursorOpenFailed_Hws_GetActivityFlowsByLastActivityDate nvarchar(100)
	set @localized_string_CursorOpenFailed_Hws_GetActivityFlowsByLastActivityDate = N'Hws_GetActivityFlowsByLastActivityDate failed selecting from Hws_ActivityFlows'


	SELECT 		bai.ActivityFlowID
	FROM		[dbo].[Hws_ActionInstances] bai
	WHERE		bai.EndTime = (	SELECT 	max( bai2.EndTime ) 
					FROM 	[dbo].[Hws_ActionInstances] bai2 
					WHERE 	bai.ActivityFlowID = bai2.ActivityFlowID )
	AND		bai.EndTime <= @ActivityDate

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_CursorOpenFailed_Hws_GetActivityFlowsByLastActivityDate
		GOTO FAILED
	 END

	SET @Ret = 0
	GOTO DONE

FAILED:
	/*
		Indicate a hard error in the return value
	*/
	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

DONE:
	/*
		Returns:	0	Success
				-1	Hard error
	*/
	RETURN @Ret

END

GO
grant execute on [dbo].[Hws_GetActivityFlowsByLastActivityDate] to HWS_ADMIN_USER
GO


/*******************************************************************************************************

					SELECT Procs for CompManager (to avoid using retriever circularly)

*******************************************************************************************************/

CREATE PROCEDURE [dbo].[Hws_GetActionStatus] 
 @ActionInstanceID	uniqueidentifier
,@Status		int		OUT
AS
BEGIN
	SET NOCOUNT ON

	SET @Status = NULL

	DECLARE @Ret							int
		,@Error							int
		,@Rowcount						int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_InvalidActionInstanceID_Hws_GetActionStatus nvarchar(100)
	set @localized_string_InvalidActionInstanceID_Hws_GetActionStatus = N'Hws_GetActionStatus failed: Invalid ActionInstanceID'

	declare @localized_string_Hws_ActionInstancesSelectFailed_Hws_GetActionStatus nvarchar(100)
	set @localized_string_Hws_ActionInstancesSelectFailed_Hws_GetActionStatus = N'Hws_GetActionStatus failed selecting from Hws_ActionInstances'

	IF @ActionInstanceID IS NULL
	 BEGIN
		SET @ErrorDesc = @localized_string_InvalidActionInstanceID_Hws_GetActionStatus
		GOTO ERROR
	 END

	SELECT	@Status = Status
	FROM 	Hws_ActionInstances 
	WHERE 	ActionInstanceID = @ActionInstanceID

	SELECT @Error		= @@ERROR
		,@Rowcount	= @@ROWCOUNT
	
	IF @Error <> 0 OR @Rowcount <> 1 OR @Status is null
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_ActionInstancesSelectFailed_Hws_GetActionStatus
		GOTO ERROR
	 END

	SET @Ret = 0
	GOTO DONE

ERROR:
	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

DONE:
	return @Ret

END
GO

GRANT EXECUTE ON [dbo].[Hws_GetActionStatus] TO HWS_WS_USER
GO
GRANT EXECUTE ON [dbo].[Hws_GetActionStatus] TO HWS_ADMIN_USER
GO

CREATE PROCEDURE [dbo].[Hws_GetActivityFlowStatus] 
 @ActivityFlowID	uniqueidentifier
,@Status		int		OUT
AS
BEGIN
	SET NOCOUNT ON

	SET @Status = NULL

	DECLARE @Ret							int
		,@Error							int
		,@Rowcount						int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_InvalidActionInstanceID_Hws_GetActivityFlowStatus nvarchar(100)
	set @localized_string_InvalidActionInstanceID_Hws_GetActivityFlowStatus = N'Hws_GetActivityFlowStatus failed: Invalid ActivityFlowID'

	declare @localized_string_Hws_ActionInstancesSelectFailed_Hws_GetActivityFlowStatus nvarchar(100)
	set @localized_string_Hws_ActionInstancesSelectFailed_Hws_GetActivityFlowStatus = N'Hws_GetActivityFlowStatus failed selecting from Hws_ActivityFlows'

	IF @ActivityFlowID IS NULL
	 BEGIN
		SET @ErrorDesc = @localized_string_InvalidActionInstanceID_Hws_GetActivityFlowStatus
		GOTO ERROR
	 END

	SELECT	@Status = Status
	FROM 	Hws_ActivityFlows
	WHERE 	ActivityFlowID = @ActivityFlowID

	SELECT @Error		= @@ERROR
		,@Rowcount	= @@ROWCOUNT
	
	IF @Error <> 0 OR @Rowcount <> 1 OR @Status is null
	 BEGIN
		SET @ErrorDesc = @localized_string_Hws_ActionInstancesSelectFailed_Hws_GetActivityFlowStatus
		GOTO ERROR
	 END

	SET @Ret = 0
	GOTO DONE

ERROR:
	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

DONE:
	return @Ret

END
GO

GRANT EXECUTE ON [dbo].[Hws_GetActivityFlowStatus] TO HWS_WS_USER
GO
GRANT EXECUTE ON [dbo].[Hws_GetActivityFlowStatus] TO HWS_ADMIN_USER
GO

/*******************************************************************************************************

					SELECT Procs for Validation

*******************************************************************************************************/

Create Procedure [dbo].[Hws_ValidateExistActivityFlowID]
 @ActivityFlowID uniqueidentifier
As
Begin

 SET NOCOUNT ON

  Select BF.Status
    From [dbo].[Hws_ActivityFlows] as BF
    Where BF.ActivityFlowID = @ActivityFlowID  
End

GO

grant execute on [dbo].[Hws_ValidateExistActivityFlowID] to HWS_WS_USER
GO

Create Procedure [dbo].[Hws_ValidateActorInActivityFlowID]
 @ActivityFlowID uniqueidentifier,
 @UserId nvarchar(50)
As
Begin

 SET NOCOUNT ON

  Select BFL.IsCreator, BFL.IsIgnore
    From [dbo].[Hws_ActivityFlowsActorLinks] as BFL
      Inner Join [dbo].[Hws_Actors] as BA
        On BFL.ActorID = BA.ActorID
    Where BA.UserID = @UserId And BFL.ActivityFlowID = @ActivityFlowID
End

GO

grant execute on [dbo].[Hws_ValidateActorInActivityFlowID] to HWS_WS_USER
GO

Create Procedure [dbo].[Hws_ValidateActivityFlowActorWithInstanceID]
 @ActivityFlowID uniqueidentifier,
 @ActionInstanceID uniqueidentifier
As
Begin
 SET NOCOUNT ON

  Select BFL.ActorID, BFL.IsCreator, BA.UserID
    From [dbo].[Hws_ActivityFlowsActorLinks]  as BFL
      Inner Join [dbo].[Hws_Actors] as BA
        On BFL.ActorID = BA.ActorID
    Where BFL.ActivityFlowID = @ActivityFlowID
  
   Select BAI.ActionTypeID, BAI.InitiatorActorID, BA.UserID, BAI.ActivityFlowID
    From [dbo].[Hws_ActionInstances] as BAI
    Inner Join [dbo].[Hws_Actors] as BA
        On  BAI.InitiatorActorID = BA.ActorID
    Where (BAI.ActionInstanceID = @ActionInstanceID)

End


GO
grant execute on [dbo].[Hws_ValidateActivityFlowActorWithInstanceID] to HWS_WS_USER
GO

Create Procedure [dbo].[Hws_ValidateActivityFlowActorWithTaskID]
 @ActivityFlowID uniqueidentifier,
 @ActionInstanceID uniqueidentifier,
 @TaskID uniqueidentifier
As
Begin

	SET NOCOUNT ON

	Select 		BFL.ActorID, BFL.IsCreator, BA.UserID
	From 		[dbo].[Hws_ActivityFlowsActorLinks]  as BFL
	Inner Join 	[dbo].[Hws_Actors] as BA
	On 		BFL.ActorID = BA.ActorID
	Where 		BFL.ActivityFlowID = @ActivityFlowID
	
	Select 		BAI.ActionTypeID, BAI.InitiatorActorID, BA.UserID, BAI.ActivityFlowID
	From 		[dbo].[Hws_ActionInstances] as BAI
	Inner Join 	[dbo].[Hws_Actors] as BA
	On  		BAI.InitiatorActorID = BA.ActorID
	Where 		(BAI.ActionInstanceID = @ActionInstanceID)

	Select 		'ActorID' = 
			Case
				When tr.TaskID Is Null Then BA.ActorID
				Else RA.ActorID
			END, 
			'UserID' = 
			Case
				When tr.TaskID Is Null Then BA.UserID
				Else RA.UserID
			END,
			BT.ActorElementXPath,
			BT.ActionInstanceID,
			BT.TargetNamespaceUri
	From 		[dbo].[Hws_Tasks] as BT
	Inner Join 	[dbo].[Hws_Actors] as BA
	On 		BT.TargetActorID = BA.ActorID
	left outer Join	[dbo].[Hws_TaskReassignment] tr
	On		BT.TaskID = tr.TaskID
	left outer join	[dbo].[Hws_TaskReassignment] trCurrentTarget
	On		tr.FirstTaskID = trCurrentTarget.FirstTaskID
	left outer join	[dbo].[Hws_Tasks] as RT
	On		trCurrentTarget.TaskID = RT.TaskID
	left outer join	[dbo].[Hws_Actors] as RA
	On		RT.TargetActorID = RA.ActorID
	Where 		BT.TaskID = @TaskID
	And		trCurrentTarget.ReassignedToTaskID Is Null
End


GO
grant execute on [dbo].[Hws_ValidateActivityFlowActorWithTaskID] to HWS_WS_USER
GO

/*******************************************************************************************************

					INSERT Procs

*******************************************************************************************************/

Create Procedure [dbo].[Hws_InsertActionInstance]
							 @ActionInstanceID uniqueidentifier,
							 @ActivityFlowID uniqueidentifier,
							 @ActivityFlowDescription nvarchar(255),
							 @IsNewActivityFlow bit,
							 @ActionTypeID uniqueidentifier,
							 @ActivityModelTypeID uniqueidentifier,
							 @ActivityModelInstanceID uniqueidentifier,
							 @ActivityModelStepID int,
							 @ParentActionInstanceID uniqueidentifier,
							 @parentTaskID uniqueidentifier,
							 @IsDependent bit,
							 @Title nvarchar(256),
							 @InitiatorActorUserID nvarchar(50),
							 @ActivityFlowStatus int,
							 @ActionStatus int,
							 @ActionTime datetime,
							 @ActivateMessageID uniqueidentifier,
							 @ActivityFlowProperties ntext,
							 @ActionProperties ntext
As
Begin
	SET NOCOUNT ON

	/*
		2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)
		,@Rowcount						int
		,@ActivityFlowInternalID				bigint

	declare @localized_string_Hws_GetActorFailed_Hws_InsertActionInstance nvarchar(100)
	set @localized_string_Hws_GetActorFailed_Hws_InsertActionInstance = N'Hws_InsertActionInstance failed executing Hws_GetActor'

	declare @localized_string_Hws_ActivityFlowsInsFailed_Hws_InsertActionInstance nvarchar(100)
	set @localized_string_Hws_ActivityFlowsInsFailed_Hws_InsertActionInstance = N'Hws_InsertActionInstance failed inserting data into Hws_ActivityFlow'

	declare @localized_string_Hws_ActivityFlowsActorLinksInsFailed_Hws_InsertActionInstance nvarchar(100)
	set @localized_string_Hws_ActivityFlowsActorLinksInsFailed_Hws_InsertActionInstance = N'Hws_InsertActionInstance failed inserting data into Hws_ActivityFlowActorLinks'

	declare @localized_string_Hws_ActionInstancesInsFailed_Hws_InsertActionInstance nvarchar(100)
	set @localized_string_Hws_ActionInstancesInsFailed_Hws_InsertActionInstance = N'Hws_InsertActionInstance failed inserting data into Hws_ActionInstances'

	declare @localized_string_Hws_ActivityFlowSelFailed_Hws_InsertActionInstance nvarchar(100)
	set @localized_string_Hws_ActivityFlowSelFailed_Hws_InsertActionInstance = N'Hws_InsertActionInstance failed select ActivityFlowInternalID from Hws_ActivityFlows'

	declare @localized_string_Hws_ActivityFlowsUpdFailed_Hws_InsertActionInstance nvarchar(100)
	set @localized_string_Hws_ActivityFlowsUpdFailed_Hws_InsertActionInstance = N'Hws_InsertActionInstance failed updating Hws_ActivityFlows.Status'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

	Declare @ActorID int
	Set @ActorID = 0

	EXEC @Ret = [dbo].[Hws_GetActor] @UserId=@InitiatorActorUserID, @ActorId = @ActorID OUTPUT

	IF @@ERROR <> 0 OR @Ret <> 0 OR @ActorID IS NULL OR @ActorID= 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_GetActorFailed_Hws_InsertActionInstance
		GOTO ROLLBACKTRAN
	 END



	DECLARE @FoundFlow bit, @Status int
	
	SELECT @FoundFlow = 0, @Status = -1
	/*
		Would it be better to take a higher lock here as we are
		*going* to escalate below via either an insert or update?
	*/
	SELECT	@ActivityFlowInternalID = ActivityFlowInternalID
		--,@Status = Status -- If we take an escalated lock here we can read the status and only update if we need to
	FROM	[dbo].[Hws_ActivityFlows]
	WHERE	ActivityFlowID = @ActivityFlowID
	
	IF @ActivityFlowInternalID IS NOT NULL
		SET @FoundFlow = 1

	IF(@IsNewActivityFlow = 1)
	 BEGIN
		IF @FoundFlow = 0
		 BEGIN
			/*
				If we're here we are the root action.  
				We hold the valid ActivityFlow data so just insert it.
			*/
			INSERT INTO [dbo].[Hws_ActivityFlows] ([ActivityFlowID], [ActivityFlowDescription], [CreatorActorID], [StartTime], [Status], [ActivityFlowProperties]) 
			VALUES(@ActivityFlowID, @ActivityFlowDescription, @ActorID, @ActionTime, @ActivityFlowStatus, @ActivityFlowProperties) 
				
			SELECT @Error = @@ERROR, @ActivityFlowInternalID = @@IDENTITY
	
			IF @Error <> 0 OR @ActivityFlowInternalID IS NULL
			 BEGIN
				SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsInsFailed_Hws_InsertActionInstance
				GOTO ROLLBACKTRAN
			 END
		 END
		ELSE
		 BEGIN
			/*
				If we're here we know that
				1.  We are the root action 
				2.  A dependent child that has created the ActivityFlow record 
				    in order to obtain the ActivityFlowInternalID identity value.  
				Update the ActivityFlow record with the real flow values.
			*/
			UPDATE [dbo].[Hws_ActivityFlows] 
			SET [ActivityFlowDescription] = @ActivityFlowDescription, [Status] = @ActivityFlowStatus, [ActivityFlowProperties] = @ActivityFlowProperties
			WHERE ActivityFlowInternalID = @ActivityFlowInternalID

			SELECT @Error = @@ERROR
	
			IF @Error <> 0
			 BEGIN
				SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsInsFailed_Hws_InsertActionInstance
				GOTO ROLLBACKTRAN
			 END
		 END
	 END
	ELSE
	 BEGIN
		IF @FoundFlow = 0
		 BEGIN
			/*
				If we're here we know that
				1. We're a child 
				2. The ActivityFlow record doesn't exist
				3. This is a dependent child activation (child activated before parent).  
				We need to insert the ActivityFlow record to get the 
				ActivityFlowInternalID for the ActionInstance insert below
			*/
			INSERT INTO [dbo].[Hws_ActivityFlows] ([ActivityFlowID], [StartTime], [Status], [CreatorActorID], [ActivityFlowProperties]) 
			VALUES(@ActivityFlowID, @ActionTime, 1, @ActorID, '') 
	
			SELECT @Error = @@ERROR, @ActivityFlowInternalID = @@IDENTITY
	
			IF @Error <> 0 OR @ActivityFlowInternalID IS NULL
			 BEGIN
				SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsInsFailed_Hws_InsertActionInstance
				GOTO ROLLBACKTRAN
			 END
		 END
		ELSE
		 BEGIN
			/*
				If we're here we know that 
				1. This is a child 
				2. The ActivityFlow record already exists
				Make sure the status of the ActivityFlow is 'Active'
			*/
			UPDATE 	[dbo].[Hws_ActivityFlows]
			SET	Status = 1 -- Active
			WHERE	ActivityFlowInternalID = @ActivityFlowInternalID
			AND	Status != 1 -- don't do the update unless we have to
	
			IF @@ERROR <> 0
			 BEGIN
				SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsUpdFailed_Hws_InsertActionInstance
				GOTO ROLLBACKTRAN
			 END
		 END
	 END	


	--Insert the new ActivityFlow-Action link
	--Use @IsNewActivityFlow to indicate IsCreator 
	--If it's a new activityflow then the actor is the creator
	INSERT INTO [dbo].[Hws_ActivityFlowsActorLinks] ([ActivityFlowID], [ActivityFlowInternalID], [ActorID], [IsCreator], [IsIgnore])
	VALUES(@ActivityFlowID, @ActivityFlowInternalID, @ActorID, @IsNewActivityFlow, 0)
	
	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsActorLinksInsFailed_Hws_InsertActionInstance
		GOTO ROLLBACKTRAN
	 END

	--Need to insert a new ActionInstance row
	INSERT INTO [dbo].[Hws_ActionInstances] 
		(ActivityFlowID,
		ActivityFlowInternalID,
		ActionInstanceID,
		ActionTypeID,
		ActivityModelTypeID,
		ActivityModelInstanceID,
		ActivityModelStepID,
		parentTaskID,
		Title,
		InitiatorActorID,
		Status,
		StartTime,
		EndTime,
		ActivateMessageID,
		ActionProperties)
	VALUES
		(@ActivityFlowID,
		@ActivityFlowInternalID,
		@ActionInstanceID,
		@ActionTypeID,
		@ActivityModelTypeID,
		@ActivityModelInstanceID,
		@ActivityModelStepID,
		@parentTaskID,
		@Title,
		@ActorID,
		@ActionStatus,
		@ActionTime,
		@ActionTime,
		@ActivateMessageID,
		@ActionProperties)

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActionInstancesInsFailed_Hws_InsertActionInstance
		GOTO ROLLBACKTRAN
	 END


      	INSERT INTO [dbo].[Hws_ActionInstanceLinks] (
		[ActivityFlowID], 
		[ParentActionInstanceID], 
		[ChildActionInstanceID], 
		[IsDependent]) 
	VALUES (
		@ActivityFlowID, 
		@ParentActionInstanceID, 
		@ActionInstanceID, 
		@IsDependent)

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActionInstancesInsFailed_Hws_InsertActionInstance
		GOTO ROLLBACKTRAN
	 END

	
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

grant execute on [dbo].[Hws_InsertActionInstance] to BTS_HOST_USERS
GO

Create Procedure [dbo].[Hws_InsertActionInstanceLink]
 @ActivityFlowID uniqueidentifier,
 @ParentActionInstanceID uniqueidentifier,
 @ChildActionInstanceID uniqueidentifier,
 @IsDependent bit
As
Begin
	SET NOCOUNT ON

      	Insert into [dbo].[Hws_ActionInstanceLinks] ([ActivityFlowID], [ParentActionInstanceID], [ChildActionInstanceID], [IsDependent]) 
	Values(@ActivityFlowID, @ParentActionInstanceID, @ChildActionInstanceID, @IsDependent)

	IF @@ERROR <> 0
		RETURN -1
	ELSE
		RETURN 0

End

GO

grant execute on [dbo].[Hws_InsertActionInstanceLink] to BTS_HOST_USERS
GO

Create Procedure [dbo].[Hws_InsertTask]
  @TaskID uniqueidentifier,
  @ActivityFlowID uniqueidentifier,
  @ActionInstanceID uniqueidentifier,
  @InitiatorActorUserID nvarchar(50),
  @TargetActorUserID nvarchar(50),
  @TaskMessageID uniqueidentifier,
  @TaskMessage ntext,
  @TaskTime datetime,
  @ActorElementXPath nvarchar (512),
  @TargetNamespaceUri nvarchar (256),
  @InitialTaskStatusID int,
  @InitialPercentageComplete int,
  @NumberOfResponses int 				= NULL,
  @Title nvarchar(256),
  @TaskProperties ntext,
  @ReassignedByUserID nvarchar(50)			= NULL,
  @ReassignedFromTaskID uniqueidentifier		= NULL
As
Begin 
	SET NOCOUNT ON
	/*
		2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)
		,@Rowcount						int

	declare @localized_string_Hws_ActionInstanceLinksInsFailed_Hws_InsertTask nvarchar(100)
	set @localized_string_Hws_ActionInstanceLinksInsFailed_Hws_InsertTask = N'Hws_InsertTask failed inserting data into Hws_ActionInstanceLink'

	declare @localized_string_Hws_GetActorFailed_Hws_InsertTask nvarchar(100)
	set @localized_string_Hws_GetActorFailed_Hws_InsertTask = N'Hws_InsertTask failed executing Hws_GetActor'

	declare @localized_string_Hws_ActivityFlowsActorLinksInsFailed_Hws_InsertTask nvarchar(100)
	set @localized_string_Hws_ActivityFlowsActorLinksInsFailed_Hws_InsertTask = N'Hws_InsertTask failed inserting data into Hws_ActivityFlowsActorLinks'

	declare @localized_string_Hws_TasksInsFailed_Hws_InsertTask nvarchar(100)
	set @localized_string_Hws_TasksInsFailed_Hws_InsertTask = N'Hws_InsertTask failed inserting data into Hws_Tasks'

	declare @localized_string_Hws_ActionInstancesUpdFailed_Hws_InsertTask nvarchar(100)
	set @localized_string_Hws_ActionInstancesUpdFailed_Hws_InsertTask = N'Hws_InsertTask failed updating data in Hws_BiaActionInstances'

	declare @localized_string_Hws_ActivityFlowSelFailed_Hws_InsertTask nvarchar(100)
	set @localized_string_Hws_ActivityFlowSelFailed_Hws_InsertTask = N'Hws_InsertTask failed select ActivityFlowInternalID from Hws_ActivityFlows'

	declare @localized_string_Hws_ActivityFlowsActorLinksUpdFailed_Hws_InsertTask nvarchar(100)
	set @localized_string_Hws_ActivityFlowsActorLinksUpdFailed_Hws_InsertTask = N'Hws_InsertTask failed updating Hws_ActivityFlowsActorLinks'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END

	Declare @InitiatorActorID int
	Declare @TargetActorID int
	Set @InitiatorActorID = 0
	Set @TargetActorID = 0
	/*
		Get id of the initiator
	*/
	EXEC @Ret = [dbo].[Hws_GetActor] @UserId=@InitiatorActorUserID, @ActorId = @InitiatorActorID OUTPUT

	IF @@ERROR <> 0 OR @Ret <> 0 OR @InitiatorActorID IS NULL OR @InitiatorActorID = 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_GetActorFailed_Hws_InsertTask
		GOTO ROLLBACKTRAN
	 END
	/*
		Get id of the target
	*/
	EXEC @Ret = [dbo].[Hws_GetActor] @UserId=@TargetActorUserID, @ActorId = @TargetActorID OUTPUT

	IF @@ERROR <> 0 OR @Ret <> 0 OR @TargetActorID IS NULL OR @TargetActorID = 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_GetActorFailed_Hws_InsertTask
		GOTO ROLLBACKTRAN
	 END

	/*
		Look up the ActivityFlowInternalID
		This has the potential to fail on a race.  If this task is for the first
		action in a flow and the action activate message hasn't been written yet 
		we won't get the internal id.  Rely on tdds to retry.
	*/
	DECLARE	@ActivityFlowInternalID bigint

	SELECT	@ActivityFlowInternalID = ActivityFlowInternalID
	FROM	[dbo].[Hws_ActivityFlows]
	WHERE	ActivityFlowID = @ActivityFlowID

	IF @@ROWCOUNT <> 1 OR @ActivityFlowInternalID IS NULL 
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowSelFailed_Hws_InsertTask
		GOTO ROLLBACKTRAN
	 END		
	/*
		If the action has been interrupted or has finished
		write a current status of interrupted or cancelled for the task
		unless a task response has been received first with a status of
		Completed, Deferred or Declined or this task has a status of
		Completed, Deferred, Declined (we do not overwrite these statuses)
	*/
	DECLARE @ActionStatusID int, @CurrentTaskStatusID int, @ResponseStatusID int

	SELECT	@ActionStatusID = CASE
			WHEN Status IS NULL THEN -1
			ELSE Status
		END
	FROM 	[dbo].[Hws_ActionInstances]
	WHERE	ActionInstanceID = @ActionInstanceID

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowSelFailed_Hws_InsertTask  -- too late for new localized messages
		GOTO ROLLBACKTRAN
	 END	

	SELECT	@ResponseStatusID = ISNULL( ( SELECT TOP 1 TaskStatusID FROM [dbo].[Hws_TaskResponses] WHERE [TaskID] = @TaskID ORDER BY [ResponseTime] DESC ), -1 )

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowSelFailed_Hws_InsertTask  -- too late for new localized messages
		GOTO ROLLBACKTRAN
	 END	
	/*
		[Note - If we have an action status of finished or interrupted or a response status we have a race]
		If the action is finished or interrupted write a cancelled or interrupted task status unless either the task
		or the most recent response message holds a task status that we don't interrupt - Completed, Deferred, Declined
	*/
	IF @ActionStatusID = 3 /* Finished */ AND @ResponseStatusID NOT IN ( 4, 16, 128 ) AND @InitialTaskStatusID NOT IN ( 4, 16, 128 ) /* Completed, Deferred, Declined */
		SELECT @CurrentTaskStatusID = 512 -- task finished 
	ELSE IF @ActionStatusID = 4 /* Aborted */  AND @ResponseStatusID NOT IN ( 4, 16, 128 )  AND @InitialTaskStatusID NOT IN ( 4, 16, 128 ) /* Completed, Deferred, Declined */
		SELECT @CurrentTaskStatusID = 256 -- task interrupted
	ELSE
	 BEGIN
		IF @ResponseStatusID != -1 -- set the status of the task to be that of the most recent response
			SELECT @CurrentTaskStatusID = @ResponseStatusID
		ELSE		 
			SELECT @CurrentTaskStatusID = @InitialTaskStatusID
	 END
	/*
		Do Hws_Task insert
	*/
	Insert Into [dbo].[Hws_Tasks] 
		(ActivityFlowID,
		ActivityFlowInternalID,
		ActionInstanceID,
		TaskID,
		InitiatorActorID,
		TargetActorID,
		TaskMessageID,
		TaskMessage, 
		TaskTime,
		ActorElementXPath,
		TargetNamespaceUri,
		CurrentTaskStatusID,
		CurrentPercentageComplete,
		NumberOfResponses,
		Title,
		TaskProperties)
	Values
		(@ActivityFlowID,
		@ActivityFlowInternalID,
		@ActionInstanceID,
		@TaskID,
		@InitiatorActorID,
		@TargetActorID,
		@TaskMessageID,
		@TaskMessage,
		@TaskTime,
		@ActorElementXPath,
		@TargetNamespaceUri,
		@CurrentTaskStatusID,
		@InitialPercentageComplete,
		@NumberOfResponses,
		@Title,
		@TaskProperties)

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_TasksInsFailed_Hws_InsertTask
		GOTO ROLLBACKTRAN
	 END
	/*
		Maintain ActivityFlow-Actor data
		for InitiatorActor
	*/
	DECLARE @InitiatorIgnoring bit

	SELECT 	@InitiatorIgnoring = IsIgnore
	FROM 	[dbo].[Hws_ActivityFlowsActorLinks] 
	WHERE 	ActivityFlowInternalID = @ActivityFlowInternalID 
	AND 	ActorID = @InitiatorActorID
	/*
		@InitiatorIgnoring:	0 	No action
					1	Update to non ignoring
					Null	Insert actor into table
	*/
	IF @InitiatorIgnoring = 1
	 BEGIN
		UPDATE	[dbo].[Hws_ActivityFlowsActorLinks]
		SET	IsIgnore = 0
		WHERE 	ActivityFlowInternalID = @ActivityFlowInternalID 
		AND 	ActorID = @InitiatorActorID

		SELECT @Error = @@ERROR, @Rowcount = @@ROWCOUNT
	
		IF @Error <> 0
		 BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsActorLinksUpdFailed_Hws_InsertTask
			GOTO ROLLBACKTRAN
		 END
	 END
	ELSE IF @InitiatorIgnoring IS NULL
	 BEGIN
		Insert Into [dbo].[Hws_ActivityFlowsActorLinks] ([ActivityFlowID], [ActivityFlowInternalID], [ActorID], [IsCreator], [IsIgnore])
		Values (@ActivityFlowID, @ActivityFlowInternalID, @InitiatorActorID, 0, 0)

		IF @@ERROR <> 0
		 BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsActorLinksInsFailed_Hws_InsertTask
			GOTO ROLLBACKTRAN
		 END
	 END

	/*
		Maintain ActivityFlow-Actor data
		for TargetActor
	*/
	DECLARE @TargetIgnoring bit

	SELECT 	@TargetIgnoring = IsIgnore
	FROM 	[dbo].[Hws_ActivityFlowsActorLinks] 
	WHERE 	ActivityFlowInternalID = @ActivityFlowInternalID 
	AND 	ActorID = @TargetActorID
	/*
		@TargetIgnoring:	0 	No action
					1	Update to non ignoring
					Null	Insert actor into table
	*/
	IF @TargetIgnoring = 1
	 BEGIN
		UPDATE	[dbo].[Hws_ActivityFlowsActorLinks]
		SET	IsIgnore = 0
		WHERE 	ActivityFlowInternalID = @ActivityFlowInternalID 
		AND 	ActorID = @TargetActorID

		SELECT @Error = @@ERROR, @Rowcount = @@ROWCOUNT
	
		IF @Error <> 0
		 BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsActorLinksUpdFailed_Hws_InsertTask
			GOTO ROLLBACKTRAN
		 END
	 END
	ELSE IF @TargetIgnoring IS NULL
	 BEGIN
		Insert Into [dbo].[Hws_ActivityFlowsActorLinks] ([ActivityFlowID], [ActivityFlowInternalID], [ActorID], [IsCreator], [IsIgnore])
		Values (@ActivityFlowID, @ActivityFlowInternalID, @TargetActorID, 0, 0)

		IF @@ERROR <> 0
		 BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsActorLinksInsFailed_Hws_InsertTask
			GOTO ROLLBACKTRAN
		 END
	 END
	/*
		Do reassignment work
	*/
	IF ( @ReassignedByUserID IS NOT NULL ) AND ( @ReassignedFromTaskID IS NOT NULL )
	 BEGIN
		/*
			Is this the first link in a reassignment chain?
			If so create the reassignment record otherwise
			update the existing reassignment record for the
			from task so that it points to this task
		*/
		DECLARE @FirstTaskID uniqueidentifier
		
		SELECT 	@FirstTaskID = FirstTaskID 
		FROM 	[dbo].[Hws_TaskReassignment]
		WHERE 	TaskID = @ReassignedFromTaskID

		IF @FirstTaskID IS NULL
		 BEGIN
			SELECT @FirstTaskID = @ReassignedFromTaskID

			INSERT [dbo].[Hws_TaskReassignment] (
				TaskID
				,ReassignedToTaskID
				,FirstTaskID
			) VALUES (
				@ReassignedFromTaskID
				,@TaskID
				,@FirstTaskID
			)
		 END
		ELSE
		 BEGIN
			UPDATE 	[dbo].[Hws_TaskReassignment]
			SET	ReassignedToTaskID = @TaskID
			WHERE	TaskID = @ReassignedFromTaskID
		 END
		/*
			Create a new Hws_TaskReassignment record 
			for the current task.  We do this so that 
			we can associated it to the FirstTaskID 
			and use that to quickly look up both full 
			reassignment chains and the current task
		*/
		INSERT [dbo].[Hws_TaskReassignment] (
			TaskID
			,ReassignedToTaskID
			,FirstTaskID
		) VALUES (
			@TaskID
			,NULL
			,@FirstTaskID
		)
		/*
			Update the status of the "from" task to "Deferred"
		*/
		UPDATE 	[dbo].[Hws_Tasks]
		SET	[CurrentTaskStatusID] = 16 --Deferred
		WHERE	[TaskID] = @ReassignedFromTaskID
	 END

	/*
		Maintain the EndTime value in Hws_ActionInstances
	*/
	UPDATE	[dbo].[Hws_ActionInstances]
	SET	EndTime = @TaskTime
	WHERE	ActionInstanceID = @ActionInstanceID

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActionInstancesUpdFailed_Hws_InsertTask
		GOTO ROLLBACKTRAN
	 END

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

grant execute on [dbo].[Hws_InsertTask] to BTS_HOST_USERS
GO

Create Procedure [dbo].[Hws_InsertTaskResponse]
  @TaskResponseID uniqueidentifier,
  @TaskID uniqueidentifier,
  @ActivityFlowID uniqueidentifier,
  @ActionInstanceID uniqueidentifier,
  @ResponseTime datetime,
  @ResponseMessageID uniqueidentifier,  
  @ResponseActorUserID nvarchar(50),
  @TaskStatusID int,
  @PercentageComplete int,
  @ResponseProperties ntext
As
Begin
	SET NOCOUNT ON

	/*
		2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_Hws_TaskResponsesInsFailed_Hws_InsertTaskResponse nvarchar(100)
	set @localized_string_Hws_TaskResponsesInsFailed_Hws_InsertTaskResponse = N'Hws_InsertTaskResponse failed inserting data into Hws_TaskResponses'

	declare @localized_string_Hws_ActionInstancesUpdFailed_Hws_InsertTaskResponse nvarchar(100)
	set @localized_string_Hws_ActionInstancesUpdFailed_Hws_InsertTaskResponse = N'Hws_InsertTaskResponse failed updating data in Hws_ActionInstance'

	declare @localized_string_Hws_GetActorFailed_Hws_InsertTaskResponse nvarchar(100)
	set @localized_string_Hws_GetActorFailed_Hws_InsertTaskResponse = N'Hws_InsertTaskResponse failed executing Hws_GetActor'

	declare @localized_string_Hws_TasksUpdFailed_Hws_InsertTaskResponse nvarchar(100)
	set @localized_string_Hws_TasksUpdFailed_Hws_InsertTaskResponse = N'Hws_InsertTaskResponse failed updating data in Hws_Tasks'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END
	/*
		Object access order - Actors, ActionInstances, Tasks, Responses
	*/
	Declare @ActorID int
	Set @ActorID = 0

	EXEC @Ret = [dbo].[Hws_GetActor] @UserId=@ResponseActorUserID, @ActorId = @ActorID OUTPUT

	IF @@ERROR <> 0 OR @Ret <> 0 OR @ActorID IS NULL OR @ActorID = 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_GetActorFailed_Hws_InsertTaskResponse
		GOTO ROLLBACKTRAN
	 END
	/*
		Maintain the EndTime value in Hws_ActionInstances
	*/
	UPDATE	[dbo].[Hws_ActionInstances]
	SET	[EndTime] = @ResponseTime
	WHERE	[ActionInstanceID] = @ActionInstanceID

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActionInstancesUpdFailed_Hws_InsertTaskResponse
		GOTO ROLLBACKTRAN
	 END

	/*
		Get the status of the action instance
	*/
	DECLARE @ActionStatusID int
	
	SELECT	@ActionStatusID = CASE
			WHEN [Status] IS NULL THEN -1
			ELSE [Status]
		END
	FROM	[dbo].[Hws_ActionInstances]
	WHERE	ActionInstanceID = @ActionInstanceID

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActionInstancesUpdFailed_Hws_InsertTaskResponse
		GOTO ROLLBACKTRAN
	 END

	/*
		Maintain the task status and percentage complete values
		Make sure that this is the most recent response - due to the 
		async nature of the system it may not be and we don't want to overwrite
	*/
	IF NOT EXISTS ( SELECT 1 FROM [dbo].[Hws_TaskResponses] WHERE [ResponseTime] > @ResponseTime AND [TaskID] = @TaskID )
	 BEGIN
		/*
			Potential race conditions
			1. Action interrupt/finish written before this message
			2. Task message not written yet (in which case we won't get a row in the update below
			   but InsertTask handles this condition by checking for existing responses and writing 
			   the status of the latest response.
		*/
		IF @ActionStatusID IN ( 3, 4 ) AND @TaskStatusID NOT IN ( 4, 16, 128 ) /* Completed, Deferred, Declined */
		 BEGIN
			/*
				A race exists but it doesn't matter because the task status is a value that
				would be overwritten by the finish message.  Just update the current timestamp.
			*/
			UPDATE 	[dbo].[Hws_Tasks]
			SET	CurrentPercentageComplete = @PercentageComplete
			WHERE	TaskID = @TaskID
	
			IF @@ERROR <> 0
			 BEGIN
				SELECT @ErrorDesc = @localized_string_Hws_TasksUpdFailed_Hws_InsertTaskResponse
				GOTO ROLLBACKTRAN
			 END
		 END
		ELSE
		 BEGIN
			/*
				Either no race or race with a status that is not overwritten by cancelled/interrupt
			*/
			UPDATE 	[dbo].[Hws_Tasks]
			SET	CurrentTaskStatusID = @TaskStatusID
				,CurrentPercentageComplete = @PercentageComplete
			WHERE	TaskID = @TaskID
	
			IF @@ERROR <> 0
			 BEGIN
				SELECT @ErrorDesc = @localized_string_Hws_TasksUpdFailed_Hws_InsertTaskResponse
				GOTO ROLLBACKTRAN
			 END
		 END
	 END
	/*
		Finally insert the response
	*/
	INSERT INTO [dbo].[Hws_TaskResponses]
		(TaskResponseID,
		TaskID,
		ActivityFlowID,
		ActionInstanceID,
		ResponseTime,
		ResponseMessageID,
		ResponseActorID,
		TaskStatusID,
		PercentageComplete,
		ResponseProperties)
	VALUES
		(@TaskResponseID,
		@TaskID,
		@ActivityFlowID,
		@ActionInstanceID,
		@ResponseTime,
		@ResponseMessageID,
		@ActorID,
		@TaskStatusID,
		@PercentageComplete,
		@ResponseProperties)

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_TaskResponsesInsFailed_Hws_InsertTaskResponse
		GOTO ROLLBACKTRAN
	 END

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

grant execute on [dbo].[Hws_InsertTaskResponse] to BTS_HOST_USERS
GO


CREATE Procedure [dbo].[Hws_InsertActivationBlock]
        @ActivityFlowID uniqueidentifier,
        @ParentActionInstanceID uniqueidentifier,
        @ActivationBlockID uniqueidentifier,
        @ActivationBlockRootStepID int

As
Begin
	SET NOCOUNT ON


	DECLARE @LocalTran       bit
	,@Ret       int
	,@Error       int
	,@ErrorDesc      nvarchar(100)
	,@ExistActivationBlockID uniqueidentifier

	DECLARE @localized_string_Hws_ActivationBlocksInsFailed_Hws_InsertActivationBlock nvarchar(100)
 	set @localized_string_Hws_ActivationBlocksInsFailed_Hws_InsertActivationBlock = N'Hws_InsertActivationBlock failed inserting data into Hws_ParentActionInstanceActivationBlocks'

	DECLARE @localized_string_Hws_ActivationBlockInsFailedDuplicate_Hws_InserActivationBlock nvarchar(100)
	set @localized_string_Hws_ActivationBlockInsFailedDuplicate_Hws_InserActivationBlock = N'Hws_InsertActivationBlock failed - ActivationBlockID already exists for this ParentActionInstanceID'
 
 
	IF @@TRANCOUNT = 0
	BEGIN 
		SET @LocalTran = 1
		BEGIN TRANSACTION
	END
	ELSE
	BEGIN
  		SET @LocalTran = 0
	END


	--Make sure this block hasn't been executed yet
	SELECT @ExistActivationBlockID = ActivationBlockID
	FROM [dbo].[Hws_ParentActionInstanceActivationBlocks]
	WHERE ParentActionInstanceID = @ParentActionInstanceID AND
	ActivationBlockID = @ActivationBlockID

	IF @ExistActivationBlockID IS NOT NULL 
	BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivationBlockInsFailedDuplicate_Hws_InserActivationBlock
		GOTO ROLLBACKTRAN
	END
  


	--Need to insert a new ActivationBlock row
	INSERT INTO [dbo].[Hws_ParentActionInstanceActivationBlocks] 
 		(ActivityFlowID,
 		ParentActionInstanceID,
 		ActivationBlockID,
		ActivationBlockRootStepID)
	VALUES
 		(@ActivityFlowID,
		@ParentActionInstanceID,
		@ActivationBlockID,
		@ActivationBlockRootStepID)

	IF @@ERROR <> 0
	BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivationBlocksInsFailed_Hws_InsertActivationBlock
  		GOTO ROLLBACKTRAN
	END

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

grant execute on [dbo].[Hws_InsertActivationBlock] to HWS_WS_USER

GO


/*******************************************************************************************************

					UPDATE Procs

*******************************************************************************************************/

Create Procedure [dbo].[Hws_UpdateActivityFlow]
 @ActivityFlowID uniqueidentifier,
 @Status int
As
Begin
	SET NOCOUNT ON

    	--Need to update the ActivityFlow row's LastModifiedTime
	Update [dbo].[Hws_ActivityFlows] Set [Status]=@Status Where ([ActivityFlowID]=@ActivityFlowID)

	IF @@ERROR <> 0
		RETURN -1
	ELSE
		RETURN 0

END

GO

grant execute on [dbo].[Hws_UpdateActivityFlow] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_UpdateActivityFlow] to BTS_HOST_USERS
GO


Create Procedure [dbo].[Hws_UpdateIgnoreActivityFlow]
 @ActivityFlowID uniqueidentifier,
 @UserID nvarchar(50),
 @Ignore bit
As
 Begin

	SET NOCOUNT ON

	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)
		,@ActorID						int

	declare @localized_string_Hws_ActivityFlowsActorLinksUpdFailed_Hws_IgnoreActivityFlow nvarchar(100)
	set @localized_string_Hws_ActivityFlowsActorLinksUpdFailed_Hws_IgnoreActivityFlow = N'Hws_IgnoreActivityFlow failed updating data in Hws_ActivityFlow'
	
	declare @localized_string_Hws_ActorSelFailed_Hws_IgnoreActivityFlow nvarchar(100)
	set @localized_string_Hws_ActorSelFailed_Hws_IgnoreActivityFlow = N'Hws_IgnoreActivityFlow failed selecting actorid from Hws_Actors'

	SET @LocalTran = 0

	/*
		Don't need a transaction currently,
		uncomment this section to enforce 
		transactions if needed

	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END
	*/

	SELECT	@ActorID = ActorID
	FROM	[dbo].[Hws_Actors]
	WHERE	UserID = @UserID

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1 OR @ActorID IS NULL
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActorSelFailed_Hws_IgnoreActivityFlow
		GOTO ROLLBACKTRAN
	 END

	UPDATE	[dbo].[Hws_ActivityFlowsActorLinks]
	SET	IsIgnore = @Ignore
	WHERE	ActivityFlowID = @ActivityFlowID
	AND	ActivityFlowID = @ActivityFlowID
	AND	ActorID = @ActorID


	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsActorLinksUpdFailed_Hws_IgnoreActivityFlow
		GOTO ROLLBACKTRAN
	 END	

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


grant execute on [dbo].[Hws_UpdateIgnoreActivityFlow] to HWS_WS_USER
grant execute on [dbo].[Hws_UpdateIgnoreActivityFlow] to HWS_ADMIN_USER
GO

Create Procedure [dbo].[Hws_UpdateActionInstance]
 @ActionInstanceID uniqueidentifier,
 @ActivityFlowID uniqueidentifier,
 @Status int,
 @ActionTime datetime
As
Begin
	SET NOCOUNT ON

	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_Hws_ActionInstancesUpdFailed_Hws_UpdateActionInstance nvarchar(100)
	set @localized_string_Hws_ActionInstancesUpdFailed_Hws_UpdateActionInstance = N'Hws_UpdateActionInstance failed updating data in Hws_ActionInstances'

	declare @localized_string_Hws_ActivityFlowsUpdFailed_Hws_UpdateActionInstance nvarchar(100)
	set @localized_string_Hws_ActivityFlowsUpdFailed_Hws_UpdateActionInstance = N'Hws_UpdateActionInstance failed updated Hws_ActivityFlows.Status'

	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END
	/*
		If all action instances are in a finished or interrupted/aborted
		state then set the Hws_ActivityFlows.Status to inactive

		This query is written to access Hws_ActivityFlows first
		(object access order requires Hws_ActivityFlows to be accessed
		before Hws_ActionInstances to avoid deadlocking) 
	*/
	IF @Status IN ( 3, 4 ) -- Status of current instance is finished or aborted
	 BEGIN
		UPDATE	[dbo].[Hws_ActivityFlows]
		SET	[Status] = 2 -- Inactive
		FROM	[dbo].[Hws_ActivityFlows] af
		WHERE	[ActivityFlowID] = @ActivityFlowID
		AND	[ActivityFlowInternalID] NOT IN ( 
								SELECT	ai.[ActivityFlowInternalID] 
								FROM 	[dbo].[Hws_ActionInstances] ai 	
								WHERE 	ai.[ActivityFlowInternalID] = af.[ActivityFlowInternalID] 
								AND 	ai.[Status] NOT IN ( 3, 4 ) 
								AND	ai.[ActionInstanceID] != @ActionInstanceID ) 

		IF @@ERROR <> 0
		 BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsUpdFailed_Hws_UpdateActionInstance
			GOTO ROLLBACKTRAN
		 END
		
	 END

	UPDATE 	[dbo].[Hws_ActionInstances] 
	SET 	[Status]=@Status, [EndTime]=@ActionTime 
	WHERE 	[ActionInstanceID]=@ActionInstanceID
	AND	[Status] NOT IN ( 3, 4 ) -- Don't overwrite finish with sync and don't overwrite interrupt|aborted with finish

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActionInstancesUpdFailed_Hws_UpdateActionInstance
		GOTO ROLLBACKTRAN
	 END
	/*
		If the status of this instance is finished or aborted update the
		current status of any tasks associated to this instance that are not
		Completed, Deferred, Rejected/Declined

		NotStarted = 1, 
		InProgress = 2, 
		Completed = 4, 
		Waiting = 8, 
		Deferred = 16, 
		Accepted = 32, 
		Tentative = 64, 
		Declined = 128,
		Interrupted = 256,
		Finished = 512

		In keeping with object access order of Flow, Action, Task do this work
		here instead of in the status check above
	*/
	IF @Status IN ( 3, 4 ) -- Status of current instance is finished or aborted
	 BEGIN
		DECLARE @CurrentTaskStatusID int
		
		IF @Status = 3 -- Finished
			SELECT @CurrentTaskStatusID = 512  -- task finished
		ELSE
			SELECT @CurrentTaskStatusID = 256  -- task interrupted

		UPDATE	[dbo].[Hws_Tasks]
		SET	[CurrentTaskStatusID] = @CurrentTaskStatusID
		WHERE	[CurrentTaskStatusID]  NOT IN ( 4, 16, 128, 256 ) /* Completed, Deferred, Declined, Interrupted - don't overwrite interrupted with finished/cancelled */
		AND	[ActionInstanceID] = @ActionInstanceID

		IF @@ERROR <> 0
		 BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsUpdFailed_Hws_UpdateActionInstance  -- recycled - too late for new localized strings
			GOTO ROLLBACKTRAN
		 END
	 END

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

grant execute on [dbo].[Hws_UpdateActionInstance] to BTS_HOST_USERS
GO

/*******************************************************************************************************

					DELETE Procs

*******************************************************************************************************/

Create Procedure [dbo].[Hws_RemoveActivityFlow]
 @ActivityFlowID uniqueidentifier
As
Begin

	set nocount on
	/*
		2/26/2003
		Refined transaction handling
	*/
	DECLARE @LocalTran 						bit
		,@Ret							int
		,@Error							int
		,@ErrorDesc						nvarchar(100)

	declare @localized_string_Hws_TaskResponsesDelFailed_Hws_RemoveActivityFlow nvarchar(100)
	set @localized_string_Hws_TaskResponsesDelFailed_Hws_RemoveActivityFlow = N'Hws_RemoveActivityFlow failed deleting data from Hws_TaskResponses'

	declare @localized_string_Hws_TasksDelFailed_Hws_RemoveActivityFlow nvarchar(100)
	set @localized_string_Hws_TasksDelFailed_Hws_RemoveActivityFlow = N'Hws_RemoveActivityFlow failed deleting data from Hws_Tasks'

	declare @localized_string_Hws_ActionInstanceLinksDelFailed_Hws_RemoveActivityFlow nvarchar(100)
	set @localized_string_Hws_ActionInstanceLinksDelFailed_Hws_RemoveActivityFlow = N'Hws_RemoveActivityFlow failed deleting data from Hws_ActionInstanceLinks'

	declare @localized_string_Hws_ActionInstancesDelFailed_Hws_RemoveActivityFlow nvarchar(100)
	set @localized_string_Hws_ActionInstancesDelFailed_Hws_RemoveActivityFlow = N'Hws_RemoveActivityFlow failed deleting data from Hws_ActionInstances'

	declare @localized_string_Hws_ActivityFlowsActorLinksDelFailed_Hws_RemoveActivityFlow nvarchar(100)
	set @localized_string_Hws_ActivityFlowsActorLinksDelFailed_Hws_RemoveActivityFlow = N'Hws_RemoveActivityFlow failed deleting data from Hws_ActivityFlowsActorLinks'

	declare @localized_string_Hws_ActivityFlowsDelFailed_Hws_RemoveActivityFlow nvarchar(100)
	set @localized_string_Hws_ActivityFlowsDelFailed_Hws_RemoveActivityFlow = N'Hws_RemoveActivityFlow failed deleting data from Hws_ActivityFlows'

	declare	@localized_string_Hws_ParentActionInstActivBlocksDelFailed_Hws_RemoveActivityFlow nvarchar(100)
	set @localized_string_Hws_ParentActionInstActivBlocksDelFailed_Hws_RemoveActivityFlow = N'Hws_RemoveActivityFlow failed deleting data from Hws_ParentActionInstanceActivationBlocks'

	declare @localized_string_Hws_TaskReassignmentDelFailed_Hws_RemoveActivityFlow nvarchar(100)
	set @localized_string_Hws_TaskReassignmentDelFailed_Hws_RemoveActivityFlow = N'Hws_RemoveActivityFlow failed deleting data from Hws_TaskReassignment'
	
	IF @@TRANCOUNT = 0
	 BEGIN	
		SET @LocalTran = 1
		BEGIN TRANSACTION
	 END
	ELSE
	 BEGIN
		SET @LocalTran = 0
	 END
	
	Delete From [dbo].[Hws_TaskResponses] Where ([ActivityFlowID]=@ActivityFlowID)
	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_TaskResponsesDelFailed_Hws_RemoveActivityFlow
		GOTO ROLLBACKTRAN
	 END
	
	Delete  	[dbo].[Hws_TaskReassignment] 
	From		[dbo].[Hws_TaskReassignment] tr
	Inner Join	[dbo].[Hws_Tasks] t
	on		tr.TaskID = t.TaskID
	Where 		(t.[ActivityFlowID]=@ActivityFlowID)

	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_TaskReassignmentDelFailed_Hws_RemoveActivityFlow
		GOTO ROLLBACKTRAN
	 END

	Delete From [dbo].[Hws_Tasks] Where ([ActivityFlowID]=@ActivityFlowID)
	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_TasksDelFailed_Hws_RemoveActivityFlow
		GOTO ROLLBACKTRAN
	 END

	Delete From [dbo].[Hws_ActionInstanceLinks] Where ([ActivityFlowID]=@ActivityFlowID)
	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActionInstanceLinksDelFailed_Hws_RemoveActivityFlow
		GOTO ROLLBACKTRAN
	 END

	Delete From [dbo].[Hws_ActionInstances] Where ([ActivityFlowID]=@ActivityFlowID)
	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActionInstancesDelFailed_Hws_RemoveActivityFlow
		GOTO ROLLBACKTRAN
	 END

	Delete From [dbo].[Hws_ActivityFlowsActorLinks] Where ([ActivityFlowID]=@ActivityFlowID)
	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsActorLinksDelFailed_Hws_RemoveActivityFlow
		GOTO ROLLBACKTRAN
	 END

	Delete From [dbo].[Hws_ActivityFlows] Where ([ActivityFlowID]=@ActivityFlowID)
	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivityFlowsDelFailed_Hws_RemoveActivityFlow
		GOTO ROLLBACKTRAN
	 END


	Delete From [dbo].[Hws_ParentActionInstanceActivationBlocks] Where ([ActivityFlowID]=@ActivityFlowID)
	IF @@ERROR <> 0
	 BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ParentActionInstActivBlocksDelFailed_Hws_RemoveActivityFlow
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
grant execute on [dbo].[Hws_RemoveActivityFlow] to HWS_ADMIN_USER
GO


/* compensating transaction in case if adding activation block failed */

CREATE PROCEDURE [dbo].[Hws_RemoveActivationBlock] 	
	@ParentActionInstanceID uniqueidentifier,
	@ActivationBlockID uniqueidentifier

AS
Begin
	SET NOCOUNT ON


	DECLARE @LocalTran 	bit
	,@Ret       		int
	,@Error       		int
	,@ErrorDesc      	nvarchar(100)

	declare @localized_string_Hws_ActivationBlocksDelFailed_Hws_RemoveActivationBlock nvarchar(100)
	set @localized_string_Hws_ActivationBlocksDelFailed_Hws_RemoveActivationBlock = N'Hws_RemoveActivationBlock failed deleting ActivationBlock from Hws_ParentActionInstanceActivationBlocks'

  
	IF @@TRANCOUNT = 0
	BEGIN 
		SET @LocalTran = 1
		BEGIN TRANSACTION
	END
	ELSE
	BEGIN
		SET @LocalTran = 0
	END


	--Delete an ActivationBlock row
	DELETE Hws_ParentActionInstanceActivationBlocks
	WHERE 	ParentActionInstanceID = @ParentActionInstanceID
	AND	ActivationBlockID = @ActivationBlockID


	IF @@ERROR <> 0
	BEGIN
		SELECT @ErrorDesc = @localized_string_Hws_ActivationBlocksDelFailed_Hws_RemoveActivationBlock
		GOTO ROLLBACKTRAN
	END

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

grant execute on [dbo].[Hws_RemoveActivationBlock] to HWS_WS_USER

GO

CREATE Procedure [dbo].[Hws_DeleteInterruptedActivationBlock]
        @ActionInstanceID uniqueidentifier
As
Begin
	SET NOCOUNT ON


	DECLARE @LocalTran       bit
	,@Ret       int
	,@Error       int
	,@ErrorDesc      nvarchar(100)
	,@ActivityFlowID uniqueidentifier
	,@ParentActionInstanceID uniqueidentifier
	,@ActivationBlockRootStepID int

	DECLARE @localized_string_Hws_ActivationBlocksDelFailed_Hws_DeleteInterruptedActivationBlock nvarchar(100)
	set @localized_string_Hws_ActivationBlocksDelFailed_Hws_DeleteInterruptedActivationBlock = N'Hws_DeleteInterruptedActivationBlock failed - Failed to delete activation block for interrupted action instance.'


	IF @@TRANCOUNT = 0
	BEGIN 
		SET @LocalTran = 1
		BEGIN TRANSACTION
	END
	ELSE
	BEGIN
  		SET @LocalTran = 0
	END

	--Get the ParentActionInstanceID and ActivityFlowID for
	--this action instance.
	SELECT @ActivityFlowID = ActivityFlowID, 
	             @ParentActionInstanceID = ParentActionInstanceID
	FROM [dbo].[Hws_ActionInstanceLinks] 
	WHERE ChildActionInstanceID = @ActionInstanceID

	--Get the activity model step id for this action instance
	SELECT @ActivationBlockRootStepID = ActivityModelStepID
	FROM [dbo].[Hws_ActionInstances] 
	WHERE ActionInstanceID = @ActionInstanceID

	IF @ActivityFlowID IS NOT NULL AND @ParentActionInstanceID IS NOT NULL AND @ActivationBlockRootStepID IS NOT NULL
	BEGIN
		DELETE FROM [dbo].[Hws_ParentActionInstanceActivationBlocks] 
		WHERE ActivityFlowID = @ActivityFlowID
		AND      ParentActionInstanceID = @ParentActionInstanceID
		AND      ActivationBlockRootStepID = @ActivationBlockRootStepID
		
		IF @@ERROR <> 0
		BEGIN
			SELECT @ErrorDesc = @localized_string_Hws_ActivationBlocksDelFailed_Hws_DeleteInterruptedActivationBlock
  			GOTO ROLLBACKTRAN
		END
	END

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

grant execute on [dbo].[Hws_DeleteInterruptedActivationBlock] to HWS_WS_USER

GO


