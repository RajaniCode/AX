IF OBJECT_ID('adm_OtherDatabases') IS NULL
BEGIN
	CREATE TABLE [adm_OtherDatabases]([DefaultDatabaseName] nvarchar(128) NOT NULL, [DatabaseName] nvarchar(128) not NULL, [ServerName] nvarchar(80) not NULL, [BTSServerName] nvarchar(80) not NULL)
	ALTER TABLE [adm_OtherDatabases] ADD CONSTRAINT [adm_OtherDatabases_PK] PRIMARY KEY ([DefaultDatabaseName], [BTSServerName])
END
GO

--//
--// Updates for Orchestration Event Stream
--//
DECLARE	@rowCount INT
SELECT	@rowCount = COUNT(*) 
FROM	TDDS_CustomFormats
WHERE	FormatID = N'{1a6c57f0-3826-4254-9a91-9813a4cf2fce}'

IF (@rowCount = 0)
BEGIN
	INSERT INTO	TDDS_CustomFormats(
		FormatID,
		DecoderClass,
		DllName
	)
	VALUES(
		N'{1a6c57f0-3826-4254-9a91-9813a4cf2fce}', 
		N'Microsoft.BizTalk.Bam.EventBus.DotNetDeserializer', 
		N'Microsoft.BizTalk.Bam.EventBus.dll'
	)
END
GO

--//
--// Upgrade Throttling Defaults

UPDATE [dbo].[adm_Host]
SET	MessageDeliverySampleSpaceSize    = 100,
	MessageDeliverySampleSpaceWindow  = 15000,
	MessageDeliveryOverdriveFactor    = 125,
	MessageDeliveryMaximumDelay       = 300000,
	MessagePublishSampleSpaceSize     = 100,
	MessagePublishSampleSpaceWindow   = 15000,
	MessagePublishOverdriveFactor     = 125,
	MessagePublishMaximumDelay        = 300000,
	DeliveryQueueSize                 = 100,
	DBSessionThreshold                = 0,
	GlobalMemoryThreshold             = 0,
	ProcessMemoryThreshold            = 25,
	ThreadThreshold                   = 0,
	DBQueueSizeThreshold              = 50000,
	InflightMessageThreshold          = 1000
GO

	
--Remove this for BETA2 as Yukon has fixed their bug
--*******************************************************
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_LocalDate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bts_LocalDate]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_UTCDate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bts_UTCDate]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_UpdateStoredTimeStamps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  drop procedure [dbo].[bts_UpdateStoredTimeStamps]
GO


--************************************************************************


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_LocalDate]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[admv_LocalDate]
GO

CREATE VIEW [dbo].[admv_LocalDate]
AS
	SELECT GetDate() AS LocalDate
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_UTCDate]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[admv_UTCDate]
GO

CREATE VIEW [dbo].[admv_UTCDate]
AS
	SELECT GetUTCDate() AS UTCDate
GO
	

/*****************************************************************************************************
		[dbo].[admv_BackupDatabases]

	View of all databases which we need to backup
***************************************************************************************************/

CREATE VIEW [dbo].[admv_BackupDatabases]
AS

	SELECT CAST(SERVERPROPERTY('servername') as sysname) as ServerName, DB_NAME() as DatabaseName
	
	UNION
	
	SELECT TrackingDBServerName as ServerName, TrackingDBName as DatabaseName FROM [dbo].[adm_Group] 
	WHERE TrackingDBServerName IS NOT NULL AND TrackingDBServerName != '' 

	UNION
	
	SELECT BamDBServerName as ServerName, BamDBName as DatabaseName FROM [dbo].[adm_Group] 
	WHERE BamDBServerName IS NOT NULL AND BamDBServerName != ''
	
	UNION
	
	SELECT RuleEngineDBServerName as ServerName, RuleEngineDBName as DatabaseName FROM [dbo].[adm_Group] 
	WHERE RuleEngineDBServerName IS NOT NULL AND RuleEngineDBServerName != ''
	
	UNION

	SELECT 	DBServerName as ServerName, DBName as DatabaseName FROM [dbo].[adm_MessageBox]
	WHERE DBServerName IS NOT NULL AND DBServerName != ''
	
	UNION 
	
	SELECT ServerName, DatabaseName	FROM [dbo].[adm_OtherBackupDatabases]
	WHERE ServerName IS NOT NULL AND ServerName != ''
	GROUP BY ServerName, DatabaseName --group by here so we can handle dupe rows
GO


--alter the adm_BackupHistory table to keep the server name as a column
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'unq_admBackupHistory_BackupSetId_DatabaseName')
BEGIN
	ALTER TABLE [adm_BackupHistory] DROP CONSTRAINT [unq_admBackupHistory_BackupSetId_DatabaseName]
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'ServerName' AND id = object_id('adm_BackupHistory') )
BEGIN
	ALTER TABLE [dbo].[adm_BackupHistory] ADD ServerName nvarchar(128) NULL --only null for upgrade
END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_BackupHistory')
BEGIN
	CREATE UNIQUE INDEX [IX_BackupHistory] ON [adm_BackupHistory]( BackupSetId, DatabaseName, ServerName  )

END
GO



-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Remove existing Admin schema
-- //////////////////////////////////////////////////////////////////////////////////////////////////
ALTER PROCEDURE [dbo].[adm_removeschema]
AS

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_removeschema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[adm_removeschema]

   --/---------------------------------------------------------------------------------------------------------------
   --// Trackinginterceptor Configuration tables
   --/---------------------------------------------------------------------------------------------------------------
   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StaticTrackingInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[StaticTrackingInfo]
   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackinginterceptorVersions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[TrackinginterceptorVersions]
   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Trackinginterceptor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Trackinginterceptor]
   

	--/---------------------------------------------------------------------------------------------------------------
	--// Specific Constraints
	--/---------------------------------------------------------------------------------------------------------------
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group_fk_DefaultHost]')and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
		alter table [dbo].[adm_Group] drop constraint adm_Group_fk_DefaultHost

	--/---------------------------------------------------------------------------------------------------------------
	--// Admin tables
	--/---------------------------------------------------------------------------------------------------------------
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ServiceClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_ServiceClass]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveLocation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_ReceiveLocation]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_AdapterAlias]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_AdapterAlias]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_DefaultReceiveHandler]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_DefaultReceiveHandler]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveHandler]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_ReceiveHandler]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_SendHandler]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveService]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_ReceiveService]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstanceZombie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_HostInstanceZombie]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_HostInstance]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Server2HostMapping]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Host]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance_SubServices]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_HostInstance_SubServices]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_MessageBox]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Group]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Server]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Adapter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Adapter]

	--/---------------------------------------------------------------------------------------------------------------
	--// Backup tables and views
	--/---------------------------------------------------------------------------------------------------------------
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_BackupHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) 
		DROP TABLE [dbo].[adm_BackupHistory]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_OtherBackupDatabases]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 		DROP TABLE [dbo].[adm_OtherBackupDatabases]

	IF exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ForceFullBackup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE [dbo].[adm_ForceFullBackup]

	IF exists (select * from sysobjects where id = object_id(N'[dbo].[adm_BackupSetId]' ) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE [dbo].[adm_BackupSetId]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[adm_BackupWriterLock]' ) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE [dbo].[adm_BackupWriterLock]

	IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_BackupDatabases]') and OBJECTPROPERTY(id, N'IsView') = 1)
		DROP VIEW [dbo].[admv_BackupDatabases]
	--/------------------------------------------------------------------------------------------------------
	--// Views for getting local and utc date values for access in user functions
	--/------------------------------------------------------------------------------------------------------
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_UTCDate]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[admv_UTCDate]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_LocalDate]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[admv_LocalDate]

	--/------------------------------------------------------------------------------------------------------
	--// BAS Table
	--/------------------------------------------------------------------------------------------------------
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[bas_Properties]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE [dbo].[bas_Properties]

	--/------------------------------------------------------------------------------------------------------
	--// TPE Table
	--/------------------------------------------------------------------------------------------------------
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_TrackPoints]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_TrackPoints]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_TrackingProfiles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_TrackingProfiles]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_ActivityToOrchestrationMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_ActivityToOrchestrationMapping]
GO

-- Reset Message tracking options for pipelines, that was erroneously set in previous upgrade
DECLARE @uidServiceId uniqueidentifier
DECLARE @uidInterceptorId uniqueidentifier
DECLARE @trackingOptionLowByte varbinary(1)
DECLARE @tempTxtPtr varbinary(16)

DECLARE trackingInfo_cursor CURSOR FOR
    SELECT uidServiceId, uidInterceptorId FROM StaticTrackingInfo WHERE uidInterceptorId = '{D90B63BA-3EEB-4E8A-A20E-7BE683319552}'

OPEN trackingInfo_cursor

FETCH NEXT FROM trackingInfo_cursor
    INTO @uidServiceId, @uidInterceptorId

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @trackingOptionLowByte = SUBSTRING(imgData, 1, 1),
            @tempTxtPtr = textptr(StaticTrackingInfo.imgData)
        FROM StaticTrackingInfo 
        WHERE uidServiceId = @uidServiceId AND uidInterceptorId = @uidInterceptorId

    IF(@tempTxtPtr is not null)
    BEGIN
        SET @trackingOptionLowByte = @trackingOptionLowByte & (~32) & (~64)
        UPDATETEXT StaticTrackingInfo.imgData @tempTxtPtr 0 1 @trackingOptionLowByte 
    END

    FETCH NEXT FROM trackingInfo_cursor
    INTO @uidServiceId, @uidInterceptorId
END
CLOSE trackingInfo_cursor
DEALLOCATE trackingInfo_cursor
GO
--

--Remove DB Latency Threshold
ALTER TABLE [dbo].[adm_Host] DROP CONSTRAINT		adm_Host_DBLatencyThreshold
GO

--Find and remove default constraint
DECLARE @defname VARCHAR(100), @cmd VARCHAR(1000)
SET @defname = (SELECT name 
		FROM sysobjects so JOIN sysconstraints sc
		ON so.id = sc.constid 
		WHERE object_name(so.parent_obj) = 'adm_Host' 
		AND so.xtype = 'D'
		AND sc.colid = (SELECT colid FROM syscolumns 
				WHERE id = object_id('dbo.adm_Host') AND 
				name = 'DBLatencyThreshold'))
SET @cmd = 'ALTER TABLE adm_Host DROP CONSTRAINT ' + @defname
EXEC(@cmd)
GO

ALTER TABLE [dbo].[adm_Host] DROP COLUMN		DBLatencyThreshold
GO
--

-- Need to update Adapters that do not support 64bit to add the new capability
UPDATE [dbo].[adm_Adapter] set Capabilities = Capabilities | 65536 where Name in (N'FTP', N'SQL', N'POP3')
GO

-- BAS Upgrade - There is no longer a dummy orchestration that needs to be started, so removing the entry
DELETE FROM [dbo].[bts_orchestration] where nvcFullName = N'Microsoft.BizTalk.KwTpm.BasRoleLinkType'
DELETE FROM [dbo].[bts_item] where FullName = N'Microsoft.BizTalk.KwTpm.BasRoleLinkType'

GO

IF NOT EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'adm_ReceiveLocation_ix_RH')
BEGIN
	CREATE NONCLUSTERED INDEX adm_ReceiveLocation_ix_RH ON [dbo].[adm_ReceiveLocation] (ReceiveHandlerId)
END
GO

-- Remove alias for POP3. Receive-only adapters don't need alias
DELETE FROM [dbo].[adm_AdapterAlias] WHERE AdapterId IN 
            (SELECT Id FROM [dbo].[adm_Adapter] WHERE MgmtCLSID='1787FCC1-9AAA-4BBD-9096-7EB77E3D9D9B')
GO

-- Remove the properties that were added in Beta1 timeframe but removed in Beta2 timeframe
DELETE FROM [dbo].[bt_DocumentSpec] WHERE msgtype='http://schemas.microsoft.com/BizTalk/2003/http-properties#ResponseStatusCode'
DELETE FROM [dbo].[bt_DocumentSpec] WHERE msgtype='http://schemas.microsoft.com/BizTalk/2003/http-properties#RequestMethod'
DELETE FROM [dbo].[bt_SensitiveProperties] WHERE msgtype='http://schemas.microsoft.com/BizTalk/2003/pop3-properties#ReplyTo'
DELETE FROM [dbo].[bt_DocumentSpec] WHERE msgtype='http://schemas.microsoft.com/BizTalk/2003/smtp-properties#UserSMTPHeaders'
GO


-- Update port tracking options
UPDATE [dbo].[bts_sendport] SET nTracking = ((nTracking | 64) & (~16)) WHERE (nTracking & 16) <> 0 AND (bTwoWay = 0)
GO

UPDATE [dbo].[bts_sendport] SET nTracking = (nTracking | 64) WHERE (nTracking & 16) <> 0 AND (bTwoWay = 1)
GO

UPDATE [dbo].[bts_sendport] SET nTracking = ((nTracking | 128) & (~32)) WHERE (nTracking & 32) <> 0 AND (bTwoWay = 0)
GO

UPDATE [dbo].[bts_sendport] SET nTracking = (nTracking | 128) WHERE (nTracking & 32) <> 0 AND (bTwoWay = 1)
GO

UPDATE [dbo].[bts_receiveport] SET nTracking = (nTracking | 64) WHERE (nTracking & 16) <> 0 AND (bTwoWay = 1)
GO

UPDATE [dbo].[bts_receiveport] SET nTracking = (nTracking | 128) WHERE (nTracking & 32) <> 0 AND (bTwoWay = 1)
GO
--
