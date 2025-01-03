--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  
------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_fnGetTrackingDataKey]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[bts_fnGetTrackingDataKey]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_InsertTrackingData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_InsertTrackingData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_GetTrackedMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_GetTrackedMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_GetTrackedMessageParts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_GetTrackedMessageParts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_GetTrackedMessageFragments]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_GetTrackedMessageFragments]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_PurgeTrackingSpool]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_PurgeTrackingSpool]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[adm_TrackedMessage_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[adm_TrackedMessage_Load]
GO

/**********************************
*
* Sprocs for old MessageBox OM to load tracked messages
*
***********************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_ReadArchivedMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_ReadArchivedMessages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_ReadArchivedMessageParts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_ReadArchivedMessageParts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MBOM_ReadArchivedPartFragment]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MBOM_ReadArchivedPartFragment]
GO

/**********************************
* Operations OM spros for tracked msgs
*
***********************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadTrackedMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadTrackedMessages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadTrackedMessageContext]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadTrackedMessageContext]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadTrackedPart]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadTrackedPart]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadTrackedPartByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadTrackedPartByID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadTrackedParts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadTrackedParts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadTrackedPartNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadTrackedPartNames]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadTrackedPartFragment]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_LoadTrackedPartFragment]
GO

CREATE FUNCTION [dbo].[bts_fnGetTrackingDataKey] (@destID tinyint, @partID tinyint)
RETURNS tinyint
AS
BEGIN

	declare @key tinyint
	set @key = (@destID * 10) + @partID

	return @key
END
GO


CREATE PROCEDURE [dbo].[bts_InsertTrackingData]
@uidServiceID	uniqueidentifier,
@uidInstanceID	uniqueidentifier,
@strServerName	nvarchar(256),
@nSource		int,
@uidAgentSrvID  uniqueidentifier,
@uidServiceClassID uniqueidentifier,
@nvcDBServerName nvarchar(256),
@imgData		image,
@uidInterceptorID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on


declare @destID tinyint, @partID tinyint, @StreamID uniqueidentifier, @key tinyint

if ( @uidInterceptorID = '{58E2AB42-51EB-441D-9C93-8795982336B8}' ) OR -- XLang/s Interceptor, BES, DES, MES
   ( @uidInterceptorID = '{F3179EDA-0DA5-4F5F-818E-D231C85A52A9}' ) OR -- Messaging Intercptor
   ( @uidInterceptorID = '{1A6C57F0-3826-4254-9A91-9813A4CF2FCE}' )    -- OES
	set @destID = 0
else
	set @destID = 1


if( @uidInstanceID is null )
	set @StreamID = newid()
else
	set @StreamID = @uidInstanceID

declare @NumPartitions tinyint

-- This select is needed to start the transaction before the call to sp_getapplock
SELECT TOP 1 @NumPartitions = [NumPartitions] FROM [dbo].[TrackingDataPartitions]

-- Ignore the result from the select and always use 4
SET @NumPartitions = 4

set @partID = cast(cast(@StreamID as binary(4)) as tinyint) % @NumPartitions 
set @key =  [dbo].[bts_fnGetTrackingDataKey](@destID, @partID)

if (@strServerName IS NULL)
	set @strServerName = CAST(SERVERPROPERTY('servername') as nvarchar(256))

declare @tableName nvarchar(128)
set @tableName = N'[dbo].[TrackingData_' + CAST(@destID AS nchar(1)) + N'_' + CAST(@partID as nchar(1)) + N']'

declare @retVal int
exec  @retVal = sp_getapplock @tableName, 'Shared', 'Transaction'
IF (@retVal < 0 ) -- Lock not granted
BEGIN
	DECLARE @errMessage NVARCHAR(128)
	SET @errMessage = N'Could not acquire the partition table lock. Error = ' + CAST(@retVal AS NVARCHAR(5))
	RAISERROR(@errMessage, 16, 1)
	return
END

declare @insertStatement nvarchar(1000)
set @insertStatement = N'INSERT INTO ' + @tableName + N'(partKey, uidServiceID, StreamID, dtTimeStamp, strDBServer, strDBName, strServerName, nSource, uidAgentSrvID, uidServiceClassID, imgBlob, FormatID, DestinationID, PartitionID) ' +
                       N'VALUES (@key1, @uidServiceID1, @StreamID1, @dtTimeStamp1, @nvcDBServerName1, @strDBName1, @strServerName1, @nSource1, @uidAgentSrvID1, @uidServiceClassID1, @imgData1, @uidInterceptorID1, @destID1, @partID1)'

set @uidServiceID = ISNULL (@uidServiceID, N'{00000000-0000-0000-0000-000000000000}')
set @uidAgentSrvID = ISNULL (@uidAgentSrvID, N'{00000000-0000-0000-0000-000000000000}')
set @uidServiceClassID = ISNULL (@uidServiceClassID, N'{00000000-0000-0000-0000-000000000000}')
set @strServerName = ISNULL (@strServerName, HOST_NAME())
declare @currentTime datetime, @dbName nvarchar(128)
set @currentTime = GETUTCDATE()
set @dbName = DB_NAME()

exec sp_executesql @insertStatement,
    N'@key1 tinyint, @uidServiceID1 uniqueidentifier, @StreamID1 uniqueidentifier, @dtTimeStamp1 datetime, @nvcDBServerName1 nvarchar(256), 
      @strDBName1 nvarchar(256), @strServerName1 nvarchar(256), @nSource1 int, @uidAgentSrvID1 uniqueidentifier, 
      @uidServiceClassID1 uniqueidentifier, @imgData1 image, @uidInterceptorID1 uniqueidentifier, @destID1 tinyint, @partID1 tinyint',
    @key1 = @key,
    @uidServiceID1 = @uidServiceID,
    @StreamID1 = @StreamID,
    @dtTimeStamp1 = @currentTime,
    @nvcDBServerName1 = @nvcDBServerName,
    @strDBName1 = @dbName,
    @strServerName1 = @strServerName,
    @nSource1 = @nSource,
    @uidAgentSrvID1 = @uidAgentSrvID,
    @uidServiceClassID1 = @uidServiceClassID,
    @imgData1 = @imgData,
    @uidInterceptorID1 = @uidInterceptorID,
    @destID1 = @destID,
    @partID1 = @partID

	
GO
GRANT EXEC ON [dbo].[bts_InsertTrackingData] TO BTS_HOST_USERS
GO

CREATE PROCEDURE [dbo].[bts_GetTrackedMessage]
@uidMsgID uniqueidentifier
AS

set nocount on
set transaction isolation level read committed

	SELECT TOP 1
		dtTimeStamp,
		nNumParts,
		uidBodyPartID,
		imgContext
	FROM
		btsv_Tracking_Spool
	WHERE
		uidMsgID = @uidMsgID
GO
GRANT EXEC ON [dbo].[bts_GetTrackedMessage] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_GetTrackedMessageParts]
@uidMsgID uniqueidentifier
AS

set nocount on
set transaction isolation level read committed

	SELECT
		uidPartID,
		nvcPartName,
		nNumFragments,
		imgPart,
		imgPropBag
	FROM
		btsv_Tracking_Parts
	WHERE
		uidMessageID = @uidMsgID
GO
GRANT EXEC ON [dbo].[bts_GetTrackedMessageParts] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_GetTrackedMessageFragments]
@uidMsgPartID uniqueidentifier
AS

set nocount on
set transaction isolation level read committed

	SELECT
		nFragmentNumber,
		imgFrag
	FROM
		btsv_Tracking_Fragments
	WHERE
		uidPartID = @uidMsgPartID
	ORDER BY 
	    nFragmentNumber
GO
GRANT EXEC ON [dbo].[bts_GetTrackedMessageFragments] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[adm_TrackedMessage_Load]
@uidMsgID uniqueidentifier
AS
	set nocount on
	set transaction isolation level read committed
	declare @ErrCode as int
	set @ErrCode = 0
	SELECT TOP 1
		dtTimeStamp, nNumParts
	FROM
		btsv_Tracking_Spool
	WHERE
		uidMsgID = @uidMsgID
	if ( @@ROWCOUNT = 0)
		return 0xC0C02537	-- CIS_E_ADMIN_CORE_FAILED_INSTANCE_NOT_FOUND
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_TrackedMessage_Load] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[bts_PurgeTrackingSpool]
AS

set nocount on
set transaction isolation level read committed

	-- Determine the name of the oldest inactive TrackingSpool
	DECLARE @nPurgedSpoolId int
	DECLARE @nvcTableQualiferToPurge sysname

	SELECT TOP 1 @nPurgedSpoolId = nId, @nvcTableQualiferToPurge = nvcTableQualifier
	FROM TrackingSpoolInfo
	WHERE nActive = 0
	ORDER BY dtDateModified ASC
	
	-- Truncate this oldest TrackingSpool table
	DECLARE @nvcTruncateSpoolCmd nvarchar(1024)	
	DECLARE @nvcTruncatePartCmd nvarchar(1024)	
	DECLARE @nvcTruncateFragmentCmd nvarchar(1024)	
	
	SET @nvcTruncateSpoolCmd    = N'TRUNCATE TABLE Tracking_Spool' + @nvcTableQualiferToPurge
	SET @nvcTruncatePartCmd     = N'TRUNCATE TABLE Tracking_Parts' + @nvcTableQualiferToPurge
	SET @nvcTruncateFragmentCmd = N'TRUNCATE TABLE Tracking_Fragments' + @nvcTableQualiferToPurge
	
	EXEC(@nvcTruncateSpoolCmd)
	EXEC(@nvcTruncatePartCmd)
	EXEC(@nvcTruncateFragmentCmd)
	
	-- Transactionally perform the followings:
	-- 1) Mark the current active TrackingSpool as inactive
	-- 2) Mark this purged TrackingSpool as active
	
	BEGIN TRANSACTION
	
		DECLARE @dtTimeStamp datetime
		SET @dtTimeStamp = GETUTCDATE()
	
		-- Step 1
		UPDATE TrackingSpoolInfo
		SET nActive = 0, dtDateModified = @dtTimeStamp
		WHERE nActive = 1
		
		-- Step 2
		UPDATE TrackingSpoolInfo
		SET nActive = 1, dtDateModified = @dtTimeStamp
		WHERE nId = @nPurgedSpoolId
	
	COMMIT TRANSACTION

GO

/**********************************
* Ops OM sprocs
*
********************************/

--For the TrackedMessages implementation

CREATE PROCEDURE [dbo].[ops_LoadTrackedMessages]
@uidMessageID uniqueidentifier,
@nSpoolID int
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on

declare @tnActiveTable int

BEGIN TRANSACTION

--once we start an enumeration over a log table, we cant allow the log table to be switched out underneath us

IF (@nSpoolID = 1)
BEGIN
	set @tnActiveTable = 2
END
ELSE
BEGIN
	set @tnActiveTable = 1
END

-- Could compress this by using ops_AppendToQuery sproc
if (@tnActiveTable = 1)
BEGIN
	IF (@uidMessageID <> N'{00000000-0000-0000-0000-000000000000}')
	BEGIN
		--SELECT CAST(2 as int), uidMsgID, imgContext, dtTimeStamp, CAST(UserName as nvarchar(128)), nNumParts, uidBodyPartID
		-- Context is returned as null
		SELECT TOP 1 CAST(2 as int), uidMsgID, NULL, nNumParts, uidBodyPartID
		FROM Tracking_Spool2
		WHERE uidMsgID = @uidMessageID
	END
	ELSE
	BEGIN
		SELECT CAST(2 as int), uidMsgID, NULL, nNumParts, uidBodyPartID
		FROM Tracking_Spool2			
		ORDER BY dtTimeStamp, uidMsgID
	END	
END  
else 
BEGIN
	IF (@uidMessageID <> N'{00000000-0000-0000-0000-000000000000}')
	BEGIN
		SELECT TOP 1 CAST(1 as int), uidMsgID, NULL, nNumParts, uidBodyPartID
		FROM Tracking_Spool1
		WHERE uidMsgID = @uidMessageID
	END
	ELSE
	BEGIN
		SELECT CAST(1 as int), uidMsgID, NULL, nNumParts, uidBodyPartID
		FROM Tracking_Spool1			
		ORDER BY dtTimeStamp, uidMsgID
	END
END 

COMMIT TRANSACTION

set ROWCOUNT 0

GO
GRANT EXEC ON [dbo].[ops_LoadTrackedMessages] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadTrackedMessages] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_LoadTrackedMessageContext]
@uidMessageID uniqueidentifier,
@nSpoolID int
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on

declare @tnActiveTable int

BEGIN TRANSACTION

--once we start an enumeration over a log table, we cant allow the log table to be switched out underneath us

IF (@nSpoolID = 1)
BEGIN
	set @tnActiveTable = 2
END
ELSE
BEGIN
	set @tnActiveTable = 1
END

if (@tnActiveTable = 1)
BEGIN
	IF (@uidMessageID <> N'{00000000-0000-0000-0000-000000000000}')
	BEGIN		
		SELECT TOP 1 imgContext 
		FROM Tracking_Spool2
		WHERE uidMsgID = @uidMessageID
	END
	ELSE
	BEGIN
		SELECT imgContext 
		FROM Tracking_Spool2			
		ORDER BY dtTimeStamp, uidMsgID
	END	
END  
else 
BEGIN
	IF (@uidMessageID <> N'{00000000-0000-0000-0000-000000000000}')
	BEGIN
		SELECT TOP 1 imgContext 
		FROM Tracking_Spool1
		WHERE uidMsgID = @uidMessageID
	END
	ELSE
	BEGIN
		SELECT imgContext 
		FROM Tracking_Spool1			
		ORDER BY dtTimeStamp, uidMsgID
	END
END 

COMMIT TRANSACTION

set ROWCOUNT 0

GO
GRANT EXEC ON [dbo].[ops_LoadTrackedMessageContext] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[ops_LoadTrackedPart]
@uidMessageID uniqueidentifier,
@nvcPartName nvarchar(256),
@nSpoolID int
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on

if (@nSpoolID = 1)
BEGIN
	SELECT TOP 1 nvcPartName, uidPartID, nNumFragments, imgPart, imgPropBag
	FROM Tracking_Parts1
	WHERE uidMessageID = @uidMessageID AND
	      nvcPartName = @nvcPartName
END
else
BEGIN
	SELECT TOP 1 nvcPartName, uidPartID, nNumFragments, imgPart, imgPropBag
	FROM Tracking_Parts2
	WHERE uidMessageID = @uidMessageID AND
	      nvcPartName = @nvcPartName
END

GO
GRANT EXEC ON [dbo].[ops_LoadTrackedPart] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[ops_LoadTrackedPartByID]
@uidMessageID uniqueidentifier,
@uidPartID uniqueidentifier,
@nSpoolID int
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on

if (@nSpoolID = 1)
BEGIN
	SELECT TOP 1 nvcPartName, uidPartID, nNumFragments, imgPart, imgPropBag, uidOldPartID
	FROM Tracking_Parts1
	WHERE uidMessageID = @uidMessageID AND
	      uidOldPartID = @uidPartID
END
else
BEGIN
	SELECT TOP 1 nvcPartName, uidPartID, nNumFragments, imgPart, imgPropBag, uidOldPartID
	FROM Tracking_Parts2
	WHERE uidMessageID = @uidMessageID AND
	      uidOldPartID = @uidPartID
END

GO
GRANT EXEC ON [dbo].[ops_LoadTrackedPartByID] TO BTS_ADMIN_USERS
GO


--This procedure retrieves the part information for a given tracked message.
CREATE PROCEDURE [dbo].[ops_LoadTrackedParts]
@uidMessageID uniqueidentifier,
@nSpoolID int
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on

if (@nSpoolID = 1)
BEGIN
	SELECT nvcPartName, uidPartID, nNumFragments, imgPart, imgPropBag, uidOldPartID
	FROM Tracking_Parts1
	WHERE uidMessageID = @uidMessageID
	      
END
else
BEGIN
	SELECT nvcPartName, uidPartID, nNumFragments, imgPart, imgPropBag, uidOldPartID
	FROM Tracking_Parts2
	WHERE uidMessageID = @uidMessageID
END

GO
GRANT EXEC ON [dbo].[ops_LoadTrackedParts] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[ops_LoadTrackedPartNames]
@uidMessageID uniqueidentifier,
@nSpoolID int
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on

if (@nSpoolID = 1)
BEGIN
	SELECT nvcPartName
	FROM Tracking_Parts1
	WHERE uidMessageID = @uidMessageID
	      
END
else
BEGIN
	SELECT nvcPartName
	FROM Tracking_Parts2
	WHERE uidMessageID = @uidMessageID
END

GO
GRANT EXEC ON [dbo].[ops_LoadTrackedPartNames] TO BTS_ADMIN_USERS
GO


CREATE PROCEDURE [dbo].[ops_LoadTrackedPartFragment]
@uidPartID uniqueidentifier,
@nFragmentNumber int,
@nSpoolID int
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on

--the db uses 0 based fragments, but the callers will use one based fragment indexes
--so we will have to compensate


if (@nSpoolID = 1)
BEGIN
	if (@nFragmentNumber = 1)
		SELECT TOP 1 imgPart FROM Tracking_Parts1 WHERE uidPartID = @uidPartID
	else
		SELECT TOP 1 imgFrag FROM Tracking_Fragments1 WHERE uidPartID = @uidPartID AND nFragmentNumber = @nFragmentNumber - 1
END
else
BEGIN	
	if (@nFragmentNumber = 1)
		SELECT TOP 1 imgPart FROM Tracking_Parts2 WHERE uidPartID = @uidPartID
	else
		SELECT TOP 1 imgFrag FROM Tracking_Fragments2 WHERE uidPartID = @uidPartID AND nFragmentNumber = @nFragmentNumber - 1
END

GO
GRANT EXEC ON [dbo].[ops_LoadTrackedPartFragment] TO BTS_ADMIN_USERS
GO

/* Old MBOM sprocs */
CREATE PROCEDURE [dbo].[MBOM_ReadArchivedMessages]
@nSpoolID int,
@dtFrom datetime,
@dtUntil datetime,
@nMaxMatches int,
@uidLastMessageID uniqueidentifier
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on

declare @tnActiveTable int


if (@dtFrom IS NULL)
	set @dtFrom = 0
if (@dtUntil IS NULL)
	set @dtUntil = GetUTCDate()

BEGIN TRANSACTION

--once we start an enumeration over a log table, we cant allow the log table to be switched out underneath us
if (@nSpoolID != -1)
BEGIN
	if (@nSpoolID = 1)
		set @tnActiveTable = 2
	else
		set @tnActiveTable = 1
END
--lock the log table to make sure it does not switch underneath us
else if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActiveRefCountLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	SELECT TOP 1 @tnActiveTable = CAST(nvcTableQualifier as tinyint) FROM TrackingSpoolInfo WITH (ROWLOCK REPEATABLEREAD) WHERE nActive = 1 OPTION (KEEPFIXED PLAN)	
END
else
BEGIN
	set @tnActiveTable = 2 --This will make us go to table 1 which is what I assume people will archive to
END

if (@tnActiveTable = 1)
BEGIN
	IF (@uidLastMessageID IS NULL)
	BEGIN
		
		if (@nMaxMatches > 0)
			set ROWCOUNT @nMaxMatches

		SELECT CAST(2 as int), uidMsgID, imgContext, dtTimeStamp, CAST(UserName as nvarchar(128)), nNumParts, uidBodyPartID
		FROM Tracking_Spool2
		WHERE dtTimeStamp >= @dtFrom AND
	    	  dtTimeStamp <= @dtUntil
		ORDER BY dtTimeStamp, uidMsgID
	END
	ELSE
	BEGIN
		SELECT CAST(2 as int), uidMsgID, imgContext, dtTimeStamp, CAST(UserName as nvarchar(128)), nNumParts, uidBodyPartID
		FROM Tracking_Spool2
		WHERE dtTimeStamp = @dtFrom AND
	    	  	uidMsgID > @uidLastMessageID
		ORDER BY dtTimeStamp, uidMsgID
	END
END  
else 
BEGIN
	IF (@uidLastMessageID IS NULL)
	BEGIN

		if (@nMaxMatches > 0)
			set ROWCOUNT @nMaxMatches

		SELECT CAST(1 as int), uidMsgID, imgContext, dtTimeStamp, CAST(UserName as nvarchar(128)), nNumParts, uidBodyPartID
		FROM Tracking_Spool1
		WHERE dtTimeStamp >= @dtFrom AND
	    	  dtTimeStamp <= @dtUntil
		ORDER BY dtTimeStamp, uidMsgID
	END
	ELSE
	BEGIN
		SELECT CAST(1 as int), uidMsgID, imgContext, dtTimeStamp, CAST(UserName as nvarchar(128)), nNumParts, uidBodyPartID
		FROM Tracking_Spool1
		WHERE dtTimeStamp = @dtFrom AND
	    	  	uidMsgID > @uidLastMessageID
		ORDER BY dtTimeStamp, uidMsgID
	END
END 

COMMIT TRANSACTION

set ROWCOUNT 0
GO

GRANT EXECUTE ON MBOM_ReadArchivedMessages TO BTS_ADMIN_USERS
GO

--This procedure will retrieve the part information for a given message
CREATE PROCEDURE [dbo].[MBOM_ReadArchivedMessageParts]
@nSpoolID int,
@uidMessageID uniqueidentifier
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on


if (@nSpoolID = 1)
BEGIN
	SELECT nvcPartName, uidPartID, uidOldPartID, nNumFragments, imgPart, imgPropBag
	FROM Tracking_Parts1
	WHERE uidMessageID = @uidMessageID
END
else
BEGIN
	SELECT nvcPartName, uidPartID, uidOldPartID, nNumFragments, imgPart, imgPropBag
	FROM Tracking_Parts2
	WHERE uidMessageID = @uidMessageID
END

GO
GRANT EXECUTE ON MBOM_ReadArchivedMessageParts TO BTS_ADMIN_USERS
GO

--This procedure will retrieve the part information for a given message
CREATE PROCEDURE [dbo].[MBOM_ReadArchivedPartFragment]
@nSpoolID int,
@uidPartID uniqueidentifier,
@nFragmentNumber int
AS

set transaction isolation level read committed
set deadlock_priority low
set nocount on


--the db uses 0 based fragments, but the callers will use one based fragment indexes
--so we will have to compensate


if (@nSpoolID = 1)
BEGIN
	if (@nFragmentNumber = 1)
		SELECT TOP 1 imgPart FROM Tracking_Parts1 WHERE uidPartID = @uidPartID
	else
		SELECT TOP 1 imgFrag FROM Tracking_Fragments1 WHERE uidPartID = @uidPartID AND nFragmentNumber = @nFragmentNumber - 1
END
else
BEGIN	
	if (@nFragmentNumber = 1)
		SELECT TOP 1 imgPart FROM Tracking_Parts2 WHERE uidPartID = @uidPartID
	else
		SELECT TOP 1 imgFrag FROM Tracking_Fragments2 WHERE uidPartID = @uidPartID AND nFragmentNumber = @nFragmentNumber - 1
END

GO
GRANT EXECUTE ON MBOM_ReadArchivedPartFragment TO BTS_ADMIN_USERS
GO
