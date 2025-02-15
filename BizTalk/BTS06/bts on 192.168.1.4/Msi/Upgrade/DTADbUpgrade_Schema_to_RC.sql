--We need a unique index on the Tracking_Parts tables so that we can get correct estimates when deleting from these tables. I will add the uidPartID
--column to the index since this is randomly generated
IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_Tracking_Parts1')
BEGIN
	DROP INDEX [Tracking_Parts1].[IX_Tracking_Parts1]
END
GO

CREATE  UNIQUE CLUSTERED  INDEX [IX_Tracking_Parts1] ON [dbo].[Tracking_Parts1]([uidMessageID], [uidPartID]) ON [PRIMARY]
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_Tracking_Parts2')
BEGIN
	DROP INDEX [Tracking_Parts2].[IX_Tracking_Parts2]
END
GO

CREATE  UNIQUE CLUSTERED  INDEX [IX_Tracking_Parts2] ON [dbo].[Tracking_Parts2]([uidMessageID], [uidPartID]) ON [PRIMARY]
GO

--lets disable page locks on all tracking related tables
EXEC sp_indexoption '[dbo].[TrackingData]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[TrackingDataPartitions]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[TrackingMessageReferences]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Spool1]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Fragments1]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Parts1]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Spool2]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Fragments2]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Parts2]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[dta_ServiceInstanceExceptions]', 'disallowpagelocks', TRUE
GO

--we added an insertion timestamp to a number of dta related tables to make sure that we dont delete information before it has been backed up
IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_MessageInOutEvents') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageInOutEvents] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT MessageInOutEvents_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_CallChain') )
BEGIN
	ALTER TABLE [dbo].[dta_CallChain] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT CallChain_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_DebugTrace') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTrace] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT DebugTrace_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_ServiceInstances') )
BEGIN
	ALTER TABLE [dbo].[dta_ServiceInstances] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT ServiceInstances_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_MessageInOutEventsTemp') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageInOutEventsTemp] ADD [dtInsertionTimeStamp] [datetime] NULL 
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_CallChainTemp') )
BEGIN
	ALTER TABLE [dbo].[dta_CallChainTemp] ADD [dtInsertionTimeStamp] [datetime] NULL 
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_DebugTraceTemp') )
BEGIN
	ALTER TABLE [dbo].[dta_DebugTraceTemp] ADD [dtInsertionTimeStamp] [datetime] NULL 
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_ServiceInstancesTemp') )
BEGIN
	ALTER TABLE [dbo].[dta_ServiceInstancesTemp] ADD [dtInsertionTimeStamp] [datetime] NULL 
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('Tracking_Spool1') )
BEGIN
	ALTER TABLE [dbo].[Tracking_Spool1] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT TrackingSpool1_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('Tracking_Spool2') )
BEGIN
	ALTER TABLE [dbo].[Tracking_Spool2] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT TrackingSpool2_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_RuleSetEngineAssociation') )
BEGIN
	ALTER TABLE [dbo].[dta_RuleSetEngineAssociation] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT RuleSetEngineAssociation_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_RulesAgendaUpdates') )
BEGIN
	ALTER TABLE [dbo].[dta_RulesAgendaUpdates] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT RulesAgendaUpdates_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_RulesConditionEvaluation') )
BEGIN
	ALTER TABLE [dbo].[dta_RulesConditionEvaluation] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT RulesConditionEvaluation_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_RulesFactActivity') )
BEGIN
	ALTER TABLE [dbo].[dta_RulesFactActivity] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT RulesFactActivity_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('dta_RulesFired') )
BEGIN
	ALTER TABLE [dbo].[dta_RulesFired] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT RulesFired_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_ServiceInstances')
BEGIN
	DROP INDEX [dta_ServiceInstances].[IX_ServiceInstances]
END
GO

CREATE INDEX IX_ServiceInstances ON dta_ServiceInstances(dtEndTime, dtInsertionTimeStamp, uidServiceInstanceId, uidActivityId)
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_dta_DebugTrace_TimeStamp')
BEGIN
	DROP INDEX [dta_DebugTrace].[IX_dta_DebugTrace_TimeStamp]
END
GO
CREATE  UNIQUE  INDEX [IX_dta_DebugTrace_TimeStamp] ON [dbo].[dta_DebugTrace]([dtEndTimeStamp], [dtInsertionTimeStamp], [nDebugTraceId]) ON [PRIMARY]
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_dta_CallChain_TimeStamp')
BEGIN
	DROP INDEX [dta_CallChain].[IX_dta_CallChain_TimeStamp]
END
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_dta_CallChain_TimeStamp] ON [dbo].[dta_CallChain]([dtTimeStamp], [dtInsertionTimeStamp], [nCallersServiceSequence], nCallChainId)
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'dta_MessageInOutEvents_index_dtTimestamp')
BEGIN
	DROP INDEX [dta_MessageInOutEvents].[dta_MessageInOutEvents_index_dtTimestamp]
END
GO
CREATE UNIQUE INDEX dta_MessageInOutEvents_index_dtTimestamp	ON dta_MessageInOutEvents(dtTimestamp, dtInsertionTimeStamp, nEventId)
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_RuleSetEngineAssociation')
BEGIN
	DROP INDEX [dta_RuleSetEngineAssociation].[IX_RuleSetEngineAssociation]
END
GO
CREATE UNIQUE INDEX [IX_RuleSetEngineAssociation] ON [dta_RuleSetEngineAssociation](dtTimeStamp, dtInsertionTimeStamp, nRuleSetEngineAssociationID)
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_RulesFactActivity')
BEGIN
	DROP INDEX [dta_RulesFactActivity].[IX_RulesFactActivity]
END
GO
CREATE UNIQUE INDEX [IX_RulesFactActivity] ON [dta_RulesFactActivity](dtTimeStamp, dtInsertionTimeStamp, nRulesFactActivityID)
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_RulesConditionEvaluation')
BEGIN
	DROP INDEX [dta_RulesConditionEvaluation].[IX_RulesConditionEvaluation]
END
GO
CREATE UNIQUE INDEX [IX_RulesConditionEvaluation] ON [dta_RulesConditionEvaluation](dtTimeStamp, dtInsertionTimeStamp, nRulesConditionEvaluationID)
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_RulesAgendaUpdates')
BEGIN
	DROP INDEX [dta_RulesAgendaUpdates].[IX_RulesAgendaUpdates]
END
GO
CREATE UNIQUE INDEX [IX_RulesAgendaUpdates] ON [dta_RulesAgendaUpdates](dtTimeStamp, dtInsertionTimeStamp, nRulesAgendaUpdatesID)
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_RulesFired')
BEGIN
	DROP INDEX [dta_RulesFired].[IX_RulesFired]
END
GO
CREATE UNIQUE INDEX [IX_RulesFired] ON [dta_RulesFired](dtTimeStamp, dtInsertionTimeStamp, nRulesFiredID)
GO


IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'CIX_Tracking_Spool1')
BEGIN
	DROP INDEX [Tracking_Spool1].[CIX_Tracking_Spool1]
END
GO
CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool1] ON [dbo].[Tracking_Spool1]([dtTimeStamp], [dtInsertionTimeStamp], [uidMsgID])
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'CIX_Tracking_Spool2')
BEGIN
	DROP INDEX [Tracking_Spool2].[CIX_Tracking_Spool2]
END
GO
CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool2] ON [dbo].[Tracking_Spool2]([dtTimeStamp], [dtInsertionTimeStamp], [uidMsgID])
GO

--lets force an archive to occur the next time the purge job runs
INSERT INTO dta_ArchiveHistory (dtTimeStamp, dtLastFailure, nFailureCount, nSuccess) VALUES (GetUTCDate(), GetUTCDate(), 1, -1)