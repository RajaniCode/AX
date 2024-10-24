--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

--
--  ! Any change to this file need to be reflected in msgboxschema.sql in the BizTalk Code !
--  BizTalk will not actually run this file
--

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrackingData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingDataPartitions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrackingDataPartitions]
GO

if not exists (select * from sysusers where name = N'BAM_EVENT_READER' and issqlrole = 1)
EXEC sp_addrole N'BAM_EVENT_READER'
GO



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

        if not exists (select * from dbo.sysobjects where id = object_id(@tbl) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
        BEGIN
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
        END
	
		set @partID = @partID + 1
	END

	set @destID = @destID + 1
END

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingData]') and OBJECTPROPERTY(id, N'IsView') = 1)
BEGIN
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
END

CREATE TABLE [dbo].[TrackingDataPartitions] (
	[NumPartitions] [tinyint] NOT NULL
) on [PRIMARY]
GO
INSERT INTO [dbo].[TrackingDataPartitions] ([NumPartitions]) VALUES( 4 )
GO	 
