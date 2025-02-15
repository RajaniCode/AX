--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

if (OBJECT_ID('[dbo].[TDDS_UpdateTDDS_StreamStatus]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_UpdateTDDS_StreamStatus]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_UpdateTDDS_StreamStatus]
GO

if (OBJECT_ID('[dbo].[TDDS_InsertTDDS_StreamStatus]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_InsertTDDS_StreamStatus]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_InsertTDDS_StreamStatus]
GO

if (OBJECT_ID('[dbo].[TDDS_RemoveTDDS_StreamStatus]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_RemoveTDDS_StreamStatus]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_RemoveTDDS_StreamStatus]
GO

if (OBJECT_ID('[dbo].[TDDS_InsertFailedTrackingData]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_InsertFailedTrackingData]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_InsertFailedTrackingData]
GO

if (OBJECT_ID('[dbo].[TDDS_GetTDDS_StreamStatus]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetTDDS_StreamStatus]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetTDDS_StreamStatus]
GO

if (OBJECT_ID('[dbo].[TDDS_UpsertTDDS_StreamStatus]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_UpsertTDDS_StreamStatus]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_UpsertTDDS_StreamStatus]
GO

if (OBJECT_ID('[dbo].[TDDS_GetSPNames]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetSPNames]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetSPNames]
GO

if (OBJECT_ID('[dbo].[TDDS_GetColumnInfo]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetColumnInfo]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetColumnInfo]
GO

if (OBJECT_ID('[dbo].[TDDS_Lock]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_Lock]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_Lock]
GO


if (OBJECT_ID('[dbo].[TDDS_BlockTDDS]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_BlockTDDS]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_BlockTDDS]
GO

-- If the TDDS_StreamStatus table is not already upgraded, the stored procs creation will fail so we always
-- rename the table before creating the stored procs and then rename it back to the original name.
if (OBJECT_ID('[dbo].[TDDS_StreamStatus]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_StreamStatus]'), N'IsUserTable') =1)
EXEC sp_rename N'TDDS_StreamStatus', N'TDDS_StreamStatus#TEMP#'
GO

-- Stored procs start here

CREATE PROCEDURE [dbo].[TDDS_InsertFailedTrackingData]
@ErrorMessage	ntext,
@dataImage	image,
@source		nvarchar(256),
@formatID	uniqueidentifier,
@DestinationID	tinyint

AS
	declare @currentTime datetime
	SET @currentTime = GETUTCDATE()

	INSERT INTO TDDS_FailedTrackingData
	( ErrMessage, DataImage, Source, FormatID, dtLogTime, DestinatioNID)
	VALUES
	( @ErrorMessage, @dataImage, @source, @formatID,@currentTime, @DestinationID )
GO

GRANT EXECUTE ON [dbo].[TDDS_InsertFailedTrackingData] TO BAM_EVENT_WRITER
GO

CREATE PROCEDURE [dbo].[TDDS_GetTDDS_StreamStatus]
@serverName		nvarchar(128),
@destinationId	tinyint,
@partitionId	tinyint
 AS
SELECT lastSeqNum, eventIdx
FROM TDDS_StreamStatus
WHERE serverName = @serverName AND destinationId = @destinationId AND partitionId = @partitionId
GO

GRANT EXECUTE ON [dbo].[TDDS_GetTDDS_StreamStatus] TO BAM_EVENT_WRITER
GO

CREATE PROCEDURE [dbo].[TDDS_UpsertTDDS_StreamStatus]
    @serverName     nvarchar(128),
    @destinationId  tinyint,
    @partitionId    tinyint,
    @lastSeqNum		bigint,
    @eventIdx       int = NULL
    
 AS
    
    UPDATE TDDS_StreamStatus
    SET lastSeqNum = @lastSeqNum,
        eventIdx = @eventIdx
    WHERE serverName=@serverName and destinationId = @destinationId and partitionId = @partitionId
    
    IF (@@ROWCOUNT = 0)
    BEGIN
        INSERT TDDS_StreamStatus(serverName, destinationId, partitionId, lastSeqNum, eventIdx) 
        VALUES ( @serverName, @destinationId, @partitionId, @lastSeqNum, @eventIdx )
    END
GO

GRANT EXECUTE ON [dbo].[TDDS_UpsertTDDS_StreamStatus] TO BAM_EVENT_WRITER
GO

-- Find Stored Procedures based on cubeID

CREATE PROCEDURE [dbo].[TDDS_GetSPNames]
 AS
SELECT u.name + '.' + o.name FROM sysobjects o
JOIN sysusers u ON  u.uid = o.uid
WHERE o.type = 'P' 
GO

GRANT EXECUTE ON [dbo].[TDDS_GetSPNames] TO BAM_EVENT_WRITER
GO

CREATE PROCEDURE [dbo].[TDDS_GetColumnInfo]
	@objectName	nvarchar(256)
AS

DECLARE @id as int

SELECT @id=id FROM sysobjects 
WHERE 
id = object_id(@objectName)

if (@@rowcount =0) 
begin
	declare @localized_string_error60050 as nvarchar(128)
	set @localized_string_error60050 = N'Stored Procedure Does Not Exist.'
	raiserror(@localized_string_error60050, 16, 1)
	return 60050
end
	
select
	'Column_name'	= name,
	'Type'		= xtype,
	'Length'	= convert(int, length)

from syscolumns 
where id=@id
GO

GRANT EXECUTE ON [dbo].[TDDS_GetColumnInfo] TO BAM_EVENT_WRITER
GO

CREATE PROCEDURE [dbo].[TDDS_Lock] 
	@resource nvarchar(128),
	@milisecTimeout int,
	@retVal int output
AS
exec @retVal = sp_getapplock @resource,  N'Exclusive', N'Session', @milisecTimeout
GO

GRANT EXECUTE ON [dbo].[TDDS_Lock] TO BAM_EVENT_WRITER
GO


CREATE PROCEDURE [dbo].[TDDS_BlockTDDS]
AS
begin
	set nocount on
	/*
		This proc must be run in a transaction as the whole idea
		is to block tdds to a caller determined amount of time 
		The time is determined by how long the caller holds the transaction open
	*/
	if @@trancount = 0
	 begin
		return -1
	 end

	select	*
	from 	TDDS_StreamStatus with ( tablockx, holdlock )

	if @@ERROR <> 0
	 BEGIN
		return -1
	 END

	/*
		Success
	*/
	return 0
	
end
GO

GRANT EXECUTE ON [dbo].[TDDS_BlockTDDS] TO BTS_BACKUP_USERS
GO

-- Rename the TDDS_StreamStatus#TEMP# table back to its original name if necessary
if (OBJECT_ID('[dbo].[TDDS_StreamStatus#TEMP#]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_StreamStatus#TEMP#]'), N'IsUserTable') =1)
EXEC sp_rename 'TDDS_StreamStatus#TEMP#', 'TDDS_StreamStatus'
GO




