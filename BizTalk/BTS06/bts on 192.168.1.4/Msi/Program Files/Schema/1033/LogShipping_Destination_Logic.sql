USE master



/**************************************************************************************************
	Create the BTS_BACKUP role
	This role will get exec permissions on all backup related procs
	No users are added to this role, this is a manual post install step
**************************************************************************************************/
declare @ret int, @Error int

if not exists( select 1 from [dbo].[sysusers] where name=N'BTS_BACKUP_USERS' and issqlrole=1 )
 begin

	exec @ret = sp_addrole N'BTS_BACKUP_USERS'

	select @Error = @@ERROR

	if @ret <> 0 or @Error <> 0
		raiserror( 'Failed adding the ''BTS_BACKUP_USERS'' role', 16, -1 )
 end
GO

GRANT CREATE DATABASE TO BTS_BACKUP_USERS

GO

/**************************************************************************************************
				bts_SafeAddLinkedServer

	This sproc will add a linked server connection and will check to see if you are trying to 
	link to yourself or to a server which you are already linked to and so not throw an error
**************************************************************************************************/
IF OBJECT_ID('bts_SafeAddLinkedServer') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_SafeAddLinkedServer]
GO

CREATE PROCEDURE [dbo].[bts_SafeAddLinkedServer] @linkedServer sysname
AS

	declare @localServer sysname, @svr sysname

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
	END

	DROP TABLE #Servers

GO

/*************************************************************************************************
bts_ImportSQLAgentJobs

gets all sql agent jobs for the various databases which we are backing up
*************************************************************************************************/
IF OBJECT_ID('bts_ImportSQLAgentJobs') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_ImportSQLAgentJobs]
GO

CREATE PROCEDURE [dbo].[bts_ImportSQLAgentJobs]	@SourceId int
AS
 BEGIN

	SET NOCOUNT ON

	DECLARE	@error_desc	nvarchar(256)
		,@error		int
		,@ret		int
		,@rowcount	int
		,@job_id 	uniqueidentifier
		,@cnt 		int
		,@id 		int
		,@databaseName	sysname
		,@servername 	sysname
		,@sql 		nvarchar(2000)

	CREATE TABLE #jobs ( job_id uniqueidentifier NOT NULL)
	CREATE TABLE #job_databases (database_name sysname NOT NULL)

	--lets enumerate the databases, go to the appropriate server and then get the sql jobs for this server
	declare db_cursor cursor FAST_FORWARD FOR
	SELECT DatabaseName, ServerName FROM bts_LogShippingDatabases WHERE SourceId = @SourceId

	open db_cursor
	FETCH NEXT FROM db_cursor INTO @databaseName, @serverName
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		exec bts_SafeAddLinkedServer @serverName

		SELECT @sql = N'select t.job_id from openrowset(''SQLOLEDB'',''Server=' + @serverName + N';TRUSTED_CONNECTION=YES;database=msdb;'',''set fmtonly off exec msdb.dbo.sp_help_job '') as t'
		
		INSERT INTO #jobs (job_id)
		exec (@sql)
		
		declare job_cursor cursor FAST_FORWARD FOR
		SELECT job_id FROM #jobs
	
		OPEN job_cursor
		
		FETCH NEXT FROM job_cursor INTO @job_id
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			SELECT @sql = N'select t.database_name from openrowset(''SQLOLEDB'',''Server=' + @serverName + N';TRUSTED_CONNECTION=YES;database=msdb;'',''set fmtonly off exec msdb.dbo.sp_help_jobstep @job_id = ''''' + CAST(@job_id as nchar(36)) + ''''''') as t GROUP BY t.database_name'
			
			INSERT INTO #job_databases
			exec (@sql)
			--we only want to copy this job if there is only one database associated with it and it is the one we are looking for
			SELECT @cnt = COUNT(*) FROM #job_databases WHERE database_name = @databaseName
			IF (@cnt = 1)
			BEGIN
				SELECT @sql = N'select ' + CAST(@SourceId as nchar(10)) + ', ''' + @databaseName + ''', [name], [enabled], [description], [start_step_id], [category], [owner], [notify_level_eventlog], [notify_level_email], [notify_level_netsend], [notify_level_page], [notify_email_operator], [notify_netsend_operator], [notify_page_operator], [delete_level] from openrowset(''SQLOLEDB'',''Server=' + @serverName + N';TRUSTED_CONNECTION=YES;database=msdb;'',''set fmtonly off exec msdb.dbo.sp_help_job '') as t WHERE t.job_id = ''' + CAST(@job_id as nchar(36)) + ''' '
				
				INSERT INTO bts_LogShippingJobs ( [SourceId], [SourceDatabaseName], [job_name], [enabled], [job_desc], [start_step_id], [category], [owner_login_name], [notify_level_eventlog], [notify_level_email], [notify_level_netsend], [notify_level_page], [notify_email_operator_name], [notify_netsend_operator_name], [notify_page_operator_name], [delete_level] )
				exec (@sql)

				SET @id = @@IDENTITY
				
				SELECT @sql = N'select ' + CAST(@id as nchar(10)) + ', step_id, step_name, subsystem, command, cmdexec_success_code, on_success_action, on_success_step_id, on_fail_action, on_fail_step_id, database_user_name, retry_attempts, retry_interval from openrowset(''SQLOLEDB'',''Server=' + @serverName + N';TRUSTED_CONNECTION=YES;database=msdb;'',''set fmtonly off exec msdb.dbo.sp_help_jobstep @job_id = ''''' + CAST(@job_id as nchar(36)) + ''''''') as t '

				INSERT INTO bts_LogShippingJobSteps (job_id, step_id, step_name, subsystem, command, cmdexec_success_code, on_success_action, on_success_step_id, on_fail_action, on_fail_step_id, database_user_name, retry_attempts, retry_interval)
				exec (@sql)	

				SELECT @sql = N'select ' + CAST(@id as nchar(10)) + ', schedule_name, enabled, freq_type, freq_interval, freq_subday_type, freq_subday_interval, freq_relative_interval, freq_recurrence_factor, active_start_date, active_end_date, active_start_time, active_end_time from openrowset(''SQLOLEDB'',''Server=' + @serverName + N';TRUSTED_CONNECTION=YES;database=msdb;'',''set fmtonly off exec msdb.dbo.sp_help_jobschedule @job_id = ''''' + CAST(@job_id as nchar(36)) + ''''''') as t '

				INSERT INTO bts_LogShippingJobSchedules (job_id, sched_name, enabled, freq_type, freq_interval, freq_subday_type, freq_subday_interval, freq_relative_interval, freq_recurrence_factor, active_start_date, active_end_date, active_start_time, active_end_time)
				exec (@sql)
			END
	
			TRUNCATE TABLE #job_databases
	
			FETCH NEXT FROM job_cursor INTO @job_id
		END
	
		close job_cursor
		deallocate job_cursor

		TRUNCATE TABLE #jobs

		FETCH NEXT FROM db_cursor INTO @databaseName, @serverName
	END

	close db_cursor
	deallocate db_cursor

	DROP TABLE #jobs
	DROP TABLE #job_databases
  END
GO

/**************************************************************************************************
 bts_ImportDatabasesForBackupServer
 
 gets the list of all databases for a given source server and populates the destination databases table
 if the server parameter is null, it will import all databases which we are backing up
***************************************************************************************************/
IF OBJECT_ID('bts_ImportDatabasesForBackupServer') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_ImportDatabasesForBackupServer]
GO
	
CREATE PROCEDURE [dbo].[bts_ImportDatabasesForBackupServer]	@SourceId int, 
								@SourceServerName sysname = null
AS
 BEGIN

	SET NOCOUNT ON

	declare @localized_string_bts_ImportDatabasesForBackupServer_Failed_MgmtDB nvarchar(256)
	set @localized_string_bts_ImportDatabasesForBackupServer_Failed_MgmtDB = N'bts_ImportDatabasesForBackupServer failed selecting the Management database information for this source'

	declare @localized_string_bts_ImportDatabasesForBackupServer_Failed_CreateTempTable nvarchar(256)
	set @localized_string_bts_ImportDatabasesForBackupServer_Failed_CreateTempTable = N'bts_ImportDatabasesForBackupServer failed to create a temp table'

	declare @localized_string_bts_ImportDatabasesForBackupServer_Failed_GetBackupDatabasesForServer nvarchar(256)
	set @localized_string_bts_ImportDatabasesForBackupServer_Failed_GetBackupDatabasesForServer = N'bts_ImportDatabasesForBackupServer failed calling GetDatabasesForBackupServer'

	declare @localized_string_bts_ImportDatabasesForBackupServer_Failed_InsertDatabases nvarchar(256)
	set @localized_string_bts_ImportDatabasesForBackupServer_Failed_InsertDatabases = N'bts_ImportDatabasesForBackupServer failed inserting rows from the temporary table into bts_LogShippingDatabases'

	DECLARE	@error_desc	nvarchar(256)
		,@error		int
		,@ret		int
		,@rowcount	int
		,@job_id 	uniqueidentifier, @cnt int, @id int, @databaseName sysname, @servername sysname

	DECLARE  @sql	nvarchar(2000),
			@MgmtDatabaseName sysname,
			@MgmtServerName sysname

	SELECT	@MgmtDatabaseName 	= [MgmtDatabaseName]
		,@MgmtServerName 	= [MgmtServerName]
	FROM	[dbo].[bts_LogShippingSource]
	WHERE	[SourceId] = @SourceId
	
	IF @@ERROR <> 0 OR @MgmtDatabaseName IS NULL OR @MgmtServerName IS NULL OR len(@MgmtDatabaseName) = 0 OR len(@MgmtServerName) = 0
	BEGIN
		SET @error_desc = @localized_string_bts_ImportDatabasesForBackupServer_Failed_MgmtDB
		GOTO FAILED
 	END
 	
	/*
		Build container table for results
		(with no SourceId column)
	*/
	IF OBJECT_ID('tempdb..#tmp') IS NOT NULL
		DROP TABLE #tmp

	CREATE TABLE #tmp (
		DatabaseName	sysname		NOT NULL
		,ServerName		sysname		NOT NULL
	)

	IF @@ERROR <> 0
	BEGIN
		SET @error_desc = @localized_string_bts_ImportDatabasesForBackupServer_Failed_CreateTempTable
		GOTO FAILED
	END
	/*
		Build and execute the statement to import history rows
	*/
	

	if (@SourceServerName IS NOT NULL)
	BEGIN
		SELECT @sql = N'INSERT #tmp ( ServerName, DatabaseName) EXEC [' + replace( @MgmtServerName, '''', '''''' ) + N'].[' + replace( @MgmtDatabaseName, '''', '''''' ) + N'].[dbo].[sp_GetBackupDatabasesForServer] @ServerName=''' + @SourceServerName + ''''
	END
	ELSE
	BEGIN
		SELECT @sql = N'INSERT #tmp ( ServerName, DatabaseName) EXEC [' + replace( @MgmtServerName, '''', '''''' ) + N'].[' + replace( @MgmtDatabaseName, '''', '''''' ) + N'].[dbo].[sp_GetBackupDatabasesForServer] '
	END
		
	EXEC( @sql )


	IF @@ERROR <> 0
	BEGIN
		SET @error_desc = @localized_string_bts_ImportDatabasesForBackupServer_Failed_GetBackupDatabasesForServer
		GOTO FAILED
	END

	INSERT	[dbo].[bts_LogShippingDatabases] (SourceId, DatabaseName, ServerName)
	SELECT	@SourceId
		,DatabaseName
		,ServerName
	FROM	#tmp

	IF @@ERROR <> 0
	BEGIN	
		SET @error_desc = @localized_string_bts_ImportDatabasesForBackupServer_Failed_InsertDatabases
		GOTO FAILED
	END

	
	DROP TABLE #tmp

	SET @ret = 0
	GOTO DONE

FAILED:

	RAISERROR( @error_desc, 16, -1 )

	SET @ret = -1
	
	GOTO DONE


DONE:	
	RETURN @ret
 END
GO

GRANT EXECUTE ON [dbo].[bts_ImportDatabasesForBackupServer] TO BTS_BACKUP_USERS
GO
/*************************************************************************************************
	bts_ConfigureBizTalkLogShipping

	Takes a db name and server of the management database for which this will be a backup server
	Also takes an optional paramater for the name of the source server for which this destination 
	should backup. For scenarios which have multiple backup servers, each server can backup one or more 
	source servers. To add more source servers, simply call AddLogShippingSource again with another source
**************************************************************************************************/

IF OBJECT_ID('bts_ConfigureBizTalkLogShipping') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_ConfigureBizTalkLogShipping]
GO

CREATE PROCEDURE [dbo].[bts_ConfigureBizTalkLogShipping]	
	@nvcDescription		nvarchar(256),
	@nvcMgmtDatabaseName	sysname,
	@nvcMgmtServerName	sysname,
	@SourceServerName 	sysname = null,
	@fLinkServers		bit = 1
AS
 BEGIN

	SET NOCOUNT ON
	SET XACT_ABORT ON

	declare @localized_string_CreateDestJobs_Failed nvarchar(256)
	set @localized_string_CreateDestJobs_Failed = N'Failed creating the destination jobs'

	declare @localized_string_CreateDestJobs_Failed_DuplicateSource nvarchar(256)
	set @localized_string_CreateDestJobs_Failed_DuplicateSource = N'Failed inserting into the LogShippingSource table: A record might already exist for this management database.'

	declare @localized_string_CreateDestJobs_GetHistoryDesc nvarchar(256)
	set @localized_string_CreateDestJobs_GetHistoryDesc = N'Retrieve BizTalk Server backup history records from the source server'

	declare @localized_string_CreateDestJobs_RestoreDesc nvarchar(256)
	set @localized_string_CreateDestJobs_RestoreDesc = N'Restore BizTalk Server backup sets'

	declare @localized_string_CreateDestJobs_RestoreToMarkDesc nvarchar(256)
	set @localized_string_CreateDestJobs_RestoreToMarkDesc = N'Restore BizTalk Server backup sets to the last mark'

	declare @localized_string_CreateDestJobs_Failed_ImportSourceDatabases nvarchar(256)
	set @localized_string_CreateDestJobs_Failed_ImportSourceDatabases = N'Failed to import backup databases for the source server'

	declare @localized_string_CreateDestJobs_Category nvarchar(256)
	set @localized_string_CreateDestJobs_Category = N'BizTalk Server Log Shipping'

	declare @localized_string_CreateDestJobs_GetHistoryStep1Name nvarchar(256)
	set @localized_string_CreateDestJobs_GetHistoryStep1Name = N'Get history'

	declare @localized_string_CreateDestJobs_RestoreStep1Name nvarchar(256)
	set @localized_string_CreateDestJobs_RestoreStep1Name = N'Restore Logs'

	declare @localized_string_CreateDestJobs_RestoreToMarkStep1Name nvarchar(256)
	set @localized_string_CreateDestJobs_RestoreToMarkStep1Name = N'Restore Logs TO Mark'

	declare @localized_string_CreateDestJobs_GetHistorySchedName nvarchar(256)
	set @localized_string_CreateDestJobs_GetHistorySchedName = N'Get history schedule'

	declare @localized_string_CreateDestJobs_RestoreSchedName nvarchar(256)
	set @localized_string_CreateDestJobs_RestoreSchedName = N'Restore Logs Schedule'

	declare @localized_string_CreateDestJobs_MultiServer nvarchar(256)
	set @localized_string_CreateDestJobs_MultiServer = N'Failed creating the destination jobs:  Unable to import job since there is already a multi-server job with this name.'

	declare @localized_string_CreateDestJobs_Failed_ImportSQLAgentJobs nvarchar(256)
	set @localized_string_CreateDestJobs_Failed_ImportSQLAgentJobs = N'Failed to import the source sql agent jobs.'

	declare @localized_string_JobNameGetHistory nvarchar(96)
	set @localized_string_JobNameGetHistory = N'BTS Log Shipping - Get Backup History (DBServer: "%i", DBName: "%j")'

	declare @localized_string_JobNameRestore nvarchar(96)
	set @localized_string_JobNameRestore = N'BTS Log Shipping - Restore Databases (DBServer: "%i", DBName: "%j")'

	declare @localized_string_JobNameRestoreToMark nvarchar(96)
	set @localized_string_JobNameRestoreToMark = N'BTS Log Shipping - Restore To Mark (DBServer: "%i", DBName: "%j")'

	

	DECLARE @SourceName	nvarchar(32)
		,@JobName	nvarchar(128)
		,@error_desc	nvarchar(256)
		,@command	nvarchar(256)
		,@error 	int
		,@SourceId	bigint
		,@temp		nvarchar(128)

	if (@fLinkServers = 1)
	BEGIN
		exec bts_SafeAddLinkedServer @nvcMgmtServerName
	END

	--because we are auto linking servers, we cannot use transactions here. since this is just a configuration
	--step, if the user messes this up, simply rerunning the schema file will clean everything up

	INSERT INTO [dbo].[bts_LogShippingSource] (SourceDesc, MgmtDatabaseName, MgmtServerName)
		VALUES (@nvcDescription, @nvcMgmtDatabaseName, @nvcMgmtServerName)

	SELECT @SourceId = scope_identity(), @error = @@ERROR
	IF (@error <> 0)
	BEGIN
		SET @error_desc = @localized_string_CreateDestJobs_Failed_DuplicateSource
		GOTO FAILED
	END

	exec [dbo].[bts_ImportDatabasesForBackupServer]	@SourceId, @SourceServerName
	IF (@error <> 0)
	BEGIN 
		SET @error_desc = @localized_string_CreateDestJobs_Failed_ImportSourceDatabases
		GOTO FAILED
	END

	exec [dbo].[bts_ImportSQLAgentJobs] @SourceId
        IF (@error <> 0)
	BEGIN 
		SET @error_desc = @localized_string_CreateDestJobs_Failed_ImportSQLAgentJobs
		GOTO FAILED
	END

		DECLARE @JobID BINARY(16)  
		DECLARE @ReturnCode INT    
		SELECT @ReturnCode = 0     

		IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = @localized_string_CreateDestJobs_Category) < 1 
			EXECUTE msdb.dbo.sp_add_category @name = @localized_string_CreateDestJobs_Category

		SET @temp = replace( @localized_string_JobNameGetHistory, '%i', @nvcMgmtServerName )
		SET @JobName = replace( @temp, '%j', @nvcMgmtDatabaseName )
		
		-- Delete the job with the same name (if it exists)
		SELECT @JobID = job_id     
		FROM   msdb.dbo.sysjobs    
		WHERE (name = @JobName)  
		
		IF (@JobID IS NOT NULL)    
		   BEGIN  
			-- Check if the job is a multi-server job  
			IF (EXISTS (SELECT  * FROM msdb.dbo.sysjobservers WHERE (job_id = @JobID) AND (server_id <> 0))) 
			   BEGIN 
				-- There is, so abort the script 
				RAISERROR (@localized_string_CreateDestJobs_MultiServer, 16, 1) 
				GOTO FAILED
			   END 
			ELSE 
				-- Delete the [local] job 
				EXECUTE msdb.dbo.sp_delete_job @job_name = @JobName
		
			SELECT @JobID = NULL
		   END 

		BEGIN 
		
			-- Add the job
			EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @JobName, @description = @localized_string_CreateDestJobs_GetHistoryDesc, @category_name = @localized_string_CreateDestJobs_Category, @enabled = 1
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			-- Add the job steps
			SET @command = N'exec bts_GetBTSBackupHistoryFromSource ' + cast( @SourceId as nvarchar )
			EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = @localized_string_CreateDestJobs_GetHistoryStep1Name, @command = @command, @database_name = N'master', @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 

			EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 		
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			-- Add the job schedules
			EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = @localized_string_CreateDestJobs_GetHistorySchedName, @enabled = 1, @freq_type = 4, @active_start_date = 20040223, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			-- Add the Target Servers
			EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
		
		END

		SET @temp = replace( @localized_string_JobNameRestore, '%i', @nvcMgmtServerName )
		SET @JobName = replace( @temp, '%j', @nvcMgmtDatabaseName )
		SET @JobID = NULL	

		-- Delete the job with the same name (if it exists)
		SELECT @JobID = job_id     
		FROM   msdb.dbo.sysjobs    
		WHERE (name = @JobName)

		IF (@JobID IS NOT NULL)    
		   BEGIN  
			-- Check if the job is a multi-server job  
			IF (EXISTS (SELECT * FROM msdb.dbo.sysjobservers WHERE (job_id = @JobID) AND (server_id <> 0))) 
			   BEGIN 
				-- There is, so abort the script 
				RAISERROR (@localized_string_CreateDestJobs_MultiServer, 16, 1) 
				GOTO FAILED  
			   END 
			ELSE 
			   BEGIN
				-- Delete the [local] job 
				EXECUTE msdb.dbo.sp_delete_job @job_name = @JobName 
			   END		
			SELECT @JobID = NULL
		   END 

		BEGIN 
			
			-- Add the job
			EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @JobName, @description = @localized_string_CreateDestJobs_RestoreDesc, @category_name = @localized_string_CreateDestJobs_Category, @enabled = 1
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			-- Add the job steps
			SET @command = N'[dbo].[bts_LogShippingRestore] ' + cast( @SourceId as nvarchar )
			EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = @localized_string_CreateDestJobs_RestoreStep1Name, @command = @command, @database_name = N'master', @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 		
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			-- Add the job schedules
			EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = @localized_string_CreateDestJobs_RestoreSchedName, @enabled = 1, @freq_type = 4, @active_start_date = 20040223, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			-- Add the Target Servers
			EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 

		END

		SET @temp = replace( @localized_string_JobNameRestoreToMark, '%i', @nvcMgmtServerName )
		SET @JobName = replace( @temp, '%j', @nvcMgmtDatabaseName )
		SET @JobID = NULL	

		-- Delete the job with the same name (if it exists)
		SELECT @JobID = job_id     
		FROM   msdb.dbo.sysjobs    
		WHERE (name = @JobName)

		IF (@JobID IS NOT NULL)    
		   BEGIN  
			-- Check if the job is a multi-server job  
			IF (EXISTS (SELECT * FROM msdb.dbo.sysjobservers WHERE (job_id = @JobID) AND (server_id <> 0))) 
			   BEGIN 
				-- There is, so abort the script 
				RAISERROR (@localized_string_CreateDestJobs_MultiServer, 16, 1) 
				GOTO FAILED  
			   END 
			ELSE 
			   BEGIN
				-- Delete the [local] job 
				EXECUTE msdb.dbo.sp_delete_job @job_name = @JobName 
			   END		
			SELECT @JobID = NULL
		   END 

		BEGIN 
			
			-- Add the job
			EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @JobName, @description = @localized_string_CreateDestJobs_RestoreToMarkDesc, @category_name = @localized_string_CreateDestJobs_Category, @enabled = 0
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			-- Add the job steps
			SET @command = N'[dbo].[bts_LogShippingRestoreFinalLogToMark] ' + cast( @SourceId as nvarchar )
			EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = @localized_string_CreateDestJobs_RestoreToMarkStep1Name, @command = @command, @database_name = N'master', @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
			
			EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 		
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 
						
			-- Add the Target Servers
			EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
			IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO FAILED 

		END

GOTO DONE


FAILED:
	  if (@error_desc IS NULL)
		SET @error_desc = @localized_string_CreateDestJobs_Failed

	  RAISERROR( @error_desc, 16, -1 )

DONE:

 END
GO


/**************************************************************************************************
	bts_GetBTSBackupHistoryFromSource stored proceedure

	Retrieves history data from a given source system.
**************************************************************************************************/
IF OBJECT_ID('bts_GetBTSBackupHistoryFromSource') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_GetBTSBackupHistoryFromSource]
GO

CREATE PROCEDURE [dbo].[bts_GetBTSBackupHistoryFromSource]	@SourceId int, 
								@DatabaseName nvarchar(256) = null,
								@ServerName	nvarchar(256) = null
AS
 BEGIN

	SET NOCOUNT ON

	declare @localized_string_bts_GetBTSBackupHistory_Failed_BackupSetId nvarchar(256)
	set @localized_string_bts_GetBTSBackupHistory_Failed_BackupSetId = N'bts_GetBTSBackupHistory failed selecting the last backup set id'

	declare @localized_string_bts_GetBTSBackupHistory_Failed_bts_GetBackupHistory nvarchar(256)
	set @localized_string_bts_GetBTSBackupHistory_Failed_bts_GetBackupHistory = N'bts_GetBTSBackupHistory running stored proceedure bts_GetBackupHistory in the source management database'

	declare @localized_string_bts_GetBTSBackupHistory_Failed_CreatingTempTable nvarchar(256)
	set @localized_string_bts_GetBTSBackupHistory_Failed_CreatingTempTable = N'bts_GetBTSBackupHistory failed creating the temp table to hold imported history rows'

	declare @localized_string_bts_GetBTSBackupHistory_Failed_InsertBackupHistory nvarchar(256)
	set @localized_string_bts_GetBTSBackupHistory_Failed_InsertBackupHistory = N'bts_GetBTSBackupHistory failed inserting history rows from the temporary table into bts_LogShippingHistory'

	declare @localized_string_bts_GetBTSBackupHistory_Failed_Mgmt nvarchar(256)
	set @localized_string_bts_GetBTSBackupHistory_Failed_Mgmt = N'bts_GetBTSBackupHistory failed selecting the management database and server values from bts_LogShippingSource'


	DECLARE	@error_desc	nvarchar(256)
		,@error		int
		,@ret		int
		,@rowcount	int

	DECLARE  @LastBackupSetId 	bigint
			,@sql				nvarchar(2000)

	/*
			Get the last backup set retrieved for this source so that we don't pull back more history than we need
	*/
	SELECT 	@LastBackupSetId = MAX(BackupSetId)
	FROM	[dbo].[bts_LogShippingHistory]
	WHERE	[SourceId] = @SourceId
	IF @@ERROR <> 0
	 BEGIN
		SET @error_desc = @localized_string_bts_GetBTSBackupHistory_Failed_BackupSetId
		GOTO FAILED
	 END
	/*
		If no history has been collected get it all
	*/
	IF @LastBackupSetId IS NULL
		SELECT @LastBackupSetId = -1
	
		
	if ( (@DatabaseName IS null) OR (@ServerName IS null) )
	BEGIN
		/*
			Get the Mgmt db and server name so that we can get the current history from them
		*/
		SELECT	@DatabaseName 	= [MgmtDatabaseName]
			,@ServerName 	= [MgmtServerName]
		FROM	[dbo].[bts_LogShippingSource]
		WHERE	[SourceId] = @SourceId

		SELECT	@error		= @@ERROR
			   ,@rowcount	= @@ROWCOUNT
		
		IF @error <> 0 OR @rowcount <> 1 OR @DatabaseName IS NULL OR @ServerName IS NULL OR len(@DatabaseName) = 0 OR len(@ServerName) = 0
		   BEGIN
			SET @error_desc = @localized_string_bts_GetBTSBackupHistory_Failed_Mgmt
			GOTO FAILED
 		   END
		

		/*
		 Build container table for results
		 (with no SourceId column)
		*/
		IF OBJECT_ID('tempdb..#lgs_tmp') IS NOT NULL
			DROP TABLE #lgs_tmp

		CREATE TABLE #lgs_tmp (
			BackupId		bigint		NOT NULL
			,BackupSetId		bigint		NOT NULL
			,MarkName		nvarchar(32)	NULL
			,DatabaseName		nvarchar(128)	NOT NULL
			,ServerName		nvarchar(128)	NULL
			,BackupFileName		nvarchar(500)	NOT NULL
			,BackupFileLocation	nvarchar(3000)	NOT NULL
			,BackupType		char(2)		NOT NULL
			,BackupDateTime		datetime	NOT NULL
			,SetComplete		bit		NOT NULL
			,Restored		bit		NOT NULL DEFAULT 0
			,RestoredDateTime	datetime	NULL
		)

		IF @@ERROR <> 0
		   BEGIN
			SET @error_desc = @localized_string_bts_GetBTSBackupHistory_Failed_CreatingTempTable
			GOTO FAILED
		   END
		/*
			Build and execute the statement to import history rows
		*/
		

		SELECT @sql = N'INSERT #lgs_tmp ( BackupId, BackupSetId, MarkName, DatabaseName, ServerName, BackupFileName, BackupFileLocation, BackupType, BackupDateTime, SetComplete ) EXEC [' + replace( @ServerName, '''', '''''' ) + N'].[' + replace( @DatabaseName, '''', '''''' ) + N'].[dbo].[sp_GetBackupHistory] @LastBackupSetId=' + cast(@LastBackupSetId as nvarchar(32))

		EXEC( @sql )


		IF @@ERROR <> 0
		   BEGIN
			SET @error_desc = @localized_string_bts_GetBTSBackupHistory_Failed_BackupSetId
			GOTO FAILED
		   END

		INSERT	[dbo].[bts_LogShippingHistory]
		SELECT	@SourceId
			,BackupId
			,BackupSetId
			,MarkName
			,DatabaseName
			,ServerName
			,BackupFileName
			,BackupFileLocation
			,BackupType
			,BackupDateTime
			,SetComplete
			,Restored
			,RestoredDateTime
		FROM	#lgs_tmp

		IF @@ERROR <> 0
		   BEGIN
			SET @error_desc = @localized_string_bts_GetBTSBackupHistory_Failed_InsertBackupHistory
			GOTO FAILED
		   END

		IF OBJECT_ID('tempdb..#lgs_tmp') IS NOT NULL
			DROP TABLE #lgs_tmp
	END
	ELSE
	BEGIN
		--we are just pulling this data from another destination machine. This is used one destination machine did not get all of the information
		--from the log history table off the mgmt db before that db crashed. By making sure they all have as much as possible, we can restore to the
		--same point
		SELECT @sql = N'INSERT [dbo].[bts_LogShippingHistory] (SourceId , BackupId, BackupSetId, MarkName, DatabaseName, ServerName, BackupFileName, BackupFileLocation, BackupType, BackupDateTime, SetComplete ) 
						SELECT ' + @SourceId + ', BackupId, BackupSetId, MarkName, DatabaseName, ServerName, BackupFileName, BackupFileLocation, BackupType, BackupDateTime, SetComplete
						FROM ' + replace( @ServerName, '''', '''''' ) + N'].[' + replace( @DatabaseName, '''', '''''' ) + N'].[dbo].[bts_LogShippingHistory]
						WHERE SourceId = ' + @SourceId + ' AND BackupSetId > ' + cast(@LastBackupSetId as nvarchar(32))

		EXEC( @sql )
		
		IF @@ERROR <> 0
		   BEGIN
			SET @error_desc = @localized_string_bts_GetBTSBackupHistory_Failed_InsertBackupHistory
			GOTO FAILED
		   END
	END
	
	SET @ret = 0
	GOTO DONE

FAILED:

	RAISERROR( @error_desc, 16, -1 )

	SET @ret = -1
	
	GOTO DONE


DONE:	
	RETURN @ret
 END
GO

GRANT EXECUTE ON [dbo].[bts_GetBTSBackupHistoryFromSource] TO BTS_BACKUP_USERS
GO



/**************************************************************************************************
	bts_LogShippingRestoreFull stored proceedure

	Restores full backup files for the databases specified for the given source.
	This is used to create a fresh start after a partial set failure.
**************************************************************************************************/
IF OBJECT_ID('bts_LogShippingRestoreFull') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_LogShippingRestoreFull]
GO

CREATE PROCEDURE [dbo].[bts_LogShippingRestoreFull]	@SourceId 	int
							,@DatabaseName	sysname
							,@BackupSetId	int
AS
 BEGIN

	SET NOCOUNT ON

	declare @localized_string_bts_LogShippingRestoreFull_FailedSelectingDatabaseData nvarchar(100)
	set @localized_string_bts_LogShippingRestoreFull_FailedSelectingDatabaseData = N'bts_LogShippingRestoreFull failed selecting from the bts_LogShippingDatabases table'

	declare @localized_string_bts_LogShippingRestoreFull_RestoreFailed nvarchar(100)
	set @localized_string_bts_LogShippingRestoreFull_RestoreFailed = N'bts_LogShippingRestoreFull failed restoring the database'

	DECLARE	@error_desc	nvarchar(128)
		,@error		int
		,@ret		int
		,@rowcount	int

	DECLARE	@Restore	nvarchar(1000)
		,@RestoreName	nvarchar(256)
		,@FileLocation	nvarchar(2500)
		,@FileName	nvarchar(500)

	
	/*
		Select all information for this db restore and determine if an alternate file location or restore name have been specified
	*/
	SELECT	@FileLocation 	= 
		CASE
			WHEN [db].[DBFileLocation] IS NOT NULL THEN [db].[DBFileLocation]
			ELSE [h].[BackupFileLocation]
		END
		,@RestoreName	= 
		CASE
			WHEN [RestoreName] IS NOT NULL THEN [db].[RestoreName]
			ELSE [h].[DatabaseName]
		END
		,@FileName	= [h].[BackupFileName]
	FROM [dbo].[bts_LogShippingDatabases] [db]
	JOIN [dbo].[bts_LogShippingHistory] [h] ON [h].[SourceId] = [db].[SourceId]
											AND [h].[DatabaseName] = [db].[DatabaseName] 
											AND [h].[BackupSetId]	= @BackupSetId 
											AND	[BackupType] = N'db'
	WHERE	[db].[SourceId] = @SourceId	AND	[db].[DatabaseName] = @DatabaseName

	IF ( @@ERROR <> 0 OR @@ROWCOUNT <> 1) 
	 BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestoreFull_FailedSelectingDatabaseData
		GOTO FAILED
	 END

	IF right( @FileLocation, 1 ) = '\'
		SELECT @FileLocation = @FileLocation + @FileName
	ELSE
		SELECT @FileLocation = @FileLocation + N'\' + @FileName

	SELECT	@Restore = N'
			DECLARE @error int

			RESTORE DATABASE [' + replace( @RestoreName, '''', '''''' ) + N']
					FROM DISK=N''' + replace( @FileLocation, '''', '''''' ) + N'''
					WITH NORECOVERY, REPLACE
			
			SELECT @error = @@ERROR

			IF @error <> 0
			 BEGIN
				RAISERROR( ''' + replace( @localized_string_bts_LogShippingRestoreFull_RestoreFailed, '''', '''''' ) + N''', 16, -1 )
			 END
			ELSE
			 BEGIN			
				UPDATE	[dbo].[bts_LogShippingHistory]
				SET	[Restored] 		= 1
					,[RestoredDateTime] 	= getutcdate()
				WHERE	[SourceId] 		= ' + cast( @SourceId as nvarchar(32) ) + N'
				AND	[DatabaseName]		= ''' + replace( @DatabaseName, '''', '''''' ) + N'''
				AND	[BackupSetId]		= ' + cast( @BackupSetId as nvarchar(32) ) + N'
			 END
		'

	EXEC( @Restore )

	IF @@ERROR <> 0
	 BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestoreFull_RestoreFailed
		GOTO FAILED
	 END

	SET @ret = 0
	GOTO DONE

FAILED:

	RAISERROR( @error_desc, 16, -1 )

	SET @ret = -1
	
	GOTO DONE


DONE:	
	RETURN @ret
 END
GO


GRANT EXECUTE ON [dbo].[bts_LogShippingRestoreFull] TO BTS_BACKUP_USERS
GO

/**************************************************************************************************
	bts_LogShippingRestoreLog stored proceedure

	Restores a log backup
**************************************************************************************************/
IF OBJECT_ID('bts_LogShippingRestoreLog') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_LogShippingRestoreLog]
GO

CREATE PROCEDURE [dbo].[bts_LogShippingRestoreLog]	@SourceId 	int
							,@DatabaseName	sysname
							,@BackupSetId	int
							,@StopAtMark	bit = 0
AS
 BEGIN

	SET NOCOUNT ON

	declare @localized_string_bts_LogShippingRestoreLog_MissingDatabase nvarchar(100)
	set @localized_string_bts_LogShippingRestoreLog_MissingDatabase = N'bts_LogShippingRestoreLog failed restoring the database because the database does not exist'
	
	declare @localized_string_bts_LogShippingRestoreLog_FailedSelectingDatabaseData nvarchar(100)
	set @localized_string_bts_LogShippingRestoreLog_FailedSelectingDatabaseData = N'bts_LogShippingRestoreLog failed selecting from the bts_LogShippingDatabases table'

	declare @localized_string_bts_LogShippingRestoreLog_RestoreFailed nvarchar(100)
	set @localized_string_bts_LogShippingRestoreLog_RestoreFailed = N'bts_LogShippingRestoreLog failed restoring the database'

	DECLARE	@error_desc	nvarchar(128)
			,@ret		int

	DECLARE	@Restore	nvarchar(1000)
		,@RestoreName	sysname
		,@FileLocation	nvarchar(2500)
		,@FileName	nvarchar(500)
		,@MarkName	nvarchar(32)

	
	/*
		Select all information for this log backup and determine if an alternate file location or restore name have been specified
	*/
	SELECT	@FileLocation = 
			CASE
				WHEN [db].[LogFileLocation] IS NOT NULL THEN [db].[LogFileLocation]
				ELSE [h].[BackupFileLocation]
			END
			,@RestoreName = 
			CASE
				WHEN [RestoreName] IS NOT NULL THEN [db].[RestoreName]
				ELSE [h].[DatabaseName]
			END
			,@MarkName = [h].[MarkName]
			,@FileName = [h].[BackupFileName]
	FROM [dbo].[bts_LogShippingDatabases] [db]
	JOIN [dbo].[bts_LogShippingHistory] [h] ON [h].[SourceId] = [db].[SourceId]
											AND [h].[DatabaseName] = [db].[DatabaseName] 
											AND [h].[BackupSetId]	= @BackupSetId 
											AND	[BackupType] = N'lg'
	WHERE [db].[SourceId] = @SourceId AND [db].[DatabaseName] = @DatabaseName
	
	IF ( @@ERROR <> 0 OR @@ROWCOUNT <> 1) 
	 BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestoreLog_FailedSelectingDatabaseData
		GOTO FAILED
	 END

	/*
	 Let's make sure the database we are about to restore a log for actually exists
	*/
	IF NOT EXISTS (	SELECT	1
					FROM 	[dbo].[sysdatabases]
					WHERE	name = @RestoreName	)
	BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestoreLog_MissingDatabase
		GOTO FAILED
	END

	IF right( @FileLocation, 1 ) = '\'
		SELECT @FileLocation = @FileLocation + @FileName
	ELSE
		SELECT @FileLocation = @FileLocation + N'\' + @FileName

	if (@StopAtMark = 0)
	BEGIN
		SELECT	@Restore = N'
			DECLARE @error int

			RESTORE LOG [' + replace( @RestoreName, '''', '''''' ) + N']
					FROM DISK=N''' + replace( @FileLocation, '''', '''''' ) + N'''
					WITH NORECOVERY
			
			SELECT @error = @@ERROR

			IF @error <> 0
			 BEGIN
				RAISERROR( ''' + replace( @localized_string_bts_LogShippingRestoreLog_RestoreFailed, '''', '''''' ) + N''', 16, -1 )
			 END
			ELSE
			 BEGIN			
				UPDATE	[dbo].[bts_LogShippingHistory]
				SET	[Restored] 		= 1
					,[RestoredDateTime] 	= getutcdate()
				WHERE	[SourceId] 		= ' + cast( @SourceId as nvarchar(32) ) + N'
				AND	[DatabaseName]		= ''' + replace( @DatabaseName, '''', '''''' ) + N'''
				AND	[BackupSetId]		= ' + cast( @BackupSetId as nvarchar(32) ) + N'
			 END
		'
	END
	ELSE
	BEGIN
		SELECT	@Restore = N'
			DECLARE @error int

			RESTORE LOG [' + replace( @RestoreName, '''', '''''' ) + N']
					FROM DISK=N''' + replace( @FileLocation, '''', '''''' ) + N'''
					WITH RECOVERY, STOPATMARK = ''' + @MarkName + '''
			
			SELECT @error = @@ERROR

			IF @error <> 0
			 BEGIN
				RAISERROR( ''' + replace( @localized_string_bts_LogShippingRestoreLog_RestoreFailed, '''', '''''' ) + N''', 16, -1 )
			 END
			ELSE
			 BEGIN			
				UPDATE	[dbo].[bts_LogShippingHistory]
				SET	[Restored] 		= 1
					,[RestoredDateTime] 	= getutcdate()
				WHERE	[SourceId] 		= ' + cast( @SourceId as nvarchar(32) ) + N'
				AND	[DatabaseName]		= ''' + replace( @DatabaseName, '''', '''''' ) + N'''
				AND	[BackupSetId]		= ' + cast( @BackupSetId as nvarchar(32) ) + N'
			 END
		'
	END

	EXEC( @Restore )
	--print @Restore

	IF @@ERROR <> 0
	 BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestoreLog_RestoreFailed
		GOTO FAILED
	 END

	SET @ret = 0
	GOTO DONE

FAILED:

	RAISERROR( @error_desc, 16, -1 )

	SET @ret = -1
	
	GOTO DONE


DONE:	
	RETURN @ret
 END
GO


GRANT EXECUTE ON [dbo].[bts_LogShippingRestoreLog] TO BTS_BACKUP_USERS
GO


/**************************************************************************************************
	bts_LogShippingRestoreFinalLogToMark stored proceedure

	Restores the last log to the mark so that the dbs can then be used
**************************************************************************************************/
IF OBJECT_ID('bts_LogShippingRestoreFinalLogToMark') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_LogShippingRestoreFinalLogToMark]
GO

CREATE PROCEDURE [dbo].[bts_LogShippingRestoreFinalLogToMark]	@SourceId 	int, @OverrideLastLogBackup int = -1
AS
 BEGIN

	SET NOCOUNT ON

	declare @localized_string_bts_LogShippingRestoreFinalLogToMark_FailedSelectingLastMark nvarchar(100)
	set @localized_string_bts_LogShippingRestoreFinalLogToMark_FailedSelectingLastMark = N'bts_LogShippingRestoreFinalLogToMark failed selecting the last restored set for the source'

	declare @localized_string_bts_LogShippingRestoreFinalLogToMark_FailedSelectingNextLog nvarchar(100)
	set @localized_string_bts_LogShippingRestoreFinalLogToMark_FailedSelectingNextLog = N'bts_LogShippingRestoreFinalLogToMark failed to find another log to restore to the mark'

	declare @localized_string_bts_LogShippingRestoreFinalLogToMark_RestoreFailed nvarchar(100)
	set @localized_string_bts_LogShippingRestoreFinalLogToMark_RestoreFailed = N'bts_LogShippingRestoreFinalLogToMark failed restoring the database'

	DECLARE	@error_desc	nvarchar(128)
		,@error		int
		,@ret		int
		,@rowcount	int
		,@LastSetId 	bigint

	DECLARE	@Restore	nvarchar(1000)
		,@RestoreName	sysname
		,@FileLocation	nvarchar(2500)
		,@FileName	nvarchar(500)

	/*
		Determine the lowest complete backup set completely restored
	*/
	SELECT	@LastSetId = [BackupSetId]
	FROM	[dbo].[bts_LogShippingLastRestoreSet]
	WHERE	[SourceId] = @SourceId	AND [RestoredToMark] = 0

	if (@LastSetId IS NOT NULL)
	BEGIN
		DECLARE @LogSetId bigint

		/*
		   lets see if there is another log for us to use to backup. We need one more full log after the
			last one which was successfully backed up.
		*/
		SELECT	@LogSetId = [h1].[BackupSetId]
			FROM	[dbo].[bts_LogShippingHistory] [h1]
			WHERE	[h1].[SourceId] = @SourceId
			AND	[h1].[BackupType] 	= N'lg'
			AND	[h1].[SetComplete] 	= 1
			AND	[h1].[BackupSetId] 	= @LastSetId + 1

		if (@LogSetId IS NOT NULL)
		BEGIN
			
			DECLARE	@db sysname, @count int

			SELECT @count = 0

			DECLARE db_cursor INSENSITIVE CURSOR FOR 
			SELECT	[DatabaseName]
			FROM	[dbo].[bts_LogShippingDatabases]
			WHERE	[SourceId] = @SourceId
			
			OPEN db_cursor

			FETCH NEXT FROM db_cursor INTO @db

			WHILE @@FETCH_STATUS = 0
	 		BEGIN
				EXEC @ret = [dbo].[bts_LogShippingRestoreLog]	@SourceId 	= @SourceId
										,@DatabaseName	= @db
										,@BackupSetId	= @LogSetId
										,@StopAtMark = 1 --this means restore to mark
			
				IF @@ERROR <> 0 OR @ret <> 0
			 	BEGIN
					BREAK
			 	END

				SELECT @count = @count + 1

				FETCH NEXT FROM db_cursor INTO @db
			END

			CLOSE db_cursor
			DEALLOCATE db_cursor

			IF @count != ( SELECT count( [DatabaseName] ) FROM [dbo].[bts_LogShippingDatabases] WHERE [SourceId] = @SourceId )
			BEGIN
				--if we didnt restore everything, we have gotten into an inconsistent state, so we wipe the 
				--last restore set and next time we will do a full restore from the best point we can
				DELETE	FROM [dbo].[bts_LogShippingLastRestoreSet] WHERE [SourceId] = @SourceId

				SET @error_desc = @localized_string_bts_LogShippingRestoreFinalLogToMark_RestoreFailed 
				GOTO FAILED 
			END
			ELSE
			BEGIN
				UPDATE [dbo].[bts_LogShippingLastRestoreSet]
				SET [BackupSetId] = @LogSetId
				   ,[RestoredToMark] = 1
				WHERE	[SourceId] = @SourceId
			END

			--we have successfully restored to the mark. Lets now recreate the sql agent jobs
			
			declare @job_id int, 
				@SourceDatabaseName sysname,
				@job_name sysname,
				@enabled tinyint,
				@job_desc nvarchar(512),
				@start_step_id int,
				@category sysname,
				@owner_login_name sysname,
				@notify_level_eventlog int,
				@notify_level_email int,
				@notify_level_netsend int, 
				@notify_level_page int,
				@notify_email_operator_name sysname,
				@notify_netsend_operator_name sysname,
				@notify_page_operator_name sysname,
				@delete_level int
			
			declare job_cursor cursor FAST_FORWARD FOR
			SELECT [id], [SourceDatabaseName], [job_name], [enabled], [job_desc], [start_step_id], [category], [owner_login_name], [notify_level_eventlog], [notify_level_email], [notify_level_netsend], [notify_level_page], [notify_email_operator_name], [notify_netsend_operator_name], [notify_page_operator_name], [delete_level] 
			FROM bts_LogShippingJobs
			WHERE SourceId = @SourceId
		
			open job_cursor
			FETCH NEXT FROM job_cursor INTO @job_id, @SourceDatabaseName, @job_name, @enabled, @job_desc, @start_step_id, @category, @owner_login_name, @notify_level_eventlog, @notify_level_email, @notify_level_netsend, @notify_level_page, @notify_email_operator_name, @notify_netsend_operator_name, @notify_page_operator_name, @delete_level
			
			WHILE (@@FETCH_STATUS = 0)
			BEGIN
				declare @JobID uniqueidentifier
				set @JobID = null

				IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = @category) < 1 
  					EXECUTE msdb.dbo.sp_add_category @name = @category

  				-- Delete the job with the same name (if it exists)
  				IF EXISTS( SELECT job_id  FROM msdb.dbo.sysjobs WHERE (name = @job_name) ) 
					EXECUTE msdb.dbo.sp_delete_job @job_name = @job_name      
			
				-- Add the job
  				exec msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @job_name, @start_step_id = @start_step_id, @description = @job_desc, @category_name = @category, @enabled = @enabled, @notify_level_email = @notify_level_email, @notify_level_page = @notify_level_page, @notify_level_netsend = @notify_level_netsend, @notify_level_eventlog = @notify_level_eventlog, @delete_level= @delete_level

  				-- Add the job steps
				declare @step_id int,
					@step_name sysname ,
					@subsystem nvarchar(40),
					@command nvarchar(3200),
					@cmdexec_success_code int,
					@on_success_action tinyint,
					@on_success_step_id int,
					@on_fail_action tinyint,
					@on_fail_step_id int,
					@database_user_name sysname,
					@retry_attempts int,
					@retry_interval int

				declare jobstep_cursor cursor FAST_FORWARD FOR
				SELECT step_id, step_name, subsystem, command, cmdexec_success_code, on_success_action, on_success_step_id, on_fail_action, on_fail_step_id, database_user_name, retry_attempts, retry_interval
				FROM bts_LogShippingJobSteps
				WHERE job_id = @job_id

				open jobstep_cursor

				FETCH NEXT FROM jobstep_cursor INTO @step_id, @step_name, @subsystem, @command, @cmdexec_success_code, @on_success_action, @on_success_step_id, @on_fail_action , @on_fail_step_id, @database_user_name, @retry_attempts , @retry_interval
				WHILE (@@FETCH_STATUS = 0)
				BEGIN
					exec msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = @step_id, @step_name = @step_name, @command = @command, @database_name = @SourceDatabaseName, @database_user_name = @database_user_name, @subsystem = @subsystem, @cmdexec_success_code = @cmdexec_success_code, @retry_attempts = @retry_attempts, @retry_interval = @retry_interval, @on_success_step_id = @on_success_step_id, @on_success_action = @on_success_action, @on_fail_step_id = @on_fail_step_id, @on_fail_action = @on_fail_action
 
					--EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 
					FETCH NEXT FROM jobstep_cursor INTO @step_id, @step_name, @subsystem, @command, @cmdexec_success_code, @on_success_action, @on_success_step_id, @on_fail_action , @on_fail_step_id, @database_user_name, @retry_attempts , @retry_interval
				END

				close jobstep_cursor
				deallocate jobstep_cursor
				
				-- Add the job schedules
				declare @sched_name sysname,
					@freq_type int,
					@freq_interval int,
					@freq_subday_type int,
					@freq_subday_interval int,
					@freq_relative_interval int,
					@freq_recurrence_factor int,
					@active_start_date int,
					@active_end_date int,
					@active_start_time int,
					@active_end_time int

				declare jobsched_cursor cursor FAST_FORWARD FOR
				SELECT sched_name, enabled, freq_type, freq_interval, freq_subday_type, freq_subday_interval, freq_relative_interval, freq_recurrence_factor, active_start_date, active_end_date, active_start_time, active_end_time
				FROM bts_LogShippingJobSchedules
				WHERE job_id = @job_id
	
				open jobsched_cursor

				FETCH NEXT FROM jobsched_cursor INTO @sched_name, @enabled, @freq_type, @freq_interval, @freq_subday_type, @freq_subday_interval, @freq_relative_interval, @freq_recurrence_factor, @active_start_date, @active_end_date, @active_start_time, @active_end_time
				WHILE (@@FETCH_STATUS = 0)
				BEGIN
					exec msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = @sched_name, @enabled = @enabled, @freq_type = @freq_type, @active_start_date = @active_start_date, @active_start_time = @active_start_time, @freq_interval = @freq_interval, @freq_subday_type = @freq_subday_type, @freq_subday_interval = @freq_subday_interval, @freq_relative_interval = @freq_relative_interval, @freq_recurrence_factor = @freq_recurrence_factor, @active_end_date = @active_end_date, @active_end_time = @active_end_time
  					FETCH NEXT FROM jobsched_cursor INTO @sched_name, @enabled, @freq_type, @freq_interval, @freq_subday_type, @freq_subday_interval, @freq_relative_interval, @freq_recurrence_factor, @active_start_date, @active_end_date, @active_start_time, @active_end_time
				END
				
				close jobsched_cursor
				deallocate jobsched_cursor

				--add the job server
				exec msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)'

				FETCH NEXT FROM job_cursor INTO @job_id, @SourceDatabaseName, @job_name, @enabled, @job_desc, @start_step_id, @category, @owner_login_name, @notify_level_eventlog, @notify_level_email, @notify_level_netsend, @notify_level_page, @notify_email_operator_name, @notify_netsend_operator_name, @notify_page_operator_name, @delete_level
			
			END

			close job_cursor
			deallocate job_cursor

		 END
		ELSE
		 BEGIN
			SET @error_desc = @localized_string_bts_LogShippingRestoreFinalLogToMark_FailedSelectingNextLog 
			GOTO FAILED
		 END
		
		
	 END
	ELSE
	 BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestoreFinalLogToMark_FailedSelectingLastMark 
		GOTO FAILED
	 END

	SET @ret = 0
	GOTO DONE

FAILED:
	RAISERROR( @error_desc, 16, -1 )

	SET @ret = -1

DONE:	

	RETURN @ret
  END

GO

	



GRANT EXECUTE ON [dbo].[bts_LogShippingRestoreFinalLogToMark] TO BTS_BACKUP_USERS
GO


/**************************************************************************************************
	bts_LogShippingRestoreSet stored proceedure

	Restores log files for a given set for all databases for the sources
**************************************************************************************************/
IF OBJECT_ID('bts_LogShippingRestoreSet') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_LogShippingRestoreSet]
GO

CREATE PROCEDURE [dbo].[bts_LogShippingRestoreSet]	@SourceId 	int
							,@BackupSetId 	bigint
							,@RestoreType 	nchar(2) /* 'db' - full database, 'lg' - log only */
AS
 BEGIN

	SET NOCOUNT ON

	declare @localized_string_bts_LogShippingRestoreSet_Failed_Executing_RestoreFull nvarchar(128)
	set @localized_string_bts_LogShippingRestoreSet_Failed_Executing_RestoreFull = N'bts_LogShippingRestoreSet failed running stored procedure bts_LogShippingRestoreFull'

	declare @localized_string_bts_LogShippingRestoreSet_Failed_Executing_RestoreLog nvarchar(128)
	set @localized_string_bts_LogShippingRestoreSet_Failed_Executing_RestoreLog = N'bts_LogShippingRestoreSet failed running stored procedure bts_LogShippingRestoreLog'

	DECLARE @ret		int
			,@error_desc	nvarchar(256)

	
	/*
		Get every database for this source
	*/
	DECLARE	@db sysname, @restore_name sysname, @count int

	SET @count = 0

	DECLARE db_cursor INSENSITIVE CURSOR FOR 
	SELECT	[DatabaseName]
		,[RestoreName] = CASE
			WHEN [RestoreName] IS NULL THEN [DatabaseName]
			ELSE [RestoreName]
		 END
	FROM	[dbo].[bts_LogShippingDatabases]
	WHERE	[SourceId] = @SourceId

	OPEN db_cursor

	FETCH NEXT FROM db_cursor INTO @db, @restore_name

	WHILE @@FETCH_STATUS = 0
	 BEGIN
		IF @RestoreType = N'db'
		BEGIN
			EXEC @ret = [dbo].[bts_LogShippingRestoreFull]	@SourceId 	= @SourceId
															,@DatabaseName	= @db
															,@BackupSetId	= @BackupSetId
			
		END
		ELSE
		BEGIN
			EXEC @ret = [dbo].[bts_LogShippingRestoreLog]	@SourceId 	= @SourceId
															,@DatabaseName	= @db
															,@BackupSetId	= @BackupSetId
		END
		 
		IF @@ERROR <> 0 OR @ret <> 0
		BEGIN
			BREAK
		END
		
		SET @count = @count + 1
		
		FETCH NEXT FROM db_cursor INTO @db, @restore_name
	 END

	CLOSE db_cursor
	DEALLOCATE db_cursor

	IF @count = ( SELECT count( [DatabaseName] ) FROM [dbo].[bts_LogShippingDatabases] WHERE [SourceId] = @SourceId )
	BEGIN
		IF EXISTS ( SELECT 	1 FROM	[dbo].[bts_LogShippingLastRestoreSet] WHERE	[SourceId] = @SourceId )
		BEGIN
			UPDATE	[dbo].[bts_LogShippingLastRestoreSet] SET [BackupSetId]	= @BackupSetId WHERE [SourceId]	= @SourceId
		END
		ELSE
		BEGIN
			INSERT [dbo].[bts_LogShippingLastRestoreSet] ([SourceId] ,[BackupSetId]) VALUES (@SourceId ,@BackupSetId)
		END
	END
	ELSE 
	BEGIN
		IF @RestoreType = N'lg'
		BEGIN
			SET @error_desc = @localized_string_bts_LogShippingRestoreSet_Failed_Executing_RestoreLog
		END
		ELSE
		BEGIN
			SET @error_desc = @localized_string_bts_LogShippingRestoreSet_Failed_Executing_RestoreFull
		END
		
		GOTO FAILED
	END
				

	SET @ret = 0
	GOTO DONE

FAILED:
	RAISERROR( @error_desc, 16, -1 )

	SET @ret = -1
	
	GOTO DONE


DONE:	

	RETURN @ret
 END
GO


GRANT EXECUTE ON [dbo].[bts_LogShippingRestoreSet] TO BTS_BACKUP_USERS
GO




/**************************************************************************************************
	bts_LogShippingRestore stored proceedure

	Restores full and log backup files for the databases specified for the given source.

Logic (ignoring sql failures which are checked for in the code):
   1) Check to see what the last set we restored was for this source
	2a) If we don't get any rows back then we have never restored anything. 
	3a) So find the most recent full db backup set which has a subsequent full log backup so that we could restore to a mark looking in the logshipping_history table
	4a) Execute bts_LogShippingRestoreSet to restore this set (see logic for this sproc to understand what it does
	5a) Update the history table and mark all backups after the one we just restored as not restored. This is in case we are rolling back to a last known good point or something.
	
	2b) We found a row, now lets get the next row for a log backup set
		3c) We found no row. I am not sure how this could happen since we should not have restored unless there was one more, so we throw an error

		3d) We found a row with a full log backup. Now we need to make sure there is another one after this which is full before we try to restore this one
			We always need to have another log backup after ours so that we can restore to a mark.
		
			4e) No more backups, lets just return since we need to wait for another log backup

			4f) There is another one so we can proceed
		

**************************************************************************************************/
IF OBJECT_ID('bts_LogShippingRestore') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_LogShippingRestore]
GO

CREATE PROCEDURE [dbo].[bts_LogShippingRestore]	@SourceId int
AS
 BEGIN

	SET NOCOUNT ON

	declare @localized_string_bts_LogShippingRestore_Failed nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed = N'bts_LogShippingRestore failed'

	declare @localized_string_bts_LogShippingRestore_Failed_Executing_Full nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_Executing_Full = N'bts_LogShippingRestore failed running stored proc bts_LogShippingRestoreFull'

	declare @localized_string_bts_LogShippingRestore_Failed_Repairing_NoFull nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_Repairing_NoFull = N'A partial set has been detected but a valid full backup set does not exist yet.  Please force a full backup on the source server.'

	declare @localized_string_bts_LogShippingRestore_Failed_Executing_CreateDB nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_Executing_CreateDB = N'bts_LogShippingRestore failed running stored proc bts_LogShippingCreateDB'

	declare @localized_string_bts_LogShippingRestore_Failed_Executing_RestoreSet nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_Executing_RestoreSet = N'bts_LogShippingRestore failed running stored procedure bts_LogShippingRestoreSet'

	declare @localized_string_bts_LogShippingRestore_Failed_Executing_PreviousFailure nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_Executing_PreviousFailure = N'bts_LogShippingRestore failed on a previous run.  Please force a full backup on the source server.'

	declare @localized_string_bts_LogShippingRestore_Failed_SelectingLastSet nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_SelectingLastSet = N'bts_LogShippingRestore failed selecting the last backup set that was restored.'

	declare @localized_string_bts_LogShippingRestore_Failed_SelectingNextLogSet nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_SelectingNextLogSet = N'bts_LogShippingRestore failed selecting the next log backup set to be restored.'

	declare @localized_string_bts_LogShippingRestore_Failed_SelectingNextLogSet_Repair nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_SelectingNextLogSet_Repair = N'bts_LogShippingRestore failed selecting the next log backup set to be restored during a repair operation.'

	declare @localized_string_bts_LogShippingRestore_Failed_SelectingMaxFullSet nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_SelectingMaxFullSet = N'bts_LogShippingRestore failed selecting the most recent backup set.'

	declare @localized_string_bts_LogShippingRestore_Failed_OpeningRepairDbCursor nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_OpeningRepairDbCursor = N'bts_LogShippingRestore failed opening the cursor holding full database backup sets.'

	declare @localized_string_bts_LogShippingRestore_Failed_ClearingHistory nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_ClearingHistory = N'bts_LogShippingRestore failed clearing restore history after restoring a full backup set.'

	declare @localized_string_bts_LogShippingRestore_Failed_AlreadyRestoredToMark nvarchar(256)
	set @localized_string_bts_LogShippingRestore_Failed_AlreadyRestoredToMark = N'The databases have already been restored to a mark.'

	DECLARE	@error_desc	nvarchar(256)
		,@error		int
		,@ret		int
		,@rowcount	int
		,@local_tran	int
		,@RestoredToMark int
LOOP_START:

	DECLARE	@NextSetId	int
		,@LastSetId	int

	SET @RestoredToMark = 0
	/*
		Determine the lowest complete backup set completely restored
	*/
	SELECT	@LastSetId = [BackupSetId], @RestoredToMark = [RestoredToMark]
	FROM	[dbo].[bts_LogShippingLastRestoreSet]
	WHERE	[SourceId] = @SourceId

	IF @@ERROR <> 0
	 BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_SelectingLastSet
		GOTO FAILED
	 END

	IF (@RestoredToMark = 1)
	BEGIN
		Set @error_desc = @localized_string_bts_LogShippingRestore_Failed_AlreadyRestoredToMark
		GOTO FAILED
	END 

	/*
		If no backup sets have been successfully restored
		create the environment (using repairall) with the 
		most recent full backup set
	*/
	IF @LastSetId IS NULL
	 BEGIN
		DECLARE	@CreateSetId	int

		SELECT	@CreateSetId = max( [BackupSetId] )
		FROM	[dbo].[bts_LogShippingHistory]
		WHERE	[SourceId] 	= @SourceId
		AND	[BackupType] 	= N'db'
		AND	[SetComplete] 	= 1
		AND	[BackupSetId]	< ( 	SELECT	max( [BackupSetId] )
						FROM	[dbo].[bts_LogShippingHistory]
						WHERE	[SourceId] 	= @SourceId
						AND	[BackupType] 	= N'lg'
						AND	[SetComplete] 	= 1 )
		
		IF @@ERROR <> 0
		 BEGIN
			SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_SelectingMaxFullSet
			GOTO FAILED
		 END

		IF @CreateSetId IS NOT NULL
		 BEGIN
			/*
				Repair all 
			*/
			EXEC @ret = [dbo].[bts_LogShippingRestoreSet]	@SourceId 	= @SourceId
									,@BackupSetId 	= @CreateSetId
									,@RestoreType	= 'db'

			IF @@ERROR <> 0 OR @ret <> 0
			 BEGIN
				SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_Executing_Full
				GOTO FAILED
			 END
			/*
				Now that we've successfully created the dbs
				clear history for all records in front of the db restore set
			*/
			UPDATE	[dbo].[bts_LogShippingHistory]
			SET	[Restored]		= 0
				,[RestoredDateTime]	= NULL
			WHERE	[SourceId]		= @SourceId
			AND	[BackupSetId]		> @CreateSetId

			IF @@ERROR <> 0 OR @ret <> 0
			 BEGIN
				SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_ClearingHistory
				GOTO FAILED
			 END
			/*
				Now that we have a good starting point again
				loop and get the next log set to restore

			*/
			GOTO LOOP_START
		 END
		ELSE
		 BEGIN
			/*
				Don't have a full db backup with a subsequent log backup
				Can't do anything yet, waiting on backup sets
			*/
			SET @ret = 0
			GOTO DONE
	 	 END
	 END

	/*
		This will get the next log set after that last fully restored set

		NOTE:  	This might be a partially complete set or a set that failed on a previous restore attempt
			These conditions are checked below
	*/
	SELECT		@NextSetId = min( [h].[BackupSetId] )
	FROM		[dbo].[bts_LogShippingHistory] [h]
	WHERE		[h].[SourceId] 		= @SourceId
	AND		[h].[BackupSetId]	> @LastSetId
	AND		[h].[BackupType]	= N'lg'

	IF @@ERROR <> 0
	 BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_SelectingNextLogSet
		GOTO FAILED
	 END
	/*
		If null no set to restore
	*/
	IF @NextSetId IS NULL
	 BEGIN
		SET @ret = 0
		GOTO DONE
	 END

	/*
		Determine if we have a subsequent full log set that can be restored to the mark
		(a backup set is not valid to restore unless it is at least n-1 where n is the latest complete log backup set)
	*/
	IF NOT EXISTS ( 	SELECT 		1
				FROM		[dbo].[bts_LogShippingHistory] [h]
				WHERE		[h].[SourceId] 		= @SourceId
				AND		[h].[SetComplete]	= 1
				AND		[h].[BackupType] 	= N'lg'
				AND		[h].[BackupSetId] 	> @NextSetId )
	 BEGIN
		/*
			Currently there is no n-1 complete backup set to restore
		*/
		SET @ret = 0
		GOTO DONE
	 END

	/*
		If we've reached here we have a log to restored.  Check error conditions:

		1. If this is a partial set (partial set means at least one backup failed).
		As a rule we don't restore partial backup sets.  Sometimes partial sets would be safe to restore 
		with an altered set of rules.  However because of multiple destination servers and other issues it 
		can be difficult to tell when they are safe and when there would be problems.  As a result it is simpliest
		and most robust to always rebuild the dbs after a partial set is detected.  In order to accomplish this
		the backup job will automatically force a full backup after a partial set is detected (unless the admin 
		sets the sp's parameter to false, see note below).  When this proc detects a partial set it must wait 
		for a new full backup and rebuild using those files.  Log backups may then proceed.  

		2. If an item in this set previously failed to restore.

		3. If a new db has been added.

		Note:  if the admin sets the bts_BackupAllFull_Schedule's @ForceFullBackupAfterPartialSetFailure parameter to 0
		a full backup will not be automatically generated until the next scheduled period or unless the 
		adm_ForceFullBackup table is used to manually force a full backup.
	*/
	IF EXISTS (	SELECT		1
			FROM		[dbo].[bts_LogShippingHistory]
			WHERE		[SourceId]	= @SourceId
			AND		[BackupSetId]	= @NextSetId
			AND		[SetComplete]	= 0 )
	OR ( 
		EXISTS (	SELECT		1
				FROM		[dbo].[bts_LogShippingHistory] [h]
				WHERE		[h].[SourceId] 		= @SourceId
				AND		[h].[BackupSetId]	= @NextSetId
				AND		[h].[Restored] 		= 0 )
		 AND 
		EXISTS (	SELECT		1
				FROM		[dbo].[bts_LogShippingHistory] [h]
				WHERE		[h].[SourceId] 		= @SourceId
				AND		[h].[BackupSetId]	= @NextSetId
				AND		[h].[Restored] 		= 1 ) 
	 )
	 BEGIN
		/*
			@NextSetId is a partial backup set or partial restore set.
			Check if we have a complete full backup set that we can use to repair

			Instead of looking for the max look for the min to try to minimize 
			the amount of out of sync between restored sets between servers in distributed environments
		*/
		DECLARE	@DbSetId	bigint
			,@LogSetId 	bigint

		
		DECLARE db_sets CURSOR FOR 
		SELECT	DISTINCT [BackupSetId]
		FROM	[dbo].[bts_LogShippingHistory]
		WHERE	[SourceId] 	= @SourceId
		AND	[BackupType] 	= N'db'
		AND	[SetComplete] 	= 1
		AND	[BackupSetId] 	> @NextSetId 
		ORDER BY BackupSetId DESC
		FOR 	READ ONLY 
		
		OPEN db_sets

		IF @@ERROR <> 0
		 BEGIN
			SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_OpeningRepairDbCursor
			GOTO FAILED
		 END
		
		FETCH NEXT FROM db_sets INTO @DbSetId
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			/*
				Got a full backup to restore, check if a log backup set exists
				that does not have a partial set between it and the full backup set
				(2 full backup sets don't count - we need a log set to exist to provide a log mark)
			*/
			SELECT	@LogSetId = min( [h1].[BackupSetId] )
			FROM	[dbo].[bts_LogShippingHistory] [h1]
			WHERE		[h1].[SourceId] 	= @SourceId
					AND	[h1].[BackupType] 	= N'lg'
					AND	[h1].[SetComplete] 	= 1
					AND	[h1].[BackupSetId] 	> @DbSetId		

			IF ( (@@ERROR <> 0) OR 
				 (@LogSetId IS NOT NULL AND EXISTS (	SELECT 1 FROM	[dbo].[bts_LogShippingHistory]
																 WHERE	[SourceId] 	= @SourceId
																	AND	[BackupType] 	= N'lg'
																	AND	[SetComplete] 	= 0
																	AND	[BackupSetId] 	> @DbSetId
																	AND	[BackupSetId] 	< @LogSetId ) ) )
			BEGIN
				/*
					Always reset - a full db set with a partial set
					after it is considered an invalid db set - this
					set cannot be used because the chain is broken after it.
					Since we are walking backwards from the most recent backup down, we will not find anything better
					so we can breakout now
				*/
				SET	@DbSetId = NULL
				SET	@LogSetId = NULL

				BREAK
			END
			
			FETCH NEXT FROM db_sets INTO @DbSetId
		END
		
		CLOSE db_sets
		DEALLOCATE db_sets


		IF @DbSetId IS NULL AND @LogSetId IS NULL
		 BEGIN
			/*
				Don't have a valid full backup set - can't do anything so fail
			*/
			SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_Repairing_NoFull
			GOTO FAILED
	 	 END
		ELSE IF @DbSetId IS NOT NULL AND @LogSetId IS NULL
		 BEGIN
			/*
				Waiting on next log backup set to arrive
				This isn't a serious condition, just exit
			*/
			SET @ret = 0
			GOTO DONE
		 END
		ELSE
		 BEGIN
			/*
				Got all the data we need to do the repair
				All we'll do here is restore the complete full set and let the 
				rest of the job handle restoring the logs as usual
			*/

			EXEC @ret = [dbo].[bts_LogShippingRestoreSet]	@SourceId 	= @SourceId
									,@BackupSetId 	= @DbSetId
									,@RestoreType	= 'db'

			IF @@ERROR <> 0 OR @ret <> 0
			 BEGIN
				SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_Executing_Full
				GOTO FAILED
			 END
			/*
				Now that we've successfully created the dbs
				clear history for all records in front of the db restore set
			*/
			UPDATE	[dbo].[bts_LogShippingHistory]
			SET	[Restored]		= 0
				,[RestoredDateTime]	= NULL
			WHERE	[SourceId]		= @SourceId
			AND	[BackupSetId]		> @DbSetId

			IF @@ERROR <> 0 OR @ret <> 0
			 BEGIN
				SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_ClearingHistory
				GOTO FAILED
			 END
			/*
				Now that we have a good starting point again
				loop and get the next log set to restore
			*/
			GOTO LOOP_START
		 END
	 END

RESTORE_NEXT:
	/*
		Restore the set
	*/
	EXEC @ret = [dbo].[bts_LogShippingRestoreSet]	@SourceId	= @SourceId
							,@BackupSetId	= @NextSetId
							,@RestoreType	= N'lg'

	IF @@ERROR <> 0 OR @ret <> 0
	 BEGIN
		SET @error_desc = @localized_string_bts_LogShippingRestore_Failed_Executing_RestoreSet
		GOTO FAILED
	 END
	/*
		Loop back to start and see if there are any more logs to be restored.
	*/
	GOTO LOOP_START

FAILED:
	RAISERROR( @error_desc, 16, -1 )

	SET @ret = -1
	
	GOTO DONE


DONE:	
	RETURN @ret
 END
GO


GRANT EXECUTE ON [dbo].[bts_LogShippingRestore] TO BTS_BACKUP_USERS
GO




/**************************************************************************************************
	bts_LogShippingClean stored proceedure

	Drops all dbs for the given source and clears the last 
	BackupSetId from bts_LogShippingLastRestoreSet table
**************************************************************************************************/
IF OBJECT_ID('bts_LogShippingClean') IS NOT NULL
	DROP PROCEDURE [dbo].[bts_LogShippingClean]
GO

CREATE PROCEDURE [dbo].[bts_LogShippingClean]	@SourceId int
AS
 BEGIN

	SET NOCOUNT ON

	declare @localized_string_bts_LogShippingClean_Failed nvarchar(256)
	set @localized_string_bts_LogShippingClean_Failed = N'bts_LogShippingClean failed'


	DECLARE @restore 	nvarchar(256)
		,@ret		int
		,@error		int
		,@error_desc	nvarchar(256)

	DELETE	[dbo].[bts_LogShippingLastRestoreSet]
	WHERE	[SourceId] = @SourceId
	
	DECLARE drop_cursor INSENSITIVE CURSOR FOR
	SELECT restorename = CASE
				WHEN RestoreName IS NULL THEN DatabaseName
				ELSE RestoreName
			     END
	FROM bts_LogShippingDatabases
	WHERE SourceId = @SourceId
	
	
	OPEN drop_cursor
	
	FETCH NEXT FROM drop_cursor INTO @restore
	
	WHILE @@FETCH_STATUS = 0
	 BEGIN
		set @restore = replace( @restore, '''', '''''' )
		IF EXISTS (SELECT 1 FROM sysdatabases WHERE name = @restore )
			EXEC( 'drop database ' + @restore )
	
		FETCH NEXT FROM drop_cursor INTO @restore
	 END
	
	CLOSE drop_cursor
	DEALLOCATE drop_cursor
	
	SET @ret = 0
	GOTO DONE

FAILED:
	RAISERROR( @error_desc, 16, -1 )

	SET @ret = -1
	
	GOTO DONE


DONE:	
	RETURN @ret
 END
GO


GRANT EXECUTE ON [dbo].[bts_LogShippingClean] TO BTS_BACKUP_USERS
GO
