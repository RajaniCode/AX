--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  
------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_CleanupMsgbox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_CleanupMsgbox]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_RebuildIndexes]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_RebuildIndexes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_DefragIndexes]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_DefragIndexes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_InsertProperty]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_InsertProperty]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_FindSubscriptions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_FindSubscriptions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_RemoveMessageProps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_RemoveMessageProps]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_TrackMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_TrackMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_RefCountMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_RefCountMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_RefCountPart]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_RefCountPart]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_InsertMessagePredicate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_InsertMessagePredicate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_InsertMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_InsertMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_InsertDebugMessage_]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_InsertDebugMessage_]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_EvaluateSubscription]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_EvaluateSubscription]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_InsertPart]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_InsertPart]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_InsertFragment]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_InsertFragment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_InsertIntoQueue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_InsertIntoQueue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_ReadSubscriptions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_ReadSubscriptions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminSubscriptionExists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminSubscriptionExists]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_ToggleSubscriptions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_ToggleSubscriptions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminToggleSubscriptions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminToggleSubscriptions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminHardCleanupSlaveMessagebox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminHardCleanupSlaveMessagebox]
GO


if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_AdminChangeSubscriptionOwner]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminChangeSubscriptionOwner]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_AdminExistInstancesInMessageBox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminExistInstancesInMessageBox]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_AdminIsServiceRunning]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminIsServiceRunning]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_AdminCheckForStaticState]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminCheckForStaticState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_CreateConvoySet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_CreateConvoySet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AddConvoySetInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AddConvoySetInstance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_CleanupDeadProcesses]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_CleanupDeadProcesses]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_PurgeSpool]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_PurgeSpool]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_PurgeMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_PurgeMessages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_ManageMessageRefCountLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_ManageMessageRefCountLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_PurgeMessageRefCountLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_PurgeMessageRefCountLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_PurgeMessageZeroSumTable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_PurgeMessageZeroSumTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_PurgeMessageZeroSumTable2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_PurgeMessageZeroSumTable2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_PurgeParts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_PurgeParts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_PurgePartRefCountLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_PurgePartRefCountLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_PurgePartZeroSumTable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_PurgePartZeroSumTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_CopyTrackedMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_CopyTrackedMessages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_CopyTrackedMessagesToDTA]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_CopyTrackedMessagesToDTA]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_PurgeSubscriptions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_PurgeSubscriptions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_ReadMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_ReadMessage]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminAddModule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminAddModule]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminRegisterService]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminRegisterService]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminUpdateModule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminUpdateModule]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminUpdateService]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminUpdateService]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminRemoveService]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminRemoveService]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AdminRemoveModule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AdminRemoveModule]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_IsAgentJobRunning]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_IsAgentJobRunning]
GO


if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnCheckForConvoySetInstanceExistance]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnCheckForConvoySetInstanceExistance]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnInWindow]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnInWindow]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnIsTrustedUser]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnIsTrustedUser]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnIsMember]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnIsMember]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnFindConvoySet]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnFindConvoySet]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnHasConvoyProps]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnHasConvoyProps]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnConvertLocalToUTCDate]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnConvertLocalToUTCDate]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnConvertUTCToLocalDate]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnConvertUTCToLocalDate]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_fnHasServiceWindow]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnHasServiceWindow]
GO

/********************************************************************************************************
* Procedures for MsgBox OM and Ops OM
*
********************************************************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_LookupInstances]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_LookupInstances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_LookupReferencingMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_LookupReferencingMessages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_LookupMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_LookupMessages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_LookupParts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_LookupParts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_LookupReferencingInstances]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_LookupReferencingInstances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_LookupMessageReferences]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_LookupMessageReferences]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_AppendClauseToQueryString]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_AppendClauseToQueryString]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_ReadServiceStatistics]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_ReadServiceStatistics]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_fnParseServiceClassMask]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[MBOM_fnParseServiceClassMask]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_fnGetServiceClassID]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[MBOM_fnGetServiceClassID]
GO 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_SafeAddLinkedServer]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_SafeAddLinkedServer]
GO 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_OperateOnInstances]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_OperateOnInstances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_UpdateBulkOperationsProgress]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_UpdateBulkOperationsProgress]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_GetOperationProgress]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_GetOperationProgress]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_ClearOperationsProgress]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_ClearOperationsProgress]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_OperateOnInstancesOnMasterMsgBox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_OperateOnInstancesOnMasterMsgBox]
GO 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_OperateOnInstanceOnMasterMsgBox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_OperateOnInstanceOnMasterMsgBox]
GO 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_ClearRoutingFailureReports]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_ClearRoutingFailureReports]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_BuildInstanceQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_BuildInstanceQuery]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_AppendClauseToQueryString]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_AppendClauseToQueryString]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_AppendEnumClauseToQueryString]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_AppendEnumClauseToQueryString]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_AppendColumnToGroupingSelect]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_AppendColumnToGroupingSelect]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_BuildInstanceGroupingSelectStatement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_BuildInstanceGroupingSelectStatement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_BuildInstanceSuspendedGroupingSelectStatement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_BuildInstanceSuspendedGroupingSelectStatement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadSubscriptions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadSubscriptions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadSubscriptionPredicates]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadSubscriptionPredicates]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_BuildInstanceSuspendedQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_BuildInstanceSuspendedQuery]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadMessages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadPrimaryFailedMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadPrimaryFailedMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadMessageContext]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadMessageContext]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadMessageStatistics]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadMessageStatistics]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_AdminDeleteSuspendedMessageRef]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_AdminDeleteSuspendedMessageRef]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadPart]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadPart]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadParts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadParts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadPartFragment]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadPartFragment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadPartNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadPartNames]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_TrackMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_TrackMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_CancelOperation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_CancelOperation]
GO 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_UpdateOperationsOperateOnInstancesOnMasterJob]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_UpdateOperationsOperateOnInstancesOnMasterJob]
GO


--Procedures for MsgBox perf counters

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MsgBoxPerfCounters_GetSpoolSize]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetSpoolSize]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MsgBoxPerfCounters_GetTrackingDataSize]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetTrackingDataSize]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MsgBoxPerfCounters_GetTotalInstances]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetTotalInstances]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MsgBoxPerfCounters_GetPurgeJobInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetPurgeJobInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_UpdateCopyTrackedMessagesJob]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_UpdateCopyTrackedMessagesJob]
GO


CREATE PROCEDURE [dbo].[bts_ReadMessage]
@uidMessageID uniqueidentifier
AS


set nocount on
set transaction isolation level read committed

SELECT TOP 1 imgContext, imgPart  FROM Spool s, Parts p WHERE s.uidMessageID = @uidMessageID AND p.uidPartID = s.uidBodyPartID
GO

CREATE FUNCTION bts_fnConvertLocalToUTCDate (@dtParam datetime)
RETURNS datetime
AS
BEGIN

	declare @dtLocal datetime, @dtUTC datetime, @dtResult datetime

	SELECT TOP 1 @dtLocal = LocalDate FROM btsv_LocalDate
	SELECT TOP 1 @dtUTC = UTCDate FROM btsv_UTCDate

	set @dtResult = DATEADD(hour, DATEDIFF(hour, @dtLocal, @dtUTC), @dtParam)
	set @dtResult = DATEADD(minute, DATEDIFF(minute, @dtLocal, @dtUTC), @dtParam)

	return @dtResult
END 
GO

CREATE FUNCTION bts_fnConvertUTCToLocalDate (@dtParam datetime)
RETURNS datetime
AS
BEGIN

	declare @dtLocal datetime, @dtUTC datetime, @dtResult datetime

	SELECT TOP 1 @dtLocal = LocalDate FROM btsv_LocalDate
	SELECT TOP 1 @dtUTC = UTCDate FROM btsv_UTCDate

	set @dtResult = DATEADD(hour, DATEDIFF(hour, @dtUTC, @dtLocal), @dtParam)
	set @dtResult = DATEADD(minute, DATEDIFF(minute, @dtUTC, @dtLocal), @dtParam)

	return @dtResult
END 
GO


CREATE FUNCTION [dbo].[MBOM_fnGetServiceClassID] (@nServiceClass int)
RETURNS uniqueidentifier
AS
BEGIN 
	/*
		Orchestration	= 1  226FC6B9-0416-47A4-A8E8-4721F1DB1A1B,
		Tracking	= 2,
		Messaging	= 4  59F295B0-3123-416E-966B-A2C6D65FF8E6,
		MSMQT		= 8  3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2,
		Other		= 16,
		Non-CreatableReceiver = 32, 683AEDF1-027D-4006-AE9A-443D1A5746FC
		RoutingFailure = 64, EAF8EEA9-366A-4cde-8DD3-57A4C39BF8E5
	*/
	
	if (@nServiceClass = 1)
		return '{226FC6B9-0416-47A4-A8E8-4721F1DB1A1B}'
	if (@nServiceClass = 4)
		return '{59F295B0-3123-416E-966B-A2C6D65FF8E6}'
	if (@nServiceClass = 8)
		return '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'
	if (@nServiceClass = 16)
		return '{BB3A1470-F5C4-47C3-B71F-EAABC260FBD0}'
	if (@nServiceClass = 32)
		return '{683AEDF1-027D-4006-AE9A-443D1A5746FC}'
	if (@nServiceClass = 64)
		return '{EAF8EEA9-366A-4cde-8DD3-57A4C39BF8E5}'		

	return null
END
GO

CREATE FUNCTION MBOM_fnParseServiceClassMask (@nServiceClass int, @uidClassID uniqueidentifier)
RETURNS bit
AS
BEGIN 
	/*
		Orchestration	= 1  226FC6B9-0416-47A4-A8E8-4721F1DB1A1B,
		Tracking	= 2,
		Messaging	= 4  59F295B0-3123-416E-966B-A2C6D65FF8E6,
		MSMQT		= 8  3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2,
		Other		= 16,
		Non-CreatableReceiver = 32, 683AEDF1-027D-4006-AE9A-443D1A5746FC
		RoutingFailure = 64, EAF8EEA9-366A-4cde-8DD3-57A4C39BF8E5
	*/
	
	if ((@nServiceClass & 1) > 0) AND @uidClassID = '{226FC6B9-0416-47A4-A8E8-4721F1DB1A1B}'
		return 1
	if ((@nServiceClass & 4) > 0) AND @uidClassID = '{59F295B0-3123-416E-966B-A2C6D65FF8E6}'
		return 1
	if ((@nServiceClass & 8) > 0) AND @uidClassID = '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'
		return 1
	if ((@nServiceClass & 16) > 0)
		return 1
	if ((@nServiceClass & 32) > 0) AND @uidClassID = '{683AEDF1-027D-4006-AE9A-443D1A5746FC}'
		return 1
	if ((@nServiceClass & 64) > 0) AND @uidClassID = '{EAF8EEA9-366A-4cde-8DD3-57A4C39BF8E5}'
		return 1		

	return 0
END
GO
		
CREATE FUNCTION bts_fnFindConvoySet (@uidConvoySetID uniqueidentifier, @vtProp1 sql_variant, @vtProp2 sql_variant, @vtProp3 sql_variant, @uidBatchID uniqueidentifier, @uidMessageID uniqueidentifier)
RETURNS int
AS
BEGIN
	declare @nID int, @uidPropID1 uniqueidentifier, @uidPropID2 uniqueidentifier, @uidPropID3 uniqueidentifier
	set @nID = -1 
	
	if (@uidConvoySetID IS NOT NULL)
	BEGIN

		SELECT TOP 1 @uidPropID1 = uidPropertyID1, @uidPropID2 = uidPropertyID2, @uidPropID3 = uidPropertyID3
		FROM ConvoySets cs WITH (ROWLOCK READPAST)
		WHERE cs.uidConvoySetID = @uidConvoySetID

		IF (@@ROWCOUNT > 0)
		BEGIN

			if (@vtProp1 IS NULL)
			BEGIN
				SELECT @vtProp1 = mp.vtPropValue FROM MessageProps mp
				WHERE mp.uidBatchID = @uidBatchID AND mp.uidMessageID = @uidMessageID AND mp.uidPropID = @uidPropID1
			END

			if ( (@vtProp2 IS NULL) AND (@uidPropID2 IS NOT NULL))
			BEGIN
				SELECT @vtProp2 = mp.vtPropValue FROM MessageProps mp
				WHERE mp.uidBatchID = @uidBatchID AND mp.uidMessageID = @uidMessageID AND mp.uidPropID = @uidPropID2
			END

			if ( (@vtProp3 IS NULL) AND (@uidPropID3 IS NOT NULL))
			BEGIN
				SELECT @vtProp3 = mp.vtPropValue FROM MessageProps mp
				WHERE mp.uidBatchID = @uidBatchID AND mp.uidMessageID = @uidMessageID AND mp.uidPropID = @uidPropID3
			END

			if ( (@uidPropID2 IS NULL) AND (@uidPropID3 IS NULL) )
			BEGIN
				SELECT TOP 1 @nID = csi.nID
				FROM ConvoySetInstances csi WITH (ROWLOCK INDEX(CIX_ConvoySetInstances) )
				WHERE csi.uidConvoySetID = @uidConvoySetID AND csi.vtProp1 = @vtProp1
				OPTION (KEEPFIXED PLAN)
								
			END
			else if ( (@uidPropID3 IS NULL) )
			BEGIN
				SELECT TOP 1 @nID = csi.nID
				FROM ConvoySetInstances csi WITH (ROWLOCK INDEX(CIX_ConvoySetInstances) )
				WHERE 	csi.uidConvoySetID = @uidConvoySetID AND
					csi.vtProp1 = @vtProp1 AND
					csi.vtProp2 = @vtProp2
				OPTION (KEEPFIXED PLAN)
			END
			else
			BEGIN
				SELECT TOP 1 @nID = csi.nID
				FROM ConvoySetInstances csi WITH (ROWLOCK INDEX(CIX_ConvoySetInstances) )
				WHERE 	csi.uidConvoySetID = @uidConvoySetID AND
					csi.vtProp1 = @vtProp1 AND
					csi.vtProp2 = @vtProp2 AND
					csi.vtProp3 = @vtProp3
				OPTION (KEEPFIXED PLAN)
			END
		END
	END

	return @nID

END
GO

CREATE FUNCTION bts_fnHasConvoyProps (@uidConvoySetID uniqueidentifier,  @vtProp1Default sql_variant, @vtProp2Default sql_variant, @vtProp3Default sql_variant, @uidBatchID uniqueidentifier, @uidMessageID uniqueidentifier)
RETURNS int
AS
BEGIN

	declare @ret int
	set @ret = 0

	if (@uidConvoySetID IS NULL)
		return 1

	SELECT TOP 1 @ret = COUNT(*)
	FROM ConvoySets cs WITH (ROWLOCK INDEX(CIX_ConvoySets))
	JOIN MessageProps mp1 WITH (ROWLOCK READPAST INDEX(CIX_MessageProps)) ON mp1.uidBatchID = @uidBatchID AND
			      mp1.uidMessageID = @uidMessageID AND
			      (cs.uidPropertyID1 = mp1.uidPropID OR @vtProp1Default IS NOT NULL) 
	JOIN MessageProps mp2 WITH (ROWLOCK READPAST INDEX(CIX_MessageProps)) ON mp2.uidBatchID = @uidBatchID AND
			      mp2.uidMessageID = @uidMessageID AND
			      ( cs.uidPropertyID2 IS NULL OR (cs.uidPropertyID2 = mp2.uidPropID OR @vtProp2Default IS NOT NULL) )
	JOIN MessageProps mp3 WITH (ROWLOCK READPAST INDEX(CIX_MessageProps)) ON mp3.uidBatchID = @uidBatchID AND
			      mp3.uidMessageID = @uidMessageID AND
			       ( cs.uidPropertyID3 IS NULL OR (cs.uidPropertyID3 = mp3.uidPropID OR @vtProp3Default IS NOT NULL) )
	WHERE 	cs.uidConvoySetID = @uidConvoySetID 
	OPTION (KEEPFIXED PLAN)

	return @ret
END
GO

CREATE PROCEDURE [dbo].[int_RefCountMessage]
@uidMessageID uniqueidentifier,
@tnQueueID tinyint,
@snRefCount smallint
AS

set nocount on

declare @tnActiveTable tinyint, @retVal int
 
--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
exec  @retVal = sp_getapplock 'MessageRefCountLog', 'Shared', 'Transaction'

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	RAISERROR('Unable to acquire applock on MessageRefCountLog', 16, 1)
	return
END

SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 1 OPTION (KEEPFIXED PLAN)

if (@tnActiveTable = 1)
	INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount) VALUES (@uidMessageID, @tnQueueID, @snRefCount)
else
	INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount) VALUES (@uidMessageID, @tnQueueID, @snRefCount)
		
exec sp_releaseapplock 'MessageRefCountLog', 'Transaction'

GO

CREATE PROCEDURE [dbo].[int_TrackMessage]
@uidMessageID uniqueidentifier
AS

--the copy job has to be careful here. It copies 50 messages at a time. If there are less than 50 messages to 
--copy, then when it starts copying, it needs to prevent the count from growing or else we will lose messages which
--we were supposed to track. To prevent this, I am moving the tracking of the reference to a helper sproc which will
--take a brief applock to make sure we can provide some level of isolation
			
set nocount on

declare @retVal int, @cnt int

exec  @retVal = sp_getapplock 'TrkMsgRefs', 'Shared', 'Transaction'

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	RAISERROR('Unable to acquire applock on TrackingMessageReferences table', 16, 1)
	return
END

INSERT INTO TrackingMessageReferences WITH (ROWLOCK) VALUES (@uidMessageID)
set @cnt = @@ROWCOUNT

exec sp_releaseapplock 'TrkMsgRefs', 'Transaction'

IF (@cnt > 0)
BEGIN
	exec int_RefCountMessage @uidMessageID, 4, 1
END
GO

CREATE PROCEDURE [dbo].[int_RefCountPart]
@uidMessageID uniqueidentifier,
@uidPartID uniqueidentifier,
@snRefCount smallint
AS

set nocount on

declare @tnActiveTable tinyint, @retVal int
 
--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
exec  @retVal = sp_getapplock 'PartRefCountLog', 'Shared', 'Transaction'

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	RAISERROR('Unable to acquire applock on PartRefCountLog', 16, 1)
	return
END


SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 0 OPTION (KEEPFIXED PLAN)
if (@tnActiveTable = 1)
	INSERT INTO PartRefCountLog1 WITH (ROWLOCK) (uidMessageID, uidPartID, snRefCount) VALUES (@uidMessageID, @uidPartID, @snRefCount)
else
	INSERT INTO PartRefCountLog2 WITH (ROWLOCK) (uidMessageID, uidPartID, snRefCount) VALUES (@uidMessageID, @uidPartID, @snRefCount)

exec sp_releaseapplock 'PartRefCountLog', 'Transaction'
	
GO

CREATE PROCEDURE [dbo].[bts_CleanupMsgbox]
@fLeaveActSubs int = 1
AS

GO

CREATE PROCEDURE [dbo].[bts_RebuildIndexes]
AS

set nocount on

DBCC DBREINDEX ('[dbo].[TrackingData]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Instances]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[InstancesPendingOperations]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Spool]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Fragments]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Parts]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[MessagePredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[MessageParts]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[MessageProps]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[ProcessHeartbeats]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[MessageRefCountLog1]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[MessageRefCountLog2]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[MessageRefCountLogTotals]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[PartRefCountLog1]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[PartRefCountLog2]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[PartRefCountLogTotals]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[ActiveRefCountLog]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[MessageZeroSum]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[PartZeroSum]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[PredicateGroupZeroSum1]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[PredicateGroupZeroSum2]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Subscription]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[UniqueSubscription]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[FirstPassPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[EqualsPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[EqualsPredicates2ndPass]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[ExistsPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[LessThanPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[LessThanOrEqualsPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[GreaterThanPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[GreaterThanOrEqualsPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[NotEqualsPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[BitwiseANDPredicates]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[PredicateGroup]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[PredicateGroupNames]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[ConvoySets]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[ConvoySetInstances]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[LocalizedErrorStrings]') WITH NO_INFOMSGS

DBCC DBREINDEX ('[dbo].[Tracking_Spool1]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Tracking_Spool2]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Tracking_Parts1]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Tracking_Parts2]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Tracking_Fragments1]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[Tracking_Fragments2]') WITH NO_INFOMSGS
DBCC DBREINDEX ('[dbo].[TrackingMessageReferences]') WITH NO_INFOMSGS

declare @nvcAppName nvarchar(128),
		@uidAppID	uniqueidentifier

declare curse cursor for 
	SELECT nvcApplicationName, uidAppID FROM Applications
open curse
FETCH NEXT FROM curse INTO @nvcAppName, @uidAppID
WHILE (@@FETCH_STATUS = 0)
BEGIN 
	exec ('DBCC DBREINDEX (''[dbo].[' + @nvcAppName + 'Q]'') WITH NO_INFOMSGS')
	exec ('DBCC DBREINDEX (''[dbo].[' + @nvcAppName + 'Q_Suspended]'') WITH NO_INFOMSGS')
	exec ('DBCC DBREINDEX (''[dbo].[DynamicStateInfo_' + @nvcAppName + ']'') WITH NO_INFOMSGS')
	exec ('DBCC DBREINDEX (''[dbo].[InstanceStateMessageReferences_' + @nvcAppName + ']'') WITH NO_INFOMSGS')
	exec ('DBCC DBREINDEX (''[dbo].[' + @nvcAppName + '_DequeueBatches]'') WITH NO_INFOMSGS')
	exec ('DBCC DBREINDEX (''[dbo].[' + @nvcAppName + '_MessageRefCountLog]'') WITH NO_INFOMSGS')
	
	
	FETCH NEXT FROM curse INTO @nvcAppName, @uidAppID
END
close curse
deallocate curse

GO

CREATE PROCEDURE [dbo].[bts_ReadSubscriptions]
AS
set nocount on
set transaction isolation level read committed
set deadlock_priority low

SELECT uidSubID, nvcName, snPriority, uidClassID, uidServiceID, uidInstanceID, uidPortID, fEnabled, nvcApplicationName
FROM Subscription WITH (ROWLOCK)

SELECT  t3.uidPropID, t3.snComparison, t3.vtValue, t3.uidPredicateGroupID, t3.uidSubID
FROM (
     SELECT t1.uidPropID, t1.snComparison, t1.vtValue, t1.uidPredicateGroupID, t1.uidSubID
     FROM
     (
	SELECT ep.uidPropID, 0 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM EqualsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID
	UNION ALL
	SELECT ep.uidPropID, 0 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM EqualsPredicates2ndPass AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID
	UNION ALL
	SELECT ep.uidPropID, 1 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM LessThanPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 2 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM LessThanOrEqualsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 3 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM GreaterThanPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 4 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM GreaterThanOrEqualsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 5 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM NotEqualsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 6 AS snComparison, NULL AS vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM ExistsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID
	UNION ALL
	SELECT ep.uidPropID, 7 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM BitwiseANDPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	
     ) AS t1

     UNION ALL
     
     SELECT cs.uidPropertyID1, [dbo].[bts_fnCheckForConvoySetInstanceExistance](s.uidConvoySetID, s.uidInstanceID), csi.vtProp1, pg.uidPredicateANDGroupID, s.uidSubID
     FROM ConvoySets cs WITH (ROWLOCK), PredicateGroup pg WITH (ROWLOCK), Subscription s WITH (ROWLOCK)
     LEFT JOIN ConvoySetInstances csi  WITH (ROWLOCK) ON s.uidConvoySetID = csi.uidConvoySetID AND s.uidInstanceID = csi.uidInstanceID
     WHERE     s.uidConvoySetID IS NOT NULL AND
	       s.vtConvoySetProp1DefVal IS NULL AND
	       s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
	       s.uidConvoySetID = cs.uidConvoySetID
	       
	 UNION ALL
     
     SELECT cs.uidPropertyID2, [dbo].[bts_fnCheckForConvoySetInstanceExistance](s.uidConvoySetID, s.uidInstanceID), csi.vtProp2, pg.uidPredicateANDGroupID, s.uidSubID
     FROM ConvoySets cs WITH (ROWLOCK), PredicateGroup pg WITH (ROWLOCK), Subscription s WITH (ROWLOCK)
     LEFT JOIN ConvoySetInstances csi WITH (ROWLOCK) ON s.uidConvoySetID = csi.uidConvoySetID AND s.uidInstanceID = csi.uidInstanceID
     WHERE     s.uidConvoySetID IS NOT NULL AND
	       s.vtConvoySetProp2DefVal IS NULL AND
	       s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
	       s.uidConvoySetID = cs.uidConvoySetID AND
	       cs.uidPropertyID2 IS NOT NULL
	       
	 UNION ALL
     
     SELECT cs.uidPropertyID3, [dbo].[bts_fnCheckForConvoySetInstanceExistance](s.uidConvoySetID, s.uidInstanceID), csi.vtProp3, pg.uidPredicateANDGroupID, s.uidSubID
     FROM ConvoySets cs WITH (ROWLOCK), PredicateGroup pg WITH (ROWLOCK), Subscription s WITH (ROWLOCK)
     LEFT JOIN ConvoySetInstances csi WITH (ROWLOCK) ON s.uidConvoySetID = csi.uidConvoySetID AND s.uidInstanceID = csi.uidInstanceID
     WHERE     s.uidConvoySetID IS NOT NULL AND
	       s.vtConvoySetProp3DefVal IS NULL AND
	       s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
	       s.uidConvoySetID = cs.uidConvoySetID AND
	       cs.uidPropertyID3 IS NOT NULL
) as t3
ORDER BY t3.uidSubID, t3.uidPredicateGroupID
GO

GRANT EXEC ON [dbo].[bts_ReadSubscriptions] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_CreateConvoySet]
@uidConvoySetID uniqueidentifier,
@nvcConvoySetName nvarchar(256),
@uidOwningServiceID uniqueidentifier,
@uidProperty1ID uniqueidentifier,
@uidProperty2ID uniqueidentifier,
@uidProperty3ID uniqueidentifier
AS

INSERT INTO ConvoySets WITH (ROWLOCK) (uidConvoySetID, nvcConvoySetName, uidServiceID, uidPropertyID1, uidPropertyID2, uidPropertyID3)
	VALUES (@uidConvoySetID, @nvcConvoySetName, @uidOwningServiceID, @uidProperty1ID, @uidProperty2ID, @uidProperty3ID)

GO
GRANT EXEC ON [dbo].[bts_CreateConvoySet] TO BTS_HOST_USERS
GO

CREATE PROCEDURE bts_AddConvoySetInstance
@uidBatchID uniqueidentifier,
@uidMessageID uniqueidentifier,
@uidSubscriptionID uniqueidentifier,
@uidPredicateGroupID uniqueidentifier,
@uidConvoySetID uniqueidentifier,
@fCanActivateConvoy int,
@uidDatabaseID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@fCreateInstanceLocally int OUTPUT,
@uidActualDatabaseID uniqueidentifier OUTPUT,
@uidActualInstanceID uniqueidentifier OUTPUT,
@fHasServiceWindow int
AS

set nocount on
set transaction isolation level read committed

--create locally flag is used as follows
--0 this is the master msgbox but don't create on this db
--1 this is the master msgbox and create on this db
--2 this is not the master so just create the related instance and convoy set instance information
--4 this is not the master and the instance already exists so just create the convoy set instance information

-- when the call is made to the master messagebox, the stored proc should return a 2 or 3 if it is necessary
-- to go to the secondary messagebox and do work

declare @uidServiceID uniqueidentifier,
		@uidClassID uniqueidentifier,
		@uidAppID uniqueidentifier,
		@fEnabled int,
		@nvcErrorMsg nvarchar(256),	
		@dtSuspendTimeStamp datetime,
		@fNewInst int
		
set @fNewInst = 0
set @fEnabled = 0

--create the instance and convoy set information locally
if (@fCreateInstanceLocally = 2)
BEGIN
	SELECT TOP 1 @uidServiceID = s.uidServiceID, @uidClassID = s.uidClassID, @fEnabled = s.fEnabled, @uidAppID = a.uidAppID
	FROM Subscription s WITH (ROWLOCK REPEATABLEREAD INDEX(CIX_Subscription)), Applications a WITH (ROWLOCK)
	WHERE s.uidPredicateGroupID = @uidPredicateGroupID AND s.uidSubID = @uidSubscriptionID AND s.fEnabled > 0 AND s.nvcApplicationName = a.nvcApplicationName
	OPTION (KEEPFIXED PLAN)
	
	if (@fEnabled = 2)
	BEGIN
		SELECT TOP 1 @nvcErrorMsg = nvcError FROM LocalizedErrorStrings WHERE nID = 1
		
		set @dtSuspendTimeStamp = GetUTCDate()		
		INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, nState, dtSuspendTimeStamp, nErrorCategory, nvcErrorID, nvcErrorDescription) 
		VALUES (@uidAppID, @uidInstanceID, @uidServiceID, @uidClassID, 4, @dtSuspendTimeStamp, -3, '0xC0C01B4D', @nvcErrorMsg)
			
		INSERT INTO InstancesSuspended WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, dtCreated, nState, nvcUserState, dtSuspendTimeStamp, nvcAdapter, nvcURI, nErrorCategory, nvcErrorID, nvcErrorDescription) 
		VALUES (@uidAppID, @uidInstanceID, @uidServiceID, @uidClassID, GetUTCDate(), 4, NULL, @dtSuspendTimeStamp, NULL, NULL, -3, '0xC0C01B4D', @nvcErrorMsg) 
	END
	ELSE IF (@fHasServiceWindow = 1)
	BEGIN
		INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, nState) 
			VALUES (@uidAppID, @uidInstanceID, @uidServiceID, @uidClassID, 256)
	END
	ELSE
	BEGIN
		INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID) 
			VALUES (@uidAppID, @uidInstanceID, @uidServiceID, @uidClassID)
	END

	--we need the row in the convoy set instances table so that we can keep track of when an instance might become suspended
	--we dont really have to worry about the property values since this isnt used for routing we just need it unique for a given instance
	--so we use the instance id for property
	INSERT INTO ConvoySetInstances WITH (ROWLOCK) (uidConvoySetID, uidInstanceID, uidDatabaseID, uidActivatingMessageID, vtProp1, fEnabled)
		VALUES ( @uidConvoySetID, @uidInstanceID, @uidDatabaseID, @uidMessageID, @uidInstanceID, @fEnabled )
END
ELSE IF (@fCreateInstanceLocally = 4)
BEGIN
	SELECT TOP 1 @fEnabled = s.fEnabled
	FROM Subscription s WITH (ROWLOCK REPEATABLEREAD INDEX(CIX_Subscription)), Applications a WITH (ROWLOCK)
	WHERE s.uidPredicateGroupID = @uidPredicateGroupID AND s.uidSubID = @uidSubscriptionID AND s.fEnabled > 0 AND s.nvcApplicationName = a.nvcApplicationName
	OPTION (KEEPFIXED PLAN)
	
	--only create the convoy set instance information
	INSERT INTO ConvoySetInstances WITH (ROWLOCK) (uidConvoySetID, uidInstanceID, uidDatabaseID, uidActivatingMessageID, vtProp1, fEnabled)
		VALUES ( @uidConvoySetID, @uidInstanceID, @uidDatabaseID, @uidMessageID, @uidInstanceID, @fEnabled )
END
ELSE
BEGIN
	--This is the master messagebox
	declare @vtConvoySetProp1DefVal sql_variant, @vtConvoySetProp2DefVal sql_variant, @vtConvoySetProp3DefVal sql_variant

	if (@uidInstanceID IS NULL)
	BEGIN
		set @uidInstanceID = NewID()
		set @fNewInst = 1
	END

	--we need to double check again to see if the insert got committed in the middle of findsubscriptions
	SELECT TOP 1 @vtConvoySetProp1DefVal = vtConvoySetProp1DefVal, @vtConvoySetProp2DefVal = vtConvoySetProp3DefVal, @vtConvoySetProp3DefVal = vtConvoySetProp3DefVal
	FROM Subscription s WITH (ROWLOCK INDEX(CIX_Subscription))
	WHERE s.uidPredicateGroupID = @uidPredicateGroupID AND s.uidSubID = @uidSubscriptionID AND s.fEnabled > 0
	OPTION (KEEPFIXED PLAN)

	SELECT TOP 1 @uidActualInstanceID = csi.uidInstanceID, @uidActualDatabaseID = csi.uidDatabaseID 
	FROM ConvoySetInstances csi WITH (ROWLOCK REPEATABLEREAD INDEX(IX2_ConvoySetInstances))
	WHERE csi.nID = [dbo].[bts_fnFindConvoySet](@uidConvoySetID, @vtConvoySetProp1DefVal, @vtConvoySetProp2DefVal, @vtConvoySetProp3DefVal, @uidBatchID, @uidMessageID)
	OPTION (KEEPFIXED PLAN)
		
	
	if ( (@@ROWCOUNT = 0) AND (@fCanActivateConvoy = 1) )
	BEGIN
		INSERT INTO ConvoySetInstances WITH (ROWLOCK) (uidConvoySetID, uidInstanceID, uidDatabaseID, uidActivatingMessageID, vtProp1, vtProp2, vtProp3, fEnabled)
		SELECT TOP 1 cs.uidConvoySetID, @uidInstanceID, @uidDatabaseID, @uidMessageID,
			CASE WHEN (mp1.vtPropValue) IS NULL THEN s.vtConvoySetProp1DefVal ELSE mp1.vtPropValue END AS vtPop1,
			CASE WHEN (mp2.vtPropValue) IS NULL THEN s.vtConvoySetProp2DefVal ELSE mp2.vtPropValue END AS vtProp2,
			CASE WHEN (mp3.vtPropValue) IS NULL THEN s.vtConvoySetProp3DefVal ELSE mp3.vtPropValue END AS vtProp3, 
			s.fEnabled 
		FROM ConvoySets cs WITH (ROWLOCK INDEX(CIX_ConvoySets))
		JOIN Subscription s WITH (ROWLOCK INDEX(CIX_Subscription)) ON s.uidPredicateGroupID = @uidPredicateGroupID AND s.uidSubID = @uidSubscriptionID AND s.fEnabled > 0
		LEFT JOIN MessageProps mp1 WITH (ROWLOCK READPAST) ON mp1.uidBatchID = @uidBatchID AND
						mp1.uidMessageID = @uidMessageID AND
						cs.uidPropertyID1 = mp1.uidPropID 
		LEFT JOIN MessageProps mp2 WITH (ROWLOCK READPAST) ON mp2.uidBatchID = @uidBatchID AND
						mp2.uidMessageID = @uidMessageID AND
						cs.uidPropertyID2 = mp2.uidPropID
		LEFT JOIN MessageProps mp3 WITH (ROWLOCK READPAST) ON mp3.uidBatchID = @uidBatchID AND
						mp3.uidMessageID = @uidMessageID AND
						cs.uidPropertyID3 = mp3.uidPropID
		WHERE cs.uidConvoySetID = @uidConvoySetID
		OPTION (KEEPFIXED PLAN)
		
		if (@@ROWCOUNT = 0)
		BEGIN
			--this means that the value already existed in the database
			SELECT TOP 1 @uidActualInstanceID = csi.uidInstanceID, @uidActualDatabaseID = csi.uidDatabaseID 
			FROM ConvoySetInstances csi WITH (ROWLOCK REPEATABLEREAD INDEX(IX2_ConvoySetInstances)) 
			WHERE csi.nID = [dbo].[bts_fnFindConvoySet](@uidConvoySetID, @vtConvoySetProp1DefVal, @vtConvoySetProp2DefVal, @vtConvoySetProp3DefVal, @uidBatchID, @uidMessageID)
			OPTION (KEEPFIXED PLAN)
		END
		ELSE 
		BEGIN
			set @uidActualDatabaseID = @uidDatabaseID
			set @uidActualInstanceID = @uidInstanceID

			IF ( (@fCreateInstanceLocally = 1) AND (@fNewInst = 1) )--only create the instance if the flag says that the instance will exist locally.
			BEGIN
				SELECT TOP 1 @uidServiceID = s.uidServiceID, @uidClassID = s.uidClassID, @fEnabled = s.fEnabled, @uidAppID = a.uidAppID
				FROM Subscription s WITH (ROWLOCK REPEATABLEREAD INDEX(CIX_Subscription)), Applications a WITH (ROWLOCK)
				WHERE s.uidPredicateGroupID = @uidPredicateGroupID AND s.uidSubID = @uidSubscriptionID AND s.fEnabled > 0 AND s.nvcApplicationName = a.nvcApplicationName
				OPTION (KEEPFIXED PLAN)
				
				if (@fEnabled = 2)
				BEGIN
					SELECT TOP 1 @nvcErrorMsg = nvcError FROM LocalizedErrorStrings WHERE nID = 1
					
					set @dtSuspendTimeStamp = GetUTCDate()				
					
					INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, nState, dtSuspendTimeStamp, nErrorCategory, nvcErrorID, nvcErrorDescription) 
					VALUES (@uidAppID, @uidInstanceID, @uidServiceID, @uidClassID, 4, @dtSuspendTimeStamp, -3, '0xC0C01B4D', @nvcErrorMsg)
						
					INSERT INTO InstancesSuspended WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, dtCreated, nState, nvcUserState, dtSuspendTimeStamp, nvcAdapter, nvcURI, nErrorCategory, nvcErrorID, nvcErrorDescription) 
					VALUES (@uidAppID, @uidInstanceID, @uidServiceID, @uidClassID, GetUTCDate(), 4, NULL, @dtSuspendTimeStamp, NULL, NULL, -3, '0xC0C01B4D', @nvcErrorMsg) 
				END
				ELSE
				BEGIN
					INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID) 
						VALUES (@uidAppID, @uidInstanceID, @uidServiceID, @uidClassID)
				END

			END
			ELSE IF (@fCreateInstanceLocally = 0)
			BEGIN
				if (@fNewInst = 1)
					set @fCreateInstanceLocally = 2
				else
					set @fCreateInstanceLocally = 4
			END
		END
	END
END
GO
GRANT EXEC ON [dbo].bts_AddConvoySetInstance TO BTS_HOST_USERS
GO



CREATE FUNCTION bts_fnCheckForConvoySetInstanceExistance (@uidConvoySetID uniqueidentifier, @uidInstanceID uniqueidentifier)
RETURNS int
AS
BEGIN
	
	declare @uidID uniqueidentifier
	if (@uidInstanceID IS NULL)
		return 6 -- this signifies checking for existance, not equality	
		
	SELECT TOP 1 @uidID = uidInstanceID 
	FROM ConvoySetInstances WITH (ROWLOCK INDEX(IX_ConvoySetInstances))
	WHERE uidConvoySetID = @uidConvoySetID AND uidInstanceID = @uidInstanceID
	OPTION (KEEPFIXED PLAN)
	
	if (@@ROWCOUNT > 0)
		return 0
	
	return 6
END
GO
	
CREATE FUNCTION bts_fnInWindow (@dtNow datetime, @dtStart datetime, @dtEnd datetime)
RETURNS tinyint
WITH SCHEMABINDING
AS
BEGIN
	if ( DATEPART(HOUR, @dtStart) = DATEPART(HOUR, @dtEnd) AND DATEPART(MINUTE, @dtStart) = DATEPART(MINUTE, @dtEnd))
		return 1

	declare @nWindow int,
		@nDiff int

	set @nWindow =  ( DATEPART(HOUR, @dtEnd) - DATEPART(HOUR, @dtStart) ) * 60 +  DATEPART(MINUTE, @dtEnd) - DATEPART(MINUTE, @dtStart)
	set @nDiff = ( DATEPART(HOUR, @dtNow) - DATEPART(HOUR, @dtStart) ) * 60 +  DATEPART(MINUTE, @dtNow) - DATEPART(MINUTE, @dtStart) 

	if ( @nWindow <= 0 ) 
		set @nWindow = @nWindow + 24*60

	if (@nDiff < 0 ) 
		set @nDiff = @nDiff + 24*60

	if ( @nDiff <= @nWindow ) 
		return 1

	return 0
END
GO

CREATE FUNCTION bts_fnIsTrustedUser ()
RETURNS bit
AS
BEGIN

	declare @Count int
	SELECT TOP 1 @Count = COUNT(*) FROM TrustedUsers WHERE nvcUserName = SUSER_SNAME()

	if (@Count <> 0)
		return 1

	return 0
END
GO

CREATE FUNCTION bts_fnIsMember (@RoleName sysname)
RETURNS bit
AS
BEGIN
	if ( ( IS_MEMBER('db_owner') = 1 ) OR ( IS_MEMBER(@RoleName) = 1) )
		return 1
	
	return 0
END
GO


CREATE PROCEDURE [dbo].[bts_InsertProperty]
@uidBatchID uniqueidentifier,
@nOrderID int,
@uidMessageID uniqueidentifier,
@uidPropertyID uniqueidentifier,
@vtValue sql_variant
AS
	INSERT INTO MessageProps WITH (ROWLOCK) (uidBatchID, nOrderID, uidMessageID, uidPropID, vtPropValue)
			 VALUES (@uidBatchID, @nOrderID, @uidMessageID, @uidPropertyID, @vtValue)

return
GO
GRANT EXEC ON [dbo].[bts_InsertProperty] TO BTS_HOST_USERS
GO


CREATE PROCEDURE [dbo].[bts_InsertMessagePredicate]
@uidBatchID uniqueidentifier,
@uidMessageID uniqueidentifier,
@uidPropertyID uniqueidentifier,
@vtValue sql_variant
AS

	INSERT INTO MessagePredicates WITH (ROWLOCK) (uidBatchID, uidMessageID, uidPropID, vtPropValue)
					 VALUES (@uidBatchID, @uidMessageID, @uidPropertyID, @vtValue)

return
GO
GRANT EXEC ON [dbo].[bts_InsertMessagePredicate] TO BTS_HOST_USERS
GO

-- vf if checks to see if dtStartWindow earlier than dtEndWindow have to be done
CREATE FUNCTION bts_fnHasServiceWindow (@dtStartWindow datetime, @dtEndWindow datetime)
RETURNS int
AS
BEGIN

	declare @nResult int
	
	IF (@dtStartWindow = @dtEndWindow)
	BEGIN
		set @nResult = 0
	END
	ELSE
	BEGIN
		set @nResult = 1
	END

	return @nResult
END 
GO

CREATE PROCEDURE bts_FindSubscriptions
@uidBatchID uniqueidentifier
AS	
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

-- First pass predicates.
INSERT INTO FirstPassPredicates  WITH (ROWLOCK) 
	SELECT @uidBatchID, t2.uidPredicateGroupID,  pg.nNumSecondPassPredicates, t2.uidMessageID, t2.nOrderID, pg.uidPredicateORGroupID
	FROM	
	(
		SELECT t1.uidMessageID, t1.nOrderID, t1.uidPredicateGroupID, COUNT(*) as nTotalPredicates
		FROM (
			SELECT  ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM 	MessageProps as mp WITH (ROWLOCK READPAST)
			JOIN EqualsPredicates ep WITH( ROWLOCK READPAST ) ON mp.vtPropValue = ep.vtValue AND mp.uidPropID = ep.uidPropID
			WHERE mp.uidBatchID = @uidBatchID
			
			UNION ALL
			
			SELECT  ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM 	MessageProps as mp WITH (ROWLOCK READPAST)
			JOIN LessThanPredicates ep WITH(ROWLOCK READPAST ) ON  mp.vtPropValue < ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 1
			WHERE mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
				
			UNION ALL
			
			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM 	MessageProps as mp WITH (ROWLOCK READPAST)
			JOIN LessThanOrEqualsPredicates ep WITH(ROWLOCK READPAST ) ON  mp.vtPropValue <= ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 1
			WHERE mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			
			UNION ALL
			
			SELECT  ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM 	MessageProps as mp WITH (ROWLOCK READPAST)
			JOIN GreaterThanPredicates ep WITH(ROWLOCK READPAST ) ON  mp.vtPropValue > ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 1
			WHERE mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			
			UNION ALL
			
			SELECT  ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM 	MessageProps as mp WITH (ROWLOCK READPAST)
			JOIN GreaterThanOrEqualsPredicates ep WITH(ROWLOCK READPAST ) ON  mp.vtPropValue >= ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 1
			WHERE mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			
			UNION ALL
			
			SELECT  ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM 	MessageProps as mp WITH (ROWLOCK READPAST)
			JOIN NotEqualsPredicates ep WITH(ROWLOCK READPAST ) ON  mp.vtPropValue <> ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 1
			WHERE mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			
			UNION ALL
				
			SELECT  ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM 	MessageProps as mp WITH (ROWLOCK READPAST)
			JOIN ExistsPredicates ep WITH(ROWLOCK READPAST ) ON mp.uidPropID = ep.uidPropID AND ep.tnPass = 1
			WHERE mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			
			UNION ALL
				
			SELECT  ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM 	MessageProps as mp WITH (ROWLOCK READPAST)
			JOIN BitwiseANDPredicates ep WITH(ROWLOCK READPAST ) ON  ( (CAST(mp.vtPropValue as int) & CAST(ep.vtValue as int)) <> 0) AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 1
			WHERE mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			
		)as t1 
	GROUP BY t1.uidMessageID, t1.nOrderID, t1.uidPredicateGroupID
	) as t2
	INNER LOOP JOIN PredicateGroup pg WITH (ROWLOCK READPAST) ON
		 pg.uidPredicateANDGroupID = t2.uidPredicateGroupID AND
		 pg.nNumFirstPassPredicates = t2.nTotalPredicates 
	OPTION(KEEPFIXED PLAN)

SELECT t6.uidMessageID, t6.nOrderID, s.uidSubID, s.uidPredicateGroupID, s.uidInstanceID, s.uidServiceID, s.uidDBOwnerID, s.uidSubGroupID, s.snGroupPriority, s.fIsRequestResponse, s.uidConvoySetID, s.fCanActivateConvoySet, csi.uidInstanceID, csi.uidDatabaseID, cs.uidPropertyID1, cs.uidPropertyID2, cs.uidPropertyID3, [dbo].[bts_fnHasServiceWindow](s.dtStartWindow, s.dtEndWindow), s.nvcApplicationName 
FROM
(
	SELECT  fp.uidPredicateORGroupID, fp.uidMessageID, fp.nOrderID
	FROM FirstPassPredicates fp WITH (ROWLOCK READPAST) 
	LEFT JOIN 
	( 
		SELECT t1.uidMessageID, t1.nOrderID, t1.uidPredicateGroupID, COUNT(*) as nTotalPredicates 
		FROM
		(
			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM MessageProps mp WITH (ROWLOCK READPAST)
			INNER 	JOIN EqualsPredicates2ndPass ep WITH (ROWLOCK READPAST) ON mp.vtPropValue = ep.vtValue AND mp.uidPropID = ep.uidPropID
			     	JOIN FirstPassPredicates   fp1 WITH (ROWLOCK READPAST) ON ep.uidPredicateGroupID = fp1.uidPredicateGroupID AND fp1.uidBatchID = @uidBatchID AND fp1.uidMessageID = mp.uidMessageID
			WHERE   mp.uidBatchID = @uidBatchID
				   
			
			UNION ALL

			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM MessageProps mp WITH (ROWLOCK READPAST)
			INNER 	JOIN LessThanPredicates ep WITH (ROWLOCK READPAST) ON mp.vtPropValue < ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 2
			     	JOIN FirstPassPredicates   fp1 WITH (ROWLOCK READPAST) ON ep.uidPredicateGroupID = fp1.uidPredicateGroupID AND fp1.uidBatchID = @uidBatchID AND fp1.uidMessageID = mp.uidMessageID
			WHERE   mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID

			UNION ALL

			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM MessageProps mp WITH (ROWLOCK READPAST)
			INNER 	JOIN LessThanOrEqualsPredicates ep WITH (ROWLOCK READPAST) ON mp.vtPropValue <= ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 2
			     	JOIN FirstPassPredicates   fp1 WITH (ROWLOCK READPAST) ON ep.uidPredicateGroupID = fp1.uidPredicateGroupID AND fp1.uidBatchID = @uidBatchID AND fp1.uidMessageID = mp.uidMessageID
			WHERE   mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID

			UNION ALL

			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM MessageProps mp WITH (ROWLOCK READPAST)
			INNER 	JOIN GreaterThanPredicates ep WITH (ROWLOCK READPAST) ON mp.vtPropValue > ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 2
			     	JOIN FirstPassPredicates   fp1 WITH (ROWLOCK READPAST) ON ep.uidPredicateGroupID = fp1.uidPredicateGroupID AND fp1.uidBatchID = @uidBatchID AND fp1.uidMessageID = mp.uidMessageID
			WHERE   mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID

			UNION ALL

			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM MessageProps mp WITH (ROWLOCK READPAST)
			INNER 	JOIN GreaterThanOrEqualsPredicates ep WITH (ROWLOCK READPAST) ON mp.vtPropValue >= ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 2
			     	JOIN FirstPassPredicates   fp1 WITH (ROWLOCK READPAST) ON ep.uidPredicateGroupID = fp1.uidPredicateGroupID AND fp1.uidBatchID = @uidBatchID AND fp1.uidMessageID = mp.uidMessageID
			WHERE   mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID

			UNION ALL

			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM MessageProps mp WITH (ROWLOCK READPAST)
			INNER 	JOIN ExistsPredicates ep WITH (ROWLOCK READPAST) ON  mp.uidPropID = ep.uidPropID AND ep.tnPass = 2
			     	JOIN FirstPassPredicates   fp1 WITH (ROWLOCK READPAST) ON ep.uidPredicateGroupID = fp1.uidPredicateGroupID AND fp1.uidBatchID = @uidBatchID AND fp1.uidMessageID = mp.uidMessageID
			WHERE   mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID

			UNION ALL 

			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM MessageProps mp WITH (ROWLOCK READPAST)
			INNER 	JOIN NotEqualsPredicates ep WITH (ROWLOCK READPAST) ON mp.vtPropValue <> ep.vtValue AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 2
			     	JOIN FirstPassPredicates   fp1 WITH (ROWLOCK READPAST) ON ep.uidPredicateGroupID = fp1.uidPredicateGroupID AND fp1.uidBatchID = @uidBatchID AND fp1.uidMessageID = mp.uidMessageID
			WHERE   mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID

			UNION ALL
			
			SELECT ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID
			FROM MessageProps mp WITH (ROWLOCK READPAST)
			INNER JOIN BitwiseANDPredicates ep WITH(ROWLOCK READPAST) ON  ( (CAST(mp.vtPropValue as int) & CAST(ep.vtValue as int)) <> 0) AND mp.uidPropID = ep.uidPropID AND ep.tnPass = 2
			     	JOIN FirstPassPredicates   fp1 WITH (ROWLOCK READPAST) ON ep.uidPredicateGroupID = fp1.uidPredicateGroupID AND fp1.uidBatchID = @uidBatchID AND fp1.uidMessageID = mp.uidMessageID
			WHERE   mp.uidBatchID = @uidBatchID
			GROUP BY ep.nID, ep.uidPredicateGroupID, mp.uidMessageID, mp.nOrderID

		)as t1 
		GROUP BY t1.uidMessageID, t1.nOrderID, t1.uidPredicateGroupID
	) as t2 ON t2.uidPredicateGroupID = fp.uidPredicateGroupID AND t2.uidMessageID = fp.uidMessageID
	WHERE fp.uidBatchID = @uidBatchID AND
	      ( fp.nNumSecondPassPredicates = 0 OR (fp.nNumSecondPassPredicates = t2.nTotalPredicates) )
	GROUP BY fp.uidPredicateORGroupID, fp.uidMessageID, fp.nOrderID
)as t6
JOIN Subscription AS s WITH (ROWLOCK) ON s.fEnabled > 0 AND 
			0 <> [dbo].[bts_fnHasConvoyProps](s.uidConvoySetID, s.vtConvoySetProp1DefVal, s.vtConvoySetProp2DefVal, s.vtConvoySetProp3DefVal, @uidBatchID, t6.uidMessageID) AND
			s.uidPredicateGroupID = t6.uidPredicateORGroupID
LEFT JOIN ConvoySetInstances csi WITH (ROWLOCK READPAST REPEATABLEREAD) ON  csi.nID = [dbo].[bts_fnFindConvoySet](s.uidConvoySetID, s.vtConvoySetProp1DefVal, s.vtConvoySetProp2DefVal, s.vtConvoySetProp3DefVal, @uidBatchID, t6.uidMessageID)
LEFT JOIN ConvoySets cs WITH (ROWLOCK READPAST) ON cs.uidConvoySetID = s.uidConvoySetID
ORDER BY t6.nOrderID, s.uidSubGroupID, s.snGroupPriority
OPTION(KEEPFIXED PLAN)

DELETE FROM FirstPassPredicates WITH (ROWLOCK) WHERE uidBatchID = @uidBatchID

GO
GRANT EXEC ON [dbo].[bts_FindSubscriptions] TO BTS_HOST_USERS
GO

CREATE PROCEDURE [dbo].[bts_RemoveMessageProps]
@uidBatchID uniqueidentifier
AS

set nocount on
set transaction isolation level read committed

DELETE FROM MessageProps WITH (ROWLOCK) WHERE uidBatchID = @uidBatchID

GO
GRANT EXEC ON [dbo].[bts_RemoveMessageProps] TO BTS_HOST_USERS
GO


CREATE PROCEDURE [dbo].[bts_AdminExistInstancesInMessageBox]
	@fExistInstances int OUTPUT
	
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

set @fExistInstances = 0
select TOP 1 @fExistInstances = COUNT(*) FROM Instances
if (@fExistInstances <> 0)
	set @fExistInstances = 1

return
GO
GRANT EXEC ON [dbo].[bts_AdminExistInstancesInMessageBox] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_AdminCheckForStaticState]
	@uidClassID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@fExists int OUTPUT
	
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

set @fExists = 0
select @fExists = COUNT(*) FROM StaticStateInfo WHERE uidServiceID = @uidServiceID

return
GO
GRANT EXEC ON [dbo].[bts_AdminCheckForStaticState] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[bts_AdminSubscriptionExists]
@uidSubscriptionID uniqueidentifier,
@fExists int OUTPUT
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

SELECT @fExists = COUNT(*) FROM Subscription WHERE uidSubID = @uidSubscriptionID
GO
GRANT EXEC ON [dbo].[bts_AdminSubscriptionExists] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[int_ToggleSubscriptions]
@uidServiceID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@fActivationOnly int,
@fEnable int

AS

set nocount on
set transaction isolation level read committed

declare @tnActiveTable tinyint, @retVal int

if ( (@fEnable <> -1) AND (@fEnable <> 1) AND (@fEnable <> 4) AND (@fEnable <> 0) )
	SET @fEnable = 2

if (@uidInstanceID IS NOT NULL) --Disable all subscriptions for a given instance
BEGIN
	--lets do a quick check to see if there are any subscriptions or convoys for this instance.
	--if not we will return -1 so that the caller can do something with that information like not go to the master msgbox
	IF ( NOT EXISTS (SELECT TOP 1 uidInstanceID FROM Subscription s WHERE s.uidInstanceID = @uidInstanceID AND s.uidServiceID = @uidServiceID) AND
     	     NOT EXISTS (SELECT TOP 1 uidInstanceID FROM ConvoySetInstances WITH (ROWLOCK INDEX(IX_ConvoySetInstances) ) WHERE uidInstanceID = @uidInstanceID ) )
	BEGIN
		--there was nothing for us to do
		return -4
	END

	if (@fEnable != -1)	
	BEGIN
		UPDATE Subscription SET fEnabled = @fEnable
		FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_2))
		WHERE uidServiceID = @uidServiceID AND uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
		
		--we also have to worry about convoys in this case so unless this is a delete call, we will also update
		--potential convoy cases
		UPDATE ConvoySetInstances SET fEnabled = @fEnable
		FROM ConvoySetInstances WITH (ROWLOCK INDEX(IX_ConvoySetInstances) )
		WHERE uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
	END
	ELSE 
	BEGIN
	
		--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
		--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
		exec  @retVal = sp_getapplock 'SubscriptionRefCountLog', 'Shared', 'Transaction'
	
		IF (@retVal < 0 ) -- Lock Not granted
		BEGIN
			RAISERROR('Unable to acquire applock on SubscriptionRefCountLog', 16, 1)
			return
		END

		SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 2 OPTION (KEEPFIXED PLAN)
		
		if (@tnActiveTable = 1)
		BEGIN
			INSERT INTO PredicateGroupZeroSum1 WITH (ROWLOCK)
			SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
			FROM Subscription s WITH (ROWLOCK INDEX(IX_Subscription_2))
			JOIN PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
				ON  s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
					pg.fIsDistributionList = 0
			WHERE s.uidInstanceID = @uidInstanceID AND
				s.uidServiceID = @uidServiceID			
			OPTION (KEEPFIXED PLAN)
		END
		ELSE
		BEGIN
			INSERT INTO PredicateGroupZeroSum2 WITH (ROWLOCK)
			SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
			FROM Subscription s WITH (ROWLOCK INDEX(IX_Subscription_2))
			JOIN PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
				ON  s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
					pg.fIsDistributionList = 0
			WHERE s.uidInstanceID = @uidInstanceID AND
				s.uidServiceID = @uidServiceID			
			OPTION (KEEPFIXED PLAN)
		END

		exec sp_releaseapplock 'SubscriptionRefCountLog', 'Transaction'

		DELETE FROM Subscription FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_2)) WHERE uidServiceID = @uidServiceID AND uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
		DELETE FROM UniqueSubscription WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	END
END
else if (@uidServiceID IS NOT NULL) --Disable all subscriptions for a given service
BEGIN
	if (@fActivationOnly = 0)
	BEGIN
		if (@fEnable != -1) --delete row from unique sub table
		BEGIN
			UPDATE Subscription
			SET fEnabled = @fEnable
			FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_2))
			WHERE uidServiceID = @uidServiceID
			OPTION (KEEPFIXED PLAN)
		END
		ELSE
		BEGIN
		
			--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
			--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
			exec  @retVal = sp_getapplock 'SubscriptionRefCountLog', 'Shared', 'Transaction'

			IF (@retVal < 0 ) -- Lock Not granted
			BEGIN
				RAISERROR('Unable to acquire applock on SubscriptionRefCountLog', 16, 1)
				return
			END

			SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 2 OPTION (KEEPFIXED PLAN)
		
			if (@tnActiveTable = 1)
			BEGIN
				INSERT INTO PredicateGroupZeroSum1 WITH (ROWLOCK)
				SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
				FROM Subscription s WITH (ROWLOCK INDEX(IX_Subscription_2))
				JOIN PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
					ON  s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
						pg.fIsDistributionList = 0
				WHERE s.uidServiceID = @uidServiceID			
				OPTION (KEEPFIXED PLAN)
			END
			else
			BEGIN
				INSERT INTO PredicateGroupZeroSum2 WITH (ROWLOCK)
				SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
				FROM Subscription s WITH (ROWLOCK INDEX(IX_Subscription_2))
				JOIN PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
					ON  s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
						pg.fIsDistributionList = 0
				WHERE s.uidServiceID = @uidServiceID			
				OPTION (KEEPFIXED PLAN)
			END

			exec sp_releaseapplock 'SubscriptionRefCountLog', 'Transaction'

			DELETE FROM Subscription FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_2)) WHERE uidServiceID = @uidServiceID OPTION (KEEPFIXED PLAN)
			DELETE FROM UniqueSubscription WITH (ROWLOCK) WHERE uidServiceID = @uidServiceID
		END
	END
	ELSE
	BEGIN
		--we have to treat deletes slightly different here as we can't delete the non-activating convoy subs
		--or else we will ruin the active services
		if (@fEnable != -1)
		BEGIN
			--Set the activation flag to 0 for the activating subs of the convoy 			
			if (@fEnable = 0)
			BEGIN
				UPDATE Subscription
				SET fEnabled = @fEnable
				FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_2))
				WHERE uidServiceID = @uidServiceID AND
					uidInstanceID IS NULL AND  uidConvoySetID IS NULL
				OPTION (KEEPFIXED PLAN)							

				UPDATE Subscription SET fCanActivateConvoySet = -1 
				FROM Subscription WITH ( ROWLOCK INDEX(IX_Subscription_2))
				WHERE uidServiceID = @uidServiceID AND uidInstanceID IS NULL AND uidConvoySetID IS NOT NULL and fCanActivateConvoySet = 1
				OPTION (KEEPFIXED PLAN) 
			END
			ELSE
			BEGIN 				
				UPDATE Subscription
				SET fEnabled = @fEnable
				FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_2))
				WHERE uidServiceID = @uidServiceID AND
					uidInstanceID IS NULL
				OPTION (KEEPFIXED PLAN)

				UPDATE Subscription SET fCanActivateConvoySet = 1 
				FROM Subscription WITH ( ROWLOCK INDEX(IX_Subscription_2))
				WHERE uidServiceID = @uidServiceID AND uidInstanceID IS NULL AND uidConvoySetID IS NOT NULL AND fCanActivateConvoySet = -1
				OPTION (KEEPFIXED PLAN) 
			END
		END
		ELSE 
		BEGIN
			--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
			--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
			exec  @retVal = sp_getapplock 'SubscriptionRefCountLog', 'Shared', 'Transaction'

			IF (@retVal < 0 ) -- Lock Not granted
			BEGIN
				RAISERROR('Unable to acquire applock on SubscriptionRefCountLog', 16, 1)
				return
			END


			SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 2 OPTION (KEEPFIXED PLAN)
		
			if (@tnActiveTable = 1)
			BEGIN
				INSERT INTO PredicateGroupZeroSum1 WITH (ROWLOCK)
				SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
				FROM Subscription s WITH (ROWLOCK INDEX(IX_Subscription_2))
				JOIN PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
					ON  s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
						pg.fIsDistributionList = 0
				WHERE s.uidInstanceID IS NULL AND
					s.uidServiceID = @uidServiceID AND
					s.uidConvoySetID IS NULL		
				OPTION (KEEPFIXED PLAN)
			END
			else
			BEGIN
				INSERT INTO PredicateGroupZeroSum2 WITH (ROWLOCK)
				SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
				FROM Subscription s WITH (ROWLOCK INDEX(IX_Subscription_2))
				JOIN PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
					ON  s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
						pg.fIsDistributionList = 0
				WHERE s.uidInstanceID IS NULL AND
					s.uidServiceID = @uidServiceID AND
					s.uidConvoySetID IS NULL		
				OPTION (KEEPFIXED PLAN)
			END
			
			exec sp_releaseapplock 'SubscriptionRefCountLog', 'Transaction'

			DELETE FROM Subscription FROM Subscription WITH ( ROWLOCK INDEX(IX_Subscription_2))
			WHERE uidServiceID = @uidServiceID AND uidInstanceID IS NULL AND uidConvoySetID IS NULL
			OPTION (KEEPFIXED PLAN)
			
			UPDATE Subscription SET fCanActivateConvoySet = 0
			FROM Subscription WITH ( ROWLOCK INDEX(IX_Subscription_2))
			WHERE uidServiceID = @uidServiceID AND uidInstanceID IS NULL AND uidConvoySetID IS NOT NULL
			OPTION (KEEPFIXED PLAN)
			  
			  --delete row from unique sub table
			DELETE FROM UniqueSubscription WHERE uidServiceID = @uidServiceID AND uidInstanceID IS NULL
		END
	END
END

GO

CREATE PROCEDURE [dbo].[bts_AdminAddModule]
@nvcModule nvarchar(256),
@nReturn int OUTPUT
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

set @nReturn = 0
INSERT INTO Modules (nvcName) VALUES (@nvcModule)
IF (@@ROWCOUNT = 0)
	set @nReturn = -1
GO
GRANT EXEC ON [dbo].[bts_AdminAddModule] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_AdminRegisterService]
@nvcServiceName nvarchar(256),
@uidServiceID uniqueidentifier,
@uidClassID uniqueidentifier,
@nvcModule nvarchar(256),
@nReturn int OUTPUT
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @id int
set @nReturn = 0

SELECT TOP 1 @id = nModuleID FROM Modules WHERE nvcName = @nvcModule
if ( (@nvcModule IS NOT NULL) AND (@id IS NULL) )
BEGIN
	set @nReturn = -1
END
ELSE
BEGIN
	INSERT INTO Services (uidServiceID, uidServiceClassID, nModuleID) VALUES (@uidServiceID, @uidClassID, @id)
END

GO
GRANT EXEC ON [dbo].[bts_AdminRegisterService] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_AdminUpdateModule]
@nvcOldModuleName nvarchar(256),
@nvcNewModuleName nvarchar(256),
@nReturn int OUTPUT
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @id int
set @nReturn = 0

UPDATE Modules SET nvcName = @nvcNewModuleName WHERE nvcName = @nvcOldModuleName
IF (@@ROWCOUNT = 0)
	set @nReturn = -1

GO
GRANT EXEC ON [dbo].[bts_AdminUpdateModule] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_AdminUpdateService]
@uidServiceID uniqueidentifier,
@nvcModule nvarchar(256),
@nReturn int OUTPUT
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @id int
set @nReturn = 0

SELECT TOP 1 @id = nModuleID FROM Modules WHERE nvcName = @nvcModule
if ( (@nvcModule IS NOT NULL) AND (@id IS NULL) )
BEGIN
	set @nReturn = -1
END
ELSE
BEGIN
	UPDATE Services SET nModuleID = @id WHERE uidServiceID = @uidServiceID
	IF (@@ROWCOUNT = 0)
		set @nReturn = -2
END

GO
GRANT EXEC ON [dbo].[bts_AdminUpdateService] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_AdminRemoveService]
@uidServiceID uniqueidentifier,
@nReturn int OUTPUT
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @id int
set @nReturn = 0

DELETE FROM Services WHERE uidServiceID = @uidServiceID
if (@@ROWCOUNT = 0)
	set @nReturn = -1
GO
GRANT EXEC ON [dbo].[bts_AdminRemoveService] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_AdminRemoveModule]
@nvcModule nvarchar(256),
@nReturn int OUTPUT
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @id int, @cnt int
set @nReturn = 0

SELECT TOP 1 @id = nModuleID FROM Modules WHERE nvcName = @nvcModule
IF ( EXISTS (SELECT TOP 1 uidServiceID FROM Services WHERE nModuleID = @id) )
BEGIN
	set @nReturn = -1
END
ELSE
BEGIN
	DELETE FROM Modules WHERE nModuleID = @id
	if (@@ROWCOUNT = 0)
		set @nReturn = -2
END

GO
GRANT EXEC ON [dbo].[bts_AdminRemoveModule] TO BTS_ADMIN_USERS
GO

--This sproc is when a slave messagebox is forcefully deleted and we need to wipe all subscription and convoy info 
--associated with that msgbox
CREATE PROCEDURE [dbo].[bts_AdminHardCleanupSlaveMessagebox]
@uidDatabaseID uniqueidentifier
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @tnActiveTable tinyint, @retVal int

--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
exec  @retVal = sp_getapplock 'SubscriptionRefCountLog', 'Shared', 'Transaction'

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	RAISERROR('Unable to acquire applock on SubscriptionRefCountLog', 16, 1)
	return
END

SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 2 OPTION (KEEPFIXED PLAN)
	
if (@tnActiveTable = 1)
BEGIN
	INSERT INTO PredicateGroupZeroSum1 WITH (ROWLOCK)
	SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
	FROM PredicateGroup pg WITH (ROWLOCK), Subscription s WITH (ROWLOCK)
	WHERE s.uidDBOwnerID = @uidDatabaseID AND
		s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
		pg.fIsDistributionList = 0
	OPTION (KEEPFIXED PLAN)
END
else
BEGIN
	INSERT INTO PredicateGroupZeroSum2 WITH (ROWLOCK)
	SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
	FROM PredicateGroup pg WITH (ROWLOCK), Subscription s WITH (ROWLOCK)
	WHERE s.uidDBOwnerID = @uidDatabaseID AND
		s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
		pg.fIsDistributionList = 0
	OPTION (KEEPFIXED PLAN)
END

exec sp_releaseapplock 'SubscriptionRefCountLog', 'Transaction'

DELETE FROM Subscription WITH (ROWLOCK) WHERE uidDBOwnerID = @uidDatabaseID OPTION (KEEPFIXED PLAN)

DELETE FROM ConvoySetInstances WHERE uidDatabaseID = @uidDatabaseID
GO

GRANT EXEC ON [dbo].[bts_AdminHardCleanupSlaveMessagebox] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_AdminIsServiceRunning]
@uidClassID uniqueidentifier,
@uidServiceID uniqueidentifier,
@fExists int OUTPUT
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @uidInstanceID uniqueidentifier

set @fExists = 0

SELECT TOP 1 @uidInstanceID = uidInstanceID FROM Instances WITH (ROWLOCK) WHERE @uidClassID = uidClassID AND uidServiceID = @uidServiceID
if (@@ROWCOUNT > 0)
    set @fExists = 1

GO
GRANT EXEC ON [dbo].[bts_AdminIsServiceRunning] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[bts_AdminToggleSubscriptions]
@uidServiceID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@fActivationOnly int,
@fEnable int

AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

exec int_ToggleSubscriptions @uidServiceID, @uidInstanceID, @fActivationOnly, @fEnable

GO
GRANT EXEC ON [dbo].[bts_AdminToggleSubscriptions] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[int_InsertIntoQueue]
@nvcAppName nvarchar(256),
@uidMessageID uniqueidentifier,
@nOrderID int,
@uidSubID uniqueidentifier,
@uidClassID uniqueidentifier,
@dtStartWindow datetime,
@dtEndWindow datetime,
@dtValid datetime,
@uidServiceID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidAppInstanceID uniqueidentifier,
@uidPortID uniqueidentifier,
@snPartRetrieval smallint,
@fOrderedDelivery int,
@snPriority smallint,
@fEnabled int,
@fReserved int,
@uidConvoySetID uniqueidentifier = null,
@snRefCount int = 0
AS

set nocount on

declare @nvcStoredProc nvarchar(500)
set @nvcStoredProc = 'int_InsertIntoQueue_' + @nvcAppName

--Need to handel cases where PortID or AppInstanceID are NULL. Nothing else should ever be null
exec  @nvcStoredProc  @uidMessageID, @uidSubID, @uidClassID, @dtStartWindow, @dtEndWindow, @dtValid , @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID,  @snPartRetrieval, @fOrderedDelivery, @snPriority, @fEnabled, @fReserved, null, @uidConvoySetID, @snRefCount 
return

GO

--	fSuccess	=  0	Success	- Subscriptions Found and Workitems Queued
--				=  40	Fail	- No Subscriptions Found
--				=  110	Fail	- Subscription did not have required properties

CREATE PROCEDURE [dbo].[int_EvaluateSubscription]
@uidMessageID uniqueidentifier,
@nOrderID int,
@uidSubID uniqueidentifier,
@uidPredicateGroupID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@fReserved int,
@snRefCount int,
@fSuccess int OUTPUT
AS

--output param is set to 0 if no subscription filled, 1 if it is filled, and -1 if auth fails

declare @nSubscriptionsFound int,
	@nvcAppName nvarchar(256),	
	@uidClassID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@uidAppInstanceID uniqueidentifier,
	@uidPortID uniqueidentifier,
	@uidConvoySetID uniqueidentifier,
	@fEnabled smallint,
	@snPartRetrieval smallint,
	@fOrderedDelivery int,
	@snPriority smallint,
	@nCheckAppProps int,
	@dtStartWindow datetime,
	@dtEndWindow datetime,
	@dtValid datetime,
	@nTemp int,
	@fComplete int

set @nSubscriptionsFound = 0
set @fSuccess = 0

if ( @uidSubID IS NULL)
	return
	

--Determine what subscriptions match this message

SELECT TOP 1 @nvcAppName = s.nvcApplicationName, 
	   @uidClassID = s.uidClassID, 
	   @dtStartWindow = s.dtStartWindow, 
	   @dtEndWindow = s.dtEndWindow, 
	   @dtValid = s.dtValid, 
	   @uidServiceID = s.uidServiceID, 
	   @uidAppInstanceID = s.uidAppInstanceID, 
	   @uidPortID = s.uidPortID, 
	   @fEnabled = s.fEnabled,
	   @snPartRetrieval = s.snPartRetrieval, 
	   @fOrderedDelivery = s.fOrderedDelivery, 
	   @snPriority = s.snPriority,
	   @uidConvoySetID = s.uidConvoySetID
	FROM Subscription AS s WITH (ROWLOCK REPEATABLEREAD INDEX(CIX_Subscription))
	WHERE s.uidPredicateGroupID = @uidPredicateGroupID AND s.uidSubID = @uidSubID
	OPTION (KEEPFIXED PLAN)

IF (@@ROWCOUNT > 0)
BEGIN
	--Do a quick check to see if we need to validate app properties before filling subscriptions
	set @nCheckAppProps = 0
	SELECT @nCheckAppProps = count(*) FROM MessagePredicates WHERE uidMessageID = @uidMessageID
	
	if (@nCheckAppProps <> 0)
	BEGIN
		SELECT @nTemp = count(*) 
		FROM MessagePredicates AS m WITH (ROWLOCK)
		JOIN ApplicationProps as a WITH (ROWLOCK) ON m.uidPropID = a.uidPropID AND m.vtPropValue = a.vtPropValue
		WHERE m.uidMessageID = @uidMessageID AND
			a.nvcApplicationName = @nvcAppName
		OPTION (KEEPFIXED PLAN)
		
		if (@nTemp <> @nCheckAppProps)
		BEGIN
			set @fSuccess = -1
		END
		
	END
	
	if (@fSuccess = 0)
	BEGIN
		--For convoys, it is possible the subscription is not an instance subscription and so it would not have
		--been deactivated if the instance was suspended. In this case (ie the instance id is NULL, the convoysetid
		--is not null and the subscription is enabled, we need to check the convoysetinstances table to see if this
		--instance was disabled. Subs could be fEnabled and convoyset instance not as
		--well as vice-versa. Convoy set instance fEnabled takes precedence over the
		--subs fEnabled.
		--The problem is MSMQt has convoys which span services. This means that while the convoy instance
		--is still active, the port is stopped. For MSMQt we will obey the subscription fEnabled flag and ignore the
		--convoy set instance enabled flag. I am not happy putting in code which is specific to one component, but  I don't
		--really have a choice here. Oh well
		if ( (@uidInstanceID IS NOT NULL) AND (@uidConvoySetID IS NOT NULL)  AND ( (@fEnabled = 1) OR (@uidClassID != '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}') ))
		BEGIN
			SELECT TOP 1 @fEnabled = fEnabled FROM ConvoySetInstances WITH (ROWLOCK REPEATABLEREAD INDEX(IX_ConvoySetInstances)) WHERE uidConvoySetID = @uidConvoySetID AND uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
			IF (@@ROWCOUNT = 1 AND @fEnabled > 0)
			BEGIN
				exec int_InsertIntoQueue @nvcAppName, @uidMessageID, @nOrderID, @uidSubID, @uidClassID, @dtStartWindow, @dtEndWindow, @dtValid, @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID, @snPartRetrieval, @fOrderedDelivery, @snPriority, @fEnabled, @fReserved, @uidConvoySetID, @snRefCount 
				set @fSuccess = 1
			END
		END
		ELSE
		BEGIN
			exec int_InsertIntoQueue @nvcAppName, @uidMessageID, @nOrderID, @uidSubID, @uidClassID, @dtStartWindow, @dtEndWindow, @dtValid, @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID, @snPartRetrieval, @fOrderedDelivery, @snPriority, @fEnabled, @fReserved, @uidConvoySetID, @snRefCount 
			set @fSuccess = 1
		END
	END

END

return

GO

--	int_InsertPart	Adds a Part for a Message, optionally creating the Part
--			If the Part Data is NULL, the Part is assumed to be being referenced
--			If the Part Data is NOT NULL, the Part is assumed to be a new Part
--
	

CREATE PROCEDURE [dbo].[int_InsertPart]
@uidMessageID uniqueidentifier,
@uidPartID uniqueidentifier,
@nBodyPart smallint,
@nvcPartName nvarchar(256),
@nPartSize int,
@imgData image,
@imgPropBag image,
@fPartExistsInDB int, 
@fSuccess int OUTPUT

AS


set nocount on
set transaction isolation level read committed

declare @fPartExists int

set @fSuccess = 0

if ( @uidPartID IS NULL OR @nvcPartName IS NULL )
BEGIN
	return
END

--I will use constraints instead of checks to assure uniqueness. 
-- Check if the Part may have existed in the Database, do not Blindly Add
-- Instead perform a check whether the Part is really there or not

if ((@imgData IS NOT NULL) AND ( @fPartExistsInDB = 0 ))
BEGIN
	INSERT INTO Parts WITH (ROWLOCK) (uidPartID, nNumFragments, nPartSize, imgPart, imgPropBag)  VALUES (@uidPartID, 1, @nPartSize, @imgData, @imgPropBag)
END
else
BEGIN
	-- Check if the Part exists
	declare @uidID uniqueidentifier
	SELECT @uidID = uidPartID FROM Parts WITH (ROWLOCK INDEX(IX_Parts)) WHERE uidPartID = @uidPartID OPTION (KEEPFIXED PLAN)
	if (@@ROWCOUNT = 0)
	BEGIN
		--This will throw an error
		INSERT INTO Parts WITH (ROWLOCK) (uidPartID, nNumFragments, nPartSize, imgPart, imgPropBag) VALUES (@uidPartID, 1, @nPartSize, @imgData, @imgPropBag)
	END
END

INSERT INTO MessageParts WITH (ROWLOCK) VALUES (@uidMessageID, @uidPartID, @nvcPartName, @nBodyPart)
IF (@@ROWCOUNT = 0)
BEGIN
	--for optimizations on deletion we don't allow a message to reference the same part twice. lets copy the part
	declare @uid uniqueidentifier
	set @uid = NewID()

	INSERT INTO Parts (uidPartID, nNumFragments, nPartSize, imgPart, imgPropBag, uidClonedPartID)
	SELECT TOP 1 @uid, p.nNumFragments, p.nPartSize, p.imgPart, p.imgPropBag, p.uidPartID
	FROM Parts p WITH (ROWLOCK) 
	WHERE p.uidPartID = @uidPartID
	OPTION (KEEPFIXED PLAN)

	INSERT INTO Fragments (uidPartID, nFragmentNumber, nFragmentSize, nOffsetStart, nOffsetEnd, imgFrag)
	SELECT @uid, f.nFragmentNumber, f.nFragmentSize, f.nOffsetStart, f.nOffsetEnd, f.imgFrag
	FROM Fragments f WITH (ROWLOCK)
	WHERE f.uidPartID = @uidPartID
	OPTION (KEEPFIXED PLAN)

	INSERT INTO MessageParts WITH (ROWLOCK) VALUES (@uidMessageID, @uid, @nvcPartName, @nBodyPart)
	exec int_RefCountPart @uidMessageID, @uid, 1
END
ELSE
BEGIN
	exec int_RefCountPart @uidMessageID, @uidPartID, 1
END

GO

--This sproc will be used to fill the subscriptions and to insert the actual message data
CREATE PROCEDURE [dbo].[bts_InsertMessage]
@uidMessageID uniqueidentifier,
@uidBatchID uniqueidentifier,
@uidSubscriptionID uniqueidentifier,
@uidPredicateGroupID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@fMessageRoutedTwice int,
@nRefCount int,
@nNumParts int,
@OriginatorSID nvarchar(128),
@OriginatorPID nvarchar(128),
@dtExpiration datetime,
@fTrackMessage int,
@nvcMessageType nvarchar(128),
@uidPartID uniqueidentifier,
@nvcPartName nvarchar(256),
@nPartSize int,
@fSuccess int OUTPUT,
@imgPart image,
@imgPropBag image,
@fPartExistsInDB int,
@imgContext image


AS

set nocount on
set transaction isolation level read committed

set @fSuccess = 0

set transaction isolation level read committed

BEGIN TRANSACTION
 
declare @fRefCountLocally int
if ( (@nRefCount = 1) AND (@fTrackMessage = 0) )
	set @fRefCountLocally = 1
else
	set @fRefCountLocally = 0

if (@uidSubscriptionID IS NOT NULL)
BEGIN
	--if it equals one we will refcount it locally
	if ( (@nRefCount > 0) AND (@fRefCountLocally = 0) )
	BEGIN
		exec int_RefCountMessage @uidMessageID, 0, @nRefCount
	END

	exec int_EvaluateSubscription @uidMessageID, 1, @uidSubscriptionID, @uidPredicateGroupID, @uidInstanceID, @fMessageRoutedTwice, @fRefCountLocally, @fSuccess OUTPUT

	if (@fSuccess <> 1)
	BEGIN
		if (@fRefCountLocally = 1)
			exec int_RefCountMessage @uidMessageID, 0, 0 --if it is only 1 then we never even got to ref count it locally so insert a 0 to make sure it gets cleaned up
		else
			exec int_RefCountMessage @uidMessageID, 0, -1 --deref this since we assumed all subs would be filled upfront
	END
END
else if (@uidMessageID IS NOT NULL)
BEGIN
	IF (@imgContext IS NOT NULL) --The context will only be inserted with the body
	BEGIN				--so it is safe to assume this is a one time deal and no
						--race conditions exist
		set @fSuccess = 0
		
		--Insert the Record in Spool.
		
		if (1 = [dbo].[bts_fnIsTrustedUser]())
		BEGIN
			if (@OriginatorPID IS NULL) 
				set @OriginatorPID = 's-1-5-7'

			if (@OriginatorSID IS NOT NULL)
				INSERT INTO Spool WITH (ROWLOCK) (uidMessageID, OriginatorSID, OriginatorPID, dtExpiration, nvcMessageType, nNumParts, uidBodyPartID, nvcBodyPartName, nCounter,  imgContext) VALUES (@uidMessageID, @OriginatorSID, @OriginatorPID, @dtExpiration, @nvcMessageType, @nNumParts, @uidPartID, @nvcPartName, 1, @imgContext)
			else
				INSERT INTO Spool WITH (ROWLOCK) (uidMessageID, OriginatorPID, dtExpiration, nvcMessageType, nNumParts, uidBodyPartID, nvcBodyPartName, nCounter,  imgContext) VALUES (@uidMessageID, @OriginatorPID, @dtExpiration, @nvcMessageType, @nNumParts, @uidPartID, @nvcPartName, 1, @imgContext)
		END
		else
			INSERT INTO Spool WITH (ROWLOCK) (uidMessageID, dtExpiration, nvcMessageType, nNumParts, uidBodyPartID, nvcBodyPartName, nCounter,  imgContext) VALUES (@uidMessageID, @dtExpiration, @nvcMessageType, @nNumParts, @uidPartID, @nvcPartName, 1, @imgContext)
		
		--How do I handle this failure
		exec int_InsertPart @uidMessageID, @uidPartID, 1, @nvcPartName, @nPartSize, @imgPart, @imgPropBag, @fPartExistsInDB, @fSuccess OUTPUT

		if (@fTrackMessage = 1)
		BEGIN
			exec int_TrackMessage @uidMessageID
		END
			
		DELETE FROM MessageProps WITH (ROWLOCK) WHERE uidBatchID = @uidBatchID --wipe these here
		DELETE FROM MessagePredicates WITH (ROWLOCK) WHERE uidMessageID = @uidMessageID --let's wipe these since they are no longer used
	END
	ELSE
	BEGIN
		-- Insert the non-Body Part
		exec int_InsertPart @uidMessageID, @uidPartID, 0, @nvcPartName, @nPartSize, @imgPart, @imgPropBag, @fPartExistsInDB, @fSuccess OUTPUT
	END
END

	
COMMIT TRANSACTION

GO
GRANT EXEC ON [dbo].[bts_InsertMessage] TO BTS_HOST_USERS
GO

CREATE PROCEDURE [dbo].[bts_InsertDebugMessage_]
@uidMessageID uniqueidentifier,
@nNumParts int,
@dtExpiration datetime,
@uidServiceID uniqueidentifier,
@uidClassID uniqueidentifier,
@uidPortID uniqueidentifier,
@dtValidTime datetime,
@dtStartWindow datetime,
@dtEndWindow datetime,
@uidAppInstanceID uniqueidentifier,
@nvcMessageType nvarchar(128),
@nvcAdapter nvarchar(512),
@nvcURI nvarchar(512),
@nvcUserState nvarchar(256),
@imgContext image
AS

--This is just a place holder for when apps registered only as publishers get routing failures.
--without this we would get db accessor asserts so we just make this sproc a no-op
GO
GRANT EXEC ON [dbo].[bts_InsertDebugMessage_] TO BTS_HOST_USERS
GO




--	fSuccess	= 0		Successful
--				= 50	Duplicate Message


CREATE PROCEDURE [dbo].[bts_InsertFragment]
@nFragmentNumber int,
@nFragmentSize int,
@nOffsetStart int,
@nOffsetEnd int,
@uidPartID uniqueidentifier,
@uidMessageID uniqueidentifier,
@imgFragment image,
@fPartExistsInDB int

AS

set transaction isolation level read committed
set nocount on

declare @fFragmentExists int, @partCount int

if ( @imgFragment IS NULL )
BEGIN
	set @fFragmentExists = 1
END
else if ( @fPartExistsInDB = 1 )
BEGIN
	-- Check if the Fragment exists
	SELECT TOP 1 @fFragmentExists = COUNT(*) FROM Fragments WITH (ROWLOCK) WHERE uidPartID = @uidPartID AND nFragmentNumber = @nFragmentNumber OPTION (KEEPFIXED PLAN)
END
else
BEGIN
	set @fFragmentExists = 0
END

if ( @fFragmentExists = 0 )
BEGIN
	INSERT INTO Fragments WITH (ROWLOCK) (
			uidPartID,
			nFragmentSize,
			nFragmentNumber,
			nOffsetStart,
			nOffsetEnd,
			imgFrag )
		VALUES (
			@uidPartID,
			@nFragmentSize,
			@nFragmentNumber,
			@nOffsetStart,
			@nOffsetEnd,
			@imgFragment )
			
	UPDATE Parts SET nNumFragments = nNumFragments + 1, nPartSize = nPartSize + @nFragmentSize
	FROM Parts WITH (ROWLOCK)
	WHERE uidPartID = @uidPartID
	OPTION (KEEPFIXED PLAN)

	--we need to see if this message has any other parts which cloned this part. We do cloning within the scope of a message
	--so that we can have a unique clause on msgid, partid which helps cardinality when deleting
	SELECT TOP 1 @partCount = nNumParts FROM Spool WITH (ROWLOCK) WHERE uidMessageID = @uidMessageID
	--we only have to worry about this if there is more than one part
	if (@partCount > 1)
	BEGIN
		IF EXISTS ( SELECT TOP 1 p.uidPartID FROM MessageParts mp WITH (ROWLOCK READPAST) JOIN Parts p WITH (ROWLOCK READPAST) ON mp.uidPartID = p.uidPartID AND p.uidClonedPartID = @uidPartID WHERE mp.uidMessageID = @uidMessageID)
		BEGIN
			declare @uidCloneId uniqueidentifier

			declare parts_cursor CURSOR FAST_FORWARD FOR
			SELECT p.uidPartID
			FROM Parts p WITH (ROWLOCK READPAST), MessageParts mp WITH (ROWLOCK READPAST)
			WHERE mp.uidMessageID = @uidMessageID AND
				mp.uidPartID = p.uidPartID AND
				p.uidClonedPartID = @uidPartID
	
			OPEN parts_cursor
			FETCH NEXT FROM parts_cursor INTO @uidCloneId
			WHILE (@@FETCH_STATUS = 0)
			BEGIN
				INSERT INTO Fragments WITH (ROWLOCK) (
					uidPartID,
					nFragmentSize,
					nFragmentNumber,
					nOffsetStart,
					nOffsetEnd,
					imgFrag )
				VALUES (
					@uidCloneId,
					@nFragmentSize,
					@nFragmentNumber,
					@nOffsetStart,
					@nOffsetEnd,
					@imgFragment )
					
				UPDATE Parts SET nNumFragments = nNumFragments + 1, nPartSize = nPartSize + @nFragmentSize
				FROM Parts WITH (ROWLOCK)
				WHERE uidPartID = @uidCloneId
				OPTION (KEEPFIXED PLAN)
				
				FETCH NEXT FROM parts_cursor INTO @uidCloneId
			END

			CLOSE parts_cursor
			DEALLOCATE parts_cursor
		END
	END
END

GO
GRANT EXEC ON [dbo].[bts_InsertFragment] TO BTS_HOST_USERS
GO


CREATE PROCEDURE [dbo].[bts_AdminChangeSubscriptionOwner]
@uidSubscriptionID uniqueidentifier,
@nvcHostName nvarchar(256)
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @uidAppID uniqueidentifier
SELECT TOP 1 @uidAppID = @uidAppID
FROM Applications WITH (ROWLOCK)
WHERE nvcApplicationName = @nvcHostName
OPTION (KEEPFIXED PLAN)

if (@@ROWCOUNT = 1)
BEGIN
	UPDATE Subscription SET nvcApplicationName = @nvcHostName FROM Subscription WITH (ROWLOCK) WHERE uidSubID = @uidSubscriptionID OPTION (KEEPFIXED PLAN)
END

GO

GRANT EXEC ON [dbo].[bts_AdminChangeSubscriptionOwner] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_CleanupDeadProcesses]
AS

declare @ApplicationName nvarchar(80),
		@uidRecoverProcessID uniqueidentifier,
		@name NCHAR(128),
		@dtCurrentTime datetime,
		@nCount int,
		@nvcSproc nvarchar(128)
		
set @dtCurrentTime = GetUTCDate()

DECLARE btsProcessCurse CURSOR FAST_FORWARD FOR
	SELECT s.uidProcessID, s.nvcApplicationName FROM ProcessHeartbeats AS s WITH (ROWLOCK READPAST)
	WHERE (s.dtNextHeartbeatTime < @dtCurrentTime) OPTION(KEEPFIXED PLAN)
	
OPEN btsProcessCurse


WHILE ( 1 = 1 )
BEGIN
	FETCH NEXT FROM btsProcessCurse INTO @uidRecoverProcessID, @ApplicationName
	
	IF ( @@FETCH_STATUS = -2 )
	BEGIN
		CONTINUE		-- Try the Next Row
	END
	ELSE IF ( @@FETCH_STATUS <> 0 )	-- Other Failure. Break Out
	BEGIN
		BREAK
	END
		
	-- Also double check whether there is any DB Session with this name loaded in SQL table. If so, skip recovery
	
	set @name = CAST (@uidRecoverProcessID as NCHAR(128))
	
	SELECT TOP 1 @nCount = COUNT(*) FROM master..sysprocesses WHERE ( @name = program_name COLLATE LATIN1_GENERAL_CS_AS ) OPTION (KEEPFIXED PLAN)
	
	if ( @nCount > 0 )
	begin
		CONTINUE
	end
	
	set @nvcSproc = '[dbo].[int_ProcessCleanup_' + @ApplicationName + ']'
	exec  @nvcSproc @uidRecoverProcessID
	
END

CLOSE btsProcessCurse
DEALLOCATE btsProcessCurse
GO

-- Apparently the trigger based approach is not working particularly well, so now we have to try a different way

CREATE PROCEDURE bts_PurgeSubscriptions
@fAggressive int = 0
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @tnTable tinyint,
	@continue int, @retVal int

create table #TempPreds (uidPredicateANDGroupID uniqueidentifier NOT NULL, uidPredicateORGroupID uniqueidentifier NOT NULL )

--lets check the inactive table and make sure there is nothing there. If we crash while running, we might not have
--completed handling this table
SELECT TOP 1 @tnTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 2 OPTION (KEEPFIXED PLAN)

--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
exec  @retVal = sp_getapplock 'SubscriptionRefCountLog', 'Exclusive', 'Session'

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	RAISERROR('Unable to acquire applock on SubscriptionRefCountLog', 16, 1)
	return
END

--let flip tables
if (@tnTable = 1)
BEGIN
	UPDATE ActiveRefCountLog SET tnActiveTable = 2 WHERE fType = 2 OPTION (KEEPFIXED PLAN)
END
else
BEGIN
	UPDATE ActiveRefCountLog SET tnActiveTable = 1 WHERE fType = 2 OPTION (KEEPFIXED PLAN)
END

exec sp_releaseapplock 'SubscriptionRefCountLog', 'Session'

set @continue = 1

if (@fAggressive = 0)
BEGIN
	WHILE (@continue = 1)
	BEGIN

		TRUNCATE TABLE #TempPreds
		
		
		if (@tnTable = 1)
		BEGIN
			INSERT INTO #TempPreds
			SELECT TOP 50 uidPredicateANDGroupID, uidPredicateORGroupID
			FROM PredicateGroupZeroSum1 WITH (TABLOCK)
		END
		else
		BEGIN
			INSERT INTO #TempPreds
			SELECT TOP 50 uidPredicateANDGroupID, uidPredicateORGroupID
			FROM PredicateGroupZeroSum2 WITH (TABLOCK)

		END
		
		if (@@ROWCOUNT < 50)
			set @continue = 0
			
		DELETE FROM EqualsPredicates WITH (ROWLOCK)
		FROM EqualsPredicates as ep WITH (ROWLOCK INDEX(IX_EqualsPredicates)), #TempPreds pgzs
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		DELETE FROM EqualsPredicates2ndPass WITH (ROWLOCK)
		FROM EqualsPredicates2ndPass as ep WITH (ROWLOCK), #TempPreds pgzs
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
	 
		DELETE FROM GreaterThanPredicates WITH (ROWLOCK)
		FROM GreaterThanPredicates as ep WITH (ROWLOCK), #TempPreds pgzs
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM GreaterThanOrEqualsPredicates WITH (ROWLOCK)
		FROM GreaterThanOrEqualsPredicates as ep WITH (ROWLOCK), #TempPreds pgzs
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		 
		DELETE FROM LessThanPredicates WITH (ROWLOCK)
		FROM LessThanPredicates as ep WITH (ROWLOCK), #TempPreds pgzs
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		DELETE FROM LessThanOrEqualsPredicates WITH (ROWLOCK)
		FROM LessThanOrEqualsPredicates as ep WITH (ROWLOCK), #TempPreds pgzs
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM ExistsPredicates WITH (ROWLOCK)
		FROM ExistsPredicates as ep WITH (ROWLOCK), #TempPreds pgzs
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		 
		DELETE FROM BitwiseANDPredicates WITH (ROWLOCK)
		FROM BitwiseANDPredicates as ep WITH (ROWLOCK), #TempPreds pgzs
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM PredicateGroup WITH (ROWLOCK)
		FROM PredicateGroup as pg WITH (ROWLOCK), #TempPreds pgzs
		WHERE pg.uidPredicateANDGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		if (@tnTable = 1)
		BEGIN
			DELETE FROM PredicateGroupZeroSum1 WITH (TABLOCK)
			FROM PredicateGroupZeroSum1 p WITH (TABLOCK), #TempPreds pgzs
			WHERE p.uidPredicateANDGroupID = pgzs.uidPredicateANDGroupID
			OPTION(KEEPFIXED PLAN) 
		END
		else
		BEGIN
			DELETE FROM PredicateGroupZeroSum2 WITH (TABLOCK)
			FROM PredicateGroupZeroSum2 p WITH (TABLOCK), #TempPreds pgzs
			WHERE p.uidPredicateANDGroupID = pgzs.uidPredicateANDGroupID
			OPTION(KEEPFIXED PLAN) 
		END
	END
END
ELSE
BEGIN

	if (@tnTable = 1)
	BEGIN
		DELETE FROM EqualsPredicates WITH (TABLOCK)
		FROM EqualsPredicates as ep WITH (TABLOCK INDEX(IX_EqualsPredicates)), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		DELETE FROM EqualsPredicates2ndPass WITH (TABLOCK)
		FROM EqualsPredicates2ndPass as ep WITH (TABLOCK), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		DELETE FROM GreaterThanPredicates WITH (TABLOCK)
		FROM GreaterThanPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM GreaterThanOrEqualsPredicates WITH (TABLOCK)
		FROM GreaterThanOrEqualsPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
			
		DELETE FROM LessThanPredicates WITH (TABLOCK)
		FROM LessThanPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		DELETE FROM LessThanOrEqualsPredicates WITH (TABLOCK)
		FROM LessThanOrEqualsPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM ExistsPredicates WITH (TABLOCK)
		FROM ExistsPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
			
		DELETE FROM BitwiseANDPredicates WITH (TABLOCK)
		FROM BitwiseANDPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM PredicateGroup WITH (TABLOCK)
		FROM PredicateGroup as pg WITH (TABLOCK), PredicateGroupZeroSum1 pgzs WITH (TABLOCK)
		WHERE pg.uidPredicateANDGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		TRUNCATE TABLE PredicateGroupZeroSum1 
	END
	ELSE
	BEGIN
		DELETE FROM EqualsPredicates WITH (TABLOCK)
		FROM EqualsPredicates as ep WITH (TABLOCK INDEX(IX_EqualsPredicates)), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		DELETE FROM EqualsPredicates2ndPass WITH (TABLOCK)
		FROM EqualsPredicates2ndPass as ep WITH (TABLOCK), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		DELETE FROM GreaterThanPredicates WITH (TABLOCK)
		FROM GreaterThanPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM GreaterThanOrEqualsPredicates WITH (TABLOCK)
		FROM GreaterThanOrEqualsPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
			
		DELETE FROM LessThanPredicates WITH (TABLOCK)
		FROM LessThanPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		DELETE FROM LessThanOrEqualsPredicates WITH (TABLOCK)
		FROM LessThanOrEqualsPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM ExistsPredicates WITH (TABLOCK)
		FROM ExistsPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
			
		DELETE FROM BitwiseANDPredicates WITH (TABLOCK)
		FROM BitwiseANDPredicates as ep WITH (TABLOCK), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE ep.uidPredicateGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 

		DELETE FROM PredicateGroup WITH (TABLOCK)
		FROM PredicateGroup as pg WITH (TABLOCK), PredicateGroupZeroSum2 pgzs WITH (TABLOCK)
		WHERE pg.uidPredicateANDGroupID = pgzs.uidPredicateANDGroupID
		OPTION(KEEPFIXED PLAN) 
		
		TRUNCATE TABLE PredicateGroupZeroSum2
	END
END

GO

/***************************************************
* This is my GC for messages. Its job is to keep the Spool and MessageParts tables clean. The parts and fragments tables are
* handled by a parts GC. The algorithm is simple. There is a refcount log into which various stored procedures write when they
* are figuratively addreffing or releasing a message. I have two such tables to avoid lock contention between my GC and normal
* runtime processing. By wrapping the table in a view I can flip flop which table runtime is writing to so that I can alternately
* clean the table. The algorithm will work so that when it starts, it determines what is the active table. It will then attempt to
* clean the currently deactive refcount table just in case we crashed before. This cleaning process will involve summing the 
* snRefCount column in the table grouping by messageid and joining that with the RefCountTotals table to get an active refcount
* for the message. We then insert any message whose sum is 0 into the zero sum table. Then we update all stats in the CountTotals
* table and then insert all the new totals and then truncate the RefCount table. After this, we will flip the active table and 
* update the view and then go through this process for the other RefCount table. Now we check the zero sum table and when it is 
* above a certain threshold, we will go ahead and purge
***************************************************/

CREATE PROCEDURE [dbo].[int_PurgeMessageRefCountLog]
@tnTable tinyint,
@nMessagesFound int OUTPUT
AS

declare @continue int
create table #Totals (uidMessageID uniqueidentifier NOT NULL,
		      snRefCount int NOT NULL,
		      fInTotals  smallint NULL )
					  
create clustered index [CIX_Totals] on [#Totals] ([fInTotals], [uidMessageID])

if (@tnTable = 1)
BEGIN
	INSERT INTO #Totals
	SELECT t1.uidMessageID, (t1.snRefCount + ISNULL(rct.snRefCount, 0)) as snRefCount, 
		CASE WHEN (rct.snRefCount) IS NULL THEN 0 ELSE 1 END AS fInTotals
	FROM (
		SELECT uidMessageID, SUM(snRefCount) as snRefCount
		FROM MessageRefCountLog1 WITH (TABLOCKX)
		GROUP BY uidMessageID
	) as t1
	LEFT JOIN MessageRefCountLogTotals rct WITH (TABLOCK) ON t1.uidMessageID = rct.uidMessageID
	OPTION (KEEPFIXED PLAN)
END
else
BEGIN
	INSERT INTO #Totals
	SELECT t1.uidMessageID, (t1.snRefCount + ISNULL(rct.snRefCount, 0)) as snRefCount, 
		CASE WHEN (rct.snRefCount) IS NULL THEN 0 ELSE 1 END AS fInTotals
	FROM (
		SELECT uidMessageID, SUM(snRefCount) as snRefCount
		FROM MessageRefCountLog2 WITH (TABLOCKX)
		GROUP BY uidMessageID
	) as t1
	LEFT JOIN MessageRefCountLogTotals rct WITH (TABLOCK) ON t1.uidMessageID = rct.uidMessageID
	OPTION (KEEPFIXED PLAN)
END
BEGIN TRANSACTION
	
	UPDATE MessageRefCountLogTotals WITH (TABLOCK)
	SET snRefCount = t.snRefCount, tnLastTable = @tnTable
	FROM MessageRefCountLogTotals rct, #Totals t
	WHERE rct.uidMessageID = t.uidMessageID and t.fInTotals = 1
	
	INSERT INTO MessageRefCountLogTotals WITH (TABLOCK)
	SELECT t.uidMessageID, t.snRefCount, @tnTable
	FROM #Totals t WHERE fInTotals = 0

	UPDATE TruncateRefCountLog SET fTruncate = 1 WHERE fType = 1
COMMIT TRANSACTION
BEGIN TRANSACTION
	if (@tnTable = 1)
	BEGIN
		INSERT INTO MessageZeroSum
		SELECT uidMessageID
		FROM MessageRefCountLogTotals WITH (TABLOCK) WHERE snRefCount = 0 AND tnLastTable = 2
		DELETE FROM MessageRefCountLogTotals WITH (TABLOCK)
		WHERE snRefCount = 0 AND tnLastTable = 2
	END
	else
	BEGIN
		INSERT INTO MessageZeroSum
		SELECT uidMessageID
		FROM MessageRefCountLogTotals WITH (TABLOCK) WHERE snRefCount = 0 AND tnLastTable = 1
		DELETE FROM MessageRefCountLogTotals WITH (TABLOCK)
		WHERE snRefCount = 0 AND tnLastTable = 1
	END
	
COMMIT TRANSACTION
if (@tnTable = 1)
	TRUNCATE TABLE MessageRefCountLog1
else
	TRUNCATE TABLE MessageRefCountLog2

DROP TABLE #Totals
GO



CREATE PROCEDURE [dbo].[int_PurgeMessageZeroSumTable]
AS

declare  @count int, @tmp int, @fUseTempTable bit,
	 @fContinue int,
	 @tnActiveTable tinyint,
	 @retVal int


--we only use this table if we don't find 100 ids to delete
create table #PurgeJobMsgIDs (nID int NOT NULL, uidMessageID uniqueidentifier NOT NULL)	  
create clustered index [CIX_PurgeJobMsgIDs] on [#PurgeJobMsgIDs] ([uidMessageID])

--we switch to 99 instead of 100 because we want to eliminate the extra loop through the parts which does
--nothing but apparently sql uses the number 100 as a magic number and TOP 101 can be more expensive and so 
--we want to use 99,100 instead of 100,101
set @fContinue = 99

while (@fContinue >= 99)
BEGIN	
	set @fUseTempTable = 0

	DELETE FROM Spool WITH (ROWLOCK)
	FROM ( SELECT TOP 99 msz.uidMessageID FROM MessageZeroSum msz WITH (ROWLOCK) ORDER BY nID ASC) as msz
	INNER LOOP JOIN Spool s WITH (ROWLOCK) ON msz.uidMessageID = s.uidMessageID
	OPTION (KEEPFIXED PLAN)
	
	if (@@ROWCOUNT < 99)
	BEGIN
		TRUNCATE TABLE #PurgeJobMsgIDs

		INSERT INTO #PurgeJobMsgIDs (nID, uidMessageID)
		SELECT TOP 99 msz.nID, msz.uidMessageID FROM MessageZeroSum msz WITH (ROWLOCK) ORDER BY nID ASC

		set @fUseTempTable = 1
	END
 
	set @count = 100
	WHILE (@count >= 100)
	BEGIN
		--writing to the partrefcountlog and deleting from the MessageParts tables need to be transactional
		BEGIN TRANSACTION

		--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
		--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
		exec  @retVal = sp_getapplock 'PartRefCountLog', 'Shared', 'Session'
		IF (@retVal < 0 ) -- Lock Not granted
		BEGIN
			RAISERROR('Unable to acquire applock on PartRefCountLog', 16, 1)
			return
		END
		
		SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 0 OPTION (KEEPFIXED PLAN)
		
		if (@fUseTempTable = 0)
		BEGIN
			if (@tnActiveTable = 1)
			BEGIN
				INSERT INTO PartRefCountLog1 WITH (ROWLOCK) (uidPartID, uidMessageID , snRefCount)
				SELECT TOP 100  mp.uidPartID, mp.uidMessageID, -1 FROM
				( SELECT TOP 99 msz.nID, msz.uidMessageID FROM MessageZeroSum msz WITH (ROWLOCK) ORDER BY nID ASC) as t 
				INNER LOOP JOIN MessageParts mp WITH (ROWLOCK) ON mp.uidMessageID = t.uidMessageID
				ORDER BY t.nID, mp.uidPartID
				OPTION(KEEPFIXED PLAN) 
			END
			ELSE
			BEGIN
				INSERT INTO PartRefCountLog2 WITH (ROWLOCK) (uidPartID, uidMessageID , snRefCount)
				SELECT TOP 100  mp.uidPartID, mp.uidMessageID, -1 FROM
				( SELECT TOP 99 msz.nID, msz.uidMessageID FROM MessageZeroSum msz WITH (ROWLOCK) ORDER BY nID ASC) as t 
				INNER LOOP JOIN MessageParts mp WITH (ROWLOCK) ON mp.uidMessageID = t.uidMessageID
				ORDER BY t.nID, mp.uidPartID
				OPTION(KEEPFIXED PLAN) 
			END
		END
		ELSE
		BEGIN
			if (@tnActiveTable = 1)
			BEGIN
				INSERT INTO PartRefCountLog1 WITH (ROWLOCK) (uidPartID, uidMessageID , snRefCount)
				SELECT TOP 100  mp.uidPartID, mp.uidMessageID, -1 FROM
				#PurgeJobMsgIDs as t 
				INNER LOOP JOIN MessageParts mp WITH (ROWLOCK) ON mp.uidMessageID = t.uidMessageID
				ORDER BY t.nID, mp.uidPartID
				OPTION(KEEPFIXED PLAN) 
			END
			ELSE
			BEGIN
				INSERT INTO PartRefCountLog2 WITH (ROWLOCK) (uidPartID, uidMessageID , snRefCount)
				SELECT TOP 100  mp.uidPartID, mp.uidMessageID, -1 FROM
				#PurgeJobMsgIDs as t 
				INNER LOOP JOIN MessageParts mp WITH (ROWLOCK) ON mp.uidMessageID = t.uidMessageID
				ORDER BY t.nID, mp.uidPartID
				OPTION(KEEPFIXED PLAN) 
			END
		END
		
		exec sp_releaseapplock 'PartRefCountLog', 'Session'
		
		if (@fUseTempTable = 0)
		BEGIN
			DELETE FROM MessageParts WITH (ROWLOCK)
			FROM 
			( 	SELECT TOP 100 mp.uidMessageID, mp.uidPartID FROM
				( SELECT TOP 99 msz.nID, msz.uidMessageID FROM MessageZeroSum msz WITH (ROWLOCK) ORDER BY nID ASC) as t 
				INNER LOOP JOIN MessageParts mp WITH (ROWLOCK) ON mp.uidMessageID = t.uidMessageID
				ORDER BY t.nID, mp.uidPartID
			) as t2
			INNER LOOP JOIN MessageParts mp ON mp.uidMessageID = t2.uidMessageID AND mp.uidPartID = t2.uidPartID
			OPTION (KEEPFIXED PLAN)	
		END
		else
		BEGIN
			DELETE FROM MessageParts WITH (ROWLOCK)
			FROM 
			( 	SELECT TOP 100 mp.uidMessageID, mp.uidPartID FROM
				#PurgeJobMsgIDs as t 
				INNER LOOP JOIN MessageParts mp WITH (ROWLOCK) ON mp.uidMessageID = t.uidMessageID
				ORDER BY t.nID, mp.uidPartID
			) as t2
			INNER LOOP JOIN MessageParts mp ON mp.uidMessageID = t2.uidMessageID AND mp.uidPartID = t2.uidPartID
			OPTION (KEEPFIXED PLAN)	
		END
		

		set @count = @@ROWCOUNT

		COMMIT TRANSACTION
	END


	if (@fUseTempTable = 0)
	BEGIN
		DELETE FROM MessageZeroSum WITH (ROWLOCK)
		FROM ( SELECT TOP 99 msz.nID FROM MessageZeroSum msz WITH (ROWLOCK) ORDER BY nID ASC) as msz
		INNER LOOP JOIN MessageZeroSum m WITH (ROWLOCK) ON msz.nID = m.nID
		OPTION (KEEPFIXED PLAN)		  
	END
	else
	BEGIN
		--delete from the spool again in case a new message slipped in
		DELETE FROM Spool WITH (ROWLOCK)
		FROM #PurgeJobMsgIDs as msz 
		INNER LOOP JOIN Spool s WITH (ROWLOCK) ON msz.uidMessageID = s.uidMessageID
		OPTION (KEEPFIXED PLAN)
			
		DELETE FROM MessageZeroSum WITH (ROWLOCK)
		FROM #PurgeJobMsgIDs as msz 
		INNER LOOP JOIN MessageZeroSum m WITH (ROWLOCK) ON msz.nID = m.nID
		OPTION (KEEPFIXED PLAN)		  
	END

	set @fContinue = @@ROWCOUNT
END

DROP TABLE #PurgeJobMsgIDs
GO

CREATE PROCEDURE [dbo].[int_IsAgentJobRunning]
@jobName sysname
AS
	
--this sproc will tell you if the job is running. If the job does not exist, we will simply tell you that it is not running
--we will let you get an error if you actually try to start the job later.

DECLARE @jobId uniqueidentifier
	,@ReturnCode BIT

IF OBJECT_ID('tempdb..#xp_results') IS NOT NULL
	 DROP TABLE #xp_results

CREATE TABLE #xp_results (
			job_id                UNIQUEIDENTIFIER NOT NULL,
			last_run_date         INT              NOT NULL,
			last_run_time         INT              NOT NULL,
			next_run_date         INT              NOT NULL,
			next_run_time         INT              NOT NULL,
			next_run_schedule_id  INT              NOT NULL,
			requested_to_run      INT              NOT NULL, -- BOOL
			request_source        INT              NOT NULL,
			request_source_id     sysname          COLLATE database_default NULL,
			running               INT              NOT NULL, -- BOOL
			current_step          INT              NOT NULL,
			current_retry_attempt INT              NOT NULL,
			job_state             INT              NOT NULL	)

set @ReturnCode = 0	
If @jobName IS NOT NULL 
BEGIN
	select TOP 1 @jobId=job_id from msdb.dbo.sysjobs where name = @jobName
	if ( (@@ROWCOUNT = 1) AND (@jobId IS NOT NULL) )
	BEGIN
		
		--job_owner parameter is ignored if the first param is 1. Only care about job_id
		INSERT INTO #xp_results
		EXECUTE master.dbo.xp_sqlagent_enum_jobs @is_sysadmin=1, @job_owner='sa' , @job_id = @jobId

		--SELECT * FROM #xp_results
		--states 4 and 5 are the idle states. Everything else is considered still executing
		IF NOT EXISTS (SELECT 1 FROM #xp_results WHERE job_state in (4,5))
		BEGIN
			set @ReturnCode = 1
		END
	END
END

DROP TABLE #xp_results

return @ReturnCode
GO

CREATE PROCEDURE [dbo].[bts_ManageMessageRefCountLog]
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low
set xact_abort on

declare @continue int,
		@tnActiveTable tinyint,
		@fTruncate tinyint,
		@cnt int,
		@nMessagesFound int, @retVal int,
		@fPurgeJobIsRunning int,
		@nJobNotStartedLoopCount int
		
exec  sp_getapplock 'ManageMessageRefCountLogJobIsRunning', 'Exclusive', 'Session'

--clean this flag out on restart just in case we crashed at the wrong moment
DELETE FROM ActiveRefCountLog WHERE fType = 7

set @nJobNotStartedLoopCount = 0

WHILE (1 = 1)
BEGIN
	set @continue = 1
	set @nMessagesFound = 0
	set @fPurgeJobIsRunning = 0


	--lets check the inactive table and make sure there is nothing there. If we crash while running, we might not have
	--completed handling this table
	SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 1 OPTION (KEEPFIXED PLAN)
	SELECT TOP 1 @fTruncate = fTruncate FROM TruncateRefCountLog WITH (ROWLOCK) WHERE fType = 1 OPTION (KEEPFIXED PLAN)

	if (@fTruncate = 0)
	BEGIN
		if (@tnActiveTable = 1)
			exec int_PurgeMessageRefCountLog 2, @nMessagesFound OUTPUT
		else
			exec int_PurgeMessageRefCountLog 1, @nMessagesFound OUTPUT
	END
	ELSE
	BEGIN
		if (@tnActiveTable = 1)
			TRUNCATE TABLE MessageRefCountLog2
		else
			TRUNCATE TABLE MessageRefCountLog1
	END

	--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
	--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
	exec  @retVal = sp_getapplock 'MessageRefCountLog', 'Exclusive', 'Session'

	IF (@retVal < 0 ) -- Lock Not granted
	BEGIN
		RAISERROR('Unable to acquire applock on MessageRefCountLog', 16, 1)
		return
	END


	--let flip tables
	BEGIN TRANSACTION

	if (@tnActiveTable = 1)
	BEGIN
		UPDATE ActiveRefCountLog SET tnActiveTable = 2 WHERE fType = 1 OPTION (KEEPFIXED PLAN)
		UPDATE TruncateRefCountLog SET fTruncate = 0 WHERE fType = 1
		END
	else
	BEGIN
		UPDATE ActiveRefCountLog SET tnActiveTable = 1 WHERE fType = 1 OPTION (KEEPFIXED PLAN)
		UPDATE TruncateRefCountLog SET fTruncate = 0 WHERE fType = 1
	END

	COMMIT TRANSACTION

	exec sp_releaseapplock 'MessageRefCountLog', 'Session'

	--now lets process this table
	exec int_PurgeMessageRefCountLog @tnActiveTable, @nMessagesFound OUTPUT

	declare @nvcJobName nvarchar(256)
	set @nvcJobName = N'MessageBox_Message_Cleanup_' + db_name()
	
	--in some races it is possible that we will have requested the job start but it hasnt yet so
	--we need to check if this is the case
	if not exists (SELECT TOP 1 1 FROM ActiveRefCountLog WHERE fType = 7)
	BEGIN
		exec @fPurgeJobIsRunning = int_IsAgentJobRunning @nvcJobName
		IF (@fPurgeJobIsRunning = 0)
		BEGIN
			INSERT INTO ActiveRefCountLog (tnActiveTable, fType) VALUES (1, 7)
			set @nJobNotStartedLoopCount = 0
			exec msdb.dbo.sp_start_job @job_name = @nvcJobName
		END
	END
	ELSE
	BEGIN
		set @nJobNotStartedLoopCount = @nJobNotStartedLoopCount + 1
		IF (@nJobNotStartedLoopCount > 6) --if the job hasn't started in one minute then something is off so lets just try it ... we might fail but I dont have much choice
		BEGIN
			set @nJobNotStartedLoopCount = 0
			exec msdb.dbo.sp_start_job @job_name = @nvcJobName
		END
	END

	WAITFOR DELAY '0:00:10' --delay 10 seconds
END

exec  sp_releaseapplock 'ManageMessageRefCountLogJobIsRunning', 'Session'
GO

CREATE PROCEDURE [dbo].[bts_PurgeMessages]
AS

DELETE FROM ActiveRefCountLog WHERE fType = 7
--I am going to leave this lock to make sure this cannot run in parallel if someone tries to run this manually
exec  sp_getapplock 'PurgeJobIsRunning', 'Exclusive', 'Session'
		
exec int_PurgeMessageZeroSumTable

exec sp_releaseapplock 'PurgeJobIsRunning', 'Session'
GO


CREATE PROCEDURE [dbo].[int_PurgePartRefCountLog]
@tnTable tinyint,
@nPartsFound int OUTPUT
AS

declare @continue int

create table #Totals (uidPartID uniqueidentifier NOT NULL,
		      snRefCount smallint NOT NULL,
		      fInTotals  smallint NULL )
					  
create clustered index [CIX_Totals] on [#Totals] ([snRefCount], [uidPartID])

if (@tnTable = 1)
BEGIN

	INSERT INTO #Totals
	SELECT t1.uidPartID, (t1.snRefCount + ISNULL(rct.snRefCount, 0)) as snRefCount, rct.snRefCount as refCount
	FROM (
		SELECT uidPartID, SUM(snRefCount) as snRefCount
		FROM PartRefCountLog1 WITH (TABLOCKX)
		GROUP BY uidPartID
	) as t1
	LEFT JOIN PartRefCountLogTotals rct WITH (TABLOCK) ON t1.uidPartID = rct.uidPartID
	OPTION (KEEPFIXED PLAN)
END
else
BEGIN

	INSERT INTO #Totals
	SELECT t1.uidPartID, (t1.snRefCount + ISNULL(rct.snRefCount, 0)) as snRefCount, rct.snRefCount as refCount
	FROM (
		SELECT uidPartID, SUM(snRefCount) as snRefCount
		FROM PartRefCountLog2 WITH (TABLOCKX)
		GROUP BY uidPartID
	) as t1
	LEFT JOIN PartRefCountLogTotals rct WITH (TABLOCK) ON t1.uidPartID = rct.uidPartID
	OPTION (KEEPFIXED PLAN)
END

-- Any message whose count is 0 goes in ZeroSum. Others go back in the Totals table

INSERT INTO PartZeroSum WITH (TABLOCK)
SELECT uidPartID
FROM #Totals WHERE snRefCount = 0


--This needs to be transactional
BEGIN TRANSACTION

	DELETE FROM PartRefCountLogTotals WITH (TABLOCK)
	FROM PartRefCountLogTotals p WITH (TABLOCK), #Totals t
	WHERE t.snRefCount = 0 AND t.fInTotals IS NOT NULL AND t.uidPartID = p.uidPartID
	
	UPDATE PartRefCountLogTotals WITH (TABLOCK)
	SET snRefCount = t.snRefCount
	FROM PartRefCountLogTotals rct, #Totals t
	WHERE t.snRefCount != 0 AND rct.uidPartID = t.uidPartID and t.fInTotals IS NOT NULL
	
	INSERT INTO PartRefCountLogTotals WITH (TABLOCK)
	SELECT t.uidPartID, t.snRefCount
	FROM #Totals t WHERE snRefCount != 0 AND fInTotals IS NULL

	--I should probably just update some flag here and then truncate the table as this would be much faster than
	--deleting all these rows. I just need it to be transactional
	UPDATE TruncateRefCountLog SET fTruncate = 1 WHERE fType = 0

COMMIT TRANSACTION

if (@tnTable = 1)
	TRUNCATE TABLE PartRefCountLog1
else
	TRUNCATE TABLE PartRefCountLog2
GO

CREATE PROCEDURE [dbo].[int_PurgePartZeroSumTable]
@fAgressive int
AS

declare @count int, @tmp int
set @count = 100


create table #PurgePartIds (uidPartID uniqueidentifier NOT NULL, nID bigint NOT NULL)					  
create clustered index [CIX_PurgePartIds] on [#PurgePartIds] ([uidPartID])

while (@count >= 100)
BEGIN
	DELETE FROM Parts WITH (ROWLOCK)
	FROM (SELECT TOP 100 uidPartID FROM PartZeroSum WITH (ROWLOCK) ORDER BY nID) as psz
	JOIN Parts p WITH (ROWLOCK) ON psz.uidPartID = p.uidPartID
	OPTION (KEEPFIXED PLAN, FORCE ORDER)

	if (@@ROWCOUNT >= 100)
	BEGIN
		--we have enough data so that the TOP 100 will always return the same set
		IF EXISTS (SELECT TOP 1 f.uidPartID 
			     FROM (SELECT TOP 100 uidPartID FROM PartZeroSum WITH (ROWLOCK) ORDER BY nID) as psz, Fragments f WITH (ROWLOCK)
			     WHERE psz.uidPartID = f.uidPartID
			    )
		BEGIN
			DELETE FROM Fragments WITH (ROWLOCK)
			FROM (SELECT TOP 100 uidPartID FROM PartZeroSum WITH (ROWLOCK) ORDER BY nID) as psz, Fragments f WITH (ROWLOCK)
			WHERE psz.uidPartID = f.uidPartID
			OPTION (KEEPFIXED PLAN)
		END
		
					
		DELETE FROM PartZeroSum WITH (ROWLOCK)
		FROM (SELECT TOP 100 nID FROM PartZeroSum WITH (ROWLOCK) ORDER BY nID) as psz, PartZeroSum p WITH (ROWLOCK)
		WHERE psz.nID = p.nID
		OPTION (KEEPFIXED PLAN)

		set @count = @@ROWCOUNT				  
	END
	ELSE
	BEGIN
		--we dont have 100 rows to delete so we need a temp table to avoid getting different results for our top 100
		TRUNCATE TABLE 	#PurgePartIds 

		INSERT INTO #PurgePartIds (uidPartID, nID)
		SELECT TOP 100 uidPartID, nID FROM PartZeroSum WITH (ROWLOCK) ORDER BY nID

		IF EXISTS (SELECT TOP 1 f.uidPartID 
			     FROM #PurgePartIds as psz, Fragments f WITH (ROWLOCK)
			     WHERE psz.uidPartID = f.uidPartID
			    )
		BEGIN
			DELETE FROM Fragments WITH (ROWLOCK)
			FROM #PurgePartIds as psz, Fragments f WITH (ROWLOCK)
			WHERE psz.uidPartID = f.uidPartID
			OPTION (KEEPFIXED PLAN)
		END
		
		DELETE FROM Parts WITH (ROWLOCK)
		FROM #PurgePartIds as psz, Parts p WITH (ROWLOCK)
		WHERE psz.uidPartID = p.uidPartID
		OPTION (KEEPFIXED PLAN)
						
		DELETE FROM PartZeroSum WITH (ROWLOCK)
		FROM #PurgePartIds as psz, PartZeroSum p WITH (ROWLOCK)
		WHERE psz.nID = p.nID
		OPTION (KEEPFIXED PLAN)

		set @count = @@ROWCOUNT			
	END
END

DROP TABLE #PurgePartIds 
GO

CREATE PROCEDURE [dbo].[bts_PurgeParts]
@fAggressive int = 0
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @continue int,
		@tnActiveTable tinyint,
		@fTruncate tinyint,
		@cnt int,
		@nPartsFound int, @retVal int
		
set @continue = 1
set @nPartsFound = 0

--lets check the inactive table and make sure there is nothing there. If we crash while running, we might not have
--completed handling this table
SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 0 OPTION (KEEPFIXED PLAN)
SELECT TOP 1 @fTruncate = fTruncate FROM TruncateRefCountLog WITH (ROWLOCK) WHERE fType = 0 OPTION (KEEPFIXED PLAN)

if (@fTruncate = 0)
BEGIN
	if (@tnActiveTable = 1)
		exec int_PurgePartRefCountLog 2, @nPartsFound OUTPUT
	else
		exec int_PurgePartRefCountLog 1, @nPartsFound OUTPUT
END
ELSE
BEGIN
	if (@tnActiveTable = 1)
		TRUNCATE TABLE PartRefCountLog2
	else
		TRUNCATE TABLE PartRefCountLog1
END

--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
exec  @retVal = sp_getapplock 'PartRefCountLog', 'Exclusive', 'Session'

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	RAISERROR('Unable to acquire applock on PartRefCountLog', 16, 1)
	return
END


--let flip tables
BEGIN TRANSACTION

if (@tnActiveTable = 1)
BEGIN
	UPDATE ActiveRefCountLog SET tnActiveTable = 2 WHERE fType = 0 OPTION (KEEPFIXED PLAN)
	UPDATE TruncateRefCountLog SET fTruncate = 0 WHERE fType = 0
END
else
BEGIN
	UPDATE ActiveRefCountLog SET tnActiveTable = 1 WHERE fType = 0 OPTION (KEEPFIXED PLAN)
	UPDATE TruncateRefCountLog SET fTruncate = 0 WHERE fType = 0
END

COMMIT TRANSACTION

exec sp_releaseapplock 'PartRefCountLog', 'Session'

--now lets process this table
exec int_PurgePartRefCountLog @tnActiveTable, @nPartsFound OUTPUT

exec int_PurgePartZeroSumTable @fAggressive
	
GO

CREATE PROCEDURE [dbo].[bts_CopyTrackedMessagesToDTA]
@dtaDbServer sysname,
@dtaDbName sysname
AS
set transaction isolation level read committed
set nocount on
set deadlock_priority low
declare @count int, @nTotalNumParts int, @fAppLockTaken bit,
	@uidMessageID uniqueidentifier,
	@tnActiveTable tinyint,
	@tnActiveTrackingSpool tinyint, @retVal int
		
CREATE TABLE #TrkMsgRefIDs (uidMessageID uniqueidentifier NOT NULL)
CREATE CLUSTERED INDEX [CIX_TrkMsgRefIDs] ON [#TrkMsgRefIDs](uidMessageID)

CREATE TABLE #TrkMsgNewPartIDs (uidMessageID uniqueidentifier NOT NULL, uidOldPartID uniqueidentifier NOT NULL, nvcPartName nvarchar(256) NOT NULL, uidNewPartID uniqueidentifier NOT NULL DEFAULT NewID() )
CREATE CLUSTERED INDEX [CIX_TrkMsgNewPartIDs] ON [#TrkMsgNewPartIDs](uidMessageID, uidOldPartID)


declare @localized_string_CopyTrackedMessages_Invalid_Params nvarchar(128)
set @localized_string_CopyTrackedMessages_Invalid_Params = N'Non null values must be provided for the tracking server and database names.'


if ( (@dtaDbServer IS NULL) OR (@dtaDbName IS NULL) )
BEGIN
	RAISERROR(@localized_string_CopyTrackedMessages_Invalid_Params, 16, 1)
	return
END

set @uidMessageID = NULL
SELECT TOP 1 @uidMessageID = uidMessageID FROM TrackingMessageReferences WITH (ROWLOCK) OPTION (KEEPFIXED PLAN)
while (@uidMessageID IS NOT NULL)
BEGIN

	set @fAppLockTaken = 0
	--let's see how many messages there are to track. If there are less than 50, we need to lock the references table to 
	--make sure that no more come in while we are processing. If they did, we would only partially track messages and could
	--delete a reference to a message which was meant to be tracked even though we did not track it.
	SELECT TOP 50 @count = COUNT(*) FROM TrackingMessageReferences WITH (ROWLOCK)
	if (@count < 50)
	BEGIN
		exec  @retVal = sp_getapplock 'TrkMsgRefs', 'Exclusive', 'Session'
		IF (@retVal < 0 ) -- Lock Not granted
		BEGIN
			RAISERROR('Unable to acquire applock on TrackingMessageReferences', 16, 1)
			return
		END
		set @fAppLockTaken = 1
	END
	
	SELECT @nTotalNumParts = SUM(q.nNumParts)
	FROM 
	(   
            SELECT TOP 50 s.nNumParts, 1 as idx
			FROM (SELECT TOP 50 uidMessageID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC) as t
            JOIN  Spool s WITH(ROWLOCK INDEX(IX_Spool))   ON s.uidMessageID = t.uidMessageID
	) as q
 	GROUP BY q.idx

	TRUNCATE TABLE #TrkMsgNewPartIDs
	if (@nTotalNumParts > 300)
	BEGIN
		INSERT INTO #TrkMsgNewPartIDs (uidMessageID, uidOldPartID, nvcPartName)
		SELECT mp.uidMessageID, mp.uidPartID, mp.nvcPartName
		FROM  (SELECT TOP 50 uidMessageID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC) as t
		JOIN MessageParts mp ON t.uidMessageID = mp.uidMessageID
	END
	ELSE
	BEGIN
		INSERT INTO #TrkMsgNewPartIDs (uidMessageID, uidOldPartID, nvcPartName)
		SELECT TOP 300 mp.uidMessageID, mp.uidPartID, mp.nvcPartName
		FROM  (SELECT TOP 50 uidMessageID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC) as t
		JOIN MessageParts mp ON t.uidMessageID = mp.uidMessageID
	END

	exec ('INSERT INTO [' + @dtaDbServer + '].[' + @dtaDbName + '].[dbo].[Tracking_Parts1](uidMessageID, nvcPartName, uidPartID,  uidOldPartID, nNumFragments, imgPart, imgPropBag)
	SELECT TOP ' + @nTotalNumParts + ' mp.uidMessageID, mp.nvcPartName, mp.uidNewPartID,  mp.uidOldPartID, p.nNumFragments, p.imgPart, p.imgPropBag
	FROM (SELECT TOP 50 uidMessageID, nID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC) as  t
	INNER LOOP JOIN #TrkMsgNewPartIDs mp WITH (ROWLOCK) ON t.uidMessageID = mp.uidMessageID
	INNER LOOP JOIN Parts p WITH (ROWLOCK INDEX(IX_Parts)) ON mp.uidOldPartID = p.uidPartID
	OPTION (KEEPFIXED PLAN)')

	IF @@ERROR <>0
	BEGIN
		if (@fAppLockTaken = 1)
		BEGIN
			exec sp_releaseapplock 'TrkMsgRefs', 'Session'
		END
		RAISERROR ('An error occurred while inserting data in the Tracking_Parts1 table',16,1)
		return
	END

	IF EXISTS (SELECT TOP 1 p.nNumFragments 
		      FROM  (SELECT TOP 50 uidMessageID, nID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC) as  t
				INNER LOOP JOIN MessageParts mp WITH (ROWLOCK INDEX(CIX_MessageParts)) ON t.uidMessageID = mp.uidMessageID
				INNER LOOP JOIN Parts p WITH (ROWLOCK INDEX(IX_Parts)) ON mp.uidPartID = p.uidPartID AND p.nNumFragments > 1)
	BEGIN		
		exec ('INSERT INTO [' + @dtaDbServer + '].[' + @dtaDbName + '].[dbo].[Tracking_Fragments1](uidPartID, nFragmentNumber, nOffsetStart, nOffsetEnd, imgFrag)
		SELECT mp.uidNewPartID, f.nFragmentNumber, f.nOffsetStart, f.nOffsetEnd, f.imgFrag
		FROM  (SELECT TOP 50 uidMessageID, nID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC) as  t
		INNER LOOP JOIN #TrkMsgNewPartIDs mp WITH (ROWLOCK) ON t.uidMessageID = mp.uidMessageID
		INNER LOOP JOIN Fragments f WITH(ROWLOCK INDEX(IX_Fragments)) ON mp.uidOldPartID = f.uidPartID
		OPTION (KEEPFIXED PLAN)')

		IF @@ERROR <>0
		BEGIN
			if (@fAppLockTaken = 1)
			BEGIN
				exec sp_releaseapplock 'TrkMsgRefs', 'Session'
			END
			RAISERROR ('An error occurred while inserting data in the Tracking_Fragments1 table',16,1)
			return
		END
	END

	--copy the spool row last so that its datetime can be used for the whole message
	exec ('INSERT INTO [' + @dtaDbServer + '].[' + @dtaDbName + '].[dbo].[Tracking_Spool1](uidMsgID, UserName, dtTimeStamp, dtExpiration, nNumParts, uidBodyPartID, imgContext)
	SELECT s.uidMessageID, s.UserName, s.dtTimeStamp, s.dtExpiration, s.nNumParts, s.uidBodyPartID, s.imgContext
	FROM (SELECT TOP 50 uidMessageID, nID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC) as t
	INNER LOOP JOIN  Spool s WITH(ROWLOCK INDEX(IX_Spool))
	ON s.uidMessageID = t.uidMessageID
	OPTION (KEEPFIXED PLAN)')
	
	IF @@ERROR <>0
	BEGIN
		if (@fAppLockTaken = 1)
		BEGIN
			exec sp_releaseapplock 'TrkMsgRefs', 'Session'
		END
		RAISERROR ('An error occurred while inserting data in the Spool table',16,1)
		return
	END

	--if we took the applock I don't want to hold it through the transaction managing the refcounts. If we did that, 
	--I might get some wierd deadlock between the refcountlog and trackmessagereferences applocks
	if (@fAppLockTaken = 1)
	BEGIN
		INSERT INTO [#TrkMsgRefIDs]
		SELECT TOP 50 uidMessageID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC
		 
		exec sp_releaseapplock 'TrkMsgRefs', 'Session'
	END
	
    BEGIN TRANSACTION
	--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
	--normal locks would require us to wait for the transaction to complete, but we don't really need to wait that long
	exec  @retVal = sp_getapplock 'MessageRefCountLog', 'Shared', 'Transaction'
	IF (@retVal < 0 ) -- Lock Not granted
	BEGIN
		RAISERROR('Unable to acquire applock on MessageRefCountLog', 16, 1)
		return
	END
	SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 1 OPTION (KEEPFIXED PLAN)
	
	if (@fAppLockTaken = 0)
	BEGIN
		if (@tnActiveTable = 1)
		BEGIN
			INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT TOP 50 uidMessageID, 4, -1 FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC
		END
		else
		BEGIN
			INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT TOP 50 uidMessageID, 4, -1 FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC
			
		END
	END
	else
	BEGIN
		if (@tnActiveTable = 1)
		BEGIN
			INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT uidMessageID, 4, -1 FROM #TrkMsgRefIDs
		END
		else
		BEGIN
			INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT uidMessageID, 4, -1 FROM #TrkMsgRefIDs
		END
	END
	
	exec sp_releaseapplock 'MessageRefCountLog', 'Transaction'
	--Lets remove anything that has already been tracked. Make sure to also remove from trackingmessageref table
	if (@fAppLockTaken = 0)
	BEGIN
		DELETE FROM TrackingMessageReferences
		FROM  (SELECT TOP 50 uidMessageID, nID FROM TrackingMessageReferences WITH (ROWLOCK INDEX(IX_TrackingMessageReferences)) ORDER BY nID ASC) as t
		JOIN TrackingMessageReferences as tmr WITH (ROWLOCK INDEX(CIX_TrackingMessageReferences))
		ON tmr.uidMessageID = t.uidMessageID
		OPTION (KEEPFIXED PLAN)
	END
	ELSE
	BEGIN
		DELETE FROM TrackingMessageReferences
		FROM  #TrkMsgRefIDs t
		JOIN TrackingMessageReferences as tmr WITH (ROWLOCK INDEX(CIX_TrackingMessageReferences))
		ON tmr.uidMessageID = t.uidMessageID
		OPTION (KEEPFIXED PLAN)
	END
	
    COMMIT TRANSACTION
		
	SET @uidMessageID = NULL
	SELECT TOP 1 @uidMessageID = uidMessageID FROM TrackingMessageReferences WITH (ROWLOCK) OPTION (KEEPFIXED PLAN)

	TRUNCATE TABLE #TrkMsgRefIDs 
END

DROP TABLE #TrkMsgRefIDs 
DROP TABLE #TrkMsgNewPartIDs
GO


CREATE PROCEDURE [dbo].[bts_PurgeSpool]

AS
--this is only called by test infrastructure
--I dont support running this job in parallel so the best I can give is to kick the job off instead of synchronously running the sproc
declare @nvcJobName nvarchar(256)
set @nvcJobName = N'TrackedMessages_Copy_' + db_name()
exec msdb.dbo.sp_start_job @job_name = @nvcJobName, @error_flag = 0

WAITFOR DELAY '0:00:05' --delay 5 seconds before returning to try and make sure everything actually gets copied

GO


---Create the Cleanup Dead processes job
BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     

  declare @name sysname
  set @name = N'MessageBox_DeadProcesses_Cleanup_' + db_name()
  
IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
  WHERE (name = @name)       
  IF (@JobID IS NOT NULL)    
  BEGIN  
  -- Check if the job is a multi-server job  
  IF (EXISTS (SELECT  * 
              FROM    msdb.dbo.sysjobservers 
              WHERE   (job_id = @JobID) AND (server_id <> 0))) 
  BEGIN 
    -- There is, so abort the script 
    RAISERROR (N'Unable to import job ''DeadProcesses_Cleanup'' since there is already a multi-server job with this name.', 16, 1) 
    GOTO QuitWithRollback  
  END 
  ELSE 
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = @name 
    SELECT @JobID = NULL
  END 

BEGIN 

  -- Add the job
  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @description = N'This job detects when a host instance has stopped and releases all work locked by that host instance so it can be worked on by another host instance.', @category_name = N'Database Maintenance', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job steps
  declare @dbname sysname
  set @dbname = db_name()
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'Purge', @command = N'exec bts_CleanupDeadProcesses', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job schedules
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'Schedule', @enabled = 1, @freq_type = 4, @active_start_date = 20010910, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the Target Servers
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

END
COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 

GO

---Create the MessageBox Cleanup job for managing refcountlog
BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     

  declare @name sysname
  set @name = N'MessageBox_Message_ManageRefCountLog_' + db_name()
  
IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
  WHERE (name = @name)       
  IF (@JobID IS NOT NULL)    
  BEGIN  
  -- Check if the job is a multi-server job  
  IF (EXISTS (SELECT  * 
              FROM    msdb.dbo.sysjobservers 
              WHERE   (job_id = @JobID) AND (server_id <> 0))) 
  BEGIN 
    -- There is, so abort the script 
    RAISERROR (N'Unable to import job ''MessageBox_Cleanup'' since there is already a multi-server job with this name.', 16, 1) 
    GOTO QuitWithRollback  
  END 
  ELSE 
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = @name 
    SELECT @JobID = NULL
  END 

BEGIN 

  -- Add the job
  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @description = N'This job manages the reference count logs for messages and determines when a message is no longer referenced by any subscriber.', @category_name = N'Database Maintenance', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job steps
  declare @dbname sysname
  set @dbname = db_name()

  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'Purge', @command = N'exec bts_ManageMessageRefCountLog', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
    
  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job schedules
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'Schedule', @enabled = 1, @freq_type = 4, @active_start_date = 20010910, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the Target Servers
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

END
COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 

GO

---Create the MessageBox Cleanup job
BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     

  declare @name sysname
  set @name = N'MessageBox_Message_Cleanup_' + db_name()
  
IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
  WHERE (name = @name)       
  IF (@JobID IS NOT NULL)    
  BEGIN  
  -- Check if the job is a multi-server job  
  IF (EXISTS (SELECT  * 
              FROM    msdb.dbo.sysjobservers 
              WHERE   (job_id = @JobID) AND (server_id <> 0))) 
  BEGIN 
    -- There is, so abort the script 
    RAISERROR (N'Unable to import job ''MessageBox_Cleanup'' since there is already a multi-server job with this name.', 16, 1) 
    GOTO QuitWithRollback  
  END 
  ELSE 
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = @name 
    SELECT @JobID = NULL
  END 

BEGIN 

  -- Add the job
  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @description = N'This job removes all messages that are no longer being referenced by any subscribers in the BizTalk MessageBox database tables. This is an unscheduled job and is automatically started by the ManageRefCountLog job.', @category_name = N'Database Maintenance', @enabled = 0, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job steps
  declare @dbname sysname
  set @dbname = db_name()
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'Purge', @command = N'exec bts_PurgeMessages', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the Target Servers
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

END
COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 

GO

---Create the MessageBox Cleanup job
BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     

  declare @name sysname
  set @name = N'MessageBox_Parts_Cleanup_' + db_name()
  
IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
  WHERE (name = @name)       
  IF (@JobID IS NOT NULL)    
  BEGIN  
  -- Check if the job is a multi-server job  
  IF (EXISTS (SELECT  * 
              FROM    msdb.dbo.sysjobservers 
              WHERE   (job_id = @JobID) AND (server_id <> 0))) 
  BEGIN 
    -- There is, so abort the script 
    RAISERROR (N'Unable to import job ''MessageBox_Parts_Cleanup'' since there is already a multi-server job with this name.', 16, 1) 
    GOTO QuitWithRollback  
  END 
  ELSE 
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = @name 
    SELECT @JobID = NULL
  END 

BEGIN 

  -- Add the job
  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @description = N'This job removes all message parts that are no longer being referenced by any messages in the BizTalk MessageBox database tables.', @category_name = N'Database Maintenance', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job steps
  declare @dbname sysname
  set @dbname = db_name()
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'Purge', @command = N'exec bts_PurgeParts', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job schedules
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'Schedule', @enabled = 1, @freq_type = 4, @active_start_date = 20010910, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the Target Servers
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

END
COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 

GO

---Create the  job for copying tracked data
BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     

  declare @name sysname
  set @name = N'TrackedMessages_Copy_' + db_name()
  
  -- Only create the job if it does not already exist
  SELECT @JobID = job_id FROM   msdb.dbo.sysjobs WHERE (name = @name)       
  IF (@JobID IS NULL)    
  BEGIN 
	IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  		EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'
	  -- Add the job
	EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @description = N'This job copies the messages bodies of tracked messages from the BizTalk MessageBox database to the BizTalk Tracking database.', @category_name = N'Database Maintenance', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
	
	-- Add the job steps
	declare @dbname sysname
	set @dbname = db_name()
	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'Purge', @command = N'exec bts_CopyTrackedMessagesToDTA null, null', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
	EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 
	
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
	
	-- Add the job schedules
	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'Schedule', @enabled = 1, @freq_type = 4, @active_start_date = 20010910, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
	
	-- Add the Target Servers
	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  END

COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 

GO

--delete the old cleanup job for purging inactive tracking spool
  DECLARE @JobID BINARY(16)     

  declare @name sysname
  set @name = N'TrackingSpool_Cleanup_' + db_name()
  
  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id FROM msdb.dbo.sysjobs WHERE (name = @name)       
  IF (@JobID IS NOT NULL)    
  	EXECUTE msdb.dbo.sp_delete_job @job_name = @name

GO

BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     

   declare @name sysname
   set @name = N'PurgeSubscriptionsJob_' + db_name()
 
IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
  WHERE (name = @name)       
  IF (@JobID IS NOT NULL)    
  BEGIN  
  -- Check if the job is a multi-server job  
  IF (EXISTS (SELECT  * 
              FROM    msdb.dbo.sysjobservers 
              WHERE   (job_id = @JobID) AND (server_id <> 0))) 
  BEGIN 
    -- There is, so abort the script 
    RAISERROR (N'Unable to import job ''PurgeSubscriptionsJob'' since there is already a multi-server job with this name.', 16, 1) 
    GOTO QuitWithRollback  
  END 
  ELSE 
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = @name 
    SELECT @JobID = NULL
  END 

BEGIN 

  -- Add the job
  declare @dbname sysname
  set @dbname = db_name()
  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @description = N'This job purges unused subscription predicates from the BizTalk MessageBox database.', @category_name = N'Database Maintenance', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job steps
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'step1', @command = N'exec bts_PurgeSubscriptions', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job schedules
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'sched', @enabled = 1, @freq_type = 4, @active_start_date = 19900101, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the Target Servers
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

END
COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 

GO

---Create the UpdateStats job
BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     

  declare @name nvarchar(256)
  set @name = N'MessageBox_UpdateStats_' + db_name()
  
  -- If the job exists drop it so that we make sure it is enabled. In BETA2 it was disabled
  SELECT @JobID = job_id FROM msdb.dbo.sysjobs WHERE (name = @name)  
  IF (@JobID IS NOT NULL)
  BEGIN
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = @name 
    SELECT @JobID = NULL
  END 
        
  BEGIN 

  	IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  	EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

  	-- Add the job
  	EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @description = N'This job manually updates the statistics for the BizTalk MessageBox database.', @category_name = N'Database Maintenance', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  	-- Add the job steps
  	declare @dbname sysname
  	set @dbname = db_name()
  	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'Purge', @command = N'set deadlock_priority low  exec sp_updatestats', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  	EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

  	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  	-- Add the job schedules
  	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'Schedule', @enabled = 1, @freq_type = 4, @active_start_date = 20010910, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 5, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  	-- Add the Target Servers
  	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  END

COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 

GO

--Create the OpsOM job which will run on the local msgbox and make calls to operate on instances on the master msgbox  
BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     

   declare @name sysname
   set @name = N'Operations_OperateOnInstances_OnMaster_' + db_name()

  -- Only create the job if it does not already exist
  SELECT @JobID = job_id FROM   msdb.dbo.sysjobs WHERE (name = @name)       
  IF (@JobID IS NULL)    
  BEGIN 
	IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
		EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

	  -- Add the job
	  declare @dbname sysname
	  set @dbname = db_name()
	
	  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @description = N'This job is used for administration in multiple MessageBox deployments. It asynchronously performs operational actions (like bulk terminate) on the master MessageBox after it performs them on the subordinate MessageBox.', @category_name = N'Database Maintenance', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
	  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

	  -- Add the job steps
	  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'OperateOnInstsOnMaster', @command = N'exec ops_OperateOnInstancesOnMasterMsgBox null, null', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
	  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
	  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

	  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

	  -- Add the job schedules
	  -- We need a schedule in case we add some rows to be handled right as the job is shutting down. This will take care of it later 
	  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'sched', @enabled = 1, @freq_type = 4, @active_start_date = 19900101, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
	  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

	  -- Add the Target Servers
	  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
	  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  END

COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 

GO

CREATE PROCEDURE [dbo].[MBOM_AppendClauseToQueryString]
@val sql_variant,
@snComparisonOperator smallint,
@nvcColumn nvarchar(128),
@nvcJoinOperator nchar(5),
@fIsFirstClause tinyint OUTPUT,
@nvcQuery nvarchar(4000) OUTPUT
AS

/*
comparison operators:
0 -- Unused
1 -- Equals
2 -- NotEquals
3 -- Like
4 -- IsNull
5 -- NotNull
6 -- GreaterThanOrEquals
7 -- LessThanOrEquals
8 -- BitWiseAND
*/

	declare @nvcComparison nvarchar(16)
	
	
	if (@snComparisonOperator = 0) 
		return -- this just means that this clause is not used
	--else if ( (@snComparisonOperator != 4) AND (@snComparisonOperator != 5) AND (@val IS NULL) )
	--	RAISERROR('Null values can only be used with ISNULL and NOTNULL comparison operators', 16, 1)
	else if (@snComparisonOperator = 1)
		set @nvcComparison = ' = '
	else if (@snComparisonOperator = 2)
		set @nvcComparison = ' != '
	else if (@snComparisonOperator = 3)
		set @nvcComparison = ' LIKE '
	else if ( (@snComparisonOperator = 4) OR (@snComparisonOperator = 5) )
	BEGIN
		if (@val IS NOT NULL)
			RAISERROR('Non-null values cannot be passed in for null comparisons', 16, 1)
		
		if (@snComparisonOperator = 4)
			set @nvcComparison = ' IS NULL'
		else if (@snComparisonOperator = 5)
			set @nvcComparison = ' IS NOT NULL'
	END
	else if (@snComparisonOperator = 6)
		set @nvcComparison = ' >= '
	else if (@snComparisonOperator = 7)
		set @nvcComparison = ' <= '
	else if (@snComparisonOperator = 8)
		set @nvcComparison = ' & '

		
	if (@fIsFirstClause = 1)
		set @nvcQuery = @nvcQuery + 'WHERE '

	if ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'uniqueidentifier' )
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '
			
		set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + 'N''' + CAST(@val as nchar(36)) + ''' ' 
		set @fIsFirstClause = 0
	END
/*
	else if ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'nvarchar' )
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '
			
		set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + 'N''' + CAST(@val as sysname) + ''' ' 
		set @fIsFirstClause = 0
	END
*/
	ELSE IF ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'datetime' )
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '
		
		set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + '''' + CONVERT(nvarchar(32), @val, 9) + ''' ' 
		set @fIsFirstClause = 0
	END
	ELSE IF ( ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'int' )
			OR( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'smallint' )
			OR( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'tinyint' )
		)
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '

		if (@snComparisonOperator != 8) --bitwiseAND
			set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + CAST(@val as nvarchar(16)) + ' ' 
		else
			set @nvcQuery = @nvcQuery + '( (' + @nvcColumn + @nvcComparison + CAST(@val as nvarchar(16)) + ') > 0) '
		set @fIsFirstClause = 0
	END
	ELSE IF (@val IS NOT NULL)
	BEGIN 
		--select SQL_VARIANT_PROPERTY(@val, 'BaseType')
		RAISERROR('What is this data type', 16, 1)
	END
GO

CREATE PROCEDURE dbo.MBOM_LookupInstances
(
	@nvcHost nvarchar(128),
	@nServiceClass int,
	@uidServiceType uniqueidentifier,
	@uidInstanceID uniqueidentifier,
	@nvcUserState nvarchar(256),
	@nStatus int,
	@nPendingOperation int,
	@dtFrom datetime,
	@dtUntil datetime,
	@nMaxMatches int
)
AS
	set nocount on
	set transaction isolation level read committed
	set deadlock_priority low
	
	declare @tsql nvarchar(4000)

	if (@uidInstanceID IS NOT NULL)
		set ROWCOUNT 1
	else if (@nMaxMatches > 0)
		set ROWCOUNT @nMaxMatches

		
	declare @fFirstClause int,
		@AND nchar(4),
		@OR nchar(3),
		@dtNow datetime,
		@Equals int

	set @AND = N'AND'
	set @OR = N'OR'
	set @fFirstClause = 1
	set @Equals = 1
	set @dtNow = GetDate();

	set @tsql = 'SELECT 0, a.nvcApplicationName, i.uidInstanceID, i.uidServiceID, i.uidClassID, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime, i.dtSuspendTimeStamp, i.nErrorCategory, i.nvcErrorID, i.nvcErrorDescription, i.nvcErrorProcessingServer '
	set @tsql = @tsql + 'FROM Instances as i WITH (NOLOCK) '
	
	set @tsql = @tsql + 'JOIN Applications as a WITH (NOLOCK) ON a.uidAppID = i.uidAppOwnerID '
	IF ( @nvcHost IS NOT NULL)
	BEGIN
		declare @AppID uniqueidentifier
		select TOP 1 @AppID = uidAppID FROM Applications WHERE nvcApplicationName = @nvcHost
		set @fFirstClause = 0 --this is not the first clause for this join
		exec MBOM_AppendClauseToQueryString @AppID, @Equals, N'a.uidAppID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	
	
	set @tsql = @tsql + 'LEFT JOIN InstancesPendingOperations as ipo WITH (NOLOCK) ON i.uidInstanceID = ipo.uidInstanceID '

	set @fFirstClause = 1 --reset first clause as we are starting the where branch

	if (@uidInstanceID IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidInstanceID, @Equals, N'i.uidInstanceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
		--skip everything else if we have the instanceid
		goto DONE
	END
	
	
	if (@uidServiceType IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidServiceType, @Equals, N'i.uidServiceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	--there is a bug where we are passing the dates in backwards so I have to do the opposite comparisons
	if (@dtFrom IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @dtFrom, 7 /*lessthanorequals*/, N'i.dtCreated', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	if (@dtUntil IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @dtUntil, 6 /*greaterthanorequals*/, N'i.dtCreated', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	if ( (@nStatus IS NOT NULL) AND (@nStatus <> 63) ) -- 63 is all statuses
	BEGIN
		exec MBOM_AppendClauseToQueryString @nStatus, 8 /*bitwiseAND*/, N'i.nState', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	IF ( (@nServiceClass IS NOT NULL) AND (@nServiceClass <> 63) ) --63 is all service classes
	BEGIN
		declare @uidClassID uniqueidentifier,
			@fFirstClass int
				
		set @fFirstClass = 3

		IF (@fFirstClause =0)
			set @tsql = @tsql + 'AND '
		else
			set @tsql = @tsql + 'WHERE '

		set @tsql = @tsql + '( ' --group all of these since we will need an or statement for this

		IF ( (@nServiceClass & 1) = 1)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 1 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 2) = 2)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 2 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass &4) = 4)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 4 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 8) = 8)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 8 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 16) = 16)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 32) = 32)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 32 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 64) = 64)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 64 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + ') '
		set @fFirstClause = 0

	END
		
DONE:

	set @tsql = @tsql + 'order by i.dtCreated '
	exec (@tsql)

	set ROWCOUNT 0
GO
GRANT EXECUTE ON MBOM_LookupInstances TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE dbo.MBOM_LookupReferencingMessages
(
	@nvcHost nvarchar(128),
	@uidInstanceID uniqueidentifier,
	@uidSendPortTransportId uniqueidentifier,
	@nReferenceType int
)
AS
	set nocount on
	set transaction isolation level read committed
	set deadlock_priority low
	
	create table #TempMessages(
						snReferenceType smallint,
						uidMessageID uniqueidentifier, 
						dtTimeStamp datetime, 
						UserName sysname, 
						OriginatorSID sysname, 
						OriginatorPID nvarchar(128),
						uidPortID uniqueidentifier,
						nRetryCount int,
						dtSuspendTimeStamp datetime,
						nErrorCategory int,
						nvcErrorID nvarchar(512),
						nvcAdditionalInfo nvarchar(1024),
						nvcErrorProcessingServer nvarchar(256))
						
	create table #TempMessagesDistinct(
						snReferenceType smallint,
						uidMessageID uniqueidentifier, 
						dtTimeStamp datetime, 
						UserName sysname, 
						OriginatorSID sysname, 
						OriginatorPID nvarchar(128),
						uidPortID uniqueidentifier,
						nRetryCount int,
						dtSuspendTimeStamp datetime,
						nErrorCategory int,
						nvcErrorID nvarchar(512),
						nvcAdditionalInfo nvarchar(1024),
						nvcErrorProcessingServer nvarchar(256))
	
	declare @nvcExecTemplate nvarchar(1024)

	set @nvcExecTemplate = 'MBOM_LookupReferencingMessages_' + @nvcHost + ' '
	insert into #TempMessages exec @nvcExecTemplate @uidInstanceID, @uidSendPortTransportId, @nReferenceType

	insert into #TempMessagesDistinct select distinct * from #TempMessages 
	
	select tm.snReferenceType, tm.uidMessageID, tm.dtTimeStamp, tm.UserName, tm.OriginatorSID, tm.OriginatorPID, s.imgContext, tm.uidPortID, tm.nRetryCount, tm.dtSuspendTimeStamp, tm.nErrorCategory, tm.nvcErrorID, tm.nvcAdditionalInfo, tm.nvcErrorProcessingServer
	from #TempMessagesDistinct as tm, Spool as s WITH (ROWLOCK)
	where tm.uidMessageID = s.uidMessageID
	
	RETURN 

GO
GRANT EXECUTE ON MBOM_LookupReferencingMessages TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE dbo.MBOM_LookupMessages
(
	@nvcHost nvarchar(128),
	@nServiceClass int,
	@uidServiceType uniqueidentifier,
	@uidSendPortTransportId uniqueidentifier,
	@nReferenceType int,
	@dtFrom datetime,
	@dtUntil datetime,
	@nMaxMatches int
)
AS
	set nocount on
	set transaction isolation level read committed
	set deadlock_priority low

	declare @nvcExecTemplate nvarchar(1024)

	create table #TempMessages(
						uidMessageID uniqueidentifier, 
						dtTimeStamp datetime, 
						UserName sysname, 
						OriginatorSID sysname, 
						OriginatorPID nvarchar(128),
						uidPortID uniqueidentifier,
						nRetryCount int)
						
	create table #TempMessagesDistinct(
						uidMessageID uniqueidentifier, 
						dtTimeStamp datetime, 
						UserName sysname, 
						OriginatorSID sysname, 
						OriginatorPID nvarchar(128),
						uidPortID uniqueidentifier,
						nRetryCount int)

	IF (@nvcHost is not null)
	BEGIN
		set @nvcExecTemplate = 'MBOM_LookupMessages_' + @nvcHost + ' '				
		insert into #TempMessages exec @nvcExecTemplate @nServiceClass, @uidServiceType, @uidSendPortTransportId, @nReferenceType, @dtFrom, @dtUntil, @nMaxMatches
	END
	ELSE
	BEGIN
		declare @nvcCurrentHost nvarchar(128)
		declare HostCursor cursor for select nvcApplicationName from Applications

		open HostCursor
		fetch next from HostCursor into @nvcCurrentHost
	
		while(@@FETCH_STATUS = 0)
		BEGIN
			set @nvcExecTemplate = 'MBOM_LookupMessages_' + @nvcCurrentHost + ' '		
			insert into #TempMessages exec @nvcExecTemplate @nServiceClass, @uidServiceType, @uidSendPortTransportId, @nReferenceType, @dtFrom, @dtUntil, @nMaxMatches
	
			fetch next from HostCursor into @nvcCurrentHost
		END
		
		close HostCursor
		deallocate HostCursor

--		insert into #TempMessages 
--		SELECT uidMessageID, dtTimeStamp, UserName, OriginatorSID, OriginatorPID, NULL, 0 FROM Spool WHERE nNumParts = -1

	END
	
	insert into #TempMessagesDistinct select distinct * from #TempMessages 
	
	if (@nMaxMatches > 0)
		set ROWCOUNT @nMaxMatches

	select tm.uidMessageID, tm.dtTimeStamp, tm.UserName, tm.OriginatorSID, tm.OriginatorPID, s.imgContext, tm.uidPortID, tm.nRetryCount
	from #TempMessagesDistinct as tm, Spool as s WITH (ROWLOCK READPAST)
	where  	tm.uidMessageID = s.uidMessageID AND
		(@dtFrom is null OR @dtFrom >= tm.dtTimeStamp) AND
		(@dtUntil is null OR @dtUntil <= tm.dtTimeStamp)
	ORDER BY tm.dtTimeStamp	

	set ROWCOUNT 0

	RETURN 
GO
GRANT EXECUTE ON MBOM_LookupMessages TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE dbo.MBOM_LookupParts
(
	@uidMessageId uniqueidentifier
)
AS
	set nocount on
	set transaction isolation level read committed
	set deadlock_priority low
	
	select mp.nvcPartName, mp.nBodyPart, p.nPartSize, p.imgPropBag
	from 
		MessageParts mp WITH (ROWLOCK READPAST), Parts p WITH (ROWLOCK)
	where
		mp.uidMessageID = @uidMessageId AND
		p.uidPartID = mp.uidPartID 
	
	RETURN 

GO
GRANT EXECUTE ON MBOM_LookupParts TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE dbo.MBOM_LookupReferencingInstances
(
	@nvcHost nvarchar(128),
	@uidServiceClass uniqueidentifier,
	@uidServiceType uniqueidentifier,
	@uidMessageId uniqueidentifier,
	@nReferenceType int,
	@nvcUserState nvarchar(256),
	@snStatus smallint,
	@PendingOperation smallint
)
AS
	set nocount on
	set transaction isolation level read committed
	set deadlock_priority low
	
	create table #TempInstances (
						snStatus smallint, 
						nvcHost nvarchar(128), 
						uidInstanceID uniqueidentifier, 
						uidServiceID uniqueidentifier, 
						uidClassID uniqueidentifier,
						dtCreated datetime, 
						nState smallint, 
						nvcUserState nvarchar(256), 
						nPendingOperation smallint, 
						dtPendingOperationSubmitTime datetime,
						dtSuspendTimeStamp datetime,
						nErrorCategory int,
						nvcErrorID nvarchar(512),
						nvcErrorDescription nvarchar(1024),
						nvcErrorProcessingServer nvarchar(256))
	
	declare @nvcCurrentHost nvarchar(128)
	declare HostCursor cursor for select nvcApplicationName from Applications
	
	open HostCursor

	fetch next from HostCursor into @nvcCurrentHost
	while(@@FETCH_STATUS = 0)
	begin
		if((@nvcHost is null) OR (@nvcHost = @nvcCurrentHost))
		begin
			declare @nvcExecTemplate nvarchar(1024)

			set @nvcExecTemplate = 'MBOM_LookupReferencingInstances_' + @nvcCurrentHost + ' '
			insert into #TempInstances exec @nvcExecTemplate @uidServiceClass, @uidServiceType, @uidMessageId, @nReferenceType, @nvcUserState, @snStatus, @PendingOperation

			if(@nvcHost is not null)
			begin
				close HostCursor
				deallocate HostCursor
				
				select distinct * from #TempInstances
				return
			end
		end

		fetch next from HostCursor into @nvcCurrentHost
	end

	close HostCursor
	deallocate HostCursor
	
	select distinct * from #TempInstances
	RETURN 

GO
GRANT EXECUTE ON MBOM_LookupReferencingInstances TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE dbo.MBOM_LookupMessageReferences
(
	@nvcHost nvarchar(128),
	@nServiceClass int,
	@uidServiceType uniqueidentifier,
	@uidInstanceId uniqueidentifier,
	@uidMessageId uniqueidentifier,
	@snStatus smallint,
	@nReferenceType int,
	@dtFrom datetime,
	@dtUntil datetime,
	@nMaxMatches int
)
AS
	set nocount on
	set transaction isolation level read committed
	set deadlock_priority low

	declare @nvcExecTemplate nvarchar(1024), @dtNow datetime
	set @dtNow = GetUTCDate()


	create table #TempMessages(
						snStatus smallint, 
						nvcHost nvarchar(128), 
						uidMessageID uniqueidentifier, 
						uidInstanceID uniqueidentifier, 
						uidServiceID uniqueidentifier, 
						uidClassID uniqueidentifier,
						uidPortID uniqueidentifier,
						nRetryCount int,
						dtCreated datetime, 
						nState smallint, 
						nvcUserState nvarchar(256),
						nPendingOperation smallint,
						dtPendingOperationSubmitTime datetime
--						dtSuspendTimeStamp datetime,
--						nErrorCategory int,
--						nvcErrorID nvarchar(512),
--						nvcErrorDescription nvarchar(1024),
--						nvcErrorProcessingServer nvarchar(256)
	)
						
	create table #TempMessagesDistinct(
						snStatus smallint, 
						nvcHost nvarchar(128), 
						uidMessageID uniqueidentifier, 
						uidInstanceID uniqueidentifier, 
						uidServiceID uniqueidentifier, 
						uidClassID uniqueidentifier,
						uidPortID uniqueidentifier,
						nRetryCount int,
						dtCreated datetime, 
						nState smallint, 
						nvcUserState nvarchar(256),
						nPendingOperation smallint,
						dtPendingOperationSubmitTime datetime
--						dtSuspendTimeStamp datetime,
--						nErrorCategory int,
--						nvcErrorID nvarchar(512),
--						nvcErrorDescription nvarchar(1024),
--						nvcErrorProcessingServer nvarchar(256)
	)


	if (@dtFrom > @dtNow)
		set @dtFrom = null

	IF (@nvcHost is not null)
	BEGIN
		set @nvcExecTemplate = 'MBOM_LookupMessageReferences_' + @nvcHost + ' '				
		insert into #TempMessages exec @nvcExecTemplate @nServiceClass, @uidServiceType, @uidInstanceId, @uidMessageId, @nReferenceType, @snStatus, @dtFrom, @dtUntil, @nMaxMatches
	END
	ELSE
	BEGIN
		declare @nvcCurrentHost nvarchar(128)
		declare HostCursor cursor for select nvcApplicationName from Applications

		open HostCursor
		fetch next from HostCursor into @nvcCurrentHost
	
		while(@@FETCH_STATUS = 0)
		BEGIN
			set @nvcExecTemplate = 'MBOM_LookupMessageReferences_' + @nvcCurrentHost + ' '		
			insert into #TempMessages exec @nvcExecTemplate @nServiceClass, @uidServiceType, @uidInstanceId, @uidMessageId, @nReferenceType, @snStatus, @dtFrom, @dtUntil, @nMaxMatches
	
			fetch next from HostCursor into @nvcCurrentHost
		END
		
		close HostCursor
		deallocate HostCursor

--		insert into #TempMessages 
--		SELECT uidMessageID, dtTimeStamp, UserName, OriginatorSID, OriginatorPID, NULL, 0 FROM Spool WHERE nNumParts = -1

	END
	
	insert into #TempMessagesDistinct select distinct * from #TempMessages 
	
	if (@nMaxMatches > 0)
		set ROWCOUNT @nMaxMatches

	select tm.nvcHost, tm.uidInstanceID, tm.uidServiceID, tm.uidClassID, 
		tm.dtCreated, tm.nState, tm.nvcUserState, tm.nPendingOperation, tm.dtPendingOperationSubmitTime,
--		tm.dtSuspendTimeStamp, tm.nErrorCategory, nvcErrorID, tm.nvcErrorDescription, tm.nvcErrorProcessingServer,
		tm.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, tm.snStatus, 
		s.imgContext, tm.uidPortID, tm.nRetryCount
	from #TempMessagesDistinct as tm,
		Spool as s WITH (ROWLOCK READPAST)
	where  	tm.uidMessageID = s.uidMessageID AND
		(1 = [dbo].[MBOM_fnParseServiceClassMask](@nServiceClass, tm.uidClassID)) 

	ORDER BY s.dtTimeStamp	

	set ROWCOUNT 0

	RETURN
GO
GRANT EXECUTE ON MBOM_LookupMessageReferences TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[MBOM_ReadServiceStatistics]
@nvcHost nvarchar(128),
@uidServiceClass uniqueidentifier,
@uidServiceType uniqueidentifier
AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low
	
SELECT nState, COUNT(*)
FROM Instances WITH (ROWLOCK READPAST)
WHERE uidServiceID = @uidServiceType
GROUP BY nState

GO
GRANT EXECUTE ON MBOM_ReadServiceStatistics TO BTS_ADMIN_USERS
GO 

CREATE PROCEDURE [dbo].[bts_SafeAddLinkedServer] 
@linkedServer sysname
AS

declare @localServer sysname, @svr sysname

declare @localized_string_Unconfigured_Linked_Server nvarchar(128)
set @localized_string_Unconfigured_Linked_Server = N'%s was configured as a linked server as required by BizTalk Server.'

set @localServer = CAST(SERVERPROPERTY('servername') as sysname)

if ( (@linkedServer IS NULL) OR (@linkedServer = @localServer) )
BEGIN
	--this is just a noop
	return
END

CREATE TABLE #Servers (SRV_NAME sysname, SRV_PROVIDERNAME nvarchar(128) NULL, SRV_PRODUCT nvarchar(128) NULL, SRV_DATASOURCE nvarchar(4000) NULL, SRV_PROVIDERSTRING nvarchar(4000) NULL, SRV_LOCATION nvarchar(4000) NULL, SRV_CAT sysname NULL )
INSERT INTO #Servers exec sp_linkedservers

IF NOT EXISTS (SELECT TOP 1 SRV_NAME FROM #Servers WHERE SRV_NAME = @linkedServer)
BEGIN
	--they are not yet linked so we will link them
	exec sp_addlinkedserver @srvproduct = 'SQL Server', @server = @linkedServer
	RAISERROR(@localized_string_Unconfigured_Linked_Server, 10, 1)
END

DROP TABLE #Servers

GO
GRANT EXEC ON [dbo].[bts_SafeAddLinkedServer] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[bts_SafeAddLinkedServer] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_AppendClauseToQueryString]
@val sql_variant,
@snComparisonOperator smallint,
@nvcColumn nvarchar(128),
@nvcJoinOperator nchar(5),
@fIsFirstClause tinyint OUTPUT,
@nvcQuery nvarchar(4000) OUTPUT
AS

/*
comparison operators:
0 -- Unused
1 -- Equals
2 -- NotEquals
3 -- Like
4 -- IsNull
5 -- NotNull
6 -- GreaterThanOrEquals
7 -- LessThanOrEquals
8 -- BitWiseAND
*/

	declare @nvcComparison nvarchar(16)
	
	
	if (@snComparisonOperator = 0) 
		return -- this just means that this clause is not used
	else if (@snComparisonOperator = 1)
		set @nvcComparison = ' = '
	else if (@snComparisonOperator = 2)
		set @nvcComparison = ' != '
	else if (@snComparisonOperator = 3)
		set @nvcComparison = ' LIKE '
	else if ( (@snComparisonOperator = 4) OR (@snComparisonOperator = 5) )
	BEGIN
		set @val = NULL
		
		if (@snComparisonOperator = 4)
			set @nvcComparison = ' IS NULL'
		else if (@snComparisonOperator = 5)
			set @nvcComparison = ' IS NOT NULL'
	END
	else if (@snComparisonOperator = 6)
		set @nvcComparison = ' >= '
	else if (@snComparisonOperator = 7)
		set @nvcComparison = ' <= '
	else if (@snComparisonOperator = 8)
		set @nvcComparison = ' & '

		
	if (@fIsFirstClause = 1)
		set @nvcQuery = @nvcQuery + ' WHERE '

	if ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'uniqueidentifier' )
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '
			
		set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + 'N''' + CAST(@val as nchar(36)) + ''' ' 
		set @fIsFirstClause = 0
	END
	ELSE IF ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'datetime' )
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '
		
		set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + '''' + CONVERT(nvarchar(32), @val, 9) + ''' ' 
		set @fIsFirstClause = 0
	END
	ELSE IF ( ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'int' )
			OR( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'smallint' )
			OR( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'tinyint' )
		)
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '

		if (@snComparisonOperator != 8) --bitwiseAND
			set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + CAST(@val as nvarchar(16)) + ' ' 
		else
			set @nvcQuery = @nvcQuery + '( (' + @nvcColumn + @nvcComparison + CAST(@val as nvarchar(16)) + ') > 0) '
		set @fIsFirstClause = 0
	END
	ELSE IF (@val IS NULL)
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '
		
		set @nvcQuery = @nvcQuery + ' ' + @nvcColumn + @nvcComparison
		set @fIsFirstClause = 0
	END

	ELSE IF ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'nchar' )
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '

		set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + CAST(@val as nchar)
		set @fIsFirstClause = 0
	END

	ELSE IF ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'nvarchar' )
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '

		set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + CAST(@val as nvarchar)
		set @fIsFirstClause = 0
	END

	ELSE IF (@val IS NOT NULL)
		RAISERROR('What is this data type', 16, 1)
GO
GRANT EXEC ON [dbo].[ops_AppendClauseToQueryString] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_AppendClauseToQueryString] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_AppendEnumClauseToQueryString]
@val sql_variant,
@snComparisonOperator smallint,
@nvcColumn nvarchar(128),
@nvcJoinOperator nchar(5),
@fIsFirstClause tinyint OUTPUT,
@nvcQuery nvarchar(4000) OUTPUT
AS

/*
comparison operators:
0 -- Unused
1 -- Equals
2 -- NotEquals
3 -- Like
4 -- IsNull
5 -- NotNull
6 -- GreaterThanOrEquals
7 -- LessThanOrEquals
8 -- BitWiseAND
*/

	declare @nvcComparison nvarchar(16)
	
	
	if (@snComparisonOperator = 0) 
		return -- this just means that this clause is not used
	else if (@snComparisonOperator = 1)
		set @nvcComparison = ' = '
	else if (@snComparisonOperator = 2)
		set @nvcComparison = ' != '
	else if (@snComparisonOperator = 3)
		set @nvcComparison = ' LIKE '
	else if ( (@snComparisonOperator = 4) OR (@snComparisonOperator = 5) )
	BEGIN
		if (@val IS NOT NULL)
			RAISERROR('Non-null values cannot be passed in for null comparisons', 16, 1)
		
		if (@snComparisonOperator = 4)
			set @nvcComparison = ' IS NULL'
		else if (@snComparisonOperator = 5)
			set @nvcComparison = ' IS NOT NULL'
	END
	else if (@snComparisonOperator = 6)
		set @nvcComparison = ' >= '
	else if (@snComparisonOperator = 7)
		set @nvcComparison = ' <= '
	else if (@snComparisonOperator = 8)
		set @nvcComparison = ' & '

		
	if ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'uniqueidentifier' )
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '
			
		set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + 'N''' + CAST(@val as nchar(36)) + ''' ' 
		set @fIsFirstClause = 0
	END
	ELSE IF ( ( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'int' )
			OR( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'smallint' )
			OR( SQL_VARIANT_PROPERTY(@val, 'BaseType') = 'tinyint' )
		)
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '

		if (@snComparisonOperator != 8) --bitwiseAND
			set @nvcQuery = @nvcQuery + @nvcColumn + @nvcComparison + CAST(@val as nvarchar(16)) + ' ' 
		else
			set @nvcQuery = @nvcQuery + '( (' + @nvcColumn + @nvcComparison + CAST(@val as nvarchar(16)) + ') > 0) '
		set @fIsFirstClause = 0
	END
	ELSE IF (@val IS NULL)
	BEGIN
		IF (@fIsFirstClause = 0)
			set @nvcQuery = @nvcQuery + ' ' + @nvcJoinOperator + ' '
		
		set @nvcQuery = @nvcQuery + ' ' + @nvcColumn + @nvcComparison
		set @fIsFirstClause = 0
	END

	ELSE IF (@val IS NOT NULL)
		RAISERROR('What is this data type', 16, 1)
GO
GRANT EXEC ON [dbo].[ops_AppendEnumClauseToQueryString] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_AppendEnumClauseToQueryString] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_AppendColumnToGroupingSelect]
@nvcColumn nvarchar(128), 
@fFirstClause tinyint OUTPUT,
@nvcSelect nvarchar(4000) OUTPUT
AS

	IF (0 = @fFirstClause)
	BEGIN
		set @nvcSelect = @nvcSelect + N', '
	END

	set @nvcSelect = @nvcSelect + @nvcColumn
	set @fFirstClause = 0

GO
GRANT EXEC ON [dbo].[ops_AppendColumnToGroupingSelect] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_AppendColumnToGroupingSelect] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_BuildInstanceSuspendedGroupingSelectStatement]
@nGroupingCriteria int,
@nvcGroupingStatement nvarchar(4000) OUTPUT,
@fNeedsModule int OUTPUT,
@fNeedsApplication int OUTPUT
AS

	declare @fFirstClause int
	set @fFirstClause = 1

	--For Admin Application concept 
	IF ( (@nGroupingCriteria & 1) = 1)
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'm.nvcName', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
		set @fNeedsModule = 1
	END

	--ErrorCode
	IF ( (@nGroupingCriteria & 2) = 2)  
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'ist.nvcErrorID', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
	END

	--ErrorDescription
	IF ( (@nGroupingCriteria & 4) = 4)  
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'ist.nvcErrorDescription', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
	END

	--URI
	IF ( (@nGroupingCriteria & 8) = 8)  
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'ist.nvcURI', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
	END

	--HostName
	IF ( (@nGroupingCriteria & 16) = 16)  
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'a.nvcApplicationName', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
		set @fNeedsApplication = 1
	END

	--Class
	IF ( (@nGroupingCriteria & 32) = 32)  
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'ist.uidClassID', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
	END
	
	--Type (ie ServiceID)
	IF ( (@nGroupingCriteria & 64) = 64)  
	BEGIN	
		exec ops_AppendColumnToGroupingSelect N'ist.uidServiceID', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT
	END

	--Adapter
	IF ( (@nGroupingCriteria & 128) = 128) 
	BEGIN	
		exec ops_AppendColumnToGroupingSelect N'ist.nvcAdapter', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT
	END

	--Status
	IF ( (@nGroupingCriteria & 256) = 256)  
	BEGIN	
		exec ops_AppendColumnToGroupingSelect N'ist.nState', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT
	END

	-- PendingOperation grouping criteria field ignored since this call is for suspended instances.
GO
GRANT EXEC ON [dbo].[ops_BuildInstanceSuspendedGroupingSelectStatement] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_BuildInstanceSuspendedGroupingSelectStatement] TO BTS_OPERATORS
GO


CREATE PROCEDURE [dbo].[ops_BuildInstanceGroupingSelectStatement]
@nGroupingCriteria int,
@nvcGroupingStatement nvarchar(4000) OUTPUT,
@fNeedsModule int OUTPUT,
@fNeedsApplication int OUTPUT,
@fNeedsPendingOperation int OUTPUT
AS

	declare @fFirstClause int
	set @fFirstClause = 1

	--For Admin Application concept 
	IF ( (@nGroupingCriteria & 1) = 1)
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'm.nvcName', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
		set @fNeedsModule = 1
	END

	--HostName
	IF ( (@nGroupingCriteria & 16) = 16)  
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'a.nvcApplicationName', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
		set @fNeedsApplication = 1
	END

	--Class
	IF ( (@nGroupingCriteria & 32) = 32)  
	BEGIN
		exec ops_AppendColumnToGroupingSelect N'i.uidClassID', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT		
	END
	
	--Type (ie ServiceID)
	IF ( (@nGroupingCriteria & 64) = 64)  
	BEGIN	
		exec ops_AppendColumnToGroupingSelect N'i.uidServiceID', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT
	END

	--Status
	IF ( (@nGroupingCriteria & 256) = 256)  
	BEGIN	
		exec ops_AppendColumnToGroupingSelect N'i.nState', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT
	END

	--PendingOperation
	IF ( (@nGroupingCriteria & 512) = 512)  
	BEGIN	
		exec ops_AppendColumnToGroupingSelect N'ipo.nPendingOperation', @fFirstClause OUTPUT, @nvcGroupingStatement OUTPUT
		set @fNeedsPendingOperation = 1
	END

	-- Other grouping criteria fields ignored since this call is for non-suspended instances.
GO
GRANT EXEC ON [dbo].[ops_BuildInstanceGroupingSelectStatement] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_BuildInstanceGroupingSelectStatement] TO BTS_OPERATORS
GO

-- For running instances, hybrid and all instances. Not for suspended-only.
CREATE PROCEDURE [dbo].[ops_BuildInstanceQuery]
@snActionOperation smallint,  --0 is enumerate, 1 is susp, 2 is term, 3 is res, 4 is res in debug mode, 5 is grouping
@fMultiMessagebox tinyint,
@uidInstanceID uniqueidentifier,
@nvcApplication nvarchar(256),
@snApplicationOperator smallint,
@nvcHost nvarchar(128),
@snHostOperator smallint,
@nServiceClass int,
@snServiceClassOperator smallint,
@uidServiceType uniqueidentifier,
@snServiceTypeOperator smallint,
@nStatus int,
@snStatusOperator smallint,
@nPendingOperation int,
@snPendingOperationOperator smallint,
@dtPendingOperationTimeFrom datetime,
@dtPendingOperationTimeUntil datetime,
@dtStartFrom datetime,
@dtStartUntil datetime,
@nvcErrorCode nvarchar(512),
@snErrorCodeOperator smallint,
@nvcErrorDescription nvarchar(1024),
@snErrorDescriptionOperator smallint,
@nvcURI nvarchar(512),
@snURIOperator smallint,
@dtStartSuspend datetime,
@dtEndSuspend datetime,
@nvcAdapter nvarchar(512),
@snAdapterOperator smallint,
@nGroupingCriteria int, 
@nGroupingMinCount int,
@nMaxMatches int,
@uidAccessorID uniqueidentifier,
@tsql nvarchar(4000) OUTPUT
AS  

	declare @fFirstClause int,
		@AND nchar(4),
		@OR nchar(3),
		@dtNow datetime,		
		@nvcGroupingStatement nvarchar(4000),
		@fNeedsModule int,
		@fNeedsApplication int,
		@fNeedsPendingOperation int

	set @AND = N'AND'
	set @OR = N'OR'
	set @fFirstClause = 0 -- This is set to 0 while building up the select part of the statement
	set @dtNow = GetUTCDate()	
	set @nvcGroupingStatement = N'' 
	set @fNeedsModule = 0
	set @fNeedsApplication = 0
	set @fNeedsPendingOperation = 0


	IF (5 <> @snActionOperation)
	BEGIN	
		--Only need three columns for the regular select, susp, term, res operations
		IF (0 = @snActionOperation)
		BEGIN
			set @tsql = N'SELECT TOP ' + CAST(@nMaxMatches as nvarchar(16)) + ' ' + N'i.uidInstanceID, i.uidClassID, i.uidServiceID'
		END
		ELSE
		BEGIN
			-- No batch size restriction for bulk ops
			set @tsql = N'SELECT i.uidInstanceID, i.uidClassID, i.uidServiceID, a.nvcApplicationName'
			set @fNeedsApplication = 1
		END
	END
	ELSE
	BEGIN
		IF (0 <> @nGroupingCriteria)
		BEGIN
			exec ops_BuildInstanceGroupingSelectStatement   @nGroupingCriteria,							  		
								        @nvcGroupingStatement OUTPUT, @fNeedsModule OUTPUT,  @fNeedsApplication OUTPUT, @fNeedsPendingOperation OUTPUT
			IF (@nvcGroupingStatement <> N'')
			BEGIN
				set @tsql = N'SELECT ' + @nvcGroupingStatement + N', count(*) '
			END
			ELSE
			BEGIN
				set @tsql = N'SELECT count(*)'
			END
		END
		ELSE 
		BEGIN
			set @tsql = N'SELECT count(*)'
		END
	END

	IF (0 = @snActionOperation)
	BEGIN
		set @tsql = @tsql + N', i.dtCreated, i.nState, a.nvcApplicationName, i.nvcUserState, m.nvcName, i.nvcProcessingServer, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime'
		set @fNeedsApplication = 1
		set @fNeedsModule = 1
		set @fNeedsPendingOperation = 1

		-- If searching all instances, or hybrid instance-statuses	
		IF ( (@snStatusOperator = 0) OR ((@nStatus & 4) = 4) OR ((@nStatus & 32) = 32) )
		BEGIN
			set @tsql = @tsql + N', ist.dtSuspendTimeStamp, ist.nvcAdapter, ist.nvcURI, ist.nErrorCategory, ist.nvcErrorID, ist.nvcErrorDescription, ist.nvcErrorProcessingServer'
		END
	END

--FROM CLAUSE
	
	IF (@snApplicationOperator <> 0)
		set @fNeedsModule = 1

	set @tsql = @tsql + N' FROM Instances AS i WITH (ROWLOCK READPAST) '
	IF (@fNeedsApplication <> 0)
	BEGIN
		set @tsql = @tsql + N' JOIN Applications AS a WITH (ROWLOCK) ON ' 
		exec ops_AppendClauseToQueryString N'i.uidAppOwnerID', 1/*Equals*/, N'a.uidAppID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
	END
	IF (@fNeedsPendingOperation <> 0)
	BEGIN
		set @tsql = @tsql + N' LEFT JOIN InstancesPendingOperations AS ipo WITH (ROWLOCK READPAST) ON '
		exec ops_AppendClauseToQueryString N'ipo.uidInstanceID', 1/*Equals*/, N'i.uidInstanceID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
	END
	-- If searching all instances, or hybrid instance-statuses
	IF ((0 = @snActionOperation AND ((@snStatusOperator = 0) OR ((@nStatus & 4) = 4) OR ((@nStatus & 32) = 32)))  OR (3 = @snActionOperation))
	BEGIN
		set @tsql = @tsql + N' LEFT JOIN InstancesSuspended AS ist WITH (ROWLOCK READPAST) ON '
		exec ops_AppendClauseToQueryString N'ist.uidInstanceID', 1/*Equals*/, N'i.uidInstanceID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
	END

	--For Admin Application concept
	IF (@fNeedsModule <> 0)
	BEGIN
		set @tsql = @tsql + N' LEFT JOIN Services AS s WITH (ROWLOCK) JOIN Modules AS m WITH (ROWLOCK) ON '
		exec ops_AppendClauseToQueryString N's.nModuleID', 1/*Equals*/, N'm.nModuleID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
		set @tsql = @tsql + N' ON '
		exec ops_AppendClauseToQueryString N'i.uidServiceID', 1/*Equals*/, N's.uidServiceID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
	END

--WHERE CLAUSE 

	set @fFirstClause = 1  --where clause part starts now
	
	IF (@uidInstanceID <> N'{00000000-0000-0000-0000-000000000000}')
	BEGIN
		exec ops_AppendClauseToQueryString @uidInstanceID, 1/*Equals*/, N'i.uidInstanceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT		
	END

	IF ( (@nvcHost IS NOT NULL) AND (@snHostOperator != 0) )
	BEGIN
		declare @uidAppID uniqueidentifier
		SELECT @uidAppID = uidAppID FROM Applications WHERE nvcApplicationName = @nvcHost

		exec ops_AppendClauseToQueryString @uidAppID, @snHostOperator, N'i.uidAppOwnerID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	
	IF ( ( @nServiceClass <> 127 ) AND (@snServiceClassOperator <> 0) ) 
	BEGIN
		declare @uidClassID uniqueidentifier,
		@fFirstClass int
		set @snServiceClassOperator = 1
				
		set @fFirstClass = 1

		IF (@fFirstClause =0)
		BEGIN
			set @tsql = @tsql + N' AND '
		END
		ELSE
		BEGIN
			set @tsql = @tsql + N' WHERE '
			set @fFirstClause = 0
		END

		set @tsql = @tsql + '( ' --group all of these since we will need an or statement for this

		IF ( @nServiceClass = 111 ) -- special case, it is the default which excludes the caching service.
		BEGIN
			--set @snServiceClassOperator = 2 -- not equal
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, 2 /* NotEquals */, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
			set @nServiceClass = 0 -- none of the other conditions should evaluate after this one
		END

		IF ( (@nServiceClass & 1) = 1)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 1 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 2) = 2)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 2 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass &4) = 4)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 4 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 8) = 8)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 8 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 16) = 16)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 32) = 32)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 32 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 64) = 64)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 64 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'i.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + ') '		
	END
	ELSE
	BEGIN
		-- special case to exclude the caching service, regardless of whether or not the user is filtering
		-- on the service class
		declare @uidCachingClassID uniqueidentifier
		
		set @uidCachingClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
		exec ops_AppendClauseToQueryString @uidCachingClassID, 2 /* NotEquals */, N'i.uidClassID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT		
	END 
	
	IF (@uidServiceType <> N'{00000000-0000-0000-0000-000000000000}')
		exec ops_AppendClauseToQueryString @uidServiceType, @snServiceTypeOperator, N'i.uidServiceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	--for the instance creation time only use the start from if it is later than "0"
	if (@dtStartFrom > 0)
		exec ops_AppendClauseToQueryString @dtStartFrom, 6 /*greaterthanorequals*/, N'i.dtCreated', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	if (@dtStartUntil < @dtNow)
		exec ops_AppendClauseToQueryString @dtStartUntil, 7 /*lessthanorequals*/, N'i.dtCreated', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	
	IF (((@snStatusOperator = 1) OR (@snStatusOperator = 8)) AND  (@nStatus <> 495)) ----not overloading scheduled state to be 16 in case of any confusion with zombies which were 16 previously
	BEGIN  
		declare @fFirstState int
				
		set @fFirstState = 1
		set @snStatusOperator = 8  --bitwise AND

		IF (@fFirstClause = 0)
		BEGIN
			set @tsql = @tsql + N' AND '
		END
		ELSE
		BEGIN
			set @tsql = @tsql + N' WHERE '
			set @fFirstClause = 0
		END

		-- grouping these for OR stmt
		set @tsql = @tsql + '( '

		-- Not including completed state

		IF ((@nStatus & 1) = 1)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 1, @snStatusOperator /*bitwiseAND*/, N'i.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nStatus & 2) = 2)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 2, @snStatusOperator /*bitwiseAND*/, N'i.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nStatus & 4) = 4)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 4, @snStatusOperator /*bitwiseAND*/, N'i.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nStatus & 8) = 8)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 8, @snStatusOperator /*bitwiseAND*/, N'i.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		-- Not including zombies
		IF ((@nStatus & 32) = 32)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 32, @snStatusOperator /*bitwiseAND*/, N'i.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nStatus & 64) = 64)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 64, @snStatusOperator /*bitwiseAND*/, N'i.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nStatus & 128) = 128)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 128, @snStatusOperator /*bitwiseAND*/, N'i.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nStatus & 256) = 256)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 256, @snStatusOperator /*bitwiseAND*/, N'i.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + ') '		
	END

	IF ((@snPendingOperationOperator = 1) OR (@snPendingOperationOperator = 8) ) 
	BEGIN  
		declare @fFirstPendingOp int
				
		set @fFirstPendingOp = 1
		set @snPendingOperationOperator = 8  --bitwise AND

		IF (@fFirstClause = 0)
		BEGIN
			set @tsql = @tsql + N' AND '
		END
		ELSE
		BEGIN
			set @tsql = @tsql + N' WHERE '
			set @fFirstClause = 0
		END

		-- grouping these for OR stmt
		set @tsql = @tsql + '( '

		if ((@nPendingOperation & 1) = 1)
		BEGIN
			--1 is no pending operation which maps to null in the field which is returned for nPendingOperation
			exec ops_AppendEnumClauseToQueryString NULL, 4 /*IsNull*/, N'ipo.nPendingOperation',  @OR, @fFirstPendingOp OUTPUT, @tsql OUTPUT
		END

		IF ((@nPendingOperation & 2) = 2)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 2, @snPendingOperationOperator /*bitwiseAND*/, N'ipo.nPendingOperation', @OR, @fFirstPendingOp OUTPUT, @tsql OUTPUT
		END

		IF ((@nPendingOperation & 4) = 4)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 4, @snPendingOperationOperator /*bitwiseAND*/, N'ipo.nPendingOperation', @OR, @fFirstPendingOp OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + ') '		
	END

	--for pending operations time only use the start from if it is later than "0"
	if (@dtPendingOperationTimeFrom > 0)
		exec ops_AppendClauseToQueryString @dtStartFrom, 6 /*greaterthanorequals*/, N'ipo.dtPendingOperationSubmitTime', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	if (@dtPendingOperationTimeUntil < @dtNow)
		exec ops_AppendClauseToQueryString @dtStartUntil, 7 /*lessthanorequals*/, N'ipo.dtPendingOperationSubmitTime', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

--For Admin Application concept
	exec ops_AppendClauseToQueryString N'@Application', @snApplicationOperator, N'm.nvcName', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

--Code to ensure the same instance is not operated on multiple times in the bulk operations has been removed
--since the bulk operation is now one SQL call rather than being batched

-- In a resume bulk op, transition from suspended to active to suspended state can occur in certain scenarios.
-- Prevent those instances from being operated on multiple times
	IF (3 = @snActionOperation) --Resume
	BEGIN
		IF ( (@snStatusOperator = 0) OR ((@nStatus & 4) = 4) OR ((@nStatus & 32) = 32) )
		BEGIN
			IF (@dtEndSuspend <= @dtNow)
			BEGIN
				exec ops_AppendClauseToQueryString @dtEndSuspend, 7/*LessThanOrEquals*/, N'ist.dtSuspendTimeStamp', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
			END
		END
	END

--Group by
	IF (5 = @snActionOperation) 
	BEGIN
		IF ((0 <> @nGroupingCriteria) AND (@nvcGroupingStatement <> N''))
		BEGIN		
			set @tsql = @tsql + N' GROUP BY ' + @nvcGroupingStatement + ' '
			set @tsql = @tsql + ' HAVING COUNT(*)'
			set @fFirstClause = 0 --just in case it hasn't been unset
			exec ops_AppendClauseToQueryString @nGroupingMinCount, 6 /*greaterthanorequals*/, N'', N'', @fFirstClause OUTPUT, @tsql OUTPUT
			set @tsql = @tsql + ' ORDER BY COUNT(*) DESC'
		END
	END
	ELSE
	BEGIN
		IF (0 = @snActionOperation)
		BEGIN
			set @tsql = @tsql + ' ORDER BY i.dtCreated DESC'
		END
	END
GO
GRANT EXEC ON [dbo].[ops_BuildInstanceQuery] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_BuildInstanceQuery] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_BuildInstanceSuspendedQuery]
@snActionOperation smallint,  --0 is enumerate, 1 is susp, 2 is term, 3 is res, 4 is grouping
@fMultiMessagebox tinyint,
@uidInstanceID uniqueidentifier,
@nvcApplication nvarchar(256),
@snApplicationOperator smallint,
@nvcHost nvarchar(128),
@snHostOperator smallint,
@nServiceClass int,
@snServiceClassOperator smallint,
@uidServiceType uniqueidentifier,
@snServiceTypeOperator smallint,
@nStatus int,
@snStatusOperator smallint,
@nPendingOperation int,
@snPendingOperationOperator smallint,
@dtPendingOperationTimeFrom datetime,
@dtPendingOperationTimeUntil datetime,
@dtStartFrom datetime,
@dtStartUntil datetime,
@nvcErrorCode nvarchar(512),
@snErrorCodeOperator smallint,
@nvcErrorDescription nvarchar(1024),
@snErrorDescriptionOperator smallint,
@nvcURI nvarchar(512),
@snURIOperator smallint,
@dtStartSuspend datetime,
@dtEndSuspend datetime,
@nvcAdapter nvarchar(512),
@snAdapterOperator smallint,
@nGroupingCriteria int, 
@nGroupingMinCount int,
@nMaxMatches int,
@uidAccessorID uniqueidentifier,
@tsql nvarchar(4000) OUTPUT
AS  

	declare @fFirstClause int,
		@AND nchar(4),
		@OR nchar(3),
		@dtNow datetime,
		@nvcGroupingStatement nvarchar(4000),
		@fNeedsModule int,
		@fNeedsApplication int

	set @AND = N'AND'
	set @OR = N'OR'
	set @fFirstClause = 0 -- This is set to 0 while building up the select part of the statement
	set @dtNow = GetUTCDate()
	set @nvcGroupingStatement = N'' 
	set @fNeedsModule = 0
	set @fNeedsApplication = 0


	IF (5 <> @snActionOperation)
	BEGIN	
		--Only need three columns for the regular select, susp, term, res operations
		IF (0 = @snActionOperation)
		BEGIN
			set @tsql = N'SELECT TOP ' + CAST(@nMaxMatches as nvarchar(16)) + ' ' + N'ist.uidInstanceID, ist.uidClassID, ist.uidServiceID'
		END
		ELSE
		BEGIN
			-- No batch size restriction for bulk ops
			set @tsql = N'SELECT ist.uidInstanceID, ist.uidClassID, ist.uidServiceID, a.nvcApplicationName'
			set @fNeedsApplication = 1
		END
	END
	ELSE
	BEGIN
		IF (0 <> @nGroupingCriteria)
		BEGIN			
			exec ops_BuildInstanceSuspendedGroupingSelectStatement   @nGroupingCriteria,										 								  	  	 
									         @nvcGroupingStatement OUTPUT, @fNeedsModule OUTPUT, @fNeedsApplication OUTPUT

			IF (@nvcGroupingStatement <> N'')
			BEGIN
				set @tsql = N'SELECT ' + @nvcGroupingStatement + N', count(*) '
			END
			ELSE
			BEGIN
				set @tsql = N'SELECT count(*)'
			END	
		
		END
		ELSE 
		BEGIN
			set @tsql = N'SELECT count(*)'
		END
	END

	IF (0 = @snActionOperation)
	BEGIN
		set @tsql = @tsql + N', ist.dtCreated, ist.nState, a.nvcApplicationName, ist.nvcUserState, m.nvcName, ist.dtSuspendTimeStamp, ist.nvcAdapter, ist.nvcURI, ist.nErrorCategory, ist.nvcErrorID, ist.nvcErrorDescription, ist.nvcErrorProcessingServer'
		set @fNeedsApplication = 1
		set @fNeedsModule = 1
	END

	if (@snApplicationOperator <> 0)
		set @fNeedsModule = 1


--FROM CLAUSE
	
	set @tsql = @tsql + N' FROM InstancesSuspended AS ist WITH (ROWLOCK READPAST) '
	if (@fNeedsApplication <> 0)
	BEGIN
		set @tsql = @tsql + N' JOIN Applications AS a WITH (ROWLOCK) ON ' 
		exec ops_AppendClauseToQueryString N'ist.uidAppOwnerID', 1/*Equals*/, N'a.uidAppID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
	END

	--Required for bulk operations
	IF ((@snActionOperation <> 0) AND (@snActionOperation <> 5))
	BEGIN
		set @tsql = @tsql + N' LEFT JOIN InstancesPendingOperations AS ipo WITH (ROWLOCK READPAST) ON '
		exec ops_AppendClauseToQueryString N'ipo.uidInstanceID', 1/*Equals*/, N'ist.uidInstanceID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
	END

	--For Admin Application concept
	IF (@fNeedsModule <> 0)
	BEGIN
		--Need left join rather than join for services since RFR instances arent associated with any Admin App concept
		set @tsql = @tsql + N' LEFT JOIN Services AS s WITH (ROWLOCK) LEFT JOIN Modules AS m WITH (ROWLOCK) ON '
		exec ops_AppendClauseToQueryString N's.nModuleID', 1/*Equals*/, N'm.nModuleID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
		set @tsql = @tsql + N' ON '
		exec ops_AppendClauseToQueryString N'ist.uidServiceID', 1/*Equals*/, N's.uidServiceID', N'', @fFirstClause OUTPUT, @tsql OUTPUT
	END

--WHERE CLAUSE 

	set @fFirstClause = 1  --where clause part starts now

	IF (@uidInstanceID <> N'{00000000-0000-0000-0000-000000000000}')
	BEGIN
		exec ops_AppendClauseToQueryString @uidInstanceID, 1/*Equals*/, N'ist.uidInstanceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT		
	END

	IF ( (@nvcHost IS NOT NULL) AND (@snHostOperator != 0) )
	BEGIN
		declare @uidAppID uniqueidentifier
		SELECT @uidAppID = uidAppID FROM Applications WHERE nvcApplicationName = @nvcHost

		exec ops_AppendClauseToQueryString @uidAppID, @snHostOperator, N'ist.uidAppOwnerID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	IF ( (@nServiceClass <> 127) AND (@snServiceClassOperator <> 0)  ) 
	BEGIN
		declare @uidClassID uniqueidentifier,
			@fFirstClass int
		set @snServiceClassOperator = 1
				
		set @fFirstClass = 1

		IF (@fFirstClause = 0)
		BEGIN
			set @tsql = @tsql + N' AND '
		END
		ELSE 
		BEGIN
			set @tsql = @tsql + N' WHERE '
			set @fFirstClause = 0
		END

		set @tsql = @tsql + '( ' --group all of these since we will need an or statement for this

		IF ( @nServiceClass = 111 ) -- special case, it is the default which excludes the caching service.
		BEGIN
			--set @snServiceClassOperator = 2 -- not equal
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, 2 /* NotEquals */, N'ist.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
			set @nServiceClass = 0 -- none of the other conditions should evaluate after this one
		END

		IF ( (@nServiceClass & 1) = 1)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 1 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'ist.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 2) = 2)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 2 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'ist.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass &4) = 4)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 4 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'ist.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 8) = 8)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 8 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'ist.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 16) = 16)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'ist.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 32) = 32)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 32 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'ist.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 64) = 64)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 64 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N'ist.uidClassID', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + ') ' 
	END
	ELSE
	BEGIN
		-- special case to exclude the caching service, regardless of whether or not the user is filtering
		-- on the service class
		declare @uidCachingClassID uniqueidentifier
		
		set @uidCachingClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
		exec ops_AppendClauseToQueryString @uidCachingClassID, 2 /* NotEquals */, N'ist.uidClassID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT		
	END 
	
	IF (@uidServiceType <> N'{00000000-0000-0000-0000-000000000000}')
		exec ops_AppendClauseToQueryString @uidServiceType, @snServiceTypeOperator, N'ist.uidServiceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	--for the instance creation time only use the start from if it is later than "0"
	if (@dtStartFrom > 0)
		exec ops_AppendClauseToQueryString @dtStartFrom, 6 /*greaterthanorequals*/, N'ist.dtCreated', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	if (@dtStartUntil < @dtNow)
		exec ops_AppendClauseToQueryString @dtStartUntil, 7 /*lessthanorequals*/, N'ist.dtCreated', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	IF ((@snStatusOperator = 1) OR (@snStatusOperator = 8))
	BEGIN
		declare @fFirstState int
				
		set @fFirstState = 1
		set @snStatusOperator = 8  --bitwiseAND

		IF (@fFirstClause = 0)
		BEGIN
			set @tsql = @tsql + N' AND '
		END
		ELSE
		BEGIN
			set @tsql = @tsql + N' WHERE '
			set @fFirstClause = 0
		END

		-- grouping these for OR stmt
		set @tsql = @tsql + '( '

		IF ((@nStatus & 4) = 4)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 4, @snStatusOperator /*bitwiseAND*/, N'ist.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nStatus & 32) = 32)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 32, @snStatusOperator /*bitwiseAND*/, N'ist.nState', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + ') '
		--set @fFirstClause = 0
	END

-- In a resume bulk op, transition from suspended to active to suspended state can occur in certain scenarios.
-- The dtEndSuspend code also covers that case by preventing those instances from being operated on multiple times
	--for the instance suspend time only use the start from if it is later than "0"
	if (@dtStartSuspend > 0)
		exec ops_AppendClauseToQueryString @dtStartSuspend, 6 /*greaterthanorequals*/, N'ist.dtSuspendTimeStamp', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	if (@dtEndSuspend < @dtNow)
		exec ops_AppendClauseToQueryString @dtEndSuspend, 7 /*lessthanorequals*/, N'ist.dtSuspendTimeStamp', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	exec ops_AppendClauseToQueryString N'@Adapter', @snAdapterOperator, N'ist.nvcAdapter', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	exec ops_AppendClauseToQueryString N'@URI', @snURIOperator, N'ist.nvcURI', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	exec ops_AppendClauseToQueryString N'@ErrorCode', @snErrorCodeOperator, N'ist.nvcErrorID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	exec ops_AppendClauseToQueryString N'@ErrorDescription', @snErrorDescriptionOperator, N'ist.nvcErrorDescription', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

--For Admin Application concept
	exec ops_AppendClauseToQueryString N'@Application', @snApplicationOperator, N'm.nvcName', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

--Code to ensure the same instance is not operated on multiple times in the bulk operations has been removed
--since the bulk operation is now one SQL call rather than being batched

-- Group by
	IF (5 = @snActionOperation) 
	BEGIN
		IF ((0 <> @nGroupingCriteria) AND (@nvcGroupingStatement <> N''))
		BEGIN
			set @tsql = @tsql + N' GROUP BY ' + @nvcGroupingStatement + ' '
			set @tsql = @tsql + ' HAVING COUNT(*)'
			set @fFirstClause = 0 --just in case it hasn't been unset. 
			exec ops_AppendClauseToQueryString @nGroupingMinCount, 6 /*greaterthanorequals*/, N'', N'', @fFirstClause OUTPUT, @tsql OUTPUT
			set @tsql = @tsql + ' ORDER BY COUNT(*) DESC'
		END
	END
	ELSE
	BEGIN
		IF (0 = @snActionOperation)
		BEGIN
			set @tsql = @tsql + ' ORDER BY ist.dtCreated DESC'
		END
	END

GO
GRANT EXEC ON [dbo].[ops_BuildInstanceSuspendedQuery] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_BuildInstanceSuspendedQuery] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_UpdateBulkOperationsProgress]
@uidAccessorID uniqueidentifier,
@nNumOperatedOn int,
@nReturn int
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	--All count-related data types are changed to longs rather than ints
	IF (@nReturn = 0)
	BEGIN 			
		UPDATE OperationsProgress
		SET nPendingCount = nPendingCount + @nNumOperatedOn
		FROM OperationsProgress WITH (ROWLOCK)
		WHERE uidAccessorID = @uidAccessorID
		OPTION (KEEPFIXED PLAN) 
	END
	ELSE IF (@nReturn = 1)
	BEGIN
		UPDATE OperationsProgress
		SET nSucceededCount = nSucceededCount + @nNumOperatedOn
		FROM OperationsProgress WITH (ROWLOCK) 
		WHERE uidAccessorID = @uidAccessorID
		OPTION (KEEPFIXED PLAN) 
	END
	ELSE IF (@nReturn = 5)
	BEGIN
		UPDATE OperationsProgress
		SET nSkippedCount = nSkippedCount + @nNumOperatedOn
		FROM OperationsProgress WITH (ROWLOCK) 
		WHERE uidAccessorID = @uidAccessorID
		OPTION (KEEPFIXED PLAN) 
	END
	ELSE
	BEGIN
		UPDATE OperationsProgress
		SET nFailedCount = nFailedCount + @nNumOperatedOn
		FROM OperationsProgress WITH (ROWLOCK) 
		WHERE uidAccessorID = @uidAccessorID
		OPTION (KEEPFIXED PLAN) 
	END

GO
GRANT EXEC ON [dbo].[ops_UpdateBulkOperationsProgress] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_UpdateBulkOperationsProgress] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_OperateOnInstances]
@snOperation smallint,
@fMultiMessagebox tinyint,  -- 0 is no multi-msgbox
@uidInstanceID uniqueidentifier,
@nvcApplication nvarchar(256),
@snApplicationOperator smallint,
@nvcHost nvarchar(128),
@snHostOperator smallint,
@nServiceClass int,
@snServiceClassOperator smallint,
@uidServiceType uniqueidentifier,
@snServiceTypeOperator smallint,
@nStatus int,
@snStatusOperator smallint,
@nPendingOperation int,
@snPendingOperationOperator smallint,
@dtPendingOperationTimeFrom datetime,
@dtPendingOperationTimeUntil datetime,
@dtStartFrom datetime,
@dtStartUntil datetime,
@nvcErrorCode nvarchar(512),
@snErrorCodeOperator smallint,
@nvcErrorDescription nvarchar(1024),
@snErrorDescriptionOperator smallint,
@nvcURI nvarchar(512),
@snURIOperator smallint,
@dtStartSuspend datetime,
@dtEndSuspend datetime,
@nvcAdapter nvarchar(512),
@snAdapterOperator smallint,
@nGroupingCriteria int, 
@nGroupingMinCount int,
@nMaxMatches int,
@uidAccessorID uniqueidentifier,
@nIsMasterMsgBox int 
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low


/*
@snOperation indicates what actions to take on the instances defined by the filter parameters. It has the following meanings:
	0 = return the instance list as the user just wanted the information
	1 = resume the instances. This fails if the status parameter is not suspended
	2 = suspend the instances. This fails if the status parameter is set to suspended
	3 = terminate the instances.

	If an operation is performed, we will return a count of all of the instances we acted upon broken down into whether a control message was
	sent or whether the operation succeeded. If an instance id is passed in, the following is used to describe what happened
		 0, Control message needs to be sent
		 1, Preemptively operated on the instance
		 2, Lock instance failed. This will only be returned if their is already a pending operation and we cant lock the instance
		 3, Bad instance. Instance does not exist in the database. This would imply the instance completed, so lets just delete the record
		 4, Operation cannot be performed for instance in this state

*/

declare @tsql nvarchar(4000),
	@snOperationSpid smallint

	--Applies to select, group and bulk ops, for Cancel functionality
	set @snOperationSpid = @@SPID
	INSERT INTO OperationsProgress WITH (ROWLOCK) (uidAccessorID, snSpid) VALUES (@uidAccessorID, @snOperationSpid)

IF (@snStatusOperator <> 0 AND (4 = @nStatus OR 32 = @nStatus OR 36 = @nStatus))
BEGIN
-- Only looking at suspended instances

	exec ops_BuildInstanceSuspendedQuery 	@snOperation,  --0 is enumerate, 1 is susp, 2 is term, 3 is res, 4 is resume in debug mode, 5 is grouping
						@fMultiMessagebox,
						@uidInstanceID,
						@nvcApplication,
						@snApplicationOperator,
						@nvcHost,
						@snHostOperator,
						@nServiceClass,
						@snServiceClassOperator,
						@uidServiceType,
						@snServiceTypeOperator,
						@nStatus,
						@snStatusOperator,
						@nPendingOperation,
						@snPendingOperationOperator,
						@dtPendingOperationTimeFrom,
						@dtPendingOperationTimeUntil,
						@dtStartFrom,
						@dtStartUntil,
						@nvcErrorCode,
						@snErrorCodeOperator,
						@nvcErrorDescription,
						@snErrorDescriptionOperator,
						@nvcURI,
						@snURIOperator,
						@dtStartSuspend,
						@dtEndSuspend,	
						@nvcAdapter,
						@snAdapterOperator,					
						@nGroupingCriteria, 
						@nGroupingMinCount,
						@nMaxMatches, 												
						@uidAccessorID,						
						@tsql OUTPUT

END
ELSE
BEGIN
	exec ops_BuildInstanceQuery 	@snOperation,  --0 is enumerate, 1 is susp, 2 is term, 3 is res, 4 is resume in debug mode, 5 is grouping
					@fMultiMessagebox,
					@uidInstanceID,
					@nvcApplication,
					@snApplicationOperator,
					@nvcHost,
					@snHostOperator,
					@nServiceClass,
					@snServiceClassOperator,
					@uidServiceType,
					@snServiceTypeOperator,
					@nStatus,
					@snStatusOperator,
					@nPendingOperation,
					@snPendingOperationOperator,
					@dtPendingOperationTimeFrom,
					@dtPendingOperationTimeUntil,
					@dtStartFrom,
					@dtStartUntil,
					@nvcErrorCode,
					@snErrorCodeOperator,
					@nvcErrorDescription,
					@snErrorDescriptionOperator,
					@nvcURI,
					@snURIOperator,
					@dtStartSuspend,
					@dtEndSuspend,					 
					@nvcAdapter,
					@snAdapterOperator,
					@nGroupingCriteria,
					@nGroupingMinCount,
					@nMaxMatches, 										
					@uidAccessorID,					
					@tsql OUTPUT
END

-- Suspended and non-suspended instance queries have same behavior from here on

declare @params nvarchar(256)
set @params = N'@Adapter nvarchar(512), @URI nvarchar(512), @ErrorCode nvarchar(512), @ErrorDescription nvarchar(1024), @Application nvarchar(256)'

if (@snOperation = 0 OR @snOperation = 5) --enumerating instances or grouping
BEGIN
	exec sp_executesql @tsql, @params, @Adapter = @nvcAdapter, @URI = @nvcURI, @ErrorCode = @nvcErrorCode, @ErrorDescription = @nvcErrorDescription, @Application = @nvcApplication	
END
else
BEGIN

	declare @instanceID uniqueidentifier,
		@serviceID uniqueidentifier,
		@classID uniqueidentifier,
		@nReturn int,				
		@nvcSprocName nvarchar(1024),
		@hostName nvarchar(128),
		@dtTimeStamp datetime,		
		@nvcInstanceIDInUserState nchar(36),
		@nvcHead nchar(1),
		@nvcTail nchar(1),
		@nvcFormattedInstanceIDInUserState nchar(38),		
		@nDeletedRFRs int, 
		@uidRFRClassID uniqueidentifier,
		@dtOperationStartTime datetime,
		@nWraparoundOperatedOnInstancesCount int
		
	CREATE TABLE #Instances (uidInstanceID uniqueidentifier,
				 uidClassID uniqueidentifier,
				 uidServiceID uniqueidentifier,
				 nvcHostName nvarchar(128) )	

	set @uidRFRClassID = [dbo].[MBOM_fnGetServiceClassID]( 64 ) 
	set @nvcHead = N'{'
	set @nvcTail = N'}'	

	set @nWraparoundOperatedOnInstancesCount = 0 

	INSERT INTO #Instances (uidInstanceID, uidClassID, uidServiceID, nvcHostName)
	exec sp_executesql @tsql, @params, @Adapter = @nvcAdapter, @URI = @nvcURI, @ErrorCode = @nvcErrorCode, @ErrorDescription = @nvcErrorDescription, @Application = @nvcApplication

	set @dtOperationStartTime = GetUTCDate()

	declare InstanceCursor cursor FOR
	select uidInstanceID, uidClassID, uidServiceID, nvcHostName from #Instances
	
	open InstanceCursor
	FETCH NEXT FROM InstanceCursor INTO @instanceID, @classID, @serviceID, @hostName 

	WHILE (@@FETCH_STATUS = 0)
	BEGIN	
		set @nReturn = 0
		set @dtTimeStamp = GetUTCDate()
		set @nvcInstanceIDInUserState = CAST(@instanceID as nchar(36))
		set @nvcFormattedInstanceIDInUserState = @nvcHead + @nvcInstanceIDInUserState + @nvcTail 

		IF (@hostName = N'' OR (@hostName IS NULL))
		BEGIN
			set @nReturn = 5   -- Treating this as a skipped instance
		END
		ELSE
		BEGIN
			set @nvcSprocName = N'bts_AdminPreemptiveOperateOnInstances_' + @hostName + ' ' 
			exec @nvcSprocName @snOperation, 1, @instanceID, @serviceID, @classID, @nReturn OUTPUT
		END
		
		--For pending(0), succeeded(1), skipped(5) and failed(all others)	
		exec ops_UpdateBulkOperationsProgress @uidAccessorID, 1, @nReturn

		--Exclude routing failure reports. The data in InstancesOperatedOn will be used when operating on the instance on the master
		--Exclude if this msgbox is the master (@nIsMasterMsgBox value is 1)		
		IF ((@snOperation = 2 OR @snOperation = 3 OR @snOperation = 4) AND (@nIsMasterMsgBox = 0) AND (@classID <> @uidRFRClassID))
		BEGIN
			INSERT INTO InstancesOperatedOn (uidInstanceID, uidClassID, uidServiceID, nvcHostName, uidAccessorID, snOperation, dtOperationStartTime) VALUES (@instanceID, @classID, @serviceID, @hostName, @uidAccessorID, @snOperation, @dtOperationStartTime)
			set @nWraparoundOperatedOnInstancesCount = @nWraparoundOperatedOnInstancesCount + 1
		END

		--RFRs exist only on the master. Delete RFRs associated with the terminated, resumed or resumed in debug mode instance.
		IF ((@snOperation = 2 OR @snOperation = 3 OR @snOperation = 4) AND (@nIsMasterMsgBox = 1) AND (@classID <> @uidRFRClassID))
		BEGIN				

			BEGIN TRANSACTION 

			-- nvcUserState value in Instances and InstancesSuspended tables are kept in sync			
			DELETE FROM Instances 
			WHERE uidInstanceID IN (SELECT ist.uidInstanceID 
			FROM InstancesSuspended ist WITH (ROWLOCK INDEX(IX_InstancesSuspended_UserState)) 
			WHERE ist.nvcUserState = @nvcFormattedInstanceIDInUserState AND ist.dtCreated < @dtOperationStartTime) 
			OPTION (KEEPFIXED PLAN)

			DELETE FROM InstancesSuspended FROM InstancesSuspended WITH (ROWLOCK INDEX(IX_InstancesSuspended_UserState)) 
			WHERE nvcUserState = @nvcFormattedInstanceIDInUserState AND dtCreated < @dtOperationStartTime 
			OPTION (KEEPFIXED PLAN)

			SET @nDeletedRFRs = @@ROWCOUNT

			IF (@snOperation = 2)
			BEGIN   -- RFR counts are only updated in terminate case, though they are removed in resume and resume in debug mode cases as well
				exec ops_UpdateBulkOperationsProgress @uidAccessorID, @nDeletedRFRs, 1 /*Succeeded*/
			END

			COMMIT TRANSACTION 
		END	

		FETCH NEXT FROM InstanceCursor INTO @instanceID, @classID, @serviceID, @hostName 		
	END

	close InstanceCursor
	deallocate InstanceCursor

	SELECT nSucceededCount, nFailedCount, nPendingCount, nSkippedCount
	FROM OperationsProgress WITH (ROWLOCK)
	WHERE uidAccessorID = @uidAccessorID
	OPTION (KEEPFIXED PLAN)
			
END

--Applies to select, grouping and bulk ops
DELETE FROM OperationsProgress WITH (ROWLOCK) 
WHERE uidAccessorID = @uidAccessorID OPTION (KEEPFIXED PLAN)

RETURN
GO
GRANT EXEC ON [dbo].[ops_OperateOnInstances] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_OperateOnInstances] TO BTS_OPERATORS
GO  


--Terminate, resume, resume in debug mode are allowable @snOperation values
--This sproc is run on the local msgbox and accesses the master msgbox via linked server. The execs in this sproc are 
--done on the master msgbox. The checks to see if it has already been added as a linked server is done in ops_OperateOnInstances
--In that sproc, bts_SafeAddLinkedServer handles the actual exec ap_addlinkedserver @nvcMasterMsgBoxServerName,
--but need to do it here as well in case the job is run independently of the bulk Ops being called 
CREATE PROCEDURE [dbo].[ops_OperateOnInstancesOnMasterMsgBox]
@nvcMasterMsgBoxServer sysname,
@nvcMasterMsgBoxDb sysname 
AS 

set transaction isolation level read committed
set nocount on
set deadlock_priority low


declare @nvcSprocName nvarchar(1024),
	@nReturn int,	
	@nvcFormattedInstanceIDInUserState nchar(38),		
	@nvcHead nchar(1),
	@nvcTail nchar(1),
	@nvcInstanceIDInUserState nchar(36),	 
	@uidRFRClassID uniqueidentifier,
	@snOperation smallint,
	@uidInstanceID uniqueidentifier,
	@uidClassID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@nvcHostName nvarchar(128),	
	@nvcRFRDeletionCommand nvarchar(1024),
	@dtOperationStartTime datetime 

	set @uidRFRClassID = [dbo].[MBOM_fnGetServiceClassID]( 64 ) 
	set @nvcHead = N'{'
	set @nvcTail = N'}'		

--exec  sp_getapplock 'OperateOnInstancesOnMasterMsgBoxJobIsRunning', 'Exclusive' , 'Session'  

--WHILE (1 = 1)
--BEGIN

	exec bts_SafeAddLinkedServer @nvcMasterMsgBoxServer  --add master msgbox as linked server
	IF (@@ERROR <> 0)
	BEGIN
		RETURN
	END

	DECLARE InstanceCursor cursor FOR
	SELECT uidInstanceID, uidClassID, uidServiceID, nvcHostName, snOperation, dtOperationStartTime
	FROM InstancesOperatedOn 
	WHERE snOperation <> 21  --clause required for upgrade situation - rows existing prior to upgrade will not be operated on
	
	open InstanceCursor
	FETCH NEXT FROM InstanceCursor INTO @uidInstanceID, @uidClassID, @uidServiceID, @nvcHostName, @snOperation, @dtOperationStartTime

	WHILE (@@FETCH_STATUS = 0)
	BEGIN			

		set @nvcInstanceIDInUserState = CAST(@uidInstanceID as nchar(36))
		set @nvcFormattedInstanceIDInUserState = @nvcHead + @nvcInstanceIDInUserState + @nvcTail  		
	
		--This call calls terminate on the instance on the master. 		
		--RFRs exist only on the master. Delete RFRs associated with the terminated, resumed or resumed in debug mode instance.
		--Potentially obsolete if-clause check since instances which have had a suspend operation done on them now 
		--will not be put into the InstancesOperatedOn table.

		--IF ((@snOperation = 2 OR @snOperation = 3 OR @snOperation = 4) AND (@uidClassID <> @uidRFRClassID))
		--BEGIN				
			-- Deletion has to be done like this otherwise the index hint will cause a SQL error which states
			-- 'Cannot specify an index or locking hint for a remote data source'
			set @nvcSprocName = @nvcMasterMsgBoxServer + N'.' + @nvcMasterMsgBoxDb + N'.dbo.ops_OperateOnInstanceOnMasterMsgBox '
			exec @nvcSprocName @snOperation, @uidInstanceID, @uidServiceID, @nvcHostName, @nvcFormattedInstanceIDInUserState, @dtOperationStartTime	

			IF (@@ERROR <> 0)
			BEGIN
				-- Move to the next instance and do not delete this one 				
				FETCH NEXT FROM InstanceCursor INTO @uidInstanceID, @uidClassID, @uidServiceID, @nvcHostName, @snOperation, @dtOperationStartTime  
				CONTINUE 
			END
		--END			
		
		DELETE FROM InstancesOperatedOn FROM InstancesOperatedOn WITH (ROWLOCK INDEX(IX_InstancesOperatedOn_Instance)) WHERE uidInstanceID = @uidInstanceID AND snOperation = @snOperation AND nvcHostName = @nvcHostName OPTION (KEEPFIXED PLAN) 									
		FETCH NEXT FROM InstanceCursor INTO @uidInstanceID, @uidClassID, @uidServiceID, @nvcHostName, @snOperation, @dtOperationStartTime  
	END

	close InstanceCursor
	deallocate InstanceCursor			

--END

--exec  sp_releaseapplock 'OperateOnInstancesOnMasterMsgBoxJobIsRunning' , 'Session'

GO
GRANT EXEC ON [dbo].[ops_OperateOnInstancesOnMasterMsgBox] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_OperateOnInstancesOnMasterMsgBox] TO BTS_OPERATORS
GO 

CREATE PROCEDURE [dbo].[ops_OperateOnInstanceOnMasterMsgBox] 
@snOperation smallint, 
@uidInstanceID uniqueidentifier, 
@uidServiceID uniqueidentifier, 
@nvcHostName nvarchar(128), 
@nvcFormattedInstanceIDInUserState nchar(38),
@dtOperationStartTime datetime

AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	declare @nReturn int,
		@nvcSprocName nvarchar(1024),
		@nStartedTrans int
	

	IF (@@TRANCOUNT = 0)
	BEGIN
		BEGIN TRANSACTION
		set @nStartedTrans = 1
	END

	--Terminate: Only doing terminate and not suspend/resume so as to be in sync with engine runtime behavior
	--Execute the terminate directly - results mainly in convoy set deletion in case of terminate	
	IF (@snOperation = 2)	
	BEGIN
		set @nvcSprocName = N'int_AdminTerminateInstance_' + @nvcHostName + ' ' 				
		exec @nvcSprocName @uidInstanceID, @uidServiceID, @nReturn OUTPUT	
	END


	-- Delete RFRs	
	IF EXISTS (SELECT TOP 1 1 FROM InstancesSuspended WITH (ROWLOCK INDEX(IX_InstancesSuspended_UserState)) 
			WHERE nvcUserState = @nvcFormattedInstanceIDInUserState AND dtCreated < @dtOperationStartTime)
	BEGIN

		-- If clause prevents accessing Instances table when not required
		-- nvcUserState value in Instances and InstancesSuspended tables are kept in sync

		DELETE FROM Instances 
		WHERE uidInstanceID IN (SELECT ist.uidInstanceID 
		FROM InstancesSuspended ist WITH (ROWLOCK INDEX(IX_InstancesSuspended_UserState)) 
		WHERE ist.nvcUserState = @nvcFormattedInstanceIDInUserState AND ist.dtCreated < @dtOperationStartTime) 
		OPTION (KEEPFIXED PLAN) 

		DELETE FROM InstancesSuspended FROM InstancesSuspended WITH (ROWLOCK INDEX(IX_InstancesSuspended_UserState)) 
		WHERE nvcUserState = @nvcFormattedInstanceIDInUserState AND dtCreated < @dtOperationStartTime
		OPTION (KEEPFIXED PLAN) 
	END

	--The number of deleted instances is the deleted RFR count. Due to double hop authentication issue 
	--when using linked server, the RFR count can't be returned to the slave msgbox. nReturn is not currently 
	--used due to linked server/double hop authentication 

	IF (@nStartedTrans > 0)
	BEGIN
		COMMIT TRANSACTION			
	END

GO
GRANT EXEC ON [dbo].[ops_OperateOnInstanceOnMasterMsgBox] TO BTS_SQLAGENT_USER 
GO 


CREATE PROCEDURE [dbo].[ops_GetOperationProgress]
@uidTargetSpid uniqueidentifier
AS	

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	SELECT nSucceededCount, nFailedCount, nPendingCount, nSkippedCount
	FROM OperationsProgress WITH (ROWLOCK)
	WHERE uidAccessorID = @uidTargetSpid
	OPTION (KEEPFIXED PLAN)

GO
GRANT EXEC ON [dbo].[ops_GetOperationProgress] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_GetOperationProgress] TO BTS_OPERATORS
GO


CREATE PROCEDURE [dbo].[ops_ClearOperationsProgress] 
@uidAccessorID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

DELETE FROM OperationsProgress WITH (ROWLOCK) 
WHERE uidAccessorID = @uidAccessorID OPTION (KEEPFIXED PLAN)

GO 
GRANT EXEC ON [dbo].[ops_ClearOperationsProgress] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_ClearOperationsProgress] TO BTS_OPERATORS
GO

-- ops_LoadSubscriptions and ops_LoadSubscriptionPredicates are based on bts_ReadSubscriptions fn
CREATE PROCEDURE [dbo].[ops_LoadSubscriptions]
@fMultiMessagebox tinyint,  -- not including this field for now
@uidInstanceID uniqueidentifier,
@uidServiceType uniqueidentifier,
@snServiceTypeOperator smallint,
@nSubscriptionType int,
@uidAccessorID uniqueidentifier,
@nMaxMatches int,
@nSubscriptionCount int OUTPUT
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @tsql nvarchar(4000),
	@fFirstClause tinyint,
	@AND nchar(5),
	@snOperationSpid smallint

	set @AND = N'AND '
	set @fFirstClause = 1
	set @nSubscriptionCount = 0

	--For Cancel functionality	
	set @snOperationSpid = @@SPID
	INSERT INTO OperationsProgress WITH (ROWLOCK) (uidAccessorID, snSpid) VALUES (@uidAccessorID, @snOperationSpid)

	-- Activation subscriptions 
	IF (@uidInstanceID <> N'{00000000-0000-0000-0000-000000000000}' AND @nSubscriptionType = 1)
	BEGIN
		return
	END

	set @tsql = N'SELECT TOP ' + CAST(@nMaxMatches as nvarchar(16)) + ' ' + N'uidServiceID, uidInstanceID, uidClassID, fEnabled, dtTimeStamp, uidSubID, nvcApplicationName, dtStartWindow, dtEndWindow, dtValid, fOrderedDelivery, fIsRequestResponse, snPriority, nvcName, uidPortID, uidPredicateGroupID, uidConvoySetID, vtConvoySetProp1DefVal, vtConvoySetProp2DefVal, vtConvoySetProp3DefVal, fCanActivateConvoySet FROM Subscription s '

	IF (@uidServiceType <> N'{00000000-0000-0000-0000-000000000000}')
	BEGIN
		exec ops_AppendClauseToQueryString @uidServiceType, @snServiceTypeOperator, N's.uidServiceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

 	IF (@uidInstanceID <> N'{00000000-0000-0000-0000-000000000000}')
	BEGIN
		-- only supporting equals operation for @uidInstanceID
		exec ops_AppendClauseToQueryString @uidInstanceID, 1, N's.uidInstanceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	IF (@nSubscriptionType = 1)  -- Activation subscriptions
	BEGIN 
		exec ops_AppendClauseToQueryString NULL, 4, N's.uidInstanceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	ELSE IF (@nSubscriptionType = 2) --Instance subscriptions
	BEGIN
		exec ops_AppendClauseToQueryString NULL, 5/*IsNotNull*/, N's.uidInstanceID', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END 

	set @tsql = @tsql + ' ORDER BY s.dtTimeStamp DESC'

	exec (@tsql)
	set @nSubscriptionCount = @@ROWCOUNT

	DELETE FROM OperationsProgress WITH (ROWLOCK) 
	WHERE uidAccessorID = @uidAccessorID 
	OPTION (KEEPFIXED PLAN) 

GO
GRANT EXEC ON [dbo].[ops_LoadSubscriptions] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadSubscriptions] TO BTS_OPERATORS
GO	

CREATE PROCEDURE [dbo].[ops_LoadSubscriptionPredicates]
@nSubscriptionPredicateCount int OUTPUT
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	set @nSubscriptionPredicateCount = 0

SELECT  t3.uidPropID, t3.snComparison, t3.vtValue, t3.uidPredicateGroupID, t3.uidSubID
FROM (
     SELECT t1.uidPropID, t1.snComparison, t1.vtValue, t1.uidPredicateGroupID, t1.uidSubID
     FROM
     (
	SELECT ep.uidPropID, 0 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM EqualsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID
	UNION ALL
	SELECT ep.uidPropID, 0 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM EqualsPredicates2ndPass AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID
	UNION ALL
	SELECT ep.uidPropID, 1 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM LessThanPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 2 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM LessThanOrEqualsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 3 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM GreaterThanPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 4 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM GreaterThanOrEqualsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 5 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM NotEqualsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	UNION ALL
	SELECT ep.uidPropID, 6 AS snComparison, NULL AS vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM ExistsPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID
	UNION ALL
	SELECT ep.uidPropID, 7 AS snComparison, ep.vtValue, ep.uidPredicateGroupID, s.uidSubID, s.fEnabled
	FROM BitwiseANDPredicates AS ep WITH (ROWLOCK), Subscription AS s WITH (ROWLOCK), PredicateGroup AS pg WITH (ROWLOCK)
	WHERE ep.uidPredicateGroupID = pg.uidPredicateANDGroupID AND
		pg.uidPredicateORGroupID = s.uidPredicateGroupID	
	
     ) AS t1

     UNION ALL
     
     SELECT cs.uidPropertyID1, [dbo].[bts_fnCheckForConvoySetInstanceExistance](s.uidConvoySetID, s.uidInstanceID), csi.vtProp1, pg.uidPredicateANDGroupID, s.uidSubID
     FROM ConvoySets cs WITH (ROWLOCK), PredicateGroup pg WITH (ROWLOCK), Subscription s WITH (ROWLOCK)
     LEFT JOIN ConvoySetInstances csi  WITH (ROWLOCK) ON s.uidConvoySetID = csi.uidConvoySetID AND s.uidInstanceID = csi.uidInstanceID
     WHERE     s.uidConvoySetID IS NOT NULL AND
	       s.vtConvoySetProp1DefVal IS NULL AND
	       s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
	       s.uidConvoySetID = cs.uidConvoySetID
	       
	 UNION ALL
     
     SELECT cs.uidPropertyID2, [dbo].[bts_fnCheckForConvoySetInstanceExistance](s.uidConvoySetID, s.uidInstanceID), csi.vtProp2, pg.uidPredicateANDGroupID, s.uidSubID
     FROM ConvoySets cs WITH (ROWLOCK), PredicateGroup pg WITH (ROWLOCK), Subscription s WITH (ROWLOCK)
     LEFT JOIN ConvoySetInstances csi WITH (ROWLOCK) ON s.uidConvoySetID = csi.uidConvoySetID AND s.uidInstanceID = csi.uidInstanceID
     WHERE     s.uidConvoySetID IS NOT NULL AND
	       s.vtConvoySetProp2DefVal IS NULL AND
	       s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
	       s.uidConvoySetID = cs.uidConvoySetID AND
	       cs.uidPropertyID2 IS NOT NULL
	       
	 UNION ALL
     
     SELECT cs.uidPropertyID3, [dbo].[bts_fnCheckForConvoySetInstanceExistance](s.uidConvoySetID, s.uidInstanceID), csi.vtProp3, pg.uidPredicateANDGroupID, s.uidSubID
     FROM ConvoySets cs WITH (ROWLOCK), PredicateGroup pg WITH (ROWLOCK), Subscription s WITH (ROWLOCK)
     LEFT JOIN ConvoySetInstances csi WITH (ROWLOCK) ON s.uidConvoySetID = csi.uidConvoySetID AND s.uidInstanceID = csi.uidInstanceID
     WHERE     s.uidConvoySetID IS NOT NULL AND
	       s.vtConvoySetProp3DefVal IS NULL AND
	       s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
	       s.uidConvoySetID = cs.uidConvoySetID AND
	       cs.uidPropertyID3 IS NOT NULL
) as t3 

	set @nSubscriptionPredicateCount = @@ROWCOUNT

GO
GRANT EXEC ON [dbo].[ops_LoadSubscriptionPredicates] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadSubscriptionPredicates] TO BTS_OPERATORS
GO

-- For Messages enumeration cf MBOM_LookupMessageReferences

CREATE PROCEDURE [dbo].[ops_LoadMessages]

@fMultiMessagebox tinyint,  -- 0 for now. Unused.
@uidInstanceID uniqueidentifier,
@uidMessageID uniqueidentifier,
@uidReferenceID uniqueidentifier,
--@nvcApplication nvarchar(128),  --app not reqd for messages
--@snApplicationOperator smallint,
@nvcHost nvarchar(128),
@snHostOperator smallint,
@nServiceClass int,
@snServiceClassOperator smallint,
@uidServiceType uniqueidentifier,
@snServiceTypeOperator smallint,
@nInstanceStatus int,
@snInstanceStatusOperator smallint,

@dtStartFrom datetime,
@dtStartUntil datetime,
@nvcErrorCode nvarchar(512),
@snErrorCodeOperator smallint,
@nvcErrorDescription nvarchar(1024),
@snErrorDescriptionOperator smallint,

@nMessageStatus int,
@snMessageStatusOperator smallint,
@nvcMessageType nvarchar(256), --schema namespace
@snMessageTypeOperator smallint,
@nvcURI nvarchar(512),
@snURIOperator smallint,
@nvcAdapter nvarchar(512),
@snAdapterOperator smallint,
@uidAccessorID uniqueidentifier,

@nMaxMatches int,
@nMessageCount int OUTPUT

AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	declare @nvcSprocName nvarchar(1024),
	@snOperationSpid smallint

	--For Cancel functionality
	set @snOperationSpid = @@SPID
	INSERT INTO OperationsProgress WITH (ROWLOCK) (uidAccessorID, snSpid) VALUES (@uidAccessorID, @snOperationSpid)

	create table #TempMessages (
						nMessageState int, 
						nvcHost nvarchar(128), 
						uidMessageID uniqueidentifier, 
						uidReferenceID uniqueidentifier,
						uidInstanceID uniqueidentifier, 
						uidServiceID uniqueidentifier, 
						uidClassID uniqueidentifier,
						nInstanceState smallint,
						nRetryCount int,						
						nvcErrorID nvarchar(512),
						nvcErrorDescription nvarchar(1024),
						nvcMessageType nvarchar(256),
						nvcUserState nvarchar(256),
						nvcAdapter nvarchar(512),
						nvcURI nvarchar(512),
						uidPortID uniqueidentifier,
						fOrderedDelivery int
	)
						
	IF ( (@nvcHost IS NOT NULL) AND (@snHostOperator <> 0) )

	BEGIN	
		set @nvcSprocName = N'ops_LoadMessageReferencesPerHost_' + @nvcHost + ' ' 		
		insert into #TempMessages exec @nvcSprocName @fMultiMessagebox, @uidInstanceID, @uidMessageID, @uidReferenceID, @nvcHost, @snHostOperator, @nServiceClass, @snServiceClassOperator, @uidServiceType, @snServiceTypeOperator, @nInstanceStatus, @snInstanceStatusOperator, @dtStartFrom, @dtStartUntil, @nvcErrorCode, @snErrorCodeOperator, @nvcErrorDescription, @snErrorDescriptionOperator, @nMessageStatus, @snMessageStatusOperator, @nvcMessageType, @snMessageTypeOperator, @nvcURI, @snURIOperator, @nvcAdapter, @snAdapterOperator, @nMaxMatches, @nMessageCount OUTPUT
	END
	ELSE
	BEGIN
		declare @nvcCurrentHost nvarchar(128)
		declare HostCursor cursor for select nvcApplicationName from Applications

		open HostCursor
		fetch next from HostCursor into @nvcCurrentHost
	
		while(@@FETCH_STATUS = 0)
		BEGIN
			set @nvcSprocName = N'ops_LoadMessageReferencesPerHost_' + @nvcCurrentHost + ' ' 
			insert into #TempMessages exec @nvcSprocName @fMultiMessagebox, @uidInstanceID, @uidMessageID, @uidReferenceID, @nvcHost, @snHostOperator, @nServiceClass, @snServiceClassOperator, @uidServiceType, @snServiceTypeOperator, @nInstanceStatus, @snInstanceStatusOperator, @dtStartFrom, @dtStartUntil, @nvcErrorCode, @snErrorCodeOperator, @nvcErrorDescription, @snErrorDescriptionOperator, @nMessageStatus, @snMessageStatusOperator, @nvcMessageType, @snMessageTypeOperator, @nvcURI, @snURIOperator, @nvcAdapter, @snAdapterOperator, @nMaxMatches, @nMessageCount OUTPUT

			fetch next from HostCursor into @nvcCurrentHost
		END
		
		close HostCursor
		deallocate HostCursor

	END	
	
	-- vf maxMatches logic
	if (@nMaxMatches > 0)
		set ROWCOUNT @nMaxMatches
	
	--Context is returned as NULL
	SELECT tm.nMessageState, tm.nvcHost, tm.uidMessageID, tm.uidReferenceID, tm.uidInstanceID, tm.uidServiceID, 
	       tm.uidClassID, tm.nInstanceState, tm.nRetryCount, tm.nvcErrorID, tm.nvcErrorDescription, tm.nvcMessageType,
	       s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, s.nNumParts, s.nvcBodyPartName, s.uidBodyPartID, 
	       NULL, tm.nvcUserState, tm.nvcAdapter, tm.nvcURI, tm.uidPortID, tm.fOrderedDelivery  	
	FROM #TempMessages as tm,
		Spool as s WITH (ROWLOCK READPAST)
	WHERE  	tm.uidMessageID = s.uidMessageID 	

	ORDER BY s.dtTimeStamp DESC

	set ROWCOUNT 0

	DELETE FROM OperationsProgress WITH (ROWLOCK) 
	WHERE uidAccessorID = @uidAccessorID 
	OPTION (KEEPFIXED PLAN) 

	RETURN

GO
GRANT EXEC ON [dbo].[ops_LoadMessages] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadMessages] TO BTS_OPERATORS
GO


CREATE PROCEDURE [dbo].[ops_LoadPrimaryFailedMessage]
@uidInstanceID uniqueidentifier,
@nvcHost nvarchar(128)
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low


	declare @nvcSprocName nvarchar(1024)

	create table #TempMessages (
						nMessageState int, 
						nvcHost nvarchar(128), 
						uidMessageID uniqueidentifier, 
						uidReferenceID uniqueidentifier,
						uidInstanceID uniqueidentifier, 
						uidServiceID uniqueidentifier, 
						uidClassID uniqueidentifier,
						nInstanceState smallint,
						nRetryCount int,						
						nvcErrorID nvarchar(512),
						nvcErrorDescription nvarchar(1024),
						nvcMessageType nvarchar(256),
						nvcUserState nvarchar(256),
						nvcAdapter nvarchar(512),
						nvcURI nvarchar(512),
						uidPortID uniqueidentifier,
						fOrderedDelivery int
	)

						
	IF (@nvcHost IS NOT NULL)
	BEGIN	
		set @nvcSprocName = N'ops_LoadPrimaryFailedMessagePerHost_' + @nvcHost + ' ' 		
		insert into #TempMessages exec @nvcSprocName @uidInstanceID
	END


	--Context is returned as NULL
	SELECT tm.nMessageState, tm.nvcHost, tm.uidMessageID, tm.uidReferenceID, tm.uidInstanceID, tm.uidServiceID, 
	       tm.uidClassID, tm.nInstanceState, tm.nRetryCount, tm.nvcErrorID, tm.nvcErrorDescription, tm.nvcMessageType,
	       s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, s.nNumParts, s.nvcBodyPartName, s.uidBodyPartID, 
	       NULL, tm.nvcUserState, tm.nvcAdapter, tm.nvcURI, tm.uidPortID, tm.fOrderedDelivery  	
	FROM #TempMessages as tm,
		Spool as s WITH (ROWLOCK READPAST)
	WHERE  	tm.uidMessageID = s.uidMessageID 	

	set ROWCOUNT 0

	RETURN

GO
GRANT EXEC ON [dbo].[ops_LoadPrimaryFailedMessage] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadPrimaryFailedMessage] TO BTS_OPERATORS
GO


CREATE PROCEDURE [dbo].[ops_LoadMessageContext]
@uidMessageID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	SELECT s.imgContext FROM Spool as s WITH (ROWLOCK)
	WHERE s.uidMessageID = @uidMessageID OPTION (KEEPFIXED PLAN)

GO
GRANT EXEC ON [dbo].[ops_LoadMessageContext] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[ops_LoadMessageStatistics]
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	declare @nvcSprocName nvarchar(1024)

	create table #TempMessageStatistics (
		nMessageSuspendedState int, 
		nCount bigint
	)

	declare @nvcCurrentHost nvarchar(128)
	declare HostCursor cursor for select nvcApplicationName from Applications

	open HostCursor
	fetch next from HostCursor into @nvcCurrentHost
	
	while(@@FETCH_STATUS = 0)
	BEGIN
		set @nvcSprocName = 'ops_LoadMessageStatisticsPerHost_' + @nvcCurrentHost + ' ' 
		insert into #TempMessageStatistics exec @nvcSprocName

		fetch next from HostCursor into @nvcCurrentHost
	END
		
	close HostCursor
	deallocate HostCursor

	SELECT tms.nMessageSuspendedState, tms.nCount
	FROM #TempMessageStatistics AS tms
	WITH (ROWLOCK READPAST)

	set ROWCOUNT 0

	RETURN
GO
GRANT EXEC ON [dbo].[ops_LoadMessageStatistics] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadMessageStatistics] TO BTS_OPERATORS
GO


CREATE PROCEDURE [dbo].[ops_AdminDeleteSuspendedMessageRef]
@uidServiceID uniqueidentifier, 
@uidInstanceID uniqueidentifier, 
@uidMessageID uniqueidentifier, 
@nvcHost nvarchar(128),
@fPrimaryFailedMsgInOrderedDeliverySendPort tinyint
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @uidHostID uniqueidentifier,
	@nvcSprocName nvarchar(256),
	@fSuccess int

BEGIN TRANSACTION

IF (@nvcHost IS NOT NULL)
BEGIN
	SELECT TOP 1 @uidHostID = a.uidAppID 
	FROM Applications a WITH (REPEATABLEREAD)
	WHERE a.nvcApplicationName = @nvcHost OPTION (KEEPFIXED PLAN)

	IF (@uidHostID IS NOT NULL)
	BEGIN
		set @nvcSprocName = N'bts_AdminDeleteSuspendedMessageRef_' + @nvcHost + ' ' 
		exec @nvcSprocName @uidServiceID, @uidInstanceID, @uidMessageID, @fSuccess OUTPUT, @fPrimaryFailedMsgInOrderedDeliverySendPort 
	END
END

COMMIT TRANSACTION

GO
GRANT EXEC ON [dbo].[ops_AdminDeleteSuspendedMessageRef] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_AdminDeleteSuspendedMessageRef] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_LoadPart]
@uidMessageID uniqueidentifier,
@nvcPartName nvarchar(256)
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	SELECT  mp.nvcPartName, mp.uidPartID, p.nNumFragments, 
		((case when nPartSize <> -1 then nPartSize 
		ELSE (select sum(nFragmentSize) from Fragments 
		        where uidPartID = p.uidPartID and nNumFragments > 1) END)), 
		p.imgPart, p.imgPropBag	 	 
	FROM	MessageParts mp WITH (ROWLOCK READPAST), Parts p WITH (ROWLOCK)	
	WHERE	mp.uidMessageID = @uidMessageID AND
		p.uidPartID = mp.uidPartID AND
		mp.nvcPartName = @nvcPartName
	
	RETURN 

GO
GRANT EXEC ON [dbo].[ops_LoadPart] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[ops_LoadParts]
@uidMessageID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	select mp.nvcPartName, mp.uidPartID, p.nNumFragments, 
		((case when nPartSize <> -1 then nPartSize 
		ELSE (select sum(nFragmentSize) from Fragments 
  		where uidPartID = p.uidPartID and nNumFragments > 1) END)), 
		p.imgPart, p.imgPropBag
	from 
		MessageParts mp WITH (ROWLOCK READPAST), Parts p WITH (ROWLOCK)
	where
		mp.uidMessageID = @uidMessageID AND
		p.uidPartID = mp.uidPartID 
	
	RETURN 

GO
GRANT EXEC ON [dbo].[ops_LoadParts] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[ops_LoadPartFragment]
@uidPartID uniqueidentifier,
@nFragmentNumber int
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

--the db uses 0 based fragments, but the callers will use one based fragment indexes
--so we will have to compensate


IF (@nFragmentNumber = 1)
BEGIN
	SELECT imgPart FROM Parts where uidPartID = @uidPartID
END
ELSE
BEGIN
	SELECT imgFrag FROM Fragments WHERE uidPartID = @uidPartID AND nFragmentNumber = @nFragmentNumber - 1
END

GO
GRANT EXEC ON [dbo].[ops_LoadPartFragment] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[ops_LoadPartNames]
@uidMessageID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	select mp.nvcPartName
	from 
		MessageParts mp WITH (ROWLOCK READPAST), Parts p WITH (ROWLOCK)
	where
		mp.uidMessageID = @uidMessageID AND
		p.uidPartID = mp.uidPartID 
	
	RETURN 

GO
GRANT EXEC ON [dbo].[ops_LoadPartNames] TO BTS_ADMIN_USERS
GO

-- Turns tracking on for a live message
-- Return value of 1 means that message exists and tracking command was sent, 0 means that message no longer exists
CREATE PROCEDURE [dbo].[ops_TrackMessage]
@uidMessageID uniqueidentifier,
@uidInstanceID uniqueidentifier
AS

set transaction isolation level repeatable read
set nocount on
set deadlock_priority low

declare @snReturn smallint,
	@uidMsgID uniqueidentifier,
	@nvcAppName sysname

set @snReturn = 0


SELECT TOP 1 @nvcAppName = a.nvcApplicationName 
FROM Applications a, Instances i
WHERE i.uidInstanceID = @uidInstanceID AND i.uidAppOwnerID = a.uidAppID

if (@nvcAppName IS NOT NULL)
BEGIN
	BEGIN TRANSACTION
	
	SELECT @uidMsgID = uidMessageID FROM Spool WITH (ROWLOCK) WHERE uidMessageID = @uidMessageID OPTION (KEEPFIXED PLAN)

	IF (@uidMsgID IS NOT NULL)
	BEGIN
		--we need to make sure that if this message was ref'd locally by the associated instance that we move it to the global
		--ref count log now
		declare @tsql nvarchar(256)
		set @tsql = 'int_TrackMessage_' + @nvcAppName
		exec @tsql @uidInstanceID, @uidMessageID
	
		set @snReturn = 1
	END

	COMMIT TRANSACTION
END

SELECT @snReturn

GO
GRANT EXEC ON [dbo].[ops_TrackMessage] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[ops_CancelOperation]
@uidTargetSpid uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @snTargetSpid smallint,
	@tsql nvarchar(100)

set @snTargetSpid = -1
set @tsql = N''

	SELECT @snTargetSpid = snSpid FROM OperationsProgress WITH (ROWLOCK) WHERE uidAccessorID = @uidTargetSpid 
	OPTION (KEEPFIXED PLAN)
	
	IF (@snTargetSpid <> -1)
	BEGIN		
		set @tsql = @tsql + N'KILL ' + CAST(@snTargetSpid AS nvarchar(16))
		exec sp_executesql @tsql		
	END		

GO
GRANT EXEC ON [dbo].[ops_CancelOperation] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_CancelOperation] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetSpoolSize] AS
-- Get AppLock to serialize access to the general counters in case two hosts (in different processes) are trying to access the same info at the same time.
DECLARE @retVal smallint

EXEC  @retVal = sp_getapplock @Resource = 'MsgBoxPerfCounters_SpoolTable', @LockMode = 'Shared', @LockOwner = 'Session'

IF (@retVal = 0 ) -- Lock granted
BEGIN 
	SELECT count (*) from Spool WITH (NOLOCK)
	EXEC sp_releaseapplock @Resource = 'MsgBoxPerfCounters_SpoolTable', @LockOwner = 'Session'
END
ELSE  -- Problem getting lock
BEGIN
	SELECT -1
END
GO
GRANT EXEC ON [dbo].[MsgBoxPerfCounters_GetSpoolSize] TO BTS_HOST_USERS
GO

CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetTrackingDataSize] AS

-- Get AppLock to serialize access to the general counters in case two hosts (in different processes) are trying to access the same info at the same time.
DECLARE @retVal smallint

EXEC  @retVal = sp_getapplock @Resource = 'MsgBoxPerfCounters_TrackingDataTable', @LockMode = 'Shared', @LockOwner = 'Session'

IF (@retVal = 0 ) -- Lock granted
BEGIN 
	SELECT count (*) FROM TrackingData WITH (NOLOCK)
	EXEC sp_releaseapplock @Resource = 'MsgBoxPerfCounters_TrackingDataTable', @LockOwner = 'Session'
END
ELSE  -- Problem getting lock
BEGIN
	SELECT -1
END
GO
GRANT EXEC ON [dbo].[MsgBoxPerfCounters_GetTrackingDataSize] TO BTS_HOST_USERS
GO


CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetTotalInstances] AS

-- Get AppLock so as to serialize access to the general counters in case two hosts (in different processes) are trying to access the same info at the same time.
DECLARE @retVal smallint

EXEC  @retVal = sp_getapplock @Resource = 'MsgBoxPerfCounters_InstancesTable', @LockMode = 'Shared', @LockOwner = 'Session'

IF (@retVal = 0 ) -- Lock granted
BEGIN 
	SELECT count (*) from Instances WITH (NOLOCK)
	EXEC sp_releaseapplock @Resource = 'MsgBoxPerfCounters_InstancesTable', @LockOwner = 'Session'
END
ELSE  -- Problem getting lock
BEGIN
	SELECT -1
END
GO
GRANT EXEC ON [dbo].[MsgBoxPerfCounters_GetTotalInstances] TO BTS_HOST_USERS
GO

CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetPurgeJobInfo] 
@nvcDbServer nvarchar(80),
@nvcDbName nvarchar(128)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SET DEADLOCK_PRIORITY LOW
    

CREATE TABLE #Temp (JobID uniqueidentifier,
                    JobName sysname,
                    Status int,
                    DateStarted int,
                    TimeStarted int,
                    Duration int,
                    OpEmailed nvarchar(20),
                    OpNetSent nvarchar(20),
                    OpPaged nvarchar(20),
                    Retries int,
                    Server nvarchar(80)
                    )

CREATE TABLE #Final ( JobName sysname,
		      Duration int
		    )

CREATE TABLE #TempHistory (JobID uniqueidentifier,
                    JobName sysname,
                    Status int,
                    DateStarted int,
                    TimeStarted int,
                    Duration int,
                    OpEmailed nvarchar(20),
                    OpNetSent nvarchar(20),
                    OpPaged nvarchar(20),
                    Retries int,
                    Server nvarchar(80)
                    )


declare @fullJobName sysname

INSERT INTO #TempHistory
exec ('[msdb]..[sp_help_jobhistory]')

declare MyCursor cursor FAST_FORWARD FOR
SELECT tj.JobName FROM #TempHistory tj
WHERE (tj.JobName LIKE (N'MessageBox_Parts_Cleanup_' + @nvcDbName) OR tj.JobName LIKE (N'MessageBox_DeadProcesses_Cleanup_' + @nvcDbName) OR tj.JobName LIKE (N'MessageBox_Message_Cleanup_' + @nvcDbName) OR tj.JobName LIKE (N'PurgeSubscriptionsJob_' + @nvcDbName) OR tj.JobName LIKE (N'TrackedMessages_Copy_' + @nvcDbName) OR tj.JobName LIKE (N'TrackingSpool_Cleanup_' + @nvcDbName))
AND tj.Server = @nvcDbServer 
GROUP BY tj.JobName 

open MyCursor

FETCH NEXT FROM MyCursor INTO @fullJobName
WHILE (@@FETCH_STATUS = 0)
BEGIN

	INSERT INTO #Temp 	    
	exec ('[msdb]..[sp_help_jobhistory] @job_name = ' + @fullJobName)

	INSERT INTO #Final
	SELECT TOP 1 JobName, Duration FROM #Temp WHERE Server = @nvcDbServer 
	TRUNCATE TABLE #Temp 

	FETCH NEXT FROM MyCursor INTO @fullJobName
END


	SELECT * FROM #Final

	close MyCursor
	deallocate MyCursor

	drop table #Temp
	drop table #Final
	drop table #TempHistory
	

GO
GRANT EXEC ON [dbo].[MsgBoxPerfCounters_GetPurgeJobInfo] TO BTS_HOST_USERS
GO

CREATE PROCEDURE [dbo].[bts_UpdateCopyTrackedMessagesJob]
@trackingDBServer sysname,
@trackingDBName sysname
AS
declare @job_name sysname, @db_name sysname, @command nvarchar(512)

set @db_name = db_name();
set @job_name = N'TrackedMessages_Copy_' + @db_name
set @command = N'exec bts_CopyTrackedMessagesToDTA ''' + @trackingDBServer + ''', ''' + @trackingDBName + '''' 
	
EXECUTE msdb.dbo.sp_delete_jobstep @job_name = @job_name, @step_id = 0
EXECUTE msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_id = 1, @step_name = N'Purge', @command = @command, @database_name = @db_name, @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
EXECUTE msdb.dbo.sp_update_job @job_name= @job_name, @start_step_id = 1

GO
GRANT EXEC ON [dbo].[bts_UpdateCopyTrackedMessagesJob] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[ops_UpdateOperationsOperateOnInstancesOnMasterJob]
@nvcMasterMsgBoxDBServer sysname,
@nvcMasterMsgBoxDBName sysname
AS
declare @job_name sysname, @db_name sysname, @command nvarchar(512)

set @db_name = db_name(); 
set @job_name = N'Operations_OperateOnInstances_OnMaster_' + @db_name
set @command = N'exec ops_OperateOnInstancesOnMasterMsgBox ''' + @nvcMasterMsgBoxDBServer + ''', ''' + @nvcMasterMsgBoxDBName + '''' 
	
EXECUTE msdb.dbo.sp_delete_jobstep @job_name = @job_name, @step_id = 0
EXECUTE msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_id = 1, @step_name = N'OperateOnInstsOnMaster', @command = @command, @database_name = @db_name, @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
EXECUTE msdb.dbo.sp_update_job @job_name= @job_name, @start_step_id = 1

GO
GRANT EXEC ON [dbo].[ops_UpdateOperationsOperateOnInstancesOnMasterJob] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_UpdateOperationsOperateOnInstancesOnMasterJob] TO BTS_OPERATORS 
GO

