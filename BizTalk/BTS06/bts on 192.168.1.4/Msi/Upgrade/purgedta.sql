--there was a bug in BETA1 so this table is still unfortunately needed for now
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInstancesTemp]') and OBJECTPROPERTY(id, N'IsTable') = 1)
BEGIN
	exec('CREATE TABLE [dbo].[dta_MessageInstancesTemp] (
			[uidMessageInstanceId]		[uniqueidentifier]		NOT NULL,
			[nSchemaId]			[bigint]			NOT NULL,
			[nPartCount]			[int]				NULL,
			[nMessageSize]			[bigint]			NULL
		) ON [PRIMARY]')
END

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_PurgeAllCompletedTrackingData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN	

	exec( 'CREATE TABLE [dbo].[dta_ServiceInstancesTemp] (
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

	    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]')

	exec('CREATE TABLE [dbo].[dta_MessageInOutEventsTemp] (
			[uidActivityId]			[uniqueidentifier]			NOT NULL,
			[uidServiceInstanceId]		[uniqueidentifier]			NOT NULL,
			[uidMessageInstanceId]		[uniqueidentifier]			NOT NULL,
			[nAdapterId]			[bigint]				NOT NULL,
			[nDecryptionSubjectId]		[int]					NOT NULL,
			[nSigningSubjectId]		[int]					NOT NULL,
			[strCorrelationToken]		[nvarchar] (60)				NULL,
			[nUrlId]			[bigint]				NOT NULL,
			[nPartyId]			[bigint]				NOT NULL,
			[nPortId]			[bigint]				NOT NULL,
			[dtTimestamp]			[datetime] 				NOT NULL,
			[nStatus]			[int] 					NOT NULL
		) ON [PRIMARY]')

	exec('CREATE TABLE [dbo].[dta_CallChainTemp] (
			[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
			[vtCallersActionId]		[nvarchar] (60)			NULL,
			[uidCallersServiceId]		[uniqueidentifier]		NULL,
			[nCallersServiceSequence]	[int]				NULL,
			[uidCalleesServiceId]		[uniqueidentifier]		NOT NULL,
			[nCalleesServiceSequence]	[int]				NOT NULL
		) ON [PRIMARY]')

	exec('CREATE TABLE [dbo].[dta_DebugTraceTemp] (
			[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
			[uidServiceId]			[uniqueidentifier]		NOT NULL,
			[vtInstructionId]		[nvarchar] (60)			NOT NULL, 
			[nServiceSequence]		[int]				NOT NULL,
			[nInternalSequence]		[int]				NOT NULL,
			[nAction]			[int]				NOT NULL,
			[dtTimeStamp] 			[datetime]			NOT NULL,
			[vtContext]			[sql_variant]			NULL
		) ON [PRIMARY]')

	exec('CREATE TABLE [dbo].[dta_MessageFieldValuesTemp] (
			[uidMessageInstanceId]		[uniqueidentifier]			NOT NULL,
			[nMessageFieldsId]		[bigint]				NOT NULL,
			[nSchemaId]			[bigint]				NULL,
			[vtValue]			[sql_variant]				NULL,
			[nValueIndex]			[int]					NOT NULL
		) ON [PRIMARY]')


	exec ('CREATE PROCEDURE [dbo].[dtasp_DropViews]
   		AS
		--/--------------------------------------------------------------------------------------------------------
		--/	Remove health monitoring related static views
		--/--------------------------------------------------------------------------------------------------------
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[dtav_MessageFacts]'') and OBJECTPROPERTY(id, N''IsView'') = 1) drop view [dbo].[dtav_MessageFacts]
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[dtav_FindMessageFacts]'') and OBJECTPROPERTY(id, N''IsView'') = 1) drop view [dbo].[dtav_FindMessageFacts]
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[dtav_ServiceFacts]'') and OBJECTPROPERTY(id, N''IsView'') = 1) drop view [dbo].[dtav_ServiceFacts]
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[dtav_RealNames]'') and OBJECTPROPERTY(id, N''IsView'') = 1) drop view [dbo].[dtav_RealNames]
	')

	exec ('CREATE PROCEDURE [dbo].[dtasp_PurgeAllCompletedTrackingData]
	AS
	BEGIN
	
		--lets just check the revision number on the db and if it is wrong, we will just return.
		
	
		--If you are doing this we assume it is because you have a huge, old db so it is just faster for us to 
		--find things which are not done and hold onto them then the other way around.
		--if we crashed after grabbing these uncompleted instances but before reinserting them, we are okay
		--because we have a unique constraint on the serviceinstanceid identity column so we will just ignore dupes
		--Note that if you run this, you need to have the tracking host stopped so that no new data is being inserted while this runs. 
		--This hard purge assumes that inserts have stopped so that we can do unlogged operations like truncate table and not hold locks for
		--long periods of time. Make sure if the system crashes while running this, you get a full clean run before restarting the tracking service or
		--you will end up in a non-deterministic state.
	
		INSERT INTO dta_ServiceInstancesTemp (
			uidServiceInstanceId,
			uidActivityId,
			uidServiceId,
			uidAgentSrvId,
			uidServiceClassId,
			dtStartTime,
			dtEndTime,
			HRESULT,
			ErrorInfo,
			nHostId,
			nMessageBoxId,
			nGroupId,
			nServiceStateId,
			bExceptionsOccurred
			)
		SELECT 	uidServiceInstanceId,
			uidActivityId,
			uidServiceId,
			uidAgentSrvId,
			uidServiceClassId,
			dtStartTime,
			dtEndTime,
			HRESULT,
			ErrorInfo,
			nHostId,
			nMessageBoxId,
			nGroupId,
			nServiceStateId,
			bExceptionsOccurred
		FROM dta_ServiceInstances WHERE dtEndTime IS NULL
	
		INSERT INTO dta_MessageInOutEventsTemp (
			uidActivityId,
			uidServiceInstanceId,
			uidMessageInstanceId,
			nAdapterId,
			nDecryptionSubjectId,
			nSigningSubjectId,
			strCorrelationToken,
			nUrlId,
			nPartyId,
			nPortId,
			dtTimestamp,
			nStatus
			)
		SELECT  mioe.uidActivityId,
			mioe.uidServiceInstanceId,
			mioe.uidMessageInstanceId,
			mioe.nAdapterId,
			mioe.nDecryptionSubjectId,
			mioe.nSigningSubjectId,
			mioe.strCorrelationToken,
			mioe.nUrlId,
			mioe.nPartyId,
			mioe.nPortId,
			mioe.dtTimestamp,
			mioe.nStatus
		FROM dta_MessageInOutEvents mioe
		JOIN dta_ServiceInstancesTemp si ON mioe.uidServiceInstanceId = si.uidServiceInstanceId AND mioe.uidActivityId = si.uidActivityId
	
		INSERT INTO dta_MessageInstancesTemp (
			[uidMessageInstanceId],
			[nSchemaId],
			[nPartCount],
			[nMessageSize]
			)
		SELECT 	mi.[uidMessageInstanceId],
			mi.[nSchemaId],
			mi.[nPartCount],
			mi.[nMessageSize]
		FROM dta_MessageInstances mi
		WHERE mi.uidMessageInstanceId IN (SELECT uidMessageInstanceId FROM dta_MessageInOutEvents)
	
		INSERT INTO dta_MessageFieldValuesTemp (
			[uidMessageInstanceId],
			[nMessageFieldsId],
			[nSchemaId],
			[vtValue],
			[nValueIndex]
			)
		SELECT  mfv.[uidMessageInstanceId],
			mfv.[nMessageFieldsId],
			mfv.[nSchemaId],
			mfv.[vtValue],
			mfv.[nValueIndex]
		FROM dta_MessageFieldValues mfv
		JOIN dta_MessageInstancesTemp mi ON mi.uidMessageInstanceId = mfv.uidMessageInstanceId
	
		--for now we have to hardcode the orchestration guid. We dont really want the callchain information for anything but
		--orchestrations and for MSMQt it is really bad since this just grows and grows
		INSERT INTO dta_CallChainTemp (
			[uidServiceInstanceId],
			[vtCallersActionId],
			[uidCallersServiceId],
			[nCallersServiceSequence],
			[uidCalleesServiceId],
			[nCalleesServiceSequence]
			)
		SELECT  cc.[uidServiceInstanceId],
			cc.[vtCallersActionId],
			cc.[uidCallersServiceId],
			cc.[nCallersServiceSequence],
			cc.[uidCalleesServiceId],
			cc.[nCalleesServiceSequence]
		FROM dta_CallChain cc
		JOIN dta_ServiceInstancesTemp sit ON cc.uidServiceInstanceId = sit.uidServiceInstanceId AND sit.uidServiceClassId = ''{226FC6B9-0416-47A4-A8E8-4721F1DB1A1B}''
	
		INSERT INTO dta_DebugTraceTemp (
			[uidServiceInstanceId],
			[uidServiceId],
			[vtInstructionId], 
			[nServiceSequence],
			[nInternalSequence],
			[nAction],
			[dtTimeStamp],
			[vtContext]
			)
		SELECT  dt.[uidServiceInstanceId],
			dt.[uidServiceId],
			dt.[vtInstructionId], 
			dt.[nServiceSequence],
			dt.[nInternalSequence],
			dt.[nAction],
			dt.[dtTimeStamp],
			dt.[vtContext]
		FROM dta_DebugTrace dt
		JOIN dta_ServiceInstancesTemp sit ON sit.uidServiceInstanceId = dt.uidServiceInstanceId
	
	
		--I cant truncate these tables without first dropping the views since they have schemabindings
		exec dtasp_DropViews
	
		TRUNCATE TABLE dta_ServiceInstances
		TRUNCATE TABLE dta_MessageInstances
		TRUNCATE TABLE dta_MessageFieldValues
		TRUNCATE TABLE dta_CallChain
		TRUNCATE TABLE dta_MessageInOutEvents
		TRUNCATE TABLE dta_DebugTrace
		TRUNCATE TABLE dta_RulesAgendaUpdates
		TRUNCATE TABLE dta_RulesConditionEvaluation
		--TRUNCATE TABLE dta_RuleSetEngineAssociation
		TRUNCATE TABLE dta_RulesFactActivity
		TRUNCATE TABLE dta_RulesFired
		TRUNCATE TABLE Tracking_Spool1
		TRUNCATE TABLE Tracking_Parts1
		TRUNCATE TABLE Tracking_Fragments1
		TRUNCATE TABLE Tracking_Spool2
		TRUNCATE TABLE Tracking_Parts2
		TRUNCATE TABLE Tracking_Fragments2
	
		INSERT INTO dta_ServiceInstances (
			uidServiceInstanceId,
			uidActivityId,
			uidServiceId,
			uidAgentSrvId,
			uidServiceClassId,
			dtStartTime,
			dtEndTime,
			HRESULT,
			ErrorInfo,
			nHostId,
			nMessageBoxId,
			nGroupId,
			nServiceStateId,
			bExceptionsOccurred
			)
		SELECT 	uidServiceInstanceId,
			uidActivityId,
			uidServiceId,
			uidAgentSrvId,
			uidServiceClassId,
			dtStartTime,
			dtEndTime,
			HRESULT,
			ErrorInfo,
			nHostId,
			nMessageBoxId,
			nGroupId,
			nServiceStateId,
			bExceptionsOccurred
		FROM dta_ServiceInstancesTemp
	
		INSERT INTO dta_MessageInOutEvents (
			[uidActivityId],
			[uidServiceInstanceId],
			[uidMessageInstanceId],
			[nAdapterId],
			[nDecryptionSubjectId],
			[nSigningSubjectId],
			[strCorrelationToken],
			[nUrlId],
			[nPartyId],
			[nPortId],
			[dtTimestamp],
			[nStatus]
			)
		SELECT  [uidActivityId],
			[uidServiceInstanceId],
			[uidMessageInstanceId],
			[nAdapterId],
			[nDecryptionSubjectId],
			[nSigningSubjectId],
			[strCorrelationToken],
			[nUrlId],
			[nPartyId],
			[nPortId],
			[dtTimestamp],
			[nStatus]
		FROM dta_MessageInOutEventsTemp
	
		INSERT INTO dta_MessageInstances (
			[uidMessageInstanceId],
			[nSchemaId],
			[nPartCount],
			[nMessageSize]
			)
		SELECT 	[uidMessageInstanceId],
			[nSchemaId],
			[nPartCount],
			[nMessageSize]
		FROM dta_MessageInstancesTemp
	
		INSERT INTO dta_MessageFieldValues (
			[uidMessageInstanceId],
			[nMessageFieldsId],
			[nSchemaId],
			[vtValue],
			[nValueIndex]
			)
		SELECT  [uidMessageInstanceId],
			[nMessageFieldsId],
			[nSchemaId],
			[vtValue],
			[nValueIndex]
		FROM dta_MessageFieldValuesTemp
	
		INSERT INTO dta_CallChain (
			[uidServiceInstanceId],
			[vtCallersActionId],
			[uidCallersServiceId],
			[nCallersServiceSequence],
			[uidCalleesServiceId],
			[nCalleesServiceSequence]
			)
		SELECT  [uidServiceInstanceId],
			[vtCallersActionId],
			[uidCallersServiceId],
			[nCallersServiceSequence],
			[uidCalleesServiceId],
			[nCalleesServiceSequence]
		FROM dta_CallChainTemp
	
		INSERT INTO dta_DebugTrace (
			[uidServiceInstanceId],
			[uidServiceId],
			[vtInstructionId], 
			[nServiceSequence],
			[nInternalSequence],
			[nAction],
			[dtTimeStamp],
			[vtContext]
			)
		SELECT  [uidServiceInstanceId],
			[uidServiceId],
			[vtInstructionId], 
			[nServiceSequence],
			[nInternalSequence],
			[nAction],
			[dtTimeStamp],
			[vtContext]
		FROM dta_DebugTraceTemp
	
	
		TRUNCATE TABLE dta_ServiceInstancesTemp
		TRUNCATE TABLE dta_MessageInstancesTemp
		TRUNCATE TABLE dta_MessageInOutEventsTemp
		TRUNCATE TABLE dta_MessageFieldValuesTemp
		TRUNCATE TABLE dta_DebugTraceTemp
		TRUNCATE TABLE dta_CallChainTemp
	
		exec dtasp_CreateMessageFactsFindMsgViews
		exec dtasp_CreateRealNamesView
		exec dtasp_CreateServiceFactsView
	END')
END
GO

--There was a bug in BETA1 with some columns not allowing NULLS. We will fix that here
IF EXISTS (select name from syscolumns WHERE name = 'dtEndTimeStamp' AND id = object_id('dta_DebugTraceTemp') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTraceTemp] ALTER COLUMN dtEndTimeStamp datetime NULL
END
GO

IF EXISTS (select name from syscolumns WHERE name = 'dtBeginTimeStamp' AND id = object_id('dta_DebugTraceTemp') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTraceTemp] ALTER COLUMN dtBeginTimeStamp datetime NULL
END
GO

IF EXISTS (select name from syscolumns WHERE name = 'nEndInternalSequence' AND id = object_id('dta_DebugTraceTemp') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTraceTemp] ALTER COLUMN nEndInternalSequence int NULL
END
GO
GO

exec dtasp_PurgeAllCompletedTrackingData
GO
