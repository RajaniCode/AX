--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

-- stored procs --
-- changes for BizTalk Server 2006
/************************************************************************
      NOTE:: Drop the existing BDSecurity stored procedures
************************************************************************/
IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_AddAccount]') AND 
   OBJECTPROPERTY(id, N'IsProcedure') = 1)

DROP PROCEDURE [dbo].[sp_AddAccount]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_GetAccounts]') AND 
   OBJECTPROPERTY(id, N'IsProcedure') = 1)

DROP PROCEDURE [dbo].[sp_GetAccounts]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_GetPermissions]') AND 
   OBJECTPROPERTY(id, N'IsProcedure') = 1)

DROP PROCEDURE [dbo].[sp_GetPermissions]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_GetAccountsForRight]') AND 
   OBJECTPROPERTY(id, N'IsProcedure') = 1)

DROP PROCEDURE [dbo].[sp_GetAccountsForRight]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_SetPermissions]') AND 
   OBJECTPROPERTY(id, N'IsProcedure') = 1)

DROP PROCEDURE [dbo].[sp_SetPermissions]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_RemoveAccount]') AND 
   OBJECTPROPERTY(id, N'IsProcedure') = 1) 

DROP PROCEDURE [dbo].[sp_RemoveAccount]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_RemoveSecurityDefinitions]') AND
   OBJECTPROPERTY(id, N'IsProcedure') = 1)

DROP PROCEDURE [dbo].[sp_RemoveSecurityDefinitions]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_GetUID]') AND 
   OBJECTPROPERTY(id, N'IsProcedure') = 1)

DROP PROCEDURE [dbo].[sp_GetUID]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[sp_AddSIDsToTempTable]') AND 
   OBJECTPROPERTY(id, N'IsProcedure') = 1)

DROP PROCEDURE [dbo].[sp_AddSIDsToTempTable]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveChoiceValues]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveChoiceValues]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetChoiceNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetChoiceNames]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetChoiceValues]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetChoiceValues]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[DeleteChoice]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteChoice]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeMembers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeMembers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeBTServers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeBTServers]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetAgreement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAgreement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetStructuredParameterValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetStructuredParameterValue]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveAddendum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAddendum]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveAddendumRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAddendumRole]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveParameter]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveParameter]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveProcessRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveProcessRole]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WriteBTServersStsData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[WriteBTServersStsData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WriteTpmData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[WriteTpmData]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_CreateBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_CreateBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_UpdateBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_DeleteBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DeleteBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_GetBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_GetBizTalkRegistrationByPartner]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetBizTalkRegistrationByPartner]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_GetBizTalkRegistrationList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetBizTalkRegistrationList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RelateProfiles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RelateProfiles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UnrelateProfiles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UnrelateProfiles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertOrUpdateTpmName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertOrUpdateTpmName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteTpmNameMapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteTpmNameMapping]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetWssNameFromTpmName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetWssNameFromTpmName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetGuidFromTpmName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetGuidFromTpmName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeGroupLists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeGroupLists]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeOutboxDocumentLibraries]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeOutboxDocumentLibraries]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzePartnersDocumentLibraries]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzePartnersDocumentLibraries]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteAgreement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteAgreement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetActorAgreements]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetActorAgreements]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetNonInheritedActorAgreements]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetNonInheritedActorAgreements]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAgreementList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAgreementList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveAddendumName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAddendumName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShallowDeleteAgreement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShallowDeleteAgreement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetParameterValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetParameterValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveAgreement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAgreement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveAgreementLegalText]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAgreementLegalText]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveAgreementName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAgreementName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveLegalText]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveLegalText]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetPartnerEnlistments]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetPartnerEnlistments]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteSendPort]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteSendPort]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetPartnerSendPorts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetPartnerSendPorts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveSendPort]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveSendPort]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UpdateSendPort]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateSendPort]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetSendPortsByGlobalPortName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetSendPortsByGlobalPortName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAddendumSendPorts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAddendumSendPorts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DeployPartner]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DeployPartner]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UndeployPartner]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UndeployPartner]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetPartnersFromBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetPartnersFromBizTalkRegistration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetInheritedActorAgreements]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetInheritedActorAgreements]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAgreementsFromTemplate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAgreementsFromTemplate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetRoles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetRoles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetRelatedProfiles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetRelatedProfiles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_IsInRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_IsInRole]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DeleteProfileRelationships]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DeleteProfileRelationships]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IsTemplate]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].[IsTemplate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelDataObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelDataObject]
GO

-- changes went in Microsoft BizTalk Server 2004 to 2006 upgrade
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteOrchestrationDocument]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteOrchestrationDocument]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetOrchestrationRelatedDocuments]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetOrchestrationRelatedDocuments]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RegisterOrchestrationDocument]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RegisterOrchestrationDocument]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bas_UpgradeBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bas_UpgradeBizTalkRegistration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bas_UpgradeInternalSendPort]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bas_UpgradeInternalSendPort]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdateOutboxReceiveLocationUriQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateOutboxReceiveLocationUriQuery]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdateSendPortsQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateSendPortsQuery]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'sp_GrantPermissionForRole'))
    DROP PROCEDURE sp_GrantPermissionForRole
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'sp_CreateProfileSchemaRoles'))
    DROP PROCEDURE sp_CreateProfileSchemaRoles
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'sp_GrantPermissions_ProfileSchemaManager'))
    DROP PROCEDURE sp_GrantPermissions_ProfileSchemaManager
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'sp_GrantPermissions_ProfileSchemaReader'))
    DROP PROCEDURE sp_GrantPermissions_ProfileSchemaReader
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[AnalyzeMembers] 
AS

/* Returns items to be updated */
SELECT
	T.[Name] AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	/*Tpm Group Name if not null, otherwise we return the Sts Parent name */
	(CASE WHEN R.GroupName IS NOT NULL THEN R.GroupName ELSE S.ParentName END) AS ParentName, 
	S.ParentStsId AS ParentStsId,
	R.MemberType AS MemberType, 
	T.[Description] AS [Description],
	T.Status AS Status,
	T.CrossReference AS CrossReference
FROM MembersTpm T 
INNER JOIN RelationsTpm R ON T.[Name]=R.[MemberName] AND T.MemberType=R.MemberType
INNER JOIN MembersSts S ON T.[Name]=S.[Name] AND R.GroupName=S.ParentName AND T.MemberType=R.MemberType
/* These 2 conditions ensures that we return only items that must be updated or for which the URL might need an update */
AND (
	-- items are different
	(T.[Description]<>S.[Description]) OR (T.Status<>S.Status) OR (T.CrossReference <> S.CrossReference) OR 	
	-- or the URL will change (the doc lib is re-created and the TPM items exists in Sts)
	(T.[Name] IN 
		/* Items for which document libraries are re-created */
		(SELECT [Name] FROM MembersTpm WHERE MemberType=0 AND RTRIM(UPPER(CrossReference))<>N'SELF' AND [Name] NOT IN 
			 (SELECT TTOW.TpmName FROM TpmToWssMapping TTOW INNER JOIN ListsSts L ON L.tp_Title  = TTOW.WssName AND TTOW.TpmType='0'))
	AND T.[Name] NOT IN 
		/* and DO exist in Sts */
		(SELECT T2.[Name] AS TpmName FROM MembersTpm T2 INNER JOIN RelationsTpm R2 ON T2.[Name] = R2.[MemberName] AND T2.MemberType = R2.MemberType WHERE T2.[Name] NOT IN  
			(SELECT [Name] FROM MembersSts S2 WHERE S2.ParentName = R2.GroupName) ))
	)


UNION

/* Return Tpm items that don't exist in Sts */
SELECT
	T.[Name] AS TpmName, 
	NULL AS StsName, 
	NULL AS StsId, 
	R.GroupName AS ParentName,	/* We know that S.ParentName is NULL so testing here would be redundant */
	NULL AS ParentStsId,
	R.MemberType AS MemberType, 
	T.[Description] AS [Description],
	T.Status AS Status,
	T.CrossReference AS CrossReference
FROM MembersTpm T 
INNER JOIN RelationsTpm R ON T.[Name]=R.[MemberName] AND T.MemberType=R.MemberType
WHERE T.[Name] NOT IN 
	(SELECT [Name] FROM MembersSts S WHERE S.ParentName = R.GroupName)

UNION

/* Returns the items in Sts that don't exist in Tpm and must be removed */
SELECT
	NULL AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	S.ParentName AS ParentName,  /* We know that R.GroupName is NULL so testing here would be redundant */
	/* This is Sts data since this item was not received from Tpm. This item will be deleted so we don't really have to return data.
	We return data just in case we want to present the user with details about the items beeing removed */
	S.ParentStsId AS ParentStsId,
	S.MemberType AS MemberType, 
	S.[Description] AS [Description],
	S.Status AS Status,
	S.CrossReference AS CrossReference
FROM MembersSts S 
WHERE S.[Name] NOT IN 
	(SELECT [Name] FROM MembersTpm T INNER JOIN RelationsTpm R ON T.[Name]=R.MemberName AND R.GroupName=S.ParentName)

UNION

/* Returns the duplicate items in Sts that must be removed */
SELECT
	NULL AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	S.ParentName AS ParentName,  
	S.ParentStsId AS ParentStsId,
	N'' AS MemberType, 
	N'' AS [Description],
	N'' AS Status,
	N'' AS CrossReference
FROM DuplicatesSts S 
WHERE S.TableName=N'MembersSts'

/* This is the only ORDER BY allowed in UNION statements and it applies to results returned by all SELECTs */
/* The column names in the table resulting from UNION are taken from the first individual query in the UNION statement. 
To refer to a column in the result set by a new name (for example, in an ORDER BY clause), the column must be referred 
to that way in the first SELECT */
ORDER BY ParentName 

OPTION (HASH UNION) /* workaround for SQL Bug. See KB article 286255 */

/* We sort by List/Group Name so that we don't jump from one list to another and back. This will allow us to minimize calls to the Sts Object Model */
RETURN 0
GO

CREATE PROCEDURE [dbo].[AnalyzeBTServers] 
AS
/* Returns items to be updated */
SELECT
	T.[Name] AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	T.ReceiveLocationUri AS ReceiveLocationUri,
	T.Server AS Server,
	T.[Database] AS [Database],
	T.BizTalkHost AS BizTalkHost,
	T.ParameterServiceHost AS ParameterServiceHost
FROM BTServersTpm T 
INNER JOIN BTServersSts S ON T.[Name]=S.[Name]
/* This condition ensures that we return only items that must be updated */
AND ( 	(T.ReceiveLocationUri<>S.ReceiveLocationUri) OR 
	(T.Server <> S.Server) OR
	(T.[Database] <> S.[Database]) OR
	(T.BizTalkHost <> S.BizTalkHost) OR
	(T.ParameterServiceHost <> S.ParameterServiceHost)
     )

UNION

/* Return Tpm items that don't exist in Sts */
SELECT
	T.[Name] AS TpmName, 
	NULL AS StsName, 
	NULL AS StsId, 
	T.ReceiveLocationUri AS ReceiveLocationUri,
	T.Server AS Server,
	T.[Database] AS [Database],
	T.BizTalkHost AS BizTalkHost,
	T.ParameterServiceHost AS ParameterServiceHost
FROM BTServersTpm T 
WHERE T.[Name] NOT IN 
	(SELECT [Name] FROM BTServersSts)

UNION

/* Returns the items in Sts that don't exist in Tpm and must be removed */
SELECT
	NULL AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	S.ReceiveLocationUri AS ReceiveLocationUri,
	S.Server AS Server,
	S.[Database] AS [Database],
	S.BizTalkHost AS BizTalkHost,
	S.ParameterServiceHost AS ParameterServiceHost
FROM BTServersSts S 
WHERE S.[Name] NOT IN 
	(SELECT [Name] FROM BTServersTpm)

UNION

/* Returns the duplicate items in Sts that must be removed */
SELECT
	NULL AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	N'' AS ReceiveLocationUri,
	N'' AS Server,
	N'' AS [Database],
	N'' AS BizTalkHost,
	N'' AS ParameterServiceHost
FROM DuplicatesSts S 
WHERE S.TableName=N'BTServersSts'

OPTION (HASH UNION) /* workaround for SQL Bug. See KB article 286255 */

RETURN 0
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [dbo].[GetAgreement]
 (
  @agreementId nvarchar(256)
 )
AS
 /* SET NOCOUNT ON */
 
 -- agreement
 SELECT [A].[Name], [A].[Description], [A].[Date], [A].[StartDate], [A].[EndDate], [A].[State], [A].[LastModified], [A].[AgreementId], Version, [B].[Name] AS TemplateName
  FROM [dbo].[Agreements] A CROSS JOIN [dbo].[Version]
  LEFT OUTER JOIN [dbo].[Agreements] B ON [B].[AgreementId] = [A].[TemplateAgreementId]
  WHERE [A].[Name] = @agreementId

 -- agreement names  
 SELECT [dbo].[AgreementsNames].[Name] FROM [dbo].[AgreementsNames] 
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementsNames].[AgreementId] 
  WHERE [dbo].[Agreements].[Name] = @agreementId

 -- addendum roles  
 SELECT TOP 100 PERCENT [dbo].[ActorRoles].[ActorId], 
  [dbo].[ProcessRoles].[Name] AS RoleId, 
  [dbo].[Addendums].[Name] AS AddendumId,
  [dbo].[ActorRoles].[ActorType],
  [dbo].[ActorRoles].[Self],
  (SELECT count(distinct [dbo].[ActorRoles].[ActorId])
  FROM [dbo].[ActorRoles]
   LEFT OUTER JOIN [dbo].[ProcessRoles] ON [dbo].[ActorRoles].[ProcessRoleId] = [dbo].[ProcessRoles].[ProcessRoleId]
   JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[ActorRoles].[ProcessConfigId]
   JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId) AS ActorCount
  FROM [dbo].[ActorRoles]
  LEFT OUTER JOIN [dbo].[ProcessRoles] ON [dbo].[ActorRoles].[ProcessRoleId] = [dbo].[ProcessRoles].[ProcessRoleId]
  JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[ActorRoles].[ProcessConfigId]
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
  ORDER BY [dbo].[ActorRoles].[ActorId],  [dbo].[Addendums].[Name], [dbo].[ProcessRoles].[Name]
  
 -- addendums
 SELECT [dbo].[Addendums].[Name] AS AddendumName, [dbo].[Addendums].[Description], 
   [dbo].[Processes].[BusinessProcessName], 
   [dbo].[Processes].[ServiceLinkName],
   dbo.Processes.ServiceLinkAssemblySN,
   [dbo].[Processes].[Description] AS BusinessProcessDescription, 
   [dbo].[Processes].[DefinitionSource],
   [dbo].[Addendums].[AddendumId] 
  FROM [dbo].[Addendums]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [Addendums].[AgreementId]
  LEFT OUTER JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Addendums].[ProcessConfigId]
  LEFT OUTER JOIN [dbo].[Processes] ON [dbo].[Processes].[ProcessId] = [dbo].[ProcessConfig].[ProcessId] 
  WHERE [Agreements].[Name] = @agreementId

 -- addendum names 
 SELECT [AddendumNames].[Name], [AddendumNames].[AddendumId] FROM [dbo].[AddendumNames]
  JOIN [dbo].[Addendums] ON [Addendums].[AddendumId] = [AddendumNames].[AddendumId]
  JOIN [dbo].[Agreements] ON [Addendums].[AgreementId]  = [Agreements].[AgreementId]  
  WHERE [Agreements].[Name] = @agreementId
  
 -- xquery parameters
 SELECT [PolicyTemplates].[name], [Parameters].[Description], [Parameters].[XQuery], [Addendums].[AddendumId]
  FROM [dbo].[Parameters]
  JOIN [dbo].[Policies] ON [dbo].[Policies].[PolicyId] = [dbo].[Parameters].[PolicyId]
  JOIN [dbo].[PolicyTemplates] ON [dbo].[PolicyTemplates].[PolicyTemplateId] = [dbo].[Policies].[PolicyTemplateId]
  JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId and [dbo].[Parameters].[IsXQuery] = 1
  
 -- Structured Parameters (1 per addendum)
 SELECT [PolicyTemplates].[name], [Parameters].[ParameterInfoPathXml], [Addendums].[AddendumId]
  FROM [dbo].[Parameters]
  JOIN [dbo].[Policies] ON [dbo].[Policies].[PolicyId] = [dbo].[Parameters].[PolicyId]
  JOIN [dbo].[PolicyTemplates] ON [dbo].[PolicyTemplates].[PolicyTemplateId] = [dbo].[Policies].[PolicyTemplateId]
  JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId] 
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId and [dbo].[Parameters].[IsXQuery] = 0
  
 -- roles
 SELECT [ProcessRoles].[Name], [ProcessRoles].[Description], [ProcessRoles].[DefinitionSource], [Addendums].[AddendumId]
  FROM [dbo].[ProcessRoles]
  JOIN [dbo].[ActorRoles] ON [dbo].[ActorRoles].[ProcessRoleId] = [dbo].[ProcessRoles].[ProcessRoleId]
  JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[ActorRoles].[ProcessConfigId]
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId

 -- legal text  
 SELECT [LegalDocuments].[Body], [LegalDocuments].[AddendumId], [LegalDocuments].[Format]
  FROM [dbo].[Addendums]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  JOIN [dbo].[LegalDocuments] ON [dbo].[LegalDocuments].[AddendumId] = [dbo].[Addendums].[AddendumId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
  
 -- legal text  
 SELECT [dbo].[AgreementLegalDocuments].[Body], [dbo].[AgreementLegalDocuments].[AgreementId], [dbo].[AgreementLegalDocuments].[Format]
  FROM [dbo].[AgreementLegalDocuments] 
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementLegalDocuments].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
  
 RETURN
GO

/* Returns an instance of a structured parameter */
CREATE PROCEDURE [dbo].[GetStructuredParameterValue]
 (
  @roleLinkTypeFullName NVARCHAR(255),
  @roleLinkTypeAssemblyStrongName t_assemblyStrongName,
  @parameterSchemaFullName NVARCHAR(255),
  @orchestrationName NVARCHAR(255),
  @orchestrationAssemblyStrongName t_assemblyStrongName,
  @partner NVARCHAR(128)
 )
AS
 /* SET NOCOUNT ON */
SELECT param.ParameterXml
FROM Parameters param, Policies policy, PolicyTemplates pt, ProcessConfig pc, ActorRoles ar, Processes p, ProcessRoles pr 
WHERE 	[param].[PolicyId] = [policy].[PolicyId]
AND 	[policy].[PolicyTemplateId] = [pt].[PolicyTemplateId]
AND 	[policy].[ProcessConfigId] = [pc].[ProcessConfigId]
AND	    [pc].[ProcessId] = [p].[ProcessId]
AND	    [p].[ProcessId] = [pt].[ProcessId]
AND 	[pc].[ProcessConfigId] = [ar].[ProcessConfigId]
AND 	[pr].[ProcessId] = [p].[ProcessId]
AND ([p].[BusinessProcessName] = @orchestrationName) 
AND ([p].[DefinitionSource] = @orchestrationAssemblyStrongName)
AND ([p].[ServiceLinkName] = @roleLinkTypeFullName) 
AND ([p].[ServiceLinkAssemblySN] = @roleLinkTypeAssemblyStrongName)
AND ([ar].[ActorId] = @partner)
AND ([pt].[name] = @parameterSchemaFullName)
AND ([pt].[SchemaAssemblySN] = @roleLinkTypeAssemblyStrongName)

RETURN
GO

--- <summary>
--- Creates or updates addendum properties.
--- </summary>
--- <param name="AgreementId">Internal unique identifier of agreement</param>
--- <param name="AddendumId">Agreement-wide unique addendum name</param>
--- <param name="Description"></param>
--- <param name="BusinessProcessName">Orchestration name</param>
--- <param name="ServiceLinkName">Service link type name</param>
--- <param name="BusinessProcessDescription">Description</param>
--- <param name="BusinessProcessDefinitionSource">Name of assembly that implements orchestration</param>
--- <param name="BusinessProcessLocation">Name of BizTalk server where assembly is deployed</param>
--- <param name="id">Addendum GUID</param>
--- <returns>0 if success -1 if service link name is not specified</returns>
CREATE PROCEDURE [dbo].[SaveAddendum]
	(
		@AgreementId UNIQUEIDENTIFIER,
		@AddendumId NVARCHAR(255),
		@Description NVARCHAR(255),
		@BusinessProcessName NVARCHAR(255),
		@ServiceLinkName NVARCHAR(255),
		@ServiceLinkAssemblySN t_assemblyStrongName,
		@BusinessProcessDescription NVARCHAR(255),
		@BusinessProcessDefinitionSource NVARCHAR(255),
		@id UNIQUEIDENTIFIER OUTPUT
	)
AS
	/* SET NOCOUNT ON */
	DECLARE @n INT
	DECLARE @OldDescription NVARCHAR(255)
	DECLARE @OldBusinessprocessName NVARCHAR(255)
	DECLARE @OldDefintionSource NVARCHAR(255)
	DECLARE @ProcessId UNIQUEIDENTIFIER
	DECLARE @ProcessConfigId UNIQUEIDENTIFIER
	DECLARE @AgreementName NVARCHAR(255)
	SET @id = NULL
	
	-- get addendum id
	SELECT @id = AddendumId FROM [dbo].[Addendums] 
	WHERE [dbo].[Addendums].[AgreementId] = @AgreementId AND
		[dbo].[Addendums].[Name] = @AddendumId

	-- create or update?
	IF @id IS NOT NULL
	BEGIN
		-- addendum exists
		
		-- retrieve old description
		SELECT @OldDescription = [Description], @id = [AddendumId] FROM [dbo].[Addendums] 
		WHERE [dbo].[Addendums].[AgreementId] = @AgreementId AND
			[dbo].[Addendums].[Name] = @AddendumId

		-- update description if neccessary
		IF @OldDescription <> @Description
			UPDATE [dbo].[Addendums] SET [Description] = @Description WHERE [AddendumId] = @id

		--	change process name and/or definition source
		
		-- get old values of process name and/or definition source
		SELECT @OldBusinessprocessName = [BusinessProcessName], 
			@OldDefintionSource = [DefinitionSource],
			@ProcessId = [dbo].[Processes].[ProcessId]
		FROM [dbo].[Processes]
		JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessId] = [dbo].[Processes].[ProcessId]
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AddendumId]
		WHERE [dbo].[Agreements].[AgreementId] = @AgreementId
		
		-- update definition source
		IF @OldBusinessprocessName <> @BusinessProcessName
			UPDATE [dbo].[Processes] SET [BusinessProcessName] = @BusinessProcessName
			WHERE [ProcessId] = @ProcessId
		
		-- if process name is different
		-- update process name	
		IF @OldDefintionSource <> @BusinessProcessDefinitionSource
		BEGIN
			UPDATE [dbo].[Processes] SET [DefinitionSource] = @BusinessProcessDefinitionSource
			WHERE [ProcessId] = @ProcessId
		END
	END
	ELSE
	BEGIN
		-- addendum doesn't exixsts, create new addendum entry
		
		-- service link name is required when new adendum is created
		IF @ServiceLinkName IS NULL OR @ServiceLinkName = N''
			RETURN -1
		
		/*	Associate addendum with process config:
				if (process doesn't exists)
					create process entry
				create process config entry
				create new addendum entry and 
					associate config entry with addendum
		*/
		-- Legacy agreements has @ServiceLinkAssemblySN field as NULL
		IF (@ServiceLinkAssemblySN IS NULL)
		BEGIN
			SELECT 	@ProcessId = ProcessId 
			FROM 	dbo.Processes 
			WHERE 	ServiceLinkName = @ServiceLinkName AND
				ServiceLinkAssemblySN IS NULL AND
				BusinessProcessName = @BusinessProcessName AND
				DefinitionSource = @BusinessProcessDefinitionSource
		END
		ELSE 
		BEGIN
		
			SELECT 	@ProcessId = ProcessId 
			FROM 	dbo.Processes 
			WHERE 	ServiceLinkName = @ServiceLinkName AND
				ServiceLinkAssemblySN = @ServiceLinkAssemblySN AND
				BusinessProcessName = @BusinessProcessName AND
				DefinitionSource = @BusinessProcessDefinitionSource
		END
		IF @ProcessId IS NULL
		BEGIN
			-- create process entry
			SELECT @ProcessId = NEWID()
			INSERT INTO [dbo].[Processes](ProcessId, BusinessProcessName, 
				ServiceLinkName, Description, DefinitionSource, ServiceLinkAssemblySN)
			VALUES(@ProcessId, @BusinessProcessName, 
				@ServiceLinkName, @BusinessProcessDescription, 
				@BusinessProcessDefinitionSource, @ServiceLinkAssemblySN)
		END
			
		-- create process config entry
		SELECT @ProcessConfigId = NEWID()
		SELECT @AgreementName = [Name] FROM [dbo].[Agreements] WHERE [AgreementId] = @AgreementId
		INSERT INTO [dbo].[ProcessConfig](ProcessConfigId, ProcessId)
		VALUES(@ProcessConfigId, @ProcessId)
		
		-- create new addendum entry and
		--  associate config entry with addendum
		SELECT @id = NEWID()
		INSERT INTO [dbo].[Addendums](AgreementId, AddendumId, ProcessConfigId, Name, Description)
		VALUES (@AgreementId, @id, @ProcessConfigId, @AddendumId, @Description)
	END

	RETURN
GO

CREATE PROCEDURE [dbo].[SaveAddendumRole]
	(
		@AgreementId UNIQUEIDENTIFIER,
		@PartnerId NVARCHAR(255),
		@PartnerType INT,
		@RoleName NVARCHAR(255),
		@AddendumName NVARCHAR(255),
		@IsSelf BIT
	)
AS
	/* SET NOCOUNT ON */
	DECLARE @n INT
	DECLARE @ProcessConfigId UNIQUEIDENTIFIER
	DECLARE @ProcessId UNIQUEIDENTIFIER
	DECLARE @AddendumId UNIQUEIDENTIFIER
	DECLARE @ProcessRoleId UNIQUEIDENTIFIER
	SET @ProcessConfigId = NULL
	SET @ProcessId = NULL
	SET @AddendumId = NULL
	SET @ProcessRoleId = NULL

	-- check if actor role exists
	SELECT @n = COUNT(*) FROM [dbo].[ActorRoles]
		JOIN [dbo].[ProcessRoles] ON [dbo].[ProcessRoles].[ProcessRoleId] = [dbo].[ActorRoles].[ProcessRoleId]
		JOIN [dbo].[Processes] ON [dbo].[Processes].[ProcessId] = [dbo].[ProcessRoles].[ProcessId]
		JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[ActorRoles].[ProcessConfigId]
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId] 
		WHERE [dbo].[Addendums].[AgreementId] = @AgreementId AND
			[dbo].[ProcessRoles].[Name] = @RoleName AND
			[dbo].[ActorRoles].[ActorId] = @PartnerId AND
			[dbo].[Addendums].[Name] = @AddendumName
			
	IF @n = 0
	BEGIN
		-- Check that this addendum already exists in the addendums table
		SELECT @AddendumId = AddendumId FROM [dbo].[Addendums] WHERE [AgreementId] = @AgreementId AND [Name] = @AddendumName
		IF @AddendumId IS NULL
			RETURN -2
			
		-- Check that this relationship/service link usage used by the addendum
		-- already exists in the ProcessConfig table
		SELECT @ProcessConfigId = [dbo].[ProcessConfig].[ProcessConfigId], @ProcessId = [ProcessId] FROM [dbo].[ProcessConfig] 
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
		WHERE [dbo].[Addendums].[AddendumId] = @AddendumId
		IF @ProcessConfigId IS NULL OR @ProcessId IS NULL
			RETURN -3
			
		-- Check that this role specified by the addendum already exists in the ProcessRoles table
		-- Should have been inserted by dbo.SaveProcessRole
		SELECT @ProcessRoleId = [ProcessRoleId] FROM [dbo].[ProcessRoles] WHERE [ProcessId] = @ProcessId AND [Name] = @RoleName
		IF @ProcessRoleId IS NULL AND @RoleName <> N'NULL'
			RETURN -4
			
		-- create actor role (role played by the current partner) 		
		INSERT INTO [dbo].[ActorRoles](ProcessRoleId, ActorId, ProcessConfigId, ActorType, Self)
		VALUES(@ProcessRoleId, @PartnerId, @ProcessConfigId, @PartnerType, @IsSelf)	
	END
	
	RETURN 


GO

CREATE PROCEDURE [dbo].[SaveParameter]
 (
  @AddendumId UNIQUEIDENTIFIER, -- Id of the addendum
  @ReferenceId NVARCHAR(255),   -- Name of the parameter or full name of the parameter schema
  @Description NVARCHAR(255),   -- Description of parameter (only valid for old parameters)
  @XQuery  NVARCHAR(512),       -- Value of the parameter (only valid for old parameters)
  @ParameterXml NTEXT,          -- Xml value of the structured parameter (user schema)
  @ParameterInfoPathXml NTEXT,  -- Xml value of the structured parameter (infoPath schema)
  @ParameterSchemaAssemblyStrongName t_assemblyStrongName   -- assembly SN of the parameter schema assembly
 )
AS
 /* SET NOCOUNT ON */
 DECLARE @isXQuery BIT
 DECLARE @PolicyId UNIQUEIDENTIFIER
 DECLARE @ProcessConfigId UNIQUEIDENTIFIER
 DECLARE @ProcessId UNIQUEIDENTIFIER
 DECLARE @PolicyTemplateId UNIQUEIDENTIFIER
 DECLARE @OldTimeout NVARCHAR(32)
 DECLARE @OldXQuery NVARCHAR(512)
 DECLARE @OldReferenceId NVARCHAR(255)
 DECLARE @OldDescription NVARCHAR(255)

 SET @PolicyId = NULL
 SET @ProcessConfigId = NULL
 SET @ProcessId = NULL
 SET @PolicyTemplateId = NULL
 SET @OldXQuery = NULL
 SET @OldReferenceId = NULL
 SET @OldDescription = NULL

 -- determine parameter type; old parameters have isXQuery set to true
 IF @ParameterXml IS NULL AND @XQuery IS NOT NULL
  SET @isXQuery = 1
 ELSE IF @ParameterXml IS NOT NULL AND @XQuery IS NULL
  SET @isXQuery = 0
 ELSE
  RETURN -1

 -- lookup process config id
 SELECT @ProcessConfigId = [dbo].[ProcessConfig].[ProcessConfigId], @ProcessId = [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[Addendums]
 JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Addendums].[ProcessConfigId]
 WHERE [dbo].[Addendums].[AddendumId] = @AddendumId
 IF @ProcessConfigId IS NULL
  RETURN -20
 IF @ProcessId IS NULL
  RETURN -21
  
 -- lookup policy template for legacy parameters 
IF @isXQuery = 1
BEGIN
 SELECT @PolicyTemplateId = [PolicyTemplateId] FROM [dbo].[PolicyTemplates]
 WHERE [dbo].[PolicyTemplates].[ProcessId] = @ProcessId AND 
  [dbo].[PolicyTemplates].[name] = @ReferenceId
END

 -- lookup policy template for structured paramters
ELSE
BEGIN
 SELECT	@PolicyTemplateId = PolicyTemplateId FROM dbo.PolicyTemplates
 WHERE 	dbo.PolicyTemplates.ProcessId = @ProcessId AND 
  	dbo.PolicyTemplates.name = @ReferenceId AND
	dbo.PolicyTemplates.SchemaAssemblySN = @ParameterSchemaAssemblyStrongName
END
 IF @PolicyTemplateId IS NULL
 BEGIN
  SET @PolicyTemplateId = NEWID()
  INSERT INTO dbo.PolicyTemplates(PolicyTemplateId, ProcessId, type, name, SchemaAssemblySN)
  VALUES(@PolicyTemplateId, @ProcessId, 0, @ReferenceId, @ParameterSchemaAssemblyStrongName)
 END
 
 -- lookup policy
 SELECT @PolicyId = [dbo].[Parameters].[PolicyId],
  @OldXQuery = [dbo].[Parameters].[XQuery],
  @OldDescription = [dbo].[Parameters].[Description]
 FROM [dbo].[Parameters]
 JOIN [dbo].[Policies] ON [dbo].[Policies].[PolicyId] = [dbo].[Parameters].[PolicyId]
 JOIN [dbo].[PolicyTemplates] ON [dbo].[PolicyTemplates].[PolicyTemplateId] = [dbo].[Policies].[PolicyTemplateId]
 WHERE [dbo].[Policies].[PolicyTemplateId] = @PolicyTemplateId AND
  [dbo].[Policies].[PolicyId] = @PolicyId 

 IF @PolicyId IS NULL
 BEGIN
  /* create new parameter */

  SET @PolicyId = NEWID()
  
  INSERT INTO [dbo].[Policies](PolicyId, ProcessConfigId, PolicyTemplateId) 
  VALUES(@PolicyId, @ProcessConfigId, @PolicyTemplateId)

  INSERT INTO dbo.Parameters(PolicyId, IsXQuery, XQuery, Description, ParameterXml, ParameterInfoPathXml)
  VALUES(@PolicyId, @isXQuery, @XQuery, @Description, @ParameterXml, @ParameterInfoPathXml)
 END
 ELSE
 BEGIN
  /* update existing parameter */
  -- update parameter
  UPDATE    dbo.Parameters  
  SET       ParameterInfoPathXml = @ParameterInfoPathXml, 
            ParameterXml = @ParameterXml,
            XQuery = @XQuery, 
            Description = @Description
  WHERE PolicyId = @PolicyId
 END
 RETURN
GO

/* Saves the information about a role that participates in the business relationship */
CREATE PROCEDURE [dbo].[SaveProcessRole]
	(
		@BusinessProcessName NVARCHAR(255),
		@ProcessDefinitionSource t_assemblyStrongName,
		@ServiceLinkName NVARCHAR(255),
		@ServiceLinkAssemblySN t_assemblyStrongName,
		@RoleName NVARCHAR(255),
		@RoleDescription NVARCHAR(255),
		@RoleDefinitionSource NVARCHAR(1024)
	)
AS
	/* SET NOCOUNT ON */
	DECLARE @ProcessRoleId UNIQUEIDENTIFIER
	DECLARE @ProcessId UNIQUEIDENTIFIER
	SET @ProcessId = NULL
	SET @ProcessRoleId = NULL
	
	-- check if process/relationship/service link usage exists
	IF @ServiceLinkAssemblySN IS NULL
	BEGIN	
	SELECT @ProcessId = [ProcessId] FROM [dbo].[Processes]
	WHERE @ServiceLinkName =  [ServiceLinkName] AND
		@ProcessDefinitionSource =  [DefinitionSource] AND
			@BusinessProcessName  = BusinessProcessName AND
			ServiceLinkAssemblySN IS NULL
	END
	ELSE
	BEGIN

		SELECT @ProcessId = ProcessId FROM dbo.Processes
		WHERE @ServiceLinkName =  ServiceLinkName AND
			@ServiceLinkAssemblySN = ServiceLinkAssemblySN AND
			@ProcessDefinitionSource =  DefinitionSource AND
			@BusinessProcessName  = BusinessProcessName 
	END 
	-- error	
	IF @ProcessId IS NULL
		RETURN -1
	
	-- check if role exists
	SELECT @ProcessRoleId = [ProcessRoleId] FROM [dbo].[ProcessRoles]
	WHERE [ProcessId] = @ProcessId AND [Name] = @RoleName
	
	-- create role if it doesn't exists
	IF @ProcessRoleId IS NULL
	BEGIN
		-- create new role
		INSERT INTO [dbo].[ProcessRoles](ProcessRoleId, ProcessId, Name, Description, DefinitionSource)
		VALUES(NEWID(), @ProcessId, @RoleName, @RoleDescription, @RoleDefinitionSource)
	END	
	RETURN 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[WriteBTServersStsData] 
	@Name nvarchar(128),
	@StsId int,
	@ReceiveLocationUri nvarchar(255),
	@Server nvarchar(255),
	@Database nvarchar(255),
	@BizTalkHost nvarchar(80),
	@ParameterServiceHost nvarchar(80)
AS
SET NOCOUNT ON
INSERT INTO BTServersSts ( [Name], StsId, ReceiveLocationUri, Server, [Database], BizTalkHost, ParameterServiceHost )
	VALUES ( @Name, @StsId, @ReceiveLocationUri, @Server, @Database, @BizTalkHost, @ParameterServiceHost )
RETURN 0
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF
GO

CREATE PROCEDURE [dbo].[WriteTpmData] 
	@itemsBatch ntext 
AS

DECLARE @idoc int
DECLARE @Ret int

EXEC @Ret = sp_xml_preparedocument @idoc OUTPUT, @itemsBatch , N'<SomethingHere xmlns:a="http://www.microsoft.com/BizTalk/KwTpm"/>'
IF @Ret<>0
	RETURN @Ret

/* Insert Partners data from XML */
INSERT INTO MembersTpm ([Name], MemberType, [Description], Status, CrossReference)
SELECT PartnerId, 0 AS MemberType, [Description], ActiveStatus, CrossReference
FROM OPENXML(@idoc, '//a:PartnerInfo',2) /* element centric mapping */
            WITH (	PartnerId  nvarchar(128) 'a:PartnerId', 
			MemberType int, 	/* this info is not in the xml. The schema tells us that it's a partner */
			[Description] nvarchar(255) 'a:Description', 
			ActiveStatus nvarchar(255) 'a:ActiveStatus',
			CrossReference nvarchar(255) 'a:PartnerIdCrossReference')

/* Insert Group data from XML */
INSERT INTO MembersTpm ([Name], MemberType, [Description], Status, CrossReference)
SELECT GroupId, 1 AS MemberType, [Description], N'' AS Status, N'' AS CrossReference
FROM OPENXML(@idoc, '//a:GroupInfo',2) /* element centric mapping */
            WITH (	GroupId  nvarchar(128) 'a:GroupId', 
			MemberType int, 	/* this info is not in the xml. The schema tells us that it's a group */
			[Description] nvarchar(255) 'a:Description', 
			Status nvarchar(255), /* Groups don't have a status. We'll use empty string */
			CrossReference nvarchar(255) ) /* Groups don't have a CrossReference. We'll use empty string */


/* Insert Agreements data from XML */
INSERT INTO AgreementsTpm ([Name], [Description], Status)
SELECT AgreementId, [Description], Status 
FROM OPENXML(@idoc, '//a:AgreementInfo',2) /* element centric mapping */
            WITH (	AgreementId nvarchar(128) 'a:AgreementId', 
			[Description] nvarchar(255) 'a:Description',
			Status nvarchar(255) 'a:Status')

/* Insert BizTalk Server data from XML */
INSERT INTO BTServersTpm ([Name], ReceiveLocationUri, Server, [Database], BizTalkHost, ParameterServiceHost)
SELECT [Name], ReceiveLocationUri, Server, [Database], BizTalkHost, ParameterServiceHost 
FROM OPENXML(@idoc, '//a:BizTalkRegistrationInfo',2) /* element centric mapping */
            WITH (		[Name]  nvarchar(128) 'a:Name', 
			ReceiveLocationUri nvarchar(255) 'a:ReceiveLocationUri',
			Server nvarchar(255) 'a:Server',
			[Database] nvarchar(255) 'a:Database',
			BizTalkHost nvarchar(80) 'a:OutboxReceiveLocHost',
			ParameterServiceHost nvarchar(80) 'a:ParamSvcHost')

/* Insert BizTalk Server data from XML */
INSERT INTO RelationsTpm (GroupName, MemberName, MemberType)
SELECT GroupName, MemberName, MemberType
FROM OPENXML(@idoc, '//a:RelationInfo',2) /* element centric mapping */
            WITH (	GroupName nvarchar(128) 'a:GroupName', 
			MemberName nvarchar(128) 'a:MemberName', 
			MemberType int 'a:MemberType')

EXEC sp_xml_removedocument @idoc
RETURN 0
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[sp_CreateBizTalkRegistration]
    @name nvarchar(128),
    @server nvarchar(128),
    @database nvarchar(128),
 @biztalkhost nvarchar(80) = NULL,
 @parameterservicehost nvarchar(80),
 @receivelocationuri nvarchar(255) = NULL,
 @sendlocationuri nvarchar(512) = NULL
AS
-- @server refers to the SQL Server machine hosting the @database database
-- @biztalkservermachine refers to an actual machine hosting a BizTalk Server service (that uses 
-- the specified management database) or to an NLB cluster of such machines

declare @biztalkserverid uniqueidentifier
declare @numRegisteredBizTalkServers int

-- Check if there is already a BizTalk server registered
SELECT @numRegisteredBizTalkServers = count(*) FROM [dbo].[BizTalkServer]

SET NOCOUNT ON

IF (@numRegisteredBizTalkServers = 0)
BEGIN
 -- Generate a new BizTalkServer ID
 SET @biztalkserverid = NEWID()

 -- Insert the biztalk information into the BizTalkServer table

 INSERT INTO [dbo].[BizTalkServer] (BizTalkServerId, Name, Server, DatabaseName, ReceiveLocationUri, SendLocationUri, BizTalkHost, ParameterServiceHost)
 VALUES(@biztalkserverid, @name, @server, @database, @receivelocationuri, @sendlocationuri, @biztalkhost, @parameterservicehost)
END
GO

CREATE PROCEDURE [dbo].[sp_DeleteBizTalkRegistration]
    @name nvarchar(128)
AS

SET NOCOUNT ON
DECLARE @result int
SELECT @result = -1

IF EXISTS(SELECT [dbo].[BizTalkServer].[BizTalkServerId]
                  FROM [dbo].[BizTalkServer]
                  WHERE Name=@name)
   BEGIN
      SELECT @result = 0
      IF NOT EXISTS (SELECT [dbo].[DeployedPartners].[PartnerId]
                                 FROM [dbo].[BizTalkServer] INNER JOIN [dbo].[DeployedPartners] ON ([dbo].[BizTalkServer].[BizTalkServerId] = [dbo].[DeployedPartners].[BizTalkServerId])
                                 WHERE Name=@name)
      BEGIN
         DELETE FROM BizTalkServer WHERE [dbo].[BizTalkServer].[Name] = @name
         SELECT @result = 1
      END
   END

SELECT @result Result
GO

CREATE PROCEDURE [dbo].[sp_UpdateBizTalkRegistration]
    @name nvarchar(128),
    @newName nvarchar(128),
    @bizTalkHost nvarchar(80), 
    @parameterServiceHost nvarchar(80)
AS

UPDATE [dbo].[BizTalkServer]
SET [dbo].[BizTalkServer].[Name] = @newName, [dbo].[BizTalkServer].[BizTalkHost] = @bizTalkHost, [dbo].[BizTalkServer].[ParameterServiceHost] = @parameterServiceHost
WHERE [dbo].[BizTalkServer].[Name] = @name
GO

CREATE PROCEDURE [dbo].[sp_GetBizTalkRegistration]
    @name nvarchar(128)
AS

SELECT Name, Server, DatabaseName, BizTalkHost, ParameterServiceHost, ReceiveLocationUri, SendLocationUri
FROM [dbo].[BizTalkServer]
WHERE [BizTalkServer].[Name] = @name
ORDER BY [dbo].[BizTalkServer].[Name]
GO

CREATE PROCEDURE [dbo].[sp_GetBizTalkRegistrationByPartner]
    @partnerId nvarchar(128)
AS

SELECT [Name], [Server], [DatabaseName], [BizTalkHost], [ParameterServiceHost], [ReceiveLocationUri], [SendLocationUri]
FROM [dbo].[BizTalkServer] INNER JOIN [dbo].[DeployedPartners] ON ([dbo].[BizTalkServer].[BizTalkServerId] = [dbo].[DeployedPartners].[BizTalkServerId])
WHERE [dbo].[DeployedPartners].[PartnerId] = @partnerId
GO

CREATE PROCEDURE [dbo].[sp_GetBizTalkRegistrationList]
AS

SELECT [Name], [Server], [DatabaseName], [BizTalkHost], [ParameterServiceHost], [ReceiveLocationUri], [SendLocationUri]
FROM [dbo].[BizTalkServer]
ORDER BY [Name]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_RelateProfiles]
    @sourcekey nvarchar(128),
    @sourcetype nvarchar(128),
    @targetkey nvarchar(128),
    @targettype nvarchar(128),
    @relationship nvarchar(128),
    @inverserelationship nvarchar(128)
AS
declare @sourceid uniqueidentifier
declare @targetid uniqueidentifier

BEGIN TRANSACTION

-- Make sure the source is in the Profiles table
SET @sourceid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @sourcekey AND ProfileType = @sourcetype)

IF @sourceid IS NULL
BEGIN
  SET @sourceid = NEWID()

  INSERT INTO Profiles (ProfileID, ProfileKey, ProfileType)
  VALUES(@sourceid, @sourcekey, @sourcetype)
END

-- Make sure the target is in the Profiles table
SET @targetid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @targetkey AND ProfileType = @targettype)

IF @targetid IS NULL
BEGIN
  SET @targetid = NEWID()

  INSERT INTO Profiles (ProfileID, ProfileKey, ProfileType)
  VALUES(@targetid, @targetkey, @targettype)
END

-- Insert the relationship into the Relationships table
IF NOT EXISTS (SELECT * FROM Relationships WHERE SourceProfileID = @sourceid AND TargetProfileID = @targetid AND Relationship = @relationship)
	INSERT INTO Relationships (SourceProfileID, TargetProfileID, Relationship)
	VALUES(@sourceid, @targetid, @relationship)

-- Insert the inverse relationship into the Relationships table
IF NOT EXISTS (SELECT * FROM Relationships WHERE SourceProfileID = @targetid AND TargetProfileID = @sourceid AND Relationship = @inverserelationship)
	INSERT INTO Relationships (SourceProfileID, TargetProfileID, Relationship)
	VALUES(@targetid, @sourceid, @inverserelationship)

COMMIT TRANSACTION
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_UnrelateProfiles]
    @sourcekey nvarchar(128),
    @sourcetype nvarchar(128),
    @targetkey nvarchar(128),
    @targettype nvarchar(128),
    @relationship nvarchar(128),
    @inverserelationship nvarchar(128)
AS
declare @sourceid uniqueidentifier
declare @targetid uniqueidentifier


-- Make sure the source is in the Profiles table
SET @sourceid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @sourcekey AND ProfileType = @sourcetype)

-- Make sure the target is in the Profiles table
SET @targetid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @targetkey AND ProfileType = @targettype)

BEGIN TRANSACTION

-- Remove the relationship from the Relationships table
DELETE FROM Relationships
WHERE Relationships.SourceProfileID = @sourceid
AND   Relationships.TargetProfileID = @targetid
AND   Relationships.Relationship = @relationship

-- Remove the relationship from the Relationships table
DELETE FROM Relationships
WHERE Relationships.SourceProfileID = @targetid
AND   Relationships.TargetProfileID = @sourceid
AND   Relationships.Relationship = @inverserelationship

-- Remove the profile from the Profiles table if no more relationships exist
IF NOT EXISTS (SELECT * FROM Relationships WHERE SourceProfileID = @sourceid OR TargetProfileID = @sourceid)
	DELETE FROM Profiles WHERE @sourceid = Profiles.ProfileID

IF NOT EXISTS (SELECT * FROM Relationships WHERE SourceProfileID = @targetid OR TargetProfileID = @targetid)
	DELETE FROM Profiles WHERE @targetid = Profiles.ProfileID

COMMIT TRANSACTION
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

-- changes went in Microsoft BizTalk Server 2004 SP1

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[InsertOrUpdateTpmName]
	@TpmName nvarchar(255),
	@WssName nvarchar(255),
	@TpmType int
AS

UPDATE TpmToWssMapping 
	SET TpmName = @TpmName,
	WssName = @WssName,
	TpmType = @TpmType
WHERE TpmName = @TpmName AND TpmType = @TpmType

IF (@@ROWCOUNT = 0)
	INSERT INTO TpmToWssMapping (TpmName, WssName, TpmType) VALUES (@TpmName, @WssName, @TpmType)

RETURN 0


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE [dbo].[DeleteTpmNameMapping]
	@TpmName nvarchar(255),
	@TpmType int
AS

DELETE FROM TpmToWssMapping WHERE TpmName = @TpmName AND TpmType = @TpmType

RETURN 0

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetWssNameFromTpmName] 
	@TpmName nvarchar(255),
	@TpmType int,
	@WssName nvarchar(255) OUTPUT
AS

SELECT @WssName = WssName FROM TpmToWssMapping WHERE TpmName = @TpmName AND TpmType = @TpmType

RETURN 0


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetGuidFromTpmName] 
	@TpmName nvarchar(255),
	@TpmType int,
	@ListGuid uniqueidentifier OUTPUT,
	@WebGuid uniqueidentifier OUTPUT
AS

SELECT @ListGuid = W.ListGuid, @WebGuid = W.WebGuid FROM TpmToWssMapping T 
INNER JOIN  NameToGUIDMap W on T.WssName = W.ListName
WHERE T.TpmName = @TpmName AND T.TpmType = @TpmType

RETURN 0


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

-- Re-sync feature fix for BizTalk Server 2004 SP1 ----

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE   PROCEDURE [dbo].[AnalyzeGroupLists] 
 @ParentWebId uniqueidentifier
AS
/* This stored proc returns all existing lists that match a Tpm group, or the Tpm groups for which we have to create a list */
/* We don't return existing lists that should be deleted because we cannot determine that right now. We delete a list
when its item from All Groups list is removed */

-- Return all child groups. The root of the group is a virtual group and it is not returned.
SELECT DISTINCT R.MemberName AS GroupName, NULL AS ListGuid 
FROM RelationsTpm R WHERE R.MemberType =1 AND R.MemberName NOT IN 
       (SELECT TTOW.TpmName FROM TpmToWssMapping TTOW INNER JOIN ListsSts L ON L.tp_Title = TTOW.WssName AND TTOW.TpmType = 1)

UNION

SELECT DISTINCT R.MemberName AS GroupName, L.tp_ID AS ListGuid 
FROM RelationsTpm R INNER JOIN TpmToWssMapping TTOW ON R.MemberName = TTOW.TpmName AND R.MemberType = TTOW.TpmType
INNER JOIN ListsSts L ON TTOW.WssName  = L.tp_Title AND L.tp_WebId=@ParentWebId
WHERE R.MemberType=1 

RETURN 0
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [dbo].[AnalyzeOutboxDocumentLibraries] 
AS
SELECT [Name] FROM BTServersTpm B
WHERE (B.[Name]) NOT IN 
	(SELECT TTOW.TpmName FROM TpmToWssMapping TTOW INNER JOIN ListsSts L ON L.tp_Title  = TTOW.WssName AND TTOW.TpmType='2')
RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [dbo].[AnalyzePartnersDocumentLibraries] 
AS
SELECT [Name] FROM MembersTpm WHERE MemberType=0 AND RTRIM(UPPER(CrossReference))<>N'SELF' AND [Name] NOT IN 
	(SELECT TTOW.TpmName FROM TpmToWssMapping TTOW INNER JOIN ListsSts L ON L.tp_Title  = TTOW.WssName AND TTOW.TpmType='0')
RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [dbo].[DeleteAgreement]
 (
  @agreementId NVARCHAR(255),
  @activeAgreementId NVARCHAR(255) output
 )
AS
 /* SET NOCOUNT ON */
 DECLARE @n AS INT
 DECLARE @state AS INT
 DECLARE @id AS UNIQUEIDENTIFIER
 DECLARE @cfgIds TABLE(id UNIQUEIDENTIFIER, processid UNIQUEIDENTIFIER)
 DECLARE @isTemplate BIT
 DECLARE @clonedAgreements TABLE(agreementId NVARCHAR(255))
 DECLARE @clonedAgreementId NVARCHAR(255)
 DECLARE @rc AS INT
 SET @isTemplate = 0
 SET @id = NULL

 -- Fetch agreement id and state
 SELECT @id = AgreementId, @state = State  FROM [dbo].[Agreements]
  WHERE [dbo].[Agreements].[Name] = @agreementId

 -- If agreement doesn't exists then delete fails
 IF @id IS NULL
  RETURN 1
  
 -- if agreement is active then delete fails
 IF @state & 1 = 1
  BEGIN
    SET @activeAgreementId = @agreementId
    RETURN 2
  END
  
 -- if agreement is template then delete all clones
 SELECT @isTemplate = [dbo].[IsTemplate](@agreementId)
 IF @isTemplate = 1
 BEGIN
  -- retrieve list of all cloned agreements
  INSERT INTO @clonedAgreements 
   SELECT [A].[Name] FROM [dbo].[Agreements] A
   JOIN [dbo].[Agreements] B ON [A].[TemplateAgreementId] = [B].[AgreementId]
   WHERE [B].[Name] = @agreementId
   
  -- return the list of all deleted cloned agreements
  SELECT * FROM @clonedAgreements

  -- loop over all cloned agreements and delete one by one
  SELECT @n = COUNT(*) FROM @clonedAgreements
  WHILE @n > 0
  BEGIN
   SELECT @clonedAgreementId = agreementId FROM @clonedAgreements
   EXEC @rc = [dbo].[DeleteAgreement] @clonedAgreementId, @activeAgreementId OUTPUT
   IF @rc <> 0
    RETURN @rc
   DELETE FROM @clonedAgreements WHERE agreementId = @clonedAgreementId
   SELECT @n = COUNT(*) FROM @clonedAgreements
  END
 END

 -- Save all process configids in order to know what process configs to delete after Addendums is deleted
 INSERT INTO @cfgIds
  SELECT [dbo].[ProcessConfig].[ProcessConfigId], [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[ProcessConfig] 
   JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId
 SELECT @n = COUNT(*) FROM @cfgIds
 
 -- AgreementsNames
 SELECT @n = COUNT(*) FROM [dbo].[AgreementsNames] 
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementsNames].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[AgreementsNames] 
   FROM [dbo].[AgreementsNames] 
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementsNames].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId
 
 -- AgreementLegalDocuments 
 SELECT @n = COUNT(*) FROM [dbo].[AgreementLegalDocuments]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementLegalDocuments].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[AgreementLegalDocuments]
   FROM [dbo].[AgreementLegalDocuments]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementLegalDocuments].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId
  
 -- AddendumNames
 SELECT @n = COUNT(*) FROM [dbo].[AddendumNames] 
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AddendumId] = [dbo].[AddendumNames].[AddendumId]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[AddendumNames]
   FROM [dbo].[AddendumNames] 
   JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AddendumId] = [dbo].[AddendumNames].[AddendumId]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId

 -- LegalDocuments  
 SELECT @n = COUNT(*) FROM [dbo].[LegalDocuments] 
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AddendumId] = [dbo].[LegalDocuments].[AddendumId]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[LegalDocuments]
   FROM [dbo].[LegalDocuments] 
   JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AddendumId] = [dbo].[LegalDocuments].[AddendumId]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId

 -- Parameters  
 SELECT @n = COUNT(*) FROM [dbo].[Parameters] 
  JOIN [dbo].[Policies] ON [dbo].[Policies].[PolicyId] = [dbo].[Parameters].[PolicyId]
  JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[Parameters] 
   FROM [dbo].[Parameters] 
   JOIN [dbo].[Policies] ON [dbo].[Policies].[PolicyId] = [dbo].[Parameters].[PolicyId]
   JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
   JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId
  
 -- Policies
 SELECT @n = COUNT(*) FROM [dbo].[Policies]
  JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[Policies]
   FROM [dbo].[Policies]
   JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
   JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId
  
 -- ActorRoles
 SELECT @n = COUNT(*) FROM [dbo].[ActorRoles] 
  JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[ActorRoles].[ProcessConfigId]
  JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[ActorRoles] 
   FROM [dbo].[ActorRoles] 
   JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[ActorRoles].[ProcessConfigId]
   JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId
 
 -- Addendums
 SELECT @n = COUNT(*) FROM [dbo].[Addendums]
  JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[Addendums]
   FROM [dbo].[Addendums]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
   WHERE [dbo].[Agreements].[Name] = @agreementId
 
 -- ProcessConfig
 SELECT @n = COUNT(*) FROM @cfgIds
 IF @n > 0
  DELETE FROM [dbo].[ProcessConfig]
   WHERE [dbo].[ProcessConfig].[ProcessConfigId] IN (SELECT id FROM @cfgIds)
   
 -- Processes. Delete process entries which are not referenced any more
 
 -- Policy templates
 DELETE FROM [dbo].[PolicyTemplates] WHERE (([dbo].[PolicyTemplates].[ProcessId] IN (SELECT [A].[processid] FROM @cfgIds A)) AND 
  ([dbo].[PolicyTemplates].[ProcessId] NOT IN (SELECT DISTINCT [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[ProcessConfig])))
 
 -- ProcessRoles
 DELETE FROM [dbo].[ProcessRoles] WHERE (([dbo].[ProcessRoles].[ProcessId] IN (SELECT [A].[processid] FROM @cfgIds A)) AND 
  ([dbo].[ProcessRoles].[ProcessId] NOT IN (SELECT DISTINCT [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[ProcessConfig])))
 
 -- Processes 
 DELETE FROM [dbo].[Processes] WHERE (([dbo].[Processes].[ProcessId] IN (SELECT [A].[processid] FROM @cfgIds A)) AND 
  ([dbo].[Processes].[ProcessId] NOT IN (SELECT DISTINCT [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[ProcessConfig])))
 
 -- Agreements
 SELECT @n = COUNT(*) FROM [dbo].[Agreements]
  WHERE [dbo].[Agreements].[Name] = @agreementId
 IF @n > 0
  DELETE [dbo].[Agreements]
   WHERE [dbo].[Agreements].[Name] = @agreementId

 RETURN 0

GO

CREATE PROCEDURE [dbo].[GetActorAgreements]
	(
		@ActorId NVARCHAR(256),
		@ActorType INT
	)
AS
	/* SET NOCOUNT ON */
	SELECT DISTINCT [dbo].[Agreements].[Name], [dbo].[Agreements].[State], [TemplateAgreement].[Name] TemplateName, TemplateAgreement.State TemplateState
	FROM [dbo].[Agreements] 
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AgreementId] = [dbo].[Agreements].[AgreementId]
		JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Addendums].[ProcessConfigId]
		JOIN [dbo].[ActorRoles] ON [dbo].[ActorRoles].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
		LEFT OUTER JOIN [dbo].[Agreements] TemplateAgreement ON [dbo].[Agreements].[TemplateAgreementId] = [TemplateAgreement].[AgreementId]
		WHERE [dbo].[ActorRoles].[ActorId] = @ActorId AND [dbo].[ActorRoles].[ActorType] = @ActorType
	RETURN 

GO

CREATE PROCEDURE [dbo].[GetNonInheritedActorAgreements]
	(
		@ActorId NVARCHAR(256),
		@ActorType INT
	)
AS
	/* SET NOCOUNT ON */
	SELECT DISTINCT [dbo].[Agreements].[Name], State
		FROM [dbo].[Agreements]
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AgreementId] = [dbo].[Agreements].[AgreementId]
		JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Addendums].[ProcessConfigId]
		JOIN [dbo].[ActorRoles] ON [dbo].[ActorRoles].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
		WHERE [dbo].[ActorRoles].[ActorId] = @ActorId AND [dbo].[ActorRoles].[ActorType] = @ActorType
		AND [TemplateAgreementId] IS NULL
	RETURN
GO

CREATE PROCEDURE [dbo].[GetAgreementList]
AS
	/* SET NOCOUNT ON */
	SELECT [Name], [Description], [State] FROM [dbo].[Agreements]
	RETURN 
GO

--- <summary>
--- Saves name and associates it with given addendum
--- </summary>
--- <param name="AddendumId">Internal unique identifier of addendum</param>
--- <param name="Name">friendly addendum name</param>
--- <returns></returns>
CREATE PROCEDURE [dbo].[SaveAddendumName]
	(
		@AddendumId UNIQUEIDENTIFIER,
		@Name NVARCHAR(255)
	)
AS
	/* SET NOCOUNT ON */
	INSERT INTO [dbo].[AddendumNames](AddendumId, Name)
	VALUES(@AddendumId, @Name)
	RETURN 
GO

CREATE PROCEDURE [dbo].[ShallowDeleteAgreement]
	(
		@agreementId NVARCHAR(255)
	)
AS
	/* SET NOCOUNT ON */
	DECLARE @n AS INT
	DECLARE @id AS UNIQUEIDENTIFIER
	DECLARE @cfgIds TABLE(id UNIQUEIDENTIFIER, processid UNIQUEIDENTIFIER)
	SET @id = NULL

	-- Fetch agreement id and state
	SELECT @id = AgreementId FROM [dbo].[Agreements]
		WHERE [dbo].[Agreements].[Name] = @agreementId

	-- If agreement doesn't exists then delete fails
	IF @id IS NULL
		RETURN 1
		
	-- Save all process configids in order to know what process configs to delete after Addendums is deleted
	INSERT INTO @cfgIds
		SELECT [dbo].[ProcessConfig].[ProcessConfigId], [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[ProcessConfig] 
			JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId
	SELECT @n = COUNT(*) FROM @cfgIds
	
	-- AgreementsNames
	SELECT @n = COUNT(*) FROM [dbo].[AgreementsNames] 
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementsNames].[AgreementId]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[AgreementsNames] 
			FROM [dbo].[AgreementsNames] 
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementsNames].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId
	
	-- AgreementLegalDocuments	
	SELECT @n = COUNT(*) FROM [dbo].[AgreementLegalDocuments]
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementLegalDocuments].[AgreementId]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[AgreementLegalDocuments]
			FROM [dbo].[AgreementLegalDocuments]
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[AgreementLegalDocuments].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId
		
	-- AddendumNames
	SELECT @n = COUNT(*) FROM [dbo].[AddendumNames] 
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AddendumId] = [dbo].[AddendumNames].[AddendumId]
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[AddendumNames] 
			FROM [dbo].[AddendumNames] 
			JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AddendumId] = [dbo].[AddendumNames].[AddendumId]
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId

	-- LegalDocuments		
	SELECT @n = COUNT(*) FROM [dbo].[LegalDocuments] 
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AddendumId] = [dbo].[LegalDocuments].[AddendumId]
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[LegalDocuments] 
			FROM [dbo].[LegalDocuments] 
			JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AddendumId] = [dbo].[LegalDocuments].[AddendumId]
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId

	-- Parameters		
	SELECT @n = COUNT(*) FROM [dbo].[Parameters] 
		JOIN [dbo].[Policies] ON [dbo].[Policies].[PolicyId] = [dbo].[Parameters].[PolicyId]
		JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[Parameters] 
			FROM [dbo].[Parameters] 
			JOIN [dbo].[Policies] ON [dbo].[Policies].[PolicyId] = [dbo].[Parameters].[PolicyId]
			JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
			JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId
		
	-- Policies
	SELECT @n = COUNT(*) FROM [dbo].[Policies]
		JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[Policies]
			FROM [dbo].[Policies]
			JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Policies].[ProcessConfigId]
			JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId
		
	-- ActorRoles
	SELECT @n = COUNT(*) FROM [dbo].[ActorRoles] 
		JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[ActorRoles].[ProcessConfigId]
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[ActorRoles] 
			FROM [dbo].[ActorRoles] 
			JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[ActorRoles].[ProcessConfigId]
			JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId
	
	-- Addendums
	SELECT @n = COUNT(*) FROM [dbo].[Addendums]
		JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[Addendums]
			FROM [dbo].[Addendums]
			JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId]
			WHERE [dbo].[Agreements].[Name] = @agreementId
	
	-- ProcessConfig
	SELECT @n = COUNT(*) FROM @cfgIds
	IF @n > 0
		DELETE FROM [dbo].[ProcessConfig]
			WHERE [dbo].[ProcessConfig].[ProcessConfigId] IN (SELECT id FROM @cfgIds)
	
	-- Processes. Delete process entries which are not referenced any more
	
	-- Policy templates
	DELETE FROM [dbo].[PolicyTemplates] WHERE (([dbo].[PolicyTemplates].[ProcessId] IN (SELECT [A].[processid] FROM @cfgIds A)) AND 
		([dbo].[PolicyTemplates].[ProcessId] NOT IN (SELECT DISTINCT [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[ProcessConfig])))
	
	-- ProcessRoles
	DELETE FROM [dbo].[ProcessRoles] WHERE (([dbo].[ProcessRoles].[ProcessId] IN (SELECT [A].[processid] FROM @cfgIds A)) AND 
		([dbo].[ProcessRoles].[ProcessId] NOT IN (SELECT DISTINCT [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[ProcessConfig])))
	
	-- Processes	
	DELETE FROM [dbo].[Processes] WHERE (([dbo].[Processes].[ProcessId] IN (SELECT [A].[processid] FROM @cfgIds A)) AND 
		([dbo].[Processes].[ProcessId] NOT IN (SELECT DISTINCT [dbo].[ProcessConfig].[ProcessId] FROM [dbo].[ProcessConfig])))
	

	-- Agreements
	SELECT @n = COUNT(*) FROM [dbo].[Agreements]
		WHERE [dbo].[Agreements].[Name] = @agreementId
	IF @n > 0
		DELETE [dbo].[Agreements]
			WHERE [dbo].[Agreements].[Name] = @agreementId

	RETURN 0

GO
 
CREATE PROCEDURE [dbo].[GetParameterValue]
 (
  @process NVARCHAR(255),
  @serviceLink NVARCHAR(255),
  @parameter NVARCHAR(255),
  @partner NVARCHAR(128)
 )
AS
 /* SET NOCOUNT ON */
SELECT [Parameters].[XQuery]
FROM [dbo].[Parameters] 
INNER JOIN [dbo].[Policies] ON [Policies].[PolicyId] = [dbo].[Parameters].[PolicyId] 
INNER JOIN [dbo].[PolicyTemplates] ON [PolicyTemplates].[PolicyTemplateId] = [Policies].[PolicyTemplateId] 
INNER JOIN [dbo].[Processes] ON [Processes].[ProcessId] = [PolicyTemplates].[ProcessId] 
INNER JOIN [dbo].[ProcessConfig] AS G ON [G].[ProcessConfigId] = [Policies].[ProcessConfigId]
INNER JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessId] = [Processes].[ProcessId] 
INNER JOIN [dbo].[ProcessRoles] ON [dbo].[ProcessRoles].[ProcessId] = [Processes].[ProcessId] 
INNER JOIN [dbo].[ActorRoles] ON [dbo].[ActorRoles].[ProcessRoleId] = [ProcessRoles].[ProcessRoleId] 
INNER JOIN [dbo].[ActorRoles] AS AR ON [AR].[ProcessConfigId] = [ProcessConfig].[ProcessConfigId] 
WHERE ([dbo].[Processes].[BusinessProcessName] = @process) 
AND ([dbo].[Processes].[ServiceLinkName] = @serviceLink) 
AND ([dbo].[ActorRoles].[ActorId] = @partner)
AND ([dbo].[PolicyTemplates].[name] = @parameter)
AND ([dbo].[ProcessConfig].[ProcessConfigId] = [G].[ProcessConfigId])
AND (([dbo].[ActorRoles].[ActorId] = [AR].[ActorId]) AND ([ActorRoles].[ProcessConfigId] = [AR].[ProcessConfigId]))

RETURN
GO

CREATE PROCEDURE [dbo].[SaveAgreement]
	(
		@AgreementId NVARCHAR(255),
		@TemplateAgreementId NVARCHAR(255),
		@Description NVARCHAR(255),
		@AgreementDate DATETIME,
		@DurationStartDate DATETIME,
		@DurationEndDate DATETIME,
		@State SMALLINT,
		@LastModified DATETIME,
		@Create BIT,
		@id UNIQUEIDENTIFIER OUTPUT
	)
AS
	/* SET NOCOUNT ON */
	DECLARE @ret INT
	DECLARE @oldLastModified DATETIME
	DECLARE @templateId UNIQUEIDENTIFIER
	SET @ret = 0
	SET @oldLastModified = NULL
	SET @id = NULL
	SET @templateId = NULL

	-- Get agreement id
	SET @id = NULL
	SELECT @id = [AgreementId], @oldLastModified =  [LastModified] 
		FROM [dbo].[Agreements] 
		WHERE [dbo].[Agreements].[Name] = @AgreementId
	
	IF @Create = 1 
	BEGIN
		-- Create fails if agreement exists
		IF @id IS NOT NULL
			RETURN -1
	
		-- Generate GUID for new agreement	
		SELECT @id = NEWID()
	END
	ELSE
	BEGIN
		-- Update fails if agreement doesn't exists
		IF @id IS NULL
			RETURN -2

		-- Update fails if concurrecy is violated
		IF @oldLastModified < @LastModified
			RETURN -3

		-- Update by recreating
		EXECUTE @ret = [dbo].[ShallowDeleteAgreement] @AgreementId
	END
	
	-- Get template this agreement is based on
	IF @TemplateAgreementId IS NOT NULL
		SELECT @templateId = [AgreementId] FROM [dbo].[Agreements]
			WHERE [Name] = @TemplateAgreementId
		
	-- Create agreement
	INSERT INTO [dbo].[Agreements](AgreementId, Name, Description, Date, 
		StartDate, EndDate, State, LastModified, TemplateAgreementId)
	VALUES(@id, @AgreementId, @Description, @AgreementDate, 
		@DurationStartDate, @DurationEndDate, @State, GETDATE(), @templateId)
	RETURN

GO

--- <summary>
--- Saves body of legal document and associates it with given agreement
--- </summary>
--- <param name="AgreemnetId">Internal agreement identifier</param>
--- <param name="Body">Document content (in XTML)</param>
--- <returns></returns>
CREATE PROCEDURE [dbo].[SaveAgreementLegalText]
	(
		@AgreementId UNIQUEIDENTIFIER,
		@LegalText NTEXT,
		@Format NVARCHAR(16)
	)
AS
	/* SET NOCOUNT ON */
	DECLARE @n INT
	SELECT @n = COUNT(*) FROM [dbo].[AgreementLegalDocuments] WHERE [AgreementId] = @AgreementId
	IF @n = 0
		INSERT INTO [dbo].[AgreementLegalDocuments](AgreementId, Body, Format)
		VALUES(@AgreementId, @LegalText, @Format)
	ELSE
		UPDATE [dbo].[AgreementLegalDocuments] SET [Body] = @LegalText
		WHERE [AgreementId] = @AgreementId
	RETURN 

GO

CREATE PROCEDURE [dbo].[SaveAgreementName]
	(
		@AgreementId UNIQUEIDENTIFIER,
		@Name NVARCHAR(255)
	)
AS
	/* SET NOCOUNT ON */
	INSERT INTO [dbo].[AgreementsNames](AgreementId, Name)
	VALUES(@AgreementId, @Name)
	RETURN 

GO

--- <summary>
--- Saves body of legal document and associates it with given addendum
--- </summary>
--- <param name="AddendumId">Internal addnedum identifier</param>
--- <param name="Body">Document content (in XTML)</param>
--- <returns></returns>
CREATE PROCEDURE [dbo].[SaveLegalText]
	(
		@AddendumId UNIQUEIDENTIFIER,
		@LegalText NTEXT,
		@Format NVARCHAR(16)
	)
AS
	/* SET NOCOUNT ON */
	DECLARE @n INT
	SELECT @n = COUNT(*) FROM [dbo].[LegalDocuments] WHERE [AddendumId] = @AddendumId
	IF @n = 0
		INSERT INTO [dbo].[LegalDocuments](AddendumId, Body, Format)
		VALUES(@AddendumId, @LegalText, @Format)
	ELSE
		UPDATE [dbo].[LegalDocuments]	SET [Body] = @LegalText
		WHERE [AddendumId] = @AddendumId
	RETURN 

GO

CREATE PROCEDURE [dbo].[GetPartnerEnlistments]
   (
      @partnerID NVARCHAR(128)
   )
AS
   /* SET NOCOUNT ON */
   SELECT [Processes].[DefinitionSource],
      [Processes].[BusinessProcessName],
      [Processes].[ServiceLinkName],
      [ProcessRoles].[Name],
      [Agreements].[Name] AS AgreementName
   FROM [dbo].[Processes] 
   JOIN [dbo].[ProcessRoles] ON [dbo].[ProcessRoles].[ProcessId] = [dbo].[Processes].[ProcessId]
   JOIN [dbo].[ActorRoles] ON [dbo].[ActorRoles].[ProcessRoleId] = [dbo].[ProcessRoles].[ProcessRoleId]
   JOIN [dbo].[ProcessConfig] ON [dbo].[ActorRoles].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
   JOIN [dbo].[Addendums] ON [dbo].[Addendums].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
   JOIN [dbo].[Agreements] ON [dbo].[Agreements].[AgreementId] = [dbo].[Addendums].[AgreementId] 
   WHERE [ActorRoles].[ActorId] = @partnerID AND 
      [Agreements].[State] = 1 AND 
      [ActorRoles].[ActorType] = 0 AND 
      [ActorRoles].[Self] = 0

UNION 
   SELECT [SendPorts].[DefinitionSource] AS DefinitionSource,
      [SendPorts].[ServiceName] AS BusinessProcessName,
      [SendPorts].[ServiceLinkName] AS ServiceLinkName,
      [SendPorts].[Role] AS Name,
      [SendPorts].[AgreementName] AS AgreementName
   FROM [dbo].[SendPorts]
   WHERE [PartnerId] = @partnerID
   RETURN
GO
CREATE PROCEDURE [dbo].[DeleteSendPort]
	(
		@Name nvarchar (256),
		@PartnerId nvarchar(128)
	)
AS
	/* SET NOCOUNT ON */
	DELETE FROM [dbo].[SendPorts] 
		WHERE [Name] = @Name AND [PartnerId] = @PartnerId
	RETURN 
GO


CREATE PROCEDURE [dbo].[GetPartnerSendPorts]
 (
	@PartnerId NVARCHAR(128),
	@AgreementId NVARCHAR(255)
 )
AS
	/* SET NOCOUNT ON */
	SELECT [Name], 
		[GlobalPortName], 
		[EncryptionCert_LongName], 
		[EncryptionCert_ShortName], 
		[EncryptionCert_Thumbprint], 
		[PrimaryTransport_UsageType], 
		[PrimaryTransport_Address], 
		[PrimaryTransport_RetryCount], 
		[PrimaryTransport_RetryInterval], 
		[PrimaryTransport_TransportType_Name], 
		[PrimaryTransport_TransportType_Capabilities], 
		[PrimaryTransport_TransportType_GUID], 
		[PrimaryTransport_ServiceWindowEnabled], 
		[PrimaryTransport_FromTime], 
		[PrimaryTransport_ToTime], 
		[Sendpipeline_FullyQualifiedName], 
		[Sendpipeline_Name], 
		[Sendpipeline_Type] ,
		[Receivepipeline_FullyQualifiedName], 
		[Receivepipeline_Name], 
		[Receivepipeline_Type] ,
		[SoapAuthenticationCertificate]
	FROM [dbo].[SendPorts]
	WHERE [dbo].[SendPorts].[PartnerId] = @PartnerId
	AND [dbo].[SendPorts].[AgreementName] = @AgreementId
	RETURN
GO

CREATE PROCEDURE [dbo].[SaveSendPort]
	(
		@Name nvarchar (256),
		@GlobalPortName nvarchar(256),
		@PartnerId nvarchar(128),
		@AgreementName nvarchar(255),
		@DefinitionSource nvarchar(430),
		@ServiceName nvarchar(255),
		@ServiceLinkName nvarchar(255),
		@Role nvarchar(255),
		@EncryptionCert_LongName nvarchar (256),
		@EncryptionCert_ShortName nvarchar (256),
		@EncryptionCert_Thumbprint nvarchar (256),
		@PrimaryTransport_UsageType nvarchar (50),
		@PrimaryTransport_Address nvarchar (256),
		@PrimaryTransport_RetryCount int,
		@PrimaryTransport_RetryInterval int,
		@PrimaryTransport_TransportType_Name nvarchar (256),
		@PrimaryTransport_TransportType_Capabilities int,
		@PrimaryTransport_TransportType_GUID uniqueidentifier,
		@PrimaryTransport_ServiceWindowEnabled bit,
		@PrimaryTransport_FromTime datetime,
		@PrimaryTransport_ToTime datetime,
		@Sendpipeline_FullyQualifiedName ntext,
		@Sendpipeline_Name ntext,
		@Sendpipeline_Type nchar (16),
		@Receivepipeline_FullyQualifiedName ntext,
		@Receivepipeline_Name ntext,
		@Receivepipeline_Type nchar (16) ,
		@SoapAuthenticationCertificate nvarchar (256)
	)
AS
	/* SET NOCOUNT ON */
	IF EXISTS(SELECT [Name] FROM [dbo].[SendPorts] WHERE [Name] = @Name AND [PartnerId] = @PartnerId)
		RETURN
		
	INSERT INTO [dbo].[SendPorts](Name, 
		GlobalPortName,
		PartnerId,
		AgreementName,
		DefinitionSource,
		ServiceName,
		ServiceLinkName,
		Role,
		EncryptionCert_LongName, 
		EncryptionCert_ShortName, 
		EncryptionCert_Thumbprint, 
		PrimaryTransport_UsageType, 
		PrimaryTransport_Address, 
		PrimaryTransport_RetryCount, 
		PrimaryTransport_RetryInterval, 
		PrimaryTransport_TransportType_Name, 
		PrimaryTransport_TransportType_Capabilities, 
		PrimaryTransport_TransportType_GUID, 
		PrimaryTransport_ServiceWindowEnabled, 
		PrimaryTransport_FromTime, 
		PrimaryTransport_ToTime, 
		Sendpipeline_FullyQualifiedName, 
		Sendpipeline_Name, 
		Sendpipeline_Type,
		Receivepipeline_FullyQualifiedName, 
		Receivepipeline_Name, 
		Receivepipeline_Type,
		SoapAuthenticationCertificate)
	VALUES(@Name, 
		@GlobalPortName,
		@PartnerId,
		@AgreementName,
		@DefinitionSource,
		@ServiceName,
		@ServiceLinkName,
		@Role,
		@EncryptionCert_LongName, 
		@EncryptionCert_ShortName, 
		@EncryptionCert_Thumbprint, 
		@PrimaryTransport_UsageType, 
		@PrimaryTransport_Address, 
		@PrimaryTransport_RetryCount, 
		@PrimaryTransport_RetryInterval, 
		@PrimaryTransport_TransportType_Name, 
		@PrimaryTransport_TransportType_Capabilities, 
		@PrimaryTransport_TransportType_GUID, 
		@PrimaryTransport_ServiceWindowEnabled, 
		@PrimaryTransport_FromTime, 
		@PrimaryTransport_ToTime, 
		@Sendpipeline_FullyQualifiedName, 
		@Sendpipeline_Name, 
		@Sendpipeline_Type,
		@Receivepipeline_FullyQualifiedName, 
		@Receivepipeline_Name, 
		@Receivepipeline_Type,
		@SoapAuthenticationCertificate)
	RETURN
GO

CREATE PROCEDURE [dbo].[UpdateSendPort]
	(
		@GlobalPortName nvarchar(256),
		@PartnerId nvarchar(128),
		@EncryptionCert_LongName nvarchar (256),
		@EncryptionCert_ShortName nvarchar (256),
		@EncryptionCert_Thumbprint nvarchar (256),
		@PrimaryTransport_UsageType nvarchar (50),
		@PrimaryTransport_Address nvarchar (256),
		@PrimaryTransport_RetryCount int,
		@PrimaryTransport_RetryInterval int,
		@PrimaryTransport_TransportType_Name nvarchar (256),
		@PrimaryTransport_TransportType_Capabilities int,
		@PrimaryTransport_TransportType_GUID uniqueidentifier,
		@PrimaryTransport_ServiceWindowEnabled bit,
		@PrimaryTransport_FromTime datetime,
		@PrimaryTransport_ToTime datetime,
		@Sendpipeline_FullyQualifiedName ntext,
		@Sendpipeline_Name ntext,
		@Sendpipeline_Type nchar (16) ,
		@Receivepipeline_FullyQualifiedName ntext,
		@Receivepipeline_Name ntext,
		@Receivepipeline_Type nchar (16) ,
		@SoapAuthenticationCertificate nvarchar (256)
	)
AS
	/* SET NOCOUNT ON */
	UPDATE [dbo].[SendPorts]
	SET [EncryptionCert_LongName] = @EncryptionCert_LongName,
		[EncryptionCert_ShortName] = @EncryptionCert_ShortName,
		[EncryptionCert_Thumbprint] = @EncryptionCert_Thumbprint,
		[PrimaryTransport_UsageType] = @PrimaryTransport_UsageType, 
		[PrimaryTransport_Address] = @PrimaryTransport_Address,
		[PrimaryTransport_RetryCount] = @PrimaryTransport_RetryCount,
		[PrimaryTransport_RetryInterval] = @PrimaryTransport_RetryInterval,
		[PrimaryTransport_TransportType_Name] = @PrimaryTransport_TransportType_Name,
		[PrimaryTransport_TransportType_Capabilities] = @PrimaryTransport_TransportType_Capabilities,
		[PrimaryTransport_TransportType_GUID] = @PrimaryTransport_TransportType_GUID,
		[PrimaryTransport_ServiceWindowEnabled] = @PrimaryTransport_ServiceWindowEnabled,
		[PrimaryTransport_FromTime] = @PrimaryTransport_FromTime,
		[PrimaryTransport_ToTime] = @PrimaryTransport_ToTime,
		[Sendpipeline_FullyQualifiedName] = @Sendpipeline_FullyQualifiedName,
		[Sendpipeline_Name] = @Sendpipeline_Name,
		[Sendpipeline_Type] = @Sendpipeline_Type ,
		[Receivepipeline_FullyQualifiedName] = @Receivepipeline_FullyQualifiedName,
		[Receivepipeline_Name] = @Receivepipeline_Name,
		[Receivepipeline_Type] = @Receivepipeline_Type ,
		[SoapAuthenticationCertificate] = @SoapAuthenticationCertificate 
	WHERE [GlobalPortName] = @GlobalPortName AND [PartnerId] = @PartnerId
GO

CREATE PROCEDURE [dbo].[GetSendPortsByGlobalPortName]
	(
		@PartnerId NVARCHAR(128),
		@GlobalPortName NVARCHAR(256)
	)
AS
	/* SET NOCOUNT ON */
	SELECT [Name]
		FROM [dbo].[SendPorts]
		WHERE [PartnerId] = @PartnerId AND [GlobalPortName] = @GlobalPortName
	RETURN
GO

CREATE PROCEDURE [dbo].[GetAddendumSendPorts]
	(
		@PartnerId NVARCHAR(128),
		@AgreementName NVARCHAR(255),
		@DefinitionSource NVARCHAR(430),
		@ServiceLinkName NVARCHAR(255),
		@Role NVARCHAR(255)
	)
AS
	/* SET NOCOUNT ON */
	SELECT [Name]
	FROM [dbo].[SendPorts]
	WHERE [PartnerId] = @PartnerId
	  AND [AgreementName] = @AgreementName
	  AND [DefinitionSource] = @DefinitionSource
	  AND [ServiceLinkName] = @ServiceLinkName
	  AND [Role] = @Role
	RETURN
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

-----------------------------------------------------------------------------
-- Delete specified data object (table).  This includes the following:
--     For each member (column) in this table, delete the member.
--     Delete the entry in the object (table) table referring to this object.
--     Delete any entries in the partition table referring to this object.
-----------------------------------------------------------------------------
CREATE PROCEDURE sp_DelDataObject
    @u_cat_name nvarchar(128),
    @u_src_name nvarchar(128),
    @u_tbl_name nvarchar(128)
AS
    SET NOCOUNT ON

    DECLARE   @childmember   	nvarchar(128)
    
    DECLARE curs_childmembers CURSOR FOR
       SELECT ColDefName FROM ColDef WHERE 
              CatalogName = @u_cat_name AND TblDefName = @u_tbl_name

    -- Unmap the properties that use this data member
    OPEN curs_childmembers
    FETCH NEXT FROM curs_childmembers INTO @childmember
    WHILE (@@FETCH_STATUS = 0) BEGIN
         -- Call sp_DelDataObject to remove this child data member
         -- This wil also clean up any profiles that are currently mapped to this member
         EXECUTE sp_DelDataMember @u_cat_name, @u_tbl_name, @childmember
      
         FETCH NEXT FROM curs_childmembers INTO @childmember
    END

    CLOSE curs_childmembers
    DEALLOCATE curs_childmembers

    -- Delete the table entry.

    DELETE FROM TableDef
        WHERE CatalogName = @u_cat_name AND
              SourceDefName = @u_src_name AND
              TableDefName = @u_tbl_name
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [dbo].[sp_DeployPartner]
    @partnerId nvarchar(128),
    @bizTalkName nvarchar(128)
AS

DECLARE @result int
DECLARE @bizTalkId uniqueidentifier
SELECT @result = -1

IF NOT EXISTS(SELECT [dbo].[DeployedPartners].[PartnerId]
                  FROM [dbo].[DeployedPartners]
                  WHERE [dbo].[DeployedPartners].[PartnerId] = @partnerId)
   BEGIN
      SET @bizTalkId = (SELECT [dbo].[BizTalkServer].[BizTalkServerId] FROM [dbo].[BizTalkServer] WHERE [dbo].[BizTalkServer].[Name] = @bizTalkName)

      IF @bizTalkId IS NOT NULL
         BEGIN
            INSERT INTO [dbo].[DeployedPartners] (PartnerId, BizTalkServerId)
            VALUES(@partnerId, @bizTalkId)
            SELECT @result = 1
         END
   END

SELECT @result Result
GO

CREATE PROCEDURE [dbo].[sp_UndeployPartner]
    @partnerId nvarchar(128)
AS
SELECT [Name], Server, DatabaseName
FROM [dbo].[BizTalkServer] INNER JOIN [dbo].[DeployedPartners] ON ([dbo].[BizTalkServer].[BizTalkServerId] = [dbo].[DeployedPartners].[BizTalkServerId])
WHERE [dbo].[DeployedPartners].[PartnerId] = @partnerId

DELETE FROM [dbo].[DeployedPartners]
WHERE [dbo].[DeployedPartners].[PartnerId] = @partnerId
GO

CREATE PROCEDURE [dbo].[sp_GetPartnersFromBizTalkRegistration]
    @bizTalkRegistrationName nvarchar(128)
AS

SELECT [DeployedPartners].[PartnerId]
FROM [dbo].[BizTalkServer] INNER JOIN [dbo].[DeployedPartners] ON ([dbo].[BizTalkServer].[BizTalkServerId] = [dbo].[DeployedPartners].[BizTalkServerId])
WHERE [dbo].[BizTalkServer].[Name] = @bizTalkRegistrationName
GO

CREATE PROCEDURE [dbo].[GetInheritedActorAgreements]
	(
		@ActorId NVARCHAR(256),
		@ActorType INT
	)
AS
	/* SET NOCOUNT ON */
	SELECT DISTINCT [A].Name, [B].[State] TemplateState FROM [dbo].[Agreements] A
		JOIN [dbo].[Addendums] ON [dbo].[Addendums].[AgreementId] = [A].[AgreementId]
		JOIN [dbo].[ProcessConfig] ON [dbo].[ProcessConfig].[ProcessConfigId] = [dbo].[Addendums].[ProcessConfigId]
		JOIN [dbo].[ActorRoles] ON [dbo].[ActorRoles].[ProcessConfigId] = [dbo].[ProcessConfig].[ProcessConfigId]
		JOIN [dbo].[Agreements] B ON [A].[TemplateAgreementId] = [B].[AgreementId]
		WHERE [dbo].[ActorRoles].[ActorId] = @ActorId AND [dbo].[ActorRoles].[ActorType] = @ActorType
	RETURN
GO

CREATE PROCEDURE [dbo].[GetAgreementsFromTemplate]
	(
		@agreementId NVARCHAR(255)
	)
AS
	SET NOCOUNT ON
	SELECT [A].[Name] FROM [dbo].[Agreements] A
	JOIN [dbo].[Agreements] B ON [A].[TemplateAgreementId] = [B].[AgreementId]
	WHERE [B].[Name] = @agreementId
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_GetRoles]
    @profilekey nvarchar(128),
    @profiletype nvarchar(128),
    @roletype nvarchar(128),
    @rolerelationship nvarchar(128)
AS

SET NOCOUNT ON
DECLARE @level int, @line char(200)
CREATE TABLE #stack (profilekey nvarchar(128), profiletype nvarchar(128), level int)
INSERT INTO #stack VALUES (@profilekey, @profiletype, 1)
SELECT @level = 1

WHILE @level > 0
BEGIN
   IF EXISTS (SELECT * FROM #stack WHERE level = @level)
      BEGIN
	 INSERT #stack
	    SELECT DISTINCT Target.ProfileKey, Target.ProfileType, @level + 1
	    FROM Relationships INNER JOIN Profiles Source ON (Source.ProfileID = Relationships.SourceProfileID)
	       INNER JOIN Profiles Target ON (Target.ProfileID = Relationships.TargetProfileID)
	       INNER JOIN #stack ON (#stack.profilekey = Source.ProfileKey AND #stack.profiletype = Source.ProfileType)
	    WHERE Target.ProfileType = @roletype
	       AND Relationships.Relationship = @rolerelationship
	       AND #stack.level = @level
                    AND NOT EXISTS (SELECT * FROM #stack s1 WHERE Target.ProfileKey = s1.profilekey AND Target.ProfileType = s1.profiletype)
         IF @@ROWCOUNT > 0
            SELECT @level = @level + 1
	 ELSE
	    SELECT @level = -1
      END
END -- WHILE
SET NOCOUNT OFF
SELECT #stack.profilekey FROM #stack WHERE level <> 1
DROP TABLE #stack
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_GetRelatedProfiles]
    @profilekey nvarchar(128),
    @profiletype nvarchar(128),
    @relationship nvarchar(128)
AS

SELECT Target.ProfileKey, Target.ProfileType
FROM Relationships INNER JOIN Profiles Source ON (Source.ProfileID = Relationships.SourceProfileID)
   INNER JOIN Profiles Target ON (Target.ProfileID = Relationships.TargetProfileID)
WHERE Source.ProfileKey = @profilekey
   AND Source.ProfileType = @profiletype
   AND Relationships.Relationship = @relationship
ORDER BY Target.ProfileType,Target.ProfileKey

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_IsInRole]
    @profilekey nvarchar(128),
    @profiletype nvarchar(128),
    @role nvarchar(128),
    @roletype nvarchar(128),
    @rolerelationship nvarchar(128)
AS

SET NOCOUNT ON
DECLARE @level int
DECLARE @result bit
CREATE TABLE #stack (profilekey nvarchar(128), profiletype nvarchar(128), level int)
INSERT INTO #stack VALUES (@profilekey, @profiletype, 1)
SELECT @level = 1
SELECT @result = 0

WHILE @level > 0
BEGIN
   IF EXISTS (SELECT * FROM #stack WHERE level = @level)
      BEGIN
	 INSERT #stack
	    SELECT DISTINCT Target.ProfileKey, Target.ProfileType, @level + 1
	    FROM Relationships INNER JOIN Profiles Source ON (Source.ProfileID = Relationships.SourceProfileID)
	       INNER JOIN Profiles Target ON (Target.ProfileID = Relationships.TargetProfileID)
	       INNER JOIN #stack ON (#stack.profilekey = Source.ProfileKey AND #stack.profiletype = Source.ProfileType)
	    WHERE Target.ProfileType = @roletype
	       AND Relationships.Relationship = @rolerelationship
	       AND #stack.level = @level
                    AND NOT EXISTS (SELECT * FROM #stack s1 WHERE Target.ProfileKey = s1.profilekey AND Target.ProfileType = s1.profiletype)
         IF @@ROWCOUNT > 0
	    BEGIN

	       IF EXISTS(SELECT * FROM #stack WHERE profilekey = @role AND profiletype = @roletype AND level=@level+1)
	          BEGIN
  	             SELECT @result = 1
	 	     SELECT @level = -1 -- Exit the loop
		  END
	       ELSE
    	          SELECT @level = @level + 1
	    END
	    
	 ELSE
	    SELECT @level = -1 -- Exit the loop
      END
END -- WHILE
SET NOCOUNT OFF
SELECT @result Result
DROP TABLE #stack
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_DeleteProfileRelationships]
    @profilekey nvarchar(128),
    @profiletype nvarchar(128)

AS

declare @profileid uniqueidentifier

SET NOCOUNT ON

-- Make sure the profile is in the Profiles table
SET @profileid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @profilekey AND ProfileType = @profiletype)

IF @profileid IS NULL
BEGIN
   return
END

BEGIN TRANSACTION

-- Delete the relationship & profile
DELETE FROM Relationships 
WHERE Relationships.SourceProfileID = @profileid OR
      Relationships.TargetProfileID = @profileid

--DELETE Profiles FROM Relationships
DELETE FROM Profiles
WHERE (Profiles.ProfileID NOT IN (SELECT SourceProfileID FROM Relationships) AND
       Profiles.ProfileID NOT IN (SELECT TargetProfileID FROM Relationships)) OR
      Profiles.ProfileID = @profileid

COMMIT TRANSACTION
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [dbo].[bas_UpgradeBizTalkRegistration]
    @name nvarchar(128),
    @receiveLocationUri nvarchar(255), 
    @sendLocationUri nvarchar(512), 
    @bizTalkHost nvarchar(80), 
    @parameterServiceHost nvarchar(80)
AS
BEGIN

UPDATE [dbo].[BizTalkServer]
SET [dbo].[BizTalkServer].[ReceiveLocationUri] = @receiveLocationUri, [dbo].[BizTalkServer].[SendLocationUri] = @sendLocationUri, [dbo].[BizTalkServer].[BizTalkHost] = @bizTalkHost, [dbo].[BizTalkServer].[ParameterServiceHost] = @parameterServiceHost
WHERE [dbo].[BizTalkServer].[Name] = @name

UPDATE [dbo].[BTServersSts]
SET [dbo].[BTServersSts].[BizTalkHost] = @bizTalkHost, [dbo].[BTServersSts].[ParameterServiceHost] = @parameterServiceHost
WHERE [dbo].[BTServersSts].[Name] = @name

UPDATE [dbo].[BTServersTpm]
SET [dbo].[BTServersTpm].[BizTalkHost] = @bizTalkHost, [dbo].[BTServersTpm].[ParameterServiceHost] = @parameterServiceHost
WHERE [dbo].[BTServersTpm].[Name] = @name

END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE [dbo].[bas_UpgradeInternalSendPort]
 (
  @PartnerId nvarchar(128),
  @PrimaryTransport_RetryCount int,
  @PrimaryTransport_RetryInterval int,
  @PrimaryTransport_TransportType_Name nvarchar (256),
  @PrimaryTransport_TransportType_Capabilities int,
  @PrimaryTransport_TransportType_GUID uniqueidentifier,
  @Sendpipeline_FullyQualifiedName ntext,
  @Sendpipeline_Name ntext,
  @sendToSentItemsAddress nvarchar(256),
  @sendToInboxAddress nvarchar(256) 
 )
AS
 IF (@sendToSentItemsAddress IS NOT NULL)
	 SELECT [Name] 
	 FROM SendPorts
	 WHERE [GlobalPortName] IS NULL
		AND [PartnerId] = @PartnerId
		AND [Role] = N'sender'
		AND [PrimaryTransport_TransportType_GUID] = N'{1C56D157-0553-4345-8A1F-55D2D1A3FFB6}'
		AND [PrimaryTransport_Address] LIKE N'%&FolderType=MessagesSentItems'

 ELSE
	 SELECT [Name] 
	 FROM SendPorts
	 WHERE [GlobalPortName] IS NULL
		AND [PartnerId] = @PartnerId
		AND [Role] = N'sender'
		AND [PrimaryTransport_TransportType_GUID] = N'{1C56D157-0553-4345-8A1F-55D2D1A3FFB6}'
		AND [PrimaryTransport_Address] LIKE N'%&FolderType=MessagesInbox'


 IF (@sendToSentItemsAddress IS NOT NULL)
	 UPDATE [dbo].[SendPorts]
	 SET [PrimaryTransport_Address] =  @sendToSentItemsAddress,
	  [PrimaryTransport_RetryCount] = @PrimaryTransport_RetryCount,
	  [PrimaryTransport_RetryInterval] = @PrimaryTransport_RetryInterval,
	  [PrimaryTransport_TransportType_Name] = @PrimaryTransport_TransportType_Name,
	  [PrimaryTransport_TransportType_Capabilities] = @PrimaryTransport_TransportType_Capabilities,
	  [PrimaryTransport_TransportType_GUID] = @PrimaryTransport_TransportType_GUID,
	  [Sendpipeline_FullyQualifiedName] = @Sendpipeline_FullyQualifiedName,
	  [Sendpipeline_Name] = @Sendpipeline_Name
	 WHERE [GlobalPortName] IS NULL
		AND [PartnerId] = @PartnerId
		AND [Role] = N'sender'
		AND [PrimaryTransport_TransportType_GUID] = N'{1C56D157-0553-4345-8A1F-55D2D1A3FFB6}'
		AND [PrimaryTransport_Address] LIKE N'%&FolderType=MessagesSentItems'
 ELSE
	 UPDATE [dbo].[SendPorts]
	 SET [PrimaryTransport_Address] =  @sendToInboxAddress,
	  [PrimaryTransport_RetryCount] = @PrimaryTransport_RetryCount,
	  [PrimaryTransport_RetryInterval] = @PrimaryTransport_RetryInterval,
	  [PrimaryTransport_TransportType_Name] = @PrimaryTransport_TransportType_Name,
	  [PrimaryTransport_TransportType_Capabilities] = @PrimaryTransport_TransportType_Capabilities,
	  [PrimaryTransport_TransportType_GUID] = @PrimaryTransport_TransportType_GUID,
	  [Sendpipeline_FullyQualifiedName] = @Sendpipeline_FullyQualifiedName,
	  [Sendpipeline_Name] = @Sendpipeline_Name
	 WHERE [GlobalPortName] IS NULL
		AND [PartnerId] = @PartnerId
		AND [Role] = N'sender'
		AND [PrimaryTransport_TransportType_GUID] = N'{1C56D157-0553-4345-8A1F-55D2D1A3FFB6}'
		AND [PrimaryTransport_Address] LIKE N'%&FolderType=MessagesInbox'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE FUNCTION [dbo].[IsTemplate]
	(
	@AgreementId NVARCHAR(255)
	)
RETURNS BIT
AS
	BEGIN
		DECLARE @ret BIT
		DECLARE @n INT
		SET @ret = 0
		
		SELECT @n = COUNT(*) FROM [dbo].[Agreements] A, [dbo].[Agreements] B 
		WHERE [A].[Name] = @AgreementId AND [A].[AgreementId] = [B].[TemplateAgreementId]
		
		IF @n > 0
			SET @ret = 1
			
	RETURN @ret
	END
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sp_UpdateOutboxReceiveLocationUriQuery
    @name nvarchar(128),
    @receivelocationuri nvarchar(255)
AS

UPDATE [dbo].[BizTalkServer]
SET [dbo].[BizTalkServer].[ReceiveLocationUri] = @receivelocationuri
WHERE [dbo].[BizTalkServer].[Name] = @name

GO

CREATE PROCEDURE sp_UpdateSendPortsQuery
    @partnerid nvarchar(128),
    @sendinboxuri nvarchar(255),
    @sendsentitemsuri nvarchar(255)
AS

UPDATE SendPorts
SET PrimaryTransport_Address = 
	CASE 
		WHEN ([Name] LIKE N'%-sendToInboxPT-%') THEN  @sendinboxuri 
		ELSE @sendsentitemsuri
	END
WHERE PartnerId = @partnerid AND Role = N'sender' 
AND ServiceLinkName LIKE N'%.sendBusinessDocumentsLT'
AND ( ([Name] LIKE N'%-sendToInboxPT-%') OR ([Name] LIKE N'%-sendToSentItemsPT-%'))
AND PrimaryTransport_Address <> 
	CASE 
		WHEN ([Name] LIKE N'%-sendToInboxPT-%') THEN  @sendinboxuri 
		ELSE @sendsentitemsuri
	END

GO

--------------------------------------------------------------------------------------------
-- This is ok since this delta file will only be run if the SP setup is being run after the 
-- config wizard is already run ------------------------------------------------------------
--------------------------------------------------------------------------------------------

GRANT  EXECUTE  ON [dbo].[InsertOrUpdateTpmName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[DeleteTpmNameMapping]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetWssNameFromTpmName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetGuidFromTpmName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[IsTemplate]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[AnalyzeBTServers]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[AnalyzeGroupLists]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[AnalyzeOutboxDocumentLibraries]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[AnalyzePartnersDocumentLibraries]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[DeleteAgreement]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[DeleteSendPort]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetActorAgreements]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetAddendumSendPorts]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetAgreement]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetAgreementList]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetAgreementsFromTemplate]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetInheritedActorAgreements]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetNonInheritedActorAgreements]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetParameterValue]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetPartnerEnlistments]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetPartnerSendPorts]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetSendPortsByGlobalPortName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetStructuredParameterValue]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAddendum]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[AddressObject]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ClassDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ClsAttrib]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ColDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[CommerceServerCatalogs]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ContactObject]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[Group]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[GroupMem]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MemAttrib]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MemberDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[Partner]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[RelDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SourceAttrib]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SourceDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TableDef]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[AnalyzeAgreements]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[AnalyzeMembers]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[DeleteListNameMapping]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[EmptySyncTables]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetGuidFromListName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[InsertOrUpdateListName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAddendumName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAddendumRole]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAgreement]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAgreementLegalText]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAgreementName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveLegalText]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveParameter]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveProcessRole]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveSendPort]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[ShallowDeleteAgreement]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SyncListGuids]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[UpdateSendPort]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[WriteAgreementsStsData]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[WriteBTServersStsData]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[WriteDuplicatesStsData]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[WriteListsStsData]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[WriteMembersStsData]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[WriteTpmData]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_CreateBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelDataMember]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelDataObject]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelDataSource]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfile]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileCatalog]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileGroup]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileGroupHelper]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileHelper]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfilePropHelper]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileProperty]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DeleteBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DeleteProfileRelationships]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DeployPartner]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetBizTalkRegistrationByPartner]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetBizTalkRegistrationList]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetDataSourceDepends]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetDataSourceInfo]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetPartnersFromBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileCatalogInfo]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileCatalogs]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileCustomProps]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileDomains]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileInfo]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileMemAttrs]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileMember]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileProps]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileSources]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetRelatedProfiles]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetRoles]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_IsInRole]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_RelateProfiles]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UndeployPartner]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UnrelateProfiles]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdateBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdateOutboxReceiveLocationUriQuery]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdateSendPortsQuery]  TO [tpm_user]
GO

/************************************************************************
      NOTE:: This role is not used anymore. so, drop it.
************************************************************************/
if exists (select * from dbo.sysusers where name = N'sts_user')
BEGIN
DECLARE @RoleMemberName AS sysname
CREATE TABLE #tmp1(DbRole sysname, MemberName sysname, MemberSID varbinary(85))
insert #tmp1 exec sp_helprolemember
SELECT @RoleMemberName = MemberName FROM #tmp1 WHERE DbRole='sts_user'
while @RoleMemberName IS NOT NULL
	BEGIN
		exec sp_droprolemember 'sts_user', @RoleMemberName
		DELETE FROM #tmp1 WHERE MemberName=@RoleMemberName
		SET @RoleMemberName=NULL
		SELECT @RoleMemberName = MemberName FROM #tmp1 WHERE DbRole='sts_user'
	END
DROP TABLE #tmp1
exec sp_droprole 'sts_user'
END
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

-----------------------------------------------------------------------------
-- Procedures to grant required permissions for each role
-----------------------------------------------------------------------------
CREATE PROCEDURE sp_GrantPermissionForRole
(
    @ObjectName    sysname,    -- object name
    @objectType    char(2),    -- type of the object
    @RoleName    sysname,    -- role name
    @Permissions    nvarchar(500)    -- permissions to grant.
)

AS
BEGIN
    SET NOCOUNT ON
    DECLARE @Query_tmp    nvarchar(4000)

    SET @ObjectName = LTRIM(RTRIM(@ObjectName ))
    IF SUBSTRING(@ObjectName,1,1) <> '['
    BEGIN
        SET @ObjectName = N'['+@ObjectName+']'
    END

    -- Check that an object with given name and type exist.
    IF (     ((@objectType = 'P') AND
            EXISTS (SELECT '*' FROM sysobjects WHERE id = object_id(@ObjectName) and OBJECTPROPERTY(id, N'IsProcedure') = 1)) OR
        ((@objectType = 'T') AND
            EXISTS (SELECT '*' FROM sysobjects WHERE id = object_id(@ObjectName) and OBJECTPROPERTY(id, N'IsUserTable') = 1)) OR
        ((@objectType = 'F') AND
            EXISTS (SELECT '*' FROM sysobjects WHERE id = object_id(@ObjectName) and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)) OR
        ((@objectType = 'I') AND
            EXISTS (SELECT '*' FROM sysobjects WHERE id = object_id(@ObjectName) and OBJECTPROPERTY(id, N'IsInlineFunction') = 1)) OR
        ((@objectType = 'V') AND            EXISTS (SELECT '*' FROM sysobjects WHERE id = object_id(@ObjectName) and OBJECTPROPERTY(id, N'IsView') = 1))    )
    BEGIN
        -- Grant the specified premissions to the specified role for the specified object.
         EXEC (N'GRANT ' + @Permissions + N' ON dbo.' + @ObjectName + N' TO ' + @RoleName)
    END
END
GO


-----------------------------------------------------------------------------
-- Creates roles for the profile catalog
-----------------------------------------------------------------------------
CREATE PROCEDURE sp_CreateProfileSchemaRoles
AS
BEGIN
    SET NOCOUNT ON
    IF NOT EXISTS (SELECT '*' FROM dbo.sysusers WHERE name = N'Profile_Schema_Manager' AND issqlrole = 1)
    BEGIN
         EXEC sp_addrole    N'Profile_Schema_Manager'
    END
    IF NOT EXISTS (SELECT '*' FROM dbo.sysusers WHERE name = N'Profile_Schema_Reader' AND issqlrole = 1)
    BEGIN
         EXEC sp_addrole    N'Profile_Schema_Reader'
    END
END
GO

-----------------------------------------------------------------------------
-- Profile_Schema_Manager role:
-- Granted permission to modify profile schema tables and execute all stored
-- procedures.
-----------------------------------------------------------------------------
CREATE PROCEDURE sp_GrantPermissions_ProfileSchemaManager
AS
BEGIN
	SET NOCOUNT ON
	EXEC dbo.sp_GrantPermissionForRole N'CommerceServerCatalogs', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'CommerceServerCatalogs', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'CommerceServerCatalogs', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'CommerceServerCatalogs', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'ClassDef', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'ClassDef', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'ClassDef', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'ClassDef', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'RelDef', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'RelDef', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'RelDef', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'RelDef', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'MemberDef', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'MemberDef', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'MemberDef', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'MemberDef', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'GroupMem', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'GroupMem', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'GroupMem', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'GroupMem', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'SourceDef', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'SourceDef', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'SourceDef', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'SourceDef', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'TableDef', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'TableDef', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'TableDef', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'TableDef', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'ColDef', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'ColDef', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'ColDef', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'ColDef', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'SourceAttrib', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'SourceAttrib', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'SourceAttrib', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'SourceAttrib', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'ClsAttrib', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'ClsAttrib', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'ClsAttrib', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'ClsAttrib', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'MemAttrib', N'T', N'Profile_Schema_Manager', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'MemAttrib', N'T', N'Profile_Schema_Manager', N'INSERT'
	EXEC dbo.sp_GrantPermissionForRole N'MemAttrib', N'T', N'Profile_Schema_Manager', N'UPDATE'
	EXEC dbo.sp_GrantPermissionForRole N'MemAttrib', N'T', N'Profile_Schema_Manager', N'DELETE'

	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileCatalogInfo', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileCatalogs', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileInfo', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileInfo', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetDataSourceInfo', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileProps', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelProfileHelper', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelProfile', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelDataMember', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelDataObject', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetDataSourceDepends', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelDataSource', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelProfileCatalog', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelProfilePropHelper', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelProfileGroupHelper', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelProfileProperty', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_DelProfileGroup', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileMember', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileMemAttrs', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileDomains', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileSources', N'P', N'Profile_Schema_Manager', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileCustomProps', N'P', N'Profile_Schema_Manager', N'EXEC'

END
GO


-----------------------------------------------------------------------------
-- Profile_Schema_Reader role:
-- Granted permission to read profile schema tables and execute a subset of
-- stored procedures.
-----------------------------------------------------------------------------
CREATE PROCEDURE sp_GrantPermissions_ProfileSchemaReader
AS
BEGIN
	SET NOCOUNT ON
	EXEC dbo.sp_GrantPermissionForRole N'CommerceServerCatalogs', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'ClassDef', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'RelDef', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'MemberDef', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'GroupMem', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'SourceDef', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'TableDef', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'ColDef', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'SourceAttrib', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'ClsAttrib', N'T', N'Profile_Schema_Reader', N'SELECT'
	EXEC dbo.sp_GrantPermissionForRole N'MemAttrib', N'T', N'Profile_Schema_Reader', N'SELECT'

	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileCatalogInfo', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileCatalogs', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileInfo', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileInfo', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetDataSourceInfo', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileProps', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetDataSourceDepends', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileMember', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileMemAttrs', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileDomains', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileSources', N'P', N'Profile_Schema_Reader', N'EXEC'
	EXEC dbo.sp_GrantPermissionForRole N'sp_GetProfileCustomProps', N'P', N'Profile_Schema_Reader', N'EXEC'
END
GO


-----------------------------------------------------------------------------
-- Create roles
-----------------------------------------------------------------------------
EXEC sp_CreateProfileSchemaRoles
GO
EXEC sp_GrantPermissions_ProfileSchemaManager
GO
EXEC sp_GrantPermissions_ProfileSchemaReader
GO

