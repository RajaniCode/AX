--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

--/ Upgrade for TPMDB.
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ColumnExists]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function ColumnExists
GO

CREATE FUNCTION ColumnExists(@TableName NVARCHAR(128),@ColumnName NVARCHAR(128)) 
RETURNS BIT--Returns 0 if column does not exist. Returns 1 if column exists.
AS
BEGIN 
--See if the Table already contains the column.
if exists (select * from [dbo].[sysobjects] sysObj INNER JOIN [dbo].[syscolumns] sysCol ON sysObj.id = sysCol.id WHERE ObjectProperty(sysObj.id,'IsUserTable')=1 
AND sysObj.name=@TableName AND sysCol.name=@ColumnName) 
RETURN 1
--Table does not contain the column.
RETURN 0
END
GO

-- BizTalk Server 2004 to BizTalk Server 2006
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BAMIntegration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BAMIntegration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Choices]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Choices]
GO

--------------------------------
-- BTS2004 SP1 fix : Bug 90139
--------------------------------

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TpmToWssMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN

CREATE TABLE [dbo].[TpmToWssMapping] (
	[TpmName] [nvarchar] (255) NOT NULL ,
	[WssName] [nvarchar] (255) NOT NULL ,
	[TpmType] [int] NOT NULL 
) ON [PRIMARY]

ALTER TABLE [dbo].[TpmToWssMapping] WITH NOCHECK ADD 
	CONSTRAINT [PK_TpmToWssMapping] PRIMARY KEY  CLUSTERED 
	(
		[TpmName],
		[TpmType]
	)  ON [PRIMARY] 

INSERT INTO TpmToWssMapping 
	SELECT PartnerId, PartnerId, 0  FROM Partner WHERE PartnerId NOT IN (SELECT TpmName from TpmToWssMapping WHERE TpmType = 0)

INSERT INTO TpmToWssMapping 
	SELECT [Name], [Name], 1 FROM [Group] WHERE [Name] NOT IN (SELECT TpmName from TpmToWssMapping WHERE TpmType = 1)

-- '_Outbox' must be localized and match the resource value 
-- in the Microsoft.BizTalk.KwTpm.StsWebService.dll for resource ID "Outbox"
-- It must also match other SQL files that we have localized "Outbox'.  
-- Currently no other SQL files localize 'Outbox'.

declare @localized_string_outbox as nvarchar(126)
set @localized_string_outbox = N'Outbox'
INSERT INTO TpmToWssMapping 
	SELECT [Name], [Name] + N'_' + @localized_string_outbox, 2 FROM [BizTalkServer]
	WHERE [Name] NOT IN (SELECT TpmName from TpmToWssMapping WHERE TpmType = 2)
END

-- BizTalk Server 2006
if not exists (select * from dbo.systypes where name = N't_assemblyStrongName')
EXEC sp_addtype N't_assemblyStrongName', N'nvarchar (1024)', N'null'
GO

declare @BamWsUrl BIT
set @BamWsUrl = dbo.ColumnExists('BizTalkServer', 'BamWsUrl')
if(@BamWsUrl = 1)
BEGIN
	ALTER TABLE [dbo].[BizTalkServer] ADD [BizTalkHost] nvarchar (80), [ParameterServiceHost] nvarchar (80)
	ALTER TABLE [dbo].[BTServersSts] ADD [BizTalkHost] nvarchar (80), [ParameterServiceHost] nvarchar (80)
	ALTER TABLE [dbo].[BTServersTpm] ADD [BizTalkHost] nvarchar (80), [ParameterServiceHost] nvarchar (80)
	ALTER TABLE [dbo].[BTServersTpm] DROP COLUMN BamWsUrl, BizTalkServerMachine
	ALTER TABLE [dbo].[BTServersSts] DROP COLUMN BamWsUrl, BizTalkServerMachine
	ALTER TABLE [dbo].[BizTalkServer] DROP COLUMN BamWsUrl, BizTalkServerMachine
END
GO

declare @BizTalkHost BIT
set @BizTalkHost = dbo.ColumnExists('BizTalkServer', 'BizTalkHost')
if(@BizTalkHost = 1)
BEGIN
	UPDATE [dbo].[BizTalkServer] SET [dbo].[BizTalkServer].[BizTalkHost]='' , [dbo].[BizTalkServer].[ParameterServiceHost]='' WHERE [dbo].[BizTalkServer].[BizTalkServerId] IS NOT NULL
	UPDATE [dbo].[BTServersTpm] SET [dbo].[BTServersTpm].[BizTalkHost]='' , [dbo].[BTServersTpm].[ParameterServiceHost]='' WHERE [dbo].[BTServersTpm].[Name] IS NOT NULL
	UPDATE [dbo].[BTServersSts] SET [dbo].[BTServersSts].[BizTalkHost]='' , [dbo].[BTServersSts].[ParameterServiceHost]='' WHERE [dbo].[BTServersSts].[Name] IS NOT NULL
	ALTER TABLE [dbo].[BizTalkServer] ALTER COLUMN [BizTalkHost] nvarchar (80) NOT NULL
	ALTER TABLE [dbo].[BizTalkServer] ALTER COLUMN [ParameterServiceHost] nvarchar (80)  NOT NULL
	ALTER TABLE [dbo].[BTServersSts] ALTER COLUMN [BizTalkHost] nvarchar (80) NOT NULL
	ALTER TABLE [dbo].[BTServersSts] ALTER COLUMN [ParameterServiceHost] nvarchar (80)  NOT NULL
	ALTER TABLE [dbo].[BTServersTpm] ALTER COLUMN [BizTalkHost] nvarchar (80) NOT NULL
	ALTER TABLE [dbo].[BTServersTpm] ALTER COLUMN [ParameterServiceHost] nvarchar (80)  NOT NULL
END
GO

declare @Timeout BIT
set @Timeout = dbo.ColumnExists('Parameters', 'Timeout')
if(@Timeout = 1)
BEGIN
	ALTER TABLE [dbo].[Parameters] ADD [Description] t_description, [ParameterXml] ntext, [ParameterInfoPathXml] ntext
	ALTER TABLE [dbo].[Parameters] DROP COLUMN Timeout
END
GO

declare @ParametersDescription BIT
declare @PolicyTemplatesDescription BIT
set @ParametersDescription = dbo.ColumnExists('Parameters', 'Description')
set @PolicyTemplatesDescription = dbo.ColumnExists('PolicyTemplates', 'Description')
if((@ParametersDescription = 1) AND (@PolicyTemplatesDescription = 1))
BEGIN
	UPDATE [dbo].[Parameters]
	SET    [Description] = [dbo].[policyTemplates].[description] 
	FROM   [dbo].[policyTemplates], [dbo].[Policies]
	WHERE  [dbo].[policyTemplates].[PolicyTemplateId] = [dbo].[Policies].[PolicyTemplateId] AND [dbo].[Policies].[PolicyId] = [dbo].[parameters].PolicyId
END
GO

declare @Description BIT
set @Description = dbo.ColumnExists('PolicyTemplates', 'description')
if(@Description = 1)
BEGIN
	ALTER TABLE [dbo].[PolicyTemplates] DROP COLUMN description
	ALTER TABLE [dbo].[PolicyTemplates] ADD [SchemaAssemblySN] [t_assemblyStrongName]
	ALTER TABLE [dbo].[Processes] ADD [ServiceLinkAssemblySN] [t_assemblyStrongName]
	ALTER TABLE [dbo].[Processes] ALTER COLUMN [DefinitionSource] [t_assemblyStrongName]
END
GO

declare @ContactNameExists BIT
set @ContactNameExists = dbo.ColumnExists('ContactObject', 'Name')
if(@ContactNameExists = 1)
BEGIN
	ALTER TABLE [dbo].[ContactObject] ALTER COLUMN [Name] [nvarchar] (256) NULL
END
GO
-- PSS fix for SourceDef table
ALTER TABLE SourceDef ADD 
   CONSTRAINT [PK_SourceDef] PRIMARY KEY CLUSTERED ([SourceName])

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ColumnExists]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function ColumnExists
GO

/************************************************************************
      NOTE:: Drop the existing BDSecurity Tables
************************************************************************/

IF EXISTS (SELECT * FROM sysobjects WHERE id = 
   OBJECT_ID(N'[dbo].[BDSecurityIdentifiers]') AND
   OBJECTPROPERTY(id, N'IsUserTable') = 1)

DROP TABLE [dbo].[BDSecurityIdentifiers]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id =   
   OBJECT_ID(N'[dbo].[BDSecurityDefinition]') AND 
   OBJECTPROPERTY(id, N'IsUserTable') = 1)

DROP TABLE [dbo].[BDSecurityDefinition]
GO
