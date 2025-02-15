--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

if (OBJECT_ID('[dbo].[TDDS_HeartBeats]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_HeartBeats]'), N'IsUserTable') =1)
DROP TABLE [dbo].[TDDS_HeartBeats]
GO

if (OBJECT_ID('[dbo].[TDDS_Services]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_Services]'), N'IsUserTable') =1)
DROP TABLE [dbo].[TDDS_Services]
GO

if (OBJECT_ID('[dbo].[TDDS_Sources]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_Sources]'), N'IsUserTable') =1)
DROP TABLE [dbo].[TDDS_Sources]
GO

if (OBJECT_ID('[dbo].[TDDS_Destinations]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_Destinations]'), N'IsUserTable') =1)
DROP TABLE [dbo].[TDDS_Destinations]
GO

if (OBJECT_ID('[dbo].[TDDS_CustomFormats]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_CustomFormats]'), N'IsUserTable') =1)
DROP TABLE [dbo].[TDDS_CustomFormats]
GO

if (OBJECT_ID('[dbo].[TDDS_Settings]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_Settings]'), N'IsUserTable') =1)
DROP TABLE [dbo].[TDDS_Settings]
GO


create table TDDS_Settings
(
	RefreshInterval int null,
	SqlCommandTimeout int,
	SessionTimeout int,
	EventLoggingInterval nvarchar(16),
	RetryCount int,
	ThreadPerSession int	
)
Go

ALTER TABLE TDDS_Settings ADD CONSTRAINT chk_RefreshInterval CHECK (RefreshInterval>=60)
ALTER TABLE TDDS_Settings ADD CONSTRAINT chk_Sqltimeout CHECK (SqlCommandTimeout<RefreshInterval)
ALTER TABLE TDDS_Settings ADD CONSTRAINT chk_Sessiontimeout CHECK (SessionTimeout> 2* RefreshInterval)
GO



create table TDDS_Destinations
(	
	DestinationID uniqueidentifier primary key,
	DestinationName nvarchar(256),
	ConnectionString nvarchar(1024) not null
)
GO

create table TDDS_Sources
(
	SourceID uniqueidentifier primary key,
	DestinationID uniqueidentifier references TDDS_Destinations(DestinationID),
	SourceName nvarchar(256),
	ConnectionString nvarchar(1024) not null,
	StreamType int, -- 0 is for BI data, 1 for HM
	--DataExtractionSp nvarchar(256) not null,
	AcceptableLatency int null,
	Enabled bit DEFAULT 1
)
GO

create table TDDS_Services
(
	ServiceID uniqueidentifier primary key,
	ServerName nvarchar(32) not null
)
GO

create table TDDS_Heartbeats
(
	ServiceID uniqueidentifier references TDDS_Services(ServiceID) on update no action on delete cascade,
	SourceID uniqueidentifier,
	Age	int IDENTITY (1, 1) NOT NULL, 
	TimeLastChanged	DateTime,
	RecordsProcessed int null,
	Latency float null,
	EventsProcessed int null,
	RecordsLeft int null,
	ErrorCode int null,
	ErrorDescription nvarchar(1024) 
)
GO

CREATE  CLUSTERED  INDEX TDDS_HeartBeatClusteredIndex ON TDDS_Heartbeats(ServiceID, SourceID) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX   TDDS_HeartBeatNonClusteredIndex ON TDDS_Heartbeats(Age) ON [PRIMARY]
GO

create table TDDS_CustomFormats
(
	FormatID uniqueidentifier primary key,
	DecoderClass	nvarchar(256) not null,
	DllName	nvarchar(1024) not null
)
GO

insert TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values ('{00000000-0000-0000-0000-000000000000}', 'Microsoft.BizTalk.Bam.EventBus.DotNetDeserializer','Microsoft.BizTalk.Bam.EventBus.dll')
GO


insert TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values ('{D90B63BA-3EEB-4E8A-A20E-7BE683319552}', 'Microsoft.BizTalk.Tracking.Deserializer.MessagingDeserializer','Microsoft.BizTalk.TrackingService.dll')
GO

insert TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values ('{D1A805A2-B1B5-42BC-A29F-D128131DDCD0}', 'Microsoft.BizTalk.Tracking.Deserializer.AgentDeserializer', 'Microsoft.BizTalk.TrackingService.dll')
GO

insert TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values ('{1E83A7DC-435E-49DF-BA83-F09CA50DFBE7}', 'Microsoft.BizTalk.Tracking.Deserializer.HmDeserializer', 'Microsoft.BizTalk.TrackingService.dll')
GO

insert TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values ('{58E2AB42-51EB-441D-9C93-8795982336B8}', 'Microsoft.BizTalk.Bam.EventBus.DotNetDeserializer', 'Microsoft.BizTalk.Bam.EventBus.dll')
GO

insert TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values ('{35487FD8-1B14-462F-9A84-673B6C397656}', 'Microsoft.BizTalk.Bam.EventBus.DotNetDeserializer', 'Microsoft.BizTalk.Bam.EventBus.dll')
GO

insert TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values ('{d3bffaf9-8291-4b82-9052-707aecab84a3}', 'Microsoft.BizTalk.Bam.EventBus.DotNetDeserializer', 'Microsoft.BizTalk.Bam.EventBus.dll')
GO
	
insert TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values ('{f3179eda-0da5-4f5f-818e-d231c85a52a9}', 'Microsoft.BizTalk.Tracking.Deserializer.BamMessagingDeserializer', 'Microsoft.BizTalk.TrackingService.dll')
GO

insert into TDDS_CustomFormats
(FormatID,DecoderClass,DllName) 
values (N'{1a6c57f0-3826-4254-9a91-9813a4cf2fce}', N'Microsoft.BizTalk.Bam.EventBus.DotNetDeserializer', N'Microsoft.BizTalk.Bam.EventBus.dll')
GO

insert TDDS_Settings (RefreshInterval,SqlCommandTimeout,SessionTimeout,EventLoggingInterval,RetryCount,ThreadPerSession) 
		      values(140,120,300,N'00:00:30',10,4)
GO

