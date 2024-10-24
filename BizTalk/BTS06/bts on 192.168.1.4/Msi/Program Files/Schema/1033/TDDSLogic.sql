--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

if (OBJECT_ID('[dbo].[TDDS_AdviceSessions]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_AdviceSessions]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_AdviceSessions]
GO

if (OBJECT_ID('[dbo].[TDDS_CleanService]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_CleanService]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_CleanService]
GO

if (OBJECT_ID('[dbo].[TDDS_CreateCustomFormat]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_CreateCustomFormat]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_CreateCustomFormat]
GO

if (OBJECT_ID('[dbo].[TDDS_CreateDBDestination]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_CreateDBDestination]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_CreateDBDestination]
GO

if (OBJECT_ID('[dbo].[TDDS_CreateDBSource]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_CreateDBSource]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_CreateDBSource]
GO

if (OBJECT_ID('[dbo].[TDDS_CreateDestination]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_CreateDestination]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_CreateDestination]
GO


if (OBJECT_ID('[dbo].[TDDS_CreateSource]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_CreateSource]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_CreateSource]
GO

if (OBJECT_ID('[dbo].[TDDS_DeleteAllDestinations]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_DeleteAllDestinations]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_DeleteAllDestinations]
GO

if (OBJECT_ID('[dbo].[TDDS_DeleteAllSources]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_DeleteAllSources]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_DeleteAllSources]
GO

if (OBJECT_ID('[dbo].[TDDS_DeleteCustomFormat]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_DeleteCustomFormat]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_DeleteCustomFormat]
GO

if (OBJECT_ID('[dbo].[TDDS_DeleteDestination]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_DeleteDestination]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_DeleteDestination]
GO


if (OBJECT_ID('[dbo].[TDDS_DeleteSource]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_DeleteSource]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_DeleteSource]
GO

if (OBJECT_ID('[dbo].[TDDS_GetCustomFormats]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetCustomFormats]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetCustomFormats]
GO

if (OBJECT_ID('[dbo].[TDDS_GetDestinations]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetDestinations]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetDestinations]
GO

if (OBJECT_ID('[dbo].[TDDS_GetHeartbeats]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetHeartbeats]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetHeartbeats]
GO


if (OBJECT_ID('[dbo].[TDDS_GetServerDetail]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetServerDetail]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetServerDetail]
GO

if (OBJECT_ID('[dbo].[TDDS_GetServerSummaryInfo]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetServerSummaryInfo]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetServerSummaryInfo]
GO

if (OBJECT_ID('[dbo].[TDDS_GetServiceRefreshInterval]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetServiceRefreshInterval]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetServiceRefreshInterval]
GO

if (OBJECT_ID('[dbo].[TDDS_GetServices]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetServices]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetServices]
GO

if (OBJECT_ID('[dbo].[TDDS_GetSessionDetail]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetSessionDetail]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetSessionDetail]
GO

if (OBJECT_ID('[dbo].[TDDS_GetSessionSummaryInfo]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetSessionSummaryInfo]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetSessionSummaryInfo]
GO

if (OBJECT_ID('[dbo].[TDDS_GetSources]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetSources]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetSources]
GO

if (OBJECT_ID('[dbo].[TDDS_RecordSessionManagerHeartBeat]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_RecordSessionManagerHeartBeat]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_RecordSessionManagerHeartBeat]
GO

if (OBJECT_ID('[dbo].[TDDS_RegisterService]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_RegisterService]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_RegisterService]
GO

if (OBJECT_ID('[dbo].[TDDS_UnregisterService]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_UnregisterService]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_UnregisterService]
GO

if (OBJECT_ID('[dbo].[TDDS_UpdatePoolRefreshInterval]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_UpdatePoolRefreshInterval]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_UpdatePoolRefreshInterval]
GO

if (OBJECT_ID('[dbo].[TDDS_CheckAdminDBVersion]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_CheckAdminDBVersion]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_CheckAdminDBVersion]
GO

if (OBJECT_ID('[dbo].[TDDS_GetSettings]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_GetSettings]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_GetSettings]
GO

if (OBJECT_ID('[dbo].[TDDS_SetSourceEnabled]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_SetSourceEnabled]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_SetSourceEnabled]
GO

if (OBJECT_ID('[dbo].[TDDS_UpdateSettings]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_UpdateSettings]'), N'IsProcedure') =1)
DROP PROCEDURE [dbo].[TDDS_UpdateSettings]
GO


if not exists (select * from sysusers where name = N'BAM_CONFIG_READER' and issqlrole = 1)
EXEC sp_addrole N'BAM_CONFIG_READER'
GO

-- The Biggest Error code returned in this file is 60032, please if you are giong to returne new error codes start from this number
-- and update this comment.

-- both the input and output string versions should be of the form major.minor.rev
create procedure [dbo].[TDDS_CheckAdminDBVersion]
(
 @ClientVersion nvarchar(128), 
 @AdminDBVersion nvarchar(128) OUTPUT
)
as
begin
	SET @AdminDBVersion = N'1.0.0'
	return 0
end
GO
GRANT EXEC ON [dbo].[TDDS_CheckAdminDBVersion] TO BTS_ADMIN_USERS
GO


create procedure [dbo].[TDDS_CreateDestination]
(
	@DestinationName nvarchar(256),
	@ConnectionString nvarchar(1024)
)
as
begin
	
	if exists(select * from TDDS_Destinations where ((DestinationName=@DestinationName)))
	begin
		declare @localized_string_error60004 as nvarchar(128)
		set @localized_string_error60004 = N'Destination Already Exists.'
		raiserror (@localized_string_error60004,16,1)
		return 60004
	end
	
	insert into TDDS_Destinations (DestinationID,DestinationName,ConnectionString) 
	values (newid(), @DestinationName,@ConnectionString)

	if (@@rowcount =0) 
	begin
		declare @localized_string_error60005 as nvarchar(128)
		set @localized_string_error60005 = N'Can Not Add Destination.'
		raiserror(@localized_string_error60005 , 16,1)
		return 60005
	end

	return 0
end
go

create procedure [dbo].[TDDS_DeleteDestination]
(	
	@DestinationName	nvarchar(256)
)
as
begin
	declare @localized_string_error60006 as nvarchar(128)
	set @localized_string_error60006 = N'Can Not Delete Destination.'
	declare @@DestinationID uniqueidentifier

	
	select @@DestinationID=DestinationID 
	from   TDDS_Destinations 
	where (DestinationName=@DestinationName)

	if @@DestinationID is null
	begin
		declare @localized_string_error60026 as nvarchar(128)
		set @localized_string_error60026 = N'Destination Does Not Exist.'
		raiserror(@localized_string_error60026, 16, 1)
		return 60026
	end
	else
	begin
		if exists(select * from TDDS_Sources where (DestinationID=@@DestinationID))
		begin
			raiserror(@localized_string_error60006 ,16,1)
			return 60006
		end
		else
		begin
			delete  from TDDS_Destinations where (DestinationName=@DestinationName)
			if (@@rowcount =0) 
			begin		
				raiserror(@localized_string_error60006, 16, 1)
				return 60006
			end
			
			return 0
		end
		
	end
	
end
go

create procedure [dbo].[TDDS_CreateSource]
(
	@DestinationName nvarchar(256),
	@SourceName nvarchar(256),
	@ConnectionString nvarchar(1024),
	@StreamType int,
	@AcceptableLatency int=null
)
as 
begin

	declare @@DestinationID uniqueidentifier

	select @@DestinationID=DestinationID from TDDS_Destinations where DestinationName=@DestinationName

	if @@DestinationID is null
	begin
		declare @localized_string_error60028 as nvarchar(128)
		set @localized_string_error60028 = N'Destination Does Not Exist.'
		raiserror(@localized_string_error60028, 16, 1)
		return 60028
	end
	if exists (select * from TDDS_Sources where (DestinationID=@@DestinationID) And (SourceName=@SourceName))
	begin
		declare @localized_string_error60008 as nvarchar(128)
		set @localized_string_error60008 = N'Source Already Exists.'
		raiserror (@localized_string_error60008,16,1)
		return 60008
	end
	else
	begin
		insert TDDS_Sources (SourceID,DestinationID,SourceName,ConnectionString,StreamType,AcceptableLatency)
		values (NEWID(),@@DestinationID,@SourceName,@ConnectionString,@StreamType,@AcceptableLatency)
		if (@@rowcount =0) 
		begin
			declare @localized_string_error60009 as nvarchar(128)
			set @localized_string_error60009 = N'Can Not Add Source.'
			raiserror(@localized_string_error60009 , 16,1)
			return 60009
		end
		
		return 0

	end
	
end
go
create procedure [dbo].[TDDS_DeleteSource]
(
	@DestinationName nvarchar(256),
	@SourceName	nvarchar(256)
)
as
begin


	declare @@DestinationID uniqueidentifier
	select @@DestinationID=DestinationID from TDDS_Destinations where DestinationName=@DestinationName

	if @@DestinationID is null
	begin
		declare @localized_string_error60007 as nvarchar(128)
		set @localized_string_error60007 = N'Destination Does Not Exist.'
		raiserror(@localized_string_error60007, 16, 1)
		return 60007
	end

	if exists(select * from TDDS_Sources where (DestinationID=@@DestinationID) And (SourceName=@SourceName))
	begin
		delete from TDDS_Sources where (DestinationID=@@DestinationID) And (SourceName=@SourceName)
		if (@@rowcount =0) 
		begin
			declare @localized_string_error60010 as nvarchar(128)
			set @localized_string_error60010 = N'Can Not Delete Source.'
			raiserror(@localized_string_error60010 ,16,1)
			return 60010
		end
		return 0

	end
	else
	begin
		declare @localized_string_error60011 as nvarchar(128)
		set @localized_string_error60011 = N'Source Does Not Exist.'
		raiserror(@localized_string_error60011, 16, 1)
		return 60011
	end
	

end
go
GRANT EXEC ON [dbo].[TDDS_DeleteSource] TO BTS_ADMIN_USERS
GO
create procedure [dbo].[TDDS_SetSourceEnabled]
(
	@SourceName	nvarchar(256),
	@Enable	        bit
)
as
begin
	
	if (@Enable is null)
	begin
			declare @localized_string_error61000 as nvarchar(128)
			set @localized_string_error61000 = N'Enabled cannot be set to null.'
			raiserror(@localized_string_error61000, 16, 1)
			return 61000

	end
	else
	begin
	
		if exists(select * from TDDS_Sources where  (SourceName=@SourceName))
		begin
			update TDDS_Sources with (TABLOCK)
			set Enabled = @Enable
			where (SourceName=@SourceName)
			
		end
		else
		begin
			declare @localized_string_error62011 as nvarchar(128)
			set @localized_string_error62011 = N'Source Does Not Exist.'
			raiserror(@localized_string_error62011, 16, 1)
			return 62011
		end
	end

end
GO
GRANT EXEC ON [dbo].[TDDS_SetSourceEnabled] TO BTS_ADMIN_USERS
GO

create procedure [dbo].[TDDS_RegisterService]
(
	@ServiceID uniqueidentifier,
	@ServerName nvarchar(32)
)
as
begin
	declare @@ID nvarchar(128)
	
	if exists (select * from TDDS_Services where ServiceID = @ServiceID)
	begin		
		declare @localized_string_error60012 as nvarchar(128)
		set @localized_string_error60012 = N'Already Register Service.'
		raiserror (@localized_string_error60012,16,1)
		return 60012
	end

	insert TDDS_Services (ServiceID,ServerName)
	values(@ServiceID,@ServerName)

	return 0
end
GO



GRANT EXEC ON [dbo].[TDDS_RegisterService] TO BTS_ADMIN_USERS
GO

create procedure [dbo].[TDDS_UnregisterService]
(
	@ServiceID uniqueidentifier
)
as
begin

	delete from TDDS_Services where (ServiceID = @ServiceID)
	if (@@rowcount = 0) 
	begin	
		declare @localized_string_error60013 as nvarchar(128)
		set @localized_string_error60013 = N'Service Does Not Exist.'
		raiserror (@localized_string_error60013,16,1)
		return 60013
	end
	return 0
end
go
GRANT EXEC ON [dbo].[TDDS_UnregisterService] TO BTS_ADMIN_USERS
GO

create procedure [dbo].[TDDS_CreateCustomFormat]
(
	@FormatID uniqueidentifier,
	@DecoderClass nvarchar(256),
	@DLLName nvarchar(1024)
)
as
begin
	declare @@ID nvarchar(128)
	select @@ID=CAST ( @FormatID as nvarchar(128))

	if (exists(select * from TDDS_CustomFormats where FormatID=@FormatID))
	begin
		declare @localized_string_error60014 as nvarchar(128)
		set @localized_string_error60014 = N'Custom Format Already Exists.'
		raiserror (@localized_string_error60014,16,1)
		return 60014
	end
	else
	begin
		insert TDDS_CustomFormats (FormatID,DecoderClass,DllName)
		values(@FormatID,@DecoderClass,@DLLName)
		if (@@rowcount =0) 
		begin
			declare @localized_string_error60015 as nvarchar(128)
			set @localized_string_error60015 = N'Can Not Create Custom Format.'
			raiserror(@localized_string_error60015 , 16,1)
			return 60015
		end
		return 0
	end

end
go

create procedure [dbo].[TDDS_DeleteCustomFormat]
(
	@FormatID uniqueidentifier
)
as 
begin
	declare @@ID nvarchar(128)
	select @@ID=CAST ( @FormatID as nvarchar(128))

	if exists(select * from TDDS_CustomFormats where (FormatID = @FormatID) )
	begin
		delete from TDDS_CustomFormats where (FormatID=@FormatID)
		if (@@rowcount =0) 
		begin
		declare @localized_string_error60016 as nvarchar(128)
		set @localized_string_error60016 = N'Can Not Delete Custom Format.'
		raiserror(@localized_string_error60016 ,16,1)
		return 60016
		end
		return 0

	end
	else
	begin
		declare @localized_string_error60017 as nvarchar(128)
		set @localized_string_error60017 = N'Custom Format Does Not Exist.'
		raiserror(@localized_string_error60017, 16, 1)
		return 60017
	end
end
go

create procedure [dbo].[TDDS_DeleteAllDestinations]
as
begin
	
	if (exists (select * from TDDS_Sources where TDDS_Sources.DestinationID in (select TDDS_Destinations.DestinationID from TDDS_Destinations)))
	begin
		declare @localized_string_error60023 as nvarchar(128)
		set @localized_string_error60023 = N'Please delete associated event sources first'
		raiserror(@localized_string_error60023, 16, 1)
		return 60023
	end
	else
	begin
		delete from TDDS_Destinations
		if (@@rowcount =0) 
		begin
		declare @localized_string_error60027 as nvarchar(128)
		set @localized_string_error60027 = N'Can Not Delete Destinations.'
		raiserror(@localized_string_error60027 ,16,1)
		return 60027
		end
		return 0
	end
end
go

create procedure [dbo].[TDDS_DeleteAllSources]
(
	@DestinationName nvarchar(256)
)
as
begin
	declare @@DestID uniqueidentifier


	select @@DestID = DestinationID from TDDS_Destinations where DestinationName = @DestinationName
	
	if (@@DestID is null)
	begin
		declare @localized_string_error60029 as nvarchar(128)
		set @localized_string_error60029 = N'Destination Does Not Exist.'
		raiserror(@localized_string_error60029, 16, 1)
		return 60029
	end
	else
	begin
		delete from TDDS_Sources where DestinationID=@@DestID
		if (@@rowcount =0) 
		begin
			declare @localized_string_error60031 as nvarchar(128)
			set @localized_string_error60031 = N'Can Not Delete Source.'
			raiserror(@localized_string_error60031 ,16,1)
			return 60031
		end
		return 0
	end
end
go


create procedure [dbo].[TDDS_GetCustomFormats]
as 
set nocount on
select * from TDDS_CustomFormats
go

GRANT EXECUTE ON [dbo].[TDDS_GetCustomFormats] TO BAM_CONFIG_READER
GO

create procedure [dbo].[TDDS_GetDestinations]
as
set nocount on
select TDDS_Destinations.DestinationName, TDDS_Destinations.ConnectionString
from TDDS_Destinations
go

create procedure [dbo].[TDDS_GetServices]
as
set nocount on
select TDDS_Services.ServiceID, TDDS_Services.ServerName
from TDDS_Services
go

create procedure [dbo].[TDDS_GetSources]
as
set nocount on
select TDDS_Sources.SourceName, TDDS_Sources.ConnectionString, TDDS_Sources.StreamType, TDDS_Sources.AcceptableLatency,
	TDDS_Destinations.DestinationName
from TDDS_Sources inner join TDDS_Destinations on TDDS_Destinations.DestinationID=TDDS_Sources.DestinationID
go

create procedure [dbo].[TDDS_GetHeartbeats]
as
set nocount on
 select TDDS_Heartbeats.TimeLastChanged, TDDS_Heartbeats.RecordsProcessed, TDDS_Heartbeats.RecordsLeft, TDDS_Heartbeats.Latency,
	TDDS_Heartbeats.ErrorCode, TDDS_Heartbeats.ErrorDescription, TDDS_Sources.SourceName, TDDS_Services.ServiceID,TDDS_Services.ServerName
 from TDDS_Heartbeats 
 inner join TDDS_Sources on TDDS_Sources.SourceID=TDDS_Heartbeats.SourceID 
 inner join TDDS_Services on TDDS_Services.ServiceID=TDDS_Heartbeats.ServiceID
go	

create procedure [dbo].[TDDS_GetSessionSummaryInfo]
as
begin
	set nocount on
	declare @@SessionTimeout int

	select @@SessionTimeout=SessionTimeout from TDDS_Settings

	select   TDDS_Services.ServiceID,TDDS_Sources.SourceName, TDDS_Sources.SourceID, TDDS_Services.ServerName, TDDS_Destinations.DestinationName, 
		MAX(TDDS_Heartbeats.TimeLastChanged) as 'LastProcessTime',
		MAX(TDDS_Heartbeats.Latency) as 'MaxL',
		MIN(TDDS_Heartbeats.TimeLastChanged) as 'MinTime',
		Max(TDDS_Heartbeats.Age) as 'MaxAge',
		SUM(TDDS_Heartbeats.RecordsProcessed) as 'Recs'
		into #tmp	
	from TDDS_Services

	inner join TDDS_Heartbeats on TDDS_Services.ServiceID = TDDS_Heartbeats.ServiceID
	inner join TDDS_Sources on  TDDS_Heartbeats.SourceID = TDDS_Sources.SourceID
	inner join TDDS_Destinations on TDDS_Destinations.DestinationID = TDDS_Sources.DestinationID
	Group by TDDS_Sources.SourceName, TDDS_Sources.SourceID, TDDS_Services.ServerName, TDDS_Services.ServiceID, TDDS_Destinations.DestinationName	
	HAVING (datediff(second, MAX(TDDS_Heartbeats.TimeLastChanged), GETUTCDATE()) < (@@SessionTimeout))

	select #tmp.ServiceID, #tmp.SourceName, #tmp.SourceID, #tmp.ServerName, #tmp.DestinationName, #tmp.LastProcessTime,
		'MaxLatency' = 
		case
			when #tmp.MaxL is null
			then cast(0 as float)
			else #tmp.MaxL
		end,
		 'RecordsLeft' =
		 case
			when TDDS_Heartbeats.RecordsLeft is null
			then 0
			else TDDS_Heartbeats.RecordsLeft
		end,
		'Throughput'=
		case 
			
			when ( ((CAST(datediff(second,  #tmp.MinTime,  #tmp.LastProcessTime)as float)) <=0) or (#tmp.Recs is null))
				then 0
			else CAST(#tmp.Recs as float) / CAST(datediff(second,  #tmp.MinTime,  #tmp.LastProcessTime)as float)
		End

	from #tmp
	inner join TDDS_Heartbeats on ( (TDDS_Heartbeats.Age = #tmp.MaxAge) and (TDDS_Heartbeats.SourceID = #tmp.SourceID) and
					(TDDS_Heartbeats.ServiceID = #tmp.ServiceID))
	
end
go

create procedure [dbo].[TDDS_GetServerSummaryInfo]
as
begin
	set nocount on
	declare @@SessionTimeout int

	select @@SessionTimeout=SessionTimeout from TDDS_Settings

	select distinct TDDS_Services.ServerName,TDDS_Services.ServiceID,MAX(TDDS_Heartbeats.TimeLastChanged) as 'LastProcessTime',
	        COUNT(DISTINCT Cast(TDDS_Heartbeats.SourceID AS nvarchar(256))) as N'ActiveSessions',
		'Throughput'=
		case 			
			when ( ((CAST(datediff(second,  MIN(TDDS_Heartbeats.TimeLastChanged),  MAX(TDDS_Heartbeats.TimeLastChanged))as float)) <=0) Or (SUM(TDDS_Heartbeats.RecordsProcessed) is null))
				then 0
			else CAST(SUM(TDDS_Heartbeats.RecordsProcessed) as float) / CAST(datediff(second,  MIN(TDDS_Heartbeats.TimeLastChanged),  MAX(TDDS_Heartbeats.TimeLastChanged))as float)
		End
	from TDDS_Services
	inner join TDDS_Heartbeats on TDDS_Services.ServiceID = TDDS_Heartbeats.ServiceID
	where (TDDS_Heartbeats.SourceID is not null)
	Group BY TDDS_Services.ServiceID, TDDS_Services.ServerName
	HAVING (datediff(second, MAX(TDDS_Heartbeats.TimeLastChanged), GETUTCDATE()) < (@@SessionTimeout))
end
GO

create procedure [dbo].[TDDS_GetSessionDetail]
(
	@SourceID uniqueidentifier
)
as
begin
	set nocount on

	if exists(select * from TDDS_Sources where SourceID=@SourceID)
	begin

		select TDDS_Services.ServerName, TDDS_Destinations.DestinationName, TDDS_Heartbeats.RecordsProcessed,
		       TDDS_Heartbeats.RecordsLeft, TDDS_Heartbeats.TimeLastChanged, TDDS_Heartbeats.Latency,
			TDDS_Heartbeats.ErrorCode, TDDS_Heartbeats.ErrorDescription
		
		from TDDS_Sources
		inner join TDDS_Heartbeats on TDDS_Heartbeats.SourceID = @SourceID
		inner join TDDS_Services on TDDS_Services.ServiceID = TDDS_Heartbeats.ServiceID
		inner join TDDS_Destinations on TDDS_Destinations.DestinationID = TDDS_Sources.DestinationID

		where TDDS_Sources.SourceID = @SourceID
		ORDER by TDDS_Services.ServerName ASC,TDDS_Destinations.DestinationName ASC, TDDS_Heartbeats.TimeLastChanged DESC
		return 0
	end
	else
	begin
		declare @localized_string_error60030 as nvarchar(128)
		set @localized_string_error60030 = N'Source Does Not Exist.'
		raiserror(@localized_string_error60030, 16, 1)
		return 60030
	end

end
go


create procedure [dbo].[TDDS_GetServerDetail]
(
	@ServiceID uniqueidentifier
)
as
begin
	declare @@ID nvarchar(128)
	set nocount on
	select @@ID=CAST ( @ServiceID as nvarchar(128))

	if exists(select * from TDDS_Services where ServiceID = @ServiceID)
	begin

		select TDDS_Sources.SourceName, TDDS_Destinations.DestinationName, TDDS_Heartbeats.RecordsProcessed,
			TDDS_Heartbeats.RecordsLeft, TDDS_Heartbeats.TimeLastChanged, TDDS_Heartbeats.Latency,
			TDDS_Heartbeats.ErrorCode, TDDS_Heartbeats.ErrorDescription

		from TDDS_Services
		inner join TDDS_Heartbeats on TDDS_Heartbeats.ServiceID = TDDS_Services.ServiceID
		inner join TDDS_Sources on TDDS_Sources.SourceID = TDDS_Heartbeats.SourceID
		inner join TDDS_Destinations on TDDS_Destinations.DestinationID = TDDS_Sources.DestinationID
		
		where TDDS_Services.ServiceID = @ServiceID
		ORDER by TDDS_Sources.SourceName ASC, TDDS_Destinations.DestinationName ASC, TDDS_Heartbeats.TimeLastChanged DESC

		return 0
	end
	else
	begin
		declare @localized_string_error60019 as nvarchar(128)
		set @localized_string_error60019 = N'Service Does Not Exist.'
		raiserror(@localized_string_error60019, 16, 1)
		return 60019
	end
end
go

create procedure [dbo].[TDDS_CleanService]
(
	@ServiceID uniqueidentifier
)
as 
begin
	delete from TDDS_Heartbeats where ServiceID=@ServiceID
end

GO
GRANT EXECUTE ON [dbo].[TDDS_CleanService] TO BAM_CONFIG_READER
GO



create procedure [dbo].[TDDS_CreateDBDestination]
(
	@DestinationName nvarchar(256),
	@DBServerName nvarchar(256),
	@DatabaseName nvarchar(256)
)
as
begin
	declare @@ConnectionString nvarchar(1024)
	select @@ConnectionString='Pooling=false;Current Language=us_english;Integrated Security=SSPI;server='+@DBServerName+';database='+@DatabaseName
	exec TDDS_CreateDestination @DestinationName,@@ConnectionString
end
go
GRANT EXEC ON [dbo].[TDDS_CreateDBDestination] TO BTS_ADMIN_USERS
GO

create procedure [dbo].[TDDS_CreateDBSource]
(
	@DestinationName nvarchar(256),
	@SourceName nvarchar(256),
	@DBServerName nvarchar(256),
	@DatabaseName nvarchar(256),
	@StreamType int,
	@AcceptableLatency int=null
)
as 
begin
	declare @@ConnectionString nvarchar(1024)
	select @@ConnectionString='Pooling=false;Current Language=us_english;Integrated Security=SSPI;server='+@DBServerName+';database='+@DatabaseName
	if exists (select * from TDDS_Sources where (ConnectionString=@@ConnectionString) And (StreamType=@StreamType))
	begin
		declare @localized_string_error60039 as nvarchar(128)
		set @localized_string_error60039 = N'Source Already Exists.'
		raiserror (@localized_string_error60039,16,1)
		return 60039
	end
	else
	begin
		exec TDDS_CreateSource  @DestinationName,@SourceName,@@ConnectionString,@StreamType,@AcceptableLatency
	end
end
go
GRANT EXEC ON [dbo].[TDDS_CreateDBSource] TO BTS_ADMIN_USERS
GO

create procedure [dbo].[TDDS_UpdatePoolRefreshInterval]
(	
	@RefreshInterval int
)
as
begin
	update TDDS_Settings set RefreshInterval = @RefreshInterval
	if (@@rowcount =0) 
	begin
		declare @localized_string_error60018 as nvarchar(128)
		set @localized_string_error60018 = N'Can Not Update  Refresh Interval.'
		raiserror(@localized_string_error60018, 16, 1)
		return 60018
	end
	return 0
end
go
GRANT EXEC ON [dbo].[TDDS_UpdatePoolRefreshInterval] TO BTS_ADMIN_USERS
GO

create procedure [dbo].[TDDS_RecordSessionManagerHeartBeat]
(
	@SourceID uniqueidentifier = null,
	@ServiceID uniqueidentifier,
	@RecordsProcessed int = null,
	@Latency float = null,
	@EventsProcessed int = null,
	@RecordsLeft int=null,
	@ErrorCode int=null,
	@ErrorDescription nvarchar(1024)=null
)
as
begin
	declare @@HBCount int
	declare @@dummy uniqueidentifier
	
	begin transaction
	
	select top 1 @@dummy=ServiceID from TDDS_Heartbeats WITH  (TABLOCKX)
	
	
	if (@SourceID is null)
	begin
		select @@HBCount=Count(*)
		FROM TDDS_Heartbeats 
		where (SourceID is null) And (ServiceID=@ServiceID)		
	end
	else
	begin
		select @@HBCount=Count(*)
		FROM TDDS_Heartbeats 
		where (SourceID=@SourceID) And (ServiceID=@ServiceID)
	end
	
	if (@@HBCount>9)
	begin
		if (@SourceID is null)
		begin
			delete TDDS_Heartbeats  where Age = 
			( select min(Age) from TDDS_Heartbeats where (SourceID is null) and (ServiceID = @ServiceID ) )
		end
		else
		begin
			delete TDDS_Heartbeats where Age = 
			( select min(Age) from TDDS_Heartbeats where (SourceID = @SourceID) and (ServiceID = @ServiceID ))

		end


	end
	insert TDDS_Heartbeats
	(
		ServiceID,
		SourceID,
		TimeLastChanged,
		RecordsProcessed,
		Latency,
		EventsProcessed,
		RecordsLeft,
		ErrorCode,
		ErrorDescription
	)
	values
	(
		@ServiceID,
		@SourceID,
		GETUTCDATE(),
		@RecordsProcessed,
		@Latency,
		@EventsProcessed,
		@RecordsLeft,
		@ErrorCode,
		@ErrorDescription
	)

	commit transaction
	return 0	

	
end
go

GRANT EXECUTE ON [dbo].[TDDS_RecordSessionManagerHeartBeat] TO BAM_CONFIG_READER
GO
create procedure [dbo].[TDDS_AdviceSessions]
(
	@ServiceID uniqueidentifier
)
as
begin
	declare @@TotalSessionCount int
	declare @@UnassignedSessionsCount int
	declare @@ServiceSessionsCount int
	declare @@ServicesCount int
	declare @@ActiveSessionsCount int
	declare @@AdviceResult int
	declare @@modval int
	declare @@tmpval int
	declare @@SqlCommandTimeout int
	declare @@SourceID uniqueidentifier
	declare @@Destconstr nvarchar(1024)
	declare @@Srcconstr nvarchar(1024)
	declare @@AcceptableLatency int
	declare @@DestID uniqueidentifier
	declare @@StreamType int
	declare @@Intent int
	declare @@ApplockretVal int
	declare @@RefreshInterval int
	declare @@SessionRet int
	declare @@SessionTimeout int
	declare @@DisablesRunningSourcesCount int
		

	
	begin transaction 	
	
	select @@SessionTimeout=SessionTimeout,@@SqlCommandTimeout=SqlCommandTimeout, @@RefreshInterval=RefreshInterval from TDDS_Settings
	set @@SqlCommandTimeout = @@SqlCommandTimeout *1000
	set @@ApplockretVal = 0

	exec @@ApplockretVal = sp_getapplock N'TDDS_AdviceSessions',  N'Exclusive', N'Transaction',@@SqlCommandTimeout

	if (@@ApplockretVal<0)
	begin 
		exec sp_releaseapplock N'TDDS_AdviceSessions', N'Transaction'
		commit transaction 

		if (-1 = @@ApplockretVal)
		begin			
			declare @localized_string_error63100 as nvarchar(128)
			set @localized_string_error63100 = N' TDDS_AdviceSessions Lock request timed out.'

			raiserror(@localized_string_error63100, 16, 1)
			return 63100
		end
		else if (-2 = @@ApplockretVal)
		begin
			declare @localized_string_error63101 as nvarchar(128)
			set @localized_string_error63101 = N' TDDS_AdviceSessions Lock request was cancelled.'
			raiserror(@localized_string_error63101, 16, 1)
			return 63101
		end
		else if (-3 = @@ApplockretVal)
		begin
			declare @localized_string_error63102 as nvarchar(128)
			set @localized_string_error63102 = N' TDDS_AdviceSessions Lock request was chosen as a deadlock victim.'

			raiserror(@localized_string_error63102, 16, 1)
			return 63102
		end
		else
		begin
			declare @localized_string_error63103 as nvarchar(128)
			set @localized_string_error63103 = N' TDDS_AdviceSessions Lock request failed: Unknown Error.'

			raiserror(@localized_string_error63103, 16, 1)
			return 63103
		end
	end


	set @@UnassignedSessionsCount = 0
	set @@ServiceSessionsCount = 0
	set @@ServicesCount = 0
	set @@ActiveSessionsCount = 0
	set @@AdviceResult = 0
	set @@modval = 0
	set @@SessionRet = 0
	set @@DisablesRunningSourcesCount =0

	declare @localized_string_CallAdviceSession as nvarchar(128)
	set @localized_string_CallAdviceSession = N'TDDS_AdviceSessions called'
	
	
	select MAX(TDDS_Heartbeats.TimeLastChanged) as 'TimeLastChanged', TDDS_Heartbeats.ServiceID, TDDS_Heartbeats.SourceID into #PoolUpdates
	from TDDS_Heartbeats with (TABLOCKX)
	where (TDDS_Heartbeats.ServiceID in (select ServiceID from TDDS_Services with (TABLOCK)))
	Group by TDDS_Heartbeats.ServiceID, TDDS_Heartbeats.SourceID
	
	exec TDDS_RecordSessionManagerHeartBeat null, @ServiceID,null,null,null,null,0,@localized_string_CallAdviceSession

	select TDDS_Sources.SourceID, TDDS_Sources.ConnectionString as N'SrcConnstr', 
	       TDDS_Destinations.DestinationID, TDDS_Destinations.ConnectionString as N'DestConnstr',
	       TDDS_Sources.StreamType , TDDS_Sources.AcceptableLatency into #PoolSessions
	from TDDS_Sources with (TABLOCK)
	inner join TDDS_Destinations with (TABLOCK)on 
		( (TDDS_Sources.DestinationID = TDDS_Destinations.DestinationID) And
		  (TDDS_Sources.Enabled =1)
		)
	
	select @@TotalSessionCount=count(*)
	from #PoolSessions


	
	select * into #ActiveSessionsUpdate
	from #PoolUpdates
	where ( datediff(second, TimeLastChanged, GETUTCDATE()) < (@@SessionTimeout) )

	select distinct ServiceID into #ActiveServerList
	from #ActiveSessionsUpdate

	select @@ServicesCount = count(*)
	from #ActiveServerList

	select distinct SourceID into #ActiveSources
	from #ActiveSessionsUpdate
	where (SourceID is not null) and ((SourceID in (select distinct SourceID from #PoolSessions)))
	
	select @@ActiveSessionsCount = count(*)
	from #ActiveSources

	set @@UnassignedSessionsCount = @@TotalSessionCount - @@ActiveSessionsCount

	select  * into #ActiveServiceSessions
	from #ActiveSessionsUpdate
	where (ServiceID = @ServiceID) and (SourceID in (select distinct SourceID from #PoolSessions))
	
	select distinct @@ServiceSessionsCount = count(*)
	from #ActiveServiceSessions

	select distinct #ActiveSessionsUpdate.SourceID, '-1' as 'Intent' into #DisabledRunningSources
	from #ActiveSessionsUpdate
	where ( (#ActiveSessionsUpdate.SourceID not IN (select #PoolSessions.SourceID from  #PoolSessions))
	      And (#ActiveSessionsUpdate.ServiceID = @ServiceID) )

	select distinct @@DisablesRunningSourcesCount = count(*)
	from #DisabledRunningSources
	

	if (not(exists (select ServiceID from #ActiveServerList where ServiceID=@ServiceID)))
	begin

		declare @localized_string_error63104 as nvarchar(128)
		set @localized_string_error63104 = N'Critical error service not registered'
		exec TDDS_RecordSessionManagerHeartBeat null, @ServiceID,null,null,null,null,63104,@localized_string_error63104
		exec sp_releaseapplock N'TDDS_AdviceSessions', N'Transaction'
		commit transaction 

		raiserror(@localized_string_error63104, 16, 1)
		return 63104
	end

	if (@@TotalSessionCount>@@ServicesCount)
	begin
		set @@modval = @@TotalSessionCount % @@ServicesCount
		
		if (0 = @@modval)
		begin
			set @@AdviceResult = (@@TotalSessionCount / @@ServicesCount) - @@ServiceSessionsCount
		end
		else	
		begin
			set @@tmpval = (@@TotalSessionCount - @@modval) / @@ServicesCount
			

			if (@@UnassignedSessionsCount = @@modval)
			begin
				set @@tmpval = @@tmpval + 1			
			end

			
			set @@AdviceResult = @@tmpval - @@ServiceSessionsCount
		end
	end
	else
	begin
		if (0 = @@TotalSessionCount)
		begin
			exec sp_releaseapplock N'TDDS_AdviceSessions', N'Transaction'
			select * from #DisabledRunningSources
			commit transaction			
			return
		end
		
		if (0 = @@ServiceSessionsCount)
		begin
			set @@AdviceResult = 1
		end
		else if (@@ServiceSessionsCount >= 1)
		begin
			set @@AdviceResult = 1 - @@ServiceSessionsCount
		end
	end

	if (@@AdviceResult > 0)
	begin

		select #PoolSessions.* into #UnassignedSources
		from #PoolSessions
		where (SourceID not in (select distinct SourceID
					from #ActiveSources )) 
					
		if (@@UnassignedSessionsCount =0)
		begin		
			
			declare @localized_string_SessionNotAssigned as nvarchar(128)
			set @localized_string_SessionNotAssigned = N'All Sessions are currently assigned.'
			exec TDDS_RecordSessionManagerHeartBeat null, @ServiceID,null,null,null,null,0,@localized_string_SessionNotAssigned
			commit transaction			
			return
		end
		set ROWCOUNT @@AdviceResult
		
		select *,'1' as 'Intent' into #StartTable
		from #UnassignedSources
		
		set ROWCOUNT  0

		declare ResultCursor CURSOR FOR
		select * from #StartTable
		open ResultCursor
		
		fetch next from ResultCursor into @@SourceID, @@Srcconstr, @@DestID, @@Destconstr, @@StreamType, @@AcceptableLatency,@@Intent
		while @@FETCH_STATUS = 0
		begin
		
			declare @localized_string_Assigned as nvarchar(128)
			set @localized_string_Assigned = N'Assigned'
			exec TDDS_RecordSessionManagerHeartBeat @@SourceID, @ServiceID,null,null,null,null,0,@localized_string_Assigned
			fetch next from ResultCursor into @@SourceID, @@Srcconstr, @@DestID, @@Destconstr, @@StreamType, @@AcceptableLatency, @@Intent
		end
		close ResultCursor
		DEALLOCATE ResultCursor

	end
	else if (@@AdviceResult<0)
	begin
		declare @@tmpval2 int
		set @@tmpval2 =  @@AdviceResult * (-1)
		SET ROWCOUNT  @@tmpval2
		
		select #ActiveServiceSessions.SourceID, '-1' as 'Intent' into #DropTable
		from #ActiveServiceSessions
		SET ROWCOUNT 0
		delete from TDDS_Heartbeats
		where (TDDS_Heartbeats.SourceID in (select distinct #DropTable.SourceID from #DropTable))And
		      (TDDS_Heartbeats.ServiceID = @ServiceID)
					


	end



	declare @localized_string_AdviceRet as nvarchar(512)
	declare @localized_string_SessionsReturned as nvarchar(256)
	declare @string_TDDSAdviceEnd as nvarchar(1024)
	declare @tempString1 as nvarchar(1024)
	declare @tempString2 as nvarchar(1024)

	set @localized_string_AdviceRet = N'TDDS_AdviceSessions Exit, AdviceResult= ' 
	set @localized_string_SessionsReturned  = N', Sessions Returned = '

	if (@@AdviceResult>0)
	begin

		insert into #StartTable
		( #StartTable.SourceID,#StartTable.SrcConnstr,#StartTable.DestinationID,#StartTable.DestConnstr,#StartTable.StreamType,#StartTable.AcceptableLatency, #StartTable.Intent)
		select #DisabledRunningSources.SourceID, '',NEWID ( ),'','',1 , #DisabledRunningSources.Intent from #DisabledRunningSources

		select @@SessionRet=Count(*) from #StartTable
		set @tempString1  = @localized_string_AdviceRet +cast (@@AdviceResult as nvarchar(30))
		set @tempString2  = @localized_string_SessionsReturned +cast (@@SessionRet as nvarchar(30))
		set @string_TDDSAdviceEnd = @tempString1 +  @tempString2

		exec TDDS_RecordSessionManagerHeartBeat null, @ServiceID,null,null,null,null,0, @string_TDDSAdviceEnd
		exec sp_releaseapplock N'TDDS_AdviceSessions', N'Transaction'
		select * from #StartTable

	end
	else if (@@AdviceResult<0)
	begin
		insert into #DropTable
		( #DropTable.SourceID, #DropTable.Intent)
		select #DisabledRunningSources.SourceID, #DisabledRunningSources.Intent from #DisabledRunningSources

		select  @@SessionRet=Count(*) from #DropTable
		set @tempString1  = @localized_string_AdviceRet +cast (@@AdviceResult as nvarchar(30))
		set @tempString2  = @localized_string_SessionsReturned +cast (@@SessionRet as nvarchar(30))
		set @string_TDDSAdviceEnd = @tempString1 +  @tempString2


		exec TDDS_RecordSessionManagerHeartBeat null, @ServiceID,null,null,null,null,0, @string_TDDSAdviceEnd
		exec sp_releaseapplock N'TDDS_AdviceSessions', N'Transaction'
		select  * from #DropTable
	end
	else
	begin
		select  @@SessionRet=Count(*) from #DisabledRunningSources
		set @tempString1  = @localized_string_AdviceRet +cast (@@AdviceResult as nvarchar(30))
		set @tempString2  = @localized_string_SessionsReturned +cast (@@SessionRet as nvarchar(30))
		set @string_TDDSAdviceEnd = @tempString1 +  @tempString2
		exec TDDS_RecordSessionManagerHeartBeat null, @ServiceID,null,null,null,null,0, @string_TDDSAdviceEnd
		exec sp_releaseapplock N'TDDS_AdviceSessions', N'Transaction'
		select * from #DisabledRunningSources
	end
	COMMIT TRANSACTION			

end
go

GRANT EXECUTE ON [dbo].[TDDS_AdviceSessions] TO BAM_CONFIG_READER
GO

create procedure [dbo].[TDDS_GetServiceRefreshInterval]
as
begin
	select TDDS_Settings.RefreshInterval 
	from TDDS_Settings 
end
GO

GRANT EXECUTE ON [dbo].[TDDS_GetServiceRefreshInterval] TO BAM_CONFIG_READER
GO
create procedure [dbo].[TDDS_GetSettings]
as
begin
	select * 
	from TDDS_Settings 
end
GO
GRANT EXECUTE ON [dbo].[TDDS_GetSettings] TO BAM_CONFIG_READER
GO

create procedure [dbo].[TDDS_UpdateSettings]
(
 	@RefreshInterval int ,
	@SqlCommandTimeout int ,
	@SessionTimeout int ,
	@EventLoggingInterval nvarchar(16),
	@RetryCount int ,
	@ThreadPerSession int 
)
as
begin

	if (@ThreadPerSession<=0)
	begin
		declare @localized_string_error61110 as nvarchar(128)
		set @localized_string_error61110 = N'Threads per session has to be set to a value grater than 0'
		raiserror(@localized_string_error61110, 16, 1)
		return 61110

	end
	if (@RefreshInterval<60)
	begin
		declare @localized_string_error61120 as nvarchar(128)
		set @localized_string_error61120 = N'Refresh interval must be greater than or equal to 60'
		raiserror(@localized_string_error61120, 16, 1)
		return 61120

	end

	if ((@SqlCommandTimeout <@RefreshInterval) And (@SessionTimeout >2*@RefreshInterval))
	begin
		UPDATE TDDS_Settings
		set @RefreshInterval=@RefreshInterval,@SqlCommandTimeout=@SqlCommandTimeout,
		  @SessionTimeout=@SessionTimeout,@EventLoggingInterval=@EventLoggingInterval,
		  @RetryCount=@RetryCount, @ThreadPerSession=@ThreadPerSession
		
	end
	else
	begin
		declare @localized_string_error61130 as nvarchar(128)
		set @localized_string_error61130 = N'The following condition has not been satisfied:(SqlCommandTimeout < RefreshInterval) And (SessionTimeout > 2 * RefreshInterval) '
		raiserror(@localized_string_error61130, 16, 1)
		return 61130

	end
	return 0
end
GO
GRANT EXECUTE ON [dbo].[TDDS_UpdateSettings] TO BTS_ADMIN_USERS
GO

