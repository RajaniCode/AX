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
-- These tables and stored procedures are required only by StsWebService in order to support synchronization, BAM integration,
--  and implement workaround for performance/stress related issue described in bug 62774
-- This statement is run against TPM database only for consolidation of databases purpose (keeping the number of DBs low).

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeAgreements]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeAgreements]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeBTServers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeBTServers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeGroupLists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeGroupLists]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeMembers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeMembers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzeOutboxDocumentLibraries]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzeOutboxDocumentLibraries]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnalyzePartnersDocumentLibraries]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AnalyzePartnersDocumentLibraries]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WriteAgreementsStsData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[WriteAgreementsStsData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WriteBTServersStsData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[WriteBTServersStsData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WriteDuplicatesStsData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[WriteDuplicatesStsData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WriteMembersStsData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[WriteMembersStsData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WriteTpmData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[WriteTpmData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EmptySyncTables]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[EmptySyncTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WriteListsStsData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[WriteListsStsData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AgreementsSts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AgreementsSts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AgreementsTpm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AgreementsTpm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BTServersSts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BTServersSts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BTServersTpm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BTServersTpm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DuplicatesSts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DuplicatesSts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MembersSts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MembersSts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MembersTpm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MembersTpm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RelationsTpm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RelationsTpm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ListsSts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ListsSts]
GO

----------------------------------
-------- Synchronization -----
----------------------------------

CREATE TABLE [dbo].[AgreementsSts] (
	[Name] [nvarchar] (128) NOT NULL ,
	[StsId] [int] NOT NULL ,
	[Description] [nvarchar] (255) NOT NULL ,
	[Status] [nvarchar] (255) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AgreementsTpm] (
	[Name] [nvarchar] (128) NOT NULL ,
	[Description] [nvarchar] (255) NOT NULL ,
	[Status] [nvarchar] (255) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BTServersSts] (
	[Name] [nvarchar] (128) NOT NULL ,
	[StsId] [int] NOT NULL ,
	[ReceiveLocationUri] [nvarchar] (255) NOT NULL ,
	[Server] [nvarchar] (255) NOT NULL ,
	[Database] [nvarchar] (255) NOT NULL ,
    [BizTalkHost] [nvarchar] (80) NOT NULL ,
	[ParameterServiceHost] [nvarchar] (80) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BTServersTpm] (
	[Name] [nvarchar] (128) NOT NULL ,
	[ReceiveLocationUri] [nvarchar] (255) NOT NULL ,
	[Server] [nvarchar] (255) NOT NULL ,
	[Database] [nvarchar] (255) NOT NULL ,
	[BizTalkHost] [nvarchar] (80) NOT NULL ,
	[ParameterServiceHost] [nvarchar] (80) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DuplicatesSts] (
	[PK] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (128) NOT NULL ,
	[StsId] [int] NOT NULL ,
	[TableName] [nvarchar] (50) NOT NULL ,
	[ParentName] [nvarchar] (128) NULL ,
	[ParentStsId] [uniqueidentifier] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MembersSts] (
	[Name] [nvarchar] (128) NOT NULL ,
	[StsId] [int] NOT NULL ,
	[ParentName] [nvarchar] (128) NOT NULL ,
	[ParentStsId] [uniqueidentifier] NOT NULL ,
	[MemberType] [int] NOT NULL ,
	[Description] [nvarchar] (255) NOT NULL ,
	[Status] [nvarchar] (255) NOT NULL ,
	[CrossReference] [nvarchar] (255)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MembersTpm] (
	[Name] [nvarchar] (128) NOT NULL ,
	[MemberType] [int] NOT NULL ,
	[Description] [nvarchar] (255) NOT NULL ,
	[Status] [nvarchar] (255) NOT NULL ,
	[CrossReference] [nvarchar] (255)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RelationsTpm] (
	[GroupName] [nvarchar] (128) NOT NULL ,
	[MemberName] [nvarchar] (128) NOT NULL ,
	[MemberType] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ListsSts] (
	[tp_Title] [nvarchar] (255) NOT NULL ,
	[tp_ID] [uniqueidentifier] NOT NULL ,
	[tp_WebId] [uniqueidentifier] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AgreementsSts] WITH NOCHECK ADD 
	CONSTRAINT [PK_AgreementsSts] PRIMARY KEY  CLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AgreementsTpm] WITH NOCHECK ADD 
	CONSTRAINT [PK_AgreementsTpm] PRIMARY KEY  CLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BTServersSts] WITH NOCHECK ADD 
	CONSTRAINT [PK_BTServersSts] PRIMARY KEY  CLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BTServersTpm] WITH NOCHECK ADD 
	CONSTRAINT [PK_BTServersTpm] PRIMARY KEY  CLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DuplicatesSts] WITH NOCHECK ADD 
	CONSTRAINT [PK_DuplicatesSts] PRIMARY KEY  CLUSTERED 
	(
		[PK]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MembersSts] WITH NOCHECK ADD 
	CONSTRAINT [PK_MembersSts] PRIMARY KEY  CLUSTERED 
	(
		[Name],
		[ParentName],
		[MemberType]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MembersTpm] WITH NOCHECK ADD 
	CONSTRAINT [PK_MembersTpm] PRIMARY KEY  CLUSTERED 
	(
		[Name],
		[MemberType]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RelationsTpm] WITH NOCHECK ADD 
	CONSTRAINT [PK_RelationsTpm] PRIMARY KEY  CLUSTERED 
	(
		[GroupName],
		[MemberName],
		[MemberType]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ListsSts] WITH NOCHECK ADD 
	CONSTRAINT [PK_ListsSts] PRIMARY KEY  CLUSTERED 
	(
		[tp_Title],
		[tp_ID],
		[tp_WebId]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_RelationsTpm] ON [dbo].[RelationsTpm]([GroupName]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_RelationsTpm_1] ON [dbo].[RelationsTpm]([MemberName]) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[AnalyzeAgreements] 
AS
/* Returns items to be updated */
SELECT
	T.[Name] AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	T.[Description] AS [Description],
	T.Status AS Status
FROM AgreementsTpm T 
INNER JOIN AgreementsSts S ON T.[Name]=S.[Name]
/* This condition ensures that we return only items that must be updated */
AND ((T.[Description]<>S.[Description]) OR (T.Status<>S.Status))

UNION

/* Return Tpm items that don't exist in Sts */
SELECT
	T.[Name] AS TpmName, 
	NULL AS StsName, 
	NULL AS StsId, 
	T.[Description] AS [Description],
	T.Status AS Status
FROM AgreementsTpm T 
WHERE T.[Name] NOT IN 
	(SELECT [Name] FROM AgreementsSts)

UNION

/* Returns the items in Sts that don't exist in Tpm and must be removed */
SELECT
	NULL AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	S.[Description] AS [Description],
	S.Status AS Status
FROM AgreementsSts S 
WHERE S.[Name] NOT IN 
	(SELECT [Name] FROM AgreementsTpm)

UNION

/* Returns the duplicate items in Sts that must be removed */
SELECT
	NULL AS TpmName, 
	S.[Name] AS StsName, 
	S.StsId AS StsId, 
	N'' AS [Description],
	N'' AS Status
FROM DuplicatesSts S 
WHERE S.TableName='AgreementsSts'

OPTION (HASH UNION) /* workaround for SQL Bug. See KB article 286255 */

RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
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

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[AnalyzeGroupLists] 
	@ParentWebId uniqueidentifier
AS
/* This stored proc returns all existing lists that match a Tpm group, or the Tpm groups for which we have to create a list */
/* We don't return existing lists that should be deleted because we cannot determine that right now. We delete a list
when its item from All Groups list is removed */

-- Return all child groups. The root of the group is a virtual group and it is not returned.
SELECT DISTINCT R.MemberName AS GroupName, L.tp_ID AS ListGuid 
FROM RelationsTpm R LEFT OUTER JOIN ListsSts L ON R.MemberName = L.tp_Title AND L.tp_WebId=@ParentWebId
WHERE R.MemberType=1 


RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
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
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[AnalyzeOutboxDocumentLibraries] 
AS
SELECT [Name] FROM BTServersTpm WHERE ([Name] + N'_Outbox') NOT IN 
	(SELECT tp_Title FROM ListsSts)
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

CREATE PROCEDURE [dbo].[AnalyzePartnersDocumentLibraries] 
AS
SELECT [Name] FROM MembersTpm WHERE MemberType=0 AND RTRIM(UPPER(CrossReference))<>N'SELF' AND [Name] NOT IN 
	(SELECT tp_Title FROM ListsSts)
RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[WriteAgreementsStsData] 
	@Name nvarchar(128),
	@StsId int,
	@Description nvarchar(255),
	@Status nvarchar(255)
AS
SET NOCOUNT ON
INSERT INTO AgreementsSts ( [Name],  StsId, [Description], Status)
	VALUES ( @Name,  @StsId, @Description, @Status )
RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
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
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[WriteDuplicatesStsData]
	@Name nvarchar(128),
	@StsId int,
	@TableName nvarchar(50),
	@ParentName nvarchar(128) = NULL,
	@ParentStsId uniqueidentifier = NULL
AS
SET NOCOUNT ON
INSERT INTO DuplicatesSts ( [Name], StsId, TableName, ParentName, ParentStsId)
	VALUES ( @Name, @StsId, @TableName, @ParentName, @ParentStsId)
RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[WriteMembersStsData]
	@Name nvarchar(128),
	@StsId int,
	@ParentName nvarchar(128),
	@ParentStsId uniqueidentifier,
	@MemberType int,
	@Description nvarchar(255),
	@Status nvarchar(255),
	@CrossReference nvarchar(255) = NULL
AS
SET NOCOUNT ON
INSERT INTO MembersSts ( [Name], StsId, ParentName, ParentStsId, MemberType, [Description], Status, CrossReference)
	VALUES ( @Name, @StsId, @ParentName, @ParentStsId, @MemberType, @Description, @Status, @CrossReference)

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

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[EmptySyncTables]
AS
SET NOCOUNT ON
DELETE FROM BTServersTpm
DELETE FROM MembersTpm
DELETE FROM AgreementsTpm
DELETE FROM RelationsTpm
DELETE FROM BTServersSts
DELETE FROM MembersSts
DELETE FROM AgreementsSts
DELETE FROM DuplicatesSts
DELETE FROM ListsSts
RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[WriteListsStsData] 
	@tp_Title nvarchar(255),
	@tp_ID uniqueidentifier,
	@tp_WebId uniqueidentifier
AS
SET NOCOUNT ON
INSERT INTO ListsSts ( tp_Title, tp_ID, tp_WebId )
	VALUES ( @tp_Title, @tp_ID, @tp_WebId)
RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

----------------------------------------------------------------------
-------- For WSS bug 62774 GUID/List Name performance workaround -----
----------------------------------------------------------------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertOrUpdateListName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertOrUpdateListName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetGuidFromListName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetGuidFromListName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteListNameMapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteListNameMapping]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NameToGUIDMap]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NameToGUIDMap]
GO

CREATE TABLE [dbo].[NameToGUIDMap] (
	[ListName] [nvarchar] (255) NOT NULL ,
	[ListGuid] [uniqueidentifier] NOT NULL ,
	[WebGuid] [uniqueidentifier] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[NameToGUIDMap] WITH NOCHECK ADD 
	CONSTRAINT [PK_NameToGUIDMap] PRIMARY KEY  CLUSTERED 
	(
		[ListName]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[NameToGUIDMap] ADD 
	CONSTRAINT [IX_NameToGUIDMap] UNIQUE  NONCLUSTERED 
	(
		[ListGuid],
		[WebGuid]
	)  ON [PRIMARY] 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[InsertOrUpdateListName]
	@ListName nvarchar(255),
	@ListGuid uniqueidentifier,
	@WebGuid uniqueidentifier
AS

UPDATE NameToGUIDMap 
	SET ListName = @ListName,
	ListGuid = @ListGuid,
	WebGuid = @WebGuid
WHERE (ListName = @ListName) OR ((WebGuid=@WebGuid) AND (ListGuid=@ListGuid))

IF (@@ROWCOUNT = 0)
	INSERT INTO NameToGUIDMap (ListName, ListGuid, WebGuid) VALUES (@ListName, @ListGuid, @WebGuid)

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

CREATE PROCEDURE [dbo].[GetGuidFromListName] 
	@ListName nvarchar(255),
	@ListGuid uniqueidentifier OUTPUT,
	@WebGuid uniqueidentifier OUTPUT
AS

SELECT @ListGuid = ListGuid, @WebGuid = WebGuid FROM NameToGUIDMap WHERE ListName = @ListName

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

CREATE PROCEDURE [dbo].[DeleteListNameMapping]
	@ListName nvarchar(255)
AS

DELETE FROM NameToGUIDMap WHERE ListName = @ListName

RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

-- WSS bug 62774 and synchronization related. Synchronizing the GUIDs-list name map
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SyncListGuids]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SyncListGuids]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SyncListGuids] 

AS

DELETE NameToGUIDMap
INSERT INTO NameToGUIDMap (ListName, ListGuid, WebGuid) 
	SELECT tp_Title, tp_ID, tp_WebId FROM ListsSts 

RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


----------------------------
-- BizTalk Server 2004 SP1 fix ---------
----------------------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TpmToWssMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TpmToWssMapping]
GO

CREATE TABLE [dbo].[TpmToWssMapping] (
	[TpmName] [nvarchar] (255) NOT NULL ,
	[WssName] [nvarchar] (255) NOT NULL ,
	[TpmType] [int] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TpmToWssMapping] WITH NOCHECK ADD 
	CONSTRAINT [PK_TpmToWssMapping] PRIMARY KEY  CLUSTERED 
	(
		[TpmName],
		[TpmType]
	)  ON [PRIMARY] 
GO

INSERT INTO TpmToWssMapping 
	SELECT PartnerId, PartnerId, 0  FROM Partner
GO
INSERT INTO TpmToWssMapping 
	SELECT [Name], [Name], 1 FROM [Group]
GO

-- '_Outbox' must be localized and match the resource value 
-- in the Microsoft.BizTalk.KwTpm.StsWebService.dll for resource ID "Outbox"
-- It must also match other SQL files that we have localized "Outbox'.  
-- Currently no other SQL files localize 'Outbox'.

declare @localized_string_outbox as nvarchar(126)
set @localized_string_outbox = N'Outbox'
INSERT INTO TpmToWssMapping 
	SELECT [Name], [Name] + N'_' + @localized_string_outbox, 2 FROM [BizTalkServer]
GO


-- stored procs --

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsertOrUpdateTpmName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsertOrUpdateTpmName]
GO

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


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteTpmNameMapping]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteTpmNameMapping]
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


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetWssNameFromTpmName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetWssNameFromTpmName]
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


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetGuidFromTpmName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetGuidFromTpmName]
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


-- Re-sync feature fix for binary collation SQL server ----

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

ALTER   PROCEDURE [dbo].[AnalyzeGroupLists] 
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

ALTER   PROCEDURE [dbo].[AnalyzeOutboxDocumentLibraries] 
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


ALTER   PROCEDURE [dbo].[AnalyzePartnersDocumentLibraries] 
AS
SELECT [Name] FROM MembersTpm WHERE MemberType=0 AND RTRIM(UPPER(CrossReference))<>N'SELF' AND [Name] NOT IN 
	(SELECT TTOW.TpmName FROM TpmToWssMapping TTOW INNER JOIN ListsSts L ON L.tp_Title  = TTOW.WssName AND TTOW.TpmType='0')
RETURN 0
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

