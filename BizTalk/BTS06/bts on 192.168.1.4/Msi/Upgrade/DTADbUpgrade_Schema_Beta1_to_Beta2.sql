--lets make sure the views are dropped. Theyll be recreated in the logic file
exec [dbo].[dtasp_DropViews]
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_DebugTrace_index_uidInstanceId')
BEGIN
	DROP INDEX [dta_DebugTrace].[dta_DebugTrace_index_uidInstanceId]
END
GO

CREATE UNIQUE CLUSTERED INDEX [dta_DebugTrace_index_uidInstanceId] ON [dbo].[dta_DebugTrace]([uidServiceInstanceId], [nServiceSequence], [nDebugTraceId])
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackedMessages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrackedMessages]
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_TrackingMessageReferences')
BEGIN
	DROP INDEX [TrackingMessageReferences].[CIX_TrackingMessageReferences]
END
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_TrackingMessageReferences')
BEGIN
	DROP INDEX [TrackingMessageReferences].[IX_TrackingMessageReferences]
END
GO

CREATE  UNIQUE CLUSTERED  INDEX [CIX_TrackingMessageReferences] ON [dbo].[TrackingMessageReferences]([uidMessageID]) WITH IGNORE_DUP_KEY
GO

CREATE  UNIQUE NONCLUSTERED  INDEX [IX_TrackingMessageReferences] ON [dbo].[TrackingMessageReferences]([nID], [uidMessageID])
GO


--//************************************************************************************
-- TDDS Related changes
--//************************************************************************************
-- SQL 2005 requires the following permission for the function call ident_current
if not exists (select * from sysusers where name = N'BAM_EVENT_READER' and issqlrole = 1)
EXEC sp_addrole N'BAM_EVENT_READER'
GO

GRANT SELECT ON [dbo].[TrackingData] TO BAM_EVENT_READER
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_DebugTraceTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_DebugTraceTemp]
GO

CREATE TABLE [dbo].[dta_DebugTraceTemp] (
	[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
	[vtInstructionId]		[uniqueidentifier]		NOT NULL, 
	[nServiceSequence]		[int]				NOT NULL,
	[nBeginInternalSequence]	[int]				NOT NULL,
	[nEndInternalSequence]		[int]				NULL,
	[dtBeginTimeStamp] 		[datetime]			NULL,
	[dtEndTimeStamp] 		[datetime]			NULL,
) ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInOutEventsTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_MessageInOutEventsTemp]
GO

CREATE TABLE [dbo].[dta_MessageInOutEventsTemp] (
	[uidActivityId]			[uniqueidentifier]			NOT NULL,
	[uidServiceInstanceId]		[uniqueidentifier]			NOT NULL,
	[uidMessageInstanceId]		[uniqueidentifier]			NOT NULL,
	[nAdapterId]			[bigint]				NOT NULL,
	[nDecryptionSubjectId]		[int]					NOT NULL,
	[nSigningSubjectId]		[int]					NOT NULL,
	[strUrl]			[nvarchar](1024)			NULL,
	[nPartyId]			[bigint]				NOT NULL,
	[nPortId]			[bigint]				NOT NULL,
	[nSchemaId]			[int]					NOT NULL,
	[nPartCount]			[int]					NULL,
	[nMessageSize]			[bigint]				NULL,
	[dtTimestamp]			[datetime] 				NOT NULL,
	[nStatus]			[int] 					NOT NULL
) ON [PRIMARY]
GO

--lets drop the dta_URL Table and move its data into the MessageInOutEvents table
IF NOT EXISTS (select name from syscolumns WHERE name = 'strUrl' AND id = object_id('dta_MessageInOutEvents') )
BEGIN
	ALTER TABLE [dbo].[dta_MessageInOutEvents] ADD strUrl nvarchar(1024) NULL
END
GO


IF EXISTS (select name from syscolumns WHERE name = 'nUrlId' AND id = object_id('dta_MessageInOutEvents') )
BEGIN
	EXEC ('UPDATE dta_MessageInOutEvents SET strUrl = u.strUrl FROM dta_MessageInOutEvents m, dta_Url u WHERE m.nUrlId = u.nUrlId')

	ALTER TABLE [dbo].[dta_MessageInOutEvents] DROP COLUMN nUrlId
END
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_Url]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_Url]
GO

/*****************************
 * Changes for the Rules tracking database
  ***************************/

IF NOT EXISTS (select name from dbo.syscolumns WHERE name = 'dtUnDeployTime' AND id = object_id('dta_RuleSets') )
	ALTER TABLE [dbo].[dta_RuleSets] ADD [dtUnDeployTime] [datetime] NULL
GO

/*****************************************************************
* Update the Rules Engine tables adding indexes for linking to the associations table so we know what to delete
*
******************************************************************/
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX2_RulesFired')
BEGIN
	CREATE UNIQUE INDEX [IX2_RulesFired] ON [dta_RulesFired](nRuleSetEngineAssociationID, nRulesFiredID)
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX2_RulesAgendaUpdates')
BEGIN
	CREATE UNIQUE INDEX [IX2_RulesAgendaUpdates] ON [dta_RulesAgendaUpdates](nRuleSetEngineAssociationID, nRulesAgendaUpdatesID)
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX2_RulesConditionEvaluation')
BEGIN
	CREATE UNIQUE INDEX [IX2_RulesConditionEvaluation] ON [dta_RulesConditionEvaluation](nRuleSetEngineAssociationID, nRulesConditionEvaluationID)
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'dta_RulesFactActivity_index_RuleSetEngineAssociationID')
BEGIN
	DROP INDEX [dta_RulesFactActivity].[dta_RulesFactActivity_index_RuleSetEngineAssociationID]
END
GO

CREATE UNIQUE INDEX [dta_RulesFactActivity_index_RuleSetEngineAssociationID] ON [dta_RulesFactActivity](nRuleSetEngineAssociationID, nRulesFactActivityID)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInstancesTemp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[dta_MessageInstancesTemp]
GO
