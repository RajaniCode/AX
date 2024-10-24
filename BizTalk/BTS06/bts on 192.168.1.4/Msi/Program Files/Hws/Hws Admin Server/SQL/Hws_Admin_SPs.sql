--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetAllHwsServices]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetAllHwsServices]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetHwsInstallation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetHwsInstallation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetHwsInstallations]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetHwsInstallations]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetHwsService]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetHwsService]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetHwsServices]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetHwsServices]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_UpdateHwsInstallation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_UpdateHwsInstallation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_AddTrustedUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_AddTrustedUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetTrustedUsers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetTrustedUsers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_RemoveTrustedUsers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_RemoveTrustedUsers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_UpdateCore]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_UpdateCore]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE procedure [dbo].[Hws_GetAllHwsServices]
as
set nocount on
Select * from [dbo].[Hws_Service]
GO
grant EXECUTE on [dbo].[Hws_GetAllHwsServices] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[Hws_GetAllHwsServices] to HWS_AM_DESIGNER
GO

CREATE procedure [dbo].[Hws_AddTrustedUser] 
	@Domain nvarchar(256),
	@Username nvarchar(256),
	@HwsCoreId uniqueidentifier
as
set nocount on
Insert into [dbo].[Hws_TrustedUsers] (DomainName, UserName, HwsCoreId) values (@Domain, @Username, @HwsCoreId)
GO
grant EXECUTE on [dbo].[Hws_AddTrustedUser] to HWS_ADMIN_USER
GO

CREATE procedure [dbo].[Hws_GetTrustedUsers]
	@HwsCoreId uniqueidentifier
as
set nocount on
Select * from [dbo].[Hws_TrustedUsers]
Where HwsCoreId=@HwsCoreId
GO

grant EXECUTE on [dbo].[Hws_GetTrustedUsers] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetTrustedUsers] to HWS_ADMIN_USER
GO

CREATE procedure [dbo].[Hws_RemoveTrustedUsers] 
as
set nocount on
delete [dbo].[Hws_TrustedUsers]
GO
grant EXECUTE on [dbo].[Hws_RemoveTrustedUsers] to HWS_ADMIN_USER
GO

CREATE procedure [dbo].[Hws_GetHwsInstallation]
(
	@InstallationID uniqueidentifier
)
as
set nocount on
select * from [dbo].[Hws_Core] where ID=@InstallationID
GO
grant EXECUTE on [dbo].[Hws_GetHwsInstallation] to HWS_ADMIN_USER
GO

create procedure [dbo].[Hws_GetHwsInstallations]
as
set nocount on
Select * from [dbo].[Hws_Core]
GO
grant EXECUTE on [dbo].[Hws_GetHwsInstallations] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetHwsInstallations] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[Hws_GetHwsInstallations] to HWS_AM_DESIGNER
GO


CREATE procedure [dbo].[Hws_GetHwsService]
(
	@ServiceUrl nvarchar(256)
)
as
set nocount on
select * from [dbo].[Hws_Service] where ServiceUrl=@ServiceUrl
GO
grant EXECUTE on [dbo].[Hws_GetHwsService] to HWS_ADMIN_USER
GO

CREATE procedure [dbo].[Hws_GetHwsServices]
(
	@HwsCoreID uniqueidentifier
)
as
set nocount on
select * from [dbo].[Hws_Service] where HwsCoreID=@HwsCoreID
GO
grant EXECUTE on [dbo].[Hws_GetHwsServices] to HWS_ADMIN_USER
GO


CREATE procedure [dbo].[Hws_UpdateHwsInstallation]
(
	@InstallationID uniqueidentifier,
	@BizTalkServerLocation nvarchar(256),
	@BizTalkManagementDBName nvarchar(256),
	@ActivationMessageURL nvarchar(256),
	@InterruptMessageURL nvarchar(256),
	@TrackingDBMachine nvarchar(256),
	@TrackingDBName nvarchar(256),
	@ConstraintDBMachine nvarchar(256),
	@ConstraintDBName nvarchar(256),
	@ConstraintsAsGuidance bit
)
as
set nocount on
update [dbo].[Hws_Core] set BizTalkServerLocation=@BizTalkServerLocation, 	BizTalkManagementDBName=@BizTalkManagementDBName,
	TrackingDatabaseMachineName=@TrackingDBMachine, TrackingDatabaseName=@TrackingDBName, 
	ConstraintDatabaseMachineName=@ConstraintDBMachine, ConstraintDatabaseName=@ConstraintDBName, 
	ActivationMessageURL=@ActivationMessageURL, InterruptMessageURL=@InterruptMessageURL, ConstraintsUsedAsGuidance=@ConstraintsAsGuidance
where ID=@InstallationID
GO
grant EXECUTE on [dbo].[Hws_UpdateHwsInstallation] to HWS_ADMIN_USER
GO


/*
Used by setup/config program, only sys admin can exeucte this.
*/
create proc [dbo].[Hws_UpdateCore]
(
	@BizTalkMgmtServer nvarchar(256),
	@BizTalkMgmtDB nvarchar(256),
	@BizTalkDTAServer nvarchar(256),
	@BizTalkDTADB nvarchar(256),
	@HwsConstraintsServer nvarchar(256),
	@HwsConstraintsDB nvarchar(256),
	@ActivationMessageURL nvarchar(256),
	@InterruptMessageURL nvarchar(256)
)
AS
set nocount on
BEGIN
	IF NOT EXISTS(SELECT [ID] FROM [dbo].[Hws_Core])
	begin
	insert [dbo].[Hws_Core] (BizTalkServerLocation, BizTalkManagementDBName,
		TrackingDatabaseMachineName, TrackingDatabaseName, ConstraintDatabaseMachineName,
		ConstraintDatabaseName,ActivationMessageURL, InterruptMessageURL)
	Values (@BizTalkMgmtServer, @BizTalkMgmtDB, @BizTalkDTAServer, @BizTalkDTADB, 
		@HwsConstraintsServer, @HwsConstraintsDB, @ActivationMessageURL, @InterruptMessageURL)
	end
	ELSE
	begin
	Update [dbo].[Hws_Core] 
	Set
		BizTalkServerLocation = @BizTalkMgmtServer,
		BizTalkManagementDBName = @BizTalkMgmtDB,
		TrackingDatabaseMachineName = @BizTalkDTAServer,
		TrackingDatabaseName = @BizTalkDTADB,
		ConstraintDatabaseMachineName = @HwsConstraintsServer,
	ConstraintDatabaseName = @HwsConstraintsDB,
		ActivationMessageURL = @ActivationMessageURL, 
		InterruptMessageURL = @InterruptMessageURL
	Where [ID] = (Select [ID] from [Hws_Core]) AND (Len(ActivationMessageURL) = 0)
	end
END
GO