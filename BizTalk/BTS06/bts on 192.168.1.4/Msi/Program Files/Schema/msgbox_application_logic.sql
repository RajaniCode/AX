--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/ 
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  
------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AddApplication]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AddApplication]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_AddApplicationSprocs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_AddApplicationSprocs]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_AddApplicationProp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_AddApplicationProp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_RemoveApplicationProp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_RemoveApplicationProp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_RemoveApplication]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_RemoveApplication]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[int_RemoveApplicationSprocs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[int_RemoveApplicationSprocs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_DisablePageLocksOnApplicationTables]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_DisablePageLocksOnApplicationTables]
GO 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_ResetApplicationSprocs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_ResetApplicationSprocs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_DisablePageLocksOnApplicationTables]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bts_DisablePageLocksOnApplicationTables]
GO

CREATE PROCEDURE [dbo].[int_AddApplicationSprocs]
@ApplicationName nvarchar(128),
@uidAppID uniqueidentifier
AS

set nocount on

declare @QueueName nvarchar(156)
declare @SuspendedQName nvarchar(156)
declare @ScheduledQName nvarchar(156)
declare @DynamicStateTable nvarchar(256)
declare @StateQName nvarchar(256)

set @SuspendedQName = QuoteName(@ApplicationName + 'Q_Suspended')
set @ScheduledQName = QuoteName(@ApplicationName + 'Q_Scheduled')
set @QueueName = QuoteName(@ApplicationName + 'Q')
set @DynamicStateTable = QuoteName('DynamicStateInfo_' + @ApplicationName)
set @StateQName = QuoteName('InstanceStateMessageReferences_' + @ApplicationName)


---------------------------------------
-- Admin procs to resume an Instance --
---------------------------------------

exec (' CREATE PROCEDURE [dbo].[int_AdminResumeInstance_' + @ApplicationName + ']
	@uidInstanceID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@uidClassID uniqueidentifier,
	@fFound int OUTPUT
	
AS

set transaction isolation level read committed
set nocount on
        
declare @tnActiveTable tinyint

set @fFound = 0

-- First re-enable all instance subscriptions (resuming an instance) or all subscriptions
-- (resuming a service).
exec int_ToggleSubscriptions @uidServiceID, @uidInstanceID, 0, 1

--we skip changing the refcount since we are just moving the data from one table to another. No other process can act on this instance at this time

INSERT INTO ' + @QueueName + ' WITH (ROWLOCK) 
(uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nReserved)
SELECT sq.uidWorkID, sq.uidMessageID, sq.uidSubscriptionID, sq.snPriority, sq.uidClassID, sq.dtStartWindow, sq.dtEndWindow, sq.dtValid, sq.uidServiceID, sq.uidInstanceID, sq.uidAppInstanceID, sq.uidPortID, sq.snPartRetrieval, sq.fOrderedDelivery, sq.nReserved
FROM ' + @SuspendedQName + ' as sq WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended]))
WHERE sq.uidInstanceID = @uidInstanceID AND sq.uidServiceID = @uidServiceID AND
      sq.nIsResumable = 1  -- Move only those messages that were routed here directly.
ORDER BY sq.dtLastTouched, sq.nID
OPTION (KEEPFIXED PLAN)

if (((@uidClassID = N''226FC6B9-0416-47A4-A8E8-4721F1DB1A1B'') OR (@uidClassID = N''BB3A1470-F5C4-47C3-B71F-EAABC260FBD0'')) AND (0 = @@ROWCOUNT))

BEGIN  

	INSERT INTO ' + @QueueName + ' WITH (ROWLOCK) (uidMessageID, snPriority, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, snPartRetrieval, uidClassID)
	VALUES (N''61EAA7FC-AC85-42d9-BF3E-1BED258B82BE'', 5, 0, 0, 0, @uidServiceID, @uidInstanceID, 0, @uidClassID)

	--Ref-counting logic to count the Restart Msg. Go straight to global counter for control messages
	exec int_RefCountMessage N''61EAA7FC-AC85-42d9-BF3E-1BED258B82BE'', 3, 1
			
END
      
DELETE FROM ' + @SuspendedQName + ' FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended]))
WHERE uidInstanceID = @uidInstanceID AND uidServiceID = @uidServiceID AND
      nIsResumable = 1  -- Move only those messages that were routed here directly.
OPTION (KEEPFIXED PLAN)

UPDATE Instances WITH (ROWLOCK) SET nState = 8 WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' AND nState = 4 --only resume suspended instances
OPTION (KEEPFIXED PLAN)
if (@@ROWCOUNT > 0)
	set @fFound = 1

--In keeping with the above - only resumable suspended instances are removed
DELETE FROM InstancesSuspended WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' AND nState = 4 
OPTION (KEEPFIXED PLAN)

RETURN')


---------------------------------------
-- Admin proc to suspend an instance --
---------------------------------------
exec (' CREATE PROCEDURE [dbo].[int_AdminSuspendInstance_' + @ApplicationName + ']
	@uidInstanceID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@nvcErrorID nvarchar(512), 
	@nErrorCategory int, 
	@nvcAdditionalInfo nvarchar(1024), 
	@nIsResumable int,
	@nvcProcessingServer nvarchar(256), 
	@dtTimeStamp datetime, 	
	@nvcURL nvarchar(512),
	@nvcAdapter nvarchar(512),
	@fKnownInstance int OUTPUT
	
AS

set transaction isolation level read committed
set nocount on

declare @nState int,
	@tnActiveTable tinyint

if (@nIsResumable = 0 )
	set @nState = 32
else
	set @nState = 4
	

-- First deactivate the instance subscriptions.
exec int_ToggleSubscriptions @uidServiceID = @uidServiceID, @uidInstanceID = @uidInstanceID, @fActivationOnly = 0, @fEnable = 2

-- Then see if we know about this instance.
set @fKnownInstance = 0

--we should never suspend an instance that is in the zombie state or suspended not resumable
UPDATE Instances 
	SET nState = @nState,
	    dtSuspendTimeStamp = GetUTCDate(),
	    nErrorCategory = @nErrorCategory,
	    nvcErrorID = @nvcErrorID,
	    nvcErrorProcessingServer = @nvcProcessingServer,
	    nvcErrorDescription = @nvcAdditionalInfo
	FROM Instances WITH (ROWLOCK)
	WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' AND nState <> 4 AND nState <> 16 AND nState <> 32
	OPTION (KEEPFIXED PLAN)

-- Normalize @fKnownInstance and copy all the messages from the WorkQ to the SuspendedQ
if (@@ROWCOUNT <> 0)
BEGIN
	INSERT INTO InstancesSuspended 
	SELECT uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, dtCreated, nState, nvcUserState, dtSuspendTimeStamp, @nvcAdapter, @nvcURL, nErrorCategory, nvcErrorID, nvcErrorDescription, nvcErrorProcessingServer
	FROM Instances WITH (ROWLOCK)
	WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
	OPTION (KEEPFIXED PLAN)

	set @fKnownInstance = -1
	
	--we skip refcounting here since we are just moving from one table to another
	
	INSERT INTO ' + @SuspendedQName + ' WITH (ROWLOCK) (uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nRetryCount, nvcErrorID, nErrorCategory, nvcAdditionalInfo, nvcProcessingServer, nIsResumable, dtTimeStamp, nReserved)
	SELECT uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nRetryCount, @nvcErrorID, @nErrorCategory, @nvcAdditionalInfo, @nvcProcessingServer, @nIsResumable, @dtTimeStamp, nReserved
	FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID
	ORDER BY uidClassID, snPriority, dtLastTouched, nID 
	OPTION (KEEPFIXED PLAN)
	
	DELETE FROM ' + @QueueName + ' FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID
	OPTION (KEEPFIXED PLAN)

	
END

RETURN

')



-----------------------------------------
-- Admin proc to terminate an instance --
-----------------------------------------
exec (' CREATE PROCEDURE [dbo].[int_AdminTerminateInstance_' + @ApplicationName + ']
	@uidInstanceID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@fKnownInstance int OUTPUT
	
AS

set transaction isolation level read committed
set nocount on

set @fKnownInstance = -1

DECLARE @uidInterceptorID uniqueidentifier,
	@uidClassID uniqueidentifier,
	@nState int,
	@nSource int,
	@tnActiveTable tinyint, @retVal int

set @uidInterceptorID = N''{D1A805A2-B1B5-42bc-A29F-D128131DDCD0}'' -- Agents ID in the tracking stream

SELECT @uidClassID = uidClassID, @nState = nState FROM Instances WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION (KEEPFIXED PLAN)
if (@@ROWCOUNT = 0)
BEGIN
	set @fKnownInstance = 0
END

if ( @nState = 4 OR @nState = 16 OR @nState = 32) 
	set @nSource = -5
else
	set @nSource = -4

-- First deactivate the instance subscriptions.
exec int_ToggleSubscriptions @uidServiceID = @uidServiceID, @uidInstanceID = @uidInstanceID, @fActivationOnly = 0, @fEnable = -1

if (@fKnownInstance = -1)
BEGIN
	exec bts_InsertTrackingData @uidServiceID, @uidInstanceID, N''' + @ApplicationName + ''', @nSource, @uidServiceID, @uidClassID, @@SERVERNAME, ''terminated'', @uidInterceptorID
END

--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
--normal locks would require us to wait for the transaction to complete, but we dont really need to wait that long
exec  @retVal = sp_getapplock ''MessageRefCountLog'', ''Shared'', ''Transaction''

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	RAISERROR(''Unable to acquire applock on MessageRefCountLog'', 16, 1)
	return
END

--lock the log table to make sure it does not switch underneath us
SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 1 OPTION (KEEPFIXED PLAN)
	
IF EXISTS (SELECT uidInstanceID FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID)
BEGIN
	--first cleanup all messages which are refcounted locally
	DELETE FROM ' + @StateQName + '
	FROM ' + @StateQName + ' s WITH (ROWLOCK), [' + @ApplicationName + '_MessageRefCountLog] lg
	WHERE s.uidInstanceID = @uidInstanceID AND s.uidInstanceID = lg.uidInstanceID AND s.uidMessageID = lg.uidMessageID
	OPTION (KEEPFIXED PLAN) 

	--cleanup instance state related info
	if (@tnActiveTable = 1)
	BEGIN
		INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
		SELECT uidMessageID, 2, -1
		FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
	END
	else
	BEGIN
		INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
		SELECT uidMessageID, 2, -1
		FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
	END
	
	DELETE FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
END

IF EXISTS (SELECT TOP 1 uidInstanceID FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID)
BEGIN

	--first cleanup all messages which are refcounted locally
	DELETE FROM ' + @QueueName + '
	FROM ' + @QueueName + ' s WITH (ROWLOCK), [' + @ApplicationName + '_MessageRefCountLog] lg
	WHERE s.uidInstanceID = @uidInstanceID AND s.uidInstanceID = lg.uidInstanceID AND s.uidMessageID = lg.uidMessageID
	OPTION (KEEPFIXED PLAN) 

	-- remove all Queue entries
	if (@tnActiveTable = 1)
	BEGIN
		INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
		SELECT uidMessageID, 1, -1
		FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
	END
	else
	BEGIN
		INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
		SELECT uidMessageID, 1, -1
		FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
	END

	DELETE FROM ' + @QueueName + ' FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID
	OPTION (KEEPFIXED PLAN)
END

IF EXISTS (SELECT uidInstanceID FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName + 'Q_Suspended])) WHERE uidInstanceID = @uidInstanceID)
BEGIN

	--first cleanup all messages which are refcounted locally
	DELETE FROM ' + @SuspendedQName + '
	FROM ' + @SuspendedQName + ' s WITH (ROWLOCK), [' + @ApplicationName + '_MessageRefCountLog] lg
	WHERE s.uidInstanceID = @uidInstanceID AND s.uidInstanceID = lg.uidInstanceID AND s.uidMessageID = lg.uidMessageID
	OPTION (KEEPFIXED PLAN)

	if (@tnActiveTable = 1)
	BEGIN
		INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
		SELECT uidMessageID, 3, -1
		FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName + 'Q_Suspended])) WHERE uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
	END
	else
	BEGIN
		INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
		SELECT uidMessageID, 3, -1
		FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName + 'Q_Suspended])) WHERE uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
	END

	DELETE FROM ' + @SuspendedQName + '  FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName + 'Q_Suspended])) WHERE uidInstanceID = @uidInstanceID
END

exec sp_releaseapplock ''MessageRefCountLog'', ''Transaction''


--cleanup locally refd messages
INSERT INTO MessageZeroSum WITH (ROWLOCK) (uidMessageID)
SELECT uidMessageID FROM [' + @ApplicationName + '_MessageRefCountLog]
WHERE uidInstanceID = @uidInstanceID

DELETE FROM [' + @ApplicationName + '_MessageRefCountLog]
WHERE uidInstanceID = @uidInstanceID

DELETE FROM ' + @DynamicStateTable + ' WITH (ROWLOCK) WHERE   uidInstanceID = @uidInstanceID
OPTION (KEEPFIXED PLAN)

DELETE FROM ConvoySetInstances FROM ConvoySetInstances WITH (ROWLOCK INDEX(IX_ConvoySetInstances)) WHERE uidInstanceID = @uidInstanceID
OPTION (KEEPFIXED PLAN)

DELETE FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
OPTION (KEEPFIXED PLAN)

DELETE FROM InstancesSuspended WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
OPTION (KEEPFIXED PLAN)

RETURN

')


--Create the GetInstanceLock stored proc
-- fSuccess = 0		Success (Instance Locked)
--			= 1		Another Process is trying to get the Instance Locked
--			= 2		Instance does not exist or can not be accessed
--			= 3		Instance is already Locked by another Process
-- nState	Update the Instance State to this new value
exec ('CREATE PROCEDURE [dbo].[int_GetInstanceLock_' + @ApplicationName + ']
@uidInstanceID uniqueidentifier,
@uidActivationID uniqueidentifier,
@nState int,
@fSuccess int OUTPUT

AS

DECLARE @uidProcessID uniqueidentifier,
		@uidInstanceProcessID uniqueidentifier,
		@retVal int,
		@nCurrentState int
		

set nocount on
set transaction isolation level read committed
set @fSuccess = 0		
set @uidInstanceProcessID = NULL
set @uidProcessID = APP_NAME()

if ( @uidActivationID IS NULL )
	set @uidActivationID = NewID()


-- Try to get the AppLock. This is ensure that no two Processes/Sessions are trying to do the same thing

exec  @retVal = sp_getapplock @uidInstanceID, ''Exclusive'', ''Session'', 0 

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	set @fSuccess = 1
	return
END

-- Check if the Instance is already Locked

SELECT @uidInstanceProcessID = uidProcessID, @nCurrentState = nState FROM Instances WITH (ROWLOCK READPAST)
WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
OPTION(KEEPFIXED PLAN)

if (@@ROWCOUNT = 0)
BEGIN
	set @fSuccess = 1
END
else if ( (@uidInstanceProcessID IS NOT NULL) AND (@uidInstanceProcessID <> @uidProcessID))
BEGIN
	set @fSuccess = 3
END
else if (@uidInstanceProcessID IS NULL)
BEGIN
	-- Mark the Instance as LOCKED
	-- Could put validation code in to check state is active ie 2 but may be unnecessary due to expected state transitions
	-- Due to expected state transitions, nState input param generally only has value of 2. Since state could be 
	-- transitioning from suspended to non-suspended, need to update InstancesSuspended table
	if (@nState IS NOT NULL)
	BEGIN
		UPDATE Instances SET nState = @nState, uidProcessID = @uidProcessID, uidActivationID = @uidActivationID, nvcProcessingServer = HOST_NAME() WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION(KEEPFIXED PLAN)

		IF (@nCurrentState = 4 OR @nCurrentState = 32)
		BEGIN
			DELETE FROM InstancesSuspended FROM InstancesSuspended WITH (ROWLOCK INDEX(IX_InstancesSuspended_InstanceID)) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' 
			OPTION (KEEPFIXED PLAN)
		END
	END
	else
		UPDATE Instances SET uidProcessID = @uidProcessID, uidActivationID = @uidActivationID, nvcProcessingServer = HOST_NAME() WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION(KEEPFIXED PLAN)
	 
END

exec sp_releaseapplock @uidInstanceID, ''Session''

return
	
')


----------------------------------------------------------------
-- Sproc for handling refcount of messages which were routed to only one instance. We optimize for them since there
-- will be no lock contention over the ref count so we can simply update it
-----------------------------------------------------------------------------
exec (' CREATE PROCEDURE [dbo].[int_RefCountMessage_' + @ApplicationName + ']
	@uidInstanceID uniqueidentifier,
	@uidMessageID uniqueidentifier,
	@nRefCount smallint,
	@fFlag int = 0
AS

/* Flag enumeration
0 -- check if it exists locally. If not insert into the gloabl refcount log
1 -- Insert into the local refcount log. This is the first write
2 -- check if it exists locally. If it does, move it to the global log. If not, insert into the global log. THis is for tracking
*/
set transaction isolation level read committed
set nocount on

declare @currentCount int

if (@fFlag = 1)
BEGIN
	INSERT INTO [' + @ApplicationName + '_MessageRefCountLog] (uidInstanceID, uidMessageID, nRefCount) VALUES (@uidInstanceID, @uidMessageID, @nRefCount)
END
ELSE
BEGIN
	SELECT TOP 1 @currentCount = nRefCount FROM [' + @ApplicationName + '_MessageRefCountLog] WITH (ROWLOCK XLOCK) WHERE uidInstanceID = @uidInstanceID AND uidMessageID = @uidMessageID OPTION (KEEPFIXED PLAN)
	if (@@ROWCOUNT > 0)
	BEGIN
		if (@fFlag = 0)
		BEGIN
			if ( @currentCount + @nRefCount = 0 )
			BEGIN
				DELETE FROM [' + @ApplicationName + '_MessageRefCountLog] WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidMessageID = @uidMessageID OPTION (KEEPFIXED PLAN)
				INSERT INTO MessageZeroSum (uidMessageID) VALUES (@uidMessageID)
			END
			else
			BEGIN
				UPDATE [' + @ApplicationName + '_MessageRefCountLog] SET nRefCount = nRefCount + @nRefCount WHERE uidInstanceID = @uidInstanceID AND uidMessageID = @uidMessageID OPTION (KEEPFIXED PLAN)
			END
		END
		ELSE
		BEGIN
			--this happens when we track a message which was only routed to us
			set @nRefCount = @nRefCount + @currentCount
			exec int_RefCountMessage @uidMessageID, 1, @nRefCount
			DELETE FROM [' + @ApplicationName + '_MessageRefCountLog] WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidMessageID = @uidMessageID OPTION (KEEPFIXED PLAN)
		END
	END
	ELSE
	BEGIN
		--refcount this out of the global log
		exec int_RefCountMessage @uidMessageID, 1, @nRefCount
	END
END')

-----------------------------------------------------------------
--Sproc for handling refcounting and inserting of tracked message refs. We need to handle potentially moving the count
--from the local log to the global log so we need an app specific sproc for doing this
----------------------------------------------------------------
exec ('CREATE PROCEDURE [dbo].[int_TrackMessage_' + @ApplicationName + ']
@uidInstanceID uniqueidentifier,
@uidMessageID uniqueidentifier
AS

--the copy job has to be careful here. It copies 50 messages at a time. If there are less than 50 messages to 
--copy, then when it starts copying, it needs to prevent the count from growing or else we will lose messages which
--we were supposed to track. To prevent this, I am moving the tracking of the reference to a helper sproc which will
--take a brief applock to make sure we can provide some level of isolation
			
set nocount on

declare @retVal int, @cnt int

exec  @retVal = sp_getapplock ''TrkMsgRefs'', ''Shared'', ''Transaction''

IF (@retVal < 0 ) -- Lock Not granted
BEGIN
	RAISERROR(''Unable to acquire applock on TrackingMessageReferences table'', 16, 1)
	return
END

INSERT INTO TrackingMessageReferences WITH (ROWLOCK) VALUES (@uidMessageID)
set @cnt = @@ROWCOUNT

exec sp_releaseapplock ''TrkMsgRefs'', ''Transaction''

IF (@cnt > 0)
BEGIN
	--pass in the 2 flag to indicate that the total needs to be moved to the global log
	exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, 1, 2
END')

----------------------------------------------------------------
-- Admin proc to pre-emptively suspend or terminate instances --
----------------------------------------------------------------
exec (' CREATE PROCEDURE [dbo].[int_InsertSuspendControlMessage_' + @ApplicationName + ']
	@uidInstanceID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@uidClassID uniqueidentifier,
	@nPriority int,
	@nReturn int OUTPUT
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @fAttrib bigint
set @fAttrib = 0
set @nReturn = 1

--only send a control message if this service class supports control messages
SELECT TOP 1 @fAttrib = fAttributes FROM ServiceClasses WHERE uidServiceClassID = @uidClassID
if ((@fAttrib & 1) > 0)
BEGIN
	INSERT INTO ' + @QueueName + ' WITH (ROWLOCK)  (uidMessageID, snPriority, dtStartWindow, dtEndWindow, dtValid, uidInstanceID, uidClassID, uidServiceID, snPartRetrieval) 
        	    VALUES (N''2BE3D5B8-5685-40F2-BD97-51ADA3D02347'', @nPriority, 0, 0, 0, @uidInstanceID, @uidClassID, @uidServiceID, 0)

	--Go straight to global counter for control messages
	exec int_RefCountMessage N''2BE3D5B8-5685-40F2-BD97-51ADA3D02347'', 3, 1
END
else
BEGIN
	set @nReturn = 0
END


')

exec (' CREATE PROCEDURE [dbo].[int_InsertTerminateControlMessage_' + @ApplicationName + ']
	@uidInstanceID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@uidClassID uniqueidentifier,
	@nPriority int,
	@nReturn int OUTPUT
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @fAttrib bigint
set @fAttrib = 0
set @nReturn = 1

--only send a control message if this service class supports control messages
SELECT TOP 1 @fAttrib = fAttributes FROM ServiceClasses WHERE uidServiceClassID = @uidClassID
if ((@fAttrib & 1) > 0)
BEGIN
	INSERT INTO ' + @QueueName + ' WITH (ROWLOCK)  (uidMessageID, snPriority, dtStartWindow, dtEndWindow, dtValid, uidInstanceID, uidClassID, uidServiceID, snPartRetrieval) 
        	    VALUES (N''57E5E753-0207-435D-8BE7-2B9F3C6556F9'', @nPriority, 0, 0, 0, @uidInstanceID, @uidClassID, @uidServiceID, 0)

	--Go straight to global counter for control messages
	exec int_RefCountMessage N''57E5E753-0207-435D-8BE7-2B9F3C6556F9'', 3, 1
END
else
BEGIN
	set @nReturn = 0
END

')

exec (' CREATE PROCEDURE [dbo].[int_InsertResumeInDebugModeControlMessage_' + @ApplicationName + ']
	@uidInstanceID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@uidClassID uniqueidentifier,
	@nPriority int,
	@nReturn int OUTPUT
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @fAttrib bigint
set @fAttrib = 0
set @nReturn = 1

--only send a control message if this service class supports control messages
SELECT TOP 1 @fAttrib = fAttributes FROM ServiceClasses WHERE uidServiceClassID = @uidClassID
if ((@fAttrib & 1) > 0)
BEGIN
	INSERT INTO ' + @QueueName + ' WITH (ROWLOCK)  (uidMessageID, snPriority, dtStartWindow, dtEndWindow, dtValid, uidInstanceID, uidClassID, uidServiceID, snPartRetrieval) 
        	    VALUES (N''50D173AF-5D6F-4D5F-AE23-1A7178CEBDC3'', @nPriority, 0, 0, 0, @uidInstanceID, @uidClassID, @uidServiceID, 0)

	--Go straight to global counter for control messages
	exec int_RefCountMessage N''50D173AF-5D6F-4D5F-AE23-1A7178CEBDC3'', 3, 1
END
else
BEGIN
	set @nReturn = 0
END

')

exec (' CREATE PROCEDURE [dbo].[bts_AdminPreemptiveOperateOnInstances_' + @ApplicationName + ']
	@fOperation int,
	@nPriority int,
	@uidInstanceID uniqueidentifier,
	@uidServiceID uniqueidentifier,
	@uidClassID uniqueidentifier,
	@nReturn int OUTPUT
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

-- @fOperation = 1, Suspend
-- @fOperation = 2, Terminate
-- @fOperation = 3, Resume
-- @fOperation = 4, Resume in Debug Mode
-- @fOperation = 5, Send terminate control message to instance without locking instance, used when unenlisting an ordered delivery send port

/*
@nReturn	= 0, Control Mesage has been sent
		= 1, Preemptively operated on the instance
		= 2, Lock instance failed and this operation does not accept control messages
		= 3, The Instance does not exist in the database.
		= 4, Operation cannot be performed for instance in this state
		= 5, The class of service does not accept control messages. Operation skipped.
*/



declare @dtTimeStamp datetime, 
		@fOperatedOn int,
		@nPendingOperation smallint,
		@nIsLocked int,
		@fInstanceLockStatus int,
		@nState int,
		@ret int,
		@startedTrans int
		
set @startedTrans = 0
set @fOperatedOn = 0
set @fInstanceLockStatus = 1 --this indicates if the instance was already locked. A 0 value indicates that it wasnt and that we acquired the lock
set @nIsLocked = 0
set @nState = -1
set @dtTimeStamp = GetUTCDate()
set @ret = 1

if (@@TRANCOUNT = 0)
BEGIN
	BEGIN TRANSACTION
	set @startedTrans = 1
END

select @nState = nState from Instances WITH (REPEATABLEREAD) where uidInstanceID = @uidInstanceID  AND uidAppOwnerID = N''' + @uidAppID + '''
	
IF (@fOperation <> 5)
BEGIN
	exec [dbo].[int_GetInstanceLock_' + @ApplicationName + '] @uidInstanceID, NULL, NULL, @fInstanceLockStatus output
END
--ELSE
--BEGIN
	-- Skip locking an ordered delivery send port and change value from 5 to 2 so a terminate control msg can be inserted
	-- in the else part of the next if-statement	
--	set @fOperation = 2
--END

IF (@nState = -1) --we didnt find anything when reading from the instances table
BEGIN
	set @nReturn = 3
END
ELSE IF (@fInstanceLockStatus = 0)
BEGIN
	--we were able to lock the instance. Do what ever we need to do
	IF (@fOperation = 4)
	BEGIN
		exec [dbo].[int_InsertResumeInDebugModeControlMessage_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @uidClassID, @nPriority, @ret OUTPUT
		if (@ret = 1)
		BEGIN
			-- Resume the instance
			exec [dbo].[int_AdminResumeInstance_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @uidClassID, @fOperatedOn output
		END
		ELSE
		BEGIN
			set @nReturn = 5
		END
	END
	else if (@fOperation = 3) 
	BEGIN
		-- Resume the instance
		exec [dbo].[int_AdminResumeInstance_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @uidClassID, @fOperatedOn output
	END
	ELSE IF (@fOperation = 1)
	BEGIN
		--Suspend the instance
		--get the error string from the localized strings table
		declare @nvcErrorString nvarchar(512)
		select @nvcErrorString = nvcError FROM LocalizedErrorStrings WHERE nID = 4
		exec [dbo].[int_AdminSuspendInstance_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, N''0xC0C01B50'', -1, @nvcErrorString , 1, null, @dtTimeStamp, null, null, @fOperatedOn output
	END
	ELSE
	BEGIN
		--terminate the instance
		exec [dbo].[int_AdminTerminateInstance_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @fOperatedOn output
	END
	
	-- Did we suspend/terminate/resume successfully? If we failed the lock we still
	-- write out a value of 0.
	IF (@fOperatedOn <> 0)
		set @nReturn = 1
	ELSE
		set @nReturn = 4
		
	--no need to hold onto the instance lock
	UPDATE Instances SET uidProcessID = NULL, uidActivationID = NULL, nvcProcessingServer = NULL FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
	
END
ELSE 
BEGIN
	--the instance is locked. Lets send a control message. We only send control messages if the operation is either
	--suspend or terminate. Ignore the rest of the comments since I currently dont allow multiple control messages
	--to be sent to the same instance until the first one is consumed. So basically, if there is already a pending
	--operation, we just indicate that a control message was sent.


	--If the operation is suspend, we will not send the message if there is already a pending 
	--temrinate operation. An interesting question is, since we did not acquire a lock on this instance, can we 
	--prevent inserting a row into this table even after the instance has been terminated. This would leave a dangling row
	-- in this table. Probably not a huge deal and we could have a script that runs to look for this boundary case
	--but it is something to note. I would rather have this happen, though, then to deadlock our system with excessive
	--locking
	set @nPendingOperation = 1
	set @nReturn = 0 --unless we change this, we are using a control message here
	SELECT TOP 1 @nPendingOperation = nPendingOperation FROM InstancesPendingOperations WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID ORDER BY nPendingOperation DESC
	if (@nPendingOperation = 1)	
	BEGIN
		--for suspend, we do nothing if there is already a pending terminate message or a pending suspend message
		IF (@fOperation = 1)
		BEGIN
			exec [dbo].[int_InsertSuspendControlMessage_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @uidClassID, @nPriority, @ret OUTPUT
			if (@ret = 1) --success
			BEGIN
				INSERT INTO InstancesPendingOperations (uidInstanceID, nPendingOperation, dtPendingOperationSubmitTime) VALUES (@uidInstanceID, 2, @dtTimeStamp)
			END
			ELSE
			BEGIN	
				set @nReturn = 5
			END
			
		END
		ELSE IF (@fOperation = 2 OR @fOperation = 5)
		BEGIN
			--for terminate, we only skip this if there is already a pending terminate control message
			if ( (@nPendingOperation = 1) OR (@nPendingOperation = 2) )
			BEGIN
				IF (@fOperation = 2)
				BEGIN
					exec [dbo].[int_InsertTerminateControlMessage_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @uidClassID, @nPriority, @ret OUTPUT
				END
				ELSE
				BEGIN
					-- The control msg for ordered delivery send port has to go into SuspendedQ if the ordered
					-- delivery send port is in suspended state and into the workQ otherwise

					declare @fAttrib bigint
					set @fAttrib = 0
					set @ret = 1

					--only send a control message if this service class supports control messages
					SELECT TOP 1 @fAttrib = fAttributes FROM ServiceClasses WHERE uidServiceClassID = @uidClassID
					IF ((@fAttrib & 1) > 0)
					BEGIN
						IF (@nState = 4)
						BEGIN
							INSERT INTO ' + @SuspendedQName + ' WITH (ROWLOCK)  (uidMessageID, snPriority, dtStartWindow, dtEndWindow, dtValid, uidInstanceID, uidClassID, uidServiceID, snPartRetrieval, fOrderedDelivery) 
					        	    VALUES (N''57E5E753-0207-435D-8BE7-2B9F3C6556F9'', @nPriority, 0, 0, 0, @uidInstanceID, @uidClassID, @uidServiceID, 0, 1)
							
							--Go straight to global counter for control messages
							exec int_RefCountMessage N''57E5E753-0207-435D-8BE7-2B9F3C6556F9'', 3, 1
						END
						ELSE IF (@nState <> 32)
						BEGIN
							INSERT INTO ' + @QueueName + ' WITH (ROWLOCK)  (uidMessageID, snPriority, dtStartWindow, dtEndWindow, dtValid, uidInstanceID, uidClassID, uidServiceID, snPartRetrieval, fOrderedDelivery) 
					        	    VALUES (N''57E5E753-0207-435D-8BE7-2B9F3C6556F9'', @nPriority, 0, 0, 0, @uidInstanceID, @uidClassID, @uidServiceID, 0, 1)
							
							--Go straight to global counter for control messages
							exec int_RefCountMessage N''57E5E753-0207-435D-8BE7-2B9F3C6556F9'', 3, 1
						END
						ELSE
						BEGIN
							set @ret = 0 --equivalent to skipped
						END
					END
					ELSE
					BEGIN
						set @ret = 0
					END
				END

				if (@ret = 1) --success
				BEGIN
					INSERT INTO InstancesPendingOperations (uidInstanceID, nPendingOperation, dtPendingOperationSubmitTime) VALUES (@uidInstanceID, 4, @dtTimeStamp)
				END
				ELSE
				BEGIN	
					set @nReturn = 5
				END
			END
		END
		ELSE
		BEGIN
			set @nReturn = 2 --we were unable to lock the instance
		END	
	END
END

if (@startedTrans > 0)
BEGIN
	COMMIT TRANSACTION
END

RETURN
')


--Create the subscription creation stored proc
exec ('CREATE PROCEDURE [dbo].[bts_CreateSubscription_' + @ApplicationName + ']
@nvcName nvarchar(256),
@uidSubscriptionID uniqueidentifier,
@uidSubscriptionGroupID uniqueidentifier,
@snGroupPriority smallint,
@uidClassID uniqueidentifier,
@dtStartWindow datetime,
@dtEndWindow datetime,
@dtValidTime datetime,
@uidServiceID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidPortID uniqueidentifier,
@uidPredicateGroupID uniqueidentifier,
@uidConvoySetID uniqueidentifier,
@vtConvoySetProp1DefVal sql_variant,
@vtConvoySetProp2DefVal sql_variant,
@vtConvoySetProp3DefVal sql_variant,
@snEnabled smallint,
@snPriority smallint,
@snPartRetrieval smallint,
@fOrderedDelivery int,
@fIsReqResp int,
@fCanActivateConvoySet int,
@fUnique int,
@uidDatabaseID uniqueidentifier,
@nNumPredicates int,
@fSuccess int OUTPUT
AS

set transaction isolation level read committed
set nocount on

if (@uidSubscriptionGroupID IS NULL)
	set @uidSubscriptionGroupID = NewID()

set @fSuccess = 0

if (@fUnique <> 0)
BEGIN
	INSERT INTO UniqueSubscription (uidSubscriptionID, uidInstanceID, uidServiceID, nvcName) 
		VALUES (@uidSubscriptionID, @uidInstanceID, @uidServiceID, @nvcName)
	IF (@@ROWCOUNT = 0)
	BEGIN 
		set @fSuccess = 12
		return
	END
END 

--we need to handle the case where there are no predicates but there is a convoy set
if ( (@nNumPredicates = 0) AND (@uidConvoySetID IS NOT NULL) )
BEGIN
	--lets copy one of the convoy set properties into the predicates table as a first pass predicate
	declare @uidPropID uniqueidentifier
	SELECT @uidPropID = uidPropertyID1 FROM ConvoySets WHERE uidConvoySetID = @uidConvoySetID
	if (@uidPropID IS NOT NULL)
	BEGIN
		INSERT INTO ExistsPredicates WITH (ROWLOCK) (uidPropID, uidPredicateGroupID, tnPass) VALUES (@uidPropID, @uidPredicateGroupID, 1)
		INSERT INTO PredicateGroup WITH (ROWLOCK) (uidPredicateORGroupID, uidPredicateANDGroupID, nNumFirstPassPredicates, nNumSecondPassPredicates, fIsDistributionList)
			VALUES (@uidPredicateGroupID, @uidPredicateGroupID, 1, 0, 0)
	END
END

INSERT INTO Subscription  WITH (ROWLOCK) (
							dtTimeStamp,	
							nvcName, 
							uidSubID, 
							uidSubGroupID, 
							snGroupPriority,	
							nvcApplicationName,	
							uidClassID, 
							dtStartWindow, 
							dtEndWindow,	
							dtValid, 
							uidServiceID, 
							uidInstanceID,
							uidPortID, 
							uidPredicateGroupID, 
							fEnabled, 
							uidConvoySetID, 
							vtConvoySetProp1DefVal,
							vtConvoySetProp2DefVal,
							vtConvoySetProp3DefVal,
							snPartRetrieval,
							fOrderedDelivery,
							fIsRequestResponse,
							fCanActivateConvoySet,
							uidAppInstanceID,
							uidDBOwnerID,
							snPriority
							)
VALUES						( 
							GetUTCDate(),
							@nvcName,
							@uidSubscriptionID,
							@uidSubscriptionGroupID,
							@snGroupPriority,
							N''' + @ApplicationName + ''',
							@uidClassID,
							[dbo].[bts_fnConvertUTCToLocalDate](@dtStartWindow),
							[dbo].[bts_fnConvertUTCToLocalDate](@dtEndWindow),
							@dtValidTime,
							@uidServiceID,
							@uidInstanceID,
							@uidPortID,
							@uidPredicateGroupID,
							@snEnabled,
							@uidConvoySetID,
							@vtConvoySetProp1DefVal,
							@vtConvoySetProp2DefVal,
							@vtConvoySetProp3DefVal,
							@snPartRetrieval,
							@fOrderedDelivery,
							@fIsReqResp,
							@fCanActivateConvoySet,
							NULL, --@uidAppInstanceID
							@uidDatabaseID,
							@snPriority 
							)
			
--Check to see if the insert succeeded. If the name is the same as a previously existing subscription, this will fail
if (@@ROWCOUNT = 0)
BEGIN
	set @fSuccess = 12
END

')

exec ('CREATE PROCEDURE [dbo].[bts_CreateNamedPredicateGroup_' + @ApplicationName + ']
@nvcPredicateGroupName nvarchar(256),
@uidORGroupID uniqueidentifier
AS

set nocount on
set transaction isolation level read committed

INSERT INTO PredicateGroupNames WITH (ROWLOCK) (uidPredicateGroupID, nvcName) VALUES (@uidORGroupID, @nvcPredicateGroupName)
')

exec ('CREATE PROCEDURE [dbo].[bts_InsertPredicate_' + @ApplicationName + ']
@uidORGroupID uniqueidentifier,
@uidANDGroupID uniqueidentifier,
@fIsDistributionList int,
@uidPredicateID uniqueidentifier,
@snComparisonType smallint,
@vtPredicateValue sql_variant,
@nPredicateNum int,
@nTotalPredicates int
AS

set nocount on
set transaction isolation level read committed

declare @tnPass tinyint, @cnt int
set @tnPass = 2
set @cnt = 0

--if there is only one predicate or if this is the last predicate 
if  (@nTotalPredicates = 1)
	set @tnPass = 1
else if (@nTotalPredicates = @nPredicateNum) -- this is the last predicate. Lets check outself
BEGIN
	SELECT TOP 1 @cnt = nNumFirstPassPredicates FROM PredicateGroup WITH (ROWLOCK READPAST) WHERE uidPredicateANDGroupID = @uidANDGroupID OPTION(KEEPFIXED PLAN)
	if (@cnt = 0)
		set @tnPass = 1
END 
	
if (@snComparisonType = 0)
BEGIN

	if (@tnPass = 2) --only check if we havent already decided to make it first pass
	BEGIN
		SELECT TOP 10 @cnt = COUNT(*) FROM EqualsPredicates WITH (ROWLOCK READPAST) WHERE uidPropID = @uidPredicateID AND vtValue = @vtPredicateValue OPTION(KEEPFIXED PLAN)
		if (@cnt < 10)
			set @tnPass = 1
	END
	
	if (@tnPass = 1)
		INSERT INTO EqualsPredicates WITH (ROWLOCK) (uidPropID, vtValue, uidPredicateGroupID)
			VALUES (@uidPredicateID, @vtPredicateValue, @uidANDGroupID)
	else
		INSERT INTO EqualsPredicates2ndPass WITH (ROWLOCK) (uidPropID, vtValue, uidPredicateGroupID)
			VALUES (@uidPredicateID, @vtPredicateValue, @uidANDGroupID)
END
else if (@snComparisonType = 1)
BEGIN

	if (@tnPass = 2) --only check if we havent already decided to make it first pass
	BEGIN
		SELECT TOP 10 @cnt = COUNT(*) FROM LessThanPredicates WITH (ROWLOCK READPAST) WHERE tnPass = 1 AND uidPropID = @uidPredicateID AND vtValue = @vtPredicateValue OPTION(KEEPFIXED PLAN)
		if (@cnt < 10)
			set @tnPass = 1
	END
	
	INSERT INTO LessThanPredicates WITH (ROWLOCK) (uidPropID, vtValue, uidPredicateGroupID, tnPass)
		VALUES (@uidPredicateID, @vtPredicateValue, @uidANDGroupID, @tnPass)
END
else if (@snComparisonType = 2)
BEGIN

	if (@tnPass = 2) --only check if we havent already decided to make it first pass
	BEGIN
		SELECT TOP 10 @cnt = COUNT(*) FROM LessThanOrEqualsPredicates WITH (ROWLOCK READPAST) WHERE tnPass = 1 AND uidPropID = @uidPredicateID AND vtValue = @vtPredicateValue OPTION(KEEPFIXED PLAN)
		if (@cnt < 10)
			set @tnPass = 1
	END
	
	INSERT INTO LessThanOrEqualsPredicates WITH (ROWLOCK) (uidPropID, vtValue, uidPredicateGroupID, tnPass)
		VALUES (@uidPredicateID, @vtPredicateValue, @uidANDGroupID, @tnPass)
END
else if (@snComparisonType = 3)
BEGIN

	if (@tnPass = 2) --only check if we havent already decided to make it first pass
	BEGIN
		SELECT TOP 10 @cnt = COUNT(*) FROM GreaterThanPredicates WITH (ROWLOCK READPAST) WHERE tnPass = 1 AND uidPropID = @uidPredicateID AND vtValue = @vtPredicateValue OPTION(KEEPFIXED PLAN)
		if (@cnt < 10)
			set @tnPass = 1
	END
	
	INSERT INTO GreaterThanPredicates WITH (ROWLOCK) (uidPropID, vtValue, uidPredicateGroupID, tnPass)
		VALUES (@uidPredicateID, @vtPredicateValue, @uidANDGroupID, @tnPass)
END
else if (@snComparisonType = 4)
BEGIN

	if (@tnPass = 2) --only check if we havent already decided to make it first pass
	BEGIN
		SELECT TOP 10 @cnt = COUNT(*) FROM GreaterThanOrEqualsPredicates WITH (ROWLOCK READPAST) WHERE tnPass = 1 AND uidPropID = @uidPredicateID AND vtValue = @vtPredicateValue OPTION(KEEPFIXED PLAN)
		if (@cnt < 10)
			set @tnPass = 1
	END
	
	INSERT INTO GreaterThanOrEqualsPredicates WITH (ROWLOCK) (uidPropID, vtValue, uidPredicateGroupID, tnPass)
		VALUES (@uidPredicateID, @vtPredicateValue, @uidANDGroupID, @tnPass)
END
else if (@snComparisonType = 5)
BEGIN

	if (@tnPass = 2) --only check if we havent already decided to make it first pass
	BEGIN
		SELECT TOP 10 @cnt = COUNT(*) FROM NotEqualsPredicates WITH (ROWLOCK READPAST) WHERE tnPass = 1 AND uidPropID = @uidPredicateID AND vtValue = @vtPredicateValue OPTION(KEEPFIXED PLAN)
		if (@cnt < 10)
			set @tnPass = 1
	END
	
	INSERT INTO NotEqualsPredicates WITH (ROWLOCK) (uidPropID, vtValue, uidPredicateGroupID, tnPass)
		VALUES (@uidPredicateID, @vtPredicateValue, @uidANDGroupID, @tnPass)
END
else if (@snComparisonType = 6)
BEGIN

	if (@tnPass = 2) --only check if we havent already decided to make it first pass
	BEGIN
		SELECT TOP 10 @cnt = COUNT(*) FROM ExistsPredicates WITH (ROWLOCK READPAST) WHERE tnPass = 1 AND uidPropID = @uidPredicateID OPTION(KEEPFIXED PLAN)
		if (@cnt < 10)
			set @tnPass = 1
	END
	
	INSERT INTO ExistsPredicates  WITH (ROWLOCK) (uidPropID, uidPredicateGroupID, tnPass)
		VALUES (@uidPredicateID, @uidANDGroupID, @tnPass)
END
else if (@snComparisonType = 7)
BEGIN

	if (@tnPass = 2) --only check if we havent already decided to make it first pass
	BEGIN
		SELECT TOP 10 @cnt = COUNT(*) FROM BitwiseANDPredicates WITH (ROWLOCK READPAST) WHERE tnPass = 1 AND uidPropID = @uidPredicateID  AND vtValue = @vtPredicateValue OPTION(KEEPFIXED PLAN)
		if (@cnt < 10)
			set @tnPass = 1
	END
	
	INSERT INTO BitwiseANDPredicates WITH (ROWLOCK) (uidPropID, vtValue, uidPredicateGroupID, tnPass)
		VALUES (@uidPredicateID, @vtPredicateValue, @uidANDGroupID, @tnPass)
END
	
if  (@nPredicateNum = 1) -- this is the first predicate
BEGIN
	if (@tnPass = 1)
		INSERT INTO PredicateGroup WITH (ROWLOCK) (uidPredicateORGroupID, uidPredicateANDGroupID, nNumFirstPassPredicates, nNumSecondPassPredicates, fIsDistributionList)
			VALUES (@uidORGroupID, @uidANDGroupID, 1, 0, @fIsDistributionList)
	else
		INSERT INTO PredicateGroup WITH (ROWLOCK) (uidPredicateORGroupID, uidPredicateANDGroupID, nNumFirstPassPredicates, nNumSecondPassPredicates, fIsDistributionList)
			VALUES (@uidORGroupID, @uidANDGroupID, 0, 1, @fIsDistributionList)
END
else
BEGIN
	if (@tnPass = 1)
		UPDATE PredicateGroup WITH (ROWLOCK) SET nNumFirstPassPredicates = nNumFirstPassPredicates + 1 FROM PredicateGroup WITH (ROWLOCK INDEX (CIX_PredicateGroup)) WHERE uidPredicateANDGroupID = @uidANDGroupID OPTION(KEEPFIXED PLAN)
	else
		UPDATE PredicateGroup WITH (ROWLOCK) SET nNumSecondPassPredicates = nNumSecondPassPredicates + 1 FROM PredicateGroup WITH (ROWLOCK INDEX (CIX_PredicateGroup)) WHERE uidPredicateANDGroupID = @uidANDGroupID OPTION(KEEPFIXED PLAN)
END

')

exec ('CREATE PROCEDURE [dbo].[int_InsertIntoQueue_' + @ApplicationName + ']
@uidMessageID uniqueidentifier,
@uidSubID uniqueidentifier,
@uidClassID uniqueidentifier,
@dtStartWindow datetime,
@dtEndWindow datetime,
@dtValid datetime,
@uidServiceID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidAppInstanceID uniqueidentifier,
@uidPortID uniqueidentifier,
@snPartRetrieval smallint,
@fOrderedDelivery int,
@snPriority smallint,
@fEnabled int,
@fReserved int,
@nvcUserState nvarchar(256) = null,
@uidConvoySetID uniqueidentifier = null,
@nRefCount int = 0
AS

set nocount on
set transaction isolation level read committed

declare @varMessageID varchar(50)
declare @uidInterceptorID uniqueidentifier
declare @nState int
declare @nvcErrorMsg nvarchar(256)
declare @dtSuspendTimeStamp datetime
declare @fInConvoy int

set @fInConvoy = 0
IF (@uidConvoySetID IS NOT NULL)
	set @fInConvoy = 2 --we dont use 1 here because we are putting this in the fActivitating column and 1 is already used

set @uidInterceptorID = N''{D1A805A2-B1B5-42bc-A29F-D128131DDCD0}'' -- Agents ID in the tracking stream


if (@uidInstanceID IS NULL)
BEGIN
	set @uidInstanceID = NewID() --Need to do this or insert into Q will fail. 
	--This is a new instance so lets add it to the instance table

	--for now I only insert the user state in for the routing failure reports. It is the only time it is used and I dont feel like messing around with other stuff right now.
	
	if (@fEnabled = 2)
	BEGIN
		SELECT @nvcErrorMsg = nvcError FROM LocalizedErrorStrings WHERE nID = 1 OPTION (KEEPFIXED PLAN)
		
		set @dtSuspendTimeStamp = GetUTCDate()
		INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, nState, dtSuspendTimeStamp, nErrorCategory, nvcErrorID, nvcErrorDescription) 
			VALUES (N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID, 4, @dtSuspendTimeStamp, -3, ''0xC0C01B4D'', @nvcErrorMsg)

		INSERT INTO InstancesSuspended WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, dtCreated, nState, nvcUserState, dtSuspendTimeStamp, nvcAdapter, nvcURI, nErrorCategory, nvcErrorID, nvcErrorDescription) 
		VALUES (N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID, GetUTCDate(), 4, NULL, @dtSuspendTimeStamp, NULL, NULL, -3, ''0xC0C01B4D'', @nvcErrorMsg) 
	END
	ELSE if (@fEnabled = 8)
	BEGIN
		SELECT @nvcErrorMsg = nvcError FROM LocalizedErrorStrings WHERE nID = 3	OPTION (KEEPFIXED PLAN)
		SET @nvcErrorMsg = replace( @nvcErrorMsg, ''%i'', @nvcUserState)

		set @dtSuspendTimeStamp = GetUTCDate()			
		INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, nState, dtSuspendTimeStamp, nErrorCategory, nvcErrorID, nvcErrorDescription, nvcUserState) 
			VALUES (N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID, 32, @dtSuspendTimeStamp, -3, ''0xC0C01B4e'', @nvcErrorMsg, @nvcUserState)

		INSERT INTO InstancesSuspended WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, dtCreated, nState, nvcUserState, dtSuspendTimeStamp, nvcAdapter, nvcURI, nErrorCategory, nvcErrorID, nvcErrorDescription) 
		VALUES (N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID, GetUTCDate(), 32, @nvcUserState, @dtSuspendTimeStamp, NULL, NULL, -3, ''0xC0C01B4e'', @nvcErrorMsg ) 
	END
	ELSE IF (@dtStartWindow = @dtEndWindow)
	BEGIN
		INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID) 
			VALUES (N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID)
	END
	ELSE  --service window exists so the instance is in a scheduled state
	BEGIN
		INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, nState) 
			VALUES (N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID, 256)
	END
END
	
if (@snPriority IS NULL)
	set @snPriority = 5		--Default Priority
else if (@snPriority < 1)
	set @snPriority = 1	--Highest Priority
else if (@snPriority > 10)
	set @snPriority = 10	--Lowest Priority
		
if (@fEnabled = 1)
BEGIN
	Insert into ' + @QueueName + ' WITH (ROWLOCK) (uidMessageID, uidSubscriptionID, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPriority, snPartRetrieval, fOrderedDelivery, nReserved, fFirstMessage) VALUES (@uidMessageID, @uidSubID, @uidClassID, @dtStartWindow, @dtEndWindow, @dtValid, @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID, @snPriority, @snPartRetrieval, @fOrderedDelivery, @fReserved, @fInConvoy)
END
else if (@fEnabled = 2)
BEGIN
	SELECT @nvcErrorMsg = nvcError FROM LocalizedErrorStrings WHERE nID = 2 OPTION (KEEPFIXED PLAN)
	
	Insert into ' + @SuspendedQName + ' WITH (ROWLOCK) (uidMessageID, uidSubscriptionID, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPriority, snPartRetrieval, fOrderedDelivery, nvcErrorID, nvcAdditionalInfo, nReserved)  VALUES (@uidMessageID, @uidSubID, @uidClassID, @dtStartWindow, @dtEndWindow, @dtValid, @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID, @snPriority, @snPartRetrieval, @fOrderedDelivery, N''0xC0C01B4D'', @nvcErrorMsg, @fReserved)
	
	set @varMessageID = @uidMessageID
	exec bts_InsertTrackingData @uidServiceID, @uidInstanceID, N''' + @ApplicationName + ''', -3, @uidServiceID, @uidClassID, @@SERVERNAME, @varMessageID, @uidInterceptorID
END
else if (@fEnabled = 4)
BEGIN
	Insert into ' + @StateQName + ' WITH (ROWLOCK) (uidInstanceID, uidInstanceStateID, uidMessageID, uidServiceID, uidPortID)  VALUES (@uidInstanceID, @uidInstanceID, @uidMessageID, @uidServiceID, @uidPortID)
END
else if (@fEnabled = 8) --this is for suspension of routing failure messages which wont be resumed
BEGIN
	SELECT @nvcErrorMsg = nvcError FROM LocalizedErrorStrings WHERE nID = 3 OPTION (KEEPFIXED PLAN)

	SET @nvcErrorMsg = replace( @nvcErrorMsg, ''%i'', @nvcUserState)
	
	Insert into ' + @SuspendedQName + ' WITH (ROWLOCK) (uidMessageID, uidSubscriptionID, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPriority, snPartRetrieval, fOrderedDelivery, nvcErrorID, nvcAdditionalInfo, nReserved)  VALUES (@uidMessageID, @uidSubID, @uidClassID, @dtStartWindow, @dtEndWindow, @dtValid, @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID, @snPriority, @snPartRetrieval, @fOrderedDelivery, N''0xC0C01B4e'', @nvcErrorMsg, @fReserved)
END

if (@nRefCount = 1)
BEGIN
	--this message was routed to only us so we will refcount it locally
	exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, 1, 1
END
	
')

--Create the Instance Locking stored proc
-- fSuccess = 0		Success (Instance Locked)
--			= 70	Multiple Instances matching
--			= 40	No Instance matching Subscription
--			= 3		Lock is already taken

exec ('CREATE PROCEDURE [dbo].[bts_LockInstanceByID_' + @ApplicationName + ']
@uidClassID uniqueidentifier,
@uidServiceID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@fSuccess int OUTPUT,
@uidActivationID uniqueidentifier OUTPUT


AS

DECLARE @retVal smallint,
		@nCount int,
		@uidProcessID uniqueidentifier,
		@uidInstanceProcessID uniqueidentifier,
		@uidInstanceActivationID uniqueidentifier				

set nocount on
set transaction isolation level read committed
set @fSuccess = 0		
set @uidInstanceProcessID = NULL
set @uidProcessID = APP_NAME()
set @uidActivationID = NewID()

if (@uidClassID IS NULL)
	set @uidClassID = NewID()

if (@uidServiceID IS NULL)
	set @uidServiceID = NewID()

-- Try to get the AppLock. This is ensure that no two Processes/Sessions are trying to do the same thing

exec  @retVal = sp_getapplock @uidInstanceID, ''Exclusive'', ''Session'', 0 

IF (@retVal = 0 ) -- Lock granted
BEGIN

	-- Check if the Instance is available for Locking
	
	SELECT @uidInstanceProcessID = uidProcessID,  @uidInstanceActivationID = uidActivationID FROM Instances WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''

	-- Check if the Instance exists
		
	if (@@ROWCOUNT = 0)
	BEGIN
		INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, nState, uidProcessID, uidActivationID, nvcProcessingServer) 
			VALUES ( N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID, 2, @uidProcessID, @uidActivationID, HOST_NAME()) 
	END
	
	-- Check if the Instance is already locked by some other process
	else if ( @uidInstanceProcessID IS NOT NULL AND @uidInstanceProcessID <> @uidProcessID)
	BEGIN
		set @fSuccess = 3
	END
	
	-- Otherwise Mark the Instance as LOCKED
	
	else if ( @uidInstanceProcessID IS NULL )
	BEGIN
		UPDATE Instances WITH (ROWLOCK) SET nState = 2, uidProcessID = @uidProcessID, uidActivationID = @uidActivationID, nvcProcessingServer = HOST_NAME() WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
	END
	
	else
	BEGIN
		set @uidActivationID = @uidInstanceActivationID
	END

	
	exec sp_releaseapplock @uidInstanceID, ''Session''
	
END
ELSE					-- Already Locked by someone else. Sorry...
BEGIN
	set @fSuccess = 3
END

if ( @fSuccess > 0 )
BEGIN
	return
END

SELECT d.uidInstanceStateID, d.uidClassID, d.uidServiceID, d.uidInstanceID, d.imgData, i.nvcUserState
		FROM ' + @DynamicStateTable + ' AS d WITH (ROWLOCK), Instances AS i 
		WHERE d.uidInstanceID = @uidInstanceID AND d.uidInstanceStateID = @uidInstanceID AND i.uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''

')


--Create stored procs for managing dynamic state info
exec ('CREATE PROCEDURE [dbo].[bts_InsertDynamicStateInfo_' + @ApplicationName + ']
@uidClassID uniqueidentifier,
@uidServiceID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidActivationID uniqueidentifier,
@uidInstanceStateID uniqueidentifier,
@imgData image,
@nvcUserState nvarchar(256),
@fSuccess int OUTPUT
AS

set transaction isolation level read committed
set nocount on

declare @dtTimeStamp datetime,
		@uidProcessID uniqueidentifier,
		@nCount int
		
set @dtTimeStamp = GetUTCDate()
set @fSuccess = 0 

-- Check if the Instance is currently Locked by the caller, i.e. the Instance Activation ID is matching

if ( @uidInstanceID IS NOT NULL AND @uidActivationID IS NOT NULL)
begin
	set @uidProcessID = APP_NAME()
	SELECT @nCount = COUNT(*) FROM Instances WITH (ROWLOCK REPEATABLEREAD) 
	WHERE (uidInstanceID = @uidInstanceID AND uidProcessID = @uidProcessID AND uidActivationID = @uidActivationID )
	OPTION (KEEPFIXED PLAN)
	
	if ( @nCount = 0 )
	begin
		set @fSuccess = 10
		return
	end
	
end


IF (@uidInstanceStateID IS NULL)
BEGIN
	set @uidInstanceStateID = NewID()
END

IF @uidInstanceStateID = @uidInstanceID AND @nvcUserState IS NOT NULL
	UPDATE Instances SET nvcUserState = @nvcUserState where uidInstanceID = @uidInstanceID  AND uidAppOwnerID = N''' + @uidAppID + '''

UPDATE ' + @DynamicStateTable + '  WITH (ROWLOCK UPDLOCK)
SET		dtTimeStamp = @dtTimeStamp,
		imgData = @imgData
WHERE uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID

if ( @@ROWCOUNT = 0 )
BEGIN
	INSERT INTO ' + @DynamicStateTable + ' WITH (ROWLOCK) (
			uidInstanceStateID,
			uidClassID,
			uidServiceID,
			uidInstanceID,
			dtTimeStamp,
			imgData)
		VALUES (
			@uidInstanceStateID,
			@uidClassID,
			@uidServiceID,
			@uidInstanceID,
			@dtTimeStamp,
			@imgData
			) 
END
')

--
-- @nScanFlag	1 : Load Details from the State Table only
--				2 : Load all details

exec ('CREATE PROCEDURE [dbo].[bts_GetDynamicStateInfo_' + @ApplicationName + ']
@nScanFlag int,							
@uidInstanceID uniqueidentifier,
@uidInstanceStateID uniqueidentifier

AS

set transaction isolation level read committed
set nocount on

if ( @nScanFlag = 1 )	-- Load the details from the State table only
BEGIN
	SELECT d.uidInstanceStateID, d.uidClassID, d.uidServiceID, d.uidInstanceID, d.imgData, NULL
	FROM ' + @DynamicStateTable + ' d WITH (INDEX([IX_DYNAMICSTATEINFO_INSTANCEID' + @ApplicationName + ']))
	WHERE d.uidInstanceID = @uidInstanceID AND d.uidInstanceStateID = @uidInstanceStateID
	OPTION (KEEPFIXED PLAN)
END
else							-- Load all the details (join the Instances table) 
BEGIN
	SELECT d.uidInstanceStateID, i.uidClassID, i.uidServiceID, i.uidInstanceID, d.imgData, i.nvcUserState
	FROM ' + @DynamicStateTable + ' d, Instances i
	WHERE d.uidInstanceID = @uidInstanceID AND d.uidInstanceStateID = @uidInstanceStateID AND i.uidInstanceID = @uidInstanceID  AND uidAppOwnerID = N''' + @uidAppID + '''
END

')

exec ('CREATE PROCEDURE [dbo].[bts_ManageScheduledQ_' + @ApplicationName + ']
AS


set nocount on
set transaction isolation level read committed

declare @dtNow datetime
set @dtNow = GetUTCDate()

--There is a trigger on the delete action which will insert the rows into the ApplicationQ
DELETE FROM ' + @ScheduledQName + '
WHERE   @dtNow >= dtValid AND
	1 = [dbo].[bts_fnInWindow](@dtNow, dtStartWindow, dtEndWindow)

')

exec ('CREATE PROCEDURE [dbo].[bts_RemoveScheduledItems_' + @ApplicationName + ']
AS

set nocount on
set transaction isolation level read committed

declare @dtNow datetime
set @dtNow = GetUTCDate()

declare @uidWorkID uniqueidentifier,
	@uidMessageID uniqueidentifier,
	@uidSubscriptionID uniqueidentifier ,
	@dtLastTouched datetime ,
	@snPriority smallint ,
	@uidClassID uniqueidentifier ,
	@dtStartWindow datetime ,
	@dtEndWindow datetime ,
	@uidServiceID uniqueidentifier ,
	@uidInstanceID uniqueidentifier ,
	@uidAppInstanceID uniqueidentifier ,
	@uidPortID uniqueidentifier ,
	@snPartRetrieval smallint ,
	@fOrderedDelivery int ,
	@nRetryCount int,
	@retVal int

DECLARE ScheduledCursor CURSOR FAST_FORWARD FOR
	SELECT *
	FROM ' + @QueueName + ' AS w WITH (ROWLOCK READPAST)
	WHERE w.dtEndWindow <> w.dtStartWindow AND
	      0 = [dbo].[bts_fnInWindow](@dtNow, w.dtStartWindow, w.dtEndWindow)

open ScheduledCursor

--Need to try and get the lock on the instance
WHILE (1 = 1)
BEGIN
	FETCH NEXT FROM ScheduledCursor INTO 	@uidWorkID ,
						@uidMessageID ,
						@uidSubscriptionID ,
						@dtLastTouched ,
						@snPriority ,
						@uidClassID ,
						@dtStartWindow ,
						@dtEndWindow ,
						@uidServiceID ,
						@uidInstanceID ,
						@uidAppInstanceID ,
						@uidPortID ,
						@snPartRetrieval ,
						@fOrderedDelivery ,
						@nRetryCount
	IF ( @@FETCH_STATUS = -2 )
	BEGIN
		CONTINUE		-- Row was deleted. Try the Next Row
	END
	ELSE IF ( @@FETCH_STATUS = 0 )	-- Try to get the applock
	BEGIN
		exec [dbo].[int_GetInstanceLock_' + @ApplicationName + '] @uidInstanceID, NULL, NULL, @retVal output
		IF (@retVal = 0 )	-- Move this to the scheduledQ
		BEGIN
			DELETE FROM ' + @QueueName + '
			WHERE uidWorkID = @uidWorkID

			exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, 1, 1
			INSERT INTO ' + @ScheduledQName + ' WITH (ROWLOCK) (uidWorkID , uidMessageID , uidSubscriptionID , dtLastTouched , snPriority , uidClassID , dtStartWindow , dtEndWindow , uidServiceID , uidInstanceID , uidAppInstanceID , uidPortID , snPartRetrieval , fOrderedDelivery, nRetryCount)
						     VALUES (@uidWorkID, @uidMessageID, @uidSubscriptionID, @dtLastTouched, @snPriority, @uidClassID, @dtStartWindow, @dtEndWindow, @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID, @snPartRetrieval, @fOrderedDelivery, @nRetryCount)
	
			UPDATE Instances WITH (ROWLOCK) SET uidProcessID = NULL, uidActivationID = NULL, nvcProcessingServer = NULL WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
		END
	END
	ELSE
	BEGIN
		BREAK
	END

	
END

close ScheduledCursor
deallocate ScheduledCursor
')

--Create the associated dequeue stored proc
---

-- dwCommand	
--				0x01	- Skip Correlation Messages 
--				0x02	- Skip Activation/Rehydration Messages
--				0x04	- Skip Ordered Messages 

exec ('CREATE PROCEDURE [dbo].[bts_DeQueueMessages_' + @ApplicationName + ']
@uidClassID uniqueidentifier,
@uidAppInstanceID uniqueidentifier,
@nBatchCount int,
@dwCommand	int
AS
set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @dtNow datetime,
	@dtUTCNow datetime

set @dtNow = GetDate() --we stored everything in local for service windows
set @dtUTCNow = GetUTCDate()

declare @uidInstanceID uniqueidentifier,
	@uidMessageID uniqueidentifier,
	@uidWorkID uniqueidentifier,
	@uidBatchID uniqueidentifier,
	@snPartRetrieval smallint,
	@fOrderedDelivery int,
	@nCount int,
	@fQueueEmpty int,
	@retVal int,
	@temp uniqueidentifier,
	@fFirstMessage int,
	@fBodyPartMsgExists int,
	@fNoPartMsgExists int,
	@fAllPartsMsgExists int,
	@uidProcessID uniqueidentifier,
	@uidActivationID uniqueidentifier,
	@fDequeueCurrentMsg int,
	@fInstanceLocked int,
	@fOrderedDeliveryExists int,
	@nState int,
	@dtLastTouched datetime,
	@uidTempProcessID uniqueidentifier,
	@fSkipActivation int,
	@fSkipCorrelation int,
	@fSkipOrderedDelivery int,
	@fOptimize smallint,
	@snPriority smallint,
	@nID int

declare	@fDequeueOrderedMessages bit,
	@fFoundOrderedMessages bit

set @uidProcessID = APP_NAME()
set @uidBatchID = NewID()
set @fFoundOrderedMessages = 0
set @nCount = 0
 
if ( (@dwCommand & 4) > 0 )
	set @fDequeueOrderedMessages = 0
ELSE
	set @fDequeueOrderedMessages = 1
START_DEQUEUE:
set @fQueueEmpty = 1
set @fOptimize = 1
if (@fDequeueOrderedMessages = 0)
BEGIN
	DECLARE btscurse CURSOR FAST_FORWARD FOR
	SELECT TOP 20 w.uidWorkID, w.uidInstanceID, w.uidMessageID, w.snPartRetrieval, w.fOrderedDelivery, w.snPriority, w.dtLastTouched, w.nID, i.uidProcessID, i.uidActivationID, i.nState
	FROM ' + @QueueName + ' AS w WITH (UPDLOCK ROWLOCK READPAST)
	INNER LOOP JOIN Instances AS i WITH (UPDLOCK ROWLOCK READPAST) ON ( w.uidInstanceID = i.uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''') AND ( i.uidProcessID IS NULL OR i.uidProcessID = @uidProcessID )
	WHERE
		--This determines if we already dequeued this Item
		( w.uidProcessID IS NULL ) AND
		--This determines if we should take Ordered Delivery Items or not
		-- (Ordered Delivery can be DQed by the Primary DQ thread only)
		w.fOrderedDelivery = 0  AND
		--This determines if it is past the valid time
		( @dtUTCNow >= w.dtValid ) AND
		-- This determines if it is in the window
		1 = [dbo].[bts_fnInWindow](@dtNow, w.dtStartWindow, w.dtEndWindow) AND
		-- This makes sure we Dequeue for the given Service Class ID
		(
		w.uidClassID = @uidClassID
		) AND
		-- This makes sure we dequeue for the given Application Process
		(
			   ( w.uidAppInstanceID IS NULL )
			OR ( @uidAppInstanceID IS NULL  )
			OR ( w.uidAppInstanceID = @uidAppInstanceID )
		)
	ORDER BY w.uidClassID, w.fOrderedDelivery, w.snPriority, w.dtLastTouched, w.nID 
	OPTION(KEEPFIXED PLAN)
END
ELSE
BEGIN
	DECLARE btscurse CURSOR FAST_FORWARD FOR
	SELECT TOP 20 w.uidWorkID, w.uidInstanceID, w.uidMessageID, w.snPartRetrieval, w.fOrderedDelivery, w.snPriority, w.dtLastTouched, w.nID, i.uidProcessID, i.uidActivationID, i.nState
	FROM ' + @QueueName + ' AS w WITH (UPDLOCK ROWLOCK)
	INNER LOOP JOIN Instances AS i WITH (UPDLOCK ROWLOCK) ON ( w.uidInstanceID = i.uidInstanceID AND i.dtValidTime <= @dtUTCNow AND uidAppOwnerID = N''' + @uidAppID + ''') AND ( i.uidProcessID IS NULL OR i.uidProcessID = @uidProcessID )
	WHERE
		--This determines if we already dequeued this Item
		( w.uidProcessID IS NULL ) AND
		--This determines if we should take Ordered Delivery Items or not
		-- (Ordered Delivery can be DQed by the Primary DQ thread only)
		w.fOrderedDelivery = 1  AND
		--This determines if it is past the valid time
		( @dtUTCNow >= w.dtValid ) AND
		-- This determines if it is in the window
		1 = [dbo].[bts_fnInWindow](@dtNow, w.dtStartWindow, w.dtEndWindow) AND
		-- This makes sure we Dequeue for the given Service Class ID
		(
		w.uidClassID = @uidClassID
		) AND
		-- This makes sure we dequeue for the given Application Process
		(
			   ( w.uidAppInstanceID IS NULL )
			OR ( @uidAppInstanceID IS NULL  )
			OR ( w.uidAppInstanceID = @uidAppInstanceID )
		)
	ORDER BY w.uidClassID, w.fOrderedDelivery, w.snPriority, w.dtLastTouched, w.nID 
	OPTION(KEEPFIXED PLAN)
END
OPEN btscurse
WHILE ( (@nCount < @nBatchCount) )
BEGIN
	set @fFirstMessage = 0
	
	FETCH NEXT FROM btscurse INTO @uidWorkID, @uidInstanceID, @uidMessageID, @snPartRetrieval, @fOrderedDelivery, @snPriority, @dtLastTouched, @nID, @uidTempProcessID, @uidActivationID, @nState
	
	-- If the Row is missing, skip to the next Row
	
	IF ( @@FETCH_STATUS = -2 )
	BEGIN
		CONTINUE		-- Try the Next Row
	END
	ELSE IF ( @@FETCH_STATUS <> 0 )	-- Other Failure. Break Out
	BEGIN
		BREAK
	END
	-- Make sure that no other parallel DQ thread is contending on this Row. Take a transaction AppLock on the Work ID
	
	exec  @retVal = sp_getapplock @uidWorkID, ''Exclusive'', ''Transaction'', 0 
	
	if (@retVal <> 0 )	-- Not Granted. Some other DQ thread is trying to get this Work-item. Continue with the next one
	BEGIN
		CONTINUE
	END
	-- If this is an Acivation, verify that this Instance is still available, i.e. no parallel DQ thread of another process
	-- has taken the Instance and Lock the Instance
	
	-- Re-fetch the Instance record with a REPEATABLE READ lock on the Instance so that no one is able to update the Instance 
	-- while we are still considering taking it
	
	set @uidTempProcessID = NULL
	
	SELECT @uidTempProcessID = uidProcessID, @uidActivationID = uidActivationID, @nState = nState, @fOptimize = fOptimize FROM Instances WITH (READPAST ROWLOCK REPEATABLEREAD) 
	WHERE (uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''')
	OPTION (KEEPFIXED PLAN)
	
	if ( @@ROWCOUNT = 0)	-- Locked, bypass the row
	BEGIN
		CONTINUE
	END
	
		if ( @uidTempProcessID IS NULL )
	BEGIN
		set @uidActivationID = @uidBatchID
		
		exec [dbo].[int_GetInstanceLock_' + @ApplicationName + '] @uidInstanceID, @uidActivationID, 2, @retVal OUTPUT
	
		if (@retVal <> 0 )	-- Not Granted. Some other DQ thread is trying to get this Instance
		BEGIN
			CONTINUE
		END
		
		--we are activating this instance (it was ready-to-run or it was scheduled)
		if ( (@nState = 1) OR (@nState = 256) )
			set @fFirstMessage = 1
	END
	else if ( @uidTempProcessID <> @uidProcessID )	-- This Instance is already dequeued by someone else in between our cursor read and repeatable read
	BEGIN
		CONTINUE
	END
	
	-- Update the Queue Item. We add the first message flag since it would also include convoy information when appropriate
	UPDATE ' + @QueueName + ' SET uidProcessID = @uidProcessID, fOptimize = @fOptimize, fFirstMessage = fFirstMessage + @fFirstMessage, uidActivationID = @uidActivationID
	WHERE uidClassID = @uidClassID AND fOrderedDelivery = @fOrderedDelivery AND snPriority = @snPriority AND dtLastTouched = @dtLastTouched AND nID = @nID AND uidProcessID IS NULL 
	OPTION (KEEPFIXED PLAN)
	
	IF ( @@ROWCOUNT > 0 )
	BEGIN	
		set @nCount = @nCount + 1
		INSERT INTO [' + @ApplicationName + '_DequeueBatches] (uidBatchID, uidClassID, fOrderedDelivery, snPriority, dtLastTouched, nID) VALUES (@uidBatchID, @uidClassID, @fOrderedDelivery, @snPriority, @dtLastTouched, @nID)
	END
			
END
IF ( @@FETCH_STATUS = 0 )
BEGIN
	set @fQueueEmpty = 0	-- Indicate that there are Stuff to be processed in the Queue by Other Sessions
END
CLOSE btscurse
DEALLOCATE btscurse
if ( (@nCount > 0) AND (@fDequeueOrderedMessages > 0) )
BEGIN
	set @fFoundOrderedMessages = 1
END
if ( (@nCount < @nBatchCount) AND (@fDequeueOrderedMessages > 0) )
BEGIN
	--this was an ordered delivery dequeue attempt which returned zero rows. Instead of returning 0, lets run through again and pretend we are not ordered delivery
	set @fDequeueOrderedMessages = 0
	set @nBatchCount = @nBatchCount - @nCount --only get however many more we need
	GOTO START_DEQUEUE
END
IF ( @fQueueEmpty > 0 )
BEGIN
	--we use the nolock hint here because this is purely an optimization and we dont even want to hold shared locks because of deadlock scenarios
	SELECT TOP 1 @uidInstanceID = uidInstanceID FROM ' + @QueueName + '  WITH (NOLOCK) WHERE uidClassID = @uidClassID AND uidProcessID IS NULL OPTION (KEEPFIXED PLAN)
	if ( @@ROWCOUNT > 0 ) set @fQueueEmpty = 0
END
SELECT @nCount, @fQueueEmpty
IF ( @nCount = 0 )
BEGIN
	return
END
if (@fFoundOrderedMessages = 0)
BEGIN
	SELECT TOP 20 w.uidMessageID, s.dtTimeStamp, s.dtExpiration, s.nNumParts, s.OriginatorSID, s.OriginatorPID,
		w.uidClassID, w.uidServiceID, w.uidInstanceID, w.uidSubscriptionID, w.uidPortID, w.uidWorkID,
		NULL, NULL, s.imgContext, w.nRetryCount, w.nReserved, w.fFirstMessage, NULL, w.uidActivationID, w.fOptimize
	FROM [' + @ApplicationName + '_DequeueBatches] b
	INNER LOOP JOIN ' + @QueueName + ' AS w WITH (ROWLOCK INDEX([IX_' + @ApplicationName + 'Q])) ON b.uidClassID = w.uidClassID AND b.fOrderedDelivery = w.fOrderedDelivery AND b.snPriority = w.snPriority AND b.dtLastTouched = w.dtLastTouched AND b.nID =  w.nID
	INNER LOOP JOIN Spool AS s WITH (ROWLOCK INDEX(IX_Spool)) ON (w.uidMessageID = s.uidMessageID)
	WHERE ( b.uidBatchID = @uidBatchID )
	OPTION(KEEPFIXED PLAN)
END
ELSE
BEGIN
	SELECT TOP 20 w.uidMessageID, s.dtTimeStamp, s.dtExpiration, s.nNumParts, s.OriginatorSID, s.OriginatorPID,
		w.uidClassID, w.uidServiceID, w.uidInstanceID, w.uidSubscriptionID, w.uidPortID, w.uidWorkID,
		NULL, NULL, s.imgContext, w.nRetryCount, w.nReserved, w.fFirstMessage, NULL, w.uidActivationID, w.fOptimize
	FROM [' + @ApplicationName + '_DequeueBatches] b
	INNER LOOP JOIN ' + @QueueName + ' AS w WITH (ROWLOCK INDEX([IX_' + @ApplicationName + 'Q])) ON b.uidClassID = w.uidClassID AND b.fOrderedDelivery = w.fOrderedDelivery AND b.snPriority = w.snPriority AND b.dtLastTouched = w.dtLastTouched AND b.nID =  w.nID
	INNER LOOP JOIN Spool AS s WITH (ROWLOCK INDEX(IX_Spool)) ON (w.uidMessageID = s.uidMessageID)
	WHERE ( b.uidBatchID = @uidBatchID )
	ORDER BY w.uidClassID, w.fOrderedDelivery, w.snPriority, w.dtLastTouched, w.nID
	OPTION(KEEPFIXED PLAN)
END
SELECT TOP 80 w.uidMessageID,
		mp.nvcPartName, mp.uidPartID, mp.nBodyPart,
		p.nPartSize, p.nNumFragments,p.imgPropBag, p.imgPart, w.uidWorkID
FROM [' + @ApplicationName + '_DequeueBatches] b
INNER LOOP JOIN ' + @QueueName + ' AS w WITH (ROWLOCK INDEX([IX_' + @ApplicationName + 'Q])) ON b.uidClassID = w.uidClassID AND b.fOrderedDelivery = w.fOrderedDelivery AND b.snPriority = w.snPriority AND b.dtLastTouched = w.dtLastTouched AND b.nID =  w.nID
INNER LOOP JOIN MessageParts AS mp WITH (ROWLOCK INDEX(CIX_MessageParts)) ON (w.uidMessageID = mp.uidMessageID)
INNER LOOP JOIN Parts AS p WITH (ROWLOCK INDEX(IX_Parts)) ON (mp.uidPartID = p.uidPartID)
WHERE ( b.uidBatchID = @uidBatchID  )
OPTION(KEEPFIXED PLAN)
	
DELETE FROM [' + @ApplicationName + '_DequeueBatches] WHERE uidBatchID = @uidBatchID
	
return
')
-- Internal SP For Process Cleanup

exec ('CREATE PROCEDURE [dbo].[int_ProcessCleanup_' + @ApplicationName +']
@uidProcessID uniqueidentifier
AS

declare @retVal int,
		@uidWorkID uniqueidentifier,
		@uidInstanceID uniqueidentifier,
		@uidClassID uniqueidentifier,
		@uidServiceID uniqueidentifier,
		@nState int,
		@uidInstanceIDTemp uniqueidentifier


IF ( @uidProcessID IS NULL )	
BEGIN
	set @uidProcessID = APP_NAME()
END

-- Make sure that only one process is doing this. Take an AppLock to ensure this

exec  @retVal = sp_getapplock @uidProcessID, ''Exclusive'', ''Session'', 0 

if (@retVal <> 0 )	-- Not Granted. Some other thread is trying to cleanup this process
BEGIN
	return
END

set nocount on
set transaction isolation level read committed
	
DELETE FROM ProcessHeartbeats WHERE nvcApplicationName = ''' + @ApplicationName + ''' AND uidProcessID = @uidProcessID

if (@@ROWCOUNT <> 0)
BEGIN

	-- Release All Q Items Held by this Process

	DECLARE btsMsgCurse CURSOR FOR
		SELECT q.uidWorkID, q.uidInstanceID FROM ' + @QueueName + ' AS q WITH (ROWLOCK)
		WHERE (uidProcessID = @uidProcessID) OPTION(KEEPFIXED PLAN)
		
	OPEN btsMsgCurse


	WHILE ( 1 = 1 )
	BEGIN
		FETCH NEXT FROM btsMsgCurse INTO @uidWorkID, @uidInstanceID
		
		IF ( @@FETCH_STATUS = -2 )
		BEGIN
			CONTINUE		-- Try the Next Row
		END
		ELSE IF ( @@FETCH_STATUS <> 0 )	-- Other Failure. Break Out
		BEGIN
			BREAK
		END
		
		UPDATE ' + @QueueName + ' SET uidProcessID = NULL, uidActivationID = NULL WHERE CURRENT OF btsMsgCurse
	END

	CLOSE btsMsgCurse
	DEALLOCATE btsMsgCurse

	-- Mark all non-suspended instances as dehydrated and Unlock
		
	-- Release All Instances Locked by this Process

	DECLARE btsInstanceCurse CURSOR FOR
		SELECT i.uidInstanceID, i.uidClassID, i.uidServiceID, i.nState FROM Instances AS i WITH (ROWLOCK)
		WHERE (uidProcessID = @uidProcessID) OPTION(KEEPFIXED PLAN)
		
	OPEN btsInstanceCurse

	WHILE ( 1 = 1 )
	BEGIN
		FETCH NEXT FROM btsInstanceCurse INTO @uidInstanceID, @uidClassID, @uidServiceID, @nState
		
		IF ( @@FETCH_STATUS = -2 )
		BEGIN
			CONTINUE		-- Try the Next Row
		END
		ELSE IF ( @@FETCH_STATUS <> 0 )	-- Other Failure. Break Out
		BEGIN
			BREAK
		END

		IF (((@uidClassID = N''226FC6B9-0416-47A4-A8E8-4721F1DB1A1B'') OR (@uidClassID = N''BB3A1470-F5C4-47C3-B71F-EAABC260FBD0'')) AND @nState <> 4 AND @nState <> 16 AND @nState <> 32 )
		BEGIN
			set @nState = 8	

			-- If an instance does not have a message tied to it, insert a Restart Msg for that instance (for service 
			-- recovery):
			
			BEGIN TRANSACTION

			SELECT TOP 1 @uidInstanceIDTemp = q.uidInstanceID FROM ' + @QueueName + ' AS q WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) 
			         WHERE q.uidInstanceID = @uidInstanceID 
                                 OPTION (KEEPFIXED PLAN)
			IF (0 = @@ROWCOUNT)
			BEGIN				

				INSERT INTO ' + @QueueName + ' WITH (ROWLOCK) (uidMessageID, snPriority, dtStartWindow, dtEndWindow, dtValid, uidInstanceID, uidClassID, uidServiceID, snPartRetrieval)
				VALUES (N''61EAA7FC-AC85-42d9-BF3E-1BED258B82BE'', 5, 0, 0, 0, @uidInstanceID, @uidClassID, @uidServiceID, 0)

				--Ref-counting logic to count the Restart Msg: Global counter used for control messages
				exec int_RefCountMessage N''61EAA7FC-AC85-42d9-BF3E-1BED258B82BE'', 3, 1
				
			END
			COMMIT TRANSACTION
		END

		UPDATE Instances SET uidProcessID = NULL, uidActivationID = NULL, nvcProcessingServer = NULL, nState = @nState
		WHERE CURRENT OF btsInstanceCurse

	END

	CLOSE btsInstanceCurse
	DEALLOCATE btsInstanceCurse

END

exec sp_releaseapplock @uidProcessID, ''Session''

')

-- SP For Process Heartbeat
-- dwCommand
--			0x01	: Cleanup current Process
--			0x02	: Skip Auto-cleanup of Other Processes

exec ('CREATE PROCEDURE [dbo].[bts_ProcessHeartbeat_' + @ApplicationName +']
@uidProcessID uniqueidentifier,
@dwCommand int,
@nHeartbeatInterval	int	-- Seconds
AS

DECLARE @fCleanupCurrent int,
		@fRemoveCurrent int,
		@dtCurrentTime DATETIME,
		@dtNextHeartbeatTime DATETIME
		
IF ( @uidProcessID IS NULL )	
BEGIN
	set @uidProcessID = APP_NAME()
END

set @fCleanupCurrent = (@dwCommand & 1)
set @fRemoveCurrent = (@dwCommand & 2)

-- Compute the next Heartbeat time
-- Allow a maximum of 10 missing heartbeats before the Process is assumed DEAD

set @dtCurrentTime = GETUTCDATE()
set @dtNextHeartbeatTime = DATEADD (SECOND, 10*@nHeartbeatInterval, @dtCurrentTime)

set nocount on
set transaction isolation level read committed

-- If the Process requires an explicit cleanup (probably at the start-up time), do so now

if ( ( @fCleanupCurrent > 0 ) OR (@fRemoveCurrent > 0) )
BEGIN
	exec [dbo].[int_ProcessCleanup_' + @ApplicationName + '] @uidProcessID
END

if (@fRemoveCurrent = 0)
BEGIN
	-- Record the Heartbeat of the current Process
		
	UPDATE ProcessHeartbeats 
	SET dtLastHeartbeatTime = @dtCurrentTime, dtNextHeartbeatTime = @dtNextHeartbeatTime
	WHERE uidProcessID = @uidProcessID AND nvcApplicationName = ''' + @ApplicationName + ''' 

	if (@@ROWCOUNT = 0)
	BEGIN

		INSERT INTO ProcessHeartbeats WITH (ROWLOCK) 
		(uidProcessID, nvcApplicationName, dtCreationTime , dtLastHeartbeatTime , dtNextHeartbeatTime)	VALUES 
		(@uidProcessID, ''' + @ApplicationName + ''', @dtCurrentTime, @dtCurrentTime, @dtNextHeartbeatTime)

	END
END


')


--Add stored procs for altering subscriptions
exec ('CREATE PROCEDURE [dbo].[int_AlterSubscription_' + @ApplicationName +']
@flag int,
@subID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidDBOwnerID uniqueidentifier OUTPUT,
@retCode int OUTPUT

AS


set nocount on
set transaction isolation level read committed

declare @tnActiveTable tinyint, @retVal int

set @retCode = 0

-- Disable
if (@flag = 1)
BEGIN
	UPDATE Subscription SET Subscription.fEnabled = 0
	FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_1))
	WHERE Subscription.uidSubID = @subID
	OPTION (KEEPFIXED PLAN)
END

-- Activate
if (@flag = 2)
BEGIN
	UPDATE Subscription set Subscription.fEnabled = 1
	FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_1))
	WHERE Subscription.uidSubID = @subID
	OPTION (KEEPFIXED PLAN)
	--need to move all messages which were routed here because the subscription was deactivated
	
	INSERT INTO ' + @QueueName + ' WITH (ROWLOCK) (uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nRetryCount)
	SELECT uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nRetryCount FROM ' + @SuspendedQName + ' WITH (ROWLOCK) WHERE uidSubscriptionID = @subID AND nvcErrorID = N''0xC0C01B4D''
	OPTION (KEEPFIXED PLAN)
	
	DELETE ' + @SuspendedQName + ' WITH (ROWLOCK) WHERE uidSubscriptionID = @subID AND nvcErrorID = N''0xC0C01B4D'' OPTION (KEEPFIXED PLAN)
	
END


-- Route to suspended queue (deactivate)
if (@flag = 3)
BEGIN
	UPDATE Subscription SET Subscription.fEnabled = 2 FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_1)) WHERE Subscription.uidSubID = @subID OPTION (KEEPFIXED PLAN)
END

-- Route to references
if (@flag = 6)
BEGIN
	UPDATE Subscription SET Subscription.fEnabled = 4 FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_1)) WHERE Subscription.uidInstanceID IS NOT null AND Subscription.uidSubID = @subID OPTION (KEEPFIXED PLAN)
END

-- Delete NamedPredicateGroup
if (@flag = 8)
BEGIN
	--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
	--normal locks would require us to wait for the transaction to complete, but we dont really need to wait that long
	exec  @retVal = sp_getapplock ''SubscriptionRefCountLog'', ''Shared'', ''Transaction''

	IF (@retVal < 0 ) -- Lock Not granted
	BEGIN
		RAISERROR(''Unable to acquire applock on SubscriptionRefCountLog'', 16, 1)
		return
	END

	--lock the log table to make sure it does not switch underneath us
	SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 2 OPTION (KEEPFIXED PLAN)
	
	if (@tnActiveTable = 1)
	BEGIN
		INSERT INTO PredicateGroupZeroSum1 WITH (ROWLOCK)
		SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
		FROM PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
		WHERE 	pg.uidPredicateORGroupID = @subID
		OPTION (KEEPFIXED PLAN)
	END
	else
	BEGIN
		INSERT INTO PredicateGroupZeroSum2 WITH (ROWLOCK)
		SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
		FROM PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
		WHERE 	pg.uidPredicateORGroupID = @subID
		OPTION (KEEPFIXED PLAN)
	END

	exec sp_releaseapplock ''SubscriptionRefCountLog'', ''Transaction''
	
	DELETE FROM PredicateGroupNames WITH (ROWLOCK) WHERE uidPredicateGroupID = @subID OPTION (KEEPFIXED PLAN) --subID is actually the predicategroupid in this case
	--We reuse the predicate group id here so we actually need to remove the entry from the predicate group table
	DELETE FROM PredicateGroup FROM PredicateGroup WITH (ROWLOCK INDEX(IX_PredicateGroup)) WHERE uidPredicateORGroupID = @subID OPTION (KEEPFIXED PLAN)
END

-- Delete
if (@flag = 4)
BEGIN
	--This is meant to actually remove the subscription from the db
	--While this could technically cause a race condition leading to a subscription being
	--inserted and its predicate group being deleted, expected usage will not cause this,
	--ie runtime subscriptions will have their own predicate groups and  

	--Need to record the dbid if this is the master db and return it
	SELECT TOP 1 @uidDBOwnerID = uidDBOwnerID FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_1)) WHERE uidSubID = @subID OPTION (KEEPFIXED PLAN)-- dont need to check for deleted since duplicate subIDs will be associated with the same db

	--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
	--normal locks would require us to wait for the transaction to complete, but we dont really need to wait that long
	exec  @retVal = sp_getapplock ''SubscriptionRefCountLog'', ''Shared'', ''Transaction''

	IF (@retVal < 0 ) -- Lock Not granted
	BEGIN
		RAISERROR(''Unable to acquire applock on SubscriptionRefCountLog'', 16, 1)
		return
	END

	--lock the log table to make sure it does not switch underneath us
	SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 2 OPTION (KEEPFIXED PLAN)
	
	if (@tnActiveTable = 1)
	BEGIN
		INSERT INTO PredicateGroupZeroSum1 WITH (ROWLOCK)
			SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
			FROM Subscription s WITH (ROWLOCK INDEX(IX_Subscription_1))
				JOIN PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
					ON	s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
						pg.fIsDistributionList = 0 
			WHERE s.uidSubID = @subID			
			OPTION (KEEPFIXED PLAN)
	END
	else
	BEGIN
		INSERT INTO PredicateGroupZeroSum2 WITH (ROWLOCK)
			SELECT pg.uidPredicateORGroupID, pg.uidPredicateANDGroupID
			FROM Subscription s WITH (ROWLOCK INDEX(IX_Subscription_1))
				JOIN PredicateGroup pg WITH (ROWLOCK INDEX(IX_PredicateGroup))
					ON	s.uidPredicateGroupID = pg.uidPredicateORGroupID AND
						pg.fIsDistributionList = 0 
			WHERE s.uidSubID = @subID			
			OPTION (KEEPFIXED PLAN)
	END
	
	exec sp_releaseapplock ''SubscriptionRefCountLog'', ''Transaction''
	
	DELETE Subscription FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_1)) WHERE uidSubID = @subID OPTION (KEEPFIXED PLAN)
	DELETE FROM UniqueSubscription WITH (ROWLOCK) WHERE uidSubscriptionID = @subID

END ')

exec ('CREATE PROCEDURE [dbo].[int_AlterInstance_' + @ApplicationName +']
@flag smallint,
@uidObjectID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidInstanceStateID uniqueidentifier,
@uidWorkID uniqueidentifier,
@uidPortID uniqueidentifier,
@uidServiceID uniqueidentifier,
@nvcErrorID nvarchar(400),
@nErrorCategory int,
@nvcAdditionalInfo nvarchar(1024),
@nIsResumable int,
@fOptimize smallint,
@dtValidTime datetime,
@nvcURL nvarchar(512),
@nvcAdapter nvarchar(512),
@uidDBOwnerID uniqueidentifier OUTPUT,
@retCode int OUTPUT

AS

/*****************************************
* This function handles operations on the instance. They are as follows:
* 209 - Terminate
* 206 - Suspend
* 207 - Release (activation complete)
* 208 - Delete (instance complete)
* 199 - AddRef a message to instance state
* 200 - Release message ref for an instance state
* 201 - Remove Instance State
* 205 - Resume
* ...
* 204 - Remove convoy set instance for this instance
* 203 - Remove Control Message
* 202 - ReceiveComplete Message
* 301 - Instance Cleanup
*****************************************************/
 
set nocount on
set transaction isolation level read committed

declare @retVal int,
	@fKnownInstance int,
	@uidClassID uniqueidentifier,
	@uidInterceptorID uniqueidentifier,
	@nState int,
	@uidProcessID uniqueidentifier,
	@nPendingOperation int,
	@tnActiveTable tinyint,
	@cnt int


set @retCode = 0
set @uidInterceptorID = N''{D1A805A2-B1B5-42bc-A29F-D128131DDCD0}'' -- Agents ID in the tracking stream

SELECT @uidClassID = uidClassID, @nState = nState, @uidProcessID = uidProcessID FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION (KEEPFIXED PLAN)
if (@@ROWCOUNT = 0 AND @flag <> 206 AND @flag <> 301)
BEGIN
	set @retCode = 61
	return
END


-- Activation Complete or Hibernate
if (@flag = 207 OR @flag = 215 )
BEGIN
	
	-- Check if the Current Process is the owner of the Instance
	
	if ( @uidProcessID IS NOT NULL AND @uidProcessID <> APP_NAME() )
	BEGIN
		set @retCode = 4
		return
	END

	IF (((@uidClassID = N''226FC6B9-0416-47A4-A8E8-4721F1DB1A1B'') OR (@uidClassID = N''BB3A1470-F5C4-47C3-B71F-EAABC260FBD0'')) AND ((@fOptimize & 2) > 0) AND (@nState <> 4 AND @nState <> 16 AND @nState <> 32))
	-- For XLANG/s non-blocking dehydration case. Put RM into the queue belonging to this instance.
	BEGIN
		INSERT INTO ' + @QueueName + ' WITH (ROWLOCK) (uidMessageID, snPriority, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, snPartRetrieval, uidClassID)
		VALUES (N''61EAA7FC-AC85-42d9-BF3E-1BED258B82BE'', 5, 0, 0, 0, @uidServiceID, @uidInstanceID, 0, @uidClassID)

		--Ref-counting logic to count the Restart Msg. Global Counter used for control messages
		exec int_RefCountMessage N''61EAA7FC-AC85-42d9-BF3E-1BED258B82BE'', 3, 1
	END	

	if (@fOptimize > 1)
	BEGIN
		set @fOptimize = @fOptimize & 1
	END

	-- Make sure we do not accidentally set the Instance to hibernate in ActivationComplete code-path
	
	if (@dtValidTime IS NULL OR @flag <> 215 )
	BEGIN
		set @dtValidTime = GetUTCDATE()
	END

	UPDATE Instances SET nState = 8, uidProcessID = NULL, uidActivationID = NULL, nvcProcessingServer = NULL, fOptimize = @fOptimize, dtValidTime = @dtValidTime FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' AND nState <> 4 AND nState <> 16 AND nState <> 32 OPTION (KEEPFIXED PLAN)--ignore if state is suspended
	if (@@ROWCOUNT = 0) --this means the scheduled was already suspended
	BEGIN --need to still reset the processid and processing server
		UPDATE Instances SET uidProcessID = NULL, uidActivationID = NULL, nvcProcessingServer = NULL FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION (KEEPFIXED PLAN)
	END
	ELSE
	BEGIN
		--lets do a quick check to see if there are any pending operations
		set @nPendingOperation = 1
		SELECT TOP 1 @nPendingOperation = nPendingOperation FROM InstancesPendingOperations WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID ORDER BY nPendingOperation DESC OPTION (KEEPFIXED PLAN)
		
		IF (@nPendingOperation = 4) --terminate
		BEGIN
			set @flag = 209 --lets go ahead and terminate
			set @retCode = -2
		END
		ELSE IF (@nPendingOperation = 2) --suspend
		BEGIN
			--only suspend if we are not already suspended or zombied
			SELECT @nState = nState FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION (KEEPFIXED PLAN)
			IF (@nState <> 4 AND @nState <> 16 AND @nState <> 32) 
			BEGIN
				set @flag = 206 
				set @retCode = -1
			END
		END
	END
	
	UPDATE 	' + @QueueName + ' 
	SET uidProcessID = NULL, uidActivationID = NULL
	FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) 
	WHERE uidInstanceID = @uidInstanceID
	OPTION (KEEPFIXED PLAN)
	
END

-- Suspend
if (@flag = 206)
BEGIN

	declare @dtTimeStamp datetime, @nvcProcessingServer nvarchar(256)
	set @dtTimeStamp = GetUTCDate()
	set @nvcProcessingServer = HOST_NAME()
	
	exec [dbo].[int_AdminSuspendInstance_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @nvcErrorID, @nErrorCategory, @nvcAdditionalInfo, @nIsResumable, @nvcProcessingServer, @dtTimeStamp, @nvcURL, @nvcAdapter, @fKnownInstance OUTPUT
	
	--Perhaps we should be honoring the pending action, but not for now we just delete the pending actions
	DELETE FROM InstancesPendingOperations WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	
	if @fKnownInstance <> 0
		set @retCode = 0
	else
		set @retCode = 61
	
END

-- Resume
if (@flag = 205)
BEGIN
	exec [dbo].[int_AdminResumeInstance_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @uidClassID, @fKnownInstance output
	
	--Resume wipes all pending actions.
	DELETE FROM InstancesPendingOperations WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	
	if @fKnownInstance <> 0
		set @retCode = 0
	else
		set @retCode = 61
END


-- Delete
if (@flag = 208 OR @flag = 209)
BEGIN
	--it is a bug that we dont separate delete from terminate, but xlang calls both and fixing this caused problems, so we will leave it for now
	declare @uidTemp uniqueidentifier, @dtNow datetime, @fIsZombie int
				
	set @dtNow = GetUTCDate()
	set @fIsZombie = 0

	-- Check if the Current Process is the owner of the Instance
	if ( @uidProcessID IS NOT NULL AND @uidProcessID <> APP_NAME() )
	BEGIN
		set @retCode = 4
		return
	END

	--if we are deleting this instance, lets lock it to avoid lock contention issues with dequeue if we happen to hit a zombie
	--not 100pct sure this is the best thing to do instead of just letting sql find the deadlock and end dequeue, but if we hit it
	--right, we will block dequeue from trying to select these messages since it will readpast this instance
	SELECT TOP 1 @uidTemp = uidInstanceID FROM Instances WITH (ROWLOCK HOLDLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)

	-- First deactivate the instance subscriptions.
	--if it does not find any subscriptions, it will set the retcode to -4 indicating so
	exec @retCode = int_ToggleSubscriptions @uidServiceID = @uidServiceID, @uidInstanceID = @uidInstanceID, @fActivationOnly = 0, @fEnable = -1

	DELETE FROM ' + @DynamicStateTable + ' WITH (ROWLOCK) WHERE   uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	
	--cleanup convoy information
	DELETE FROM ConvoySetInstances FROM ConvoySetInstances WITH (ROWLOCK INDEX(IX_ConvoySetInstances)) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	
	--cleanup all pending operations
	DELETE FROM InstancesPendingOperations WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)

	--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
	--normal locks would require us to wait for the transaction to complete, but we dont really need to wait that long
	exec  @retVal = sp_getapplock ''MessageRefCountLog'', ''Shared'', ''Transaction''

	IF (@retVal < 0 ) -- Lock Not granted
	BEGIN
		RAISERROR(''Unable to acquire applock on MessageRefCountLog'', 16, 1)
		return
	END

	--lock the log table to make sure it does not switch underneath us
	SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 1 OPTION (KEEPFIXED PLAN)

	SELECT TOP 1 @cnt = COUNT(*) FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	IF (@cnt > 0)
	BEGIN
		--cleanup instance state related info
		--first cleanup any messages which are refcounted locally
		DELETE FROM ' + @StateQName + '
		FROM ' + @StateQName + ' s WITH (ROWLOCK), [' + @ApplicationName + '_MessageRefCountLog] lg
		WHERE	s.uidInstanceID = @uidInstanceID AND s.uidInstanceID = lg.uidInstanceID AND s.uidMessageID = lg.uidMessageID
		OPTION (KEEPFIXED PLAN) 

		if (@tnActiveTable = 1)
		BEGIN
			INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT uidMessageID, 3, -1 
			FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID
			OPTION (KEEPFIXED PLAN)
		END
		else
		BEGIN
			INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT uidMessageID, 3, -1 
			FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID
			OPTION (KEEPFIXED PLAN)
		END
	
		DELETE FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE	uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	END
	
	
	SELECT TOP 1 @cnt = COUNT(*) FROM ' + @SuspendedQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	IF (@cnt > 0)
	BEGIN
		
		-- remove all Suepended Queue entries that are resumable

		--first cleanup any messages which are refcounted locally
		DELETE FROM ' + @SuspendedQName + ' 
		FROM ' + @SuspendedQName + ' s WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended])), [' + @ApplicationName + '_MessageRefCountLog] lg
		WHERE s.uidInstanceID = @uidInstanceID AND s.uidServiceID = @uidServiceID AND s.nIsResumable = 1 AND s.uidInstanceID = lg.uidInstanceID AND s.uidMessageID = lg.uidMessageID
		OPTION (KEEPFIXED PLAN)		

		if (@tnActiveTable = 1)
		BEGIN
			INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT uidMessageID, 3, -1 
			FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended]))  WHERE uidInstanceID = @uidInstanceID AND uidServiceID = @uidServiceID AND nIsResumable = 1
			OPTION (KEEPFIXED PLAN)
		END
		else
		BEGIN
			INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT uidMessageID, 3, -1 
			FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended]))  WHERE uidInstanceID = @uidInstanceID AND uidServiceID = @uidServiceID AND nIsResumable = 1
			OPTION (KEEPFIXED PLAN)
		END
	
		DELETE FROM ' + @SuspendedQName + ' FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended])) WHERE uidInstanceID = @uidInstanceID AND uidServiceID = @uidServiceID AND nIsResumable = 1
		OPTION (KEEPFIXED PLAN)
		
		--if there is anything left in this queue then we need to zombie
		SELECT TOP 1 @cnt = COUNT(*) FROM ' + @SuspendedQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
		if (@cnt > 0)
			set @fIsZombie = 1
	END
		
	SELECT TOP 1 @cnt = COUNT(*) FROM ' + @QueueName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
	IF (@cnt > 0)
	BEGIN
		
		--This is an interesting case. See bug 91599 in Ebiz Suite. We are trying to avoid zombies which can occur when the same message is delivered to multiple
		--subscriptions associated with the same instance. This can happen easily with sequential convoys in an orchestration. What can then happen 
		--is that the first reference is delivered, consumed by the orchestration and then the orchestration decides to terminate. If this happens before
		--we deliver the other references, then we would zombie. The decision we are making here is that we are routing messages to instances, not subscriptions
		--if we route a message to the same instance multiple times, as long as we deliver one reference and that reference is consumed by the orchestration
		--the other references are not considered when determining if a zombie has occurred. So we will compare the number of messages left with the count
		--for how many times each was delivered to the instance and delete all where the count is less than the number of times it was delivered
		--the query is not super optimized, but it only hits the non-optimized path if there actually is a potential zombie so hopefully that wont 
		--happen often. The issue is that the nReserved flag is not part of the index which we are reading from but I dont want to update that index
		INSERT INTO ' + @SuspendedQName + ' WITH (ROWLOCK) 
		(uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, snPartRetrieval, nRetryCount, fOrderedDelivery, nvcErrorID, nErrorCategory, nvcAdditionalInfo, nIsResumable, nvcProcessingServer, dtTimeStamp)
		SELECT wq.uidWorkID, wq.uidMessageID, wq.uidSubscriptionID, 1, wq.uidClassID, @dtNow, @dtNow, @dtNow, wq.uidServiceID, wq.uidInstanceID, 1, 1, 0, 0, 0, null, 0, null, @dtNow
		FROM ' + @QueueName + ' wq WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) 
		WHERE wq.uidInstanceID = @uidInstanceID AND wq.uidMessageID IN 
				(
				SELECT uidMessageID FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) 
				WHERE uidInstanceID = @uidInstanceID AND uidSubscriptionID IS NOT NULL
				GROUP BY uidMessageID, nReserved
				HAVING COUNT(*) >= nReserved 
				)	
		OPTION (KEEPFIXED PLAN)	

		set @cnt = @@ROWCOUNT
		if (@cnt > 0)
			set @fIsZombie = 1	

		--lets delete all messages which were refcounted locally
		DELETE FROM ' + @QueueName + ' 
		FROM ' + @QueueName + ' q WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])), [' + @ApplicationName + '_MessageRefCountLog] lg
		WHERE q.uidInstanceID = @uidInstanceID AND q.uidInstanceID = lg.uidInstanceID AND q.uidMessageID = lg.uidMessageID	
		OPTION (KEEPFIXED PLAN)

		--we are going to eventually delete all messages for this instance which are in the workQ so lets do the ref counting now
		--we already locked the instance so we dont have to worry about a dequeue deadlock
		if (@tnActiveTable = 1)
		BEGIN
			INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT uidMessageID, 1, -1 
			FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID
			OPTION (KEEPFIXED PLAN)
		END
		else
		BEGIN
			INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
			SELECT uidMessageID, 1, -1 
			FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID
			OPTION (KEEPFIXED PLAN)
		END

		DELETE FROM ' + @QueueName + ' FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID		
		OPTION (KEEPFIXED PLAN)

		if (@cnt > 0)
		BEGIN
			--lets make sure we take care of the refcounts for these messages. For them, we will simply put the ref in the global log
			if (@tnActiveTable = 1)
			BEGIN
				INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
				SELECT uidMessageID, 3, 1 
				FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended]))  WHERE uidInstanceID = @uidInstanceID
				OPTION (KEEPFIXED PLAN)
			END	
			else
			BEGIN
				INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
				SELECT uidMessageID, 3, 1 
				FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended]))  WHERE uidInstanceID = @uidInstanceID
				OPTION (KEEPFIXED PLAN)
			END
		END
	END

	exec sp_releaseapplock ''MessageRefCountLog'', ''Transaction''
				
	
	--remove from instance table
	if ( @fIsZombie = 0 )
	BEGIN
		DELETE FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
		OPTION (KEEPFIXED PLAN)
		DELETE FROM InstancesSuspended WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' 
		OPTION (KEEPFIXED PLAN)

		--any message which we were refcounting locally can now be deleted
		SELECT TOP 1 @cnt = COUNT(*) FROM [' + @ApplicationName + '_MessageRefCountLog] lg WHERE uidInstanceID = @uidInstanceID  OPTION (KEEPFIXED PLAN)
		IF (@cnt > 0)
		BEGIN
			INSERT INTO MessageZeroSum WITH (ROWLOCK) (uidMessageID)
			SELECT uidMessageID FROM [' + @ApplicationName + '_MessageRefCountLog]
			WHERE uidInstanceID = @uidInstanceID

			DELETE FROM [' + @ApplicationName + '_MessageRefCountLog]
			WHERE uidInstanceID = @uidInstanceID
			OPTION (KEEPFIXED PLAN)
		END
	END
	ELSE
	BEGIN
		-- Zombie instance is treated as suspended non-resumable
		UPDATE Instances SET nState = 32,  uidProcessID = NULL, uidActivationID = NULL, nvcProcessingServer = NULL FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION (KEEPFIXED PLAN)
		set @retCode = -3
		
		-- Below assumes that this code path will never be called if the nState is already 4 or 32
		INSERT INTO InstancesSuspended 
		SELECT uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, dtCreated, nState, nvcUserState, dtSuspendTimeStamp, NULL, NULL, nErrorCategory, nvcErrorID, nvcErrorDescription, nvcErrorProcessingServer
		FROM Instances WITH (ROWLOCK)
		WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION (KEEPFIXED PLAN)
		
		UPDATE InstancesSuspended SET nvcErrorID = N''0xC0C01B4C'', nvcErrorDescription = (SELECT nvcError FROM LocalizedErrorStrings WHERE nID = 5) 
		FROM InstancesSuspended WITH (ROWLOCK) 
		WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION (KEEPFIXED PLAN)

		--any message which we were refcounting locally can now be deleted
		SELECT TOP 1 @cnt = COUNT(*) FROM [' + @ApplicationName + '_MessageRefCountLog] lg WHERE uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)
		IF (@cnt > 0)
		BEGIN
			INSERT INTO MessageZeroSum WITH (ROWLOCK) (uidMessageID)
			SELECT uidMessageID FROM [' + @ApplicationName + '_MessageRefCountLog]
			WHERE uidInstanceID = @uidInstanceID AND uidMessageID NOT IN ( SELECT uidMessageID FROM ' + @SuspendedQName + ' WITH (ROWLOCK INDEX([IX_' + @ApplicationName +'Q_Suspended]))  WHERE uidInstanceID = @uidInstanceID )

			--blow away all local refcounting. zombied messages were already refcounted globally
			DELETE FROM [' + @ApplicationName + '_MessageRefCountLog]
			WHERE uidInstanceID = @uidInstanceID
			OPTION (KEEPFIXED PLAN)
		END
	END	
END


-- Instance Cleanup
if (@flag = 301)
BEGIN
	
	-- First deactivate the instance subscriptions.
	exec int_ToggleSubscriptions @uidServiceID = @uidServiceID, @uidInstanceID = @uidInstanceID, @fActivationOnly = 0, @fEnable = -1

	--cleanup convoy information
	DELETE FROM ConvoySetInstances FROM ConvoySetInstances WITH (ROWLOCK INDEX(IX_ConvoySetInstances)) WHERE uidInstanceID = @uidInstanceID
	OPTION (KEEPFIXED PLAN)
	
END

--Add message reference to an instance state
else if (@flag = 199)
BEGIN
	if ( (@uidObjectID IS NOT NULL) AND (@uidInstanceStateID IS NOT NULL))
	
	BEGIN		
		IF (@uidWorkID IS NULL)
		BEGIN
		
			exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidObjectID, 1
			INSERT INTO ' + @StateQName + ' WITH (ROWLOCK) (uidInstanceID, uidInstanceStateID, uidMessageID, uidServiceID, uidPortID) 
                      VALUES (@uidInstanceID, @uidInstanceStateID, @uidObjectID, @uidServiceID, @uidPortID)
		END
		ELSE
		BEGIN
			exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidObjectID, 1
			INSERT INTO ' + @StateQName + ' WITH (ROWLOCK) (uidInstanceID, uidInstanceStateID, uidMessageID, uidServiceID, uidPortID, uidWorkID) 
                      VALUES (@uidInstanceID, @uidInstanceStateID, @uidObjectID, @uidServiceID, @uidPortID, @uidWorkID)
		END
		
	END
END

--Release Message reference for an instance state
if (@flag = 200)
BEGIN
	if ( (@uidObjectID IS NOT NULL) AND (@uidInstanceStateID IS NOT NULL) )
	BEGIN
		declare @uidFragmentedMsgID uniqueidentifier, @refCount smallint

		SELECT @refCount = 0 - COUNT(*)
		FROM ' + @StateQName + ' WITH (ROWLOCK) 
		WHERE   uidInstanceID = @uidInstanceID AND
			uidInstanceStateID = @uidInstanceStateID   AND
			uidMessageID = @uidObjectID 
		OPTION (KEEPFIXED PLAN)

		if (@refCount != 0)
		BEGIN

			exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidObjectID, @refCount
	
			DELETE FROM ' + @StateQName + ' WITH (ROWLOCK)
                	WHERE   uidInstanceID = @uidInstanceID AND
		       	 	uidInstanceStateID = @uidInstanceStateID   AND
                        	uidMessageID = @uidObjectID 
        		OPTION (KEEPFIXED PLAN)
                END
         	
        	SELECT @uidFragmentedMsgID = uidFragmentedMsgID   FROM ' + @DynamicStateTable + ' WITH (ROWLOCK)
         	WHERE (uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID)
         	OPTION (KEEPFIXED PLAN)

         	-- If the Referenced Msg was the Currently-constructed Fragmented Msg for the State, reset it
         
         	if ( @uidFragmentedMsgID IS NOT NULL AND @uidFragmentedMsgID = @uidObjectID )
         	BEGIN
            		UPDATE ' + @DynamicStateTable + ' WITH (ROWLOCK)
            		SET uidFragmentedMsgID = NULL, uidFragmentedPartID = NULL
            		WHERE (uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID) 
            		OPTION (KEEPFIXED PLAN)
		END
	END
END

-- Release instance sub-state and associated message references
if (@flag = 201)
BEGIN
	
	UPDATE [' + @ApplicationName + '_MessageRefCountLog]
	SET nRefCount = nRefCount - t.cnt
	FROM [' + @ApplicationName + '_MessageRefCountLog] lg, 
		( SELECT COUNT(*) cnt, uidInstanceID, uidMessageID FROM ' + @StateQName + '
		  WHERE uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID
		  GROUP BY uidInstanceID, uidInstanceStateID, uidMessageID
		) as t
	WHERE lg.uidInstanceID = t.uidInstanceID AND lg.uidMessageID = t.uidMessageID
	OPTION (KEEPFIXED PLAN)

	IF (@@ROWCOUNT > 0)
	BEGIN
		--lets see if anything hit 0
		INSERT INTO MessageZeroSum WITH (ROWLOCK) (uidMessageID)
		SELECT uidMessageID FROM [' + @ApplicationName + '_MessageRefCountLog]
		WHERE uidInstanceID = @uidInstanceID AND nRefCount = 0

		--delete anything which we have now updated the refcount for
		DELETE FROM ' + @StateQName + '
		FROM ' + @StateQName + ' s WITH (ROWLOCK), [' + @ApplicationName + '_MessageRefCountLog] lg
		WHERE	s.uidInstanceID = @uidInstanceID AND s.uidInstanceStateID = @uidInstanceStateID
			AND s.uidInstanceID = lg.uidInstanceID AND s.uidMessageID = lg.uidMessageID
		OPTION (KEEPFIXED PLAN)

		DELETE FROM [' + @ApplicationName + '_MessageRefCountLog]
		WHERE uidInstanceID = @uidInstanceID AND nRefCount = 0
		OPTION (KEEPFIXED PLAN)

		
	END

	--lets take a lock for checking the refcount log. We use an applock so that we can explicitly release the lock
	--normal locks would require us to wait for the transaction to complete, but we dont really need to wait that long
	exec  @retVal = sp_getapplock ''MessageRefCountLog'', ''Shared'', ''Transaction''

	IF (@retVal < 0 ) -- Lock Not granted
	BEGIN
		RAISERROR(''Unable to acquire applock on MessageRefCountLog'', 16, 1)
		return
	END
		
	SELECT TOP 1 @tnActiveTable = tnActiveTable FROM ActiveRefCountLog WITH (ROWLOCK) WHERE fType = 1 OPTION (KEEPFIXED PLAN)
	
	--cleanup instance state related info
	if (@tnActiveTable = 1)
	BEGIN
		INSERT INTO MessageRefCountLog1 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
		SELECT uidMessageID, 3, -1 
		FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID
		OPTION (KEEPFIXED PLAN)
	END
	else
	BEGIN
		INSERT INTO MessageRefCountLog2 WITH (ROWLOCK) (uidMessageID, tnQueueID, snRefCount)
		SELECT uidMessageID, 3, -1 
		FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID
		OPTION (KEEPFIXED PLAN)
	END
	
	exec sp_releaseapplock ''MessageRefCountLog'', ''Transaction''
	
	DELETE FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE	uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID OPTION (KEEPFIXED PLAN)
	
	DELETE FROM ' + @DynamicStateTable + ' WITH (ROWLOCK) WHERE   uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID OPTION (KEEPFIXED PLAN)
END

--Remove convoy set for this instance from the instance table
if (@flag = 204)
BEGIN
	DELETE FROM ConvoySetInstances FROM ConvoySetInstances WITH (ROWLOCK INDEX(IX_ConvoySetInstances)) WHERE uidConvoySetID = @uidObjectID AND uidInstanceID = @uidInstanceID
	OPTION (KEEPFIXED PLAN)
END

-- ReceiveComplete Message
else if (@flag = 202)
BEGIN
	
	declare @uidMessageID uniqueidentifier

	SELECT TOP 1 @uidMessageID = uidMessageID 
	FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q]))
	WHERE uidWorkID = @uidObjectID AND uidInstanceID = @uidInstanceID OPTION (KEEPFIXED PLAN)

	if (@uidMessageID IS NOT NULL)
	BEGIN
		exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, -1
		
		DELETE FROM ' + @QueueName + '
		FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q]))
		WHERE uidWorkID = @uidObjectID AND uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
	END
	ELSE
	BEGIN
		set @retCode = 2
	END
END

-- Remove Control Message
else if (@flag = 203)
BEGIN
	RAISERROR(''Remove Control Message operation is not supported'', 16, 1)
END

')

exec ('CREATE PROCEDURE [dbo].[int_AlterMessage_' + @ApplicationName +']
@flag smallint,
@workID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidClassID uniqueidentifier,
@nvcErrorID nvarchar(400),
@nErrorCategory int,
@nvcAdditionalInfo nvarchar(512),
@nIsResumable int,
@dtResubmitTimeStamp datetime,
@uidDBOwnerID uniqueidentifier OUTPUT,
@retCode int OUTPUT

AS


set nocount on
set transaction isolation level read committed

declare @msgID uniqueidentifier,
	@fRelease int,
	@dtValid datetime,
	@dtTimeStamp datetime,
	@retVal int,
	@tnActiveTable tinyint

set @retCode = 0
set @dtTimeStamp = GetUTCDate()

-- Suspend
if (@flag = 102)
BEGIN
	
	-- First try the work q
	INSERT into '+ @SuspendedQName + ' WITH (ROWLOCK) 
		(nErrorCategory, nvcErrorID, nIsResumable, nvcAdditionalInfo, uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nRetryCount, nReserved)
	SELECT @nErrorCategory, @nvcErrorID, @nIsResumable, @nvcAdditionalInfo, @workID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nRetryCount, nReserved
		FROM '+ @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID AND uidWorkID = @workID
	OPTION (KEEPFIXED PLAN)


	if (@@ROWCOUNT <> 0)
	BEGIN
		DELETE from '+ @QueueName + ' from '+ @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidInstanceID = @uidInstanceID AND uidWorkID = @workID
		OPTION (KEEPFIXED PLAN)
	END
	ELSE
	BEGIN
		INSERT into '+ @SuspendedQName + ' WITH (ROWLOCK) 
		      (nErrorCategory, nvcErrorID, nIsResumable, nvcAdditionalInfo, uidWorkID, uidMessageID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery)
		SELECT @nErrorCategory, @nvcErrorID, 0, @nvcAdditionalInfo, @workID, uidMessageID, 0, @uidClassID, @dtTimeStamp, @dtTimeStamp, @dtTimeStamp,  uidServiceID, uidInstanceID, uidPortID, 0, 0
			FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidWorkID = @workID AND uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)

		IF @@ROWCOUNT = 0
		BEGIN
			set @retCode = 2
		END		
		ELSE
		BEGIN
		
			DELETE from ' + @StateQName + ' WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidWorkID = @workID
			OPTION (KEEPFIXED PLAN)
		END
	END	
END

-- RESUBMIT
else if (@flag =100)
BEGIN

	UPDATE ' + @QueueName + ' 
	SET dtValid = @dtResubmitTimeStamp, nRetryCount = nRetryCount + 1, uidProcessID = NULL
	FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q]))
	WHERE uidWorkID = @workID AND uidInstanceID = @uidInstanceID
	OPTION (KEEPFIXED PLAN)
	
	IF @@ROWCOUNT = 0
	BEGIN
		set @retCode = 2
	END
END
else if (@flag = 101)
BEGIN
	--lock the log table to make sure it does not switch underneath us
	declare @uidMessageID uniqueidentifier, @fFound tinyint
	set @fFound = 0

	SELECT TOP 1 @uidMessageID = uidMessageID FROM ' + @QueueName + ' WITH (ROWLOCK INDEX([CIX_' + @ApplicationName + 'Q])) WHERE uidWorkID = @workID AND uidInstanceID = @uidInstanceID
	OPTION (KEEPFIXED PLAN)

	set @fFound = @@ROWCOUNT
		
	IF @fFound = 0
	BEGIN
		SELECT TOP 1 @uidMessageID = uidMessageID FROM ' + @StateQName + ' WITH (ROWLOCK) WHERE uidWorkID = @workID AND uidInstanceID = @uidInstanceID
		OPTION (KEEPFIXED PLAN)
		
		set @fFound = @@ROWCOUNT
	END


	IF @fFound = 0
	BEGIN
		set @retCode = 2
	END
	ELSE
	BEGIN
		exec [int_TrackMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID
	END
END


')


exec ('CREATE PROCEDURE [dbo].[bts_UpdateMsgbox_' +@ApplicationName + ']
@nArtifactType int,
@nAction int,
@uidObjectID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidServiceID uniqueidentifier,
@uidClassID uniqueidentifier,
@uidActivationID uniqueidentifier,
@uidInstanceStateID uniqueidentifier,
@uidWorkID uniqueidentifier,
@uidPortID uniqueidentifier,
@nvcErrorID nvarchar(400),
@nErrorCategory int,
@nvcAdditionalInfo nvarchar(1024),
@nIsResumable int,
@dtResubmitTimeStamp datetime,
@nvcURL nvarchar(512),
@nvcAdapter nvarchar(512),
@fOptimize smallint,
@uidDBOwnerID uniqueidentifier OUTPUT,
@nReturn int OUTPUT

AS

set nocount on
set transaction isolation level read committed

set @nReturn = 0

declare @nCount int,
		@uidProcessID uniqueidentifier

-- Check if the Instance is currently Locked by the caller, i.e. the Instance Activation ID is matching
--if it is 301 that is INstanceCleanup and we dont have to validate in that case
if ( @uidInstanceID IS NOT NULL AND @uidActivationID IS NOT NULL AND @nAction != 301)
begin
	set @uidProcessID = APP_NAME()
	SELECT @nCount = COUNT(*) FROM Instances WITH (ROWLOCK REPEATABLEREAD) 
	WHERE (uidInstanceID = @uidInstanceID AND uidProcessID = @uidProcessID AND uidActivationID = @uidActivationID )
	OPTION (KEEPFIXED PLAN)
	
	if ( @nCount = 0 )
	begin
		set @nReturn = 10
		return
	end
	
end


if (@nArtifactType = 0) --Subscription
BEGIN
	exec [dbo].[int_AlterSubscription_' + @ApplicationName + '] @nAction, @uidObjectID, @uidInstanceID, @uidDBOwnerID OUTPUT, @nReturn OUTPUT
END
else if (@nArtifactType = 1) --Instance
BEGIN
	exec [dbo].[int_AlterInstance_' + @ApplicationName + '] @nAction, @uidObjectID, @uidInstanceID, @uidInstanceStateID, @uidWorkID, @uidPortID, @uidServiceID, @nvcErrorID, @nErrorCategory, @nvcAdditionalInfo, @nIsResumable, @fOptimize, @dtResubmitTimeStamp, @nvcURL, @nvcAdapter, @uidDBOwnerID OUTPUT, @nReturn OUTPUT
END
else if (@nArtifactType = 2) --Message
BEGIN
	exec [dbo].[int_AlterMessage_' + @ApplicationName + '] @nAction, @uidObjectID, @uidInstanceID, @uidClassID, @nvcErrorID, @nErrorCategory, @nvcAdditionalInfo, @nIsResumable, @dtResubmitTimeStamp, @uidDBOwnerID OUTPUT, @nReturn OUTPUT
END

')

--	fSuccess	= 0		Successful
--				= 30	Part Not Found
exec ('CREATE PROCEDURE [dbo].[bts_ReadMessagePart_' + @ApplicationName + ']
@uidMessageID uniqueidentifier,
@nvcPartName nvarchar(256),
@fSuccess int OUTPUT
AS


set nocount on
set transaction isolation level read committed

set @fSuccess = 0
declare @nCount int

SELECT	TOP 1	mp.uidMessageID,
		mp.nvcPartName, mp.uidPartID, mp.nBodyPart,
		p.nPartSize, p.nNumFragments,p.imgPropBag, p.imgPart
FROM MessageParts AS mp WITH (ROWLOCK INDEX(CIX_MessageParts))
INNER LOOP JOIN Parts AS p WITH (ROWLOCK INDEX(IX_Parts)) ON (mp.uidPartID = p.uidPartID)
WHERE mp.uidMessageID = @uidMessageID AND mp.nvcPartName = @nvcPartName
OPTION(KEEPFIXED PLAN)

if (@@ROWCOUNT <> 1)
	set @fSuccess = 30
')

exec ('CREATE PROCEDURE [dbo].[bts_ReadPartData_' + @ApplicationName + ']
@uidPartID uniqueidentifier,
@nFragmentNumber int,
@fSuccess int OUTPUT

AS


set nocount on
set transaction isolation level read committed

set @fSuccess = 0
declare @nCount int

if ( @nFragmentNumber = 0 )
BEGIN
	SELECT  p.nPartSize, p.imgPart
	FROM	Parts AS p WITH (ROWLOCK)
	WHERE	p.uidPartID = @uidPartID
END
else
BEGIN
	SELECT  f.nFragmentSize, f.imgFrag
	FROM	Fragments AS f WITH (ROWLOCK)
	WHERE	f.uidPartID = @uidPartID AND f.nFragmentNumber = @nFragmentNumber
END

if (@@ROWCOUNT <> 1)
	set @fSuccess = 30
')


exec ('CREATE PROCEDURE [dbo].[bts_ReadInstanceStateMessages_' + @ApplicationName + ']

@uidInstanceID uniqueidentifier,
@uidInstanceStateID uniqueidentifier
AS

set nocount on
set transaction isolation level read committed

DECLARE	 @uidSubscriptionID uniqueidentifier
		,@uidPortID uniqueidentifier
		,@uidWorkID uniqueidentifier

set @uidSubscriptionID = NULL
set @uidPortID = NULL

if (@uidInstanceStateID IS NOT NULL)
BEGIN
	SELECT		s.uidMessageID, s.dtTimeStamp, s.dtExpiration, s.nNumParts, s.OriginatorSID, s.OriginatorPID,
			d.uidClassID, i.uidServiceID, d.uidInstanceID, @uidSubscriptionID, i.uidPortID, i.uidWorkID,
			NULL,NULL, s.imgContext, 0, 0, 0, inst.nvcUserState, inst.uidActivationID, inst.fOptimize
	
		FROM  	' + @StateQName + ' as i WITH (ROWLOCK) 
		INNER JOIN ' + @DynamicStateTable + ' AS d WITH (ROWLOCK) ON (d.uidInstanceID = @uidInstanceID AND d.uidInstanceStateID = i.uidInstanceStateID)
		INNER JOIN Spool AS s WITH (ROWLOCK) ON (s.uidMessageID = i.uidMessageID)
		LEFT OUTER JOIN Instances as inst ON (inst.uidInstanceID = @uidInstanceID  AND uidAppOwnerID = N''' + @uidAppID + ''')
	
		WHERE	i.uidInstanceID = @uidInstanceID AND i.uidInstanceStateID = @uidInstanceStateID
		OPTION(KEEPFIXED PLAN)
			
	
	SELECT		mp.uidMessageID, mp.nvcPartName, mp.uidPartID, mp.nBodyPart,
			p.nPartSize, p.nNumFragments,p.imgPropBag, NULL, i.uidWorkID
			
		FROM	' + @StateQName + ' as i WITH (ROWLOCK)
		INNER JOIN MessageParts AS mp WITH (ROWLOCK) ON (mp.uidMessageID = i.uidMessageID)
		INNER JOIN Parts AS p WITH (ROWLOCK) ON (mp.uidPartID = p.uidPartID)
	
		WHERE	i.uidInstanceID = @uidInstanceID AND i.uidInstanceStateID = @uidInstanceStateID
		OPTION(KEEPFIXED PLAN)
END
ELSE
BEGIN
	SELECT		s.uidMessageID, s.dtTimeStamp, s.dtExpiration, s.nNumParts, s.OriginatorSID, s.OriginatorPID,
			d.uidClassID, i.uidServiceID, d.uidInstanceID, @uidSubscriptionID, i.uidPortID, i.uidWorkID,
			NULL,NULL, s.imgContext, 0, 0, 0, inst.nvcUserState, inst.uidActivationID, inst.fOptimize
	
		FROM  	' + @StateQName + ' as i WITH (ROWLOCK) 
		INNER JOIN ' + @DynamicStateTable + ' AS d WITH (ROWLOCK) ON (d.uidInstanceID = @uidInstanceID AND d.uidInstanceStateID = i.uidInstanceID)
		INNER JOIN Spool AS s WITH (ROWLOCK) ON (s.uidMessageID = i.uidMessageID)
		LEFT OUTER JOIN Instances as inst ON (inst.uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''')
	
		WHERE	i.uidInstanceID = @uidInstanceID
		OPTION(KEEPFIXED PLAN)
			
	
	SELECT		mp.uidMessageID, mp.nvcPartName, mp.uidPartID, mp.nBodyPart,
			p.nPartSize, p.nNumFragments,p.imgPropBag, NULL, i.uidWorkID
			
		FROM	' + @StateQName + ' as i WITH (ROWLOCK)
		INNER JOIN MessageParts AS mp WITH (ROWLOCK) ON (mp.uidMessageID = i.uidMessageID)
		INNER JOIN Parts AS p WITH (ROWLOCK) ON (mp.uidPartID = p.uidPartID)
	
		WHERE	i.uidInstanceID = @uidInstanceID
		OPTION(KEEPFIXED PLAN)
END
')


exec ('CREATE PROCEDURE [dbo].[bts_ReadInstanceStateMessage_' + @ApplicationName + ']

@uidInstanceID uniqueidentifier,
@uidInstanceStateID uniqueidentifier,
@uidMessageID uniqueidentifier
AS

set nocount on
set transaction isolation level read committed

DECLARE	 @uidSubscriptionID uniqueidentifier
		,@uidPortID uniqueidentifier
		,@uidWorkID uniqueidentifier
		,@uidClassID uniqueidentifier

set @uidSubscriptionID = NULL
set @uidPortID = NULL
set @uidClassID = NULL

SELECT	TOP 1	s.uidMessageID, s.dtTimeStamp, s.dtExpiration, s.nNumParts, s.OriginatorSID, s.OriginatorPID,
		@uidClassID, i.uidServiceID, @uidInstanceID, @uidSubscriptionID, i.uidPortID, i.uidWorkID,
		NULL,NULL, s.imgContext, 0, 0, 0, inst.nvcUserState, inst.uidActivationID, inst.fOptimize

	FROM  	' + @StateQName + ' as i WITH (ROWLOCK) 
	INNER JOIN Spool AS s WITH (ROWLOCK) ON (s.uidMessageID = i.uidMessageID)
	LEFT OUTER JOIN Instances as inst ON (inst.uidInstanceID = @uidInstanceID  AND uidAppOwnerID = N''' + @uidAppID + ''')

	WHERE	i.uidInstanceID = @uidInstanceID AND i.uidInstanceStateID = @uidInstanceStateID AND i.uidMessageID = @uidMessageID
	OPTION (KEEPFIXED PLAN, FORCE ORDER)		

SELECT	TOP 10	mp.uidMessageID, mp.nvcPartName, mp.uidPartID, mp.nBodyPart,
		p.nPartSize, p.nNumFragments,p.imgPropBag, NULL, i.uidWorkID
		
	FROM	' + @StateQName + ' as i WITH (ROWLOCK)
	INNER JOIN MessageParts AS mp WITH (ROWLOCK) ON (mp.uidMessageID = i.uidMessageID)
	INNER JOIN Parts AS p WITH (ROWLOCK) ON (mp.uidPartID = p.uidPartID)

	WHERE	i.uidInstanceID = @uidInstanceID AND i.uidInstanceStateID = @uidInstanceStateID AND i.uidMessageID = @uidMessageID
	OPTION (KEEPFIXED PLAN, FORCE ORDER)
')

exec ('CREATE PROCEDURE [dbo].[bts_ReadSpecificMessage_' + @ApplicationName + ']

@uidMessageID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@fSuspended int
AS

set nocount on
set transaction isolation level read committed

DECLARE	 @uidSubscriptionID uniqueidentifier
		,@uidPortID uniqueidentifier
		,@uidWorkID uniqueidentifier

set @uidSubscriptionID = NULL
set @uidPortID = NULL
set @uidWorkID = NULL


IF (@fSuspended = 1)
BEGIN
-- Suspended Queue
SELECT	sq.uidMessageID, sq.dtTimeStamp, s.dtExpiration, s.nNumParts, s.OriginatorSID, s.OriginatorPID,
		sq.uidClassID, sq.uidServiceID, sq.uidInstanceID, sq.uidSubscriptionID, sq.uidPortID, sq.uidWorkID,
		NULL, NULL, s.imgContext, 0, 0, 0, inst.nvcUserState, inst.uidActivationID, inst.fOptimize
						  
	FROM  ' + @SuspendedQName + ' as sq WITH (ROWLOCK) 
	INNER JOIN Spool AS s WITH (ROWLOCK) ON (s.uidMessageID = sq.uidMessageID)
	LEFT OUTER JOIN Instances as inst ON (inst.uidInstanceID = @uidInstanceID  AND uidAppOwnerID = N''' + @uidAppID + ''')

	WHERE	sq.uidInstanceID = @uidInstanceID AND sq.uidMessageID = @uidMessageID
	OPTION (KEEPFIXED PLAN)

SELECT	mp.uidMessageID, mp.nvcPartName, mp.uidPartID, mp.nBodyPart,
	p.nPartSize, p.nNumFragments,p.imgPropBag, NULL, sq.uidWorkID

	FROM  ' + @SuspendedQName + ' as sq WITH (ROWLOCK) 		
	INNER JOIN MessageParts AS mp WITH (ROWLOCK) ON (mp.uidMessageID = sq.uidMessageID)
	INNER JOIN Parts AS p WITH (ROWLOCK) ON (mp.uidPartID = p.uidPartID)
	WHERE sq.uidInstanceID = @uidInstanceID AND sq.uidMessageID = @uidMessageID
	OPTION (KEEPFIXED PLAN)

END
ELSE
BEGIN
-- Work Queue
SELECT	wq.uidMessageID, wq.dtLastTouched, s.dtExpiration, s.nNumParts,  s.OriginatorSID, s.OriginatorPID,
		wq.uidClassID, wq.uidServiceID, wq.uidInstanceID, wq.uidSubscriptionID, wq.uidPortID, wq.uidWorkID,
		NULL, NULL, s.imgContext, 0, 0, 0, inst.nvcUserState, inst.uidActivationID, inst.fOptimize

	FROM  ' + @QueueName + ' as wq WITH (ROWLOCK) 
	INNER JOIN Spool AS s WITH (ROWLOCK) ON (s.uidMessageID = wq.uidMessageID)
	LEFT OUTER JOIN Instances as inst ON (inst.uidInstanceID = @uidInstanceID  AND uidAppOwnerID = N''' + @uidAppID + ''')

	WHERE	wq.uidInstanceID = @uidInstanceID AND wq.uidMessageID = @uidMessageID
	OPTION (KEEPFIXED PLAN)

SELECT	mp.uidMessageID, mp.nvcPartName, mp.uidPartID, mp.nBodyPart,
	p.nPartSize, p.nNumFragments,p.imgPropBag, NULL, wq.uidWorkID

	FROM  ' + @QueueName + ' as wq WITH (ROWLOCK) 		
	INNER JOIN MessageParts AS mp WITH (ROWLOCK) ON (mp.uidMessageID = wq.uidMessageID)
	INNER JOIN Parts AS p WITH (ROWLOCK) ON (mp.uidPartID = p.uidPartID)
	WHERE wq.uidInstanceID = @uidInstanceID AND wq.uidMessageID = @uidMessageID
	OPTION (KEEPFIXED PLAN)

END
	
')


--	fSuccess	= 0		Successful
--				= 20	Incomplete Message
--				= 25	No Fragmented Message
--				= 60	Bad Instance State

exec ('CREATE PROCEDURE [dbo].[bts_GetConstructedMessage_' + @ApplicationName + ']
@uidInstanceID	uniqueidentifier,
@uidInstanceStateID uniqueidentifier,
@fSuccess int OUTPUT,
@uidMessageID uniqueidentifier OUTPUT
AS

set nocount on
set transaction isolation level read committed

DECLARE	 @uidPartID uniqueidentifier
		,@nNumFragments int
		,@nNumActualFragments int

set @uidMessageID = NULL
set @uidPartID = NULL
set @fSuccess = 0

SELECT @uidMessageID = uidFragmentedMsgID, @uidPartID = uidFragmentedPartID
		FROM ' + @DynamicStateTable + '
		WHERE uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID
		
IF ( @@ROWCOUNT = 0)
BEGIN
	set @fSuccess = 60
	return
END

IF ( @uidMessageID IS NULL OR @uidPartID IS NULL )
BEGIN
	set @fSuccess = 25
	return
END

-- Check if All Fragments are available for the Part
set @nNumFragments = 0
SELECT @nNumActualFragments = COUNT(*) FROM Fragments WHERE uidPartID = @uidPartID

SELECT @nNumFragments = nNumFragments FROM Parts WHERE uidPartID = @uidPartID AND imgPart IS NOT NULL

IF ( @@ROWCOUNT = 0 OR @nNumFragments = 0 OR @nNumActualFragments <> (@nNumFragments-1))
BEGIN
	set @fSuccess = 20
END

return

')

--	fSuccess	= 0		Successful
--				= 5		Invalid Fragment No/Count
--				= 20	Incomplete Message
--				= 50	Duplicate Fragment
--				= 60	Bad Instance State

exec ('CREATE PROCEDURE [dbo].[bts_AddFragmentForMessageConstruction_' + @ApplicationName + ']
@uidInstanceID uniqueidentifier,
@uidInstanceStateID uniqueidentifier,
@nFragmentNumber int,
@nFragmentSize int,
@nNumFragments int,
@imgData image,
@imgPropBag image,
@imgContext image,
@fSuccess int OUTPUT,
@uidMessageID uniqueidentifier OUTPUT
AS

set nocount on
set transaction isolation level read committed

DECLARE	 @uidPartID uniqueidentifier
	,@nCount int
	,@nNumActualFragments int

set @uidMessageID = NULL
set @uidPartID = NULL
set @fSuccess = 0

-- Check if this is a Valid State

SELECT @uidMessageID = uidFragmentedMsgID, @uidPartID = uidFragmentedPartID
FROM ' + @DynamicStateTable + '
WHERE uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID
		
IF ( @@ROWCOUNT = 0)
BEGIN
	set @fSuccess = 60
	return
END


IF ( @uidPartID IS NOT NULL )
BEGIN

	-- Check if we are in the middle of a Fragmented and if so, if this is a duplicate fragment
	
	SELECT @nCount = COUNT(*) FROM Fragments WHERE uidPartID = @uidPartID AND nFragmentNumber = @nFragmentNumber
	IF ( @nCount > 0 )
	BEGIN
		set @fSuccess = 50
		return
	END
	
	-- Check if the Number of Fragment is correctly Set
	IF ( @nNumFragments > 0 )
	BEGIN
		SELECT @nNumActualFragments = MAX(nFragmentNumber) FROM Fragments WHERE uidPartID = @uidPartID
	
		IF ( @nNumActualFragments >= @nNumFragments )
		BEGIN
			set @fSuccess = 5
			return
		END
		
		-- Update the Fragment Count for this Fragment
		
		UPDATE Parts SET nNumFragments = @nNumFragments WHERE uidPartID = @uidPartID
	END
	
	-- Update the Message Context if Set
	
	IF ( @imgContext IS NOT NULL )
	BEGIN
		UPDATE Spool SET imgContext = @imgContext WHERE uidMessageID = @uidMessageID
	END
	
END
ELSE	-- If this is the First Fragment that is being created, create the Spool and the other associated Entries
BEGIN
	
	set @uidMessageID = NewID()
	set @uidPartID = NewID()
	
	INSERT INTO Spool WITH (ROWLOCK) (uidMessageID, nNumParts, uidBodyPartID, nvcBodyPartName, nCounter, imgContext) 
			   VALUES (@uidMessageID, 1, @uidPartID, N''Body'', 0, @imgContext)
			   
	INSERT INTO Parts WITH (ROWLOCK) (uidPartID, nNumFragments) VALUES (@uidPartID, @nNumFragments)
	
	exec int_RefCountPart @uidMessageID, @uidPartID, 1
	INSERT INTO MessageParts WITH (ROWLOCK) ( uidMessageID, uidPartID, nvcPartName, nBodyPart)
				VALUES		 ( @uidMessageID, @uidPartID, N''Body'', 1)
				
	--this message is only accessible by this instance so refcount locally
	exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, 1, 1
			
	INSERT INTO ' + @StateQName + '	WITH (ROWLOCK) 
						(uidInstanceID,	 uidInstanceStateID, uidMessageID)
				VALUES	(@uidInstanceID, @uidInstanceStateID, @uidMessageID)
	

	UPDATE ' + @DynamicStateTable + ' WITH (ROWLOCK) 
		SET uidFragmentedMsgID = @uidMessageID, uidFragmentedPartID = @uidPartID
		WHERE uidInstanceID = @uidInstanceID AND uidInstanceStateID = @uidInstanceStateID

END

-- Add the Fragment Data

IF ( @nFragmentNumber = 0 )
BEGIN
	UPDATE Parts SET imgPart = @imgData, nPartSize = nPartSize + @nFragmentSize WHERE uidPartID = @uidPartID
END
ELSE
BEGIN
	INSERT INTO Fragments WITH (ROWLOCK) (	uidPartID, nFragmentNumber, nFragmentSize, nOffsetStart, nOffsetEnd, imgFrag )
				VALUES ( @uidPartID, @nFragmentNumber, @nFragmentSize, 0, 0, @imgData)
	UPDATE Parts WITH (ROWLOCK) SET nPartSize = nPartSize + @nFragmentSize WHERE uidPartID = @uidPartID
END

-- Update the Part Property Bag

IF ( @imgPropBag IS NOT NULL )
BEGIN
	UPDATE Parts SET imgPropBag = @imgPropBag WHERE uidPartID = @uidPartID
END

-- See if the Message is fully constructed

-- Check if All Fragments are available for the Part

SELECT @nNumActualFragments = COUNT(*) FROM Fragments WHERE uidPartID = @uidPartID
SELECT @nNumFragments = nNumFragments FROM Parts WHERE uidPartID = @uidPartID AND imgPart IS NOT NULL

IF ( @@ROWCOUNT = 0 OR @nNumFragments = 0 OR @nNumActualFragments <> (@nNumFragments-1))
BEGIN
	set @fSuccess = 20
END


return

')

exec ('CREATE PROCEDURE [dbo].[bts_InsertDebugMessage_' + @ApplicationName + ']
@uidMessageID uniqueidentifier,
@nNumParts int,
@dtExpiration datetime,
@uidServiceID uniqueidentifier,
@uidClassID uniqueidentifier,
@uidPortID uniqueidentifier,
@dtValidTime datetime,
@dtStartWindow datetime,
@dtEndWindow datetime,
@uidAppInstanceID uniqueidentifier,
@nvcMessageType nvarchar(128),
@nvcAdapter nvarchar(512),
@nvcURI nvarchar(512),
@nvcUserState nvarchar(256),
@imgContext image

AS

set nocount on
set transaction isolation level read committed

declare @uidInstanceID uniqueidentifier
declare @nvcErrorMsg nvarchar(256)
declare @dtSuspendTimeStamp datetime

BEGIN TRANSACTION
			
--now we need to insert the message context into the spool			
if (@imgContext IS NOT NULL)
BEGIN
	--lets just leave these in the global counter list since I dont have the instance id
	exec int_RefCountMessage @uidMessageID, 1, 1
	
	-- Stubbing the code to insert into queue, because I need to add the adapter and uri information in the InstancesSuspended table
	set @uidInstanceID = NewID()
	
	SELECT @nvcErrorMsg = nvcError FROM LocalizedErrorStrings WHERE nID = 3	OPTION (KEEPFIXED PLAN)
	SET @nvcErrorMsg = replace( @nvcErrorMsg, ''%i'', @nvcUserState)
	
	set @dtSuspendTimeStamp = GetUTCDate()			
	INSERT INTO Instances WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, nState, dtSuspendTimeStamp, nErrorCategory, nvcErrorID, nvcErrorDescription, nvcUserState) 
	VALUES (N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID, 32, @dtSuspendTimeStamp, -3, ''0xC0C01B4e'', @nvcErrorMsg, @nvcUserState)

	INSERT INTO InstancesSuspended WITH (ROWLOCK) (uidAppOwnerID, uidInstanceID, uidServiceID, uidClassID, dtCreated, nState, nvcUserState, dtSuspendTimeStamp, nvcAdapter, nvcURI, nErrorCategory, nvcErrorID, nvcErrorDescription) 
	VALUES (N''' + @uidAppID + ''', @uidInstanceID, @uidServiceID, @uidClassID, GetUTCDate(), 32, @nvcUserState, @dtSuspendTimeStamp, @nvcAdapter, @nvcURI, -3, ''0xC0C01B4e'', @nvcErrorMsg ) 

	exec [int_InsertIntoQueue_' + @ApplicationName + '] @uidMessageID, NULL, @uidClassID, @dtStartWindow, @dtEndWindow, @dtValidTime, @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID, 1, 0, 0, 8, 0, @nvcUserState
	
	--Insert the Record in Spool
	INSERT INTO Spool WITH (ROWLOCK) (uidMessageID, dtExpiration, nvcMessageType, nNumParts, uidBodyPartID, nvcBodyPartName, nCounter,  imgContext) 
		VALUES (@uidMessageID, @dtExpiration, @nvcMessageType, @nNumParts, NULL, NULL, 1, @imgContext)
/*
	--lets check to see if we have enabled auditing of the subscriptions at this point
	--We add this check into the real bits so that we dont have to muck with the shipping code when enabling this auditing
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_SnapshotSubscriptions]'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
	BEGIN
		exec int_SnapshotSubscriptions @uidMessageID
	END
*/

END

COMMIT TRANSACTION

')

--	fSuccess	= 0		Successful
--				= 20	Incomplete Message
--				= 50	Duplicate Message
--				= 61	Instance Not Found

exec ('CREATE PROCEDURE [dbo].[bts_InsertMessageDirect_' + @ApplicationName + ']
@uidMessageID uniqueidentifier,
@nNumParts int,
@dtExpiration datetime,
@uidServiceID uniqueidentifier,
@uidClassID uniqueidentifier,
@uidInstanceID uniqueidentifier,
@uidPortID uniqueidentifier,
@dtValidTime datetime,
@dtStartWindow datetime,
@dtEndWindow datetime,
@snPriority smallint,
@uidAppInstanceID uniqueidentifier,
@snTrackMessage smallint,
@nvcMessageType nvarchar(128),
@uidPartID uniqueidentifier,
@nvcPartName nvarchar(256),
@nPartSize int,
@fSuccess int OUTPUT,
@imgPart image,
@imgPropBag image,
@fPartExistsInDB int,
@imgContext image

AS

set nocount on
set transaction isolation level read committed

declare	@snPartRetrieval smallint,
	@fOrderedDelivery int,
	@fAddToQueue int,
	@fInstanceState int,
	@fEnabled int,
	@dtLocalStartWindow datetime,
	@dtLocalEndWindow datetime,
	@dtLocalValidTime datetime

set @fSuccess = 0
set @fAddToQueue = 0
set @fInstanceState = -1
set @fEnabled = 1

set @snPartRetrieval = 0
set @fOrderedDelivery = 0

set @dtLocalStartWindow = [dbo].[bts_fnConvertUTCToLocalDate](@dtStartWindow)
set @dtLocalEndWindow = [dbo].[bts_fnConvertUTCToLocalDate](@dtEndWindow)

if ( @uidClassID IS NOT NULL AND @uidServiceID IS NOT NULL )
	set @fAddToQueue = 1

IF (@uidInstanceID IS NOT NULL) -- Make sure that this is not a stray Instance
BEGIN
	SELECT TOP 1 @fInstanceState = nState FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + '''
	OPTION (KEEPFIXED PLAN)
	if (@fInstanceState = 4) --handle suspended instance correctly
		set @fEnabled = 2
END

BEGIN TRANSACTION

IF ( (@fInstanceState <> -1) OR (@uidInstanceID IS NULL) ) -- this means we actually found something
BEGIN
	if (@imgContext IS NOT NULL) --The context will only be inserted with the body
	BEGIN				--so it is safe to assume this is a one time deal and no
						--race conditions exist
		set @fSuccess = 0
		
		if ( (@fAddToQueue <> 1) AND (@snTrackMessage = 0) ) -- this means we are not inserting the message anywhere. Perhaps it will be added to state
		BEGIN
			--insert direct is only for local messages so use the local log
			exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, 0, 1
		END

		if (@fAddToQueue = 1)
		BEGIN
			--insert direct is for local messages so use the local log
			exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, 1, 1
			exec [int_InsertIntoQueue_' + @ApplicationName + '] @uidMessageID, NULL, @uidClassID, @dtLocalStartWindow, @dtLocalEndWindow, @dtValidTime, @uidServiceID, @uidInstanceID, @uidAppInstanceID, @uidPortID, @snPartRetrieval, @fOrderedDelivery, @snPriority, @fEnabled, 0
		END

		--Insert the Record in Spool
		
		INSERT INTO Spool WITH (ROWLOCK) (uidMessageID, dtExpiration, nvcMessageType, nNumParts, uidBodyPartID, nvcBodyPartName, nCounter,  imgContext) 
			VALUES (@uidMessageID, @dtExpiration, @nvcMessageType, @nNumParts, @uidPartID, @nvcPartName, @fAddToQueue, @imgContext)

		exec int_InsertPart @uidMessageID, @uidPartID, 1, @nvcPartName, @nPartSize, @imgPart, @imgPropBag, @fPartExistsInDB, @fSuccess OUTPUT
	
		if (@snTrackMessage <> 0)
		BEGIN
			exec [int_TrackMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID
		END
	END
	ELSE
	BEGIN
		-- Insert the Body Part
		exec int_InsertPart @uidMessageID, @uidPartID, 0, @nvcPartName, @nPartSize, @imgPart, @imgPropBag, @fPartExistsInDB, @fSuccess OUTPUT
	END
END
ELSE
BEGIN
	set @fSuccess = 61
END

if ( @fSuccess > 0)	-- Cleanup the Stuff
BEGIN
	DELETE FROM Spool WITH (ROWLOCK) WHERE uidMessageID = @uidMessageID OPTION (KEEPFIXED PLAN)
END

COMMIT TRANSACTION

')


-----------------------------------------------------------------
-- Admin stored proc to add entries to the #ServiceInstance table
-----------------------------------------------------------------

exec (' CREATE PROCEDURE [dbo].[bts_AdminAddServiceInstances_' + @ApplicationName + ']
		@uidInstance1  uniqueidentifier,
		@uidInstance2  uniqueidentifier,
		@uidInstance3  uniqueidentifier,
		@uidInstance4  uniqueidentifier,
		@uidInstance5  uniqueidentifier,
		@uidInstance6  uniqueidentifier,
		@uidInstance7  uniqueidentifier,
		@uidInstance8  uniqueidentifier,
		@uidInstance9  uniqueidentifier,
		@uidInstance10 uniqueidentifier
		
AS


set transaction isolation level read committed
set nocount on
set deadlock_priority low

if(@uidInstance1 is not null)
	insert into #ServiceInstances values (@uidInstance1)
	
if(@uidInstance2 is not null)
	insert into #ServiceInstances values (@uidInstance2)
	
if(@uidInstance3 is not null)
	insert into #ServiceInstances values (@uidInstance3)
	
if(@uidInstance4 is not null)
	insert into #ServiceInstances values (@uidInstance4)
	
if(@uidInstance5 is not null)
	insert into #ServiceInstances values (@uidInstance5)

if(@uidInstance6 is not null)
	insert into #ServiceInstances values (@uidInstance6)
	
if(@uidInstance7 is not null)
	insert into #ServiceInstances values (@uidInstance7)
	
if(@uidInstance8 is not null)
	insert into #ServiceInstances values (@uidInstance8)
	
if(@uidInstance9 is not null)
	insert into #ServiceInstances values (@uidInstance9)
	
if(@uidInstance10 is not null)
	insert into #ServiceInstances values (@uidInstance10)
	
')

-----------------------------------------------------------------
-- Admin stored proc to add entries to the #ServiceInstance table
-----------------------------------------------------------------

exec (' CREATE PROCEDURE [dbo].[bts_AdminAddMessageInstances_' + @ApplicationName + ']
		@uidMessageInstance1  uniqueidentifier,
		@uidMessageInstance2  uniqueidentifier,
		@uidMessageInstance3  uniqueidentifier,
		@uidMessageInstance4  uniqueidentifier,
		@uidMessageInstance5  uniqueidentifier,
		@uidMessageInstance6  uniqueidentifier,
		@uidMessageInstance7  uniqueidentifier,
		@uidMessageInstance8  uniqueidentifier,
		@uidMessageInstance9  uniqueidentifier,
		@uidMessageInstance10 uniqueidentifier
		
AS


set transaction isolation level read committed
set nocount on
set deadlock_priority low

if(@uidMessageInstance1 is not null)
	insert into #MessageInstances values (@uidMessageInstance1)
	
if(@uidMessageInstance2 is not null)
	insert into #MessageInstances values (@uidMessageInstance2)
	
if(@uidMessageInstance3 is not null)
	insert into #MessageInstances values (@uidMessageInstance3)
	
if(@uidMessageInstance4 is not null)
	insert into #MessageInstances values (@uidMessageInstance4)
	
if(@uidMessageInstance5 is not null)
	insert into #MessageInstances values (@uidMessageInstance5)

if(@uidMessageInstance6 is not null)
	insert into #MessageInstances values (@uidMessageInstance6)
	
if(@uidMessageInstance7 is not null)
	insert into #MessageInstances values (@uidMessageInstance7)
	
if(@uidMessageInstance8 is not null)
	insert into #MessageInstances values (@uidMessageInstance8)
	
if(@uidMessageInstance9 is not null)
	insert into #MessageInstances values (@uidMessageInstance9)
	
if(@uidMessageInstance10 is not null)
	insert into #MessageInstances values (@uidMessageInstance10)
	
')
---------------------------------------------------------
-- Admin query for Service Instances on the Work Queue --
---------------------------------------------------------

exec (' CREATE PROCEDURE [dbo].[bts_AdminQueryWorkQInstances_' + @ApplicationName + ']
	@uidServiceClassID uniqueidentifier,
	@uidServiceTypeID uniqueidentifier
	
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @ServiceInstCount as int

CREATE TABLE #TempResults(uidInstanceID uniqueidentifier,
						  uidServiceID uniqueidentifier,
						  uidClassID uniqueidentifier,
						  dtLastTouched datetime,
						  iCountEntry int)
						  

select @ServiceInstCount = count(*)
from #ServiceInstances 


-- First search for all instances from the work queue.

insert into #TempResults
select
	wq.uidInstanceID,
	wq.uidServiceID,
	wq.uidClassID,
	wq.dtLastTouched,
	1
	
from 
	' + @QueueName + ' as wq
	
where
	(
		(wq.uidClassID = @uidServiceClassID)
		OR
		(@uidServiceClassID is null)
	)
	AND
	(
		(wq.uidServiceID = @uidServiceTypeID)
		OR
		(@uidServiceTypeID is null)
	)
	AND
	(
		(@ServiceInstCount = 0)
		OR
		(wq.uidInstanceID IN (select uidServiceInstID from #ServiceInstances))
	)	
	 
	
-- Next search for all instances from the instance message reference queue.
		
insert into #TempResults
	select 
	ism.uidInstanceID,
	dsi.uidServiceID,
	dsi.uidClassID,
	dsi.dtTimeStamp,
	1

from 
	' + @DynamicStateTable + ' as dsi,
	' + @StateQName + ' as ism
	
where	
	(
		(dsi.uidClassID = @uidServiceClassID)
		OR
		(@uidServiceClassID is null)
	)
	AND
	(
		(dsi.uidServiceID = @uidServiceTypeID)
		OR
		(@uidServiceTypeID is null)
	)
	AND
	(
		(@ServiceInstCount = 0)
		OR
		(ism.uidInstanceID IN (select uidServiceInstID from #ServiceInstances))
	)
	AND
		dsi.uidInstanceStateID = ism.uidInstanceStateID
	
	
	
-- Finally add instances that do not hold any message references.

insert into #TempResults
	select 
	dsi.uidInstanceID,
	dsi.uidServiceID,
	dsi.uidClassID,
	dsi.dtTimeStamp,
	0

from 
	' + @DynamicStateTable + ' as dsi
	
where	
	(
		(dsi.uidClassID = @uidServiceClassID)
		OR
		(@uidServiceClassID is null)
	)
	AND
	(
		(dsi.uidServiceID = @uidServiceTypeID)
		OR
		(@uidServiceTypeID is null)
	)
	AND
	(
		(@ServiceInstCount = 0)
		OR
		(dsi.uidInstanceID IN (select uidServiceInstID from #ServiceInstances))
	)
	AND
		dsi.uidInstanceStateID NOT IN (select ism.uidInstanceStateID from ' + @StateQName + ' as ism)
	
-- Now do the group by.
select 
	uidInstanceID,
	uidServiceID,
	uidClassID,
	min(dtLastTouched),
	sum(iCountEntry)

from #TempResults

group by uidClassID,
		 uidServiceID,
		 uidInstanceID
	
	
')







--------------------------------------------------------------
-- Admin query for Service Instances on the Suspended Queue --
--------------------------------------------------------------

exec (' CREATE PROCEDURE [dbo].[bts_AdminQuerySuspendedQInstances_' + @ApplicationName + ']
	@uidServiceClassID uniqueidentifier,
	@uidServiceTypeID uniqueidentifier
	
AS


set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @ServiceInstCount as int

CREATE TABLE #TempResults(uidInstanceID uniqueidentifier,
						  uidServiceID uniqueidentifier,
						  uidClassID uniqueidentifier,
						  dtLastTouched datetime,
						  iCountEntry int)

select @ServiceInstCount = count(*)
from #ServiceInstances 


-- First search for all instances from the suspended queue.

insert into #TempResults
select
	sq.uidInstanceID,
	sq.uidServiceID,
	sq.uidClassID,
	sq.dtLastTouched,
	1
	
from 
	' + @SuspendedQName + ' as sq
	
where
	(
		(sq.uidClassID = @uidServiceClassID)
		OR
		(@uidServiceClassID is null)
	)
	AND
	(
		(sq.uidServiceID = @uidServiceTypeID)
		OR
		(@uidServiceTypeID is null)
	)
	AND
	(
		(@ServiceInstCount = 0)
		OR
		(sq.uidInstanceID IN (select uidServiceInstID from #ServiceInstances))
	)	
	 
	
-- Next search for all instances from the instance message reference queue.
		
insert into #TempResults
	select 
	ism.uidInstanceID,
	dsi.uidServiceID,
	dsi.uidClassID,
	dsi.dtTimeStamp,
	1

from 
	' + @DynamicStateTable + ' as dsi,
	' + @StateQName + ' as ism
	
where	
	(
		(dsi.uidClassID = @uidServiceClassID)
		OR
		(@uidServiceClassID is null)
	)
	AND
	(
		(dsi.uidServiceID = @uidServiceTypeID)
		OR
		(@uidServiceTypeID is null)
	)
	AND
	(
		(@ServiceInstCount = 0)
		OR
		(ism.uidInstanceID IN (select uidServiceInstID from #ServiceInstances))
	)
	AND
		dsi.uidInstanceStateID = ism.uidInstanceStateID
	
	
	
-- Finally add instances that do not hold any message references.

insert into #TempResults
	select 
	dsi.uidInstanceID,
	dsi.uidServiceID,
	dsi.uidClassID,
	dsi.dtTimeStamp,
	0

from 
	' + @DynamicStateTable + ' as dsi
	
where	
	(
		(dsi.uidClassID = @uidServiceClassID)
		OR
		(@uidServiceClassID is null)
	)
	AND
	(
		(dsi.uidServiceID = @uidServiceTypeID)
		OR
		(@uidServiceTypeID is null)
	)
	AND
	(
		(@ServiceInstCount = 0)
		OR
		(dsi.uidInstanceID IN (select uidServiceInstID from #ServiceInstances))
	)
	AND
		dsi.uidInstanceStateID NOT IN (select ism.uidInstanceStateID from ' + @StateQName + ' as ism)
	
-- Now do the group by.
select 
	uidInstanceID,
	uidServiceID,
	uidClassID,
	min(dtLastTouched),
	sum(iCountEntry)

from #TempResults

group by uidClassID,
		 uidServiceID,
		 uidInstanceID
	

RETURN
	
')


------------------------------------------------
-- Admin query for Messages on the Work Queue --
------------------------------------------------

exec (' CREATE PROCEDURE [dbo].[bts_AdminQueryWorkQMessages_' + @ApplicationName + ']
	@dtLastTouched datetime,
	@uidServiceClassID uniqueidentifier,
	@uidServiceTypeID uniqueidentifier
	
AS


set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @MsgInstCount as int
declare @ServiceInstCount as int

declare @uidMessageID uniqueidentifier
declare @uidInstanceID uniqueidentifier
declare @uidServiceID uniqueidentifier
declare @uidClassID uniqueidentifier
declare @dtValid datetime
declare @dtExpiration datetime
declare @dtLastTouchedTemp datetime

declare @nvcNamespace nvarchar(256)
declare @nvcShortName nvarchar(128)
declare @vtPropValue sql_variant


CREATE TABLE #ReturnTable(uidMessageID uniqueidentifier, 
						  uidInstanceID uniqueidentifier, 
						  uidServiceID uniqueidentifier, 
						  uidClassID uniqueidentifier, 
						  dtValid datetime, 
						  dtExpiration datetime, 
						  dtLastTouched datetime,
						  nvcPropNamespace1 nvarchar(256),
						  nvcShortName1 nvarchar(128),
						  nvcPropValue1 nvarchar(256),
						  nvcPropNamespace2 nvarchar(256),
						  nvcShortName2 nvarchar(128),
						  nvcPropValue2 nvarchar(256),
						  nvcPropNamespace3 nvarchar(256),
						  nvcShortName3 nvarchar(128),
						  nvcPropValue3 nvarchar(256),
						  nvcPropNamespace4 nvarchar(256),
						  nvcShortName4 nvarchar(128),
						  nvcPropValue4 nvarchar(256) )


select @MsgInstCount = count(*)
from #MessageInstances 

select @ServiceInstCount = count(*)
from #ServiceInstances 


DECLARE MessageCursor CURSOR FOR
select
	wq.uidMessageID,
	wq.uidInstanceID,
	wq.uidServiceID,
	wq.uidClassID,
	wq.dtValid,
	sp.dtExpiration,
	wq.dtLastTouched
	
	
from 
	' + @QueueName + ' as wq, 
	Spool as sp
	
	
where
	(	(wq.dtLastTouched >= @dtLastTouched)
		OR
		(@dtLastTouched is null)
	)
	AND
	(
		(wq.uidClassID = @uidServiceClassID)
		OR
		(@uidServiceClassID is null)
	)
	AND
	(
		(wq.uidServiceID = @uidServiceTypeID)
		OR
		(@uidServiceTypeID is null)
	)
	AND
	(
		(@MsgInstCount = 0)
		OR
		(wq.uidMessageID IN (select uidMessageID from #MessageInstances))
	)
	AND
	(
		(@ServiceInstCount = 0)
		OR
		(wq.uidInstanceID IN (select uidServiceInstID from #ServiceInstances))
	)
	AND 
		wq.uidMessageID = sp.uidMessageID


OPEN MessageCursor		
		
FETCH NEXT FROM MessageCursor into @uidMessageID, @uidInstanceID, @uidServiceID, @uidClassID, @dtValid, @dtExpiration, @dtLastTouchedTemp


WHILE @@FETCH_STATUS = 0
BEGIN

	-- Insert the Message information into the temporary table, but leave the
	-- property values blank.
	insert into #ReturnTable values (
								@uidMessageID, 
								@uidInstanceID, 
								@uidServiceID, 
								@uidClassID, 
								@dtValid, 
								@dtExpiration, 
								@dtLastTouchedTemp,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null)


/* Disable fetching of message property values since this is broken due to removal of Promotions table

    --- The first property
	set @vtPropValue = null

	select 
		@nvcNamespace = p.nvcNamespace, 
		@nvcShortName = p.nvcShortName, 
		@vtPropValue = mp.vtPropValue 
	from 
		Promotions as p,
		MessageProps as mp
	where
		mp.uidMessageID = @uidMessageID and
		p.nvcNamespace = ''BTS'' and 
		p.nvcShortName = ''Destination'' and 
		p.uidIdentifier = mp.uidPropID
		
	if(@vtPropValue is not null)
		update #ReturnTable set 
			nvcPropNamespace1 = @nvcNamespace, 
			nvcShortName1 = @nvcShortName,
			nvcPropValue1 = CONVERT(nvarchar(256), @vtPropValue)
		where uidMessageID = @uidMessageID
		
		
	--- The second property	
	set @vtPropValue = null
	
	select 
		@nvcNamespace = p.nvcNamespace, 
		@nvcShortName = p.nvcShortName, 
		@vtPropValue = mp.vtPropValue 
	from 
		Promotions as p,
		MessageProps as mp
	where
		mp.uidMessageID = @uidMessageID and
		p.nvcNamespace = ''BTS'' and 
		p.nvcShortName = ''DestQualifier'' and 
		p.uidIdentifier = mp.uidPropID
		
	if(@vtPropValue is not null)
		update #ReturnTable set 
			nvcPropNamespace2 = @nvcNamespace, 
			nvcShortName2 = @nvcShortName,
			nvcPropValue2 = CONVERT(nvarchar(256), @vtPropValue)
		where uidMessageID = @uidMessageID
			
			
	--- The third property	
	set @vtPropValue = null
	
	select 
		@nvcNamespace = p.nvcNamespace, 
		@nvcShortName = p.nvcShortName, 
		@vtPropValue = mp.vtPropValue 
	from 
		Promotions as p,
		MessageProps as mp
	where
		mp.uidMessageID = @uidMessageID and
		p.nvcNamespace = ''BTS''
		and p.nvcShortName = ''Source'' and 
		p.uidIdentifier = mp.uidPropID
		
	if(@vtPropValue is not null)
		update #ReturnTable set 
			nvcPropNamespace3 = @nvcNamespace, 
			nvcShortName3 = @nvcShortName,
			nvcPropValue3 = CONVERT(nvarchar(256), @vtPropValue)
		where uidMessageID = @uidMessageID
			
			
	--- The fourth property	
	set @vtPropValue = null
	
	select 
		@nvcNamespace = p.nvcNamespace, 
		@nvcShortName = p.nvcShortName, 
		@vtPropValue = mp.vtPropValue 
	from 
		Promotions as p,
		MessageProps as mp
	where
		mp.uidMessageID = @uidMessageID and
		p.nvcNamespace = ''BTS''
		and p.nvcShortName = ''SourceQualifier'' and 
		p.uidIdentifier = mp.uidPropID
		
	if(@vtPropValue is not null)
		update #ReturnTable set 
			nvcPropNamespace4 = @nvcNamespace, 
			nvcShortName4 = @nvcShortName,
			nvcPropValue4 = CONVERT(nvarchar(256), @vtPropValue)
		where uidMessageID = @uidMessageID
*/	

	FETCH NEXT FROM MessageCursor into @uidMessageID, @uidInstanceID, @uidServiceID, @uidClassID, @dtValid, @dtExpiration, @dtLastTouchedTemp

END


CLOSE MessageCursor
DEALLOCATE MessageCursor

-- Return the results
select  uidMessageID, 
		uidInstanceID, 
		uidServiceID,
		uidClassID,
		dtValid, 
		dtExpiration, 
		dtLastTouched,
		nvcPropNamespace1,
		nvcShortName1,
		nvcPropValue1,
		nvcPropNamespace2,
		nvcShortName2,
		nvcPropValue2,
		nvcPropNamespace3,
		nvcShortName3,
		nvcPropValue3,
		nvcPropNamespace4,
		nvcShortName4,
		nvcPropValue4
from #ReturnTable

RETURN
	
')



-----------------------------------------------------
-- Admin query for Messages on the Suspended Queue --
-----------------------------------------------------

exec (' CREATE PROCEDURE [dbo].[bts_AdminQuerySuspendedQMessages_' + @ApplicationName + ']
	@dtLastTouched datetime,
	@uidServiceClassID uniqueidentifier,
	@uidServiceTypeID uniqueidentifier
	
AS


set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @MsgInstCount as int
declare @ServiceInstCount as int

declare @uidMessageID uniqueidentifier
declare @uidInstanceID uniqueidentifier
declare @uidServiceID uniqueidentifier
declare @uidClassID uniqueidentifier
declare @dtValid datetime
declare @dtExpiration datetime
declare @dtLastTouchedTemp datetime
declare @dtTimeStamp datetime
declare @nvcErrorID nvarchar(512)
declare @nErrorCategory int
declare @nvcAdditionalInfo nvarchar(512)
declare @nvcProcessingServer nvarchar(256)
declare @nIsResumable int

declare @nvcNamespace nvarchar(256)
declare @nvcShortName nvarchar(128)
declare @vtPropValue sql_variant

CREATE TABLE #ReturnTable(uidMessageID uniqueidentifier, 
						  uidInstanceID uniqueidentifier, 
						  uidServiceID uniqueidentifier, 
						  uidClassID uniqueidentifier, 
						  dtValid datetime, 
						  dtExpiration datetime, 
						  dtLastTouched datetime,
						  dtTimeStamp datetime,
						  nvcErrorID nvarchar(512),
						  nErrorCategory smallint,
						  nvcAdditionalInfo nvarchar(512),
						  nIsResumable int,
						  nvcProcessingServer nvarchar(256),
						  nvcPropNamespace1 nvarchar(256),
						  nvcShortName1 nvarchar(128),
						  nvcPropValue1 nvarchar(256),
						  nvcPropNamespace2 nvarchar(256),
						  nvcShortName2 nvarchar(128),
						  nvcPropValue2 nvarchar(256),
						  nvcPropNamespace3 nvarchar(256),
						  nvcShortName3 nvarchar(128),
						  nvcPropValue3 nvarchar(256),
						  nvcPropNamespace4 nvarchar(256),
						  nvcShortName4 nvarchar(128),
						  nvcPropValue4 nvarchar(256) )

select @MsgInstCount = count(*)
from #MessageInstances 

select @ServiceInstCount = count(*)
from #ServiceInstances 


DECLARE MessageCursor CURSOR FOR
select
	sq.uidMessageID,
	sq.uidInstanceID,
	sq.uidServiceID,
	sq.uidClassID,
	sq.dtValid,
	sp.dtExpiration,
	sq.dtLastTouched,
	sq.dtTimeStamp,
	sq.nvcErrorID,
	sq.nErrorCategory,
	sq.nvcAdditionalInfo,
	sq.nIsResumable,
	sq.nvcProcessingServer
	
	
from 
	' +  @SuspendedQName + ' as sq, 
	Spool as sp
	
where
	(	(sq.dtTimeStamp >= @dtLastTouched)
		OR
		(@dtLastTouched is null)
	)
	AND
	(
		(sq.uidClassID = @uidServiceClassID)
		OR
		(@uidServiceClassID is null)
	)
	AND
	(
		(sq.uidServiceID = @uidServiceTypeID)
		OR
		(@uidServiceTypeID is null)
	)
	AND
	(
		(@MsgInstCount = 0)
		OR
		(sq.uidMessageID IN (select uidMessageID from #MessageInstances))
	)
	AND
	(
		(@ServiceInstCount = 0)
		OR
		(sq.uidInstanceID IN (select uidServiceInstID from #ServiceInstances))
	)
	AND 
		sq.uidMessageID = sp.uidMessageID	

OPEN MessageCursor		
		
FETCH NEXT FROM MessageCursor into @uidMessageID, @uidInstanceID, @uidServiceID, @uidClassID, @dtValid, @dtExpiration, @dtLastTouchedTemp, @dtTimeStamp, @nvcErrorID, @nErrorCategory, @nvcAdditionalInfo, @nIsResumable, @nvcProcessingServer
	
	
WHILE @@FETCH_STATUS = 0
BEGIN

	-- Insert the Message information into the temporary table, but leave the
	-- property values blank.
	insert into #ReturnTable values (
								@uidMessageID, 
								@uidInstanceID, 
								@uidServiceID, 
								@uidClassID, 
								@dtValid, 
								@dtExpiration, 
								@dtLastTouchedTemp,
								@dtTimeStamp,
								@nvcErrorID,
								@nErrorCategory,
								@nvcAdditionalInfo,
								@nIsResumable,
								@nvcProcessingServer,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null,
								null)

/* Disable fetching of message property values since this is broken due to removal of Promotions table

    --- The first property
	set @vtPropValue = null

	select 
		@nvcNamespace = p.nvcNamespace, 
		@nvcShortName = p.nvcShortName, 
		@vtPropValue = mp.vtPropValue 
	from 
		Promotions as p,
		MessageProps as mp
	where
		mp.uidMessageID = @uidMessageID and
		p.nvcNamespace = ''BTS'' and 
		p.nvcShortName = ''Destination'' and 
		p.uidIdentifier = mp.uidPropID
		
	if(@vtPropValue is not null)
		update #ReturnTable set 
			nvcPropNamespace1 = @nvcNamespace, 
			nvcShortName1 = @nvcShortName,
			nvcPropValue1 = CONVERT(nvarchar(256), @vtPropValue)
		where uidMessageID = @uidMessageID
		
		
	--- The second property	
	set @vtPropValue = null
	
	select 
		@nvcNamespace = p.nvcNamespace, 
		@nvcShortName = p.nvcShortName, 
		@vtPropValue = mp.vtPropValue 
	from 
		Promotions as p,
		MessageProps as mp
	where
		mp.uidMessageID = @uidMessageID and
		p.nvcNamespace = ''BTS'' and 
		p.nvcShortName = ''DestQualifier'' and 
		p.uidIdentifier = mp.uidPropID
		
	if(@vtPropValue is not null)
		update #ReturnTable set 
			nvcPropNamespace2 = @nvcNamespace, 
			nvcShortName2 = @nvcShortName,
			nvcPropValue2 = CONVERT(nvarchar(256), @vtPropValue)
		where uidMessageID = @uidMessageID
			
			
	--- The third property	
	set @vtPropValue = null
	
	select 
		@nvcNamespace = p.nvcNamespace, 
		@nvcShortName = p.nvcShortName, 
		@vtPropValue = mp.vtPropValue 
	from 
		Promotions as p,
		MessageProps as mp
	where
		mp.uidMessageID = @uidMessageID and
		p.nvcNamespace = ''BTS''
		and p.nvcShortName = ''Source'' and 
		p.uidIdentifier = mp.uidPropID
		
	if(@vtPropValue is not null)
		update #ReturnTable set 
			nvcPropNamespace3 = @nvcNamespace, 
			nvcShortName3 = @nvcShortName,
			nvcPropValue3 = CONVERT(nvarchar(256), @vtPropValue)
		where uidMessageID = @uidMessageID
			
			
	--- The fourth property	
	set @vtPropValue = null
	
	select 
		@nvcNamespace = p.nvcNamespace, 
		@nvcShortName = p.nvcShortName, 
		@vtPropValue = mp.vtPropValue 
	from 
		Promotions as p,
		MessageProps as mp
	where
		mp.uidMessageID = @uidMessageID and
		p.nvcNamespace = ''BTS''
		and p.nvcShortName = ''SourceQualifier'' and 
		p.uidIdentifier = mp.uidPropID
		
	if(@vtPropValue is not null)
		update #ReturnTable set 
			nvcPropNamespace4 = @nvcNamespace, 
			nvcShortName4 = @nvcShortName,
			nvcPropValue4 = CONVERT(nvarchar(256), @vtPropValue)
		where uidMessageID = @uidMessageID
*/	

	FETCH NEXT FROM MessageCursor into @uidMessageID, @uidInstanceID, @uidServiceID, @uidClassID, @dtValid, @dtExpiration, @dtLastTouchedTemp, @dtTimeStamp, @nvcErrorID, @nErrorCategory, @nvcAdditionalInfo, @nIsResumable, @nvcProcessingServer

END


CLOSE MessageCursor
DEALLOCATE MessageCursor

-- Return the results
select  uidMessageID, 
		uidInstanceID, 
		uidServiceID, 
		uidClassID, 
		dtValid, 
		dtExpiration, 
		dtLastTouched,
		dtTimeStamp,
		nvcErrorID,
		nErrorCategory,
		nvcAdditionalInfo,
		nIsResumable,
		nvcProcessingServer,
		nvcPropNamespace1,
		nvcShortName1,
		nvcPropValue1,
		nvcPropNamespace2,
		nvcShortName2,
		nvcPropValue2,
		nvcPropNamespace3,
		nvcShortName3,
		nvcPropValue3,
		nvcPropNamespace4,
		nvcShortName4,
		nvcPropValue4
from #ReturnTable

RETURN

')


exec('CREATE PROCEDURE [dbo].[bts_AdminDeleteSuspendedMessageRef_' + @ApplicationName + ']
	@uidServiceID uniqueidentifier,
	@uidInstanceID uniqueidentifier,
	@uidMessageID uniqueidentifier,
	@fSuccess int OUTPUT,
	@fPrimaryFailedMsgInOrderedDeliverySendPort int = 0
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

declare @refCount smallint
set @fSuccess = 0

if (@fPrimaryFailedMsgInOrderedDeliverySendPort = 0)
BEGIN
	--we will only delete non-resumable messages in this case
	SELECT @refCount = COUNT(*)
	FROM ' + @SuspendedQName + ' 
	WHERE uidServiceID = @uidServiceID AND
	      uidInstanceID = @uidInstanceID AND
	      uidMessageID = @uidMessageID AND
	      nIsResumable = 0

	if (@refCount > 0)
	BEGIN

		exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, @refCount

		DELETE  FROM ' + @SuspendedQName + ' 
		WHERE 	uidServiceID = @uidServiceID AND
	     	 	uidInstanceID = @uidInstanceID AND
	      		uidMessageID = @uidMessageID AND
	      		nIsResumable = 0

		set @fSuccess = @@ROWCOUNT
	END
END
ELSE
BEGIN
	--we will only delete non-resumable messages in this case
	SELECT @refCount = COUNT(*)
	FROM ' + @SuspendedQName + ' 
	WHERE uidServiceID = @uidServiceID AND
	      uidInstanceID = @uidInstanceID AND
	      uidMessageID = @uidMessageID

	if (@refCount > 0)
	BEGIN

		exec [int_RefCountMessage_' + @ApplicationName + '] @uidInstanceID, @uidMessageID, @refCount

		DELETE  FROM ' + @SuspendedQName + ' 
		WHERE 	uidServiceID = @uidServiceID AND
	     	 	uidInstanceID = @uidInstanceID AND
	      		uidMessageID = @uidMessageID

		set @fSuccess = @@ROWCOUNT
	END
END


')

-----------------------------------
-- Admin query to start and stop a sendport given its subscription id --
--  am separating this out so that operators can do this with explicit permissions --
--I don't really like this code cause I talk about sendports when really we are looking at --
--services which dont do correlation and so I don't have to look at each instance --
----------------------------------------------

exec ('CREATE PROCEDURE [dbo].[bts_AdminOperatorsStartAndStopService_' + @ApplicationName + ']
	@uidServiceID uniqueidentifier,
	@uidSubscriptionID uniqueidentifier,
	@fOperation int,
	@fResumeInstances int
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

--3 is resume / start
--1 is suspend / stop

if (@fOperation = 3)
BEGIN
	--this should be an activation subscription
	if (@uidSubscriptionID IS NOT NULL)
	BEGIN
		UPDATE Subscription set Subscription.fEnabled = 1
		FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_1))
		WHERE Subscription.uidSubID = @uidSubscriptionID --AND Subscription.uidServiceID = @uidServiceID (not on the index right now so leaving out)
		OPTION (KEEPFIXED PLAN)
	END
	ELSE
	BEGIN
		UPDATE Subscription set Subscription.fEnabled = 1
		FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_2))
		WHERE Subscription.uidServiceID = @uidServiceID AND Subscription.uidInstanceID IS NULL
		OPTION (KEEPFIXED PLAN)
	END

	if (@fResumeInstances > 0)
	BEGIN
		--need to move all messages which were routed here because the subscription was deactivated

		declare @uidInstanceID uniqueidentifier,
			@nReturn int,
			@uidClassID uniqueidentifier


		declare InstanceCursor cursor FOR
		select i.uidInstanceID, i.uidClassID
		FROM Instances i, ' + @SuspendedQName + ' as sq
		WHERE sq.uidSubscriptionID = @uidSubscriptionID AND sq.nvcErrorID = N''0xC0C01B4D'' AND sq.uidInstanceID = i.uidInstanceID

		open InstanceCursor
		FETCH NEXT FROM InstanceCursor INTO @uidInstanceID, @uidClassID

		WHILE @@FETCH_STATUS = 0
		BEGIN

			set @nReturn = 0
			exec [dbo].[bts_AdminPreemptiveOperateOnInstances_' + @ApplicationName + '] 3 /*resume*/, 5 /*priority --this is ignored*/, @uidInstanceID, @uidServiceID, @uidClassID, @nReturn OUTPUT
			--in general we ignore the return param since there is really nothing we can do with it. If the instance
			--completed before we got here, that is okay. If however, we could not lock the instances and it is 
			--msmqt, then it is possible that there is another port on the same instance which is running. In
			--this case, we need to manually resume the suspended messages and leave the instance as is

			if ( (@nReturn = 2) AND (@uidClassID = ''{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}'') ) --we could not lock the instance
			BEGIN
				INSERT INTO ' + @QueueName + ' WITH (ROWLOCK) (uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nRetryCount)
				SELECT uidWorkID, uidMessageID, uidSubscriptionID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, uidAppInstanceID, uidPortID, snPartRetrieval, fOrderedDelivery, nRetryCount FROM ' + @SuspendedQName + ' WITH (ROWLOCK) WHERE uidSubscriptionID = @uidSubscriptionID AND nvcErrorID = N''0xC0C01B4D''
				OPTION (KEEPFIXED PLAN)

				DELETE ' + @SuspendedQName + ' WITH (ROWLOCK) WHERE uidSubscriptionID = @uidSubscriptionID AND nvcErrorID = N''0xC0C01B4D'' OPTION (KEEPFIXED PLAN)
			END

			FETCH NEXT FROM InstanceCursor INTO @uidInstanceID, @uidClassID
		END		
		
		close InstanceCursor
		deallocate InstanceCursor		
	END
	
END
if (@fOperation = 1)
BEGIN
	if (@uidSubscriptionID IS NOT NULL)
	BEGIN
		UPDATE Subscription SET Subscription.fEnabled = 2 FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_1)) WHERE Subscription.uidSubID = @uidSubscriptionID OPTION (KEEPFIXED PLAN)
	END
	ELSE
	BEGIN
		UPDATE Subscription SET Subscription.fEnabled = 2 FROM Subscription WITH (ROWLOCK INDEX(IX_Subscription_2)) WHERE Subscription.uidServiceID = @uidServiceID AND Subscription.uidInstanceID IS NULL OPTION (KEEPFIXED PLAN)
	END	
END
')

-----------------------------------
-- Admin query for all instances --
-----------------------------------
	
exec(' CREATE PROCEDURE [dbo].[bts_AdminPreemptAndGetInstances_' + @ApplicationName + ']
	@uidServiceTypeID uniqueidentifier,
	@fOperation int,
	@nPriority int,
	@nInstanceCount int OUTPUT
	
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

/*
@fOperation = 0, Dont pre-empt, just return number of instances
             = 1, Pre-emptively suspend instance and return running instances
             = 2, Pre-emptively delete instances and return *all* instances
    	     = 3, Resume instances
	     = 5, Send terminate control message to instance without locking instance, for ordered delivery send port instances
    		 
*/

CREATE TABLE #Instances (uidInstanceID uniqueidentifier, fOperated int, nPendingOperation int, uidClassID uniqueidentifier)
/*
fOperated	= 0, Control message needs to be sent
			= 1, Preemptively operated on the instance
			= 2, Lock instance failed. This will only be returned if their is already a pending operation and we cant lock the instance
			= 3, Bad instance. Instance does not exist in the database. This would imply the instance completed, so lets just delete the record
			= 4, Operation cannot be performed for instance in this state
*/

SET @nInstanceCount = 0

IF (@fOperation = 0)
BEGIN
	SELECT @nInstanceCount = COUNT(*) FROM Instances WITH (ROWLOCK) WHERE uidServiceID = @uidServiceTypeID
	return
END
ELSE IF (@fOperation = 1)
BEGIN
	INSERT INTO #Instances
		SELECT uidInstanceID, 0, 1, uidClassID FROM Instances WITH (ROWLOCK) WHERE uidServiceID = @uidServiceTypeID AND nState <> 4 AND nState <> 16 --suspended, zombie

END
ELSE IF (@fOperation = 2 OR @fOperation = 5)
BEGIN

	INSERT INTO #Instances
		SELECT uidInstanceID, 0, 1, uidClassID FROM Instances WITH (ROWLOCK) WHERE uidServiceID = @uidServiceTypeID
END
ELSE
BEGIN
	-- Search for all instances from the suspended queue.
	INSERT INTO #Instances
		SELECT uidInstanceID, 0, 1, uidClassID FROM Instances WITH (ROWLOCK) WHERE uidServiceID = @uidServiceTypeID AND ( nErrorCategory = -1 OR nErrorCategory = -3) AND nState = 4 --suspended
END


IF @fOperation <> 0
BEGIN
	
	-- Pre-emptively suspend/terminate/resume instances.
	
	declare @uidInstanceID uniqueidentifier,
		@nPendingOperation smallint,
		@nReturn int,
		@uidClassID uniqueidentifier
			
	declare InstanceCursor cursor FOR
	select uidInstanceID, uidClassID from #Instances
	
	open InstanceCursor
	FETCH NEXT FROM InstanceCursor INTO @uidInstanceID, @uidClassID

	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @nReturn = 0

		exec [dbo].[bts_AdminPreemptiveOperateOnInstances_' + @ApplicationName + '] @fOperation, @nPriority, @uidInstanceID, @uidServiceTypeID, @uidClassID, @nReturn OUTPUT
		if (@nReturn = 3) -- this means the instance completed in the mean time
		BEGIN
			DELETE #Instances WHERE CURRENT OF InstanceCursor
		END
		ELSE
		BEGIN
			UPDATE #Instances set fOperated = @nReturn where current of InstanceCursor
		END
	
		FETCH NEXT FROM InstanceCursor INTO @uidInstanceID, @uidClassID
	END
	
	
	close InstanceCursor
	deallocate InstanceCursor
END

select @nInstanceCount = count(*) from #Instances
select * from #Instances

RETURN
')

exec(' CREATE PROCEDURE [dbo].[bts_AdminOperatorsPreemptAndGetInstances_' + @ApplicationName + ']
	@uidServiceTypeID uniqueidentifier,
	@fOperation int,
	@nPriority int,
	@nInstanceCount int OUTPUT
	
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

--This sproc is added to limit permissions for the operators role
if ( (@fOperation != 1) AND (@fOperation != 3) )
BEGIN
	declare @nvcError nvarchar(256)
	SELECT @nvcError = nvcError FROM LocalizedErrorStrings WHERE nID = 6
	RAISERROR(@nvcError, 16, 1)
END

exec [dbo].[bts_AdminPreemptAndGetInstances_' + @ApplicationName + '] @uidServiceTypeID, @fOperation, @nPriority, @nInstanceCount OUTPUT
')

-------------------------------------------
-- Admin proc to get the instance locks. --
-------------------------------------------
exec (' CREATE PROCEDURE [dbo].[bts_AdminCompleteTerminate_' + @ApplicationName + ']
@uidInstanceID uniqueidentifier,
@uidServiceID uniqueidentifier,
@uidClassID uniqueidentifier,
@nResult int
AS
declare	@fOperatedOn int

set nocount on
set transaction isolation level read committed

-- If we pre-emptively terminated the instance
if @nResult = 1
begin
	exec [dbo].[int_AdminTerminateInstance_' + @ApplicationName + '] @uidInstanceID, @uidServiceID, @fOperatedOn output
end
		
RETURN')

exec ('CREATE PROCEDURE [dbo].[bts_Read_' + @ApplicationName + 'Q]
AS


set nocount on
set transaction isolation level read committed

SELECT uidWorkID, uidMessageID, uidSubscriptionID, dtLastTouched, snPriority, dtStartWindow, dtEndWindow, dtValid, uidClassID, uidServiceID, uidInstanceID, uidPortID FROM ' + @QueueName + '

')

exec ('CREATE PROCEDURE [dbo].[bts_Read_' + @ApplicationName + '_SuspendedQ]
AS


set nocount on
set transaction isolation level read committed

SELECT uidMessageID, uidInstanceID FROM ' + @SuspendedQName + '

')

--
-- MessageBoxOM stored procs.
--

exec (' CREATE PROCEDURE [dbo].[MBOM_LookupMessages_' + @ApplicationName + ']
(
	@nServiceClass int,
	@uidServiceType uniqueidentifier,
	@uidSendPortTransportId uniqueidentifier,
	@nReferenceType int,
	@dtFrom datetime,
	@dtUntil datetime,
	@nMaxMatches int
)

AS
	SET NOCOUNT ON

	if (@nMaxMatches > 0)
		set ROWCOUNT @nMaxMatches
		
	declare @tsql nvarchar(4000)
		
	declare @fFirstClause int,
		@AND nchar(4),
		@OR nchar(3),
		@Equals int


	set @AND = N''AND''
	set @OR = N''OR''
	set @fFirstClause = 0 --the first clause is hardcoded
	set @Equals = 1

STARTLOOP:
	set @tsql = N''''

	if ((@nReferenceType & 1) > 0)
	BEGIN
		set @tsql = @tsql + N''SELECT s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, q.nRetryCount FROM Spool as s WITH (ROWLOCK READPAST), ' + @QueueName + ' as q WITH (ROWLOCK READPAST) WHERE s.uidMessageID = q.uidMessageID ''

		set @nReferenceType = @nReferenceType & 14 --lets get rid of this 1
	END
	else if ((@nReferenceType & 2) > 0)
	BEGIN
		--state queue does not have a retry count column
		set @tsql = @tsql + N''SELECT s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, null FROM Spool as s WITH (ROWLOCK READPAST), ' + @StateQName + ' as q WITH (ROWLOCK READPAST) WHERE s.uidMessageID = q.uidMessageID ''

		set @nReferenceType = @nReferenceType & 12 --lets get rid of this 2
	END
	else if ((@nReferenceType & 12) = 12)
	BEGIN
		
		set @tsql = @tsql + N''SELECT s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, q.nRetryCount FROM Spool as s WITH (ROWLOCK READPAST), ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) WHERE s.uidMessageID = q.uidMessageID ''

		set @nReferenceType = 0 --lets get rid of the 4 and the 8
	END
	else if ((@nReferenceType & 4) > 0)
	BEGIN
		
		set @tsql = @tsql + N''SELECT s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, q.nRetryCount FROM Spool as s WITH (ROWLOCK READPAST), ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) WHERE s.uidMessageID = q.uidMessageID AND q.nIsResumable > 0 ''

		set @nReferenceType = @nReferenceType & 8 --lets get rid of this 4
	END
	else if ( (@nReferenceType & 8) > 0)
	BEGIN
		
		set @tsql = @tsql + N''SELECT s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, q.nRetryCount FROM Spool as s WITH (ROWLOCK READPAST), ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) WHERE s.uidMessageID = q.uidMessageID AND q.nIsResumable = 0 ''

		set @nReferenceType = 0 --lets get rid of this 8
	END
	else
	BEGIN
		return
	END

	
	if (@uidServiceType IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidServiceType, @Equals, N''i.uidServiceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	if (@uidSendPortTransportId IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidSendPortTransportId, @Equals, N''q.uidPortID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	--there is a bug in the WMI code which is passing these in backwards so we have to use the opposite operators
	if (@dtFrom IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @dtFrom, 7 /*lessthanorequals*/, N''s.dtCreated'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	if (@dtUntil IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @dtUntil, 6 /*greaterthanorequals*/, N''s.dtCreated'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END


	IF ( (@nServiceClass IS NOT NULL)  AND (@nServiceClass <> 63) ) --63 is all classes so we can skip this
	BEGIN
		declare @uidClassID uniqueidentifier,
			@fFirstClass int
				
		set @fFirstClass = 3

		IF (@fFirstClause =0)
			set @tsql = @tsql + ''AND ''
		else
			set @tsql = @tsql + ''WHERE ''

		set @tsql = @tsql + ''( '' --group all of these since we will need an or statement for this

		IF ( (@nServiceClass & 1) = 1)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 1 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''q.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 2) = 2)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 2 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''q.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass &4) = 4)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 4 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''q.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 8) = 8)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 8 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''q.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 16) = 16)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''q.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 32) = 32)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 32 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''q.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 64) = 64)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 64 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''q.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + '') ''
		set @fFirstClause = 0

	END

	set @tsql = @tsql + ''ORDER BY s.dtTimeStamp''

	exec (@tsql)

	GOTO STARTLOOP

')


exec (' CREATE PROCEDURE [dbo].[MBOM_LookupReferencingMessages_' + @ApplicationName + ']
(
	@uidInstanceID uniqueidentifier,
	@uidSendPortTransportId uniqueidentifier,
	@nReferenceType int
)
AS
	SET NOCOUNT ON
		
	declare @tsql nvarchar(4000)
		
	declare @fFirstClause int,
		@AND nchar(4),
		@OR nchar(3),
		@Equals int

	set @AND = N''AND''
	set @OR = N''OR''	
	set @Equals = 1

STARTLOOP:

	set @fFirstClause = 1 
	set @tsql = ''''
	

	if ((@nReferenceType & 1) > 0)
	BEGIN
		set @tsql = N''select 1, s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, q.nRetryCount, null, null, null, null, null FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Spool as s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		exec MBOM_AppendClauseToQueryString @uidInstanceID, @Equals, N''q.uidInstanceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
		
		set @nReferenceType = @nReferenceType & 14 --lets get rid of this 1
	END
	else if ((@nReferenceType & 2) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 2, s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, null, null, null, null, null, null, null FROM ' + @StateQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool as s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		exec MBOM_AppendClauseToQueryString @uidInstanceID, @Equals, N''q.uidInstanceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

		set @nReferenceType = @nReferenceType & 12 --lets get rid of this 2
	END
	else if ((@nReferenceType & 12) = 12)
	BEGIN
		
		set @tsql = @tsql + N''select CASE q.nIsResumable WHEN 1 THEN 4 WHEN 0 THEN 8 END, s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, q.nRetryCount, q.dtLastTouched, q.nErrorCategory, q.nvcErrorID, q.nvcAdditionalInfo, q.nvcProcessingServer FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool as s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		exec MBOM_AppendClauseToQueryString @uidInstanceID, @Equals, N''q.uidInstanceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

		set @nReferenceType = @nReferenceType & 0 --lets get rid of this 4 and 8
	END
	else if ((@nReferenceType & 4) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 4, s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, q.nRetryCount, q.dtLastTouched, q.nErrorCategory, q.nvcErrorID, q.nvcAdditionalInfo, q.nvcProcessingServer FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool as s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		exec MBOM_AppendClauseToQueryString @uidInstanceID, @Equals, N''q.uidInstanceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
		set @tsql = @tsql + ''AND q.nIsResumable > 0 ''

		set @nReferenceType = @nReferenceType & 8 --lets get rid of this 4
	END
	else if ( (@nReferenceType & 8) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 8, s.uidMessageID, s.dtTimeStamp, s.UserName, s.OriginatorSID, s.OriginatorPID, q.uidPortID, q.nRetryCount, q.dtLastTouched, q.nErrorCategory, q.nvcErrorID, q.nvcAdditionalInfo, q.nvcProcessingServer FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool as s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		exec MBOM_AppendClauseToQueryString @uidInstanceID, @Equals, N''q.uidInstanceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
		set @tsql = @tsql + ''AND q.nIsResumable = 0 ''

		set @nReferenceType = 0 --lets get rid of this 8
	END
	else
	BEGIN
		return
	END

	if (@uidSendPortTransportId IS NOT NULL)
		exec MBOM_AppendClauseToQueryString @uidSendPortTransportId, @Equals, N''q.uidPortID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
		

	exec (@tsql)

	GOTO STARTLOOP
	

')


exec (' CREATE PROCEDURE [dbo].[MBOM_LookupReferencingInstances_' + @ApplicationName + ']
(
	@uidServiceClass uniqueidentifier,
	@uidServiceType uniqueidentifier,
	@uidMessageId uniqueidentifier,
	@nReferenceType int,
	@nvcUserState nvarchar(256),
	@snStatus smallint,
	@PendingOperation smallint
)
AS
	SET NOCOUNT ON
		
	declare @tsql nvarchar(4000)

		
	declare @fFirstClause int,
		@AND nchar(4),
		@OR nchar(3),
		@Equals int,
		@ANDFactor int


	set @AND = N''AND''
	set @OR = N''OR''
	set @Equals = 1

STARTLOOP:
	
	set @fFirstClause = 0 --we dont what WHEREs in the JOINs

	if ((@nReferenceType & 1) > 0)
	BEGIN
		set @tsql = N''select 1, ' + '''''' + @ApplicationName + '''''' + ', q.uidInstanceID, q.uidServiceID, q.uidClassID, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime, i.dtSuspendTimeStamp, i.nErrorCategory, i.nvcErrorID, i.nvcErrorDescription, i.nvcErrorProcessingServer FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Instances as i WITH (ROWLOCK READPAST) ON i.uidInstanceID = q.uidInstanceID ''
		
		set @ANDFactor = 14 --lets get rid of this 1
	END
	else if ((@nReferenceType & 2) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 2, ' + '''''' + @ApplicationName + '''''' + ', q.uidInstanceID, q.uidServiceID, q.uidClassID, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime, i.dtSuspendTimeStamp, i.nErrorCategory, i.nvcErrorID, i.nvcErrorDescription, i.nvcErrorProcessingServer FROM ' + @StateQName + ' as q WITH (ROWLOCK READPAST) JOIN Instances as i WITH (ROWLOCK READPAST) ON i.uidInstanceID = q.uidInstanceID ''
		
		set @ANDFactor = 12 --lets get rid of this 2
	END
	else if ((@nReferenceType & 12) = 12)
	BEGIN
		
		set @tsql = @tsql + N''select CASE q.nIsResumable WHEN 1 THEN 4 WHEN 0 THEN 8, ' + '''''' + @ApplicationName + '''''' + ', q.uidInstanceID, q.uidServiceID, q.uidClassID, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime, i.dtSuspendTimeStamp, i.nErrorCategory, i.nvcErrorID, i.nvcErrorDescription, i.nvcErrorProcessingServer FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Instances as i WITH (ROWLOCK READPAST) ON i.uidInstanceID = q.uidInstanceID ''
		
		set @ANDFactor = 0 --lets get rid of this 4 and 8
	END
	else if ((@nReferenceType & 4) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 4, ' + '''''' + @ApplicationName + '''''' + ', q.uidInstanceID, q.uidServiceID, q.uidClassID, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime, i.dtSuspendTimeStamp, i.nErrorCategory, i.nvcErrorID, i.nvcErrorDescription, i.nvcErrorProcessingServer FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Instances as i WITH (ROWLOCK READPAST) ON i.uidInstanceID = q.uidInstanceID ''
		
		set @ANDFactor = 8 --lets get rid of this 4
	END
	else if ( (@nReferenceType & 8) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 8, ' + '''''' + @ApplicationName + '''''' + ', q.uidInstanceID, q.uidServiceID, q.uidClassID, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime, i.dtSuspendTimeStamp, i.nErrorCategory, i.nvcErrorID, i.nvcErrorDescription, i.nvcErrorProcessingServer FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Instances as i WITH (ROWLOCK READPAST) ON i.uidInstanceID = q.uidInstanceID ''

		set @ANDFactor = 0 --lets get rid of this 8
	END
	else
	BEGIN
		return
	END

	if ( (@snStatus IS NOT NULL) AND (@snStatus <> 63) ) -- 63 is all statuses
		exec MBOM_AppendClauseToQueryString @snStatus, 8 /*bitwiseAND*/, N''i.nState'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	
	set @tsql = @tsql + ''LEFT JOIN InstancesPendingOperations as ipo  WITH (READPAST) ON i.uidInstanceID = ipo.uidInstanceID ''

	set @fFirstClause = 1 --reset this after the join clauses
	
	if ( ((@nReferenceType & 1) > 0) OR ((@nReferenceType & 2) > 0) OR ((@nReferenceType & 12) = 12) )
	BEGIN
		set @fFirstClause = @fFirstClause --this is a noop
	END 
	else if ((@nReferenceType & 4) > 0)
	BEGIN
		exec MBOM_AppendClauseToQueryString 1, 6, N''q.nIsResumable'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	else if ( (@nReferenceType & 8) > 0)
	BEGIN
		exec MBOM_AppendClauseToQueryString 0, 1, N''q.nIsResumable'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	IF ( (@uidServiceClass IS NOT NULL) )
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidServiceClass, @Equals, N''q.uidClassID'', @OR, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	
	if (@uidServiceType IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidServiceType, @Equals, N''q.uidServiceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	if (@uidMessageId IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidMessageId, @Equals, N''q.uidMessageID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	

	exec (@tsql)
	
	set @nReferenceType = @nReferenceType & @ANDFactor
	goto STARTLOOP

')


exec (' CREATE PROCEDURE [dbo].[MBOM_LookupMessageReferences_' + @ApplicationName + ']
(
	@nServiceClass int,
	@uidServiceType uniqueidentifier,
	@uidInstanceId uniqueidentifier,
	@uidMessageId uniqueidentifier,
	@nReferenceType int,
	@snStatus smallint,
	@dtFrom datetime,
	@dtUntil datetime,
	@nMaxMatches int
)
AS
	SET NOCOUNT ON

	if (@nMaxMatches > 0)
		set ROWCOUNT @nMaxMatches
		
	declare @tsql nvarchar(4000)

	if (@uidInstanceId IS NOT NULL)
		set ROWCOUNT 1
	else if (@nMaxMatches > 0)
		set ROWCOUNT @nMaxMatches

		
	declare @fFirstClause int,
		@AND nchar(4),
		@OR nchar(3),
		@Equals int,
		@ANDFactor int


	set @AND = N''AND''
	set @OR = N''OR''
	set @Equals = 1

STARTLOOP:
	
	set @tsql = ''''

	--retry count makes me type all of this out		

	if ((@nReferenceType & 1) > 0)
	BEGIN
		set @tsql = N''select 1, ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidInstanceID, q.uidServiceID, q.uidClassID, q.uidPortID, q.nRetryCount, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		
		set @ANDFactor = 14 --lets get rid of this 1
	END
	else if ((@nReferenceType & 2) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 2, ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidInstanceID, q.uidServiceID, i.uidClassID, q.uidPortID, 0, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime FROM ' + @StateQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''

		set @ANDFactor = 12 --lets get rid of this 2
	END
	else if ((@nReferenceType & 12) = 12) --if both suspended settings are set, we can optimize. :)
	BEGIN
		set @tsql = @tsql + N''select CASE q.nIsResumable WHEN 1 THEN 4 WHEN 0 THEN 8 END , ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidInstanceID, q.uidServiceID, q.uidClassID, q.uidPortID, q.nRetryCount, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		
		set @ANDFactor = 0 --we are done
	END
	else if ((@nReferenceType & 4) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 4, ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidInstanceID, q.uidServiceID, q.uidClassID, q.uidPortID, q.nRetryCount, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		
		set @ANDFactor = 8 --lets get rid of this 4
	END
	else if ( (@nReferenceType & 8) > 0)
	BEGIN
		
		set @tsql = @tsql + N''select 8, ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidInstanceID, q.uidServiceID, q.uidClassID, q.uidPortID, q.nRetryCount, i.dtCreated, i.nState, i.nvcUserState, ipo.nPendingOperation, ipo.dtPendingOperationSubmitTime FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		
		set @ANDFactor = 0 --lets get rid of this 8
	END
	else
	BEGIN
		return
	END

	
	set @fFirstClause = 0 --we dont want where clauses in our join statements

	--values are passed in backwards so for now we reverse the operators
	if (@dtFrom IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @dtFrom, 7 /*greaterthanorequals*/, N''s.dtTimeStamp'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	if (@dtUntil IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @dtUntil, 6 /*lessthanorequals*/, N''s.dtTimeStamp'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END


	set @tsql = @tsql + ''JOIN Instances i WITH (ROWLOCK READPAST) ON i.uidInstanceID = q.uidInstanceID ''
	if ( (@snStatus IS NOT NULL) AND (@snStatus <> 63) ) -- 63 is all states so we can skip this
		exec MBOM_AppendClauseToQueryString @snStatus, 8 /*bitwiseAND*/, N''i.nState'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	
	set @tsql = @tsql + ''LEFT JOIN InstancesPendingOperations as ipo  WITH (READPAST) ON i.uidInstanceID = ipo.uidInstanceID ''

	set @fFirstClause = 1 --reset this after the join clauses
	
	if ( ((@nReferenceType & 1) > 0) OR ((@nReferenceType & 2) > 0) OR ((@nReferenceType & 12) = 12) )
	BEGIN
		set @fFirstClause = @fFirstClause --this is a noop
	END 
	else if ((@nReferenceType & 4) > 0)
	BEGIN
		exec MBOM_AppendClauseToQueryString 1, 6, N''q.nIsResumable'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	else if ( (@nReferenceType & 8) > 0)
	BEGIN
		exec MBOM_AppendClauseToQueryString 0, 1, N''q.nIsResumable'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	
	if (@uidServiceType IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidServiceType, @Equals, N''q.uidServiceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	if (@uidMessageId IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidMessageId, @Equals, N''q.uidMessageID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	if (@uidInstanceId IS NOT NULL)
	BEGIN
		exec MBOM_AppendClauseToQueryString @uidInstanceId, @Equals, N''q.uidInstanceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END

	IF ( (@nServiceClass IS NOT NULL) AND (@nServiceClass <> 63) ) --63 is all classes so we can skip this
	BEGIN
		declare @uidClassID uniqueidentifier,
			@fFirstClass int
				
		set @fFirstClass = 3

		IF (@fFirstClause =0)
			set @tsql = @tsql + ''AND ''
		else
			set @tsql = @tsql + ''WHERE ''

		set @tsql = @tsql + ''( '' --group all of these since we will need an or statement for this

		IF ( (@nServiceClass & 1) = 1)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 1 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 2) = 2)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 2 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass &4) = 4)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 4 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 8) = 8)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 8 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 16) = 16)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 32) = 32)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 32 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 64) = 64)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 64 )
			exec MBOM_AppendClauseToQueryString @uidClassID, @Equals, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + '') ''
		set @fFirstClause = 0

	END

	set @tsql = @tsql + ''ORDER BY s.dtTimeStamp''
	
	exec (@tsql)

	set @nReferenceType = @nReferenceType & @ANDFactor
	goto STARTLOOP

	
')

exec ('CREATE PROCEDURE [dbo].[int_AcquireRestartMessageReference_' + @ApplicationName +']
@uidInstanceID uniqueidentifier,
@retCode int OUTPUT

AS

set nocount on
set transaction isolation level read committed

declare @uidClassID uniqueidentifier,
		@uidServiceID uniqueidentifier,
		@nState int,
		@uidProcessID uniqueidentifier

set @retCode = 0

BEGIN TRANSACTION

SELECT @uidClassID = uidClassID, @uidServiceID = uidServiceID, @nState = nState, @uidProcessID = uidProcessID FROM Instances WITH (ROWLOCK) WHERE uidInstanceID = @uidInstanceID AND uidAppOwnerID = N''' + @uidAppID + ''' OPTION (KEEPFIXED PLAN)
if (@@ROWCOUNT = 0)
BEGIN
	set @retCode = 61
	return
END

if (@nState <> 4 AND @nState <> 16 AND @nState <> 32)
-- Put a Restart Message into the queue belonging to this instance: 
BEGIN 
	INSERT INTO ' + @QueueName + ' WITH (ROWLOCK) (uidMessageID, snPriority, uidClassID, dtStartWindow, dtEndWindow, dtValid, uidServiceID, uidInstanceID, snPartRetrieval, uidProcessID)
	VALUES (N''61EAA7FC-AC85-42d9-BF3E-1BED258B82BE'', 5, @uidClassID, 0, 0, 0, @uidServiceID, @uidInstanceID, 0, @uidProcessID)

	--Ref-counting logic to count the Restart Msg. Use the global log for control messages
	exec int_RefCountMessage N''61EAA7FC-AC85-42d9-BF3E-1BED258B82BE'', 3, 1
END	

COMMIT TRANSACTION

')

-- OpsOM start

exec (' CREATE PROCEDURE [dbo].[ops_LoadMessageReferencesPerHost_' + @ApplicationName + ']
(

@fMultiMessagebox tinyint,  
@uidInstanceID uniqueidentifier,
@uidMessageID uniqueidentifier,
@uidReferenceID uniqueidentifier,

@nvcHost nvarchar(128),
@snHostOperator smallint, --Only support equals and unused operator for hostOperator.
@nServiceClass int,
@snServiceClassOperator smallint,
@uidServiceType uniqueidentifier,
@snServiceTypeOperator smallint,
@nInstanceStatus int,
@snInstanceStatusOperator smallint,

@dtStartFrom datetime,
@dtStartUntil datetime,
@nvcErrorCode nvarchar(512),
@snErrorCodeOperator smallint,
@nvcErrorDescription nvarchar(1024),
@snErrorDescriptionOperator smallint,

@nMessageStatus int,
@snMessageStatusOperator smallint, 
@nvcMessageType nvarchar(256), 
@snMessageTypeOperator smallint,
@nvcURI nvarchar(512),
@snURIOperator smallint,
@nvcAdapter nvarchar(512),
@snAdapterOperator smallint,

@nMaxMatches int,
@nMessageCount int OUTPUT

)

AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low


	declare @tsql nvarchar(4000)
		
	IF (@nMaxMatches > 0)
		set ROWCOUNT @nMaxMatches
		
	declare @fFirstClause int,
		@AND nchar(4),
		@OR nchar(3),		
		@ANDFactor int,
		@dtNow datetime

	declare @params nvarchar(256)	
	set @params = N''@ErrorCode nvarchar(512), @ErrorDescription nvarchar(1024), @MessageType nvarchar(256), @URI nvarchar(512), @Adapter nvarchar(512)''

	set @AND = N''AND''
	set @OR = N''OR''
	set @dtNow = GetUTCDate()

STARTLOOP:
	
	set @tsql = N''''

	-- retry count necessitates typing all of this out

	-- QueuedAll - all messages in the WorkQ which is the union of the in process and undelivered all categories
	if ((@nMessageStatus & 113) = 113)
	BEGIN
		--WorkQ. All
		set @tsql = N''select CASE WHEN (q.uidProcessID IS NULL AND q.nRetryCount > 0) THEN 32 WHEN (q.uidProcessID IS NULL AND (q.dtStartWindow <> q.dtEndWindow)) THEN 64 WHEN (q.uidProcessID IS NULL) THEN 16 ELSE 1 END, ' + '''''' + @ApplicationName + '''''' + N', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		
		set @ANDFactor = 14 --lets get rid of this 1, 16, 32 and 64. active is an umbrella case which covers these other cases.
	END
	-- Work Q and in-process, ie messages which do not fit into the UndeliveredAll category
	else if ((@nMessageStatus & 1) > 0)
	BEGIN
		--WorkQ. Active aka in-process
		set @tsql = N''select 1, ' + '''''' + @ApplicationName + '''''' + N', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID AND q.uidProcessID IS NOT NULL ''
		
		set @ANDFactor = 126 
	END
	else if ((@nMessageStatus & 2) > 0)
	BEGIN  
		-- StateQ
		set @tsql = @tsql + N''select 2, ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, i.uidClassID, i.nState, 0 /*Retry count*/, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, NULL FROM ' + @StateQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''

		set @ANDFactor = 124 --lets get rid of this 2
	END
	else if ((@nMessageStatus & 12) = 12) --if both suspended settings are set, we can optimize. :)
	BEGIN
		--Suspended Q. Resumable and non-resumable.
		set @tsql = @tsql + N''select CASE q.nIsResumable WHEN 1 THEN 4 WHEN 0 THEN 8 END , ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		
		set @ANDFactor = 112
	END
	else if ((@nMessageStatus & 4) > 0)
	BEGIN
		--SuspendedQ. Resumable msg refs.
		set @tsql = @tsql + N''select 4, ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		
		set @ANDFactor = 120 --lets get rid of this 4
	END
	else if ( (@nMessageStatus & 8) > 0)
	BEGIN
		--SuspendedQ. Non-resumable msg refs.	
		set @tsql = @tsql + N''select 8, ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
		
		set @ANDFactor = 112 --lets get rid of this 8
	END
	-- UndeliveredAll
	else if ((@nMessageStatus & 112) = 112)
	BEGIN
		--WorkQ. UndeliveredAll ie no process id. 
		set @tsql = N''select CASE WHEN (q.nRetryCount > 0) THEN 32 WHEN (q.dtStartWindow <> q.dtEndWindow) THEN 64 ELSE 16 END, ' + '''''' + @ApplicationName + '''''' + N', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID AND q.uidProcessID IS NULL ''

		
		set @ANDFactor = 0 --lets get rid of this 112. we are done since undelivered is an umbrella case which covers the retry and scheduled cases.
	END
	-- Undelivered
	else if ((@nMessageStatus & 16) > 0)
	BEGIN
		--WorkQ. Undelivered (but not retry and not scheduled) ie no process id and retry count is not set and startTime and endTime are equal
		set @tsql = N''select 16, ' + '''''' + @ApplicationName + '''''' + N', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID AND q.uidProcessID IS NULL AND q.nRetryCount <= 0 AND (q.dtStartWindow = q.dtEndWindow) ''
		
		set @ANDFactor = 96 --lets get rid of this 16
	END
	else if ((@nMessageStatus & 32) > 0)
	BEGIN
		--WorkQ. RetryUndelivered ie no batch id and retry count is set
		set @tsql = N''select 32, ' + '''''' + @ApplicationName + '''''' + N', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID AND q.uidProcessID IS NULL AND q.nRetryCount > 0 ''
		
		set @ANDFactor = 64 --lets get rid of this 32
	END
	else if ((@nMessageStatus & 64) > 0)
	BEGIN
		--WorkQ. Scheduled ie no batch id and startTime and endTime are not equal
		set @tsql = N''select 64, ' + '''''' + @ApplicationName + '''''' + N', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @QueueName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID AND q.uidProcessID IS NULL AND (q.dtStartWindow <> q.dtEndWindow) ''
		
		set @ANDFactor = 0 --lets get rid of this 64. we are done.
	END
	else 	
	BEGIN
		RETURN
	END	

	set @fFirstClause = 0 --we dont want where clauses in our join statements

	--for the message creation time only use the start from if it is later than "0"
	if (@dtStartFrom > 0)
		exec ops_AppendClauseToQueryString @dtStartFrom, 6 /*greaterthanorequals*/, N''s.dtTimeStamp'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	if (@dtStartUntil < @dtNow)
		exec ops_AppendClauseToQueryString @dtStartUntil, 7 /*lessthanorequals*/, N''s.dtTimeStamp'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	set @tsql = @tsql + ''JOIN Instances i WITH (ROWLOCK READPAST) ON i.uidInstanceID = q.uidInstanceID ''

	IF ((@snInstanceStatusOperator = 1) OR (@snInstanceStatusOperator = 8))  /* Equals or BitwiseAND */
	BEGIN
		declare @fFirstState int
				
		set @fFirstState = 1
		set @snInstanceStatusOperator = 8

		IF (@fFirstClause = 0)
		BEGIN
			set @tsql = @tsql + N'' AND ''
		END
		-- Do not set where clause here as this is part of join clause		

		-- grouping these for OR stmt
		set @tsql = @tsql + N''( ''

		-- Not including completed state

		IF ((@nInstanceStatus & 1) = 1)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 1, @snInstanceStatusOperator /*bitwiseAND*/, N''i.nState'', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nInstanceStatus & 2) = 2)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 2, @snInstanceStatusOperator /*bitwiseAND*/, N''i.nState'', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		-- Include suspended resumable since loading messages. Will look at the Instances not InstancesSuspended table

		IF ((@nInstanceStatus & 4) = 4)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 4, @snInstanceStatusOperator /*bitwiseAND*/, N''i.nState'', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nInstanceStatus & 8) = 8)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 8, @snInstanceStatusOperator /*bitwiseAND*/, N''i.nState'', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		-- Not including zombies
		-- Include suspended non-resumable since loading messages. Will look at the Instances not InstancesSuspended 			-- table

		IF ((@nInstanceStatus & 32) = 32)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 32, @snInstanceStatusOperator /*bitwiseAND*/, N''i.nState'', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nInstanceStatus & 64) = 64)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 64, @snInstanceStatusOperator /*bitwiseAND*/, N''i.nState'', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nInstanceStatus & 128) = 128)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 128, @snInstanceStatusOperator /*bitwiseAND*/, N''i.nState'', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		IF ((@nInstanceStatus & 256) = 256)
		BEGIN
			exec ops_AppendEnumClauseToQueryString 256, @snInstanceStatusOperator /*bitwiseAND*/, N''i.nState'', @OR, @fFirstState OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + N'') ''		
	END

	set @tsql = @tsql + ''LEFT JOIN InstancesSuspended ist WITH (ROWLOCK READPAST) ON i.uidInstanceID = ist.uidInstanceID ''

	set @fFirstClause = 1 --reset this after the join clauses
		
	if ( ((@nMessageStatus & 4) > 0) AND ((@nMessageStatus & 12) <> 12) )
	BEGIN
		exec ops_AppendClauseToQueryString 1, 6, N''q.nIsResumable'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	else if ( ((@nMessageStatus & 8) > 0) AND ((@nMessageStatus & 12) <> 12) )
	BEGIN
		exec ops_AppendClauseToQueryString 0, 1, N''q.nIsResumable'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	END
	
	IF (@uidServiceType <> N''{00000000-0000-0000-0000-000000000000}'')
		exec ops_AppendClauseToQueryString @uidServiceType, @snServiceTypeOperator, N''q.uidServiceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	IF (@uidMessageID <> N''{00000000-0000-0000-0000-000000000000}'')
		exec ops_AppendClauseToQueryString @uidMessageID, 1 /*Equals*/, N''q.uidMessageID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	IF (@uidReferenceID <> N''{00000000-0000-0000-0000-000000000000}'')
		exec ops_AppendClauseToQueryString @uidReferenceID, 1 /*Equals*/, N''q.uidWorkID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	IF (@uidInstanceID <> N''{00000000-0000-0000-0000-000000000000}'')
		exec ops_AppendClauseToQueryString @uidInstanceID, 1/*Equals*/, N''q.uidInstanceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT		
	 
	IF ( (@nServiceClass <> 127) AND (@snServiceClassOperator <> 0) )	
	BEGIN
		declare @uidClassID uniqueidentifier,
			@fFirstClass int
				
		set @fFirstClass = 1

		IF (@fFirstClause =0)
		BEGIN
			set @tsql = @tsql + '' AND ''
		END
		ELSE 
		BEGIN
			set @tsql = @tsql + '' WHERE ''
			set @fFirstClause = 0
		END

		set @tsql = @tsql + ''( '' --group all of these since we will need an or statement for this

		IF ( @nServiceClass = 111 ) -- special case, it is the default which excludes the caching service.
		BEGIN
			--@snServiceClassOperator = 2 -- not equal
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, 2 /* NotEquals */, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
			set @nServiceClass = 0 -- none of the other conditions should evaluate after this one
		END

		IF ( (@nServiceClass & 1) = 1)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 1 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 2) = 2)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 2 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 4) = 4)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 4 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 8) = 8)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 8 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 16) = 16)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 32) = 32)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 32 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END
		IF ( (@nServiceClass & 64) = 64)
		BEGIN
			set @uidClassID =  [dbo].[MBOM_fnGetServiceClassID]( 64 )
			exec ops_AppendEnumClauseToQueryString @uidClassID, @snServiceClassOperator, N''i.uidClassID'', @OR, @fFirstClass OUTPUT, @tsql OUTPUT
		END

		set @tsql = @tsql + '') '' 
	END
	ELSE
	BEGIN
		-- special case to exclude the caching service, regardless of whether or not the user is filtering
		-- on the service class
		declare @uidCachingClassID uniqueidentifier
		
		set @uidCachingClassID =  [dbo].[MBOM_fnGetServiceClassID]( 16 )
		exec ops_AppendClauseToQueryString @uidCachingClassID, 2 /* NotEquals */, N''i.uidClassID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT		
	END 

	exec ops_AppendClauseToQueryString N''@ErrorCode'', @snErrorCodeOperator, N''i.nvcErrorID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	exec ops_AppendClauseToQueryString N''@ErrorDescription'', @snErrorDescriptionOperator, N''i.nvcErrorDescription'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	exec ops_AppendClauseToQueryString N''@MessageType'', @snMessageTypeOperator, N''s.nvcMessageType'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT	
	exec ops_AppendClauseToQueryString N''@URI'', @snURIOperator, N''ist.nvcURI'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT 
	exec ops_AppendClauseToQueryString N''@Adapter'', @snAdapterOperator, N''ist.nvcAdapter'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT 

	--ordering required here since only maxMatches rows are selected. Ordered in the temp table in the ops_LoadMessages fn may not be required
	set @tsql = @tsql + '' ORDER BY s.dtTimeStamp DESC''
			
	exec sp_executesql @tsql, @params, @ErrorCode = @nvcErrorCode, @ErrorDescription = @nvcErrorDescription, @MessageType = @nvcMessageType, @URI = @nvcURI, @Adapter = @nvcAdapter

	set @nMessageStatus = @nMessageStatus & @ANDFactor
	goto STARTLOOP

')


exec (' CREATE PROCEDURE [dbo].[ops_LoadPrimaryFailedMessagePerHost_' + @ApplicationName + ']
( 
@uidInstanceID uniqueidentifier 
)

AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

declare @tsql nvarchar(4000),
	@fFirstClause int,
	@AND nchar(4)

	set @tsql = N''''
	set @fFirstClause = 1
	set @AND = N''AND''

	set @tsql = @tsql + N''select TOP 1 4, ' + '''''' + @ApplicationName + '''''' + ', q.uidMessageID, q.uidWorkID, q.uidInstanceID, q.uidServiceID, q.uidClassID, i.nState, q.nRetryCount, i.nvcErrorID, i.nvcErrorDescription, s.nvcMessageType, i.nvcUserState, ist.nvcAdapter, ist.nvcURI, q.uidPortID, q.fOrderedDelivery FROM ' + @SuspendedQName + ' as q WITH (ROWLOCK READPAST) JOIN Spool s WITH (ROWLOCK READPAST) ON s.uidMessageID = q.uidMessageID ''
	set @tsql = @tsql + N''JOIN Instances i WITH (ROWLOCK READPAST) ON i.uidInstanceID = q.uidInstanceID ''
	set @tsql = @tsql + N''LEFT JOIN InstancesSuspended ist WITH (ROWLOCK READPAST) ON i.uidInstanceID = ist.uidInstanceID ''

	exec ops_AppendClauseToQueryString 1, 6, N''q.nIsResumable'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	exec ops_AppendClauseToQueryString @uidInstanceID, 1, N''q.uidInstanceID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT

	set @tsql = @tsql + N'' ORDER BY q.nID''

	exec (@tsql)

')

exec ('CREATE PROCEDURE [dbo].[ops_LoadMessageStatisticsPerHost_' + @ApplicationName + ']

AS

set nocount on
set transaction isolation level read committed
set deadlock_priority low

	declare @tsql nvarchar(4000),
		@uidMSMQTClassID uniqueidentifier,
		@fFirstClause int,
		@AND nchar(4)
	
	set @uidMSMQTClassID = [dbo].[MBOM_fnGetServiceClassID]( 8 )
	set @fFirstClause = 1
	set @AND = N''AND''

	set @tsql = N''''

	set @tsql = N''SELECT sq.nIsResumable, count(*) FROM ' + @SuspendedQName + ' AS sq WITH (ROWLOCK READPAST) ''
	exec ops_AppendClauseToQueryString @uidMSMQTClassID, 1 /* Equals */, N''sq.uidClassID'', @AND, @fFirstClause OUTPUT, @tsql OUTPUT
	set @tsql = @tsql + N'' GROUP BY sq.nIsResumable ''

	exec (@tsql)

')

-- OpsOM end

-- MsgBoxPerfCounters start

exec ('CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetHostQueueLength_' + @ApplicationName + ']

AS

set nocount on
set transaction isolation level read committed

SELECT count(*) FROM ' + @QueueName + ' WITH (NOLOCK)

')

exec ('CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetHostQueueSuspendedLength_' + @ApplicationName + '] 
AS

set nocount on
set transaction isolation level read committed

SELECT count(*) FROM ' + @SuspendedQName + 'WITH (NOLOCK)

')

exec ('CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetStateQueueLength_' + @ApplicationName + '] 
AS

set nocount on
set transaction isolation level read committed

SELECT count(*) FROM ' + @StateQName + ' WITH (NOLOCK)

')


exec ('CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetHostInstancesNumber_' + @ApplicationName + '] 
AS

set nocount on
set transaction isolation level read committed

SELECT count(*) 
FROM Instances WITH (NOLOCK) 
WHERE uidAppOwnerID = ( SELECT uidAppID 
FROM Applications WITH (NOLOCK) 
WHERE nvcApplicationName = ''' + @ApplicationName + ''')

')

GO
GRANT EXEC ON [dbo].[int_AddApplicationSprocs] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[int_RemoveApplicationSprocs]
@AppName nvarchar(128)
AS

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_CreateSubscription_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_CreateSubscription_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_CreateNamedPredicateGroup_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_CreateNamedPredicateGroup_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_InsertPredicate_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_InsertPredicate_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_LockInstance_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_LockInstance_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_LockInstanceByID_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_LockInstanceByID_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_GetInstanceLock_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_GetInstanceLock_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_ReadPartData_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_ReadPartData_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_ReadMessagePart_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_ReadMessagePart_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_InsertDynamicStateInfo_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_InsertDynamicStateInfo_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_GetDynamicStateInfo_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_GetDynamicStateInfo_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_AlterSubscription_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_AlterSubscription_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_AlterMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_AlterMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_AlterInstance_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_AlterInstance_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_InsertIntoQueue_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_InsertIntoQueue_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_InsertInstanceInfo_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_InsertInstanceInfo_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_UpdateMsgbox_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_UpdateMsgbox_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_UpdateMessagesRefcount_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_UpdateMessagesRefcount_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_ManageScheduledQ_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_ManageScheduledQ_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_RemoveScheduledItems_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_RemoveScheduledItems_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_DeQueueMessages_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_DeQueueMessages_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_ProcessCleanup_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_ProcessCleanup_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_ProcessHeartbeat_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_ProcessHeartbeat_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_ReadInstanceStateMessages_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_ReadInstanceStateMessages_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_ReadInstanceStateMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_ReadInstanceStateMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_GetConstructedMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_GetConstructedMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AddFragmentForMessageConstruction_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AddFragmentForMessageConstruction_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_InsertDebugMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_InsertDebugMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_InsertMessageDirect_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_InsertMessageDirect_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_ReadSpecificMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_ReadSpecificMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminAddServiceInstances_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminAddServiceInstances_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminAddMessageInstances_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminAddMessageInstances_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminQueryWorkQInstances_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminQueryWorkQInstances_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminQuerySuspendedQInstances_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminQuerySuspendedQInstances_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminQueryWorkQMessages_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminQueryWorkQMessages_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminQuerySuspendedQMessages_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminQuerySuspendedQMessages_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminDeleteSuspendedMessageRef_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminDeleteSuspendedMessageRef_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_RefCountMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_RefCountMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_TrackMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_TrackMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_InsertSuspendControlMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_InsertSuspendControlMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_InsertTerminateControlMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_InsertTerminateControlMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_InsertResumeInDebugModeControlMessage_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_InsertResumeInDebugModeControlMessage_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminOperatorsStartAndStopService_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminOperatorsStartAndStopService_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminOperatorsPreemptAndGetInstances_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminOperatorsPreemptAndGetInstances_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminPreemptAndGetInstances_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminPreemptAndGetInstances_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminPreemptiveOperateOnInstances_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminPreemptiveOperateOnInstances_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_AdminResumeInstance_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_AdminResumeInstance_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_AdminSuspendInstance_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_AdminSuspendInstance_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_AdminTerminateInstance_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_AdminTerminateInstance_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_AdminCompleteTerminate_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_AdminCompleteTerminate_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_BRMAExecWorkQQuery_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_BRMAExecWorkQQuery_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_Read_' + @AppName + 'Q]'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_Read_' + @AppName + 'Q]') 

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[bts_Read_' + @AppName + '_SuspendedQ]'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[bts_Read_' + @AppName + '_SuspendedQ]')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[MBOM_LookupMessages_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[MBOM_LookupMessages_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[MBOM_LookupReferencingInstances_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[MBOM_LookupReferencingInstances_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[MBOM_LookupReferencingMessages_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[MBOM_LookupReferencingMessages_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[MBOM_LookupMessageReferences_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[MBOM_LookupMessageReferences_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[int_AcquireRestartMessageReference_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[int_AcquireRestartMessageReference_' + @AppName + ']')

--For OpsOM
exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[ops_LoadMessageReferencesPerHost_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[ops_LoadMessageReferencesPerHost_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[ops_LoadMessageStatisticsPerHost_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[ops_LoadMessageStatisticsPerHost_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[ops_LoadPrimaryFailedMessagePerHost_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[ops_LoadPrimaryFailedMessagePerHost_' + @AppName + ']')

--For MsgBoxPerfCounters
exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[MsgBoxPerfCounters_GetHostQueueLength_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetHostQueueLength_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[MsgBoxPerfCounters_GetHostQueueSuspendedLength_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetHostQueueSuspendedLength_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[MsgBoxPerfCounters_GetStateQueueLength_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetStateQueueLength_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[MsgBoxPerfCounters_GetHostInstancesNumber_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetHostInstancesNumber_' + @AppName + ']')

GO
GRANT EXEC ON [dbo].[int_RemoveApplicationSprocs] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_DisablePageLocksOnApplicationTables]
@ApplicationName nvarchar(80)
AS


set nocount on
set transaction isolation level read committed

--we need this sproc because you cannot disable page locks within a transaction so we do this after the host has been created
if exists (SELECT TOP 1 uidAppID FROM Applications WHERE nvcApplicationName = @ApplicationName)
BEGIN

	exec('EXEC sp_indexoption N''[dbo].[' + @ApplicationName + 'Q]'', ''disallowpagelocks'', TRUE ')
	exec('EXEC sp_indexoption N''[dbo].[' + @ApplicationName + '_DequeueBatches]'', ''disallowpagelocks'', TRUE ')
	exec('EXEC sp_indexoption N''[dbo].[' + @ApplicationName + '_MessageRefCountLog]'', ''disallowpagelocks'', TRUE ')
	exec('EXEC sp_indexoption N''[dbo].[' + @ApplicationName + 'Q_Scheduled]'', ''disallowpagelocks'', TRUE ')
	exec('EXEC sp_indexoption N''[dbo].[' + @ApplicationName + 'Q_Suspended]'', ''disallowpagelocks'', TRUE ')
	exec('EXEC sp_indexoption N''[dbo].[DynamicStateInfo_' + @ApplicationName + ']'', ''disallowpagelocks'', TRUE ')
	exec('EXEC sp_indexoption N''[dbo].[InstanceStateMessageReferences_' + @ApplicationName + ']'', ''disallowpagelocks'', TRUE ')
END
GO
GRANT EXEC ON [dbo].[bts_DisablePageLocksOnApplicationTables] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_AddApplication]
@ApplicationName nvarchar(80),
@ApplicationAccount nvarchar(128),
@HostTracking int
AS


set nocount on
set transaction isolation level read committed

--Create the Queue
declare @exists int
declare @QueueName nvarchar(129)
declare @SuspendedQName nvarchar(156)
declare @ScheduledQName nvarchar(156)
declare @uidAppID uniqueidentifier

set @SuspendedQName = @ApplicationName + 'Q_Suspended'
set @ScheduledQName = @ApplicationName + 'Q_Scheduled'
set @QueueName = @ApplicationName + 'Q'

SELECT @exists = COUNT(*) FROM Applications WHERE nvcApplicationName = @ApplicationName
if (@exists > 0)
	return --Maybe we should fail but for now we won't

--check for invalid HOST names. we do not support HOST, ADMIN, or BACKUP since this will conflit with role names
if ( (UPPER(@ApplicationName) = N'HOST') OR (UPPER(@ApplicationName) = N'ADMIN') OR (UPPER(@ApplicationName) = N'BACKUP') )
	return 0xC0c02837 -- CIS_E_ADMIN_RESERVED_HOST_NAME

-- If the user don't have sufficient permission to create tables/sprocs, then throw an error and return immediately
if ( dbo.adm_HasPermissionToPerform('DDLTasks') = 0 )
	return 0xC0C025FA -- CIS_E_ADMIN_DDL_OPS_INSUFFICIENT_PRIV

set @uidAppID = NewID()
INSERT INTO Applications VALUES (@ApplicationName, @uidAppID)

exec( 'CREATE TABLE [dbo].[' + @QueueName + '] (
		[nID] [bigint] IDENTITY(0,1),
		[uidWorkID] [uniqueidentifier] NOT NULL DEFAULT (NewID()),
		[uidMessageID] [uniqueidentifier] NOT NULL ,
		[uidSubscriptionID] [uniqueidentifier] NULL ,
		[dtLastTouched] [datetime] NOT NULL DEFAULT (GetUTCDate()),
		[snPriority] [smallint] NOT NULL,
		[uidClassID] [uniqueidentifier] NULL ,
		[dtStartWindow] [datetime] NOT NULL ,
		[dtEndWindow] [datetime] NOT NULL ,
		[dtValid] [datetime] NOT NULL ,
		[uidServiceID] [uniqueidentifier] NULL ,
		[uidInstanceID] [uniqueidentifier] NULL DEFAULT (NewID()),
		[uidAppInstanceID] [uniqueidentifier] NULL ,
		[uidPortID] [uniqueidentifier] NULL ,
		[snPartRetrieval] [smallint] NOT NULL,
		[fOrderedDelivery] [int] NOT NULL DEFAULT (0),
		[nRetryCount] [int] NOT NULL DEFAULT (0),
		[nReserved] [int] NOT NULL DEFAULT (1),
		[uidProcessID] [uniqueidentifier] NULL ,
		[uidActivationID] [uniqueidentifier] NULL ,
		[fFirstMessage] [int] NULL DEFAULT (0),
		[fOptimize] [smallint] NOT NULL DEFAULT (1),
	) ')

exec('CREATE  UNIQUE  INDEX [CIX_' + @ApplicationName + 'Q] ON [dbo].[' + @ApplicationName + 'Q]([uidInstanceID], [uidWorkID], [uidMessageID]) ')

exec('CREATE  UNIQUE  CLUSTERED INDEX [IX_' + @ApplicationName + 'Q] ON [dbo].[' + @ApplicationName + 'Q]([uidClassID], [fOrderedDelivery], [snPriority], [dtLastTouched], [nID])')

-- Disable page locks. Can't do this in a transaction though
--exec('EXEC sp_indexoption ''[dbo].[' + @QueueName + ']'', ''disallowpagelocks'', TRUE ')


--we are going to create a table used by dequeue to store the list of messages which are being dequeued by a given batch. This eliminates an index for us
exec('CREATE TABLE [dbo].[' + @ApplicationName + '_DequeueBatches] (
	[uidBatchID] [uniqueidentifier] NOT NULL ,
	[uidClassID] [uniqueidentifier] NOT NULL ,
	[fOrderedDelivery] [int] NOT NULL,
	[snPriority] [smallint] NOT NULL,
	[dtLastTouched] [datetime] NOT NULL,
	[nID] [bigint]
      )')

exec('CREATE UNIQUE CLUSTERED  INDEX [CIX_' + @ApplicationName + '_DequeueBatches] ON [dbo].[' + @ApplicationName + '_DequeueBatches]([uidBatchID], [nID]) ')

-- Disable page locks. Can't do this in a transaction though
-- exec('EXEC sp_indexoption ''[dbo].[' + @ApplicationName + '_DequeueBatches]'', ''disallowpagelocks'', TRUE ')

--we are going to create a table used by dequeue to store the list of messages which are being dequeued by a given batch. This eliminates an index for us
exec('CREATE TABLE [dbo].[' + @ApplicationName + '_MessageRefCountLog] (
	[uidInstanceID] [uniqueidentifier] NOT NULL ,
	[uidMessageID] [uniqueidentifier] NOT NULL ,
	[nRefCount] [int] NOT NULL
      )')

exec('CREATE UNIQUE CLUSTERED  INDEX [CIX_' + @ApplicationName + '_MessageRefCountLog] ON [dbo].[' + @ApplicationName + '_MessageRefCountLog]([uidInstanceID], [uidMessageID]) ')

-- Disable page locks. Can't do this in a transaction though
-- exec('EXEC sp_indexoption ''[dbo].[' + @ApplicationName + '_MessageRefCountLog]'', ''disallowpagelocks'', TRUE ')

exec( 'CREATE TABLE [dbo].[' + @ScheduledQName + '] (
		[uidWorkID] [uniqueidentifier] NOT NULL DEFAULT (NewID()),
		[uidMessageID] [uniqueidentifier] NOT NULL ,
		[uidSubscriptionID] [uniqueidentifier] NULL ,
		[dtLastTouched] [datetime] NOT NULL DEFAULT (GetUTCDate()),
		[snPriority] [smallint] NOT NULL,
		[uidClassID] [uniqueidentifier] NULL ,
		[dtStartWindow] [datetime] NOT NULL ,
		[dtEndWindow] [datetime] NOT NULL ,
		[dtValid] [datetime] NOT NULL ,
		[uidServiceID] [uniqueidentifier] NULL ,
		[uidInstanceID] [uniqueidentifier] NULL DEFAULT (NewID()),
		[uidAppInstanceID] [uniqueidentifier] NULL ,
		[uidPortID] [uniqueidentifier] NULL ,
		[snPartRetrieval] [smallint] NOT NULL,
		[fOrderedDelivery] [int] NOT NULL,
		[nRetryCount] [int] NOT NULL DEFAULT (0),
		[nReserved] [int] NOT NULL DEFAULT (1),
	) ')

exec('CREATE  NONCLUSTERED  INDEX [IX_' + @ScheduledQName + '] ON [dbo].[' + @ScheduledQName + ']([uidInstanceID], [uidWorkID], [uidSubscriptionID], [uidMessageID], [uidClassID], [uidServiceID], [dtStartWindow], [dtEndWindow], [snPartRetrieval], [fOrderedDelivery], [dtValid], [uidPortID]) ')
-- Disable page locks. Can't do this in a transaction though
-- exec('EXEC sp_indexoption ''[dbo].[' + @ScheduledQName + ']'', ''disallowpagelocks'', TRUE ')

--Create the suspendedQ
exec ( 'CREATE TABLE [dbo].[' + @SuspendedQName + '](
	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetUTCDate()),
	[nErrorCategory] [int] NOT NULL DEFAULT (1),
	[nvcErrorID] [nvarchar] (512) NULL DEFAULT (N''0'') ,
	[nIsResumable] [int] NOT NULL DEFAULT (1),
	[nvcAdditionalInfo] [nvarchar] (1024),
	[nvcProcessingServer] [nvarchar] (256) DEFAULT (HOST_NAME()),
	[uidTrackingID] [uniqueidentifier] NULL ,
	[uidWorkID] [uniqueidentifier] NOT NULL DEFAULT (NewID()) ,
	[uidMessageID] [uniqueidentifier] NOT NULL ,
	[uidSubscriptionID] [uniqueidentifier] NULL ,
	[dtLastTouched] [datetime] NOT NULL DEFAULT (GetUTCDate()),
	[snPriority] [smallint] NOT NULL,
	[uidClassID] [uniqueidentifier] NULL ,
	[dtStartWindow] [datetime] NOT NULL ,
	[dtEndWindow] [datetime] NOT NULL ,
	[dtValid] [datetime] NOT NULL ,
	[uidServiceID] [uniqueidentifier] NULL ,
	[uidInstanceID] [uniqueidentifier] NULL DEFAULT (NewID()) ,
	[uidAppInstanceID] [uniqueidentifier] NULL ,
	[uidPortID] [uniqueidentifier] NULL ,
	[snPartRetrieval] [smallint] NOT NULL,
	[fOrderedDelivery] [int] NOT NULL,
	[nvcModuleName] [nvarchar] (256) NULL,
	[nRetryCount] [int] NOT NULL DEFAULT (0),
	[nReserved] [int] NOT NULL DEFAULT (1),
	[imgTrace] [image] NULL ,
	[nID] [bigint] IDENTITY(0,1),
	) ' )


exec('CREATE  CLUSTERED  INDEX [CIX_' + @SuspendedQName + '] ON [dbo].[' + @SuspendedQName + ']([uidSubscriptionID], [nvcErrorID]) ')
exec('CREATE  INDEX [IX_' + @SuspendedQName + '] ON [dbo].[' + @SuspendedQName + ']([uidInstanceID], [uidServiceID], [nIsResumable], [uidSubscriptionID], [uidWorkID]) ')
exec('CREATE  INDEX [IX_' + @SuspendedQName + '_2] ON [dbo].[' + @SuspendedQName + ']([dtLastTouched], [nID]) ')
exec('CREATE  INDEX [IX_' + @SuspendedQName + '_Ops] ON [dbo].[' + @SuspendedQName + ']([uidClassID], [nIsResumable]) ')

-- Disable page locks. Can't do this in a transaction though
-- exec('EXEC sp_indexoption ''[dbo].[' + @SuspendedQName + ']'', ''disallowpagelocks'', TRUE ')

--Create the DynamicStateInfo table
exec ('CREATE TABLE [dbo].[DynamicStateInfo_' + @ApplicationName + '] (
	[uidInstanceStateID][uniqueidentifier] NOT NULL ,
	[uidClassID] [uniqueidentifier] NOT NULL ,
	[uidServiceID] [uniqueidentifier] NOT NULL ,
    	[uidInstanceID] [uniqueidentifier] NOT NULL ,
    	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetUTCDate()),
    	[imgData] [image] NULL ,
    	[uidFragmentedMsgID] [uniqueidentifier] NULL,
    	[uidFragmentedPartID] [uniqueidentifier] NULL
)  ')

exec( 'CREATE CLUSTERED INDEX [IX_DYNAMICSTATEINFO_INSTANCEID' + @ApplicationName + '] ON [dbo].[DynamicStateInfo_' + @ApplicationName + '] (uidInstanceID, uidInstanceStateID) ')
-- Disable page locks. Can't do this in a transaction though
-- exec('EXEC sp_indexoption ''[dbo].[DynamicStateInfo_' + @ApplicationName + ']'', ''disallowpagelocks'', TRUE ')

--Create the InstanceStateMessageReference table
exec ('CREATE TABLE [dbo].[InstanceStateMessageReferences_' + @ApplicationName + '] (
	[uidInstanceID] [uniqueidentifier] NULL ,
	[uidInstanceStateID] [uniqueidentifier] NOT NULL ,
	[uidWorkID] [uniqueidentifier] NOT NULL DEFAULT (NewID()),
	[uidMessageID] [uniqueidentifier] NOT NULL,
	[uidServiceID] [uniqueidentifier] NOT NULL DEFAULT (''{00000000-0000-0000-0000-000000000000}''),
	[uidPortID] [uniqueidentifier] NULL
) ')

exec( 'CREATE CLUSTERED INDEX [IX_STATEMSGREF_INSTANCEID' + @ApplicationName + '] ON [dbo].[InstanceStateMessageReferences_' + @ApplicationName + '] (uidInstanceID, uidInstanceStateID, uidMessageID) ')
-- Disable page locks. Can't do this in a transaction though
-- exec('EXEC sp_indexoption ''[dbo].[InstanceStateMessageReferences_' + @ApplicationName + ']'', ''disallowpagelocks'', TRUE ')

exec int_AddApplicationSprocs @ApplicationName, @uidAppID

-- When this SP is called by Admin, no @ApplicationAccount is being passed in to indicate
-- that creation of the Application role and login will be done at a later stage
if ( @ApplicationAccount <> N'' )
begin
	exec bts_AddApplicationLogin @ApplicationName, @ApplicationAccount, @HostTracking
end

GO
GRANT EXEC ON [dbo].[bts_AddApplication] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_RemoveApplication]
@AppName nvarchar(128)
AS

set nocount on
set transaction isolation level read committed

declare @cnt int,
	@uidInstanceIDVar uniqueidentifier, 
	@uidServiceIDVar uniqueidentifier,
	@nAction int,
	@uidBogusID uniqueidentifier,
	@sprocName nvarchar(200),
	@uidDBOwnerID uniqueidentifier,
	@nReturnCode int

-- If the user doesn't have sufficient permission to drop tables/sprocs, then throw an error and return immediately
if ( dbo.adm_HasPermissionToPerform('DDLTasks') = 0 )
	return 0xC0C025FA -- CIS_E_ADMIN_DDL_OPS_INSUFFICIENT_PRIV
	
--do a quick check to see if there are any non-caching service instances or subscriptions still around
SELECT @cnt = COUNT(*) FROM Instances i, Applications a WHERE a.nvcApplicationName = @AppName AND i.uidAppOwnerID = a.uidAppID AND i.uidClassID <> N'{BB3A1470-F5C4-47C3-B71F-EAABC260FBD0}'
if (@cnt > 0)
	return 0xC0C02822 -- CIS_E_ADMIN_HOST_DELETE_SERVICE_INSTANCE_EXIST

-- Per SP1 bug 88746, there could be legitimately orphaned caching service subscriptions, so exclude these from the check below.
SELECT @cnt = COUNT(*) FROM Subscription s WHERE s.nvcApplicationName = @AppName AND s.uidClassID <> N'{BB3A1470-F5C4-47C3-B71F-EAABC260FBD0}'
if (@cnt > 0)
	return 0xC0C02822 -- CIS_E_ADMIN_HOST_DELETE_SERVICE_INSTANCE_EXIST


-- Remove all caching service instance subscriptions; the call to AlterInstance will remove related subscriptions as well.

set @nAction = 209 --Terminate the caching services instances
set @uidBogusID = N'{00000000-0000-0000-0000-000000000000}'
set @nReturnCode = 0
set @uidDBOwnerID = N'{00000000-0000-0000-0000-000000000000}'


-- Have to set uidProcessID to NULL. This is because this sproc (bts_RemoveApplication_<HostName>) calls the 
-- int_AlterInstance_<HostName> sproc and if the latter sproc is called by Admin when deleting a host (below), APP_NAME() is not set to a guid and
-- the code in the 209 section of the latter sproc will fail since it compares a guid with a nvarchar string. 
UPDATE Instances SET uidProcessID = NULL FROM Instances i, Applications a WITH (ROWLOCK) WHERE a.nvcApplicationName = @AppName AND i.uidAppOwnerID = a.uidAppID

declare curse cursor for
 	SELECT uidInstanceID, uidServiceID from Instances i, Applications a
 	WHERE a.nvcApplicationName = @AppName AND i.uidAppOwnerID = a.uidAppID

-- Only @nAction, @uidInstanceIDvar, @uidServiceIDVar are valid in the int_AlterInstance call. All other values are bogus.
-- This is fine since the terminate option (@nAction = 209) within int_AlterInstance only uses the three valid valued variables.

open curse
FETCH NEXT FROM curse into @uidInstanceIDVar, @uidServiceIDVar

-- Note. Using @sprocName will not lead to SQL injection because if the @AppName parameter is maliciously manipulated then  
-- no valid rows will be selected by the cursor select statement (above).

set @sprocName = N'int_AlterInstance_' + @AppName + N' '

WHILE (@@FETCH_STATUS = 0)
BEGIN
	
 	exec @sprocName @nAction, @uidBogusID, @uidInstanceIDVar, @uidBogusID, @uidBogusID, @uidBogusID, @uidServiceIDVar, N'0', 0, N'0', 0, 0, NULL, NULL, NULL, @uidDBOwnerID OUTPUT, @nReturnCode OUTPUT

 	FETCH NEXT FROM curse INTO @uidInstanceIDVar , @uidServiceIDVar
END
close curse
deallocate curse

--Remove entry from Applications table
DELETE FROM Applications WHERE nvcApplicationName = @AppName

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[' + @AppName + 'Q]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
drop table [dbo].[' + @AppName + 'Q]')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[' + @AppName + '_DequeueBatches]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
drop table [dbo].[' + @AppName + '_DequeueBatches]')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[' + @AppName + '_MessageRefCountLog]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
drop table [dbo].[' + @AppName + '_MessageRefCountLog]')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[' + @AppName + 'Q_Suspended]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
drop table [dbo].[' + @AppName + 'Q_Suspended]')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[' + @AppName + 'Q_Scheduled]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
drop table [dbo].[' + @AppName + 'Q_Scheduled]')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[InstanceStateMessageReferences_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
drop table [dbo].[InstanceStateMessageReferences_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[DynamicStateInfo_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
drop table [dbo].[DynamicStateInfo_' + @AppName + ']')

exec ('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[PROCESS_TABLE_' + @AppName + ']'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
drop table [dbo].[PROCESS_TABLE_' + @AppName + ']')

/* Commenting out this logic until we find a resolution to (non-transactional) SQL role cleanup issue - Bug 19913
--Roles
declare @RoleName nvarchar(300)

--we need to enumerate the users so that we can remove this group
set @RoleName = N'BTS_' + @AppName + '_USERS'

if exists (select * from dbo.sysusers where name = @RoleName and issqlrole = 1)
BEGIN
	exec sp_droprolemember 'BTS_HOST_USERS', @RoleName 
	exec bts_DropRole @RoleName
END
*/

--Stored Procs
exec int_RemoveApplicationSprocs @AppName

GO
GRANT EXEC ON [dbo].[bts_RemoveApplication] TO BTS_ADMIN_USERS
GO



CREATE PROCEDURE [dbo].[bts_ResetApplicationSprocs]
AS

declare @nvcAppName nvarchar(128),
		@uidAppID	uniqueidentifier

declare curse cursor for 
	SELECT nvcApplicationName, uidAppID FROM Applications
open curse
FETCH NEXT FROM curse INTO @nvcAppName, @uidAppID
WHILE (@@FETCH_STATUS = 0)
BEGIN 
	exec ('int_RemoveApplicationSprocs ''' + @nvcAppName + '''')
	exec ('int_AddApplicationSprocs ''' + @nvcAppName + ''', ''' + @uidAppID + '''')
	
	exec bts_CreateApplicationRole @nvcAppName, 0
	
	FETCH NEXT FROM curse INTO @nvcAppName, @uidAppID
END
close curse
deallocate curse
GO

CREATE PROCEDURE [dbo].[bts_AddApplicationProp]
@uidPropID uniqueidentifier,
@vtValue sql_variant,
@nvcAppName nvarchar(128),
@fSuccess int OUTPUT

AS


set transaction isolation level read committed
set nocount on
set deadlock_priority low

BEGIN TRANSACTION

set @fSuccess = 1

declare @uidAppID uniqueidentifier

SELECT @uidAppID = uidAppID FROM Applications WHERE nvcApplicationName = @nvcAppName
if (@@ROWCOUNT = 0)
	set @fSuccess = 0
else
	INSERT INTO ApplicationProps  WITH (ROWLOCK) VALUES (@nvcAppName, @uidPropID, @vtValue)

COMMIT TRANSACTION
GO
GRANT EXEC ON [dbo].[bts_AddApplicationProp] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[bts_RemoveApplicationProp]
@uidPropID uniqueidentifier,
@vtValue sql_variant,
@nvcAppName nvarchar(128),
@fSuccess int OUTPUT

AS


set transaction isolation level read committed
set nocount on
set deadlock_priority low

BEGIN TRANSACTION

set @fSuccess = 1

declare @uidAppID uniqueidentifier

SELECT @uidAppID = uidAppID FROM Applications WHERE nvcApplicationName = @nvcAppName
if (@@ROWCOUNT = 0)
	set @fSuccess = 0
else
BEGIN
	DELETE FROM ApplicationProps
	WHERE uidPropID =  @uidPropID AND
	      vtPropValue = @vtValue AND 
	      nvcApplicationName = @nvcAppName
END

COMMIT TRANSACTION
GO
GRANT EXEC ON [dbo].[bts_RemoveApplicationProp] TO BTS_ADMIN_USERS
GO

exec bts_ResetApplicationSprocs
GO

