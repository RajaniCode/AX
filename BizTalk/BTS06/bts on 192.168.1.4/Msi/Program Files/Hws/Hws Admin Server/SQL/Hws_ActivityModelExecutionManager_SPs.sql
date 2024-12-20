--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_CreateStepInstanceId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_CreateStepInstanceId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetDependentBlockRootStep]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetDependentBlockRootStep]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetNextActivationBlocks]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetNextActivationBlocks]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetStepInstanceId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetStepInstanceId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_DeleteStepInstanceId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_DeleteStepInstanceId]
GO

Create proc [dbo].[Hws_CreateStepInstanceId] (
	@ActivityModelId Hws_type_ActivityModelId, 
	@ActivityFlowId Hws_type_ActivityFlowId, 
	@ActivityModelInstanceId Hws_type_ActivityModelInstanceId, 
	@IndependentStepId Hws_type_ActivityModelStepId,
	@StepInstanceId Hws_type_ActionInstanceId
)
as
Begin
	insert into [dbo].[ActivityModelRunTimeTable] (
	 ActivityModelGuid, 
	 ActivityFlowGuid, 
	 ActivityModelInstanceGuid, 
	 ParentStepId, 
	 ParentActionInstanceId)
	values (
	 @ActivityModelId, 
	 @ActivityFlowId, 
	 @ActivityModelInstanceId, 
	 @IndependentStepId,  
	 @StepInstanceId)
	
End

GO
grant EXECUTE on [dbo].[Hws_CreateStepInstanceId] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_CreateStepInstanceId] to HWS_ADMIN_USER
GO

Create proc [dbo].[Hws_GetDependentBlockRootStep] (@ActivityModelId Hws_type_ActivityModelId, @DependentBlockId Hws_type_ActivationBlockId)
as
Begin
	--Select the step in DependentBlock for which the 
	--parent does not exist in the same dependent block.
	--The selected step should be a dependent child of it's parent
	--in the StepRel table.
	select "ParentStepId" = stepRel.ParentStepId, "DependentStepId" = DependentStepId 
	from [dbo].[ActivityModelDependentBlocks] dBlocks, [dbo].[ActivityModelStepRel] stepRel
	where dBlocks.DependentStepId = stepRel.ChildStepId
	and dBlocks.ActivityModelGuid = @ActivityModelId
	and stepRel.ActivityModelGuid = dBlocks.ActivityModelGuid
	and dBlocks.DependentBlockGuid = @DependentBlockId
	and stepRel.ParentStepId not in (select DependentStepId 
					 from [dbo].[ActivityModelDependentBlocks]
					 where ActivityModelGuid = @ActivityModelId
			      		 and DependentBlockGuid = @DependentBlockId)
	and stepRel.IsDependentOnParent = 1
End

GO

grant execute on [dbo].[Hws_GetDependentBlockRootStep] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetDependentBlockRootStep] to HWS_ADMIN_USER
GO

Create proc [dbo].[Hws_GetNextActivationBlocks] (@ActivityModelId Hws_type_ActivityModelId, @CurrentStepId Hws_type_ActivityModelStepId = 0, @CurrentActorXpath Hws_type_TargetXPath = null, @CurrentTaskMessageType Hws_type_HwsTaskMessageType = null)
as
begin
    if (@CurrentStepId is null or @CurrentStepId = 0)
	select "ActivationBlockId" = aBlocks.ActivationBlockGuid, "IndependentStepId" = aBlocks.IndependentStepId
	from [dbo].[ActivityModelSteps] steps, [dbo].[ActivityModelActivationBlocks] aBlocks
	where steps.ActivityModelGuid = @ActivityModelId
	and steps.ActivityModelGuid = aBlocks.ActivityModelGuid
	and steps.IsRootStep = 1
	and aBlocks.IndependentStepId = steps.ActivityModelStepId

     else
	select "ActivationBlockId" = aBlocks.ActivationBlockGuid, "IndependentStepId" = aBlocks.IndependentStepId
	from [dbo].[ActivityModelActivationBlocks] aBlocks, [dbo].[ActivityModelStepRelInfo] sRelInfo, 
	[dbo].[ActivityModelTaskMessageTypes] taskMessageTypes, [dbo].[ActivityModelTargetXPaths] targetXPaths
	where sRelInfo.ActivityModelGuid = @ActivityModelId
	and sRelInfo.ActivityModelGuid = aBlocks.ActivityModelGuid
	and sRelInfo.ParentStepId = @CurrentStepId
	and sRelInfo.ChildStepId in (select ChildStepId 
				 from [dbo].[ActivityModelStepRel]
				 where ActivityModelGuid = @ActivityModelId
				 and ParentStepId = @CurrentStepId
				 and IsDependentOnParent = 0)
	and sRelInfo.ChildStepId = aBlocks.IndependentStepId
	and sRelInfo.TaskMessageTypeId = taskMessageTypes.TaskMessageTypeId
	and sRelInfo.TargetXPathId = targetXPaths.TargetXPathId
        and isnull(taskMessageTypes.TaskMessageType, isnull(@CurrentTaskMessageType,N'')) = isnull(@CurrentTaskMessageType,N'')
        and isnull(targetXPaths.XPathFromParentStep, isnull(@CurrentActorXpath,N'')) = isnull(@CurrentActorXpath,N'')  
end

GO

grant execute on [dbo].[Hws_GetNextActivationBlocks] to HWS_WS_USER
grant execute on [dbo].[Hws_GetNextActivationBlocks] to HWS_ADMIN_USER
GO

Create proc [dbo].[Hws_GetStepInstanceId] (
	@ActivityModelId Hws_type_ActivityModelId, 
	@ActivityFlowId Hws_type_ActivityFlowId, 
	@ActivityModelInstanceId Hws_type_ActivityModelInstanceId, 
	@IndependentStepId Hws_type_ActivityModelStepId
)
as
Begin
	select "IndependentStepId" = ParentStepId, "InstanceId" = ParentActionInstanceId
	from [dbo].[ActivityModelRunTimeTable]
	where ActivityModelGuid = @ActivityModelId 
	and ActivityFlowGuid = @ActivityFlowId 
	and ActivityModelInstanceGuid = @ActivityModelInstanceId 
	and ParentStepId = @IndependentStepId
End

GO

grant execute on [dbo].[Hws_GetStepInstanceId] to HWS_WS_USER
grant execute on [dbo].[Hws_GetStepInstanceId] to HWS_ADMIN_USER
GO

Create proc [dbo].[Hws_DeleteStepInstanceId] (
	@ParentActionInstanceId  Hws_type_ActionInstanceId
)
as
Begin
	delete from [dbo].[ActivityModelRunTimeTable]
	where ParentActionInstanceId = @ParentActionInstanceId
End

GO

grant execute on [dbo].[Hws_DeleteStepInstanceId] to HWS_WS_USER
grant execute on [dbo].[Hws_DeleteStepInstanceId] to HWS_ADMIN_USER
GO