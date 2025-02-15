--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 
--/ upgrade for DTA db

--/ QFE 976
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Spool1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	
	IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_Tracking_Spool1')
	BEGIN
		DROP INDEX [Tracking_Spool1].[IX_Tracking_Spool1]
		CREATE NONCLUSTERED INDEX [IX_Tracking_Spool1] ON [dbo].[Tracking_Spool1]([uidMsgID])
		CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool1] ON [dbo].[Tracking_Spool1]([dtTimeStamp], [uidMsgID])
	END
END

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Spool2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_Tracking_Spool2')
	BEGIN
		DROP INDEX [Tracking_Spool2].[IX_Tracking_Spool2]
		CREATE NONCLUSTERED INDEX [IX_Tracking_Spool2] ON [dbo].[Tracking_Spool2]([uidMsgID])
		CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool2] ON [dbo].[Tracking_Spool2]([dtTimeStamp], [uidMsgID])
	END
	
END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessage' AND type = 'TR')
   DROP TRIGGER bts_TrackMessage
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessageParts1' AND type = 'TR')
   DROP TRIGGER bts_TrackMessageParts1
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessageParts2' AND type = 'TR')
   DROP TRIGGER bts_TrackMessageParts2
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessageFragments1' AND type = 'TR')
   DROP TRIGGER bts_TrackMessageFragments1
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessageFragments2' AND type = 'TR')
   DROP TRIGGER bts_TrackMessageFragments2
GO

ALTER TABLE Tracking_Spool1 ALTER COLUMN uidBodyPartID uniqueidentifier NULL
GO

ALTER TABLE Tracking_Spool2 ALTER COLUMN uidBodyPartID uniqueidentifier NULL
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_TrackingMessageReferences')
BEGIN
	DROP INDEX [TrackingMessageReferences].[IX_TrackingMessageReferences]
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_TrackingMessageReferences')
BEGIN
	CREATE  UNIQUE CLUSTERED  INDEX [CIX_TrackingMessageReferences] ON [dbo].[TrackingMessageReferences]([uidMessageID]) WITH IGNORE_DUP_KEY
END
GO

-- 
-- BTF support
--
DECLARE @localized_string_message_status_btf_transmit_success as nvarchar(128)
SET @localized_string_message_status_btf_transmit_success = N'Transmission completed successfully. Waiting for an acknowledgement'

declare @status nvarchar(128)

SELECT 	@status = strStatus
FROM	dta_MessageStatus
WHERE	nMessageStatusId = 9

IF (@status is null)
BEGIN
	INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (9, 	@localized_string_message_status_btf_transmit_success)
END

/*******************************************************************
*****************************************************************/

/**************************************************************************************************
                                                            HWS tracking schema updates begin
**************************************************************************************************/
--only do HWS updates if HWS was installed.
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActionInstances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	if exists (select * from sysindexes where name like N'idx_Hws_ActionInstances_ActivityFlowInternalId_ActivityModelTypeId') 
	BEGIN
		DROP INDEX  [dbo].[Hws_ActionInstances].idx_Hws_ActionInstances_ActivityFlowInternalId_ActivityModelTypeId
	END
	
	exec ('CREATE NONCLUSTERED INDEX idx_Hws_ActionInstances_ActivityFlowInternalId_ActivityModelTypeId ON [dbo].[Hws_ActionInstances]([ActivityFlowInternalID],[ActivityModelTypeID])')
	
END
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ParentActionInstanceActivationBlocks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	if not exists(select * from syscolumns where id = object_id(N'[dbo].[Hws_ParentActionInstanceActivationBlocks]') and name = N'ActivationBlockRootStepID')
	begin
		alter table [dbo].[Hws_ParentActionInstanceActivationBlocks] add ActivationBlockRootStepID int null
	end
end
GO
	
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ParentActionInstanceActivationBlocks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	if (COLUMNPROPERTY(object_id(N'[dbo].[Hws_ParentActionInstanceActivationBlocks]'), N'ActivationBlockRootStepID', 'AllowsNull') = 1 )
	begin
		update [dbo].[Hws_ParentActionInstanceActivationBlocks] set ActivationBlockRootStepID = -1 where ActivationBlockRootStepID is null
	end
end
GO
	
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ParentActionInstanceActivationBlocks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	if (COLUMNPROPERTY(object_id(N'[dbo].[Hws_ParentActionInstanceActivationBlocks]'), N'ActivationBlockRootStepID', 'AllowsNull') = 1 )
	begin
		alter table [dbo].[Hws_ParentActionInstanceActivationBlocks] alter column ActivationBlockRootStepID int not null
	end
end
GO
	
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_ActionInstances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	if exists (select * from sysindexes where name like N'IX_Hws_ParentActionInstanceActivationBlocks') 
	BEGIN
		DROP INDEX  [dbo].[Hws_ParentActionInstanceActivationBlocks].IX_Hws_ParentActionInstanceActivationBlocks
	END

	EXEC ('CREATE INDEX [IX_Hws_ParentActionInstanceActivationBlocks] ON [dbo].[Hws_ParentActionInstanceActivationBlocks]([ParentActionInstanceID])')
END

/**************************************************************************************************
                                                            HWS tracking schema updates end
**************************************************************************************************/
GO

/****************************************************************************************
* Massive Changes as part of PurgeAndArchiveFeaturePack
*********************************************************************************************/


/*********************************************************
*  Lets create the tables we need for the truncate all but the live instance data
***********************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ServiceInstancesTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_ServiceInstancesTemp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInstancesTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_MessageInstancesTemp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInOutEventsTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_MessageInOutEventsTemp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageFieldValuesTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_MessageFieldValuesTemp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_DebugTraceTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_DebugTraceTemp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_CallChainTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_CallChainTemp]
GO


CREATE TABLE [dbo].[dta_ServiceInstancesTemp] (
	[uidActivityId]			[uniqueidentifier] 			NOT NULL,
	[uidServiceInstanceId]		[uniqueidentifier] 			NOT NULL,
	[uidServiceId]			[uniqueidentifier] 			NOT NULL,
	[uidAgentSrvId]			[uniqueidentifier] 			NOT NULL,
	[uidServiceClassId]		[uniqueidentifier] 			NOT NULL,
	[dtStartTime] 			[datetime] 				NOT NULL,
	[dtEndTime] 			[datetime] 				NULL,
	[HRESULT] 			[bigint]				NULL DEFAULT(0),
	[ErrorInfo] 			[ntext] 				NULL,
	[nHostId]			[int]					NOT NULL,
	[nMessageBoxId]			[int]			 		NOT NULL,
	[nServiceStateId]		[int]					NOT NULL,
	[nGroupId]			[int]					NOT NULL,
        [bExceptionsOccurred]   	[int]                       		NOT NULL DEFAULT(0)	

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[dta_MessageInOutEventsTemp] (
	[uidActivityId]			[uniqueidentifier]			NOT NULL,
	[uidServiceInstanceId]		[uniqueidentifier]			NOT NULL,
	[uidMessageInstanceId]		[uniqueidentifier]			NOT NULL,
	[nAdapterId]			[bigint]				NOT NULL,
	[nDecryptionSubjectId]		[int]					NOT NULL,
	[nSigningSubjectId]		[int]					NOT NULL,
	[nUrlId]			[bigint]				NOT NULL,
	[nPartyId]			[bigint]				NOT NULL,
	[nPortId]			[bigint]				NOT NULL,
	[nSchemaId]			[int]					NOT NULL,
	[nPartCount]			[int]					NULL,
	[nMessageSize]			[bigint]				NULL,
	[dtTimestamp]			[datetime] 				NOT NULL,
	[nStatus]			[int] 					NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dta_CallChainTemp] (
	[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
	[vtCallersActionId]		[nvarchar] (60)			NULL,
	[uidCallersServiceId]		[uniqueidentifier]		NULL,
	[nCallersServiceSequence]	[int]				NULL,
	[uidCalleesServiceId]		[uniqueidentifier]		NOT NULL,
	[nCalleesServiceSequence]	[int]				NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dta_DebugTraceTemp] (
	[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
	[vtInstructionId]		[uniqueidentifier]		NOT NULL, 
	[nServiceSequence]		[int]				NOT NULL,
	[nBeginInternalSequence]	[int]				NOT NULL,
	[nEndInternalSequence]		[int]				NOT NULL,
	[dtBeginTimeStamp] 		[datetime]			NOT NULL,
	[dtEndTimeStamp] 		[datetime]			NOT NULL,
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[dta_MessageFieldValuesTemp] (
	[uidMessageInstanceId]		[uniqueidentifier]			NOT NULL,
	[nMessageFieldsId]		[bigint]				NOT NULL,
	[nSchemaId]			[bigint]				NULL,
	[vtValue]			[sql_variant]				NULL,
	[nValueIndex]			[int]					NOT NULL
) ON [PRIMARY]
GO

/**********************************************************
* Drop the views
* Since we are doing some schema level modifications, we want to first drop all referencing views
* we will recreate them at the end of the script
************************************************************/
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_DropViews]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[dtasp_DropViews]
GO

CREATE PROCEDURE [dbo].[dtasp_DropViews]
AS
	--/--------------------------------------------------------------------------------------------------------
	--/	Remove health monitoring related static views
	--/--------------------------------------------------------------------------------------------------------
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_MessageFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_MessageFacts]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_FindMessageFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_FindMessageFacts]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_ServiceFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_ServiceFacts]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_RealNames]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_RealNames]
GO

exec [dbo].[dtasp_DropViews]
GO

/*************************************************
* Create the Archive History table
*************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ArchiveHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[dta_ArchiveHistory]
GO

CREATE TABLE [dbo].[dta_ArchiveHistory](
	[nID] [int] NOT NULL IDENTITY(0,1),
	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetUTCDate()),
	[dtLastFailure] [datetime] NULL,
	[nFailureCount] [int] NOT NULL DEFAULT (0),
	[nSuccess] [int] NOT NULL DEFAULT (0), -- -1 -> failure, 0 -> backup succeeded waiting for restore validation, 1 -> restore validated
	[nvcBackupLocation] [nvarchar](2000) NULL
)
GO

CREATE CLUSTERED INDEX [CIX_dta_ArchiveHistory] ON [dta_ArchiveHistory]([dtTimeStamp] DESC) 
GO

/**********************************************
* Update to the ServiceInstances Table
* We are dropping the Primary Key Constraint on the ActivityID which translates to an index
* We are also dropping the index on the ServiceInstanceID.
* We are combining the two into a single unique clustered index on ServiceInstanceID, ActivityID
* Related changes are made throughout the code to make sure that both values are always available if quering
* is to be done on activity id.
* We are also dropping the index on nServiceStateId as this is not needed
*************************************************/
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_Services_unique_uidActivityId')
BEGIN
	ALTER TABLE [dbo].[dta_ServiceInstances] DROP CONSTRAINT [dta_Services_unique_uidActivityId]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_ServiceInstances_index_uidInstanceId')
BEGIN
	DROP INDEX [dta_ServiceInstances].[dta_ServiceInstances_index_uidInstanceId]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_ServiceInstances_index_nServiceStateId')
BEGIN
	DROP INDEX [dta_ServiceInstances].[dta_ServiceInstances_index_nServiceStateId]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_ServiceInstances_index_dtEndTime')
BEGIN
	DROP INDEX [dta_ServiceInstances].[dta_ServiceInstances_index_dtEndTime]
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_ServiceInstances')
BEGIN
	CREATE UNIQUE CLUSTERED INDEX CIX_ServiceInstances ON dta_ServiceInstances(uidServiceInstanceId, uidActivityId) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_ServiceInstances')
BEGIN
	CREATE NONCLUSTERED INDEX IX_ServiceInstances ON dta_ServiceInstances(dtEndTime, uidServiceInstanceId, uidActivityId) ON [PRIMARY]
END
GO


/************************************************************************
* Update to the ServiceInstanceExceptions table
* We are dropping the clustered index on uidActivityID
* We are replacing it with a clustered index on uidServiceInstanceID, uidActivityID
* All related queries are updated to make sure they include necessary information when quering on ActivityID
*************************************************************************/
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_ServiceInstanceExceptions_index_uidActivityId')
BEGIN
	DROP INDEX [dta_ServiceInstanceExceptions].[dta_ServiceInstanceExceptions_index_uidActivityId]
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_ServiceInstanceExceptions_index_uidActivityId')
BEGIN
	CREATE CLUSTERED INDEX dta_ServiceInstanceExceptions_index_uidActivityId ON dta_ServiceInstanceExceptions(uidServiceInstanceId, uidActivityId) ON [PRIMARY]
END
GO


/*************************************************************************
* Update to the CallChain table
* we are adding a timestamp column so that for hard purges we can delete call chain information which is older than a given date
* an associated index is also added on this column. We store the nCallersServiceSequence in the index since we always want to leave
* the root call which is the main service. Without this event data can not be shown.
**************************************************************************/
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_CallChain_index_uidInstanceId')
BEGIN
	DROP INDEX [dta_CallChain].[dta_CallChain_index_uidInstanceId]
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtTimeStamp' AND id = object_id('dta_CallChain') )
BEGIN
	ALTER TABLE [dbo].[dta_CallChain] ADD dtTimeStamp datetime NOT NULL CONSTRAINT CallChain_TimeStamp_Dflt DEFAULT (GetUTCDate()) WITH VALUES
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_CallChain_index_uidInstanceId')
BEGIN
	CREATE UNIQUE CLUSTERED INDEX [dta_CallChain_index_uidInstanceId] on dta_CallChain(uidServiceInstanceId, nCallChainId)
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_dta_CallChain_TimeStamp')
BEGIN
	CREATE UNIQUE NONCLUSTERED INDEX [IX_dta_CallChain_TimeStamp] ON [dbo].[dta_CallChain]([dtTimeStamp], [nCallersServiceSequence], [nCallChainId])
END
GO

/**************************************************************************
* Update to the DebugTrace table
* we need an index on the timestamp column or else we cannot do a hard purge of the data efficiently
***************************************************************************/
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_DebugTrace_index_uidInstanceId')
BEGIN
	DROP INDEX [dta_DebugTrace].[dta_DebugTrace_index_uidInstanceId]
END
GO

--we need to add a couple of new columns
IF NOT EXISTS (select name from syscolumns WHERE name = 'nBeginInternalSequence' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] ADD nBeginInternalSequence int NULL
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'nEndInternalSequence' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] ADD nEndInternalSequence int NULL
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtBeginTimeStamp' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] ADD dtBeginTimeStamp datetime NULL
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtEndTimeStamp' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] ADD dtEndTimeStamp datetime NULL
END
GO

ALTER TABLE [dbo].[dta_DebugTrace] ALTER COLUMN vtInstructionId uniqueidentifier NOT NULL
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_DebugTrace_index_uidInstanceId')
BEGIN
	CREATE UNIQUE CLUSTERED INDEX [dta_DebugTrace_index_uidInstanceId] ON [dbo].[dta_DebugTrace]([uidServiceInstanceId], [nServiceSequence], [nDebugTraceId])
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_dta_DebugTrace_TimeStamp')
BEGIN
	CREATE UNIQUE NONCLUSTERED INDEX [IX_dta_DebugTrace_TimeStamp] ON [dbo].[dta_DebugTrace]([dtEndTimeStamp], [nDebugTraceId])
END
GO

IF EXISTS (select name from syscolumns WHERE name = 'dtTimeStamp' AND id = object_id('dta_DebugTrace') )
BEGIN


	--lets update the debug trace table with the new information
	exec('declare @uidServiceInstanceID1 uniqueidentifier, @uidServiceInstanceID2 uniqueidentifier,
		@nServiceSequence1 int, @nServiceSequence2 int,
		@vtInstructionId1 nchar(60), @vtInstructionId2 nchar(60),
		@dtTimeStamp1 datetime, @dtTimeStamp2 datetime,
		@nInternalSequence1 int, @nInternalSequence2 int,
		@nAction1 int, @nAction2 int

	UPDATE dta_DebugTrace set nBeginInternalSequence = nInternalSequence, dtBeginTimeStamp = dtTimeStamp WHERE nAction = 1
	--that was the easy part. Now we try to match the rows together to update them. We will cursor over the table and order everything
	--and try to update each row as appropriate
	DECLARE foo CURSOR FAST_FORWARD FOR
	SELECT uidServiceInstanceId, nServiceSequence, vtInstructionId, dtTimeStamp, nInternalSequence, nAction
	FROM dta_DebugTrace
	ORDER BY uidServiceInstanceId, nServiceSequence, vtInstructionId, nInternalSequence

	OPEN foo

	FETCH NEXT FROM foo INTO @uidServiceInstanceID1, @nServiceSequence1, @vtInstructionId1, @dtTimeStamp1, @nInternalSequence1, @nAction1
	FETCH NEXT FROM foo INTO @uidServiceInstanceID2, @nServiceSequence2, @vtInstructionId2, @dtTimeStamp2, @nInternalSequence2, @nAction2

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		if ( (@uidServiceInstanceID1 = @uidServiceInstanceID2) AND
			(@nServiceSequence1 = @nServiceSequence2) AND
			(@vtInstructionId1 = @vtInstructionId2) AND
			(@nAction1 = 1) AND (@nAction2 = 2) )
		BEGIN
			UPDATE dta_DebugTrace 
			SET 	nEndInternalSequence = @nInternalSequence2,
		    		dtEndTimeStamp = @dtTimeStamp2
			WHERE 	uidServiceInstanceId = @uidServiceInstanceID1 AND
				nServiceSequence = @nServiceSequence1 AND
				vtInstructionId = @vtInstructionId1 AND
				nInternalSequence = @nInternalSequence1
		END
	
		if (@nAction2 = 1) --we just need to move 1 ahead
		BEGIN
			set @uidServiceInstanceID1 = @uidServiceInstanceID2
			set @nServiceSequence1 = @nServiceSequence2
			set @vtInstructionId1 = @vtInstructionId2
			set @dtTimeStamp1 = @dtTimeStamp2
			set @nInternalSequence1 = @nInternalSequence2
			set @nAction1 = @nAction2
		END
		ELSE --lets move two ahead
		BEGIN
			FETCH NEXT FROM foo INTO @uidServiceInstanceID1, @nServiceSequence1, @vtInstructionId1, @dtTimeStamp1, @nInternalSequence1, @nAction1
		END
	
		FETCH NEXT FROM foo INTO @uidServiceInstanceID2, @nServiceSequence2, @vtInstructionId2, @dtTimeStamp2, @nInternalSequence2, @nAction2
	END

	CLOSE foo
	DEALLOCATE foo
			
	--lets get rid of the end shape rows now.
	DELETE FROM dta_DebugTrace WHERE nAction = 2')
END
GO

--lets drop the timestamp and internal sequence, and action columns now
IF EXISTS (select name from syscolumns WHERE name = 'dtTimeStamp' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] DROP COLUMN dtTimeStamp
END
GO

IF EXISTS (select name from syscolumns WHERE name = 'nInternalSequence' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] DROP COLUMN nInternalSequence
END
GO

IF EXISTS (select name from syscolumns WHERE name = 'nAction' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] DROP COLUMN nAction
END
GO

IF EXISTS (select name from syscolumns WHERE name = 'uidServiceId' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] DROP COLUMN uidServiceId
END
GO

IF EXISTS (select name from syscolumns WHERE name = 'vtContext' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] DROP COLUMN vtContext
END
GO

--now that we have inserted the data, the column can be marked as not null
IF EXISTS (select name from syscolumns WHERE name = 'nBeginInternalSequence' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] ALTER COLUMN nBeginInternalSequence int NOT NULL
END
GO

/**************************************************************************
* Update to the MessageFieldValues table
* we are adding a timestamp column so that for hard purges we can delete field value information which is older than a given date
* an associated index is also added on this column
**************************************************************************/ 

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageFieldValues_index_uidMessageInstanceId')
BEGIN
	DROP INDEX [dta_MessageFieldValues].[dta_MessageFieldValues_index_uidMessageInstanceId]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageFieldValues_index_uidMessageInstanceId_nMessageFieldsId')
BEGIN
	DROP INDEX [dta_MessageFieldValues].[dta_MessageFieldValues_index_uidMessageInstanceId_nMessageFieldsId]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageFieldValues_index_dta_MessageFieldValues_nValueIndex')
BEGIN
	DROP INDEX [dta_MessageFieldValues].[dta_MessageFieldValues_index_dta_MessageFieldValues_nValueIndex]
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtTimeStamp' AND id = object_id('dta_MessageFieldValues') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageFieldValues] ADD dtTimeStamp datetime NOT NULL CONSTRAINT MessageFieldValues_TimeStamp_Dflt DEFAULT (GetUTCDate()) WITH VALUES
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_MessageFieldValues')
BEGIN
	CREATE CLUSTERED INDEX CIX_MessageFieldValues ON dta_MessageFieldValues(nSchemaId, nMessageFieldsId, nValueIndex) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_MessageFieldValues')
BEGIN
	CREATE UNIQUE INDEX IX_MessageFieldValues ON dta_MessageFieldValues(uidMessageInstanceId, nSchemaId, nMessageFieldsId, nValueIndex) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX2_MessageFieldValues')
BEGIN
	CREATE UNIQUE INDEX IX2_MessageFieldValues ON dta_MessageFieldValues(dtTimeStamp, nMessageFieldValueId) ON [PRIMARY]
END
GO

/*****************************************************************
* Update the Rules Engine tables adding indexes for the timestamps
*
******************************************************************/
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_RulesFired')
BEGIN
	CREATE UNIQUE INDEX [IX_RulesFired] ON [dta_RulesFired](dtTimeStamp, nRulesFiredID)
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_RulesAgendaUpdates')
BEGIN
	CREATE UNIQUE INDEX [IX_RulesAgendaUpdates] ON [dta_RulesAgendaUpdates](dtTimeStamp, nRulesAgendaUpdatesID)
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_RulesConditionEvaluation')
BEGIN
	CREATE UNIQUE INDEX [IX_RulesConditionEvaluation] ON [dta_RulesConditionEvaluation](dtTimeStamp, nRulesConditionEvaluationID)
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_RulesFactActivity')
BEGIN
	CREATE UNIQUE INDEX [IX_RulesFactActivity] ON [dta_RulesFactActivity](dtTimeStamp, nRulesFactActivityID)
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_RuleSetEngineAssociation')
BEGIN
	CREATE UNIQUE INDEX [IX_RuleSetEngineAssociation] ON [dta_RuleSetEngineAssociation](dtTimeStamp, nRuleSetEngineAssociationID)
END
GO

/******************************************************************************
* Update to the MessageInOutEvents table
* we are going to be deleting the MessageInstances table and moving all data into this table. As such
* we will add columns for all information currently in the MessageInstances table
* we also consolidate the service instance id and activity id indexes into one index and adjust queries as appropriate
*********************************************************************************/
IF NOT EXISTS (select name from syscolumns WHERE name = 'nSchemaId' AND id = object_id('dta_MessageInOutEvents') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageInOutEvents] ADD nSchemaId int NULL --normally not null, but I dont want to put in default values yet
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'nPartCount' AND id = object_id('dta_MessageInOutEvents') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageInOutEvents] ADD nPartCount int NULL 
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'nMessageSize' AND id = object_id('dta_MessageInOutEvents') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageInOutEvents] ADD nMessageSize bigint NULL 
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageInOutEvents_index_ActivityId')
BEGIN
	DROP INDEX [dta_MessageInOutEvents].[dta_MessageInOutEvents_index_ActivityId]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageInOutEvents_index_uidServiceInstanceId')
BEGIN
	DROP INDEX [dta_MessageInOutEvents].[dta_MessageInOutEvents_index_uidServiceInstanceId]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageInOutEvents_index_dtTimestamp')
BEGIN
	DROP INDEX [dta_MessageInOutEvents].[dta_MessageInOutEvents_index_dtTimestamp]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageInOutEvents_index_MessageId')
BEGIN
	DROP INDEX [dta_MessageInOutEvents].[dta_MessageInOutEvents_index_MessageId]
END
GO

IF EXISTS (select name from syscolumns WHERE name = 'strCorrelationToken' AND id = object_id('dta_MessageInOutEvents') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageInOutEvents] DROP COLUMN strCorrelationToken
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageInOutEvents_index_MessageId')
BEGIN
	CREATE UNIQUE CLUSTERED INDEX dta_MessageInOutEvents_index_MessageId ON dta_MessageInOutEvents(uidMessageInstanceId, nEventId) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageInOutEvents_index_ActivityId')
BEGIN
	CREATE UNIQUE INDEX dta_MessageInOutEvents_index_ActivityId ON dta_MessageInOutEvents(uidServiceInstanceId, uidActivityId, uidMessageInstanceId, nEventId) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_MessageInOutEvents_index_dtTimestamp')
BEGIN
	CREATE UNIQUE INDEX dta_MessageInOutEvents_index_dtTimestamp	ON dta_MessageInOutEvents(dtTimestamp, nEventId)
END
GO


/************************************************************************************
* Update to the MessageInstances table
* we are dropping this table as it serves no real purpose
* and just adds indexes and data to clean up and more tables to join with
* first lets copy all relevant information into the MessageInOutEvents table
*************************************************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInstances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	
	UPDATE dta_MessageInOutEvents 
	SET nSchemaId = mi.nSchemaId, nPartCount = mi.nPartCount, nMessageSize = mi.nMessageSize
	FROM dta_MessageInOutEvents mioe
	JOIN dta_MessageInstances mi ON mioe.uidMessageInstanceId = mi.uidMessageInstanceId

	DROP TABLE dta_MessageInstances
END
GO

--now we can switch the column back to being null
IF EXISTS (select name from syscolumns WHERE name = 'nSchemaId' AND id = object_id('dta_MessageInOutEvents') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageInOutEvents] ALTER COLUMN nSchemaId int NOT NULL
END
GO

--lets disallow page locks on our tables. Page locks cause deadlocks in our purge job
EXEC sp_indexoption '[dbo].[dta_ServiceInstances]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_MessageInOutEvents]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_MessageFieldValues]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_CallChain]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_DebugTrace]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Tracking_Spool1]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Tracking_Parts1]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Tracking_Fragments1]', 'disallowpagelocks', TRUE
GO




/******************************************************************************
* Archiving related tables
*******************************************************************/

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ArchiveHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN

	CREATE TABLE [dbo].[dta_ArchiveHistory](
		[nID] [int] NOT NULL IDENTITY(0,1),
		[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetUTCDate()),
		[dtLastFailure] [datetime] NULL,
		[nFailureCount] [int] NOT NULL DEFAULT (0),
		[nSuccess] [int] NOT NULL DEFAULT (0), -- -1 -> failure, 0 -> backup succeeded waiting for restore validation, 1 -> restore validated
		[nvcBackupLocation] [nvarchar](2000) NULL
	)
END
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ArchiveHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	
	IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_dta_ArchiveHistory')
	BEGIN

		CREATE CLUSTERED INDEX [CIX_dta_ArchiveHistory] ON [dta_ArchiveHistory]([dtTimeStamp] DESC) 
	END
END
GO




/******************************************************************************
* Dropping stored procs which are not present in a BizTalk Server 2006-only install
*
*******************************************************************/

IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_InsertMessageInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_InsertMessageInstance]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetServicesPerAssembly]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetServicesPerAssembly]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_RemoveBISchema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_RemoveBISchema]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_CxtInsert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_CxtInsert]

GO


/************************************************************************************
* Update the roles access that was given on this table
*
**************************************************************************************/

GRANT SELECT ON [dbo].[dta_Adapter] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_DecryptionSubject] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_Group] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_Host] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_MessageBox] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_MessageInOutEvents] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_MessageStatus] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_PartyName] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_PortName] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_SchemaName] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_ServiceInstances] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_ServiceInstanceExceptions] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_Services] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_ServiceSymbols] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_ServiceState] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_SigningSubject] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_Url] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[dta_Items] TO BTS_OPERATORS

GO


/**********************************************************************************************
* Altering columns to match those present in a BizTalk Server 2006-only install
*
***********************************************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TDDS_FailedTrackingData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN

declare @tnErrMessageType tinyint,
	@tnTextType tinyint

	SELECT @tnErrMessageType = col.xtype 
	FROM dbo.syscolumns col
	LEFT JOIN dbo.systypes syst ON col.xtype = syst.xtype
	WHERE col.id = object_id(N'[dbo].[TDDS_FailedTrackingData]') AND col.name = 'ErrMessage'

	SELECT @tnTextType = xtype FROM dbo.systypes WHERE name = 'ntext'

	--alter the ErrMessage column if it does not have ntext as its column type. xtype of 99 indicates a column of type ntext.
	IF (@tnErrMessageType <> @tnTextType)
	BEGIN
		ALTER TABLE TDDS_FailedTrackingData ALTER COLUMN ErrMessage ntext NOT NULL 	
	END
END
GO


/********************************************************************************************************************
* Altering the dtasp_RemoveSproc sproc to drop the dta_ArchiveHistory table. The upgraded sproc will have an extra
* drop for the dta_MessageInstances table, which will not exist in the pure PF BTS_Tracking_Schema.sql script.
*
*********************************************************************************************************************/

ALTER PROCEDURE [dbo].[dtasp_RemoveSchema]
AS
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_RemoveSchema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_RemoveSchema]
--/---------------------------------------------------------------------------------------------------------------
--//	Remove dynamic tables, views and stored procedures
--/---------------------------------------------------------------------------------------------------------------
declare @strItemName nvarchar(400)
declare @nType int
declare @nCube int
declare @strCommand nvarchar(500)
declare item_list cursor for select nCubeId, strItemId, nItemTypeId from [dbo].[dta_Items]
open item_list
fetch next from item_list into @nCube, @strItemName, @nType
while (@@fetch_status <> -1)
begin
	if (@nCube > 2)
	begin
		if ((@nType = 1) or (@nType = 8)) -- it is a view
		begin
			select @strCommand = N'if exists (select * from dbo.sysobjects where id = object_id(N''' + @strItemName + ''') and OBJECTPROPERTY(id, N''IsView'') = 1) drop view ' + @strItemName
			exec sp_executesql @strCommand
		end
		if (@nType = 6) -- it is a stored procedure
		begin
			select @strCommand = N'if exists (select * from dbo.sysobjects where id = object_id(N''' + @strItemName + ''') and OBJECTPROPERTY(id, N''IsProcedure'') = 1) drop procedure ' + @strItemName
			exec sp_executesql @strCommand
		end
		if ((@nType = 2) or (@nType = 3) or (@nType = 4) or (@nType = 7)) -- It is a table. Cube is 5, so omit it
		begin 
			select @strCommand = N'if exists (select * from dbo.sysobjects where id = object_id(N''' + @strItemName + ''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) drop table ' + @strItemName
			exec sp_executesql @strCommand
		end
	end

	fetch next from item_list into @nCube, @strItemName, @nType
end
close item_list
deallocate item_list

--/--------------------------------------------------------------------------------------------------------
--/	Remove health monitoring related static views
--/--------------------------------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_MessageFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_MessageFacts]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_FindMessageFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_FindMessageFacts]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_ServiceFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_ServiceFacts]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_RealNames]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_RealNames]

--/--------------------------------------------------------------------------------------------------------
-- Remove Functions
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
-- Remove Tables
--/--------------------------------------------------------------------------------------------------------
-- Remove health monitoring related tables
-- Remove message related tables
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageFieldValues]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_MessageFieldValues]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageFields]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_MessageFields]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInOutEvents]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_MessageInOutEvents]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_Adapter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_Adapter]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_SchemaName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_SchemaName]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_SigningSubject]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_SigningSubject]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_DecryptionSubject]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_DecryptionSubject]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_PartyName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_PartyName]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_Url]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_Url]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_PortName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_PortName]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_MessageStatus]
-- Remove service related tables
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_CallChain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_CallChain]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_DebugTrace]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_DebugTrace]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ServiceInstances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_ServiceInstances]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ServiceState]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_ServiceState]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_Group]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_Host]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_Host]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageBox]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_MessageBox]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_Services]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_Services]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ServiceInstanceExceptions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_ServiceInstanceExceptions]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ServiceSymbols]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_ServiceSymbols]
-- Remove Tables which are used for both health monitoring and business
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_Items]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_Items]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ItemTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_ItemTypes]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_Cubes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_Cubes]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ProcessState]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_ProcessState]
--Remove Tables which are used for Archiving
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ArchiveHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)	DROP TABLE [dbo].[dta_ArchiveHistory]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_ServiceInstancesTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_ServiceInstancesTemp]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInOutEventsTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)	drop table [dbo].[dta_MessageInOutEventsTemp]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageFieldValuesTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_MessageFieldValuesTemp]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_DebugTraceTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_DebugTraceTemp]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_CallChainTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[dta_CallChainTemp]

--/--------------------------------------------------------------------------------------------------------------------
--//	Remove stored procedures that create the static health monitoring views
--/--------------------------------------------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_CreateServiceFactsView]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_CreateServiceFactsView]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_CreateMessageFactsFindMsgViews]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_CreateMessageFactsFindMsgViews]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_CreateRealNamesView]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_CreateRealNamesView]

GO

GRANT EXEC ON dtasp_REGetRuleSetEngineAssociationCountForAppl TO BTS_OPERATORS
GO
GRANT EXEC ON dtasp_REGetRuleSetEngineAssociationsForAppl TO BTS_OPERATORS
GO
GRANT EXEC ON dtasp_REGetFactActivityForRuleSetEngineAssociation TO BTS_OPERATORS
GO
GRANT EXEC ON dtasp_REGetRulesFiredForRuleSetEngineAssociation TO BTS_OPERATORS
GO
GRANT EXEC ON dtasp_REGetRulesNotFiredForRuleSetEngineAssociation TO BTS_OPERATORS
GO
GRANT EXEC ON dtasp_REGetAgendaUpdatesForRuleSetEngineAssociation TO BTS_OPERATORS
GO
GRANT EXEC ON dtasp_REGetConditionsEvaluatedForRuleSetEngineAssociation TO BTS_OPERATORS
GO
GRANT EXEC ON dtasp_REGetRuleDefn TO BTS_OPERATORS
GO



