--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

/* Run this script in each database to be marked */

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

/* Check for and drop the old proc */
if exists (select * from sysobjects where id = object_id(N'dbo.sp_SetMark') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_SetMark]
GO


/**************************************************************************************************
 Create the  SetMark sp  this procedure does not use the WITH MARK keyword
 It is used when the calling procedure has specified WITH MARK and resides on
 the same server

 Arguments: @name, a string used to specify the Mark to be written in the MarkLog               
**************************************************************************************************/
CREATE PROCEDURE [dbo].[sp_SetMark]
	@name nvarchar (128)
  AS
BEGIN
	BEGIN TRANSACTION @name 

		INSERT INTO [dbo].[MarkLog]([MarkName])
		VALUES(@name)

		IF @@Error <> 0
		 BEGIN
			GOTO FAILED
		 END

	COMMIT TRANSACTION @name

	return 0

FAILED:
	if @@trancount > 0
		rollback transaction @name

	return -1
END 
GO

grant execute on [dbo].[sp_SetMark] to BTS_BACKUP_USERS
GO

/* Check for and drop the old proc */
if exists (select * from sysobjects where id = object_id(N'dbo.sp_SetMarkRemote') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_SetMarkRemote]
GO


/**************************************************************************************************
 Create the  SetMarkRemote stored procedure.  This procedure uses the WITH MARK keyword
 It is used when the calling procedure has specified WITH MARK and resides on a different  
 server and this is the first procedure on the server.  All subsequent calls should use sp_SetMark 

 Arguments: @name, a string used to specify the Mark to be written in the MarkLog  
**************************************************************************************************/

CREATE PROCEDURE [dbo].[sp_SetMarkRemote]
	@name nvarchar (128)
  AS
BEGIN
	BEGIN TRANSACTION @name WITH MARK @name

		INSERT INTO [dbo].[MarkLog]([MarkName])
		VALUES(@name)

		IF @@Error <> 0
		 BEGIN
			GOTO FAILED
		 END

	COMMIT TRANSACTION @name

	RETURN 0

FAILED:
	if @@trancount > 0
		rollback transaction @name
  	
	return -1
END 
GO

grant execute on [dbo].[sp_SetMarkRemote] to BTS_BACKUP_USERS
GO



/* Check for and drop the old proc */
if exists (select * from sysobjects where id = object_id(N'dbo.sp_BackupBizTalkLog') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_BackupBizTalkLog]

go

/**************************************************************************************************
Create the sp_BackupBizTalkLog proc.
This procedure is responsible for backing up the log of the local database to the specified path

Arguments: @seg - backup set/sequence name, @path - path to store the backup file, @BackupLocation - full path of the backup file (out)
**************************************************************************************************/

CREATE PROCEDURE [dbo].[sp_BackupBizTalkLog] @seq nvarchar (128), @path nvarchar (3000), @BackupLocation nvarchar(4000) OUTPUT
AS
begin
	declare @DBName nvarchar(128), @ServerName nvarchar(256)

	select @DBName = db_name(), @ServerName = replace( cast( isnull( serverproperty('servername'), '' ) as nvarchar ), '\', '_' ) /* this will be a file path */

	if right( @path, 1 ) = '\'
		SET @BackupLocation=@path + @ServerName + N'_' + @DBName + N'_Log_' + @seq + N'.bak'
	else	
		SET @BackupLocation=@path + N'\' + @ServerName + N'_' + @DBName + N'_Log_' + @seq + N'.bak'

	Backup LOG @DBName to DISK=@BackupLocation
	
	if @@ERROR <> 0
		goto FAILED

	return 0

FAILED:
	return -1

end
go

grant execute on [dbo].[sp_BackupBizTalkLog] to BTS_BACKUP_USERS
GO


/* Check for and drop the old proc */
if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupBizTalkFull]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_BackupBizTalkFull]
GO

/**************************************************************************************************
Create the sp_BackupBizTalkFull proc.
This procedure is responsible for backing up the log of the local database to the specified path

Arguments: @seg - backup set/sequence name, @path - path to store the backup file, @BackupLocation - full path of the backup file (out)
**************************************************************************************************/

CREATE PROCEDURE [dbo].[sp_BackupBizTalkFull] @seq nvarchar (128), @path nvarchar (3000), @BackupLocation nvarchar(4000) OUTPUT
AS
begin
	declare @DBName nvarchar(128), @ServerName nvarchar(256)

	select @DBName = db_name(), @ServerName = replace( cast( isnull( serverproperty('servername'), '' ) as nvarchar ), '\', '_' ) /* this will be a file path */

	if right( @path, 1 ) = '\'
		SET @BackupLocation=@path + @ServerName + N'_' + @DBName + N'_Full_' + @seq + N'.bak'
	else
		SET @BackupLocation=@path + N'\' + @ServerName + N'_' + @DBName + N'_Full_' + @seq + N'.bak'

	Backup Database @DBName to DISK=@BackupLocation

	if @@ERROR <> 0
		goto FAILED

	return 0

FAILED:
	return -1

end
GO

grant execute on [dbo].[sp_BackupBizTalkFull] to BTS_BACKUP_USERS
GO


/* Check for and drop the old proc */
if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetServerName]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[sp_GetServerName]
GO

/****************************************************************
Create the sp_GetServerName proc
This procedure is used to return the actual server name to avoid conflicts when two databases are
on the same server but the user uses different identifiers for the server with each database

Arguments: @name sysname -- output parameter returning the server name
**************************************************************/
CREATE PROCEDURE [dbo].[sp_GetServerName] @name sysname OUTPUT
AS
BEGIN
	set @name = CONVERT(sysname, SERVERPROPERTY('servername'))

	return 0
END
GO

grant execute on [dbo].[sp_GetServerName] to BTS_BACKUP_USERS
GO
