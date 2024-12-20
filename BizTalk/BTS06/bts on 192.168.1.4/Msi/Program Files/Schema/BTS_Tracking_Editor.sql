--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

--/--------------------------------------------------------------------------------------------------------
-- Remove Tables
--/--------------------------------------------------------------------------------------------------------


--/--------------------------------------------------------------------------------------------------------------------
--//	Remove stored procedures 
--/--------------------------------------------------------------------------------------------------------------------
-- Stored procs for TPE
if exists (select * from sysobjects where id = object_id(N'[bam_DeployTrackPoint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bam_DeployTrackPoint]
GO

if exists (select * from sysobjects where id = object_id(N'[bam_DeployTrackingProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bam_DeployTrackingProfile]
GO

if exists (select * from sysobjects where id = object_id(N'[bam_RemoveTrackingProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bam_RemoveTrackingProfile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_ReadTrackingProfileByMessageType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bam_ReadTrackingProfileByMessageType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_ReadTrackingProfileBySchemaStrongName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bam_ReadTrackingProfileBySchemaStrongName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_InsertActivityOrchestrationRelation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bam_InsertActivityOrchestrationRelation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_GetOrchestrationsForActivity]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bam_GetOrchestrationsForActivity]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_RemoveActivityOrchestrationRelation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bam_RemoveActivityOrchestrationRelation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_EnumerateReferencesRecursive]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_EnumerateReferencesRecursive]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_GetPit]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_GetPit]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_GetSchema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_GetSchema]
GO 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_GetServicesPerAssembly]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_GetServicesPerAssembly]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_GetTrackingDatabase]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_GetTrackingDatabase]
GO

-- Stored procs for TrkFramework\TPCompiler\TPCompiler.cs
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_RemoveTrackingProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_RemoveTrackingProfile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_UpdateTrackingProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_UpdateTrackingProfile]
GO

-- Stored procs for Controls\MgmtDbConfig.cs
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_HatGetConfig]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_HatGetConfig]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_HatGetHostList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_HatGetHostList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_GetServiceID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_GetServiceID]
GO

-- stored procs for BAM Config
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_SetPit]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_SetPit]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_UpdateTDDS]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_UpdateTDDS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[trk_UpdateOtherBackupDatabases]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[trk_UpdateOtherBackupDatabases]
GO

--/--------------------------------------------------------------------------------------------------------
--/
--/ Stored procs for TPE
--/
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: bam_DeployTrackPoint
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bam_DeployTrackPoint]
	@nTrackPointId int,
	@nvcSchemaName nvarchar(513),
	@nvcPortName nvarchar(256),
	@nDirection int,
	@uidProfileVersionId uniqueidentifier,
	@nMinorVersionId int,
	@ntxtData ntext
AS
BEGIN
	DECLARE @nvcMsgType nvarchar(2048),
		@uidPortId uniqueidentifier,
		@pipelineRelease int,
		@nProfileId int

	declare @localized_Invalid_Pipeline_Type AS nvarchar(256)
	set @localized_Invalid_Pipeline_Type  = N'Trackpoints cannot be associated with ports which use custom pipelines upgraded from BizTalk 2004'

	declare @localized_Invalid_Port_Name AS nvarchar(256)
	set @localized_Invalid_Port_Name = N'The port name associated with this trackpoint could not be found'
	
	IF (@nvcSchemaName IS NOT NULL)
	BEGIN
		--there could be versioning, but the docspec name, msgtype pairing shouldn't change with versioning
		SELECT TOP 1 @nvcMsgType = msgtype FROM bt_DocumentSpec WHERE docspec_name = @nvcSchemaName 
	END

	IF (@nvcPortName IS NOT NULL)
	BEGIN
		--if there is a port, we need to check to make sure it does not use a voyager pipeline. For sendports
		--this check is easy since the pipeline is tied to the port. For receive ports, if any receive location 
		--associated with this port uses a voyager pipeline, we will not allow it since we don't know which location
		--the message could come in via. Users should just create a new port if they can't update the pipeline		
		IF (@nDirection = 0)
		BEGIN
			SELECT TOP 1 @uidPortId = rp.uidGUID, @pipelineRelease = p.Release FROM bts_receiveport rp
				JOIN adm_ReceiveLocation rl ON rl.ReceivePortId = rp.nID
				LEFT JOIN bts_pipeline p ON rl.ReceivePipelineId = p.Id AND p.Release = 1
			WHERE nvcName = @nvcPortName
			if (@@ROWCOUNT = 0)
			BEGIN
				SELECT @pipelineRelease = p.Release, @uidPortId = s.uidGUID FROM bts_sendport s
				JOIN bts_pipeline p ON s.nReceivePipelineID = p.Id
				WHERE s.nvcName = @nvcPortName AND s.bTwoWay = 1
			END
		END
		ELSE
		BEGIN
			SELECT @pipelineRelease = p.Release, @uidPortId = s.uidGUID FROM bts_sendport s
				JOIN bts_pipeline p ON s.nSendPipelineID = p.Id
				WHERE s.nvcName = @nvcPortName
			IF (@@ROWCOUNT = 0)
			BEGIN
				SELECT TOP 1 @uidPortId = rp.uidGUID, @pipelineRelease = p.Release FROM bts_receiveport rp
					JOIN adm_ReceiveLocation rl ON rl.ReceivePortId = rp.nID
					LEFT JOIN bts_pipeline p ON rl.SendPipelineId = p.Id AND p.Release = 1
				WHERE nvcName = @nvcPortName AND bTwoWay = 1
			END
		END

		if (@uidPortId IS NULL)
		BEGIN
			RAISERROR(@localized_Invalid_Port_Name, 16, 1)
			return
		END

		if ( (@pipelineRelease IS NOT NULL) AND (@pipelineRelease = 1) )
		BEGIN
			RAISERROR(@localized_Invalid_Pipeline_Type, 16, 1)
			return
		END
	END

	SELECT @nProfileId = nID FROM bam_TrackingProfiles WHERE uidVersionId = @uidProfileVersionId AND nMinorVersionId = @nMinorVersionId
	
	INSERT INTO bam_TrackPoints (nTrackPointId, nvcMsgType, uidPortId, nDirection, nProfileId, ntxtData)
		VALUES (@nTrackPointId, @nvcMsgType, @uidPortId, @nDirection, @nProfileId, @ntxtData)
END
GO
GRANT EXEC ON [dbo].[bam_DeployTrackPoint] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: bam_RemoveTrackingProfile
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bam_RemoveTrackingProfile]
	@uidVersionId uniqueidentifier
AS
BEGIN
	DECLARE @idx int

	SELECT @idx = nID FROM bam_TrackingProfiles WHERE uidVersionId = @uidVersionId
	IF (@idx IS NOT NULL)
	BEGIN
		DELETE FROM bam_TrackPoints WHERE nProfileId = @idx
		DELETE FROM bam_TrackingProfiles WHERE uidVersionId = @uidVersionId
	END
END
GO
GRANT EXEC ON [dbo].[bam_RemoveTrackingProfile] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: bam_DeployTrackingProfile
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bam_DeployTrackingProfile]
	@nvcName nvarchar(128),
	@uidVersionId uniqueidentifier,
	@nMinorVersionId int,
	@fForce bit
AS
BEGIN

	IF (@fForce = 1)
		EXEC bam_RemoveTrackingProfile @uidVersionId

	INSERT INTO bam_TrackingProfiles (nvcName, uidVersionId, nMinorVersionId) VALUES (@nvcName, @uidVersionId, @nMinorVersionId)
END
GO
GRANT EXEC ON [dbo].[bam_DeployTrackingProfile] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: bam_ReadTrackingProfileByMessageType
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bam_ReadTrackingProfileByMessageType]
@nvcMessageType nvarchar(2048),
@nvcPortName nvarchar(256),
@nDirection int
AS

declare @uidPortId uniqueidentifier,
	@uidSchemaId uniqueidentifier,
	@nRetCode int

set @nRetCode = 0
/******
nRetCode = 0 means success
nRetCode = 1 means an invalid schema name was passed in
nRetCode = 2 means an invalid port name was passed in
nRetCode = 3 means no port name was passed in (it is required)
**********/

if (@nvcPortName IS NOT NULL)
BEGIN
	IF (@nDirection = 0)
	BEGIN
		SELECT @uidPortId = uidGUID FROM bts_receiveport WHERE nvcName = @nvcPortName
		if (@@ROWCOUNT = 0)
		BEGIN
			SELECT @uidPortId = uidGUID FROM bts_sendport WHERE nvcName = @nvcPortName AND bTwoWay = 1
		END
	END
	ELSE
	BEGIN
		SELECT @uidPortId = uidGUID FROM bts_sendport WHERE nvcName = @nvcPortName
		IF (@@ROWCOUNT = 0)
		BEGIN
			SELECT @uidPortId = uidGUID FROM bts_receiveport WHERE nvcName = @nvcPortName AND bTwoWay = 1
		END
	END
	
	if (@uidPortId IS NULL)
		set @nRetCode = 2
END
else
	set @nRetCode = 3

if (@nRetCode = 0)
BEGIN

	if (@nvcMessageType IS NOT NULL)
	BEGIN
		SELECT td.ntxtData, null, tp.uidVersionId, tp.nMinorVersionId, td.nTrackPointId
		FROM bam_TrackPoints td
		JOIN bam_TrackingProfiles tp ON td.nProfileId = tp.nID
		WHERE td.nvcMsgType = @nvcMessageType AND td.uidPortId = @uidPortId AND td.nDirection = @nDirection

		UNION ALL

		SELECT td.ntxtData, null, tp.uidVersionId, tp.nMinorVersionId, td.nTrackPointId
		FROM bam_TrackPoints td
		JOIN bam_TrackingProfiles tp ON td.nProfileId = tp.nID
		WHERE td.nvcMsgType IS NULL AND td.uidPortId = @uidPortId AND td.nDirection = @nDirection
	END
	else
	BEGIN
		SELECT td.ntxtData, null, tp.uidVersionId, tp.nMinorVersionId, td.nTrackPointId
		FROM bam_TrackPoints td
		JOIN bam_TrackingProfiles tp ON td.nProfileId = tp.nID
		WHERE td.nvcMsgType IS NULL AND td.uidPortId = @uidPortId AND td.nDirection = @nDirection
	END
END 
GO

GRANT EXECUTE ON [dbo].[bam_ReadTrackingProfileByMessageType] TO BTS_HOST_USERS
GO


CREATE PROCEDURE [dbo].[bam_ReadTrackingProfileBySchemaStrongName]
@nvcSchemaName nvarchar(513),
@nvcPortName nvarchar(256),
@nDirection int
AS

declare @uidPortId uniqueidentifier,
	@nvcMessageType nvarchar(2048),
	@nRetCode int

set @nRetCode = 0
/******
nRetCode = 0 means success
nRetCode = 1 means an invalid schema name was passed in
nRetCode = 2 means an invalid port name was passed in
nRetCode = 3 means no port name was passed in (it is required)
**********/

IF (@nvcSchemaName IS NOT NULL)
BEGIN
	--there could be versioning, but the docspec name, msgtype pairing shouldn't change with versioning
	SELECT TOP 1 @nvcMessageType = msgtype FROM bt_DocumentSpec WHERE docspec_name = @nvcSchemaName
	if (@@ROWCOUNT = 0)
		set @nRetCode = 1
END


if (@nvcPortName IS NOT NULL)
BEGIN
	IF (@nDirection = 0)
	BEGIN
		SELECT @uidPortId = uidGUID FROM bts_receiveport WHERE nvcName = @nvcPortName
		if (@@ROWCOUNT = 0)
		BEGIN
			SELECT @uidPortId = uidGUID FROM bts_sendport WHERE nvcName = @nvcPortName AND bTwoWay = 1
		END
	END
	ELSE
	BEGIN
		SELECT @uidPortId = uidGUID FROM bts_sendport WHERE nvcName = @nvcPortName
		IF (@@ROWCOUNT = 0)
		BEGIN
			SELECT @uidPortId = uidGUID FROM bts_receiveport WHERE nvcName = @nvcPortName AND bTwoWay = 1
		END
	END
	
	if (@uidPortId IS NULL)
		set @nRetCode = 2
END
else
	set @nRetCode = 3

if (@nRetCode = 0)
BEGIN

	if (@nvcMessageType IS NOT NULL)
	BEGIN
		SELECT td.ntxtData, null, tp.uidVersionId, tp.nMinorVersionId, td.nTrackPointId
		FROM bam_TrackPoints td
		JOIN bam_TrackingProfiles tp ON td.nProfileId = tp.nID
		WHERE td.nvcMsgType = @nvcMessageType AND td.uidPortId = @uidPortId AND td.nDirection = @nDirection

		UNION ALL

		SELECT td.ntxtData, null, tp.uidVersionId, tp.nMinorVersionId, td.nTrackPointId
		FROM bam_TrackPoints td
		JOIN bam_TrackingProfiles tp ON td.nProfileId = tp.nID
		WHERE td.nvcMsgType IS NULL AND td.uidPortId = @uidPortId AND td.nDirection = @nDirection
	END
	else
	BEGIN
		SELECT td.ntxtData, null, tp.uidVersionId, tp.nMinorVersionId, td.nTrackPointId
		FROM bam_TrackPoints td
		JOIN bam_TrackingProfiles tp ON td.nProfileId = tp.nID
		WHERE td.nvcMsgType IS NULL AND td.uidPortId = @uidPortId AND td.nDirection = @nDirection
	END
END 
GO

GRANT EXECUTE ON [dbo].[bam_ReadTrackingProfileBySchemaStrongName] TO BTS_HOST_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: bam_InsertActivityOrchestrationRelation
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bam_InsertActivityOrchestrationRelation]
@activityName nvarchar(128),
@serviceId uniqueIdentifier
AS
	INSERT INTO [dbo].[bam_ActivityToOrchestrationMapping]
	(
		activityName,
		serviceId
	)
	VALUES
	(
		@activityName,
		@serviceId
	)
GO

GRANT EXECUTE ON [dbo].[bam_InsertActivityOrchestrationRelation] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: bam_GetOrchestrationsForActivity
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bam_GetOrchestrationsForActivity]
@activityName nvarchar(128)
AS
	SELECT	serviceId
	FROM	[dbo].[bam_ActivityToOrchestrationMapping]
	WHERE	activityName = @activityName
GO

GRANT EXECUTE ON [dbo].[bam_GetOrchestrationsForActivity] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: bam_RemoveActivityOrchestrationRelation
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bam_RemoveActivityOrchestrationRelation]
@activityName nvarchar(128)
AS
	DELETE
	FROM	[dbo].[bam_ActivityToOrchestrationMapping]
	WHERE	activityName = @activityName
GO

GRANT EXECUTE ON [dbo].[bam_RemoveActivityOrchestrationRelation] TO BTS_ADMIN_USERS
GO


--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_EnumerateReferencesRecursive
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_EnumerateReferencesRecursive]
	@moduleid int
AS
BEGIN
	IF EXISTS (SELECT moduleid FROM #Modules WHERE moduleid=@moduleid)
	RETURN

	INSERT #Modules(moduleid) VALUES(@moduleid)

	DECLARE @idlib int
	DECLARE RefCursor CURSOR LOCAL FOR SELECT idlib FROM bts_libreference WHERE idapp=@moduleid

	OPEN RefCursor
	FETCH NEXT FROM RefCursor into @idlib
	WHILE @@FETCH_STATUS<>-1 
	BEGIN
		EXEC trk_EnumerateReferencesRecursive @idlib
		FETCH NEXT FROM RefCursor into @idlib
	END
	CLOSE RefCursor
	DEALLOCATE RefCursor
END
GO

GRANT EXECUTE ON [dbo].[trk_EnumerateReferencesRecursive] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_GetPit
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_GetPit]
AS
BEGIN
	SELECT BamDBServerName, BamDBName FROM adm_Group
END
GO

GRANT EXECUTE ON [dbo].[trk_GetPit] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_GetSchema
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_GetSchema] 
	@ModuleName nvarchar(256),
	@TypeName nvarchar(256)
AS
BEGIN
	DECLARE @@moduleID int
	SELECT @@moduleID=nID FROM bts_assembly WHERE bts_assembly.nvcFullName=@ModuleName	

	CREATE TABLE #Modules (moduleid int)
	EXEC trk_EnumerateReferencesRecursive @@moduleID

	SELECT Top 1 content FROM bt_XMLShare
	JOIN bt_DocumentSpec ON bt_XMLShare.id=bt_DocumentSpec.shareid
	JOIN #Modules ON bt_DocumentSpec.assemblyid=#Modules.moduleid
	WHERE ( (schema_root_clr_fqn=@TypeName) or (schema_root_clr_fqn LIKE @TypeName+'+%'))
END
GO

GRANT EXECUTE ON [dbo].[trk_GetSchema] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_GetServicesPerAssembly
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_GetServicesPerAssembly]
	@ModuleName nvarchar(256)
AS
BEGIN
	DECLARE @@moduleID int
	SELECT @@moduleID=nID FROM bts_assembly WHERE bts_assembly.nvcFullName=@ModuleName	

	SELECT bts_orchestration.nvcFullName FROM bts_orchestration
	WHERE nAssemblyID=@@moduleID

	CREATE TABLE #Modules (moduleid int)
	EXEC trk_EnumerateReferencesRecursive @@moduleID
END
GO

GRANT EXECUTE ON [dbo].[trk_GetServicesPerAssembly] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_GetTrackingDatabase
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_GetTrackingDatabase] 
(
	@ModuleName nvarchar(256)
)
AS
BEGIN
	SELECT TrackingDBServerName,TrackingDBName,TrackAnalysisServerName,TrackAnalysisDBName
	FROM adm_Group 
	JOIN bts_assembly ON bts_assembly.nGroupId=adm_Group.Id
	WHERE nvcFullName=@ModuleName
END
GO

GRANT EXECUTE ON [dbo].[trk_GetTrackingDatabase] TO BTS_ADMIN_USERS
GO

-- Stored procs for TrkFramework\TPCompiler\TPCompiler.cs
--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_RemoveTrackingProfile
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_RemoveTrackingProfile]
	@ModuleName nvarchar(256),
	@Version nvarchar(20)
AS
BEGIN
	-- Remove all Interceptor Configurations
	DELETE from StaticTrackingInfo where exists
	(SELECT * FROM bts_orchestration
		 JOIN bts_assembly 
			ON bts_orchestration.nAssemblyID=bts_assembly.nID
		 WHERE StaticTrackingInfo.uidServiceId=uidGUID
		 AND uidInterceptorId='{58E2AB42-51EB-441D-9C93-8795982336B8}'
		 AND bts_assembly.nvcFullName=@ModuleName AND bts_assembly.nvcVersion=@Version)

	-- Remove the Tracking Profile binary blob
	UPDATE bts_assembly
	SET imgTrackingProfile = NULL
	WHERE nvcFullName=@ModuleName AND nvcVersion=@Version
END
GO

GRANT EXECUTE ON [dbo].[trk_RemoveTrackingProfile] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_UpdateTrackingProfile
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_UpdateTrackingProfile] 
(
	@ModuleName nvarchar(256),
	@imgTrackingProfile image
)
AS
BEGIN
	UPDATE bts_assembly
	SET imgTrackingProfile = @imgTrackingProfile
	WHERE nvcFullName = @ModuleName
END
GO

GRANT EXECUTE ON [dbo].[trk_UpdateTrackingProfile] TO BTS_ADMIN_USERS
GO

-- Stored procs for Controls\MgmtDbConfig.cs
--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_HatGetConfig
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_HatGetConfig]
AS
	set nocount on
	set xact_abort on

	select
		Name,
		TrackingDBServerName, 
		TrackingDBName, 
		TrackAnalysisServerName, 
		TrackAnalysisDBName 
	from
		adm_Group

	set nocount off
GO
GRANT EXEC ON [dbo].[trk_HatGetConfig] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[trk_HatGetConfig] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_HatGetHostList
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_HatGetHostList]
AS
	set nocount on
	set xact_abort on

	select
		Name
	from
		adm_Host

	set nocount off
GO
GRANT EXEC ON [dbo].[trk_HatGetHostList] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[trk_HatGetHostList] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_GetServiceID
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_GetServiceID] 
(
	@ModuleName nvarchar(256),
	@ServiceName nvarchar(256)
)
AS
BEGIN
	SELECT uidGUID
	FROM bts_orchestration o
	INNER JOIN bts_assembly a ON a.nID = o.nAssemblyID
	WHERE a.nvcFullName = @ModuleName 
	AND o.nvcFullName = @ServiceName
END
GO

GRANT EXECUTE ON [dbo].[trk_GetServiceID] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_SetPit
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_SetPit] 
(
	@ServerName nvarchar(80),
	@DatabaseName nvarchar(128)
)
AS
BEGIN
	UPDATE adm_Group
	SET BamDBServerName = @ServerName, BamDBName = @DatabaseName
END
GO

GRANT EXECUTE ON [dbo].[trk_SetPit] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_UpdateTDDS
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_UpdateTDDS] 
(
	@DestinationName nvarchar(256),
	@ConnectionString nvarchar(1024)
)
AS
BEGIN
	UPDATE TDDS_Destinations
	SET ConnectionString = @ConnectionString
	WHERE DestinationName = @DestinationName
END
GO

GRANT EXECUTE ON [dbo].[trk_UpdateTDDS] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: trk_UpdateOtherBackupDatabases
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[trk_UpdateOtherBackupDatabases] 
(
	@DatabaseName nvarchar(128),
	@ServerName nvarchar(80),
	@DefaultDatabaseName nvarchar(128)
)
AS
BEGIN
	UPDATE adm_OtherBackupDatabases
	SET DatabaseName = @DatabaseName,
	    ServerName = @ServerName,
	    BTSServerName = @ServerName
	WHERE DefaultDatabaseName = @DefaultDatabaseName
END
GO

GRANT EXECUTE ON [dbo].[trk_UpdateOtherBackupDatabases] TO BTS_ADMIN_USERS
GO
