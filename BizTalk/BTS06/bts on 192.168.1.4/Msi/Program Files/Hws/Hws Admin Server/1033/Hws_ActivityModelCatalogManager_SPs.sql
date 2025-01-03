--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_CreateActivationBlock]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_CreateActivationBlock]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_CreateActivityModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_CreateActivityModel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_CreateActivityModelStepRelation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_CreateActivityModelStepRelation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_CreateActivityModelSteps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_CreateActivityModelSteps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_CreateDependentBlock]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_CreateDependentBlock]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_DeleteActivityModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_DeleteActivityModel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivationBlocks]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivationBlocks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityModel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityModelsForAction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityModelsForAction]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityModelStepRelations]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityModelStepRelations]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityModelSteps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityModelSteps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetDependentBlocks]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetDependentBlocks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_CreateActivityModelStepRelInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_CreateActivityModelStepRelInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_UpdateActivityModelState]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_UpdateActivityModelState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActivityModelState]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActivityModelState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActivityModelGetAllBlocksAndSteps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_ActivityModelGetAllBlocksAndSteps]
GO

IF OBJECT_ID(N'ActivityModelStepRelInfoDeleteTrigger') IS NOT NULL
	DROP TRIGGER ActivityModelStepRelInfoDeleteTrigger
GO

IF OBJECT_ID(N'ActivityModelTargetXPathsDeleteTrigger') IS NOT NULL
	DROP TRIGGER ActivityModelTargetXPathsDeleteTrigger
GO

IF OBJECT_ID(N'ActivityModelTargetXPathsInsertTrigger') IS NOT NULL
	DROP TRIGGER ActivityModelTargetXPathsInsertTrigger
GO

IF OBJECT_ID(N'ActivityModelTaskMessageTypesDeleteTrigger') IS NOT NULL
	DROP TRIGGER ActivityModelTaskMessageTypesDeleteTrigger
GO

IF OBJECT_ID(N'ActivityModelTaskMessageTypesInsertTrigger') IS NOT NULL
	DROP TRIGGER ActivityModelTaskMessageTypesInsertTrigger
GO

IF OBJECT_ID(N'ActivityModelsInsertTrigger') IS NOT NULL
	DROP TRIGGER ActivityModelsInsertTrigger
GO

IF OBJECT_ID(N'ActivityModelsUpdateTrigger') IS NOT NULL
	DROP TRIGGER ActivityModelsUpdateTrigger
GO

IF OBJECT_ID(N'DeleteActivityModel') IS NOT NULL
	DROP TRIGGER DeleteActivityModel
GO



Create Proc [dbo].[Hws_CreateActivationBlock] (
	@ActivityModelId			Hws_type_ActivityModelId,
	@ActivationBlockGuid		Hws_type_ActivationBlockId,
	@IndependentStepId              Hws_type_ActivityModelStepId,
	@ActivationBlockDescription     Hws_type_ActivationBlockDescription = null)
As
Begin
    insert into [dbo].[ActivityModelActivationBlocks] (
	 ActivityModelGuid,
	 ActivationBlockGuid,
	 IndependentStepId,
	 ActivationBlockDescription)
    values (
	@ActivityModelId,
	@ActivationBlockGuid,
	@IndependentStepId,
	@ActivationBlockDescription)
End

GO

grant execute on [dbo].[Hws_CreateActivationBlock] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_CreateActivationBlock] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_CreateActivityModel] (
	@ActivityModelId    		Hws_type_ActivityModelId,
	@ActivityModelName  		Hws_type_ActivityModelName,
	@ActivityModelAuthor      Hws_type_ActivityModelAuthor,
	@ActivityModelDescription Hws_type_ActivityModelDescription = null,
	@Version				Hws_type_ActivityModelVersion = null,
	@ActivityModelBlob		ntext = null,
	@IsVisibilityOpen		bit,
	@IsMutable				bit,
	@IsActive               bit)
As
Begin
   
   insert into [dbo].[ActivityModels] (
	 ActivityModelGuid, 
	 ActivityModelName, 
	 ActivityModelDescription,
	 Version,
	 ActivityModelAuthor,
	 ActivityModelBlob,
	 IsVisibilityOpen,
	 IsMutable,
	 IsActive)
    values (
	@ActivityModelId,
	@ActivityModelName,
	@ActivityModelDescription,
	@Version,
	@ActivityModelAuthor,
	@ActivityModelBlob,
	@IsVisibilityOpen,
	@IsMutable,
	@IsActive)
End

GO
grant execute on [dbo].[Hws_CreateActivityModel] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_CreateActivityModel] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_CreateActivityModelStepRelInfo] (  
 @ActivityModelId uniqueidentifier,   
 @ParentStepId int,   
 @ChildStepId int,   
 @TaskMessageType Hws_type_HwsTaskMessageType,   
 @TargetXPath Hws_type_TargetXPath)  
As  
Begin  
	Declare @TaskMessageTypeId int  
	Declare @TargetXPathId int  
	Declare @LocalTran bit
	Declare @localized_string_Hws_Failed_To_Create_StepRelInfo nvarchar(512)
	set @localized_string_Hws_Failed_To_Create_StepRelInfo = N'Failed to create ActivityModel step relation information.'
	
	
	select @TaskMessageTypeId = null  
	select @TargetXPathId = null  
	
	if (@TaskMessageType is null)
		select @TaskMessageTypeId = TaskMessageTypeId from [dbo].[ActivityModelTaskMessageTypes] where TaskMessageType Is Null
	else
		select @TaskMessageTypeId = TaskMessageTypeId from [dbo].[ActivityModelTaskMessageTypes] where TaskMessageType = @TaskMessageType  
	
	if (@TargetXPath is null)
		select @TargetXPathId = TargetXPathId from [dbo].[ActivityModelTargetXPaths] where  XPathFromParentStep Is Null  
	else
		select @TargetXPathId = TargetXPathId from [dbo].[ActivityModelTargetXPaths] where XPathFromParentStep = @TargetXPath  
	
	if (@@TranCount = 0)
	Begin
		Set @LocalTran = 1
		Begin Tran 
	End
	else
	Begin
		Set @LocalTran = 0
	End

	if (@TaskMessageTypeId is null)  
	begin  
		insert into [dbo].[ActivityModelTaskMessageTypes] values (@TaskMessageType)  

		if (@TaskMessageType is null)
			select @TaskMessageTypeId = TaskMessageTypeId from [dbo].[ActivityModelTaskMessageTypes] where TaskMessageType Is Null
		else
			select @TaskMessageTypeId = TaskMessageTypeId from [dbo].[ActivityModelTaskMessageTypes] where TaskMessageType = @TaskMessageType  
	end  

	if (@TargetXPathId is null)  
	begin  
		insert into ActivityModelTargetXPaths values (@TargetXPath)  
		if (@TargetXPath is null)
			select @TargetXPathId = TargetXPathId from [dbo].[ActivityModelTargetXPaths] where  XPathFromParentStep Is Null  
		else
			select @TargetXPathId = TargetXPathId from [dbo].[ActivityModelTargetXPaths] where XPathFromParentStep = @TargetXPath  
	end  

	insert into [dbo].[ActivityModelStepRelInfo] (ActivityModelGuid, ParentStepId, ChildStepId, TaskMessageTypeId, TargetXPathId)  
	values (@ActivityModelId, @ParentStepId, @ChildStepId, @TaskMessageTypeId, @TargetXPathId)  

	if (@@Error <> 0)  
	begin  
		RaisError(@localized_string_Hws_Failed_To_Create_StepRelInfo, 16, 1)
		if (@@TranCount > 0 and @LocalTran = 1) 
		Begin
			Rollback Tran 
		End
		return  
	end  

	if (@LocalTran = 1) Commit Tran 
End

GO
grant execute on [dbo].[Hws_CreateActivityModelStepRelInfo] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_CreateActivityModelStepRelInfo] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_CreateActivityModelStepRelation] (  
 @ActivityModelId   Hws_type_ActivityModelId,  
 @ParentStepId   Hws_type_ActivityModelStepId,  
 @ChildStepId   Hws_type_ActivityModelStepId,  
 @TaskMessageType      Hws_type_HwsTaskMessageType = null,   
 @TargetXPath       Hws_type_TargetXPath = null,  
 @IsDependentOnParent bit)  
As  
Begin  
	Declare @LocalTran bit
	Declare @localized_string_Hws_Failed_To_Create_StepRel nvarchar(512)
	set @localized_string_Hws_Failed_To_Create_StepRel = N'Failed to create ActivityModel step relation.'

	if (@@TranCount = 0)
	Begin
		Set @LocalTran = 1
		Begin Tran 
	End
	Else
	Begin
		Set @LocalTran = 0
	End

	insert into [dbo].[ActivityModelStepRel](ActivityModelGuid, ParentStepId, ChildStepId, IsDependentOnParent)  
		values (@ActivityModelId, @ParentStepId, @ChildStepId, @IsDependentOnParent)  
	
	if (@IsDependentOnParent = 0)  
	Begin  
		exec [dbo].[Hws_CreateActivityModelStepRelInfo] @ActivityModelId, @ParentStepId, @ChildStepId, @TaskMessageType, @TargetXPath   
		if (@@Error <> 0)  
		Begin
			RaisError (@localized_string_Hws_Failed_To_Create_StepRel, 16, 1)  
			if (@@TranCount > 0 and @LocalTran = 1) 
			Begin
				Rollback Tran
			End
			return  
		End  
	End  
	if (@LocalTran = 1) Commit Tran
End  

GO
grant execute on [dbo].[Hws_CreateActivityModelStepRelation] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_CreateActivityModelStepRelation] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_CreateActivityModelSteps] (
	@ActivityModelId			Hws_type_ActivityModelId,
	@ActivityModelStepId		Hws_type_ActivityModelStepId,
	@ActivityModelStepName		Hws_type_ActivityModelStepName = null,
	@ActivityModelStepDescription	Hws_type_ActivityModelStepDescription = null,
	@ActionTypeId			Hws_type_ActionTypeId,
	@ActionName			nvarchar(512) = null,
	@DefaultActivationMessage	ntext = null,
	@IsActivationMessageImmutable	bit = null,
	@IsRootStep                     bit)
As
Begin
     insert into [dbo].[ActivityModelSteps] (
	ActivityModelGuid,
	ActivityModelStepId,
	ActivityModelStepName,
	ActionName,
	ActivityModelStepDescription,
	ActionTypeId,
	DefaultActivationMessage,
	IsActivationMessageImmutable,
	IsRootStep)
     values (
	@ActivityModelId,
	@ActivityModelStepId,
	@ActivityModelStepName,
	@ActionName,
	@ActivityModelStepDescription,
	@ActionTypeId,
	@DefaultActivationMessage,
	@IsActivationMessageImmutable,
	@IsRootStep)

End

GO
grant execute on [dbo].[Hws_CreateActivityModelSteps] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_CreateActivityModelSteps] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_CreateDependentBlock] (
	@ActivityModelId			Hws_type_ActivityModelId,
	@ActivationBlockGuid		Hws_type_ActivationBlockId,
	@DependentBlockGuid		Hws_type_ActivationBlockId,
	@DependentStepId		Hws_type_ActivityModelStepId)
As
Begin
     insert into [dbo].[ActivityModelDependentBlocks] (
	ActivityModelGuid,
	ActivationBlockGuid,
	DependentBlockGuid,
	DependentStepId)
     values (
	@ActivityModelId,
	@ActivationBlockGuid,
	@DependentBlockGuid,
	@DependentStepId)
End

GO
grant execute on [dbo].[Hws_CreateDependentBlock] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_CreateDependentBlock] to HWS_AM_DESIGNER
GO

create proc [dbo].[Hws_DeleteActivityModel] (@ActivityModelId Hws_type_ActivityModelId)
as
begin

  -- A delete from ActivityModels table cascades a delete across rest of the tables.
  delete from ActivityModels where ActivityModelGuid = @ActivityModelId

end

GO
grant execute on [dbo].[Hws_DeleteActivityModel] to HWS_ADMIN_USER
GO

Create Proc [dbo].[Hws_GetActivationBlocks](
	@ActivityModelId Hws_type_ActivityModelId)
As
Begin
	select "ActivityModelId" = ActivityModelGuid,
	       "ActivationBlockId" = ActivationBlockGuid,
	       "IndependentStepId" = IndependentStepId,
	       "Description" = ActivationBlockDescription
        from [dbo].[ActivityModelActivationBlocks]
	where ActivityModelGuid = @ActivityModelId
End

GO

grant execute on [dbo].[Hws_GetActivationBlocks] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivationBlocks] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_GetActivationBlocks] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_GetActivityModel] (@ActivityModelId Hws_type_ActivityModelId = null) as
Begin
    if @ActivityModelId is null
	select 	"ActivityModelId" = ActivityModelGuid,
		"Name" = ActivityModelName,
		"Description" = ActivityModelDescription,
		"Version" = Version,
		"AdditionalInfo" = ActivityModelBlob,
		"VisibilityOpen" = IsVisibilityOpen,
		"Mutable" = IsMutable,
		"Author"  = ActivityModelAuthor,
		"IsActive" = IsActive
	from [dbo].[ActivityModels]
    else
	select 	"ActivityModelId" = ActivityModelGuid,
		"Name" = ActivityModelName,
		"Description" = ActivityModelDescription,
		"Version" = Version,
		"AdditionalInfo" = ActivityModelBlob,
		"VisibilityOpen" = IsVisibilityOpen,
		"Mutable" = IsMutable,
		"Author"  = ActivityModelAuthor,
		"IsActive" = IsActive
	from [dbo].[ActivityModels]
	where ActivityModelGuid = @ActivityModelId
End

GO

grant execute on [dbo].[Hws_GetActivityModel] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivityModel] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_GetActivityModel] to HWS_AM_DESIGNER
GO

Create proc [dbo].[Hws_GetActivityModelsForAction] (@ActionTypeId Hws_type_ActionTypeId)
as
Begin
	select "ActivityModelId" = ActivityModelGuid,
	       "Name" = ActivityModelName
	from [dbo].[ActivityModels]
	where ActivityModelGuid in (select ActivityModelGuid 
				    from [dbo].[ActivityModelSteps]
				    where ActionTypeId = @ActionTypeId)
	and IsActive = 1
End

GO

grant execute on [dbo].[Hws_GetActivityModelsForAction] to HWS_ADMIN_USER
GO

Create Proc [dbo].[Hws_GetActivityModelStepRelations] (
	@ActivityModelId Hws_type_ActivityModelId)
As
Begin
	select "ActivityModelId" = ActivityModelGuid, 
	       "ParentStepId"  = ParentStepId, 
	       "ChildStepId"   = ChildStepId, 
	       "TaskMessageTypeFromParent" = null, 
	       "XPathFromParentStep" = null,
	       "DependentOnParent" = IsDependentOnParent
	from [dbo].[ActivityModelStepRel]
	where IsDependentOnParent = 1
	and ActivityModelGuid = @ActivityModelId
	union
	select "ActivityModelId" = sRelInfo.ActivityModelGuid, 
	       "ParentStepId"  = sRelInfo.ParentStepId, 
	       "ChildStepId"   = sRelInfo.ChildStepId, 
	       "TaskMessageTypeFromParent" = TaskMessageType, 
	       "XPathFromParentStep" = XPathFromParentStep,
	       "DependentOnParent" = IsDependentOnParent
	from [dbo].[ActivityModelStepRel] sRel, [dbo].[ActivityModelStepRelInfo] sRelInfo, 
	[dbo].[ActivityModelTaskMessageTypes] messageTypes, [dbo].[ActivityModelTargetXPaths] xPaths
	where sRel.ActivityModelGuid = @ActivityModelId
	and sRelInfo.ActivityModelGuid = sRel.ActivityModelGuid
	and sRelInfo.ParentStepId    = sRel.ParentStepId
	and sRelInfo.ChildStepId     = sRel.ChildStepId 
	and sRelInfo.TaskMessageTypeId = messageTypes.TaskMessageTypeId
	and sRelInfo.TargetXPathId = xPaths.TargetXPathId
End

GO

grant execute on [dbo].[Hws_GetActivityModelStepRelations] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivityModelStepRelations] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_GetActivityModelStepRelations] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_GetActivityModelSteps] (
	@ActivityModelId Hws_type_ActivityModelId, 
	@ActivityModelStepId  Hws_type_ActivityModelStepId = null
)
as
Begin
    if @ActivityModelStepId is null
	select "ActivityModelId" = models.ActivityModelGuid,
	       "ActivityModelName" = models.ActivityModelName,
	       "StepId" = steps.ActivityModelStepId,
	       "StepName" = steps.ActivityModelStepName,
	       "Description" = steps.ActivityModelStepDescription,
	       "ActionName" = steps.ActionName,
	       "ActionTypeId" = steps.ActionTypeId,
	       "DefaultActivationMessage" = steps.DefaultActivationMessage,
	       "MessageImmutable" = steps.IsActivationMessageImmutable,
	       "RootStep" = steps.IsRootStep
	from [dbo].[ActivityModelSteps] steps, [dbo].[ActivityModels] models
	where steps.ActivityModelGuid = @ActivityModelId
	and   steps.ActivityModelGuid = models.ActivityModelGuid 
    else
	select "ActivityModelId" = models.ActivityModelGuid,
	       "ActivityModelName" = models.ActivityModelName,
	       "StepId" = steps.ActivityModelStepId,
	       "StepName" = steps.ActivityModelStepName,
	       "Description" = steps.ActivityModelStepDescription,
	       "ActionName" = steps.ActionName,
	       "ActionTypeId" = steps.ActionTypeId,
	       "DefaultActivationMessage" = steps.DefaultActivationMessage,
	       "MessageImmutable" = steps.IsActivationMessageImmutable,
	       "RootStep" = steps.IsRootStep
	from [dbo].[ActivityModelSteps] steps, [dbo].[ActivityModels] models
	where steps.ActivityModelGuid = @ActivityModelId
	and ActivityModelStepId = @ActivityModelStepId 
	and   steps.ActivityModelGuid = models.ActivityModelGuid 
End

GO

grant execute on [dbo].[Hws_GetActivityModelSteps] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivityModelSteps] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_GetActivityModelSteps] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_GetDependentBlocks] (
	@ActivityModelId Hws_type_ActivityModelId,
	@ActivationBlockId Hws_type_ActivationBlockId,
	@DependentBlockId Hws_type_ActivationBlockId = null)
As
Begin
	if @DependentBlockId is null
		select "ActivityModelId" = ActivityModelGuid,
		       "ActivationBlockId" = ActivationBlockGuid,
		       "DependentBlockId" = DependentBlockGuid,
		       "DependentStepId" = DependentStepId
		from [dbo].[ActivityModelDependentBlocks]
		where ActivityModelGuid = @ActivityModelId
		and ActivationBlockGuid = @ActivationBlockId
		order by DependentBlockGuid
	else
		select "ActivityModelId" = ActivityModelGuid,
		       "ActivationBlockId" = ActivationBlockGuid,
		       "DependentBlockId" = DependentBlockGuid,
		       "DependentStepId" = DependentStepId
		from [dbo].[ActivityModelDependentBlocks]
		where ActivityModelGuid = @ActivityModelId
		and ActivationBlockGuid = @ActivationBlockId
		and DependentBlockGuid = @DependentBlockId
End

GO

grant execute on [dbo].[Hws_GetDependentBlocks] to HWS_WS_USER
grant execute on [dbo].[Hws_GetDependentBlocks] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_GetDependentBlocks] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_GetActivityModelState] (
	@ActivityModelId Hws_type_ActivityModelId)
As
Begin
	select "ActivityModelState" = IsActive 
	from [dbo].[ActivityModels]
	Where ActivityModelGuid = @ActivityModelId
End

GO

grant execute on [dbo].[Hws_GetActivityModelState] to HWS_WS_USER
grant execute on [dbo].[Hws_GetActivityModelState] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_GetActivityModelState] to HWS_AM_DESIGNER
GO

Create Proc [dbo].[Hws_UpdateActivityModelState] (
	@ActivityModelId Hws_type_ActivityModelId,
	@ActivityModelState bit)
As
Begin
	Update [dbo].[ActivityModels]
	Set IsActive = @ActivityModelState
	Where ActivityModelGuid = @ActivityModelId
End

GO

grant execute on [dbo].[Hws_UpdateActivityModelState] to HWS_ADMIN_USER
grant execute on [dbo].[Hws_UpdateActivityModelState] to HWS_AM_DESIGNER
GO

create procedure [dbo].[Hws_ActivityModelGetAllBlocksAndSteps]
as
 begin	
	select		[ActivityModelGuid], [ActivationBlockGuid], [IndependentStepId]
	from		[BizTalkHwsDb].[dbo].[ActivityModelActivationBlocks]
	union all
	select		[ActivityModelGuid], [ActivationBlockGuid], [DependentStepId]
	from		[BizTalkHwsDb].[dbo].[ActivityModelDependentBlocks]
 end
GO

grant execute on [dbo].[Hws_ActivityModelGetAllBlocksAndSteps] to HWS_ADMIN_USER
GO
/*
	Create ActivityModel triggers
*/


create trigger ActivityModelStepRelInfoDeleteTrigger on ActivityModelStepRelInfo for delete
as
begin
	Declare @ActivityModelGuid	Hws_type_ActivityModelId
	Declare @ParentStepId		Hws_type_ActivityModelStepId
	Declare @ChildStepId		Hws_type_ActivityModelStepId
	Declare @TaskMessageTypeId	int
	Declare @TargetXPathId		int

	Declare ActivityModelStepRelInfoDeleted cursor 
	local forward_only 
	for select * from deleted


	Open ActivityModelStepRelInfoDeleted
	Fetch next from ActivityModelStepRelInfoDeleted 
	into @ActivityModelGuid, @ParentStepId, @ChildStepId, @TaskMessageTypeId, @TargetXPathId

	if @@Fetch_Status <> 0
        begin
          Close ActivityModelStepRelInfoDeleted
          Deallocate ActivityModelStepRelInfoDeleted
	  return
        end

	Begin Tran
	while @@Fetch_Status = 0
	begin
		--Print 'About to delete TargetXPathId ' + Convert(nvarchar(10), @TargetXPathId)
		if ((select count(*) from ActivityModelStepRelInfo where TargetXPathId = @TargetXPathId) = 0)
		   delete from ActivityModelTargetXPaths where TargetXPathId = @TargetXPathId
		--Print 'Error code: ' + Convert(nvarchar(10), @@Error)

		--Print 'About to delete TaskMessageTypeId ' + Convert(nvarchar(10), @TaskMessageTypeId)
		if ((select count(*) from ActivityModelStepRelInfo where TaskMessageTypeId = @TaskMessageTypeId) = 0)
			delete from ActivityModelTaskMessageTypes where TaskMessageTypeId = @TaskMessageTypeId
		--Print 'Error code: ' + Convert(nvarchar(10), @@Error)
	
		Fetch next from ActivityModelStepRelInfoDeleted 
		into @ActivityModelGuid, @ParentStepId, @ChildStepId, @TaskMessageTypeId, @TargetXPathId
	end
	Commit Tran
        Close ActivityModelStepRelInfoDeleted
        Deallocate ActivityModelStepRelInfoDeleted
end

GO

create trigger ActivityModelTargetXPathsDeleteTrigger on dbo.ActivityModelTargetXPaths for delete  
as  
begin  
	Declare @TargetXPathId int  
	Declare @XPathFromParentStep Hws_type_TargetXPath
	Declare @localized_string_Hws_XPath_Has_Active_References nvarchar(512)
	set @localized_string_Hws_XPath_Has_Active_References = N'Failed to delete one or more rows because XPaths are being referenced by ActivityModelStepRelInfo.'
	
	Declare TargetXPathsDeleted cursor   
	local forward_only   
	for select * from deleted  
	
	Open TargetXPathsDeleted  
	Fetch next from TargetXPathsDeleted into @TargetXPathId, @XPathFromParentStep  
	
	if @@Fetch_Status <> 0  
		return  
	
	Begin Tran  
		while @@Fetch_Status = 0  
		begin  
			if ((select count(*) from ActivityModelStepRelInfo where TargetXPathId = @TargetXPathId) > 0)  
			begin  
				--Print 'Cannot delete TargetXPathId ' + Convert(nvarchar(10), @TargetXPathId)  
				RaisError(@localized_string_Hws_XPath_Has_Active_References,0, 1)  
				Rollback Tran  
				return   
			end  
			--Print 'Deleting TargetXPathId ' + Convert(nvarchar(10), @TargetXPathId)  
			Fetch next from TargetXPathsDeleted into @TargetXPathId, @XPathFromParentStep  
		end  
	Commit Tran  
	Close TargetXPathsDeleted
	Deallocate TargetXPathsDeleted
end

GO

create trigger ActivityModelTargetXPathsInsertTrigger on dbo.ActivityModelTargetXPaths for insert  
as  
begin  
	Declare @TargetXPath Hws_type_TargetXPath  
	Declare @localized_string_Hws_Duplicate_XPath_Entry nvarchar(512)
	set @localized_string_Hws_Duplicate_XPath_Entry = N'Failed to insert a duplicate entry for XPath into the ActivityModelTargetXPaths table.'

	select @TargetXPath = XPathFromParentStep from inserted
	if (@TargetXPath is null)
	begin
		if ((select count(*) from ActivityModelTargetXPaths where XPathFromParentStep is Null) > 1)  
		begin  
			RaisError(@localized_string_Hws_Duplicate_XPath_Entry, 0, 1)  
			rollback tran  
		end  
	end
	else
	begin
		if ((select count(*) from ActivityModelTargetXPaths where XPathFromParentStep = @TargetXPath) > 1)  
		begin  
			RaisError(@localized_string_Hws_Duplicate_XPath_Entry, 0, 1)  
			rollback tran  
		end  
	end
end

GO

create trigger ActivityModelTaskMessageTypesDeleteTrigger on dbo.ActivityModelTaskMessageTypes for delete  
as  
begin  
	Declare @TaskMessageTypeId int  
	Declare @TaskMessageType Hws_type_HwsTaskMessageType  
	Declare @localized_string_Hws_TaskMessageType_Has_Active_References nvarchar(512)
	set @localized_string_Hws_TaskMessageType_Has_Active_References = N'Failed to delete one or more rows because TaskMessageTypes are being referenced by ActivityModelStepRelInfo.'

	
	Declare TaskMessageTypesDeleted cursor   
	local forward_only   
	for select * from deleted  
	
	Open TaskMessageTypesDeleted  
	Fetch next from TaskMessageTypesDeleted into @TaskMessageTypeId, @TaskMessageType  
	
	if @@Fetch_Status <> 0  
	return  
	
	Begin Tran  
		while @@Fetch_Status = 0  
		begin  
			if ((select count(*) from ActivityModelStepRelInfo where TaskMessageTypeId = @TaskMessageTypeId) > 0)  
			begin  
				--Print 'Cannot delete TaskMessageTypeId ' + Convert(nvarchar(10), @TaskMessageTypeId)  
				RaisError(@localized_string_Hws_TaskMessageType_Has_Active_References,0, 1)  
				rollback tran  
				return   
			end  
			--Print 'Deleting TaskMessageTypeId ' + Convert(nvarchar(10), @TaskMessageTypeId)  
			Fetch next from TaskMessageTypesDeleted into @TaskMessageTypeId, @TaskMessageType  
		end  
	Commit Tran  
	
	Close TaskMessageTypesDeleted  
	Deallocate TaskMessageTypesDeleted  
	
end

GO

create trigger ActivityModelTaskMessageTypesInsertTrigger on dbo.ActivityModelTaskMessageTypes for insert  
as  
begin  
	Declare @TaskMessageType Hws_type_HwsTaskMessageType 
	Declare @localized_string_Hws_Duplicate_TaskMessageType_Entry nvarchar(512)
	set @localized_string_Hws_Duplicate_TaskMessageType_Entry = N'Failed to insert a duplicate entry for TaskMessageType into the ActivityModelTaskMessageTypes table.'


	select @TaskMessageType = TaskMessageType from inserted
	if (@TaskMessageType is null)
	begin
		if ((select count(*) from ActivityModelTaskMessageTypes where TaskMessageType Is Null) > 1)
		begin  
			RaisError(@localized_string_Hws_Duplicate_TaskMessageType_Entry, 0, 1)  
			rollback tran  
		end  
	end
	else
		begin
		if ((select count(*) from ActivityModelTaskMessageTypes where TaskMessageType = @TaskMessageType) > 1)  
		begin  
			RaisError(@localized_string_Hws_Duplicate_TaskMessageType_Entry, 0, 1)  
			rollback tran  
		end  
	end

end

GO

Create trigger ActivityModelsInsertTrigger on ActivityModels for insert
as
Begin
	Declare @ActivityModelName Hws_type_ActivityModelName
	Declare @IsActive bit
	Declare @localized_string_Hws_AcivityModel_Same_Name_Already_Active1 nvarchar(512)
	set @localized_string_Hws_AcivityModel_Same_Name_Already_Active1 = N'An activity model with the name %s is already active.'

	select @ActivityModelName = ActivityModelName, @IsActive = IsActive from Inserted

	if ((select count(ActivityModelName) from [dbo].[ActivityModels]
		   where ActivityModelName = @ActivityModelName 
		   and IsActive = @IsActive) > 1)
	Begin
		RaisError(@localized_string_Hws_AcivityModel_Same_Name_Already_Active1, 16, 1, @ActivityModelName)
		Rollback Tran
		return 
	End
End

GO


Create trigger ActivityModelsUpdateTrigger on ActivityModels for update
as
Begin
	Declare @DeletedActivityModelName Hws_type_ActivityModelName
	Declare @DeletedIsActive bit

	Declare @InsertedActivityModelName Hws_type_ActivityModelName
	Declare @InsertedIsActive bit

	Declare @localized_string_Hws_AcivityModel_Same_Name_Already_Active2 nvarchar(512)
	set @localized_string_Hws_AcivityModel_Same_Name_Already_Active2 = N'An activity model with the name %s is already active.'

	Declare ActivityModelsInserted cursor
	local forward_only 
	for select ActivityModelName, IsActive from inserted

	Open ActivityModelsInserted 

	Fetch next from ActivityModelsInserted 
	into @InsertedActivityModelName, @InsertedIsActive
	
	if @@Fetch_Status <> 0
        begin
            Close ActivityModelsInserted
            Deallocate ActivityModelsInserted
	    return
        end

	While @@Fetch_Status = 0
	begin
		if ((select count(ActivityModelName) from [dbo].[ActivityModels]
			   where ActivityModelName = @InsertedActivityModelName
			   and IsActive = 1) > 1)
		Begin
                        Close ActivityModelsInserted
                        Deallocate ActivityModelsInserted

			RaisError(@localized_string_Hws_AcivityModel_Same_Name_Already_Active2,16, 1, @InsertedActivityModelName)
			Rollback Tran
			return
		end
		Fetch next from ActivityModelsInserted 
		into @InsertedActivityModelName, @InsertedIsActive
	end

        Close ActivityModelsInserted
        Deallocate ActivityModelsInserted

End
GO


CREATE TRIGGER DeleteActivityModel ON dbo.ActivityModels 
FOR DELETE 
AS
Begin
Update Hws_MostRecentModification Set MostRecentModification=(GETUTCDATE())

Declare @ActivityModelID uniqueidentifier
Declare ActivityModelCursor Cursor For SELECT ActivityModelGuid from deleted

Open ActivityModelCursor

FETCH NEXT FROM ActivityModelCursor INTO @ActivityModelID

WHILE @@FETCH_STATUS = 0
Begin
	insert Hws_RemovedEntities (ActivityModelID, LastModified) values (@ActivityModelID, GETUTCDATE())

	IF @@ERROR <> 0
	BEGIN
		CLOSE ActivityModelCursor
		DEALLOCATE ActivityModelCursor
	
		return
	END

	FETCH NEXT FROM ActivityModelCursor INTO @ActivityModelID

	IF @@ERROR <> 0
	BEGIN
		CLOSE ActivityModelCursor
		DEALLOCATE ActivityModelCursor
	
		return
	END
End
	
CLOSE ActivityModelCursor
DEALLOCATE ActivityModelCursor

End
