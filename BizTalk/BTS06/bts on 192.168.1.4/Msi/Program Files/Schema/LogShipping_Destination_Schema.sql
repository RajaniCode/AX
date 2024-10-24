declare @ret int, @Error int

if not exists( select 1 from [dbo].[sysusers] where name=N'BTS_BACKUP_USERS' and issqlrole=1 )
 begin

	exec @ret = sp_addrole N'BTS_BACKUP_USERS'

	select @Error = @@ERROR

	if @ret <> 0 or @Error <> 0
		raiserror( 'Failed adding the ''BTS_BACKUP_USERS'' role', 16, -1 )
 end
GO

/**************************************************************************************************
	bts_LogShippingSource table

	Holds the difference BizTalk source systems.  There should be one entry for every BizTalk
	installation for which this destination server will provide a warm backup.  Basically this 
	provides a way to use a single warm backup server to support multiple BizTalk installations.
	There should be a one to one relationship between rows in this table and Management servers.
**************************************************************************************************/
IF OBJECT_ID('bts_LogShippingSource') IS NOT NULL
	DROP TABLE [dbo].[bts_LogShippingSource]
GO

CREATE TABLE [dbo].[bts_LogShippingSource]
(
	SourceId		int		IDENTITY (0,1) NOT NULL
	,SourceDesc		nvarchar(256)	NULL
	,MgmtDatabaseName	sysname		NOT NULL
	,MgmtServerName		nvarchar(256)	NOT NULL
)
GO

CREATE CLUSTERED INDEX [CIX_LogShippingSource] ON [bts_LogShippingSource]([SourceId])
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_LogShippingSource] ON [dbo].[bts_LogShippingSource]([MgmtDatabaseName], [MgmtServerName])
GO


/**************************************************************************************************
	bts_LogShippingDatabases table

	Holds the databases to restore for a given BizTalk source system.  
	There should be one entry for every database to be restored per BizTalk installation (or
	source system).
**************************************************************************************************/
IF OBJECT_ID('bts_LogShippingDatabases') IS NOT NULL
	DROP TABLE [dbo].[bts_LogShippingDatabases]
GO

CREATE TABLE [dbo].[bts_LogShippingDatabases]
(
	SourceId		int		NOT NULL
	,DatabaseName	sysname 	NOT NULL
	,ServerName		nvarchar(256) 	NOT NULL
	,DBFileLocation		nvarchar(1500)	NULL
	,LogFileLocation	nvarchar(1500) 	NULL
	,RestoreName		sysname 	NULL
)

ALTER TABLE [dbo].[bts_LogShippingDatabases] ADD CONSTRAINT uni_bts_LogShippingDatabases_SourceId_DatabaseName_ServerName UNIQUE (SourceId, DatabaseName, ServerName)

CREATE CLUSTERED INDEX idx_bts_LogShippingDatabases on [dbo].[bts_LogShippingDatabases]([SourceId])
GO


/**************************************************************************************************
	bts_LogShippingHistory table

	Holds the full and log backups.  These rows are imported from the source systems.  All 
	history rows from the source are imported regardless of the databases to be restored.  
	When a file is restored successfully the Restored column will be updated to 1
**************************************************************************************************/
IF OBJECT_ID( 'bts_LogShippingHistory' ) IS NOT NULL
	DROP TABLE [dbo].[bts_LogShippingHistory]
GO

CREATE TABLE [dbo].[bts_LogShippingHistory] (
	SourceId		int		NOT NULL
	,BackupId		bigint		NOT NULL
	,BackupSetId		bigint		NOT NULL
	,MarkName		nvarchar(32)	NULL
	,DatabaseName		nvarchar(128)	NOT NULL
	,ServerName		nvarchar(128)	NULL --leave this as null for upgrade scenario support
	,BackupFileName		nvarchar(500)	NOT NULL
	,BackupFileLocation	nvarchar(3000)	NOT NULL
	,BackupType		char(2)		NOT NULL
	,BackupDateTime		datetime	NOT NULL
	,SetComplete		bit		NOT NULL
	,Restored		bit		NOT NULL DEFAULT 0
	,RestoredDateTime	datetime	NULL
)

CREATE CLUSTERED INDEX idx_bts_LogShippingHistory_BackupSetId ON [dbo].[bts_LogShippingHistory]( [BackupSetId] )

CREATE UNIQUE NONCLUSTERED INDEX idx_bts_LogShippingHistory_SourceId_BackupSetId_DatabaseName ON [dbo].[bts_LogShippingHistory]( [SourceId], [BackupSetId], [DatabaseName] )

GRANT SELECT, UPDATE ON [dbo].[bts_LogShippingHistory] TO BTS_BACKUP_USERS

GO



/**************************************************************************************************
	bts_LogShippingHistory table

	Holds the full and log backups.  These rows are imported from the source systems.  All 
	history rows from the source are imported regardless of the databases to be restored.  
	When a file is restored successfully the Restored column will be updated to 1
**************************************************************************************************/
IF OBJECT_ID( 'bts_LogShippingLastRestoreSet' ) IS NOT NULL
	DROP TABLE [dbo].[bts_LogShippingLastRestoreSet]
GO

CREATE TABLE [dbo].[bts_LogShippingLastRestoreSet] (
	[SourceId]		int		NOT NULL CONSTRAINT pk_bts_LogShippingLastRestoreSet_SourceId PRIMARY KEY CLUSTERED
	,[BackupSetId]		bigint		NOT NULL
	,[RestoredToMark]	bit		NOT NULL DEFAULT (0)
)

GO


/***********************************************************************************************
		bts_LogShippingJobs

This table stores information about sql agent jobs associated with the databases which we are backing up
That way when we restore the dbs to the mark, we can recreate the agent jobs also so that they are ready to run
***************************************************************************************************/
IF OBJECT_ID( 'bts_LogShippingJobs' ) IS NOT NULL
	DROP TABLE [dbo].[bts_LogShippingJobs]
GO

CREATE TABLE [dbo].[bts_LogShippingJobs](
	[id] int IDENTITY (0,1) NOT NULL, --this is not the job_id, this is just an identity column
	[SourceId] int NOT NULL,
	[SourceDatabaseName] sysname NOT NULL,
	[job_name] sysname,
	[enabled] tinyint,
	[job_desc] nvarchar(512) NULL,
	[start_step_id] int,
	[category] sysname,
	[owner_login_name] sysname,
	[notify_level_eventlog] int,
	[notify_level_email] int,
	[notify_level_netsend] int, 
	[notify_level_page] int,
	[notify_email_operator_name] sysname NULL,
	[notify_netsend_operator_name] sysname NULL,
	[notify_page_operator_name] sysname NULL,
	[delete_level] int
)
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_LogShippingJobs] ON [bts_LogShippingJobs](job_name)
GO

/*******************************************************************************
*		bts_LogShippingJobSteps

This table contains information about the sql agent job steps associated with databases which 
we are backing up
*******************************************************************************/
IF OBJECT_ID( 'bts_LogShippingJobSteps' ) IS NOT NULL
	DROP TABLE [dbo].[bts_LogShippingJobSteps]
GO

CREATE TABLE [dbo].[bts_LogShippingJobSteps](
	[job_id] int NOT NULL, --link to Jobs table
	[step_id] int NOT NULL,
	[step_name] sysname NULL,
	[subsystem] nvarchar(40) NOT NULL,
	[command] nvarchar(3200) NULL,
	[cmdexec_success_code] int NOT NULL,
	[on_success_action] tinyint NOT NULL,
	[on_success_step_id] int NOT NULL,
	[on_fail_action] tinyint NOT NULL,
	[on_fail_step_id] int NOT NULL,
	[database_user_name] sysname NULL,
	[retry_attempts] int NOT NULL,
	[retry_interval] int NOT NULL
)
GO

/*****************************************************************************
		bts_LogShippingJobSchedules

Stores the schedule information for sql agent jobs associated with the databases
which we are backing up
***************************************************************************/
IF OBJECT_ID( 'bts_LogShippingJobSchedules' ) IS NOT NULL
	DROP TABLE [dbo].[bts_LogShippingJobSchedules]
GO

CREATE TABLE [dbo].[bts_LogShippingJobSchedules](
	[job_id] int NOT NULL, --link to Jobs table
	[sched_name] sysname NOT NULL,
	[enabled] tinyint NOT NULL,
	[freq_type] int NOT NULL,
	[freq_interval] int NOT NULL,
	[freq_subday_type] int NOT NULL,
	[freq_subday_interval] int NOT NULL,
	[freq_relative_interval] int NOT NULL,
	[freq_recurrence_factor] int NOT NULL,
	[active_start_date] int NULL,
	[active_end_date] int NOT NULL,
	[active_start_time] int NOT NULL,
	[active_end_time] int NOT NULL
)
GO

