--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

if (OBJECT_ID('[dbo].[TDDS_DeleteFromTrackingAny]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_DeleteFromTrackingAny]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_DeleteFromTrackingAny]
GO

if (OBJECT_ID('[dbo].[TDDS_DeleteFromTracking]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_DeleteFromTracking]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_DeleteFromTracking]
GO

if (OBJECT_ID('[dbo].[TDDS_GetTrackingData]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetTrackingData]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetTrackingData]
GO

if (OBJECT_ID('[dbo].[TDDS_InsertTrackingData]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_InsertTrackingData]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_InsertTrackingData]
GO

if (OBJECT_ID('[dbo].[TDDS_GetTrackingRecord]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetTrackingRecord]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetTrackingRecord]
GO

if (OBJECT_ID('[dbo].[TDDS_GetInitSeqNum]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetInitSeqNum]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetInitSeqNum]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TDDS_fnGetTrackingDataKey]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[TDDS_fnGetTrackingDataKey]
GO

if (OBJECT_ID('[dbo].[TDDS_GetNumTrackingPartitions]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetNumTrackingPartitions]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetNumTrackingPartitions]
GO
if (OBJECT_ID('[dbo].[TDDS_RegisterTDDSAccess]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_RegisterTDDSAccess]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_RegisterTDDSAccess]
GO
if (OBJECT_ID('[dbo].[TDDS_RestrictTDDSAccess]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_RestrictTDDSAccess]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_RestrictTDDSAccess]
GO
if (OBJECT_ID('[dbo].[TDDS_ChangeTrackingPartitioning]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_ChangeTrackingPartitioning]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_ChangeTrackingPartitioning]
GO

if not exists (select * from sysusers where name = N'BAM_EVENT_READER' and issqlrole = 1)
EXEC sp_addrole N'BAM_EVENT_READER'
GO

CREATE FUNCTION [dbo].[TDDS_fnGetTrackingDataKey] (@destID tinyint, @partID tinyint)
RETURNS tinyint
AS
BEGIN

	declare @key tinyint
	set @key = (@destID * 10) + @partID

	return @key
END
GO


CREATE PROCEDURE [dbo].[TDDS_DeleteFromTracking]
@DestinationID		tinyint,
@PartitionID		tinyint,
@nLastSeqNum		bigint
AS

declare @key tinyint
set @key =  [dbo].[TDDS_fnGetTrackingDataKey](@DestinationID, @PartitionID)

declare @tableName nvarchar(128)
set @tableName = N'[dbo].[TrackingData_' + CAST(@DestinationID AS nchar(1)) + N'_' + CAST(@PartitionID as nchar(1)) + N']'

declare @tsql nvarchar(2000)
set @tsql = N'DELETE
	FROM ' + @tableName + N' WITH (ROWLOCK)
	FROM ' + @tableName + N' td1 WITH (ROWLOCK), 
		(SELECT TOP 100 SeqNum
		FROM ' + @tableName + N' 
		WHERE [partKey] = @key1 AND [SeqNum] <= @seqNum1) td2
	WHERE [partKey] = @key1 AND td1.[SeqNum] = td2.[SeqNum]

	SET @WorkLeft1 = @@ROWCOUNT'

DECLARE @WorkLeft int
SET @WorkLeft = 100
WHILE (@WorkLeft >= 100)
BEGIN
	exec sp_executesql @tsql,
		N'@key1 tinyint, @seqNum1 bigint, @WorkLeft1 int OUTPUT',
		@key1 = @key,
		@seqNum1 = @nLastSeqNum,
		@WorkLeft1 = @WorkLeft OUTPUT
END

GO


GRANT EXECUTE ON [dbo].[TDDS_DeleteFromTracking] TO BAM_EVENT_READER
GO

CREATE PROCEDURE [dbo].[TDDS_GetTrackingData]
@DestinationID      tinyint,
@PartitionID		tinyint,
@LastReadSeqNum		bigint,
@nMaxSeqNum         bigint   output
AS

declare @key tinyint
set @key =  [dbo].[TDDS_fnGetTrackingDataKey](@DestinationID, @PartitionID)

IF (@DestinationID = 0)
BEGIN
    SELECT TOP 30 [SeqNum], [uidServiceID], [StreamID], [dtTimeStamp], [strDBServer], [strDBName], [strServerName], [nSource], [uidAgentSrvID], [uidServiceClassID], [imgBlob], [FormatID], [DestinationID], [PartitionID] 
    FROM [dbo].[TrackingData]
    WHERE partKey = @key AND SeqNum > @LastReadSeqNum
    ORDER BY [SeqNum] ASC  -- Don't change this. It is very important for the TDDS Writer that the result set is sorted by [SeqNum].
END
ELSE
BEGIN
    SELECT TOP 100 [SeqNum], [uidServiceID], [StreamID], [dtTimeStamp], [strDBServer], [strDBName], [strServerName], [nSource], [uidAgentSrvID], [uidServiceClassID], [imgBlob], [FormatID], [DestinationID], [PartitionID] 
    FROM [dbo].[TrackingData]
    WHERE partKey = @key AND SeqNum > @LastReadSeqNum
    ORDER BY [SeqNum] ASC  -- Don't change this. It is very important for the TDDS Writer that the result set is sorted by [SeqNum].
END

declare @trackingTableName nvarchar(128)
set @trackingTableName = N'TrackingData_' + CAST(@DestinationID as nchar(1)) + N'_' + CAST(@PartitionID as nchar(1))
select @nMaxSeqNum= ident_current(@trackingTableName)

GO

GRANT EXECUTE ON [dbo].[TDDS_GetTrackingData] TO BAM_EVENT_READER
GO



CREATE PROCEDURE [dbo].[TDDS_GetTrackingRecord]
@destinationId	tinyint,
@partitionId	tinyint,
@nSeqNum		bigint
AS

SET DEADLOCK_PRIORITY LOW

declare @key tinyint
set @key =  [dbo].[TDDS_fnGetTrackingDataKey](@destinationId, @partitionId)

declare @tableName nvarchar(128)
set @tableName = N'[dbo].[TrackingData_' + CAST(@destinationId AS nchar(1)) + N'_' + CAST(@partitionId as nchar(1)) + N']'

declare @retVal int
exec  @retVal = sp_getapplock @tableName, 'Exclusive', 'Session'
IF (@retVal < 0 ) -- Lock not granted
BEGIN
	RAISERROR( N'Could not acquire the partition table lock.', 16, 1)
	return
END

SELECT [SeqNum], [uidServiceID], [StreamID], [dtTimeStamp], [strDBServer], [strDBName], [strServerName], [nSource], [uidAgentSrvID], [uidServiceClassID], [imgBlob], [FormatID], [DestinationID], [PartitionID] 
FROM [dbo].[TrackingData]
WHERE partKey = @key AND [SeqNum] = @nSeqNum

exec sp_releaseapplock @tableName, 'Session'

GO

GRANT EXECUTE ON [dbo].[TDDS_GetTrackingRecord] TO BAM_EVENT_READER
GO


CREATE PROCEDURE [dbo].[TDDS_InsertTrackingData]
@StreamID uniqueidentifier,
@FormatID uniqueidentifier,
@imgBlob  image

AS

declare @uidServiceID	uniqueidentifier
declare @uidAgentSrvID  uniqueidentifier
declare @uidServiceClassID uniqueidentifier
declare @currentTime datetime
declare @dbName nvarchar(128)

SET @uidServiceID = NEWID()
SET @uidAgentSrvID = NEWID()
SET @uidServiceClassID = NEWID()
SET @currentTime = GETUTCDATE()
SET @dbName = DB_NAME()

declare @destID tinyint
if( @FormatID = '{58E2AB42-51EB-441D-9C93-8795982336B8}' )
	set @destID = 0
else
	set @destID = 1

declare @NumPartitions tinyint
SET @NumPartitions = 4

declare @partID tinyint
set @partID = cast(cast(@StreamID as binary(4)) as tinyint) % @NumPartitions

declare @key tinyint
set @key =  [dbo].[TDDS_fnGetTrackingDataKey](@destID, @partID)

declare @tableName nvarchar(128)
set @tableName = N'[dbo].[TrackingData_' + CAST(@destID AS nchar(1)) + N'_' + CAST(@partID as nchar(1)) + N']'

declare @insertStatement nvarchar(1000)
set @insertStatement = N'INSERT INTO ' + @tableName + N'(partKey, uidServiceID, StreamID, dtTimeStamp, strDBServer, strDBName, strServerName, nSource, uidAgentSrvID, uidServiceClassID, imgBlob, FormatID, DestinationID, PartitionID) ' +
                       N'VALUES (@key1, @uidServiceID1, @StreamID1, @dtTimeStamp1, @nvcDBServerName1, @strDBName1, @strServerName1, @nSource1, @uidAgentSrvID1, @uidServiceClassID1, @imgData1, @uidInterceptorID1, @destID1, @partID1)'

declare @retVal int
exec  @retVal = sp_getapplock @tableName, 'Shared', 'Transaction'
IF (@retVal < 0 ) -- Lock not granted
BEGIN
	RAISERROR(N'Could not acquire the partition table lock.', 16, 1)
	return
END

exec sp_executesql @insertStatement,
    N'@key1 tinyint, @uidServiceID1 uniqueidentifier, @StreamID1 uniqueidentifier, @dtTimeStamp1 datetime, @nvcDBServerName1 nvarchar(256), 
      @strDBName1 nvarchar(256), @strServerName1 nvarchar(256), @nSource1 int, @uidAgentSrvID1 uniqueidentifier, 
      @uidServiceClassID1 uniqueidentifier, @imgData1 image, @uidInterceptorID1 uniqueidentifier, @destID1 tinyint, @partID1 tinyint',
    @key1 = @key,
    @uidServiceID1 = @uidServiceID,
    @StreamID1 = @StreamID,
    @dtTimeStamp1 = @currentTime,
    @nvcDBServerName1 = @@SERVERNAME,
    @strDBName1 = @dbName,
    @strServerName1 = @@SERVERNAME,
    @nSource1 = 1,
    @uidAgentSrvID1 = @uidAgentSrvID,
    @uidServiceClassID1 = @uidAgentSrvID,
    @imgData1 = @imgBlob,
    @uidInterceptorID1 = @FormatID,
    @destID1 = @destID,
    @partID1 = @partID

GO

GRANT EXECUTE ON [dbo].[TDDS_InsertTrackingData] TO BAM_EVENT_READER
GO


CREATE PROCEDURE [dbo].[TDDS_GetInitSeqNum] 
@destinationId 	tinyint,
@partitionId 	tinyint
AS
-- This stored procedure is used to get the last processed seq number assuming there is no leap in the seq number.

DECLARE @minSeqNum BIGINT, @key tinyint
set @key =  [dbo].[TDDS_fnGetTrackingDataKey](@destinationId, @partitionId)

SELECT @minSeqNum = MIN(SeqNum) - 1 
FROM [dbo].[TrackingData]
WHERE partKey = @key

IF @minSeqNum IS NULL 
BEGIN
	declare @trackingTableName nvarchar(128)
	set @trackingTableName = N'TrackingData_' + CAST(@destinationId as nchar(1)) + N'_' + CAST(@partitionId as nchar(1))

	set @minSeqNum = ident_current(@trackingTableName) - 1
END

SELECT @minSeqNum

GO

GRANT EXECUTE ON [dbo].[TDDS_GetInitSeqNum] TO BAM_EVENT_READER
GO


-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[TDDS_GetNumTrackingPartitions]
    @nPartitions tinyint output
AS
    SELECT @nPartitions = [NumPartitions] FROM [dbo].[TrackingDataPartitions]   
GO

GRANT EXECUTE ON [dbo].[TDDS_GetNumTrackingPartitions] TO BAM_EVENT_READER
GO    

-------------------------------------------------------------------------------
-- Procedure:  TDDS_RegisterTDDSAccess
-- Purpose:  called every time a TDDS connection is made to the source database.
-------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[TDDS_RegisterTDDSAccess] 
	@retVal int output
AS
exec @retVal = sp_getapplock N'TDDS_Session_Registration',  N'Shared', N'Session', 0
if @retVal < 0
BEGIN
	declare @localized_string_error60033 as nvarchar(128)
	set @localized_string_error60033 = N'The TDDS service attempted to access the tracking database while partitioning data was being changed.  Make sure that repartitioning of tracking records has completed before running the TDDS service.'
	raiserror (@localized_string_error60033,16,1)
    RETURN 1
END
RETURN 0
GO

GRANT EXECUTE ON [dbo].[TDDS_RegisterTDDSAccess] TO BAM_EVENT_READER
GO    

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
    
CREATE PROCEDURE [dbo].[TDDS_RestrictTDDSAccess] 
	@retVal int output
AS
exec @retVal = sp_getapplock N'TDDS_Session_Registration',  N'Exclusive', N'Transaction', 0
GO

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[TDDS_ChangeTrackingPartitioning]
@NumPartitions tinyint
as
    RETURN 0
GO









