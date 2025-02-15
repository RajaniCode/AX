--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

-- Remove Current Schema including dynamically created tables and views
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_RemoveSchema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) exec dtasp_RemoveSchema
GO

CREATE PROCEDURE [dbo].[dtasp_RemoveSchema]
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

--/--------------------------------------------------------------------------------------------------------
--
--	Health monitoring related tables
--
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
--/--
--	Service Related Tables
--/--
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_Services
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_Services] (
	[nServiceId]			[bigint]		NOT NULL IDENTITY(1, 1),
	[uidServiceId] 			[uniqueidentifier] 	NOT NULL,
	[uidNonVersionId]		[uniqueidentifier]	NOT NULL,
	[strServiceType] 		[nvarchar] (256) 	NOT NULL,
	[strServiceName] 		[nvarchar] (256) 	NOT NULL,
	[strAssemblyName]		[nvarchar] (1024)	NULL,
	[strAssemblyVersion]		[nvarchar] (256)	NULL,
	[dtDeploymentTime] 		[datetime] 		NOT NULL,
	[txtSymbol]			[ntext]			NULL

	CONSTRAINT dta_Services_Unique_uidServiceId			PRIMARY KEY(uidServiceId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_Services] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_Services] TO BTS_OPERATORS
GO

CREATE INDEX dta_Service_index_strServiceName			ON dta_Services(strServiceName)
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_ServiceSymbols
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_ServiceSymbols] (
	[uidServiceId]			[uniqueidentifier]	NOT NULL,
	[txtSymbol]			[ntext]			NOT NULL,
	[dtDeploymentTime] 		[datetime] 		NOT NULL

	CONSTRAINT dta_ServiceSymbols_Unique	PRIMARY KEY(uidServiceId, dtDeploymentTime)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_ServiceSymbols] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_ServiceSymbols] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_Group
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_Group] (
	[nGroupId]			[int]			NOT NULL IDENTITY(1, 1),
	[strGroupName] 			[nvarchar] (256) 	NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_Group] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_Group] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_Host
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_Host] (
	[nHostId]		[int]				NOT NULL,
	[strHostName]		[nvarchar] (256) 		NOT NULL

	CONSTRAINT dta_Host_unique_nHostId			PRIMARY KEY(nHostId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_Host] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_Host] TO BTS_OPERATORS
GO

CREATE UNIQUE INDEX dta_Host_Index_HostName ON dta_Host(strHostName) ON [PRIMARY]
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_MessageBox
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_MessageBox] (
	[nMessageBoxId]			[int]				NOT NULL,
	[strDBServer]			[nvarchar] (63) 		NOT NULL,
	[strDBName]			[nvarchar] (128) 		NOT NULL

	CONSTRAINT dta_MessageBox_unique_nMessageBoxId		PRIMARY KEY(nMessageBoxId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_MessageBox] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_MessageBox] TO BTS_OPERATORS
GO

CREATE UNIQUE INDEX dta_MessageBox_Index_ServerAndName ON dta_MessageBox(strDBServer, strDBName) ON [PRIMARY]
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_ServiceState
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_ServiceState] (
	[nServiceStateId]		[int]				NOT NULL,
	[strState]			[nvarchar] (256)		NOT NULL

	CONSTRAINT	dta_ServiceState_unique_stateid			PRIMARY KEY(nServiceStateId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_ServiceState] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_ServiceState] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_ServiceInstances
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_ServiceInstances] (
	[nServiceInstanceId]		[bigint]				NOT NULL IDENTITY(1, 1),
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
        [bExceptionsOccurred]   	[int]                       		NOT NULL DEFAULT(0),
	[dtInsertionTimeStamp] 		[datetime] 				NULL CONSTRAINT ServiceInstances_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_ServiceInstances] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_ServiceInstances] TO BTS_OPERATORS
GO

CREATE UNIQUE CLUSTERED INDEX CIX_ServiceInstances ON dta_ServiceInstances(uidServiceInstanceId, uidActivityId) ON [PRIMARY]
GO

--this is used for purging and needs the serviceid and activity id to avoid bookmark loopups
CREATE INDEX IX_ServiceInstances ON dta_ServiceInstances(dtEndTime, dtInsertionTimeStamp, uidServiceInstanceId, uidActivityId)
GO

CREATE INDEX dta_ServiceInstances_index_dtStartTime		ON dta_ServiceInstances(dtStartTime)
GO

--/--------------------------------------------------------------------------------------------------------
--/--
--	TABLE: dta_ServiceExceptions
--/--
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_ServiceInstanceExceptions] (
	[uidActivityId]			[uniqueidentifier] 			NOT NULL,
	[uidServiceInstanceId]		[uniqueidentifier] 			NOT NULL,
	[bTopLevelException]    	[int]                       		NOT NULL,
	[txtErrorInfo] 			[ntext]	    				NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_ServiceInstanceExceptions] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_ServiceInstanceExceptions] TO BTS_OPERATORS
GO

CREATE CLUSTERED INDEX dta_ServiceInstanceExceptions_index_uidActivityId ON dta_ServiceInstanceExceptions(uidServiceInstanceId, uidActivityId) ON [PRIMARY]
GO

--/--------------------------------------------------------------------------------------------------------
--/--
--	Technical Details Related Tables
--/--
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_DebugTrace
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_DebugTrace] (
	[nDebugTraceId]			[bigint]			NOT NULL IDENTITY(1, 1),
	[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
	[vtInstructionId]		[uniqueidentifier]		NOT NULL,
	[nServiceSequence] 		[int] 				NOT NULL ,
	[nBeginInternalSequence]	[int]				NOT NULL,
	[nEndInternalSequence] 		[int] 				NULL ,
	[dtBeginTimeStamp] 		[datetime] 			NULL ,
	[dtEndTimeStamp] 		[datetime] 			NULL ,
	[dtInsertionTimeStamp]		[datetime]			NULL CONSTRAINT DebugTrace_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())

) ON [PRIMARY]
GO

 CREATE UNIQUE CLUSTERED INDEX [dta_DebugTrace_index_uidInstanceId] ON [dbo].[dta_DebugTrace]([uidServiceInstanceId], [nServiceSequence], [nDebugTraceId])
GO

 CREATE  UNIQUE  INDEX [IX_dta_DebugTrace_TimeStamp] ON [dbo].[dta_DebugTrace]([dtEndTimeStamp], [dtInsertionTimeStamp], [nDebugTraceId]) ON [PRIMARY]
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_CallChain
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_CallChain] (
	[nCallChainId]			[bigint]			NOT NULL IDENTITY(1, 1),
	[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
	[vtCallersActionId]		[nvarchar] (60)			NULL, -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
	[uidCallersServiceId]		[uniqueidentifier]		NULL,
	[nCallersServiceSequence]	[int]				NULL,
	[uidCalleesServiceId]		[uniqueidentifier]		NOT NULL,
	[nCalleesServiceSequence]	[int]				NOT NULL,
	[dtTimeStamp]			[datetime]			NOT NULL CONSTRAINT CallChain_TimeStamp_Dflt DEFAULT (GetUTCDate()),
	[dtInsertionTimeStamp]		[datetime]			NULL CONSTRAINT CallChain_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())
) ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX dta_CallChain_index_uidInstanceId on dta_CallChain(uidServiceInstanceId, nCallChainId) ON [PRIMARY]
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_dta_CallChain_TimeStamp] ON [dbo].[dta_CallChain]([dtTimeStamp], [dtInsertionTimeStamp], [nCallersServiceSequence], nCallChainId)
GO

--/--------------------------------------------------------------------------------------------------------
--/--
--	Message Related Tables
--/--
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_MessageStatus
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_MessageStatus] (
	[nMessageStatusId]		[int] 				NOT NULL ,
	[strStatus]	 		[nvarchar] (128) 		NOT NULL, 

	CONSTRAINT dta_MessageStatus_unique_nMessageStatusId	PRIMARY KEY(nMessageStatusId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_MessageStatus] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_MessageStatus] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_Adapter
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_Adapter] (
	[nAdapterId]		[int]					NOT NULL,
	[strAdapter]		[nvarchar] (256)			NOT NULL

	CONSTRAINT dta_Adapter_unique_nAdapterId		PRIMARY KEY(nAdapterId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_Adapter] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_Adapter] TO BTS_OPERATORS
GO

CREATE UNIQUE INDEX dta_Adapter_index_strAdapter ON dta_Adapter(strAdapter)
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_SchemaName
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_SchemaName] (
	[nSchemaId]			[int]			NOT NULL,
	[strSchemaName]			[nvarchar] (256)	NOT NULL

	CONSTRAINT dta_SchemaName_unique_nSchemaId		PRIMARY KEY(nSchemaId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_SchemaName] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_SchemaName] TO BTS_OPERATORS
GO

CREATE UNIQUE INDEX dta_SchemaName_index_strSchemaName ON dta_SchemaName(strSchemaName)
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_SigningSubject
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_SigningSubject] (
	[nSigningSubjectId]		[int]				NOT NULL,
	[strSigningSubject]		[nvarchar] (256)		NOT NULL

	CONSTRAINT dta_SigningSubject_unique_nSigningSubjectId		PRIMARY KEY(nSigningSubjectId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_SigningSubject] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_SigningSubject] TO BTS_OPERATORS
GO

CREATE UNIQUE INDEX dta_SigningSubject_index_strSigningSubject ON dta_SigningSubject(strSigningSubject)
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_DecryptionSubject
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_DecryptionSubject] (
	[nDecryptionSubjectId]		[int]				NOT NULL,
	[strDecryptionSubject]		[nvarchar] (256)		NOT NULL

	CONSTRAINT dta_DecryptionSubject_unique_nDecryptionSubjectId		PRIMARY KEY(nDecryptionSubjectId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_DecryptionSubject] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_DecryptionSubject] TO BTS_OPERATORS
GO

CREATE UNIQUE INDEX dta_DecryptionSubject_index_strDecryptionSubject ON dta_DecryptionSubject(strDecryptionSubject)
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_PartyName
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_PartyName] (
	[nPartyId]			[int]				NOT NULL,
	[strPartyName]			[nvarchar] (256)		NOT NULL

	CONSTRAINT dta_PartyName_unique_nPartyId		PRIMARY KEY(nPartyId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_PartyName] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_PartyName] TO BTS_OPERATORS
GO

CREATE UNIQUE INDEX dta_PartyName_index_strPartyName ON dta_PartyName(strPartyName)
GO


--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_PortName
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_PortName] (
	[nPortId]			[int]						NOT NULL,
	[strPortName]		[nvarchar] (256)			NOT NULL

	CONSTRAINT dta_PortName_unique_nPortId			PRIMARY KEY(nPortId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_PortName] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_PortName] TO BTS_OPERATORS
GO

CREATE UNIQUE INDEX dta_PortName_index_strPortName ON dta_PortName(strPortName)
GO



--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_MessageFields
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_MessageFields] (
	[nMessageFieldsId]		[int]						NOT NULL,
	[strFieldName]			[nvarchar] (256)			NULL,
	[nFieldType]			[int]						NULL,
	[nSchemaId]				[bigint]					NOT NULL

	CONSTRAINT dta_MessageFields_unique_nMessageFieldsId		PRIMARY KEY(nMessageFieldsId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_MessageFields] TO BTS_ADMIN_USERS
GO

CREATE UNIQUE INDEX dta_MessageFields_index_FieldNameAndType ON dta_MessageFields(nSchemaId, strFieldName, nFieldType) ON [PRIMARY]
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_MessageFieldValues
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_MessageFieldValues] (
	[nMessageFieldValueId]	[bigint]				NOT NULL IDENTITY(1, 1),
	[uidMessageInstanceId]	[uniqueidentifier]			NOT NULL,
	[nMessageFieldsId]	[bigint]				NOT NULL,
	[nSchemaId]		[bigint]				NULL,
	[vtValue]		[sql_variant]				NULL,
	[nValueIndex]		[int]					NOT NULL,
	[dtTimeStamp]		[datetime]				NOT NULL CONSTRAINT MessageFieldValues_TimeStamp_Dflt DEFAULT (GetUTCDate())
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_MessageFieldValues] TO BTS_ADMIN_USERS
GO

CREATE CLUSTERED INDEX CIX_MessageFieldValues ON dta_MessageFieldValues(nSchemaId, nMessageFieldsId, nValueIndex) ON [PRIMARY]
GO

CREATE UNIQUE INDEX IX_MessageFieldValues ON dta_MessageFieldValues(uidMessageInstanceId, nSchemaId, nMessageFieldsId, nValueIndex) ON [PRIMARY]
GO

CREATE UNIQUE INDEX IX2_MessageFieldValues ON dta_MessageFieldValues(dtTimeStamp, nMessageFieldValueId) ON [PRIMARY]
GO


--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_MessageInOutEvents
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_MessageInOutEvents] (
	[nEventId]			[bigint]			NOT NULL IDENTITY (1, 1),
	[uidActivityId]			[uniqueidentifier]		NOT NULL,
	[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
	[uidMessageInstanceId]		[uniqueidentifier]		NOT NULL,
	[nAdapterId]			[bigint]			NOT NULL,
	[nDecryptionSubjectId]		[int]				NOT NULL,
	[nSigningSubjectId]		[int]				NOT NULL,
	[nPartyId]			[bigint]			NOT NULL,
	[nPortId]			[bigint]			NOT NULL,
	[dtTimestamp]			[datetime] 			NOT NULL,
	[nStatus]			[int] 				NOT NULL,
	[nSchemaId]			[int]				NOT NULL,
	[nPartCount]			[int]				NULL,
	[nMessageSize]			[bigint]			NULL,
	[strUrl]			[nvarchar](1024)		NULL,
	[dtInsertionTimeStamp]		[datetime]			NULL CONSTRAINT MessageInOutEvents_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())
) ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX dta_MessageInOutEvents_index_MessageId ON dta_MessageInOutEvents(uidMessageInstanceId, nEventId) ON [PRIMARY]
GO

CREATE UNIQUE INDEX dta_MessageInOutEvents_index_ActivityId ON dta_MessageInOutEvents(uidServiceInstanceId, uidActivityId, uidMessageInstanceId, nEventId) ON [PRIMARY]
GO

CREATE UNIQUE INDEX dta_MessageInOutEvents_index_dtTimestamp	ON dta_MessageInOutEvents(dtTimestamp, dtInsertionTimeStamp, nEventId)
GO
GRANT SELECT ON [dbo].[dta_MessageInOutEvents] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_MessageInOutEvents] TO BTS_OPERATORS
GO


--/--------------------------------------------------------------------------------------------------------
--/--
--	Both health monitoring and business related tables
--/--
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_Cubes
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_Cubes] (
	[nCubeId]				[bigint] IDENTITY (1, 1) 	NOT NULL,
	[uidCubeId]		 		[uniqueidentifier] 			NOT NULL,
	[strName] 				[nvarchar] (256) 			NOT NULL,
	[strComment]			[nvarchar] (512)			NULL,
	[dtDeploymentTime]		[datetime]					NOT NULL,
	[nCheckSum]				[int]						NOT NULL,
	[imgProfile]			[image]						NULL

	CONSTRAINT dta_cubes_unique_cubeid					PRIMARY KEY(nCubeId)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX dta_cubes_name ON dta_Cubes(strName)
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_ItemTypes
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_ItemTypes] (
	[nItemTypeId]			[int]						NOT NULL,
	[strType]				[nvarchar] (100) 			NOT NULL

	CONSTRAINT dta_itemtypes_unique_itemtype			PRIMARY KEY(nItemTypeId)
) ON [PRIMARY]
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_Items
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_Items] (
	[nItemId]				[bigint]					NOT NULL,	-- This is some kind of identity. It resets per cube.
	[strItemId]				[nvarchar] (50)				NOT NULL,	-- normally this should be guid, but for analysis services, it is a string
	[strFriendlyName]		[nvarchar] (256) 			NOT NULL,	-- The name of the item that the user enters
	[nItemTypeId]			[int] 						NOT NULL,
	[nCubeId]				[bigint]					NOT NULL

	CONSTRAINT dta_items_unique_itemcubetype			PRIMARY KEY(nItemId, nCubeId, nItemTypeId),
	CONSTRAINT dta_items_foreign_cubeid					FOREIGN KEY(nCubeId) REFERENCES dta_Cubes(nCubeId),
	CONSTRAINT dta_items_foreign_typeid					FOREIGN KEY(nItemTypeId) REFERENCES dta_ItemTypes(nItemTypeId)
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[dta_Items] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[dta_Items] TO BTS_OPERATORS
GO

CREATE INDEX dta_items_index_stritemid ON dta_Items(strItemId)
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: dta_ProcessState
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[dta_ProcessState] (
	[nProcessStateId]		[int]						NOT NULL,
	[strProcessState]		[nvarchar] (50)				NOT NULL 

	CONSTRAINT dta_processstate_unique_stateid			PRIMARY KEY(nProcessStateId)
) ON [PRIMARY]
GO


--/-------------------------------------------------------------
-- Lets disable page locks on the key tables
--/----------------------------------------------------------
EXEC sp_indexoption '[dbo].[dta_ServiceInstances]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_ServiceInstanceExceptions]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_MessageInOutEvents]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_MessageFieldValues]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_CallChain]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[dta_DebugTrace]', 'disallowpagelocks', TRUE
GO
--/--------------------------------------------------------------------------------------------------------
--
--	Insert default values
--
--/--------------------------------------------------------------------------------------------------------
-- /********************************************************************
--	Services Table
-- ********************************************************************/
set nocount on
declare @localized_string_service_unknown as nvarchar(128)
set @localized_string_service_unknown = N'Unknown'

INSERT INTO dta_Services (uidServiceId, uidNonVersionId, strServiceType, strServiceName, strAssemblyName, strAssemblyVersion, dtDeploymentTime, txtSymbol) VALUES (N'{00000000-0000-0000-0000-000000000000}', N'{00000000-0000-0000-0000-000000000000}', @localized_string_service_unknown, @localized_string_service_unknown, @localized_string_service_unknown, @localized_string_service_unknown, GETUTCDATE(), null)

-- /********************************************************************
--	Message Status Table
-- ********************************************************************/
declare @localized_string_message_status_receive as nvarchar(128)
set @localized_string_message_status_receive = N'Receive'
declare @localized_string_message_status_send as nvarchar(128)
set @localized_string_message_status_send = N'Send'
declare @localized_string_message_status_in_transmission as nvarchar(128)
set @localized_string_message_status_in_transmission = N'In Transmission'
declare @localized_string_message_status_transmission_failure_retry as nvarchar(128)
set @localized_string_message_status_transmission_failure_retry = N'Transmission Failure (To be retried)'
declare @localized_string_message_status_transmission_failure as nvarchar(128)
set @localized_string_message_status_transmission_failure = N'Transmission Failure'
declare @localized_string_message_status_transmission_retry as nvarchar(128)
set @localized_string_message_status_transmission_retry = N'Transmission Retry'
declare @localized_string_message_status_transmission_failure_failover as nvarchar(128)
set @localized_string_message_status_transmission_failure_failover = N'Transmission Failure (To be resubmitted in back up transport)'
declare @localized_string_message_status_transmission_redirect as nvarchar(128)
set @localized_string_message_status_transmission_redirect = N'Message is Republished due to Transmission Redirect'
declare @localized_string_message_status_transmission_republish as nvarchar(128)
set @localized_string_message_status_transmission_republish = N'Message is Republished'
declare @localized_string_message_status_btf_transmit_success as nvarchar(128)
set @localized_string_message_status_btf_transmit_success = N'Transmission completed successfully. Waiting for an acknowledgement'


INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (0, @localized_string_message_status_receive)
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (1, @localized_string_message_status_send)
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (2, @localized_string_message_status_in_transmission)
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (3, @localized_string_message_status_transmission_failure_retry)
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (4, @localized_string_message_status_transmission_retry)
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (5, @localized_string_message_status_transmission_failure)
-- Republish cases
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (6, @localized_string_message_status_transmission_failure_failover)
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (7, @localized_string_message_status_transmission_redirect)
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (8, @localized_string_message_status_transmission_republish)
-- BTT
INSERT INTO dta_MessageStatus (nMessageStatusId, strStatus) values (9, @localized_string_message_status_btf_transmit_success)

-- /********************************************************************
--	Service State Table
-- ********************************************************************/
declare @localized_string_service_state_running as nvarchar(128)
set @localized_string_service_state_running = N'Started'
declare @localized_string_service_state_completed as nvarchar(128)
set @localized_string_service_state_completed = N'Completed'
declare @localized_string_service_state_terminated as nvarchar(128)
set @localized_string_service_state_terminated = N'Terminated'

INSERT INTO dta_ServiceState (nServiceStateId, strState) VALUES (1, @localized_string_service_state_running)
INSERT INTO dta_ServiceState (nServiceStateId, strState) VALUES (2, @localized_string_service_state_completed)
INSERT INTO dta_ServiceState (nServiceStateId, strState) VALUES (3, @localized_string_service_state_terminated)

-- /********************************************************************
--	Item Types Table
-- ********************************************************************/
-- Localization Warning: Below are all SQL or OLAP terms
declare @localized_string_item_types_query_view as nvarchar(128)
set @localized_string_item_types_query_view = N'Query View'

declare @localized_string_item_types_fact_table as nvarchar(128)
set @localized_string_item_types_fact_table = N'Fact Table'

declare @localized_string_item_types_process_table as nvarchar(128)
set @localized_string_item_types_process_table = N'Process Table'

declare @localized_string_item_types_data_dimension_table as nvarchar(128)
set @localized_string_item_types_data_dimension_table = N'Data Dimension Table'

declare @localized_string_item_types_cube as nvarchar(128)
set @localized_string_item_types_cube = N'Cube'

declare @localized_string_item_types_stored_procedure as nvarchar(128)
set @localized_string_item_types_stored_procedure = N'Stored Procedure'

declare @localized_string_item_types_measures as nvarchar(128)
set @localized_string_item_types_measures = N'Measures'

declare @localized_string_item_types_fact_view as nvarchar(128)
set @localized_string_item_types_fact_view = N'Fact View'

INSERT INTO dta_ItemTypes (nItemTypeId, strType) values (1, @localized_string_item_types_query_view)
INSERT INTO dta_ItemTypes (nItemTypeId, strType) values (2, @localized_string_item_types_fact_table)
INSERT INTO dta_ItemTypes (nItemTypeId, strType) values (3, @localized_string_item_types_process_table)
INSERT INTO dta_ItemTypes (nItemTypeId, strType) values (4, @localized_string_item_types_data_dimension_table)
INSERT INTO dta_ItemTypes (nItemTypeId, strType) values (5, @localized_string_item_types_cube)
INSERT INTO dta_ItemTypes (nItemTypeId, strType) values (6, @localized_string_item_types_stored_procedure)
INSERT INTO dta_ItemTypes (nItemTypeId, strType) values (7, @localized_string_item_types_measures)
INSERT INTO dta_ItemTypes (nItemTypeId, strType) values (8, @localized_string_item_types_fact_view)

-- /********************************************************************
--	Cubes
-- ********************************************************************/
declare @localized_string_cubes_service_facts as nvarchar(128)
set @localized_string_cubes_service_facts = N'Service Facts'

declare @localized_string_cubes_service_metrics as nvarchar(128)
set @localized_string_cubes_service_metrics = N'ServiceMetrics'

declare @localized_string_cubes_service_facts_cube as nvarchar(128)
set @localized_string_cubes_service_facts_cube = N'Service Facts Cube'

declare @localized_string_cubes_service_facts_view as nvarchar(128)
set @localized_string_cubes_service_facts_view = N'Service Facts View'

declare @localized_string_cubes_message_facts as nvarchar(128)
set @localized_string_cubes_message_facts = N'Message Facts'

declare @localized_string_cubes_message_metrics as nvarchar(128)
set @localized_string_cubes_message_metrics = N'MessageMetrics'

declare @localized_string_cubes_message_facts_cube as nvarchar(128)
set @localized_string_cubes_message_facts_cube = N'Message Facts Cube'

declare @localized_string_cubes_message_facts_view as nvarchar(128)
set @localized_string_cubes_message_facts_view = N'Message Facts View'

INSERT INTO dta_Cubes (uidCubeId, strName, strComment, dtDeploymentTime, nCheckSum) values (N'{E10B0F95-2FE5-4e7d-B8B6-71FDC226DBD5}', @localized_string_cubes_service_facts, N'', GETUTCDATE(), 0)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (1, N'[dbo].[dtav_ServiceFacts]', 1, @localized_string_cubes_service_facts_cube, 1)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (2, @localized_string_cubes_service_metrics, 1, @localized_string_cubes_service_facts_view, 5)

INSERT INTO dta_Cubes (uidCubeId, strName, strComment, dtDeploymentTime, nCheckSum) values (N'{F2EC8390-06B9-48f7-B99E-2E11348D9AA2}', @localized_string_cubes_message_facts, N'', GETUTCDATE(), 0)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (1, N'[dbo].[dtav_MessageFacts]', 2, @localized_string_cubes_message_facts_cube, 1)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (2, @localized_string_cubes_message_metrics, 2, @localized_string_cubes_message_facts_view, 5)

INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (1, N'[dbo].[dtasp_ServiceBegin]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (2, N'[dbo].[dtasp_ServiceEnd]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (3, N'[dbo].[dtasp_CtxBegin]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (4, N'[dbo].[dtasp_CtxEnd]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (5, N'[dbo].[dtasp_MsgIn]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (6, N'[dbo].[dtasp_MsgOut]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (7, N'[dbo].[dtasp_OrchestrationBreakpoint]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (8, N'[dbo].[dtasp_SuspendDirect]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (9, N'[dbo].[dtasp_ResumeDirect]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (10, N'[dbo].[dtasp_TerminateSuspended]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (11, N'[dbo].[dtasp_TerminateRunning]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (12, N'[dbo].[dtasp_InsertMessageField]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (13, N'[dbo].[dtasp_ServiceStateChange]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (14, N'[dbo].[dtasp_ServiceError]', 1, N'', 6)
INSERT INTO dta_Items (nItemId, strItemId, nCubeId, strFriendlyName, nItemTypeId) values (15, N'[dbo].[dtasp_ChangeMsgState]', 1, N'', 6)

declare @localized_string_process_state_not_hit as nvarchar(128)
set @localized_string_process_state_not_hit = N'Not hit'

declare @localized_string_process_state_running as nvarchar(128)
set @localized_string_process_state_running = N'Running'

declare @localized_string_process_state_completed as nvarchar(128)
set @localized_string_process_state_completed = N'Completed'

declare @localized_string_process_state_failed as nvarchar(128)
set @localized_string_process_state_failed = N'Failed'

declare @localized_string_process_state_in_exception as nvarchar(128)
set @localized_string_process_state_in_exception = N'In Exception'

INSERT INTO dta_ProcessState (nProcessStateId, strProcessState) values (1, @localized_string_process_state_not_hit)
INSERT INTO dta_ProcessState (nProcessStateId, strProcessState) values (2, @localized_string_process_state_running)
INSERT INTO dta_ProcessState (nProcessStateId, strProcessState) values (3, @localized_string_process_state_completed)
INSERT INTO dta_ProcessState (nProcessStateId, strProcessState) values (4, @localized_string_process_state_failed)
INSERT INTO dta_ProcessState (nProcessStateId, strProcessState) values (5, @localized_string_process_state_in_exception)
GO

/******************************************************************************
* Archiving related tables
*******************************************************************/

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
        [bExceptionsOccurred]   	[int]                       		NOT NULL DEFAULT(0),
	[dtInsertionTimeStamp] 		[datetime] 				NULL	

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
	[nStatus]			[int] 					NOT NULL,
	[dtInsertionTimeStamp] 		[datetime] 				NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dta_CallChainTemp] (
	[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
	[vtCallersActionId]		[nvarchar] (60)			NULL,
	[uidCallersServiceId]		[uniqueidentifier]		NULL,
	[nCallersServiceSequence]	[int]				NULL,
	[uidCalleesServiceId]		[uniqueidentifier]		NOT NULL,
	[nCalleesServiceSequence]	[int]				NOT NULL,
	[dtInsertionTimeStamp] 		[datetime] 			NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dta_DebugTraceTemp] (
	[uidServiceInstanceId]		[uniqueidentifier]		NOT NULL,
	[vtInstructionId]		[uniqueidentifier]		NOT NULL, 
	[nServiceSequence]		[int]				NOT NULL,
	[nBeginInternalSequence]	[int]				NOT NULL,
	[nEndInternalSequence]		[int]				NULL,
	[dtBeginTimeStamp] 		[datetime]			NULL,
	[dtEndTimeStamp] 		[datetime]			NULL,
	[dtInsertionTimeStamp] 		[datetime] 			NULL
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

