--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

if not exists (select * from sysusers where name = N'BAM_EVENT_WRITER' and issqlrole = 1)
EXEC sp_addrole N'BAM_EVENT_WRITER'
GO

if not exists (select * from sysusers where name = N'BTS_BACKUP_USERS' and issqlrole = 1)
EXEC sp_addrole N'BTS_BACKUP_USERS'
GO

if (OBJECT_ID('[dbo].[TDDS_FailedTrackingData]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_FailedTrackingData]'), N'IsUserTable') =1)
DROP TABLE [dbo].[TDDS_FailedTrackingData]
GO

if (OBJECT_ID('[dbo].[TDDS_StreamStatus]') IS NOT NULL) AND (OBJECTPROPERTY(OBJECT_ID('[dbo].[TDDS_StreamStatus]'), N'IsUserTable') =1)
DROP TABLE [dbo].[TDDS_StreamStatus]
GO


CREATE TABLE [dbo].[TDDS_FailedTrackingData]
(
	[SeqNum]		[bigint]		identity(1,1)	NOT NULL,
	[Source]		[nvarchar](256)		NOT NULL,
	[FormatID]		[uniqueidentifier]	NOT NULL,
	[dtLogTime]		[datetime]		NOT NULL,
	[DestinatioNID]		[tinyint]		NOT NULL,
	[ErrMessage]		[ntext]			NOT NULL,
	[DataImage]		[image]			NOT NULL

	CONSTRAINT FailedTrackingData_Unique_Key	primary key(SeqNum)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[TDDS_StreamStatus]
(
	[serverName]    [nvarchar](128) NOT NULL,
	[destinationId] [tinyint] NOT NULL,
	[partitionId]   [tinyint] NOT NULL,
	[lastSeqNum]    [bigint] NOT NULL,
	[eventIdx]      [int] NULL,
 CONSTRAINT [streamstatus_unique_key] PRIMARY KEY ([serverName], [destinationId], [partitionId])
) ON [PRIMARY]
GO
	

