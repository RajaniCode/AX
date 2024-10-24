--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  
------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AddTrustedUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AddTrustedUser]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_RemoveTrustedUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_RemoveTrustedUser]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_CreateApplicationRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_CreateApplicationRole]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AddApplicationLogin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AddApplicationLogin]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_RemoveApplicationRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_RemoveApplicationRole]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[adm_ChangeHostTrackingPrivilege]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[adm_ChangeHostTrackingPrivilege]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_DropRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_DropRole]
GO

CREATE PROCEDURE [dbo].[bts_DropRole]
@RoleName nvarchar(300)
AS 
	
set nocount on
set transaction isolation level read committed

if exists (select * from dbo.sysusers where name = @RoleName and issqlrole = 1)
BEGIN
	declare @UserName nvarchar(256),
		@UserID int

	CREATE TABLE #tbl (GroupName nvarchar(256),
			    GroupId int,
			    UserName nvarchar(256),
			    UserId int)
	
	
	INSERT INTO #tbl EXECUTE sp_helpuser @RoleName
	declare RoleCursor cursor FOR
	SELECT UserId FROM #tbl
	
	open RoleCursor
	FETCH NEXT FROM RoleCursor INTO @UserID
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		-- have to do this look up because the data in the sp_helpuser truncates the name of the user
		select @UserName = name FROM sysusers WHERE uid = @UserID
		exec sp_droprolemember @RoleName, @UserName
		FETCH NEXT FROM RoleCursor INTO @UserID
	END
	
	close RoleCursor
	deallocate RoleCursor
	drop table #tbl

	exec sp_droprole @RoleName
END
GO
GRANT EXEC ON [dbo].[bts_DropRole] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_CreateApplicationRole]
@ApplicationName nvarchar(128),
@fCreateNew int = 1
AS

set nocount on
set transaction isolation level read committed

	declare @AppUsersRole nvarchar(150), @RoleExist int
	set @AppUsersRole = 'BTS_' + @ApplicationName + '_USERS'

	select @RoleExist = count(*) from sysusers where name = @AppUsersRole

	if ( @RoleExist = 0 AND @fCreateNew = 1)
	BEGIN
		-- Create Host specific role and assign it privileges
		exec sp_addrole @AppUsersRole

		-- Allow Host specific role inherits the generic host privileges by adding it as a member of BTS_HOST_USERS
		exec ( 'sp_addrolemember BTS_HOST_USERS, [' + @AppUsersRole + ']')

		-- Allow BTS_ADMIN_USERS inherits the host specific privileges by adding it as a member of Host specific role
		exec ( 'sp_addrolemember [' + @AppUsersRole + '], BTS_ADMIN_USERS')

		set @RoleExist = 1
	END
	
	if (@RoleExist = 1)
	BEGIN
	-- Always regrant privileges since the role may exist but incomplete
		exec ( 'GRANT EXECUTE ON [bts_CreateSubscription_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_LockInstanceByID_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_ReadPartData_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_ReadMessagePart_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_InsertDynamicStateInfo_' + @ApplicationName + '] TO [' + @AppUsersRole +']') 
		exec ( 'GRANT EXECUTE ON [bts_GetDynamicStateInfo_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_UpdateMsgbox_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_DeQueueMessages_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_ProcessHeartbeat_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_ReadInstanceStateMessages_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_ReadInstanceStateMessage_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_GetConstructedMessage_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_AddFragmentForMessageConstruction_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_InsertDebugMessage_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_InsertMessageDirect_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_ReadSpecificMessage_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_InsertPredicate_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [bts_CreateNamedPredicateGroup_' + @ApplicationName + '] TO [' + @AppUsersRole +']')

		-- Certain admin host specific stored procs need to be accessed by BTS_ADMIN_USERS
		exec ( 'GRANT EXECUTE ON [bts_AdminAddServiceInstances_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminAddMessageInstances_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminQueryWorkQInstances_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminQuerySuspendedQInstances_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminQueryWorkQMessages_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminQuerySuspendedQMessages_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminDeleteSuspendedMessageRef_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminPreemptAndGetInstances_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminPreemptiveOperateOnInstances_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminCompleteTerminate_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminOperatorsPreemptAndGetInstances_' + @ApplicationName + '] TO BTS_ADMIN_USERS')
		exec ( 'GRANT EXECUTE ON [bts_AdminOperatorsStartAndStopService_' + @ApplicationName + '] TO BTS_ADMIN_USERS')

		--grant admin permissions to select on the queues as this is needed for HAT and OpsOM
		exec ( 'GRANT SELECT ON [' + @ApplicationName + 'Q] TO BTS_ADMIN_USERS')
		exec ( 'GRANT SELECT ON [' + @ApplicationName + 'Q_Scheduled] TO BTS_ADMIN_USERS')
		exec ( 'GRANT SELECT ON [' + @ApplicationName + 'Q_Suspended] TO BTS_ADMIN_USERS')
		exec ( 'GRANT SELECT ON [InstanceStateMessageReferences_' + @ApplicationName + '] TO BTS_ADMIN_USERS')

		exec ( 'GRANT SELECT ON [' + @ApplicationName + 'Q] TO BTS_OPERATORS')
		--exec ( 'GRANT SELECT ON [' + @ApplicationName + 'Q_Scheduled] TO BTS_OPERATORS')
		exec ( 'GRANT SELECT ON [' + @ApplicationName + 'Q_Suspended] TO BTS_OPERATORS')
		exec ( 'GRANT SELECT ON [InstanceStateMessageReferences_' + @ApplicationName + '] TO BTS_OPERATORS')

		exec ( 'GRANT EXECUTE ON [bts_AdminOperatorsPreemptAndGetInstances_' + @ApplicationName + '] TO BTS_OPERATORS')
		exec ( 'GRANT EXECUTE ON [bts_AdminOperatorsStartAndStopService_' + @ApplicationName + '] TO BTS_OPERATORS')

		-- Grant host-specific users permissions for msgbox perfcounter sprocs
		exec ( 'GRANT EXECUTE ON [MsgBoxPerfCounters_GetHostQueueLength_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [MsgBoxPerfCounters_GetHostQueueSuspendedLength_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [MsgBoxPerfCounters_GetStateQueueLength_' + @ApplicationName + '] TO [' + @AppUsersRole +']')
		exec ( 'GRANT EXECUTE ON [MsgBoxPerfCounters_GetHostInstancesNumber_' + @ApplicationName + '] TO [' + @AppUsersRole +']') 

	END
GO
GRANT EXEC ON [dbo].[bts_CreateApplicationRole] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[bts_RemoveApplicationRole]
@ApplicationName nvarchar(128)
AS
	set nocount on
	set transaction isolation level read committed

	declare @RoleName sysname, @RoleExist int

	-- Construct SQL role name based on name of Host
	set @RoleName = 'BTS_' + @ApplicationName + '_USERS'

	-- Gather info
	select @RoleExist = count(*) from sysusers where UPPER(name) = UPPER(@RoleName)

	-- First check if user has insufficient permission, then error out immediately
	if ( @RoleExist = 1 AND dbo.adm_HasPermissionToPerform('DbRoleTasks') = 0 )
		return 0xC0C025D3 -- CIS_E_ADMIN_CORE_SQL_DBROLE_OPS_INSUFFICIENT_PRIV

	-- Delete @RoleName
	if ( @RoleExist = 1 )
	begin
		exec adm_RemoveRole @RoleName
	end		
GO
GRANT EXEC ON [dbo].[bts_RemoveApplicationRole] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[bts_AddApplicationLogin]
@ApplicationName nvarchar(128),
@ApplicationAccount nvarchar(128),
@HostTracking int
AS
set nocount on
set transaction isolation level read committed

declare @exists int
SELECT @exists = COUNT(*) FROM Applications WHERE nvcApplicationName = @ApplicationName
if (@exists = 0)
	return --Maybe we should fail but for now we won't

if ( @ApplicationAccount <> N'' )
begin

	set @ApplicationAccount = dbo.adm_FormatNTGroupName(@ApplicationAccount)

	declare @rc int, @RoleName sysname, @RoleExist int, @UserExist as int, @LoginExist as int, @IsMember as int
	-- Construct SQL role name based on name of Host
	set @RoleName = 'BTS_' + @ApplicationName + '_USERS'
	-- Gather info
	select @LoginExist = count(*) from master.dbo.syslogins where UPPER(name) = UPPER(@ApplicationAccount)
	select @UserExist = count(*) from sysusers where UPPER(name) = UPPER(@ApplicationAccount)
	select @RoleExist = count(*) from sysusers where UPPER(name) = UPPER(@RoleName)
	exec adm_IsMemberOfRole @ApplicationAccount, @RoleName, @IsMember output
	-- First check if user has insufficient permission, then error out immediately
	if ( @LoginExist = 0 AND dbo.adm_HasPermissionToPerform('LoginTasks') = 0 )
		return 0xC0C025CF -- CIS_E_ADMIN_CORE_SQL_LOGIN_CREATION_INSUFFICIENT_PRIV
	else
	if ( @UserExist = 0 AND dbo.adm_HasPermissionToPerform('DbAccessTasks') = 0 )
		return 0xC0C025D2 -- CIS_E_ADMIN_CORE_SQL_DBACCESS_OPS_INSUFFICIENT_PRIV
	else
	if ( @RoleExist = 0 AND dbo.adm_HasPermissionToPerform('DbRoleTasks') = 0 )
		return 0xC0C025D3 -- CIS_E_ADMIN_CORE_SQL_DBROLE_OPS_INSUFFICIENT_PRIV
	-- Create the SQL login for the host account
	if ( @LoginExist = 0 )
	begin
		exec @rc = sp_grantlogin @ApplicationAccount
		if ( @rc <> 0 ) return
	end
	-- Grant database access to the host account
	if ( @UserExist = 0 )
	begin
		exec @rc = sp_grantdbaccess @ApplicationAccount
		if ( @rc <> 0 ) return
	end
	
	-- Always try to regrant privileges to SQL role for the host
	exec bts_CreateApplicationRole @ApplicationName

	-- Grant application account the created SQL role
	if ( @IsMember = 0 )
		exec sp_addrolemember @RoleName, @ApplicationAccount
		
	-- If host tracking, instead of adding host account to the BAM_EVENT_READER
	-- role, only apply the privileges associated with the role to the host account.
	-- The reason is because later when the host tracking configuration is changed,
	-- we can then transactionally apply or unapply these privileges using GRANT and
	-- REVOKE statements. (The problem with sp_addrolemember and sp_droprolemember
	-- is that they cannot be transactional)
	if ( @HostTracking <> 0 )
		exec adm_ChangeRolePrivForUser 'BAM_EVENT_READER', @ApplicationAccount, 'GRANT'
end
else
begin
	raiserror('Parameter @ApplicationAccount is missing', 16, 1)
end
GO
GRANT EXEC ON [dbo].[bts_AddApplicationLogin] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[adm_ChangeHostTrackingPrivilege]
@ApplicationAccount nvarchar(128),
@ProtectType nvarchar(10) -- GRANT/DENY/REVOKE
AS
	declare @ErrCode as int
	set @ErrCode = 0

	exec @ErrCode = adm_ChangeRolePrivForUser 'BAM_EVENT_READER', @ApplicationAccount, @ProtectType
	if(@ErrCode != 0)
		return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_ChangeHostTrackingPrivilege] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE bts_AddTrustedUser
@nvcUserName nvarchar(128),
@nvcApplicationName nvarchar(128),
@fSuccess int OUTPUT
AS

set nocount on
set transaction isolation level read committed

set @fSuccess = 1

INSERT INTO TrustedUsers VALUES (@nvcUserName, @nvcApplicationName)

GO
GRANT EXEC ON [dbo].[bts_AddTrustedUser] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_RemoveTrustedUser]
@nvcUserName nvarchar(128),
@nvcApplicationName nvarchar(128),
@fSuccess int OUTPUT
AS

set nocount on
set transaction isolation level read committed

set @fSuccess = 1

DELETE FROM TrustedUsers
WHERE nvcUserName = @nvcUserName AND
	nvcApplicationName = @nvcApplicationName


GO
GRANT EXEC ON [dbo].[bts_RemoveTrustedUser] TO BTS_ADMIN_USERS
GO
