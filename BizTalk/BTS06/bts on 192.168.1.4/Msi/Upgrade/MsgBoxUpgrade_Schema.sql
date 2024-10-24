--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

--/ Upgrade for mgsbox.
set nocount on

--/ QFE 976

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Spool1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	
	IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_Tracking_Spool1')
	BEGIN
		DROP INDEX [Tracking_Spool1].[IX_Tracking_Spool1]
		CREATE NONCLUSTERED INDEX [IX_Tracking_Spool1] ON [dbo].[Tracking_Spool1]([uidMsgID])
		CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool1] ON [dbo].[Tracking_Spool1]([dtTimeStamp], [uidMsgID])
	END
END

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tracking_Spool2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_Tracking_Spool2')
	BEGIN
		DROP INDEX [Tracking_Spool2].[IX_Tracking_Spool2]
		CREATE NONCLUSTERED INDEX [IX_Tracking_Spool2] ON [dbo].[Tracking_Spool2]([uidMsgID])
		CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool2] ON [dbo].[Tracking_Spool2]([dtTimeStamp], [uidMsgID])
	END
	
END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessage' AND type = 'TR')
   DROP TRIGGER bts_TrackMessage
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessageParts1' AND type = 'TR')
   DROP TRIGGER bts_TrackMessageParts1
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessageParts2' AND type = 'TR')
   DROP TRIGGER bts_TrackMessageParts2
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessageFragments1' AND type = 'TR')
   DROP TRIGGER bts_TrackMessageFragments1
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_TrackMessageFragments2' AND type = 'TR')
   DROP TRIGGER bts_TrackMessageFragments2
GO

ALTER TABLE Tracking_Spool1 ALTER COLUMN uidBodyPartID uniqueidentifier NULL
GO

ALTER TABLE Tracking_Spool2 ALTER COLUMN uidBodyPartID uniqueidentifier NULL
GO


IF (SELECT COUNT(*) FROM Spool WHERE uidMessageID = N'61EAA7FC-AC85-42d9-BF3E-1BED258B82BE') = 0
BEGIN
    INSERT INTO Spool (uidMessageID, nNumParts, nCounter, imgContext) VALUES (N'61EAA7FC-AC85-42d9-BF3E-1BED258B82BE', 0, 0, 0xD4E0906C1849D311A24200C04F60A53302000000090000009800000050006100720074004E0061006D00650073005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F006D006500730073006100670065006100670065006E0074002D00700072006F007000650072007400690065007300000001000000010820010000000000000000000700000098000000540069006D0065007200490044005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F0078006C0061006E00670073002D00720075006E00740069006D0065002D00700072006F0070006500720074006900650073000000010000000008004A000000300030003000300030003000300030002D0030003000300030002D0030003000300030002D0030003000300030002D003000300030003000300030003000300030003000300030000000)
    INSERT INTO MessageRefCountLogTotals (uidMessageID, snRefCount) VALUES (N'61EAA7FC-AC85-42d9-BF3E-1BED258B82BE', 1)
END
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PredicateGroupZeroSum1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	IF NOT EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'CIX_PredicateGroupZeroSum1')
	BEGIN
		CREATE CLUSTERED INDEX [CIX_PredicateGroupZeroSum1] ON [dbo].[PredicateGroupZeroSum1]([uidPredicateANDGroupID]) 
	END
END
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PredicateGroupZeroSum2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	IF NOT EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'CIX_PredicateGroupZeroSum2')
	BEGIN
		CREATE CLUSTERED INDEX [CIX_PredicateGroupZeroSum2] ON [dbo].[PredicateGroupZeroSum2]([uidPredicateANDGroupID]) 
	END
END
GO


-- Grant perms to BTS_Operators for selection on the queues as this is needed for OpsOM
declare @nvcApplicationName nvarchar(128)
declare @SuspendedQName nvarchar(128)

declare curse cursor for	
SELECT nvcApplicationName FROM Applications

open curse

FETCH NEXT FROM curse INTO @nvcApplicationName
WHILE (@@FETCH_STATUS = 0)
BEGIN

		exec ( 'GRANT SELECT ON [' + @nvcApplicationName + 'Q] TO BTS_ADMIN_USERS')
		exec ( 'GRANT SELECT ON [' + @nvcApplicationName + 'Q_Scheduled] TO BTS_ADMIN_USERS')
		exec ( 'GRANT SELECT ON [' + @nvcApplicationName + 'Q_Suspended] TO BTS_ADMIN_USERS')
		exec ( 'GRANT SELECT ON [InstanceStateMessageReferences_' + @nvcApplicationName + '] TO BTS_ADMIN_USERS')

		exec ( 'GRANT SELECT ON [' + @nvcApplicationName + 'Q] TO BTS_OPERATORS')
		--exec ( 'GRANT SELECT ON [' + @nvcApplicationName + 'Q_Scheduled] TO BTS_OPERATORS')
		exec ( 'GRANT SELECT ON [' + @nvcApplicationName + 'Q_Suspended] TO BTS_OPERATORS')
		exec ( 'GRANT SELECT ON [InstanceStateMessageReferences_' + @nvcApplicationName + '] TO BTS_OPERATORS')

		--lets add the dequeue related table changes into this loop
		exec('IF EXISTS (SELECT name FROM sysindexes WHERE name = ''CIX_' + @nvcApplicationName + 'Q'')
		      BEGIN
			DROP INDEX [' + @nvcApplicationName + 'Q].[CIX_' + @nvcApplicationName + 'Q]
		      END')

		exec('IF EXISTS (SELECT name FROM sysindexes WHERE name = ''IX_' + @nvcApplicationName + 'Q'')
		      BEGIN
			DROP INDEX [' + @nvcApplicationName + 'Q].[IX_' + @nvcApplicationName + 'Q]
		      END')

		exec('IF EXISTS (SELECT name FROM sysindexes WHERE name = ''IX_' + @nvcApplicationName + 'Q_2'')
		      BEGIN
			DROP INDEX [' + @nvcApplicationName + 'Q].[IX_' + @nvcApplicationName + 'Q_2]
		      END')

		exec('IF EXISTS (SELECT name FROM sysindexes WHERE name = ''IX_' + @nvcApplicationName + 'Q_ServiceID'')
		      BEGIN
			DROP INDEX [' + @nvcApplicationName + 'Q].[IX_' + @nvcApplicationName + 'Q_ServiceID]
		      END')

		exec('IF EXISTS (SELECT name FROM sysindexes WHERE name = ''IX_' + @nvcApplicationName + 'Q_ProcessID'')
		      BEGIN
			DROP INDEX [' + @nvcApplicationName + 'Q].[IX_' + @nvcApplicationName + 'Q_ProcessID]
		      END')

		set @SuspendedQName = @nvcApplicationName + 'Q_Suspended'
		exec('IF EXISTS (SELECT name FROM sysindexes WHERE name = ''IX_' + @SuspendedQName + ''')
		      BEGIN
			DROP INDEX [' + @SuspendedQName + '].[IX_' + @SuspendedQName + ']
		      END')

		exec('CREATE  INDEX [IX_' + @SuspendedQName + '] ON [dbo].[' + @SuspendedQName + ']([uidInstanceID], [uidServiceID], [nIsResumable], [uidSubscriptionID], [uidWorkID])')
		
		exec('IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = ''IX_' + @SuspendedQName + '_Ops'')
		      BEGIN
			CREATE INDEX [IX_' + @SuspendedQName + '_Ops] ON [dbo].[' + @SuspendedQName + '] ([uidClassID], [nIsResumable])
		      END')

		--drop the batchid column
		exec('IF EXISTS (select name from syscolumns WHERE name = ''uidBatchID'' AND id = object_id(''' + @nvcApplicationName + 'Q'') )
		      BEGIN
			ALTER TABLE [dbo].[' + @nvcApplicationName + 'Q] DROP COLUMN uidBatchID
		      END')

		exec('CREATE  UNIQUE  INDEX [CIX_' + @nvcApplicationName + 'Q] ON [dbo].[' + @nvcApplicationName + 'Q]([uidInstanceID], [uidWorkID], [uidMessageID]) ')

		exec('CREATE  UNIQUE  CLUSTERED INDEX [IX_' + @nvcApplicationName + 'Q] ON [dbo].[' + @nvcApplicationName + 'Q]([uidClassID], [fOrderedDelivery], [snPriority], [dtLastTouched], [nID])')

		--we are going to create a table used by dequeue to store the list of messages which are being dequeued by a given batch. This eliminates an index for us
		exec('if exists (select * from sysobjects where id = object_id(N''[dbo].[' + @nvcApplicationName + '_DequeueBatches]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) drop table [dbo].[' + @nvcApplicationName + '_DequeueBatches]')
		exec('CREATE TABLE [dbo].[' + @nvcApplicationName + '_DequeueBatches] (
			[uidBatchID] [uniqueidentifier] NOT NULL ,
			[uidClassID] [uniqueidentifier] NOT NULL ,
			[fOrderedDelivery] [int] NOT NULL,
			[snPriority] [smallint] NOT NULL,
			[dtLastTouched] [datetime] NOT NULL,
			[nID] [bigint]
      		)')

		exec('CREATE UNIQUE CLUSTERED  INDEX [CIX_' + @nvcApplicationName + '_DequeueBatches] ON [dbo].[' + @nvcApplicationName + '_DequeueBatches]([uidBatchID], [nID]) ')

		-- For Send Port Ordered Delivery support
		-- Add nID to Suspended Q and the corresponding index
		IF NOT EXISTS (select name from syscolumns WHERE name = 'nID' AND id = object_id(@SuspendedQName) )
		BEGIN
			exec ('ALTER TABLE [dbo].[' + @SuspendedQName + '] ADD [nID] [bigint] IDENTITY(0,1) ')
			exec ('CREATE  INDEX [IX_' + @SuspendedQName + '_2] ON [dbo].[' + @SuspendedQName + ']([dtLastTouched], [nID]) ')
			exec ('UPDATE [dbo].[' + @SuspendedQName + '] SET nvcErrorID = ''0xC0C01B4e'' WHERE nvcErrorID = ''-8''')
			exec ('UPDATE [dbo].[' + @SuspendedQName + '] SET nvcErrorID = ''0xC0C01B4D'' WHERE nvcErrorID = ''-1''')
		END

		exec ('ALTER TABLE [dbo].[' + @SuspendedQName + '] ALTER COLUMN nvcAdditionalInfo nvarchar(1024)')
		
		--QFE 1251
		exec ('DELETE FROM [dbo].[' + @nvcApplicationName + 'Q] WHERE uidClassID = ''{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'' AND uidServiceID = ''{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'' AND uidInstanceID NOT IN (SELECT uidInstanceID FROM Instances WHERE uidClassID = ''{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'')')
		exec ('DELETE FROM [dbo].[' + @SuspendedQName + '] WHERE uidClassID = ''{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'' AND uidServiceID = ''{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'' AND uidInstanceID NOT IN (SELECT uidInstanceID FROM Instances WHERE uidClassID = ''{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'')')

		IF NOT EXISTS (select * from sysobjects where id = object_id(N'[dbo].[' + @nvcApplicationName + N'_MessageRefCountLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN
		exec('CREATE TABLE [dbo].[' + @nvcApplicationName + '_MessageRefCountLog] (
			[uidInstanceID] [uniqueidentifier] NOT NULL ,
			[uidMessageID] [uniqueidentifier] NOT NULL ,
			[nRefCount] [int] NOT NULL
		      )')

		exec('CREATE UNIQUE CLUSTERED  INDEX [CIX_' + @nvcApplicationName + '_MessageRefCountLog] ON [dbo].[' + @nvcApplicationName + '_MessageRefCountLog]([uidInstanceID], [uidMessageID]) ')
		END

		--lets disable page locks on all app specific tables
		exec('EXEC sp_indexoption ''[dbo].[' + @nvcApplicationName + 'Q]'', ''disallowpagelocks'', TRUE ')
		exec('EXEC sp_indexoption ''[dbo].[' + @nvcApplicationName + '_DequeueBatches]'', ''disallowpagelocks'', TRUE ')
		exec('EXEC sp_indexoption ''[dbo].[' + @nvcApplicationName + '_MessageRefCountLog]'', ''disallowpagelocks'', TRUE ')
		exec('EXEC sp_indexoption ''[dbo].[' + @nvcApplicationName + 'Q_Scheduled]'', ''disallowpagelocks'', TRUE ')
		exec('EXEC sp_indexoption ''[dbo].[' + @nvcApplicationName + 'Q_Suspended]'', ''disallowpagelocks'', TRUE ')
		exec('EXEC sp_indexoption ''[dbo].[DynamicStateInfo_' + @nvcApplicationName + ']'', ''disallowpagelocks'', TRUE ')
		exec('EXEC sp_indexoption ''[dbo].[InstanceStateMessageReferences_' + @nvcApplicationName + ']'', ''disallowpagelocks'', TRUE ')


		FETCH NEXT FROM curse INTO @nvcApplicationName
END
close curse
deallocate curse

GO

--QFE 1251
declare @nvcAppName nvarchar(128),
	@uidSubID uniqueidentifier,
	@uidDBOwnerID uniqueidentifier,
	@ret int

declare curse cursor FOR
SELECT nvcApplicationName, uidSubID
FROM Subscription
WHERE uidClassID = '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}' AND
      uidServiceID = '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}' AND
      uidInstanceID NOT IN (SELECT uidInstanceID FROM Instances WHERE uidClassID = '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}')

open curse
FETCH NEXT FROM curse INTO @nvcAppName, @uidSubID
WHILE (@@FETCH_STATUS = 0)
BEGIN 
	declare @sproc nvarchar(500)
	set @sproc = 'int_AlterSubscription_' + @nvcAppName

	BEGIN TRANSACTION

	exec @sproc 4, @uidSubID, null, @uidDBOwnerID OUTPUT, @ret OUTPUT

	COMMIT TRANSACTION
	
	FETCH NEXT FROM curse INTO @nvcAppName, @uidSubID
END
close curse
deallocate curse

DELETE FROM Subscription
WHERE uidClassID = '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}' AND
      uidServiceID = '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}' AND
      uidInstanceID NOT IN (SELECT uidInstanceID FROM Instances WHERE uidClassID = '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}')
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_TrackingMessageReferences')
BEGIN
	DROP INDEX [TrackingMessageReferences].[CIX_TrackingMessageReferences]
END
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_TrackingMessageReferences')
BEGIN
	DROP INDEX [TrackingMessageReferences].[IX_TrackingMessageReferences]
END
GO

CREATE  UNIQUE CLUSTERED  INDEX [CIX_TrackingMessageReferences] ON [dbo].[TrackingMessageReferences]([uidMessageID]) WITH IGNORE_DUP_KEY
GO

CREATE  UNIQUE NONCLUSTERED  INDEX [IX_TrackingMessageReferences] ON [dbo].[TrackingMessageReferences]([nID], [uidMessageID])
GO


--Lets create an internal convoy set for all other messaging ordered delivery ports.
--we convoy on the sendport transport id
IF NOT EXISTS (SELECT uidConvoySetID FROM ConvoySets WHERE uidConvoySetID = '{59F295B0-3123-416E-966B-A2C6D65FF8E6}')
BEGIN
	INSERT INTO ConvoySets (uidConvoySetID, nvcConvoySetName, uidServiceID, uidPropertyID1) VALUES ('{59F295B0-3123-416E-966B-A2C6D65FF8E6}', 'MessagingConvoySet', '{54ABE27C-1768-469B-8088-5765CD0F8EC2}', '{A2DB8C35-EF73-4C89-9866-5661E330CCE4}')
END
GO

--new control messages
-- Inserting Suspend Control message
IF NOT EXISTS (SELECT uidMessageID FROM Spool WHERE uidMessageID = N'2BE3D5B8-5685-40F2-BD97-51ADA3D02347')
BEGIN
	INSERT INTO Spool (uidMessageID, nNumParts, nCounter, imgContext) VALUES (N'2BE3D5B8-5685-40F2-BD97-51ADA3D02347', 0, 0, 0xD4E0906C1849D311A24200C04F60A53303000000000000001E000000420069007A00540061006C006B0043006F006E00740072006F006C000000020000000008002A000000410064006D0069006E00530075007300700065006E00640049006E007300740061006E00630065000000000000000C0000004A006F006200490044000000020000000008004E0000007B00340037004100450033003300380034002D0031003000410041002D0034003400430033002D0038003200350036002D003200350033003400380045004200390032004200320031007D000000090000009800000050006100720074004E0061006D00650073005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F006D006500730073006100670065006100670065006E0074002D00700072006F00700065007200740069006500730000000100000001082001000000000000000000)
END
IF NOT EXISTS (SELECT uidMessageID FROM MessageRefCountLogTotals WHERE uidMessageID = N'2BE3D5B8-5685-40F2-BD97-51ADA3D02347')
BEGIN
	INSERT INTO MessageRefCountLogTotals (uidMessageID, snRefCount) VALUES (N'2BE3D5B8-5685-40F2-BD97-51ADA3D02347', 1)
END

-- Inserting Terminate Control message
IF NOT EXISTS (SELECT uidMessageID FROM Spool WHERE uidMessageID = N'57E5E753-0207-435D-8BE7-2B9F3C6556F9')
BEGIN
	INSERT INTO Spool (uidMessageID, nNumParts, nCounter, imgContext) VALUES (N'57E5E753-0207-435D-8BE7-2B9F3C6556F9', 0, 0, 0xD4E0906C1849D311A24200C04F60A53303000000000000001E000000420069007A00540061006C006B0043006F006E00740072006F006C000000020000000008002E000000410064006D0069006E005400650072006D0069006E0061007400650049006E007300740061006E00630065000000000000000C0000004A006F006200490044000000020000000008004E0000007B00350032003500390031004600310031002D0046003700370034002D0034003600330038002D0042004300390041002D003200380034003800380034003600300034003500450032007D000000090000009800000050006100720074004E0061006D00650073005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F006D006500730073006100670065006100670065006E0074002D00700072006F00700065007200740069006500730000000100000001082001000000000000000000)
END
IF NOT EXISTS (SELECT uidMessageID FROM MessageRefCountLogTotals WHERE uidMessageID = N'57E5E753-0207-435D-8BE7-2B9F3C6556F9')
BEGIN
	INSERT INTO MessageRefCountLogTotals (uidMessageID, snRefCount) VALUES (N'57E5E753-0207-435D-8BE7-2B9F3C6556F9', 1)
END

--Inserting Resume in Debug Mode message
IF NOT EXISTS (SELECT uidMessageID FROM Spool WHERE uidMessageID = N'50D173AF-5D6F-4D5F-AE23-1A7178CEBDC3')
BEGIN
	INSERT INTO Spool (uidMessageID, nNumParts, nCounter, imgContext) VALUES (N'50D173AF-5D6F-4D5F-AE23-1A7178CEBDC3', 0, 0, 0xD4E0906C1849D311A24200C04F60A53303000000000000001E000000420069007A00540061006C006B0043006F006E00740072006F006C0000000200000000080026000000410064006D0069006E004400650062007500670049006E007300740061006E00630065000000000000000C0000004A006F006200490044000000020000000008004E0000007B00330032003800330030004500450045002D0035004400330041002D0034003700370037002D0041003200440035002D003100320033004100450035004600340044004500420039007D000000090000009800000050006100720074004E0061006D00650073005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F006D006500730073006100670065006100670065006E0074002D00700072006F00700065007200740069006500730000000100000001082001000000000000000000)
END
IF NOT EXISTS (SELECT uidMessageID FROM MessageRefCountLogTotals WHERE uidMessageID = N'50D173AF-5D6F-4D5F-AE23-1A7178CEBDC3')
BEGIN
	INSERT INTO MessageRefCountLogTotals (uidMessageID, snRefCount) VALUES (N'50D173AF-5D6F-4D5F-AE23-1A7178CEBDC3', 1)
END


---------------------------------------
-- Create/Update [dbo].[ServiceClasses]
---------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[ServiceClasses]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [dbo].[ServiceClasses] (
		[nID] 		[bigint] identity(0,1)  NOT NULL, 
		[nvcName] 	[nvarchar] (256) 	NOT NULL,
		[uidServiceClassID] [uniqueidentifier]	NOT NULL,
		[fAttributes]	[bigint]		NOT NULL DEFAULT (0) --properties of the service class
	)

	--Attributes flags are used by the messagebox to figure out what is and is not supported by this service class.
	-- 0x1  This service class supports consuming control messages. 
	INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'Messaging InProcess', '{59F295B0-3123-416E-966B-A2C6D65FF8E6}', 1)
	INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'Orchestration', '{226FC6B9-0416-47A4-A8E8-4721F1DB1A1B}', 1)
	INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'MSMQt', '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}', 0)
	INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'Messaging Isolated Host', '{683AEDF1-027D-4006-AE9A-443D1A5746FC}', 0)
	INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'Cache', '{BB3A1470-F5C4-47C3-B71F-EAABC260FBD0}', 0)
END
GO

EXEC sp_indexoption '[dbo].[ServiceClasses]', 'disallowpagelocks', TRUE
GO

--------------------------------
-- Create/Update [dbo].[Modules]
--------------------------------
--This table is a way of grouping a set of related services together. In the UI these are called applications
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Modules]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [dbo].[Modules] (
		[nModuleID] [int] identity(0,1)  NOT NULL, 
		[nvcName] [nvarchar] (256) NOT NULL,
		[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetUTCDate())
	)
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_Modules')
BEGIN
	DROP INDEX [Modules].[CIX_Modules]
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_Modules')
BEGIN
	DROP INDEX [Modules].[IX_Modules]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Modules] ON [dbo].[Modules]( [nModuleID] )
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Modules] ON [dbo].[Modules]( [nvcName] )  WITH IGNORE_DUP_KEY
GO

GRANT SELECT ON [Modules] TO BTS_ADMIN_USERS
GRANT SELECT ON [Modules] TO BTS_OPERATORS
GO

EXEC sp_indexoption '[dbo].[Modules]', 'disallowpagelocks', TRUE
GO
-----------------------------------------------------------------------------------------------------
---------------------------------
-- Create/Update [dbo].[Services]
---------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Services]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [dbo].[Services] (
		[uidServiceID] [uniqueidentifier] NOT NULL,
		[uidServiceClassID] [uniqueidentifier] NULL,
		[nModuleID] [int] NULL,
		[fAttributes] [bigint] NOT NULL DEFAULT(0)
	)
END
ELSE
BEGIN
	DROP INDEX [Services].[CIX_Services]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Services] ON [dbo].[Services]( [uidServiceID] )
GRANT SELECT ON [Services] TO BTS_ADMIN_USERS
GRANT SELECT ON [Services] TO BTS_OPERATORS
GO

EXEC sp_indexoption '[dbo].[Services]', 'disallowpagelocks', TRUE
GO

-----------------------------------------------------------------------------------------------------
-------------------------------------------
-- Create/Update [dbo].[InstancesSuspended]
-------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InstancesSuspended]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	CREATE TABLE [dbo].[InstancesSuspended] (
		[uidAppOwnerID] [uniqueidentifier] NOT NULL,
		[uidInstanceID] [uniqueidentifier] NOT NULL,
		[uidServiceID] [uniqueidentifier] NOT NULL,
		[uidClassID] [uniqueidentifier] NOT NULL,
		[dtCreated] [datetime] NOT NULL DEFAULT (GetUTCDate()),
		[nState] [smallint] NOT NULL DEFAULT (1),
		[nvcUserState] [nvarchar] (256) NULL,
		[dtSuspendTimeStamp] [datetime] NULL,
		[nvcAdapter] [nvarchar] (512) NULL,	
		[nvcURI] [nvarchar] (512) NULL,
		[nErrorCategory] [int] NULL, -- DEFAULT (0),
		[nvcErrorID] [nvarchar] (512) NULL,
		[nvcErrorDescription] [nvarchar] (1024) NULL,
		[nvcErrorProcessingServer] [nvarchar] (256) NULL

	)

	CREATE  CLUSTERED INDEX [CIX_InstancesSuspended_State] ON [dbo].[InstancesSuspended]([uidClassID], [nState])

	CREATE  NONCLUSTERED INDEX [IX_InstancesSuspended_UserState] ON [dbo].[InstancesSuspended]([nvcUserState], [dtCreated], [uidInstanceID]) 

	CREATE  UNIQUE NONCLUSTERED  INDEX [IX_InstancesSuspended_InstanceID] ON [dbo].[InstancesSuspended]([uidInstanceID],[uidAppOwnerID]) 

--CREATE  NONCLUSTERED INDEX [IX_InstancesSuspended_Process] ON [dbo].[InstancesSuspended]([uidProcessID], [uidActivationID], [uidInstanceID]) 

--CREATE  NONCLUSTERED INDEX [IX_InstancesSuspended_MBOM] ON [dbo].[InstancesSuspended]([dtCreated], [uidClassID], [uidServiceID], [uidInstanceID], [uidAppOwnerID]) 

	INSERT INTO InstancesSuspended
	SELECT i.uidAppOwnerID, i.uidInstanceID, i.uidServiceID, i.uidClassID, i.dtCreated, i.nState, i.nvcUserState, i.dtSuspendTimeStamp, NULL, NULL, i.nErrorCategory, i.nvcErrorID, i.nvcErrorDescription, i.nvcErrorProcessingServer 
	FROM Instances as i WITH (ROWLOCK)
	WHERE (i.nState = 4) OR (i.nState = 32)
END
ELSE
BEGIN
	ALTER TABLE InstancesSuspended ALTER COLUMN nvcErrorDescription nvarchar(1024) NULL

	IF EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_InstancesSuspended')
	BEGIN
		DROP INDEX [InstancesSuspended].[CIX_InstancesSuspended]
	END

	IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_InstancesSuspended_State')
	BEGIN
		DROP INDEX [InstancesSuspended].[IX_InstancesSuspended_State]
	END

	IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_InstancesSuspended_State')
	BEGIN
		CREATE CLUSTERED INDEX [CIX_InstancesSuspended_State] ON [dbo].[InstancesSuspended]([uidClassID], [nState])
	END

	IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_InstancesSuspended_InstanceID')
	BEGIN
		CREATE UNIQUE NONCLUSTERED INDEX [IX_InstancesSuspended_InstanceID] ON [dbo].[InstancesSuspended]([uidInstanceID],[uidAppOwnerID]) 
	END

	IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_InstancesSuspended_UserState')
	BEGIN
		DROP INDEX [InstancesSuspended].[IX_InstancesSuspended_UserState]
		CREATE  NONCLUSTERED INDEX [IX_InstancesSuspended_UserState] ON [dbo].[InstancesSuspended]([nvcUserState], [dtCreated], [uidInstanceID]) 
	END
END
GO

EXEC sp_indexoption '[dbo].[InstancesSuspended]', 'disallowpagelocks', TRUE
GO

-----------------------------------------------------------------------------------------------------

-- Changing indexes on InstancesPendingOperations table for the bulk ops
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstancesPendingOperations]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN

	IF NOT EXISTS (SELECT name FROM dbo.syscolumns WHERE name = 'uidAccessorID' AND id = object_id('InstancesPendingOperations'))
	BEGIN
		ALTER TABLE [dbo].[InstancesPendingOperations] ADD uidAccessorID uniqueidentifier NULL
	END

	IF NOT EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_InstancesPendingOperations_Instance')
	BEGIN
		DROP INDEX [InstancesPendingOperations].[CIX_InstancesPendingOperations]
		CREATE CLUSTERED INDEX [CIX_InstancesPendingOperations] ON [dbo].[InstancesPendingOperations]([uidAccessorID]) 
		CREATE NONCLUSTERED INDEX [IX_InstancesPendingOperations_Instance] ON [dbo].[InstancesPendingOperations]([uidInstanceID])
		CREATE NONCLUSTERED INDEX [IX_InstancesPendingOperations_AccessorInstPendingOp] ON [dbo].[InstancesPendingOperations]([uidAccessorID], [nPendingOperation])
	END
END
GO

declare @localized_string_SuspendInstanceErrorMessage nvarchar (256)
set @localized_string_SuspendInstanceErrorMessage = N'Service instance was suspended because the corresponding service (orchestration, sendport, ...) was in the stopped state. Instance can be resumed after corresponding service is started.'
DELETE FROM LocalizedErrorStrings WHERE nID = 1
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (1, @localized_string_SuspendInstanceErrorMessage)
GO

declare @localized_string_SuspendMessageErrorMessage nvarchar (256)
set @localized_string_SuspendMessageErrorMessage = N'Activation message was suspended because the corresponding service (orchestration, sendport, ...) was in the stopped state.'
DELETE FROM LocalizedErrorStrings WHERE nID = 2
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (2, @localized_string_SuspendMessageErrorMessage)
GO

--we updated the string for routing failures.
declare @localized_string_RoutingFailureErrorMessage nvarchar(256)
set @localized_string_RoutingFailureErrorMessage = N'This service instance exists to help debug routing failures for instance "%i". The context of the message associated with this instance contains all the promoted properties at the time of the routing failure.'
DELETE FROM LocalizedErrorStrings WHERE nID = 3
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (3, @localized_string_RoutingFailureErrorMessage)
GO

declare @localized_string_ZombieInstance nvarchar (256)
set @localized_string_ZombieInstance = N'The instance completed without consuming all of its messages. The instance and its unconsumed messages have been suspended.'
DELETE FROM LocalizedErrorStrings WHERE nID = 5
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (5, @localized_string_ZombieInstance)
GO


IF NOT EXISTS (select name from syscolumns WHERE name = 'nvcMessageType' AND id = object_id('Spool') )
BEGIN
	ALTER TABLE [dbo].[Spool] ADD nvcMessageType nvarchar(128) NULL 
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtValidTime' AND id = object_id('Instances') )
BEGIN
	ALTER TABLE [dbo].[Instances] ADD [dtValidTime] [datetime] NOT NULL CONSTRAINT Instances_dtValidTime_Dflt DEFAULT (GetDate()) WITH VALUES
END
GO

--I am changing the ErrorID for routing failures and for instances suspended because the subscribing service was stopped
--I should update all such instances if they are already in the database.
UPDATE Instances SET nvcErrorID = '0xC0C01B4e' WHERE nvcErrorID = '-1' AND nState = 32
UPDATE Instances SET nvcErrorID = '0xC0C01B4D' WHERE nvcErrorID = '-1' AND nState = 4
GO

ALTER  PROCEDURE [dbo].[TDDS_RegisterTDDSAccess] 
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

--for the HAT dynamic queries, we need to support direct reading from certain tables so we have to grant explicit select privledges
GRANT SELECT ON [Instances] TO BTS_ADMIN_USERS
GRANT SELECT ON [InstancesPendingOperations] TO BTS_ADMIN_USERS
--imgContext field can be accessed by BTS_ADMIN_USERS
GRANT SELECT ON [Spool] TO BTS_ADMIN_USERS
GO

--for the Operations dynamic queries, we need to support direct reading from certain tables so we have to grant explicit select privileges
GRANT SELECT ON [Applications] TO BTS_ADMIN_USERS
GRANT SELECT ON [Subscription] TO BTS_ADMIN_USERS
GRANT SELECT ON [InstancesSuspended] TO BTS_ADMIN_USERS

GRANT SELECT ON [Instances] TO BTS_OPERATORS
GRANT SELECT ON [InstancesPendingOperations] TO BTS_OPERATORS
GRANT SELECT ON [Applications] TO BTS_OPERATORS  
GRANT SELECT ON [Subscription] TO BTS_OPERATORS
GRANT SELECT ON [InstancesSuspended] TO BTS_OPERATORS 
--exclude the imgContext field as this is considered sensitive for BTS_OPERATORS
GRANT SELECT ON [Spool](uidMessageID, UserName, PublishingServer, OriginatorSID, OriginatorPID, dtTimeStamp, dtExpiration, nvcMessageType, nNumParts, uidBodyPartID, nvcBodyPartName, nCounter) TO BTS_OPERATORS

GO


--update to the refcounting to handle logs across refcount tables
IF NOT EXISTS (select name from syscolumns WHERE name = 'tnLastTable' AND id = object_id('MessageRefCountLogTotals') )
BEGIN
	ALTER TABLE [dbo].[MessageRefCountLogTotals] ADD [tnLastTable] tinyint NOT NULL DEFAULT (1)

END
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_MessageRefCountLogTotals')
BEGIN
	CREATE  NONCLUSTERED  INDEX [IX_MessageRefCountLogTotals] ON [dbo].[MessageRefCountLogTotals]([snRefCount], [tnLastTable]) 
END
GO

--*******************************************************
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_LocalDate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bts_LocalDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_UTCDate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bts_UTCDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_UpdateStoredTimeStamps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  drop procedure [dbo].[bts_UpdateStoredTimeStamps]
GO


--************************************************************************


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btsv_LocalDate]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[btsv_LocalDate]
GO

CREATE VIEW [dbo].[btsv_LocalDate]
AS
	SELECT GetDate() AS LocalDate
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btsv_UTCDate]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[btsv_UTCDate]
GO

CREATE VIEW [dbo].[btsv_UTCDate]
AS
	SELECT GetUTCDate() AS UTCDate
GO

--Post BETA1 changes

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackedMessages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TrackedMessages]
GO



IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_MessageParts_1')
BEGIN
	DROP INDEX [MessageParts].[IX_MessageParts_1]
END

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_MessageParts')
BEGIN
	CREATE  UNIQUE CLUSTERED  INDEX [CIX_MessageParts] ON [dbo].[MessageParts]([uidMessageID], [uidPartID]) WITH IGNORE_DUP_KEY
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'nID' AND id = object_id('MessageZeroSum') )
BEGIN
	ALTER TABLE [dbo].[MessageZeroSum] ADD [nID] [bigint] NOT NULL IDENTITY(1,1)
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_MessageZeroSum')
BEGIN
	DROP INDEX [MessageZeroSum].[CIX_MessageZeroSum]
END

CREATE  UNIQUE CLUSTERED  INDEX [CIX_MessageZeroSum] ON [dbo].[MessageZeroSum]([nID]) 

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_MessageZeroSum')
BEGIN
	 DROP INDEX [MessageZeroSum].[IX_MessageZeroSum]
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'nID' AND id = object_id('PartZeroSum') )
BEGIN
	ALTER TABLE [dbo].[PartZeroSum] ADD [nID] [bigint] NOT NULL IDENTITY(1,1)
END
GO

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'CIX_PartZeroSum')
BEGIN
	DROP INDEX [PartZeroSum].[CIX_PartZeroSum]
END

CREATE  UNIQUE CLUSTERED  INDEX [CIX_PartZeroSum] ON [dbo].[PartZeroSum]([nID]) 

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_PartZeroSum')
BEGIN
	 DROP INDEX [PartZeroSum].[IX_PartZeroSum]
END
GO

-- SQL 2005 requires the following permission for the function call ident_current
if not exists (select * from sysusers where name = N'BAM_EVENT_READER' and issqlrole = 1)
EXEC sp_addrole N'BAM_EVENT_READER'
GO

--post BETA1

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_MessageRefCountLogTotals')
BEGIN
	DROP INDEX [MessageRefCountLogTotals].[IX_MessageRefCountLogTotals]
END
GO

ALTER TABLE MessageRefCountLogTotals ALTER COLUMN snRefCount int NOT NULL
GO

IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_MessageRefCountLogTotals')
BEGIN
	CREATE  NONCLUSTERED  INDEX [IX_MessageRefCountLogTotals] ON [dbo].[MessageRefCountLogTotals]([snRefCount], [tnLastTable]) 
END
GO

declare @localized_string_OperatorAccessFailure nvarchar (256)
set @localized_string_OperatorAccessFailure = N'BizTalk operators do not have permission to execute this method.'
DELETE FROM LocalizedErrorStrings WHERE nID = 6
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (6, @localized_string_OperatorAccessFailure)
GO


-- Removing the accessorID from InstancesPendingOperations and associated indexes since
-- bulk ops no longer use this. Create the original clustered index.

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstancesPendingOperations]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN

	IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_InstancesPendingOperations_AccessorInstPendingOp')
	BEGIN
		DROP INDEX [InstancesPendingOperations].[CIX_InstancesPendingOperations]
		DROP INDEX [InstancesPendingOperations].[IX_InstancesPendingOperations_Instance]
		DROP INDEX [InstancesPendingOperations].[IX_InstancesPendingOperations_AccessorInstPendingOp]
		CREATE UNIQUE CLUSTERED INDEX [CIX_InstancesPendingOperations] ON [dbo].[InstancesPendingOperations]([uidInstanceID])  --the original clustered index
	END

	IF EXISTS (SELECT name FROM dbo.syscolumns WHERE name = 'uidAccessorID' AND id = object_id('InstancesPendingOperations'))
	BEGIN
		ALTER TABLE [dbo].[InstancesPendingOperations] DROP COLUMN uidAccessorID
	END
END
GO

-- Creating the OperationsProgress table
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OperationsProgress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OperationsProgress]
GO
 
CREATE TABLE [dbo].[OperationsProgress] (	
	[uidAccessorID] [uniqueidentifier] NOT NULL,
	[snSpid] [smallint],
	[nSucceededCount] [int] NOT NULL DEFAULT (0),
	[nFailedCount] [int] NOT NULL DEFAULT (0),
	[nPendingCount] [int] NOT NULL DEFAULT (0),
	[nSkippedCount] [int] NOT NULL DEFAULT (0)	
)
GO

GRANT SELECT ON [OperationsProgress] TO BTS_ADMIN_USERS 
GRANT SELECT ON [OperationsProgress] TO BTS_OPERATORS 
GO

CREATE CLUSTERED INDEX [CIX_OperationsProgress] ON [dbo].[OperationsProgress]([uidAccessorID])
GO

EXEC sp_indexoption '[dbo].[OperationsProgress]', 'disallowpagelocks', TRUE
GO

-- Creating the InstancesOperatedOn table
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstancesOperatedOn]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) 
BEGIN

	CREATE TABLE [dbo].[InstancesOperatedOn] (
		[uidInstanceID] [uniqueidentifier] NOT NULL,
		[uidClassID] [uniqueidentifier] NOT NULL,
		[uidServiceID] [uniqueidentifier] NOT NULL,
		[nvcHostName] [nvarchar] (128) NOT NULL, 
		[uidAccessorID] [uniqueidentifier] NOT NULL,
		[snOperation] [smallint] NOT NULL DEFAULT (21), -- default required for upgrade situations 		
		[dtOperationStartTime] datetime NOT NULL DEFAULT (GetUTCDate()) -- used to determine which RFRs to delete
	)


	CREATE CLUSTERED INDEX [CIX_InstancesOperatedOn] ON [dbo].[InstancesOperatedOn]([uidAccessorID])
	CREATE NONCLUSTERED INDEX [IX_InstancesOperatedOn_Instance] ON [dbo].[InstancesOperatedOn]([uidInstanceID], [snOperation], [nvcHostName]) 

	GRANT SELECT ON [InstancesOperatedOn] TO BTS_ADMIN_USERS 
	GRANT SELECT ON [InstancesOperatedOn] TO BTS_OPERATORS 
	 
	EXEC sp_indexoption '[dbo].[InstancesOperatedOn]', 'disallowpagelocks', TRUE
END
ELSE
BEGIN
	IF NOT EXISTS (select name from syscolumns WHERE name = 'snOperation' AND id = object_id('InstancesOperatedOn') )
	BEGIN
		ALTER TABLE [dbo].[InstancesOperatedOn] ADD [snOperation] [smallint] NOT NULL DEFAULT (21) 		
		ALTER TABLE [dbo].[InstancesOperatedOn] ADD [dtOperationStartTime] datetime NOT NULL DEFAULT (GetUTCDate())
		CREATE NONCLUSTERED INDEX [IX_InstancesOperatedOn_Instance] ON [dbo].[InstancesOperatedOn]([uidInstanceID], [snOperation], [nvcHostName]) 	
	END	
END
GO 


--Removing sprocs which are no longer used 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_BulkOpsClearInstancePendingOperations]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_BulkOpsClearInstancePendingOperations]
GO

-- Increasing ErrorDescription field to 1024 chars
ALTER TABLE Instances ALTER COLUMN nvcErrorDescription nvarchar(1024) NULL
GO 

-- We are suspending (non-resumable) instances which are in the zombie state. The associated msgs are
-- already in the suspended queue, so updating the three error related fields for those msgs as well

declare @uidInstanceID uniqueidentifier, 
	@nvcApplicationName nvarchar(128), 
	@nvcErrorString nvarchar(512), 
	@dtTimeStamp datetime, 
	@uidAppOwnerID uniqueidentifier, 
	@nvcErrorID nvarchar(512), 
	@nErrorCategory int,
	@tsql nvarchar(4000) 

	SELECT @nvcErrorString = nvcError FROM LocalizedErrorStrings WHERE nID = 4 
	SET @nvcErrorID = N'0xC0C01B50' 
	SET @nErrorCategory = -1  

declare instCursor cursor for 
SELECT uidInstanceID, uidAppOwnerID FROM Instances where nState = 16 

open instCursor

FETCH NEXT FROM instCursor INTO @uidInstanceID, @uidAppOwnerID 
WHILE (@@FETCH_STATUS = 0)
BEGIN
	
	SELECT @nvcApplicationName = nvcApplicationName FROM Applications WITH (ROWLOCK) 
	WHERE uidAppID = @uidAppOwnerID 
	OPTION (KEEPFIXED PLAN)

	BEGIN TRANSACTION

	UPDATE Instances 
	SET nState = 32,
	    dtSuspendTimeStamp = GetUTCDate(),
	    nErrorCategory = @nErrorCategory,
	    nvcErrorID = @nvcErrorID, 	    
	    nvcErrorDescription = @nvcErrorString 
	FROM Instances WITH (ROWLOCK) 
	WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = @uidAppOwnerID 
	OPTION (KEEPFIXED PLAN)
	
	IF (@@ROWCOUNT <> 0) 
	BEGIN

		SET @dtTimeStamp = GetUTCDate() 

		INSERT INTO InstancesSuspended 
		SELECT uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, dtCreated, nState, nvcUserState, dtSuspendTimeStamp, null, null, nErrorCategory, nvcErrorID, nvcErrorDescription, nvcErrorProcessingServer 
		FROM Instances WITH (ROWLOCK) 
		WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = @uidAppOwnerID 
		OPTION (KEEPFIXED PLAN) 			

		--These entries are already there in the susp queue - updating the errorCategory, errorID and errorDescription in 
		--the existing entries

		set @tsql = N'UPDATE [' + @nvcApplicationName + 'Q_Suspended] 
		SET nErrorCategory = ' + cast (@nErrorCategory as nvarchar(16)) + ',
		    nvcErrorID = N''' + @nvcErrorID + N''', 	    
		    nvcAdditionalInfo = N''' + @nvcErrorString + N'''
		FROM [' + @nvcApplicationName + 'Q_Suspended] WITH (ROWLOCK) 
		WHERE uidInstanceID = N''' + CAST(@uidInstanceID as nchar(36)) + ''' 
		OPTION (KEEPFIXED PLAN)'
	
		exec (@tsql)
		
	END

	COMMIT TRANSACTION

	FETCH NEXT FROM instCursor INTO @uidInstanceID, @uidAppOwnerID 

END
close instCursor
deallocate instCursor

GO

-- BAS subscriptions that need to ve removed if the service was marked started
if exists (select * from [dbo].[StaticStateInfo] where uidServiceID = N'461FBB09-6FC8-3C7A-1CAE-AD7FAC5A8F41')
BEGIN
	BEGIN TRANSACTION

	exec [dbo].[bts_DeleteStaticStateInfo] @uidServiceID = N'{461FBB09-6FC8-3C7A-1CAE-AD7FAC5A8F41}'
	exec [dbo].[bts_AdminToggleSubscriptions] @uidServiceID = N'{461FBB09-6FC8-3C7A-1CAE-AD7FAC5A8F41}', @uidInstanceID = NULL, @fActivationOnly = 0, @fEnable = -1

	COMMIT TRANSACTION
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'uidClonedPartID' AND id = object_id('Parts') )
BEGIN
	ALTER TABLE [dbo].[Parts] ADD uidClonedPartID uniqueidentifier NULL
END

GO  

-- Changing certain local time values to UTC time in the MsgBox for BTS versions prior to BTS 2006 Beta2.
-- Affects the Subscription, Instances and Queues tables
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BizTalkDBVersion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN

	declare @nvcDateTimeAppName nvarchar(128),
		@nvcWorkQ nvarchar(128),
		@nvcSuspendedQ nvarchar(128), 		
		@nvcSubsConstraint nvarchar(256),
		@nvcInstConstraint nvarchar(256),
		@nDatabaseMinor int
	
	SET @nvcSubsConstraint = N''
	SET @nvcInstConstraint = N''

	SELECT TOP 1 @nDatabaseMinor = DatabaseMinor 
	FROM BizTalkDBVersion 
	ORDER BY DatabaseMinor DESC

	-- The below dateTime fields are converted from local time to UTC if the BTS version
	-- is earlier than 3.5.0.0, ie, if the BTS version is prior to Beta2
	IF (@nDatabaseMinor < 4) 
	BEGIN
		BEGIN TRANSACTION

		--Subscription

		if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Subscription]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN	
			UPDATE Subscription
			SET dtTimeStamp = [dbo].[bts_fnConvertLocalToUTCDate] (dtTimeStamp)
			WHERE (YEAR(dtTimeStamp) <> 1899) AND (MONTH(dtTimeStamp) <> 12) AND (DAY(dtTimeStamp) <> 30)			

			UPDATE Subscription
			SET dtValid = [dbo].[bts_fnConvertLocalToUTCDate] (dtValid)
			WHERE (YEAR(dtValid) <> 1899) AND (MONTH(dtValid) <> 12) AND (DAY(dtValid) <> 30) 			
		END

		-- Change the default value for dtTimeStamp in Subscriptions table to GetUTCDate() from GetDate()
		-- s1 gets the constraint name and s3 gets the table name

		SELECT TOP 1 @nvcSubsConstraint = s1.name 
		FROM sysobjects AS s1
		JOIN sysconstraints AS s2 on s1.id = s2.constid
		JOIN sysobjects AS s3 on s1.parent_obj = s3.id
		WHERE s3.name = N'Subscription' AND s1.name like N'%dt%'

		IF (@nvcSubsConstraint <> N'' AND @nvcSubsConstraint <> N'Subscription_dtTimeStamp_Dflt')
		BEGIN
			exec (N'ALTER TABLE Subscription DROP CONSTRAINT ' + @nvcSubsConstraint)
			ALTER TABLE [dbo].[Subscription] ADD CONSTRAINT Subscription_dtTimeStamp_Dflt DEFAULT (GetUTCDate()) for dtTimeStamp
		END 


		--Instances

		if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Instances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN	
			UPDATE Instances
			SET dtValidTime = [dbo].[bts_fnConvertLocalToUTCDate] (dtValidTime)					
		END

		-- Change the default value for dtValidTime in Instances table to GetUTCDate() from GetDate()
		-- Also specify a name for the default constraint for dtCreated, which is already in UTC time by default

		declare instCursor cursor FOR
		SELECT s1.name 
		FROM sysobjects AS s1
		JOIN sysconstraints AS s2 on s1.id = s2.constid
		JOIN sysobjects AS s3 on s1.parent_obj = s3.id
		WHERE s3.name = N'Instances' AND s1.name like N'%dt%'

		open instCursor
		FETCH NEXT FROM instCursor INTO @nvcInstConstraint

		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			IF (@nvcInstConstraint <> N'')
			BEGIN
				exec (N'ALTER TABLE Instances DROP CONSTRAINT ' + @nvcInstConstraint) 
			END			

			FETCH NEXT FROM instCursor INTO @nvcInstConstraint
		END
		close instCursor
		deallocate instCursor

		ALTER TABLE [dbo].[Instances] ADD CONSTRAINT Instances_dtValidTime_Dflt DEFAULT (GetUTCDate()) for dtValidTime
		ALTER TABLE [dbo].[Instances] ADD CONSTRAINT Instances_dtCreated_Dflt DEFAULT (GetUTCDate()) for dtCreated


		--Application Queues

		declare curse cursor FOR
		SELECT nvcApplicationName
		FROM Applications

		open curse
		FETCH NEXT FROM curse INTO @nvcDateTimeAppName
		WHILE (@@FETCH_STATUS = 0)
		BEGIN 
			
			set @nvcWorkQ = @nvcDateTimeAppName + 'Q' 
			set @nvcSuspendedQ = @nvcDateTimeAppName + 'Q_Suspended' 
		
			exec ('UPDATE [dbo].[' + @nvcWorkQ + '] SET dtValid = [dbo].[bts_fnConvertLocalToUTCDate] (dtValid) WHERE (YEAR(dtValid) <> 1899) AND (MONTH(dtValid) <> 12) AND (DAY(dtValid) <> 30) ')
			exec ('UPDATE [dbo].[' + @nvcSuspendedQ + '] SET dtValid = [dbo].[bts_fnConvertLocalToUTCDate] (dtValid) WHERE (YEAR(dtValid) <> 1899) AND (MONTH(dtValid) <> 12) AND (DAY(dtValid) <> 30) ')
				
			FETCH NEXT FROM curse INTO @nvcDateTimeAppName
		END
		close curse
		deallocate curse

		COMMIT TRANSACTION
	END
END
GO 

-- Post BETA2 changes

--We need a unique index on the Tracking_Parts tables so that we can get correct estimates when deleting from these tables. I will add the uidPartID
--column to the index since this is randomly generated
IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_Tracking_Parts1')
BEGIN
	DROP INDEX [Tracking_Parts1].[IX_Tracking_Parts1]
END
GO

CREATE  UNIQUE CLUSTERED  INDEX [IX_Tracking_Parts1] ON [dbo].[Tracking_Parts1]([uidMessageID], [uidPartID]) ON [PRIMARY]
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'IX_Tracking_Parts2')
BEGIN
	DROP INDEX [Tracking_Parts2].[IX_Tracking_Parts2]
END
GO

CREATE  UNIQUE CLUSTERED  INDEX [IX_Tracking_Parts2] ON [dbo].[Tracking_Parts2]([uidMessageID], [uidPartID]) ON [PRIMARY]
GO


--lets disable page locks on all tracking related tables
EXEC sp_indexoption '[dbo].[TrackingDataPartitions]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[TrackingMessageReferences]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Spool1]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Fragments1]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Parts1]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Spool2]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Fragments2]', 'disallowpagelocks', TRUE
GO
EXEC sp_indexoption '[dbo].[Tracking_Parts2]', 'disallowpagelocks', TRUE
GO

-- Removing sprocs which are no longer used 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_GetOperatedOnInstances]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_GetOperatedOnInstances]
GO 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_DeleteInstancesOperatedOnOnMasterMsgBox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_DeleteInstancesOperatedOnOnMasterMsgBox]
GO 

-- This role is required only for MsgBoxes, which is why the definition is here instead of BTS_Security_Logic.sql 
-- BTS_SQLAGENT_USER role is to allow SQL agent jobs running on messageboxes on remote servers
-- to update corresponding records on the master msgbox when (bulk) suspend/resume/terminate 
-- operations are performed on instances on the remote messagebox(es) from the Group Hub
-- page in the Admin Console.
--
-- Note that no users are added to this role - adding users to this will be a manual post 
-- install step.
--
-- NOTE: DO NOT add an s to this role name and do not make it bts_sqlagent_users - doing so will
-- cause naming conflicts when adding a BTS host if that host is named sqlagent and will necessitate
-- updating code elsewhere in the Agent. This role should only have one user and so the single form
-- is appropriate.

if not exists (select * from sysusers where name = N'BTS_SQLAGENT_USER' and issqlrole = 1)
	EXEC sp_addrole N'BTS_SQLAGENT_USER'
GO

--updates to tracking spool to prevent deleting records which were never part of a backup
IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('Tracking_Spool1') )
BEGIN
	ALTER TABLE [dbo].[Tracking_Spool1] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT TrackingSpool1_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF NOT EXISTS (select name from syscolumns WHERE name = 'dtInsertionTimeStamp' AND id = object_id('Tracking_Spool2') )
BEGIN
	ALTER TABLE [dbo].[Tracking_Spool2] ADD [dtInsertionTimeStamp] [datetime] NULL CONSTRAINT TrackingSpool2_InsertionTimeStamp_Dflt DEFAULT (GetUTCDate())	
END
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'CIX_Tracking_Spool1')
BEGIN
	DROP INDEX [Tracking_Spool1].[CIX_Tracking_Spool1]
END
GO
CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool1] ON [dbo].[Tracking_Spool1]([dtTimeStamp], [dtInsertionTimeStamp], [uidMsgID])
GO

IF EXISTS (SELECT name FROM dbo.sysindexes WHERE name = N'CIX_Tracking_Spool2')
BEGIN
	DROP INDEX [Tracking_Spool2].[CIX_Tracking_Spool2]
END
GO
CREATE  CLUSTERED  INDEX [CIX_Tracking_Spool2] ON [dbo].[Tracking_Spool2]([dtTimeStamp], [dtInsertionTimeStamp], [uidMsgID])
GO


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

	UPDATE [dbo].[TrackingDataPartitions] 
	SET [NumPartitions] = 4

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
		exec('EXECUTE sp_rename N''[dbo].[TrackingData]'', N''TrackingData#TEMP'', ''OBJECT''')
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

