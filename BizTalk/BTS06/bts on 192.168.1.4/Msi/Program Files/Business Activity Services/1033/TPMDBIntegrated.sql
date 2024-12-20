/*******************************************************************************
* Copyright (c) Microsoft Corporation.  All rights reserved.
* 
* THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
* WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
* WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
* THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
* AND INFORMATION REMAINS WITH THE USER.
********************************************************************************/

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/*Moving script from TpmWebService.sql*/
if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SendPorts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SendPorts]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[FK_DeployedPartners_BizTalkServer]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[DeployedPartners] DROP CONSTRAINT FK_DeployedPartners_BizTalkServer
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_CreateBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_CreateBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_DeleteBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DeleteBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_DeployPartner]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DeployPartner]
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

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_UndeployPartner]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UndeployPartner]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_UpdateBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_UpdateOutboxReceiveLocationUriQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateOutboxReceiveLocationUriQuery]
GO
if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[AddressObject]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AddressObject]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[BizTalkServer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BizTalkServer]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[ContactObject]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ContactObject]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[DeployedPartners]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DeployedPartners]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Group]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Partner]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Partner]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_GetPartnersFromBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetPartnersFromBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[bas_UpgradeBizTalkRegistration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bas_UpgradeBizTalkRegistration]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[bas_UpgradeInternalSendPort]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[bas_UpgradeInternalSendPort]
GO

/**/

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Addendums_AddendumNames_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AddendumNames] DROP CONSTRAINT Addendums_AddendumNames_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Addendums_LegalDocuments_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[LegalDocuments] DROP CONSTRAINT Addendums_LegalDocuments_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Agreements_Addendums_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Addendums] DROP CONSTRAINT Agreements_Addendums_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[FK_AgreementLegalTerms_Agreements]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AgreementLegalDocuments] DROP CONSTRAINT FK_AgreementLegalTerms_Agreements
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[FK_Agreements_Agreements]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Agreements] DROP CONSTRAINT FK_Agreements_Agreements
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Agreements_AgreementsNames_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AgreementsNames] DROP CONSTRAINT Agreements_AgreementsNames_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Policies_Parameters_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Parameters] DROP CONSTRAINT Policies_Parameters_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[FK_Policies_PolicyTemplates]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Policies] DROP CONSTRAINT FK_Policies_PolicyTemplates
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[ProcessConfig_ActorRoles_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActorRoles] DROP CONSTRAINT ProcessConfig_ActorRoles_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[ProcessConfig_Addendums_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Addendums] DROP CONSTRAINT ProcessConfig_Addendums_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Addendums_ProcessParameters_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Policies] DROP CONSTRAINT Addendums_ProcessParameters_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[ProcessRoles_ActorRoles_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ActorRoles] DROP CONSTRAINT ProcessRoles_ActorRoles_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[FK_PolicyTemplates_Processes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[PolicyTemplates] DROP CONSTRAINT FK_PolicyTemplates_Processes
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Processes_Addendums_FK1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ProcessConfig] DROP CONSTRAINT Processes_Addendums_FK1
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[FK_ProcessRoles_Processes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ProcessRoles] DROP CONSTRAINT FK_ProcessRoles_Processes
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[IsTemplate]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[IsTemplate]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[DeleteAgreement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteAgreement]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetActorAgreements]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetActorAgreements]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetNonInheritedActorAgreements]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetNonInheritedActorAgreements]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetAgreement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAgreement]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetAgreementList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAgreementList]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[RegisterBTS]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[RegisterBTS]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveAddendum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAddendum]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveAddendumName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAddendumName]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveAddendumRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAddendumRole]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveAgreement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAgreement]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveAgreementLegalText]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAgreementLegalText]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveAgreementName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveAgreementName]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveLegalText]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveLegalText]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveParameter]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveParameter]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveProcessRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveProcessRole]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[ShallowDeleteAgreement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShallowDeleteAgreement]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetParameterValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetParameterValue]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetStructuredParameterValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetStructuredParameterValue]
GO
if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetPartnerEnlistments]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetPartnerEnlistments]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[ActorRoles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActorRoles]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[AddendumNames]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AddendumNames]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Addendums]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Addendums]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[AgreementLegalDocuments]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AgreementLegalDocuments]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Agreements]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Agreements]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[AgreementsNames]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AgreementsNames]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[LegalDocuments]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LegalDocuments]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Parameters]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Parameters]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Policies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Policies]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[PolicyTemplates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PolicyTemplates]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[ProcessConfig]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ProcessConfig]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[ProcessRoles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ProcessRoles]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[Processes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Processes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Version]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Version]
GO

if exists (select * from [dbo].[systypes] where name = N't_actorid')
exec sp_droptype N't_actorid'
GO

if exists (select * from [dbo].[systypes] where name = N't_description')
exec sp_droptype N't_description'
GO

if exists (select * from [dbo].[systypes] where name = N't_assemblyStrongName')
exec sp_droptype N't_assemblyStrongName'
GO
if exists (select * from [dbo].[systypes] where name = N't_emails')
exec sp_droptype N't_emails'
GO

if exists (select * from [dbo].[systypes] where name = N't_name')
exec sp_droptype N't_name'
GO

if exists (select * from [dbo].[systypes] where name = N't_telephones')
exec sp_droptype N't_telephones'
GO

/* Taken from TpmStoredProcedures.sql*/

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetInheritedActorAgreements]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetInheritedActorAgreements]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetAgreementsFromTemplate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAgreementsFromTemplate]
GO
/**/

/*Taken from TPMDBSendPorts.sql*/

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[DeleteSendPort]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteSendPort]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[UpdateSendPort]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UpdateSendPort]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetPartnerSendPorts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetPartnerSendPorts]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetAddendumSendPorts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAddendumSendPorts]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[SaveSendPort]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SaveSendPort]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[GetSendPortsByGlobalPortName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetSendPortsByGlobalPortName]
GO

if exists (select * from [dbo].[sysobjects] where id = object_id(N'[dbo].[sp_UpdateSendPortsQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateSendPortsQuery]
GO

/**/

setuser
GO

EXEC sp_addtype N't_actorid', N'nvarchar (255)', N'null'
GO

setuser
GO

setuser
GO

EXEC sp_addtype N't_description', N'nvarchar (255)', N'null'
GO

EXEC sp_addtype N't_assemblyStrongName', N'nvarchar (1024)', N'null'
GO

setuser
GO

setuser
GO

EXEC sp_addtype N't_emails', N'ntext', N'null'
GO

setuser
GO

setuser
GO

EXEC sp_addtype N't_name', N'nvarchar (255)', N'null'
GO

setuser
GO

setuser
GO

EXEC sp_addtype N't_telephones', N'ntext', N'null'
GO

setuser
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

/*Moving script from TpmWebService.sql*/
CREATE TABLE [dbo].[Version] (
	[Version] [decimal](18, 0) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AddressObject] (
	[AddressId] [uniqueidentifier] NOT NULL ,
	[Type] [nvarchar] (256) NULL ,
	[City] [nvarchar] (256) NULL ,
	[County] [nvarchar] (256) NULL ,
	[Country] [nvarchar] (256) NULL ,
	[StateOrProvince] [nvarchar] (256) NULL ,
	[PostalCode] [nvarchar] (32) NULL ,
	[Region] [nvarchar] (256) NULL ,
	[TaxJurisdiction] [nvarchar] (256) NULL ,
	[Description] [nvarchar] (256) NULL ,
	[Lines] [ntext] NULL ,
	[Faxes] [ntext] NULL ,
	[Emails] [ntext] NULL ,
	[Telephones] [ntext] NULL ,
	[Urls] [ntext] NULL ,
	[LastModified] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[BizTalkServer] (
	[BizTalkServerId] [uniqueidentifier] NOT NULL ,
	[Name] [nvarchar] (128) NOT NULL ,
	[Server] [nvarchar] (128) NOT NULL ,
	[DatabaseName] [nvarchar] (128) NOT NULL ,
	[ReceiveLocationUri] [nvarchar] (255) NULL,
	[SendLocationUri] [nvarchar] (512) NULL,
	[BizTalkHost] [nvarchar] (80) NOT NULL ,
	[ParameterServiceHost] [nvarchar] (80) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ContactObject] (
	[ContactId] [uniqueidentifier] NOT NULL ,
	[Name] [nvarchar] (256) NULL ,
	[Description] [nvarchar] (1000) NULL ,
	[ContactType] [nvarchar] (256) NULL ,
	[Emails] [ntext] NULL ,
	[Faxes] [ntext] NULL ,
	[Telephones] [ntext] NULL ,
	[LastModified] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[DeployedPartners] (
	[PartnerId] [nvarchar] (128) NOT NULL ,
	[BizTalkServerId] [uniqueidentifier] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Group] (
	[Name] [nvarchar] (128) NOT NULL ,
	[FriendlyNames] [ntext] NULL ,
	[Description] [nvarchar] (256) NULL ,
	[LastModified] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Partner] (
	[PartnerId] [nvarchar] (128) NOT NULL ,
	[Status] [smallint] NOT NULL ,
	[Currency] [nvarchar] (6) NULL ,
	[Description] [nvarchar] (256) NULL ,
	[DunsNumber] [nvarchar] (256) NULL ,
	[GlEntityDestCode] [nvarchar] (256) NULL ,
	[PartnerIdCrossReference] [nvarchar] (128) NULL ,
	[Rating] [nvarchar] (32) NULL ,
	[PaymentMethod] [nvarchar] (256) NULL ,
	[TaxExempt] [nvarchar] (32) NULL ,
	[TaxId] [nvarchar] (256) NULL ,
	[TermId] [nvarchar] (256) NULL ,
	[TechnicalInfo] [ntext] NULL ,
	[Properties] [ntext] NULL ,
	[FriendlyNames] [ntext] NULL ,
	[LastModified] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[SendPorts] (
	[Name] [nvarchar] (256) NOT NULL ,
	[GlobalPortName] [nvarchar] (256) NULL ,
	[PartnerId] [nvarchar] (128) NOT NULL ,
	[AgreementName] [nvarchar] (255) NOT NULL ,
	[DefinitionSource] [nvarchar] (430) NOT NULL ,
	[ServiceName] [nvarchar] (255) NOT NULL ,
	[ServiceLinkName] [nvarchar] (255) NOT NULL ,
	[Role] [nvarchar] (255) NOT NULL ,
	[EncryptionCert_LongName] [nvarchar] (256) NULL ,
	[EncryptionCert_ShortName] [nvarchar] (256) NULL ,
	[EncryptionCert_Thumbprint] [nvarchar] (256) NULL ,
	[PrimaryTransport_UsageType] [nvarchar] (50) NULL ,
	[PrimaryTransport_Address] [nvarchar] (256) NULL ,
	[PrimaryTransport_RetryCount] [int] NULL ,
	[PrimaryTransport_RetryInterval] [int] NULL ,
	[PrimaryTransport_TransportType_Name] [nvarchar] (256) NULL ,
	[PrimaryTransport_TransportType_Capabilities] [int] NULL ,
	[PrimaryTransport_TransportType_GUID] [uniqueidentifier] NULL ,
	[PrimaryTransport_ServiceWindowEnabled] [bit] NULL ,
	[PrimaryTransport_FromTime] [datetime] NULL ,
	[PrimaryTransport_ToTime] [datetime] NULL ,
	[Sendpipeline_FullyQualifiedName] [ntext] NULL ,
	[Sendpipeline_Name] [ntext] NULL ,
	[Sendpipeline_Type] [nchar] (16) NULL ,
	[Receivepipeline_FullyQualifiedName] [ntext] NULL ,
	[Receivepipeline_Name] [ntext] NULL ,
	[Receivepipeline_Type] [nchar] (16) NULL ,
	[SoapAuthenticationCertificate] [nvarchar] (256) NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[AddressObject] WITH NOCHECK ADD 
	CONSTRAINT [PK_Address] PRIMARY KEY  CLUSTERED 
	(
		[AddressId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BizTalkServer] WITH NOCHECK ADD 
	CONSTRAINT [PK_BizTalkServer] PRIMARY KEY  CLUSTERED 
	(
		[BizTalkServerId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ContactObject] WITH NOCHECK ADD 
	CONSTRAINT [PK_ContactObject] PRIMARY KEY  CLUSTERED 
	(
		[ContactId]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[DeployedPartners] WITH NOCHECK ADD 
	CONSTRAINT [PK_DeployedPartners] PRIMARY KEY  CLUSTERED 
	(
		[PartnerId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Group] WITH NOCHECK ADD 
	CONSTRAINT [PK_Group] PRIMARY KEY  CLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Partner] WITH NOCHECK ADD 
	CONSTRAINT [PK_Partner] PRIMARY KEY  CLUSTERED 
	(
		[PartnerId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AddressObject] WITH NOCHECK ADD 
	CONSTRAINT [DF_AddressObject_LastModified] DEFAULT (getdate()) FOR [LastModified]
GO

ALTER TABLE [dbo].[BizTalkServer] WITH NOCHECK ADD 
	CONSTRAINT [IX_BizTalkServer] UNIQUE  NONCLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] ,
	CONSTRAINT [IX_BizTalkServerName] UNIQUE  NONCLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ContactObject] WITH NOCHECK ADD 
	CONSTRAINT [DF_ContactObject_LastModified] DEFAULT (getdate()) FOR [LastModified]
GO

ALTER TABLE [dbo].[Partner] WITH NOCHECK ADD 
	CONSTRAINT [DF_Partner_LastModified] DEFAULT (getdate()) FOR [LastModified]
GO

ALTER TABLE [dbo].[DeployedPartners] ADD 
	CONSTRAINT [FK_DeployedPartners_BizTalkServer] FOREIGN KEY 
	(
		[BizTalkServerId]
	) REFERENCES [dbo].[BizTalkServer] (
		[BizTalkServerId]
	) ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[SendPorts] WITH NOCHECK ADD 
	CONSTRAINT [PK_SendPorts] PRIMARY KEY  CLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SendPorts] ADD 
	CONSTRAINT [FK_SendPorts_DeployedPartners] FOREIGN KEY 
	(
		[PartnerId]
	) REFERENCES [dbo].[DeployedPartners] (
		[PartnerId]
	)
GO
/**/

CREATE TABLE [dbo].[ActorRoles] (
	[ProcessRoleId] [uniqueidentifier] NULL ,
	[ActorId] [t_actorid] NOT NULL ,
	[ProcessConfigId] [uniqueidentifier] NOT NULL ,
	[ActorType] [smallint] NOT NULL,
	[Self] [bit] NOT NULL,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AddendumNames] (
	[AddendumId] [uniqueidentifier] NOT NULL ,
	[Name] [t_name] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Addendums] (
	[AddendumId] [uniqueidentifier] NOT NULL ,
	[ProcessConfigId] [uniqueidentifier] NULL ,
	[AgreementId] [uniqueidentifier] NOT NULL ,
	[Name] [t_name] NOT NULL ,
	[Description] [t_description] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AgreementLegalDocuments] (
	[AgreementId] [uniqueidentifier] NOT NULL ,
	[Body] [ntext] NULL ,
	[Format] [nchar] (16) NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Agreements] (
	[TemplateAgreementId] [uniqueidentifier] NULL ,
	[AgreementId] [uniqueidentifier] NOT NULL ,
	[Name] [t_name] NOT NULL ,
	[Description] [t_description] NULL ,
	[Date] [datetime] NULL ,
	[StartDate] [datetime] NULL ,
	[EndDate] [datetime] NULL ,
	[State] [smallint] NOT NULL ,
	[LastModified] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AgreementsNames] (
	[AgreementId] [uniqueidentifier] NOT NULL ,
	[Name] [t_name] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LegalDocuments] (
	[AddendumId] [uniqueidentifier] NOT NULL ,
	[Body] [ntext] NOT NULL ,
	[Format] [nchar] (10) NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Parameters] (
	[PolicyId] [uniqueidentifier] NOT NULL ,
	[IsXQuery] [bit] NOT NULL ,
	[XQuery] [nvarchar] (512) NULL ,
	[Description] [t_description] NULL,
	[ParameterXml] [ntext] NULL,
	[ParameterInfoPathXml] [ntext] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Policies] (
	[PolicyId] [uniqueidentifier] NOT NULL ,
	[ProcessConfigId] [uniqueidentifier] NOT NULL ,
	[PolicyTemplateId] [uniqueidentifier] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PolicyTemplates] (
	[PolicyTemplateId] [uniqueidentifier] NOT NULL ,
	[ProcessId] [uniqueidentifier] NOT NULL ,
	[type] [int] NOT NULL ,
	[name] [t_name] NOT NULL ,
	[SchemaAssemblySN] [t_assemblyStrongName] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProcessConfig] (
	[ProcessConfigId] [uniqueidentifier] NOT NULL ,
	[ProcessId] [uniqueidentifier] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProcessRoles] (
	[ProcessRoleId] [uniqueidentifier] NOT NULL ,
	[ProcessId] [uniqueidentifier] NOT NULL ,
	[Name] [t_name] NOT NULL ,
	[Description] [t_description] NULL ,
	[DefinitionSource] [nvarchar] (1024) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Processes] (
	[ProcessId] [uniqueidentifier] NOT NULL ,
	[BusinessProcessName] [t_name] NULL ,
	[ServiceLinkName] [t_name] NOT NULL ,
	[Description] [t_description] NULL ,
	[DefinitionSource] [t_assemblyStrongName] NULL,
	[ServiceLinkAssemblySN] [t_assemblyStrongName] NULL	 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ActorRoles] WITH NOCHECK ADD 
	CONSTRAINT [ActorRoles_PK] PRIMARY KEY   
	(
		[ActorId],
		[ProcessConfigId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Addendums] WITH NOCHECK ADD 
	CONSTRAINT [Addendums_PK] PRIMARY KEY   
	(
		[AddendumId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AgreementLegalDocuments] WITH NOCHECK ADD 
	CONSTRAINT [PK_AgreementLegalDocuments] PRIMARY KEY   
	(
		[AgreementId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Agreements] WITH NOCHECK ADD 
	CONSTRAINT [Agreements_PK] PRIMARY KEY   
	(
		[AgreementId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LegalDocuments] WITH NOCHECK ADD 
	CONSTRAINT [PK_LegalDocuments] PRIMARY KEY   
	(
		[AddendumId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Parameters] WITH NOCHECK ADD 
	CONSTRAINT [ProcessParameters_PK] PRIMARY KEY   
	(
		[PolicyId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Policies] WITH NOCHECK ADD 
	CONSTRAINT [Policies_PK] PRIMARY KEY   
	(
		[PolicyId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PolicyTemplates] WITH NOCHECK ADD 
	CONSTRAINT [PK_PolicyTemplates] PRIMARY KEY   
	(
		[PolicyTemplateId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ProcessConfig] WITH NOCHECK ADD 
	CONSTRAINT [ProcessConfig_PK] PRIMARY KEY   
	(
		[ProcessConfigId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ProcessRoles] WITH NOCHECK ADD 
	CONSTRAINT [ProcessRoles_PK] PRIMARY KEY   
	(
		[ProcessRoleId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Processes] WITH NOCHECK ADD 
	CONSTRAINT [Processes_PK] PRIMARY KEY   
	(
		[ProcessId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Addendums] WITH NOCHECK ADD 
	CONSTRAINT [DF__Addendums__Proce__182C9B23] DEFAULT (newid()) FOR [ProcessConfigId],
	CONSTRAINT [IX_Addendums] UNIQUE  NONCLUSTERED 
	(
		[AgreementId],
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Agreements] WITH NOCHECK ADD 
	CONSTRAINT [DF__Agreement__Agree__1273C1CD] DEFAULT (newid()) FOR [AgreementId],
	CONSTRAINT [Agreements_UniqueName] UNIQUE  NONCLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Policies] WITH NOCHECK ADD 
	CONSTRAINT [DF__Policies__Policy__7F60ED59] DEFAULT (newid()) FOR [PolicyId]
GO

ALTER TABLE [dbo].[ProcessConfig] WITH NOCHECK ADD 
	CONSTRAINT [DF__ProcessCo__Proce__7C8480AE] DEFAULT (newid()) FOR [ProcessConfigId]
GO

ALTER TABLE [dbo].[ProcessRoles] WITH NOCHECK ADD 
	CONSTRAINT [DF__ProcessRo__Proce__76CBA758] DEFAULT (newid()) FOR [ProcessRoleId],
	CONSTRAINT [ProcessRoles_UC1] UNIQUE  NONCLUSTERED 
	(
		[ProcessId],
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ActorRoles] ADD 
	CONSTRAINT [ProcessConfig_ActorRoles_FK1] FOREIGN KEY 
	(
		[ProcessConfigId]
	) REFERENCES [dbo].[ProcessConfig] (
		[ProcessConfigId]
	),
	CONSTRAINT [ProcessRoles_ActorRoles_FK1] FOREIGN KEY 
	(
		[ProcessRoleId]
	) REFERENCES [dbo].[ProcessRoles] (
		[ProcessRoleId]
	)
GO

ALTER TABLE [dbo].[AddendumNames] ADD 
	CONSTRAINT [Addendums_AddendumNames_FK1] FOREIGN KEY 
	(
		[AddendumId]
	) REFERENCES [dbo].[Addendums] (
		[AddendumId]
	)
GO

ALTER TABLE [dbo].[Addendums] ADD 
	CONSTRAINT [Agreements_Addendums_FK1] FOREIGN KEY 
	(
		[AgreementId]
	) REFERENCES [dbo].[Agreements] (
		[AgreementId]
	),
	CONSTRAINT [ProcessConfig_Addendums_FK1] FOREIGN KEY 
	(
		[ProcessConfigId]
	) REFERENCES [dbo].[ProcessConfig] (
		[ProcessConfigId]
	)
GO

ALTER TABLE [dbo].[AgreementLegalDocuments] ADD 
	CONSTRAINT [FK_AgreementLegalTerms_Agreements] FOREIGN KEY 
	(
		[AgreementId]
	) REFERENCES [dbo].[Agreements] (
		[AgreementId]
	)
GO

ALTER TABLE [dbo].[Agreements] ADD 
	CONSTRAINT [FK_Agreements_Agreements] FOREIGN KEY 
	(
		[TemplateAgreementId]
	) REFERENCES [dbo].[Agreements] (
		[AgreementId]
	)
GO

alter table [dbo].[Agreements] nocheck constraint [FK_Agreements_Agreements]
GO

ALTER TABLE [dbo].[AgreementsNames] ADD 
	CONSTRAINT [Agreements_AgreementsNames_FK1] FOREIGN KEY 
	(
		[AgreementId]
	) REFERENCES [dbo].[Agreements] (
		[AgreementId]
	)
GO

ALTER TABLE [dbo].[LegalDocuments] ADD 
	CONSTRAINT [Addendums_LegalDocuments_FK1] FOREIGN KEY 
	(
		[AddendumId]
	) REFERENCES [dbo].[Addendums] (
		[AddendumId]
	)
GO

ALTER TABLE [dbo].[Parameters] ADD 
	CONSTRAINT [Policies_Parameters_FK1] FOREIGN KEY 
	(
		[PolicyId]
	) REFERENCES [dbo].[Policies] (
		[PolicyId]
	)
GO

ALTER TABLE [dbo].[Policies] ADD 
	CONSTRAINT [Addendums_ProcessParameters_FK1] FOREIGN KEY 
	(
		[ProcessConfigId]
	) REFERENCES [dbo].[ProcessConfig] (
		[ProcessConfigId]
	),
	CONSTRAINT [FK_Policies_PolicyTemplates] FOREIGN KEY 
	(
		[PolicyTemplateId]
	) REFERENCES [dbo].[PolicyTemplates] (
		[PolicyTemplateId]
	)
GO

ALTER TABLE [dbo].[PolicyTemplates] ADD 
	CONSTRAINT [FK_PolicyTemplates_Processes] FOREIGN KEY 
	(
		[ProcessId]
	) REFERENCES [dbo].[Processes] (
		[ProcessId]
	)
GO

ALTER TABLE [dbo].[ProcessConfig] ADD 
	CONSTRAINT [Processes_Addendums_FK1] FOREIGN KEY 
	(
		[ProcessId]
	) REFERENCES [dbo].[Processes] (
		[ProcessId]
	)
GO

ALTER TABLE [dbo].[ProcessRoles] ADD 
	CONSTRAINT [FK_ProcessRoles_Processes] FOREIGN KEY 
	(
		[ProcessId]
	) REFERENCES [dbo].[Processes] (
		[ProcessId]
	)
GO

/*Moving script from TpmWebService.sql*/
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

CREATE PROCEDURE [dbo].[sp_UndeployPartner]
    @partnerId nvarchar(128)
AS
SELECT [Name], Server, DatabaseName
FROM [dbo].[BizTalkServer] INNER JOIN [dbo].[DeployedPartners] ON ([dbo].[BizTalkServer].[BizTalkServerId] = [dbo].[DeployedPartners].[BizTalkServerId])
WHERE [dbo].[DeployedPartners].[PartnerId] = @partnerId

DELETE FROM [dbo].[DeployedPartners]
WHERE [dbo].[DeployedPartners].[PartnerId] = @partnerId
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

CREATE PROCEDURE sp_UpdateOutboxReceiveLocationUriQuery
    @name nvarchar(128),
    @receivelocationuri nvarchar(255)
AS

UPDATE [dbo].[BizTalkServer]
SET [dbo].[BizTalkServer].[ReceiveLocationUri] = @receivelocationuri
WHERE [dbo].[BizTalkServer].[Name] = @name
GO

CREATE PROCEDURE [dbo].[sp_GetPartnersFromBizTalkRegistration]
    @bizTalkRegistrationName nvarchar(128)
AS

SELECT [DeployedPartners].[PartnerId]
FROM [dbo].[BizTalkServer] INNER JOIN [dbo].[DeployedPartners] ON ([dbo].[BizTalkServer].[BizTalkServerId] = [dbo].[DeployedPartners].[BizTalkServerId])
WHERE [dbo].[BizTalkServer].[Name] = @bizTalkRegistrationName
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

CREATE PROCEDURE [dbo].[GetAgreementList]
AS
	/* SET NOCOUNT ON */
	SELECT [Name], [Description], [State] FROM [dbo].[Agreements]
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

INSERT INTO [dbo].[Version]([Version])
VALUES(1.0)
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

/*Taken from TpmDbSendPorts.sql*/
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

/**/

declare @localized_string_allgroups as nvarchar(128)
declare @localized_string_allgroupsdescription as nvarchar(256)
set @localized_string_allgroups = N'Partner Groups'
set @localized_string_allgroupsdescription = N'Partner Groups'

INSERT INTO [dbo].[Group] VALUES(@localized_string_allgroups, '', @localized_string_allgroupsdescription, '1/1/2000')
GO

declare @localized_string_allpartners as nvarchar(128)
declare @localized_string_allpartnersdescription as nvarchar(256)
set @localized_string_allpartners = N'All Partners'
set @localized_string_allpartnersdescription = N'All Partners Group'

INSERT INTO [dbo].[Group] VALUES(@localized_string_allpartners, '', @localized_string_allpartnersdescription, '1/1/2000')
GO

declare @localized_string_self as nvarchar(128)
declare @localized_string_selfdescription as nvarchar(256)
set @localized_string_self = N'My Profiles'
set @localized_string_selfdescription = N'My Profiles Group'

INSERT INTO [dbo].[Group] VALUES(@localized_string_self, '', @localized_string_selfdescription, '1/1/2000')
GO

declare @localized_string_otherpartners as nvarchar(128)
declare @localized_string_otherpartnersdescription as nvarchar(256)
set @localized_string_otherpartners = N'Partner Profiles'
set @localized_string_otherpartnersdescription = N'Partner Profiles Group'

INSERT INTO [dbo].[Group] VALUES(@localized_string_otherpartners, '', @localized_string_otherpartnersdescription, '1/1/2000')
GO
