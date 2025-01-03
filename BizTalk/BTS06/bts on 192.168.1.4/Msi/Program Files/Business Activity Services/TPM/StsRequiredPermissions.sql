/*******************************************************************************
* Copyright (c) Microsoft Corporation.  All rights reserved.
* 
* THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
* WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
* WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
* THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
* AND INFORMATION REMAINS WITH THE USER.
********************************************************************************/

-- TO BE EXECUTED AGAINST TPM DATABSE
-- These permissions are required only by StsWebService in order to support synchronization.
-- This statement is run against TPM database only for consolidation of databases purpose (keeping the number of DBs low).
-- StsWebService is run with the identity of the caller which is Tpm. As a result, TPMgmtWS identity must have permissions
-- to execute these stored procedures.

if not exists (select * from dbo.sysusers where name = N'tpm_user')
	EXEC sp_addrole N'tpm_user'
GO

-- Synchronization related:
GRANT  EXECUTE  ON [dbo].[AnalyzeAgreements]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[AnalyzeBTServers]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[AnalyzeGroupLists]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[AnalyzeMembers]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[AnalyzeOutboxDocumentLibraries]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[AnalyzePartnersDocumentLibraries]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[WriteAgreementsStsData]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[WriteBTServersStsData]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[WriteDuplicatesStsData]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[WriteMembersStsData]  TO [tpm_user]
GO
	
GRANT  EXECUTE  ON [dbo].[WriteTpmData]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[EmptySyncTables]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[WriteListsStsData]  TO [tpm_user]
GO

----------------------------------------------------------------------
-------- For WSS bug 62774 GUID/List Name performance workaround -----
----------------------------------------------------------------------

GRANT  EXECUTE  ON [dbo].[InsertOrUpdateListName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetGuidFromListName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[DeleteListNameMapping]  TO [tpm_user]
GO

-- WSS bug 62774 and synchronization related. Synchronizing the GUIDs-list name map
GRANT  EXECUTE  ON [dbo].[SyncListGuids]  TO [tpm_user]
GO

----------------------------
-- BizTalk Server 2004 SP1 fix ---------
----------------------------

GRANT  EXECUTE  ON [dbo].[InsertOrUpdateTpmName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[DeleteTpmNameMapping]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetWssNameFromTpmName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetGuidFromTpmName]  TO [tpm_user]
GO