IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SouthridgeVideoHistory')
	DROP DATABASE [SouthridgeVideoHistory]
GO

CREATE DATABASE [SouthridgeVideoHistory]
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

exec sp_dboption N'SouthridgeVideoHistory', N'autoclose', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'bulkcopy', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'trunc. log', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'torn page detection', N'true'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'read only', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'dbo use', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'single', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'autoshrink', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'ANSI null default', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'recursive triggers', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'ANSI nulls', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'concat null yields null', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'cursor close on commit', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'default to local cursor', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'quoted identifier', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'ANSI warnings', N'false'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'auto create statistics', N'true'
GO

exec sp_dboption N'SouthridgeVideoHistory', N'auto update statistics', N'true'
GO

use [SouthridgeVideoHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OrderLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OrderLog]
GO

CREATE TABLE [dbo].[OrderLog] (
	[RequestID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[RequestType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[OrderTime] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[OrderType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[OrderNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CustNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[SeqNumber] [int] NOT NULL ,
	[OrderDetails] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrderStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[OriginalMsg] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE Clustered Index OrderIndex ON OrderLog(OrderNumber, CustNumber, SeqNumber)
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.UpdateStatus
@orderID nvarchar(50),
@custID nvarchar(50),
@seqNum int,
@status nvarchar(50)
 AS
Set transaction isolation level READ COMMITTED
Update OrderLog
Set OrderStatus = @status
Where OrderNumber = @orderID AND CustNumber = @custID AND SeqNumber = @seqNum

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

