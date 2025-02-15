--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  
------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_TrackMessage]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[bts_TrackMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_TrackMessageFragments1]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[bts_TrackMessageFragments1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_TrackMessageFragments2]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[bts_TrackMessageFragments2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_TrackMessageParts1]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[bts_TrackMessageParts1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_TrackMessageParts2]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[bts_TrackMessageParts2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrackingData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingData]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[TrackingData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingMessageReferences]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrackingMessageReferences]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Spool1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tracking_Spool1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Fragments1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tracking_Fragments1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Parts1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tracking_Parts1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Spool2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tracking_Spool2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Fragments2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tracking_Fragments2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Parts2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tracking_Parts2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingSpoolInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrackingSpoolInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btsv_Tracking_Spool]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[btsv_Tracking_Spool]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btsv_Tracking_Parts]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[btsv_Tracking_Parts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btsv_Tracking_Fragments]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[btsv_Tracking_Fragments]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingDataPartitions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrackingDataPartitions]
GO


if not exists (select * from sysusers where name = N'BAM_EVENT_READER' and issqlrole = 1)
EXEC sp_addrole N'BAM_EVENT_READER'
GO

--we are going to create one table per (destinationID, PartitionID) so that we can have continuous 
--identity values for each pair. This gives us the ability to detect holes created by aborted transactions 
--versus holes which came about because we skipped over the row.
declare @partID int, @destID int, @maxPartition int, @maxDestination int, @key tinyint, @tbl nvarchar(128)
set @maxPartition = 4
set @maxDestination = 2
set @destID = 0
WHILE (@destID < @maxDestination)
BEGIN
	set @partID = 0
	WHILE (@partID < @maxPartition)
	BEGIN

		set @key = ( @destID * 10 ) + @partID
		set @tbl = '[dbo].[TrackingData_' + CAST(@destID AS nchar(1)) + '_' + CAST(@partID as nchar(1)) + ']'

		exec ('if exists (select * from dbo.sysobjects where id = object_id(N''' + @tbl + ''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				drop table ' + @tbl )

		exec ('CREATE TABLE ' + @tbl + ' (
				   [partKey]		[tinyint]	NOT NULL, --this is the partitioning column
   				   [SeqNum]            [bigint]       identity(0,1)   NOT NULL, -- identity created, Sequence Number
				   [uidServiceID]         [uniqueidentifier]         NOT NULL, -- The id of the service (schedule, pipeline) that this stream has been generated
				   [StreamID]         [uniqueidentifier]          NOT NULL, -- The instance id of this service
				   [dtTimeStamp]         [datetime]                NOT NULL, -- The time that this row has been generated
				   [strDBServer]         [nvarchar] (256)         NOT NULL, -- Message Box Database Server name
				   [strDBName]            [nvarchar] (256)         NOT NULL, -- Message Box Database name
				   [strServerName]         [nvarchar] (256)         NULL,     -- The server name that the application instance is running on
				   [nSource]            [int]                   NOT NULL, -- The source of this tracking stream, pipeline, schedule or database direct suspend resume commands
				   [uidAgentSrvID]      [uniqueidentifier]            NOT NULL, -- The Agents Service ID
				   [uidServiceClassID]  [uniqueidentifier]            NOT NULL, -- The Class ID (XLANG/s or Messaging or MSMQT)
				   [imgBlob]            [image]                NOT NULL,  -- Actual tracking data
				   [FormatID]   [uniqueidentifier]     NOT NULL,       -- Interceptor ID
				   [DestinationID]	[tinyint]	NOT NULL,
				   [PartitionID]        [tinyint]       NOT NULL	-- partition id within TDDS Session

				)')

		exec ('ALTER TABLE ' + @tbl + ' WITH NOCHECK ADD 
			CONSTRAINT [PK_TrackingData_' + @destID + '_' + @partID + '] PRIMARY KEY  CLUSTERED 
			(
				[partKey],
				[SeqNum]
			)  ON [PRIMARY]')

		exec ('ALTER TABLE ' + @tbl + ' ADD
				CONSTRAINT [CK_TrackingData_' + @destID + '_' + @partID + '] CHECK ([partKey] = ' + @key + ') ')


		--turn off page locks
		EXEC sp_indexoption @tbl, 'disallowpagelocks', TRUE

		-- SQL 2005 requires the following permission for the function call ident_current
		exec ('GRANT SELECT ON [dbo].[TrackingData_' + @destID + '_' + @partID + '] TO BAM_EVENT_READER')
		exec ('GRANT DELETE ON [dbo].[TrackingData_' + @destID + '_' + @partID + '] TO BAM_EVENT_READER')
		exec ('GRANT INSERT ON [dbo].[TrackingData_' + @destID + '_' + @partID + '] TO BTS_HOST_USERS')
	
		set @partID = @partID + 1
	END

	set @destID = @destID + 1
END

--create the view over these tables
declare @tsql nvarchar(4000)
set @tsql = 'CREATE VIEW [dbo].[TrackingData] AS 
'
set @destID = 0
while (@destID < @maxDestination)
BEGIN
	set @partID = 0
	WHILE (@partID < @maxPartition)
	BEGIN
		set @tsql = @tsql + 'SELECT  [partKey], [SeqNum], [uidServiceID], [StreamID], [dtTimeStamp], [strDBServer], [strDBName], [strServerName], [nSource], [uidAgentSrvID], [uidServiceClassID], [imgBlob], [FormatID], [DestinationID], [PartitionID] FROM TrackingData_' + CAST(@destID AS NCHAR(1)) + '_' + CAST(@partID AS NCHAR(1))
	
		--it this isn't the last one, we need to add a UNION ALL clause
		if ( (@destID + 1 < @maxDestination) OR (@partID + 1 < @maxPartition) )
			set @tsql = @tsql + '
UNION ALL
'

	set @partID = @partID + 1
	END

set @destID = @destID + 1
END

exec (@tsql)

CREATE TABLE [dbo].[TrackingDataPartitions] (
	[NumPartitions] [tinyint] NOT NULL
)
GO
INSERT INTO [dbo].[TrackingDataPartitions] ([NumPartitions]) VALUES( 4 )
GO

--turn off page locks
EXEC sp_indexoption '[dbo].[TrackingDataPartitions]', 'disallowpagelocks', TRUE
GO


CREATE TABLE [dbo].[TrackingMessageReferences] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL,
	[uidMessageID] [uniqueidentifier] NOT NULL
)
GO

--turn off page locks
EXEC sp_indexoption '[dbo].[TrackingMessageReferences]', 'disallowpagelocks', TRUE
GO


CREATE TABLE [dbo].[Tracking_Spool1] (
	[uidMsgID] [uniqueidentifier] NOT NULL ,
	[UserName] [sysname] NOT NULL ,
	[dtTimeStamp] [datetime] NOT NULL ,
	[dtExpiration] [datetime] NOT NULL ,
	[nNumParts] [int] NOT NULL ,
	[uidBodyPartID] [uniqueidentifier] NULL ,
	[imgContext] [image] NULL,
	[dtInsertionTimeStamp]	[datetime] NULL CONSTRAINT TrackingSpool1_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())
)
GO

--turn off page locks
EXEC sp_indexoption '[dbo].[Tracking_Spool1]', 'disallowpagelocks', TRUE
GO

CREATE TABLE [dbo].[Tracking_Fragments1] (
	[uidPartID] [uniqueidentifier] NOT NULL ,
	[nFragmentNumber] [int] NOT NULL ,
	[nOffsetStart] [int] NOT NULL,
	[nOffsetEnd] [int] NOT NULL,
	[imgFrag] [image] NOT NULL
)
GO

--turn off page locks
EXEC sp_indexoption '[dbo].[Tracking_Fragments1]', 'disallowpagelocks', TRUE
GO

CREATE TABLE [dbo].[Tracking_Parts1] (
	[uidMessageID] [uniqueidentifier] NOT NULL ,
	[nvcPartName] [nvarchar] (256) NOT NULL ,
	[uidPartID] [uniqueidentifier] NOT NULL ,
	[uidOldPartID] [uniqueidentifier] NOT NULL ,
	[nNumFragments] [int] NOT NULL ,
	[imgPart] [image] NULL ,
	[imgPropBag] [image] NULL
)
GO

--turn off page locks
EXEC sp_indexoption '[dbo].[Tracking_Parts1]', 'disallowpagelocks', TRUE
GO

CREATE TABLE [dbo].[Tracking_Spool2] (
	[uidMsgID] [uniqueidentifier] NOT NULL ,
	[UserName] [sysname] NOT NULL ,
	[dtTimeStamp] [datetime] NOT NULL ,
	[dtExpiration] [datetime] NOT NULL ,
	[nNumParts] [int] NOT NULL ,
	[uidBodyPartID] [uniqueidentifier] NULL ,
	[imgContext] [image] NULL,
	[dtInsertionTimeStamp] [datetime] NULL CONSTRAINT TrackingSpool2_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())
)
GO

--turn off page locks
EXEC sp_indexoption '[dbo].[Tracking_Spool2]', 'disallowpagelocks', TRUE
GO

CREATE TABLE [dbo].[Tracking_Fragments2] (
	[uidPartID] [uniqueidentifier] NOT NULL ,
	[nFragmentNumber] [int] NOT NULL ,
	[nOffsetStart] [int] NOT NULL,
	[nOffsetEnd] [int] NOT NULL,
	[imgFrag] [image] NOT NULL
)
GO

--turn off page locks
EXEC sp_indexoption '[dbo].[Tracking_Fragments2]', 'disallowpagelocks', TRUE
GO

CREATE TABLE [dbo].[Tracking_Parts2] (
	[uidMessageID] [uniqueidentifier] NOT NULL ,
	[nvcPartName] [nvarchar] (256) NOT NULL ,
	[uidPartID] [uniqueidentifier] NOT NULL ,
	[uidOldPartID] [uniqueidentifier] NOT NULL ,
	[nNumFragments] [int] NOT NULL ,
	[imgPart] [image] NULL ,
	[imgPropBag] [image] NULL
)
GO

--turn off page locks
EXEC sp_indexoption '[dbo].[Tracking_Parts2]', 'disallowpagelocks', TRUE
GO

CREATE TABLE [dbo].[TrackingSpoolInfo]
(
	nId					int			not null	IDENTITY(1,1),
	nvcTableQualifier	sysname		not null,
	dtDateModified		datetime	not null	DEFAULT GETUTCDATE(),
	nActive				int			not null,
)
GO

INSERT INTO TrackingSpoolInfo (nvcTableQualifier, nActive) VALUES (N'1', 1)	-- Tracking_Spool1: Initially active
INSERT INTO TrackingSpoolInfo (nvcTableQualifier, nActive) VALUES (N'2', 0)	-- Tracking_Spool2: Initially inactive

/********************
* CREATE INDICES
*******************/
 CREATE  UNIQUE NONCLUSTERED  INDEX [IX_TrackingMessageReferences] ON [dbo].[TrackingMessageReferences]([nID], [uidMessageID])
 CREATE  UNIQUE CLUSTERED  INDEX [CIX_TrackingMessageReferences] ON [dbo].[TrackingMessageReferences]([uidMessageID]) WITH IGNORE_DUP_KEY
 CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool1] ON [dbo].[Tracking_Spool1]([dtTimeStamp], [dtInsertionTimeStamp], [uidMsgID])
 CREATE  INDEX [IX_Tracking_Spool1] ON [dbo].[Tracking_Spool1]([uidMsgID])
 CREATE  UNIQUE CLUSTERED  INDEX [IX_Tracking_Parts1] ON [dbo].[Tracking_Parts1]([uidMessageID], [uidPartID])
 CREATE  CLUSTERED  INDEX [IX_Tracking_Fragments1] ON [dbo].[Tracking_Fragments1]([uidPartID])
 CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool2] ON [dbo].[Tracking_Spool2]([dtTimeStamp], [dtInsertionTimeStamp], [uidMsgID])
 CREATE  INDEX [IX_Tracking_Spool2] ON [dbo].[Tracking_Spool2]([uidMsgID])
 CREATE  UNIQUE CLUSTERED  INDEX [IX_Tracking_Parts2] ON [dbo].[Tracking_Parts2]([uidMessageID], [uidPartID])
 CREATE  CLUSTERED  INDEX [IX_Tracking_Fragments2] ON [dbo].[Tracking_Fragments2]([uidPartID])
GO
/******************
* END INDICES
******************/

/****************************
* Lets disable page locks
**************************/

EXEC sp_indexoption '[dbo].[Tracking_Spool1]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Tracking_Parts1]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Tracking_Fragments1]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Tracking_Spool2]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Tracking_Parts2]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Tracking_Fragments2]', 'disallowpagelocks', TRUE
GO

/*********************************
* End disable page locks
********************************/

CREATE VIEW [dbo].[btsv_Tracking_Spool]
AS
	SELECT
		uidMsgID,
		UserName,
		dtTimeStamp,
		dtExpiration,
		nNumParts,
		uidBodyPartID,
		imgContext
	FROM
		Tracking_Spool1
UNION ALL
	SELECT
		uidMsgID,
		UserName,
		dtTimeStamp,
		dtExpiration,
		nNumParts,
		uidBodyPartID,
		imgContext
	FROM
		Tracking_Spool2
GO

CREATE VIEW [dbo].[btsv_Tracking_Parts]
AS
	SELECT
		uidMessageID,
		nvcPartName,
		uidPartID,
		uidOldPartID,
		nNumFragments,
		imgPart,
		imgPropBag
	FROM
		Tracking_Parts1
UNION ALL
	SELECT
		uidMessageID,
		nvcPartName,
		uidPartID,
		uidOldPartID,
		nNumFragments,
		imgPart,
		imgPropBag
	FROM
		Tracking_Parts2
GO

CREATE VIEW [dbo].[btsv_Tracking_Fragments]
AS
	SELECT
		uidPartID,
		nFragmentNumber,
		nOffsetStart,
		nOffsetEnd,
		imgFrag
	FROM
		Tracking_Fragments1
UNION ALL
	SELECT
		uidPartID,
		nFragmentNumber,
		nOffsetStart,
		nOffsetEnd,
		imgFrag
	FROM
		Tracking_Fragments2
GO
