
--we are turning the tracking data table into a partitioned view so we will need to create the underlying partions
--and then distribute the data from the current tracking data table
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[TrackingData]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	--we are going to create one table per (destinationID, PartitionID) so that we can have continuous 
	--identity values for each pair. This gives us the ability to detect holes created by aborted transactions 
	--versus holes which came about because we skipped over the row.
	declare @partID int, @destID int, @maxPartition int, @maxDestination int, @key tinyint, @tbl nvarchar(128), @err int
	set @maxPartition = 4
	set @maxDestination = 2
	set @destID = 0
	set @err = 0

	WHILE (@destID < @maxDestination)
	BEGIN
		set @partID = 0
		WHILE (@partID < @maxPartition)
		BEGIN

			set @key = ( @destID * 10 ) + @partID
			set @tbl = '[dbo].[TrackingData_' + CAST(@destID AS nchar(1)) + '_' + CAST(@partID as nchar(1)) + ']'

			exec ('if exists (select * from dbo.sysobjects where id = object_id(N''' + @tbl + ''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				drop table ' + @tbl )
			set @err = @@ERROR
			
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
			if (@err = 0)	set @err = @@ERROR

			exec ('ALTER TABLE ' + @tbl + ' WITH NOCHECK ADD 
				CONSTRAINT [PK_TrackingData_' + @destID + '_' + @partID + '] PRIMARY KEY  CLUSTERED 
				(
					[partKey],
					[SeqNum]
				)  ON [PRIMARY]')
			if (@err = 0)	set @err = @@ERROR

			exec ('ALTER TABLE ' + @tbl + ' ADD
				CONSTRAINT [CK_TrackingData_' + @destID + '_' + @partID + '] CHECK ([partKey] = ' + @key + ') ')
			if (@err = 0)	set @err = @@ERROR

			--turn off page locks
			EXEC sp_indexoption @tbl, 'disallowpagelocks', TRUE
			if (@err = 0)	set @err = @@ERROR

			-- SQL 2005 requires the following permission for the function call ident_current
			exec ('GRANT SELECT ON [dbo].[TrackingData_' + @destID + '_' + @partID + '] TO BAM_EVENT_READER')
			exec ('GRANT DELETE ON [dbo].[TrackingData_' + @destID + '_' + @partID + '] TO BAM_EVENT_READER')
			exec ('GRANT INSERT ON [dbo].[TrackingData_' + @destID + '_' + @partID + '] TO BTS_HOST_USERS')
			if (@err = 0)	set @err = @@ERROR

			set @partID = @partID + 1
		END

		set @destID = @destID + 1
	END

	if @err = 0
	BEGIN
		exec('DROP TABLE [dbo].[TrackingData]')
	END
END


--create the view over these tables. We use the same name as the old table to avoid breaking existing apps
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackingData]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[TrackingData]
GO

declare @partID int, @destID int, @maxPartition int, @maxDestination int, @key tinyint, @tbl nvarchar(128)
declare @tsql nvarchar(4000)
set @maxPartition = 4
set @maxDestination = 2

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
GO

