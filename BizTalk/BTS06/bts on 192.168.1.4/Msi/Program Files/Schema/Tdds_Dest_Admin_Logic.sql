--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

-- Stored procs for Admin
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[adm_ChangeHostTrackingPrivilege]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [adm_ChangeHostTrackingPrivilege]
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: adm_ChangeHostTrackingPrivilege
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[adm_ChangeHostTrackingPrivilege]
@ApplicationAccount nvarchar(128),
@ProtectType nvarchar(10) -- GRANT/DENY/REVOKE
AS
	declare @ErrCode as int
	set @ErrCode = 0

	exec @ErrCode = adm_ChangeRolePrivForUser 'BAM_EVENT_WRITER', @ApplicationAccount, @ProtectType
	if(@ErrCode != 0)
		return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_ChangeHostTrackingPrivilege] TO BTS_ADMIN_USERS
GO


-- If TDDS's BAM_EVENT_WRITER role exist, then make BTS_HOST_USERS a member of it
--if exists (select * from sysusers where name = N'BAM_EVENT_WRITER' and issqlrole = 1)
--	EXEC sp_addrolemember BAM_EVENT_WRITER, BTS_HOST_USERS
--GO
