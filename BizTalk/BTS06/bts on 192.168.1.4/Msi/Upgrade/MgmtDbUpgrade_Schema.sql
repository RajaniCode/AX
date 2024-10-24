--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 


--/ QFE 954

DECLARE @gpsassemblyid AS int, @gpsitemid AS int, @rowcount AS int

SELECT @gpsassemblyid = ( SELECT nID FROM bts_assembly WHERE nvcName = N'Microsoft.BizTalk.GlobalPropertySchemas' )
SELECT @gpsitemid = ( SELECT id FROM bts_item WHERE FullName = N'HTTP.bts_http_properties' )

SET @rowcount = (SELECT COUNT(*) from bt_DocumentSpec WHERE id = N'CACC3ABC-D619-43e6-ADDD-43ED16E16555')
IF (@rowcount = 0)
BEGIN
INSERT INTO bt_DocumentSpec (	id, 
								itemid,
								assemblyid,
								shareid,
								msgtype,
								date_modified,
								body_xpath,
								is_property_schema,
								is_multiroot,
								clr_namespace,
								clr_typename,
								clr_assemblyname,
								schema_root_name,
								xsd_type,
								is_tracked,
								is_flat,
								property_clr_class
							)
		SELECT TOP 1 N'CACC3ABC-D619-43e6-ADDD-43ED16E16555',
					ds.itemid,
					ds.assemblyid,
					ds.shareid,
					N'http://schemas.microsoft.com/BizTalk/2003/http-properties#UserHttpHeaders',
					ds.date_modified,
					ds.body_xpath,
					ds.is_property_schema,
					ds.is_multiroot,
					ds.clr_namespace,
					ds.clr_typename,
					ds.clr_assemblyname,
					N'UserHttpHeaders',
					N'string',
					0,
					ds.is_flat,
					N'UserHttpHeaders'
			FROM bt_DocumentSpec ds
			WHERE itemid = @gpsitemid								
								
	UPDATE bt_XMLShare
	SET content = N'<?xml version="1.0" encoding="utf-16"?>
<xs:schema xmlns="http://schemas.microsoft.com/BizTalk/2003/http-properties" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" elementFormDefault="qualified" targetNamespace="http://schemas.microsoft.com/BizTalk/2003/http-properties" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:annotation>
    <xs:appinfo>
      <b:schemaInfo schema_type="property" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" />
    </xs:appinfo>
  </xs:annotation>
  <xs:element name="ProxyName" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="17c33446-bd04-485b-9660-6ed8b35d1ce9" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="ProxyPort" type="xs:int">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="9fa31e7e-75dc-4f0e-9404-8d1256353d24" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="UseHandlerProxySettings" type="xs:boolean">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="af8e1b11-3966-4a8f-bff4-7fa62285a994" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="UseProxy" type="xs:boolean">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="cac1900c-b3cd-49fa-b8fb-67adb67b8dfc" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="RequestTimeout" type="xs:int">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="5a900672-523c-4835-8323-57143e6c6b84" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="Username" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="a96bfab9-ce40-4ec3-ba68-d872671b8a4c" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="Password" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" isSensitive="true" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="b9f18ea1-5d6a-4dbb-9ada-7382c72bb9d5" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="ProxyUsername" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="a2383245-ecd6-420a-82c5-cb64e0b4e175" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="ProxyPassword" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" isSensitive="true" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="38e28565-e736-456d-b62b-fa4b9f4f3810" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="MaxRedirects" type="xs:int">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="049516aa-66d3-40a6-b9f1-96fe9407e096" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="ContentType" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="a16d1551-0ce9-46ef-8ae8-e8cb00fb1167" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="HttpCookie" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="45bbe7b1-0773-48aa-aa9e-ae53e50733bf" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="AuthenticationScheme" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="4177900e-398b-4211-a470-077c685cd7c3" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="Certificate" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="b9fe34cd-dfaa-4eb4-a151-75b227dcc016" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="UseSSO" type="xs:boolean">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="d024410f-8f24-4ebc-be98-b72386473129" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="AffiliateApplicationName" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="197010ba-8555-4b08-bcef-2de7c8001767" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="InboundHttpHeaders" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="0b87756d-9a02-4ce8-8317-a1726f6b51c7" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="SubmissionHandle" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="55e00564-8aca-4977-ae97-8c590192178d" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="UserHttpHeaders" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="CACC3ABC-D619-43e6-ADDD-43ED16E16555" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
</xs:schema>'

	WHERE target_namespace = N'http://schemas.microsoft.com/BizTalk/2003/http-properties'
END
ELSE
BEGIN
	SELECT 'Skip adding new properties under http://schemas.microsoft.com/BizTalk/2003/http-properties'
END
GO

--/ QFE 976

DECLARE @shareid as uniqueidentifier
DECLARE @itemid as int
DECLARE @assemblyid as int
DECLARE @body_xpath as nvarchar(2421)
DECLARE @is_property_schema as bit
DECLARE @is_multiroot as bit
DECLARE @clr_namespace as nvarchar(256)
DECLARE @clr_typename as nvarchar(256)
DECLARE @clr_assemblyname as nvarchar(512)
DECLARE @docspec_name as nvarchar(256)
DECLARE @schema_root_clr_fqn as nvarchar(256)
DECLARE @is_flat as bit

DECLARE @msgTypePrefix as nvarchar(256)
SELECT @msgTypePrefix='http://schemas.microsoft.com/BizTalk/2003/messagetracking-properties'

SELECT TOP 1 
	@shareid = shareid,
	@itemid = itemid,
	@assemblyid = assemblyid,
	@body_xpath = body_xpath,
	@is_property_schema = is_property_schema,
	@is_multiroot = is_multiroot,
	@clr_namespace = clr_namespace,
	@clr_typename = clr_typename,
	@clr_assemblyname = clr_assemblyname,
	@docspec_name = docspec_name,
	@schema_root_clr_fqn = schema_root_clr_fqn,
	@is_flat = is_flat
FROM
	bt_DocumentSpec
WHERE
	docspec_name='MessageTracking.bts_messagetracking_properties'
	AND clr_assemblyname LIKE 'Microsoft.BizTalk.GlobalPropertySchemas,%'


DECLARE @rowcount AS int
SET @rowcount = (SELECT COUNT(*)
FROM 
	bt_DocumentSpec
WHERE
	docspec_name='MessageTracking.bts_messagetracking_properties'
	AND clr_assemblyname LIKE 'Microsoft.BizTalk.GlobalPropertySchemas,%'
	AND schema_root_name = 'AdapterTransmitBeginTime')


IF(0 = @rowcount)
BEGIN
	SELECT 'Adding 4 new properties under ' + @msgTypePrefix
	INSERT INTO bt_DocumentSpec
		( itemid,  assemblyid,  shareid,  body_xpath,  is_property_schema,  is_multiroot,  clr_namespace,  clr_typename,  clr_assemblyname,  is_flat,  is_tracked, msgtype, schema_root_name, xsd_type, property_clr_class)
	VALUES
		(@itemid, @assemblyid, @shareid, @body_xpath, @is_property_schema, @is_multiroot, @clr_namespace, @clr_typename, @clr_assemblyname, @is_flat, 0, @msgTypePrefix + '#AdapterReceiveBeginTime', 'AdapterReceiveBeginTime', 'dateTime', 'AdapterReceiveBeginTime')

	INSERT INTO bt_DocumentSpec
		( itemid,  assemblyid,  shareid,  body_xpath,  is_property_schema,  is_multiroot,  clr_namespace,  clr_typename,  clr_assemblyname,  is_flat,  is_tracked, msgtype, schema_root_name, xsd_type, property_clr_class)
	VALUES
		(@itemid, @assemblyid, @shareid, @body_xpath, @is_property_schema, @is_multiroot, @clr_namespace, @clr_typename, @clr_assemblyname, @is_flat, 0, @msgTypePrefix + '#AdapterReceiveCompleteTime', 'AdapterReceiveCompleteTime', 'dateTime', 'AdapterReceiveCompleteTime')

	INSERT INTO bt_DocumentSpec
		( itemid,  assemblyid,  shareid,  body_xpath,  is_property_schema,  is_multiroot,  clr_namespace,  clr_typename,  clr_assemblyname,  is_flat,  is_tracked, msgtype, schema_root_name, xsd_type, property_clr_class)
	VALUES
		(@itemid, @assemblyid, @shareid, @body_xpath, @is_property_schema, @is_multiroot, @clr_namespace, @clr_typename, @clr_assemblyname, @is_flat, 0, @msgTypePrefix + '#AdapterTransmitBeginTime', 'AdapterTransmitBeginTime', 'dateTime', 'AdapterTransmitBeginTime')

	INSERT INTO bt_DocumentSpec
		( itemid,  assemblyid,  shareid,  body_xpath,  is_property_schema,  is_multiroot,  clr_namespace,  clr_typename,  clr_assemblyname,  is_flat,  is_tracked, msgtype, schema_root_name, xsd_type, property_clr_class)
	VALUES
		(@itemid, @assemblyid, @shareid, @body_xpath, @is_property_schema, @is_multiroot, @clr_namespace, @clr_typename, @clr_assemblyname, @is_flat, 0, @msgTypePrefix + '#AdapterTransmitCompleteTime', 'AdapterTransmitCompleteTime', 'dateTime', 'AdapterTransmitCompleteTime')
END
ELSE
BEGIN
	SELECT 'Skip adding new properties under ' + @msgTypePrefix
END

GO

--/ QFE 1107

DECLARE @gpsassemblyid AS int, @gpsitemid AS int, @rowcount AS int

SELECT @gpsitemid = ( SELECT id FROM bts_item WHERE FullName = N'LEGACY.bts_legacy_properties' )

SET @rowcount = (SELECT COUNT(*) from bt_DocumentSpec WHERE id = N'FDFC6248-764B-4bde-9548-08A67E124941')
IF (@rowcount = 0)
BEGIN
	INSERT INTO bt_DocumentSpec (	id, 
								itemid,
								assemblyid,
								shareid,
								msgtype,
								date_modified,
								body_xpath,
								is_property_schema,
								is_multiroot,
								clr_namespace,
								clr_typename,
								clr_assemblyname,
								schema_root_name,
								xsd_type,
								is_tracked,
								is_flat,
								property_clr_class
							)
		SELECT TOP 1 N'FDFC6248-764B-4bde-9548-08A67E124941',
					ds.itemid,
					ds.assemblyid,
					ds.shareid,
					N'http://schemas.microsoft.com/BizTalk/2003/legacy-properties#Openness',
					ds.date_modified,
					ds.body_xpath,
					ds.is_property_schema,
					ds.is_multiroot,
					ds.clr_namespace,
					ds.clr_typename,
					ds.clr_assemblyname,
					N'Openness',
					N'int',
					0,
					ds.is_flat,
					N'Openness'
			FROM bt_DocumentSpec ds
			WHERE itemid = @gpsitemid

	UPDATE bt_XMLShare
	SET content = N'<?xml version="1.0" encoding="utf-16"?>
<xs:schema xmlns="http://schemas.microsoft.com/BizTalk/2003/legacy-properties" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" elementFormDefault="qualified" targetNamespace="http://schemas.microsoft.com/BizTalk/2003/legacy-properties" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:annotation>
    <xs:appinfo>
      <b:schemaInfo schema_type="property" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" />
    </xs:appinfo>
  </xs:annotation>
  <xs:element name="DocSpecName" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="8415354d-1ea4-4e68-a35e-7dadbe57ad4b" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>  <xs:element name="SourceQualifier" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="f817f371-484f-466b-9348-46ca7ff8a482" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="SourceID" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propSchFieldBase="MessageContextPropertyBase" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propertyGuid="3deb45bc-5160-45a1-bd0d-3e6945f712bd" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>  
  <xs:element name="DestinationQualifier" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="F3D9EB37-755D-40f8-ADF8-3F114A1FE2E8" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="DestinationID" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="3ea7644c-c497-4d67-ab0e-fff5f8426649" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="ChannelName" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="dd159af3-a42f-450e-a8b9-f250271ab627" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="FilePath" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="AD857D6F-FD05-451f-B4B3-870554F8E4F7" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="EnvelopeName" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="1AAB297C-55B6-4852-9686-B0B90C6F7ED0" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="PassThru" type="xs:boolean">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="07E84553-70C9-4840-AB0B-185054BE9A77" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="SubmissionHandle" type="xs:string">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="E4B1A565-BAB1-4edc-91F5-1C4994B0CCC2" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
  <xs:element name="Openness" type="xs:int">
    <xs:annotation>
      <xs:appinfo>
        <b:fieldInfo propertyGuid="FDFC6248-764B-4bde-9548-08A67E124941" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" propSchFieldBase="MessageContextPropertyBase" />
      </xs:appinfo>
    </xs:annotation>
  </xs:element>
</xs:schema>'

	WHERE target_namespace = N'http://schemas.microsoft.com/BizTalk/2003/legacy-properties'
END
ELSE
BEGIN
	SELECT 'Skip adding new properties under http://schemas.microsoft.com/BizTalk/2003/legacy-properties'
END
GO

--// QFE 1442
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PK_bt_DocumentSpec]') and OBJECTPROPERTY(id, N'IsPrimaryKey') = 1) 
BEGIN
         ALTER TABLE [dbo].[bt_DocumentSpec]	DROP CONSTRAINT [PK_bt_DocumentSpec]
         CREATE  INDEX [IX_bt_DocumentSpec] ON [dbo].[bt_DocumentSpec]([id]) ON [PRIMARY]
END

GO


/**************************************************************************************************

			Log Shipping Updates - Begin

All of the table drops are valid.  Existing data cannot be reused.  A new full backup 
must be taken the next time the backup job runs after the upgrade.  In the case of an uninstall 
the same applies - existing data cannot be reused and a new full backup must be taken the 
next time the backup job runs.

**************************************************************************************************/


/**************************************************************************************************
	adm_BackupSetId table

	Holds a single column/row that indicates the next BackupSetId value.  
	The stored proc sp_GetNextBackupSetId should always be used to retrieve the next id
	as it correctly increments the value and updates the table.
**************************************************************************************************/
IF OBJECT_ID( 'adm_BackupSetId' ) IS NOT NULL
	DROP TABLE [dbo].[adm_BackupSetId]

CREATE TABLE [dbo].[adm_BackupSetId] (
	NextBackupSetId bigint
)

INSERT [dbo].[adm_BackupSetId] VALUES ( 1 )

GO


/**************************************************************************************************
	adm_ForceFullBackup table

	Holds a single column/row that indicates if the backup job should do a full backup
	regardless of scheduling.  This is normally used to recover from error conditions
	that have produced a broken or unrestorable backup set.
**************************************************************************************************/
IF OBJECT_ID('adm_ForceFullBackup') IS NOT NULL
	DROP TABLE [dbo].[adm_ForceFullBackup]
GO

CREATE TABLE [dbo].[adm_ForceFullBackup]
(
	ForceFull	bit NOT NULL DEFAULT 0
)

INSERT [dbo].[adm_ForceFullBackup] VALUES ( 0 )
GO




/**************************************************************************************************
	adm_BackupHistory table

	Holds a record for each database backup
**************************************************************************************************/
IF OBJECT_ID( 'adm_BackupHistory' ) IS NOT NULL
	DROP TABLE [dbo].[adm_BackupHistory]
GO

CREATE TABLE [dbo].[adm_BackupHistory] (
	BackupId		bigint		IDENTITY NOT NULL CONSTRAINT pk_adm_BackupHistory_BackupId PRIMARY KEY CLUSTERED
	,BackupSetId		bigint		NOT NULL
	,MarkName		nvarchar(32)	NULL
	,DatabaseName		nvarchar(128)	NOT NULL
	,BackupFileName		nvarchar(500)	NOT NULL
	,BackupFileLocation	nvarchar(3000)	NOT NULL
	,BackupType		char(2)		NOT NULL
	,BackupDateTime		datetime	NOT NULL DEFAULT GETDATE()
	,SetComplete		bit		NOT NULL DEFAULT 0 -- denormalized column for simplicity
)

ALTER TABLE [dbo].[adm_BackupHistory] ADD CONSTRAINT unq_admBackupHistory_BackupSetId_DatabaseName UNIQUE ( BackupSetId, DatabaseName )

GO

/**************************************************************************************************
	adm_BackupWriterLock table

	Enables the backup job to block log shipping readers so they don't accidentally 
	read a partial set of backup records
**************************************************************************************************/

IF OBJECT_ID( 'adm_BackupWriterLock' ) IS NOT NULL
	DROP TABLE [dbo].[adm_BackupWriterLock]
GO

CREATE TABLE [dbo].[adm_BackupWriterLock](
	Lock	bit NOT NULL
)

INSERT [dbo].[adm_BackupWriterLock] VALUES ( 0 )

GO

/**************************************************************************************************
	[adm_OtherBackupDatabases] table

	Creates this table if one does not exist to keep track of other databases to backup 
**************************************************************************************************/
IF OBJECT_ID('adm_OtherBackupDatabases') IS NULL
BEGIN
	CREATE TABLE [adm_OtherBackupDatabases]([DefaultDatabaseName] nvarchar(128) NOT NULL, [DatabaseName] nvarchar(128) not NULL, [ServerName] nvarchar(80) not NULL, [BTSServerName] nvarchar(80) not NULL)
	ALTER TABLE [adm_OtherBackupDatabases] ADD CONSTRAINT [adm_OtherBackupDatabases_PK] PRIMARY KEY ([DefaultDatabaseName], [BTSServerName])	
END
GO
/**************************************************************************************************
	adm_OtherDatabases table

	Creates this new table to keep track of other databases in the configuration
**************************************************************************************************/
IF OBJECT_ID('adm_OtherDatabases') IS NULL
BEGIN
	CREATE TABLE [adm_OtherDatabases]([DefaultDatabaseName] nvarchar(128) NOT NULL, [DatabaseName] nvarchar(128) not NULL, [ServerName] nvarchar(80) not NULL, [BTSServerName] nvarchar(80) not NULL)
	ALTER TABLE [adm_OtherDatabases] ADD CONSTRAINT [adm_OtherDatabases_PK] PRIMARY KEY ([DefaultDatabaseName], [BTSServerName])
	INSERT INTO [adm_OtherDatabases]
	SELECT ALL * FROM [adm_OtherBackupDatabases]
END
GO
/**************************************************************************************************

			Log Shipping Updates - End

**************************************************************************************************/



/**************************************************************************************************

			Remove Collation on XREF tables

**************************************************************************************************/
--------------------------------------------------------------------------------------------------
-- Create the stored proc for dropping all indexes
--------------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[xref_DropAllIndexes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[xref_DropAllIndexes]
GO

CREATE PROCEDURE [dbo].[xref_DropAllIndexes]
(
	@TableName	nvarchar(255)
)
AS
	DECLARE @index_name nvarchar(255)
	
	CREATE TABLE #indexes_holder 
	(
		index_name varchar(255),
		descr varchar(255),
		index_keys varchar(255)
	)
	INSERT INTO #indexes_holder execute ('sp_helpindex ' + @TableName)
	
	DECLARE index_cursor CURSOR FOR 
	SELECT index_name FROM #indexes_holder

	OPEN index_cursor
	FETCH NEXT FROM index_cursor INTO @index_name
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC ('DROP INDEX [dbo].[' + @TableName + '].' + @index_name)
		FETCH NEXT FROM index_cursor INTO @index_name
	END
	CLOSE index_cursor
	DEALLOCATE index_cursor

	DROP TABLE #indexes_holder
GO
GRANT EXEC ON [dbo].[xref_DropAllIndexes] TO BTS_ADMIN_USERS
GO

--------------------------------------------------------------------------------------------------
-- Create the stored proc for dropping all constraints QFE 973, 1083
--------------------------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[xref_DropAllConstraints]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[xref_DropAllConstraints]
GO

CREATE PROCEDURE [dbo].[xref_DropAllConstraints]
(
	@XType		char(2),
	@TableName	varchar(255)
)
AS	
	DECLARE @constraint_name nvarchar(255)

	-- Drop constraints
	DECLARE constraint_cursor CURSOR FOR
	SELECT name FROM sysobjects WHERE parent_obj = object_id(N'[dbo].[' + @TableName + N']') AND xtype = @XType

	OPEN constraint_cursor
	FETCH NEXT FROM constraint_cursor INTO @constraint_name
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC ('ALTER TABLE [dbo].[' + @TableName + '] DROP CONSTRAINT ' + @constraint_name)
		FETCH NEXT FROM constraint_cursor INTO @constraint_name
	END
	CLOSE constraint_cursor
	DEALLOCATE constraint_cursor

	RETURN
GO
GRANT EXEC ON [dbo].[xref_DropAllConstraints] TO BTS_ADMIN_USERS
GO	

--------------------------------------------------------------------------------------------------------
--Drop consraints and indexes
--------------------------------------------------------------------------------------------------------
EXEC [dbo].[xref_DropAllConstraints] PK, xref_AppInstance
EXEC [dbo].[xref_DropAllConstraints] PK, xref_AppType
EXEC [dbo].[xref_DropAllConstraints] PK, xref_IDXRef
EXEC [dbo].[xref_DropAllConstraints] PK, xref_IDXRefData
EXEC [dbo].[xref_DropAllConstraints] PK, xref_MessageArgument
EXEC [dbo].[xref_DropAllConstraints] PK, xref_MessageDef
EXEC [dbo].[xref_DropAllConstraints] PK, xref_MessageText
EXEC [dbo].[xref_DropAllConstraints] PK, xref_ValueXRef
EXEC [dbo].[xref_DropAllConstraints] PK, xref_ValueXRefData

EXEC [dbo].[xref_DropAllConstraints] UQ, xref_AppInstance
EXEC [dbo].[xref_DropAllConstraints] UQ, xref_AppType
EXEC [dbo].[xref_DropAllConstraints] UQ, xref_IDXRef
EXEC [dbo].[xref_DropAllConstraints] UQ, xref_IDXRefData
EXEC [dbo].[xref_DropAllConstraints] UQ, xref_MessageArgument
EXEC [dbo].[xref_DropAllConstraints] UQ, xref_MessageDef
EXEC [dbo].[xref_DropAllConstraints] UQ, xref_MessageText
EXEC [dbo].[xref_DropAllConstraints] UQ, xref_ValueXRef
EXEC [dbo].[xref_DropAllConstraints] UQ, xref_ValueXRefData

EXEC [dbo].[xref_DropAllIndexes] xref_AppInstance
EXEC [dbo].[xref_DropAllIndexes] xref_AppType
EXEC [dbo].[xref_DropAllIndexes] xref_IDXRef
EXEC [dbo].[xref_DropAllIndexes] xref_IDXRefData
EXEC [dbo].[xref_DropAllIndexes] xref_MessageArgument
EXEC [dbo].[xref_DropAllIndexes] xref_MessageDef
EXEC [dbo].[xref_DropAllIndexes] xref_MessageText
EXEC [dbo].[xref_DropAllIndexes] xref_ValueXRef
EXEC [dbo].[xref_DropAllIndexes] xref_ValueXRefData

-- No longer need the stored procedures, drop them.
DROP PROCEDURE [dbo].[xref_DropAllIndexes]
DROP PROCEDURE [dbo].[xref_DropAllConstraints]

--------------------------------------------------------------------------------------------------------
--Alter Tables to set collation to database default
--------------------------------------------------------------------------------------------------------

ALTER TABLE [dbo].[xref_AppInstance]
ALTER COLUMN [appInstance] [nvarchar] (50) NOT NULL 
GO

ALTER TABLE [dbo].[xref_AppType]
ALTER COLUMN [appType] [nvarchar] (50) NOT NULL 
GO

ALTER TABLE [dbo].[xref_IDXRef]
ALTER COLUMN [idXRef] [nvarchar] (50) NOT NULL 

GO

ALTER TABLE [dbo].[xref_IDXRefData]
ALTER COLUMN [appID] [nvarchar] (255) NOT NULL 
GO

ALTER TABLE [dbo].[xref_IDXRefData]
ALTER COLUMN [commonID] [nvarchar] (50) NOT NULL 

GO

ALTER TABLE [dbo].[xref_MessageArgument]
ALTER COLUMN [argName] [nvarchar] (50) NOT NULL 

GO

ALTER TABLE [dbo].[xref_MessageDef]
ALTER COLUMN [msgCode] [nvarchar] (50) NOT NULL 
GO

ALTER TABLE [dbo].[xref_MessageDef]
ALTER COLUMN [description] [nvarchar] (1000) NULL 

GO

ALTER TABLE [dbo].[xref_MessageText]
ALTER COLUMN [lang] [nvarchar] (10) NOT NULL 
GO

ALTER TABLE [dbo].[xref_MessageText]
ALTER COLUMN [msgText] [nvarchar] (1000) NOT NULL 

GO

ALTER TABLE [dbo].[xref_ValueXRef]
ALTER COLUMN [valueXRefName] [nvarchar] (50) NOT NULL 

GO

ALTER TABLE [dbo].[xref_ValueXRefData]
ALTER COLUMN [appValue] [nvarchar] (50) NOT NULL 
GO

ALTER TABLE [dbo].[xref_ValueXRefData]
ALTER COLUMN [commonValue] [nvarchar] (50) NOT NULL 

GO

--------------------------------------------------------------------------------------------------------
--Add indexes and constraints back
--------------------------------------------------------------------------------------------------------
-- xref_AppInstance
ALTER TABLE [dbo].[xref_AppInstance] WITH NOCHECK ADD
	CONSTRAINT [PK_xref_appInstance] PRIMARY KEY  CLUSTERED 
	(
		[appInstanceID]
	)  ON [PRIMARY] 
GO

CREATE  INDEX [IX_AppInst1] ON [dbo].[xref_AppInstance]([appInstance]) ON [PRIMARY]
GO

-- xref_AppType
ALTER TABLE [dbo].[xref_AppType] WITH NOCHECK ADD
	CONSTRAINT [PK_xref_AppType] PRIMARY KEY  CLUSTERED 
	(
		[appType]
	)  ON [PRIMARY] 
GO

-- xref_IDXRef
ALTER TABLE [dbo].[xref_IDXRef] WITH NOCHECK ADD
	CONSTRAINT [PK_xref_IDXRef] PRIMARY KEY  CLUSTERED 
	(
		[idXRefID]
	)  ON [PRIMARY] 
GO

CREATE  INDEX [IX_xref_IDXRef_1] ON [dbo].[xref_IDXRef]([idXRef]) ON [PRIMARY]
GO

-- xref_IDXRefData
CREATE  CLUSTERED  INDEX [CIX_xref_IDXRefData] ON [dbo].[xref_IDXRefData]([idXRefID], [appInstanceID], [appID], [commonID]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[xref_IDXRefData] WITH NOCHECK ADD
	CONSTRAINT [IX_xref_IDXRefData_appID] UNIQUE  NONCLUSTERED 
	(
		[appID],
		[idXRefID],
		[appInstanceID]
	)  ON [PRIMARY] ,
	CONSTRAINT [IX_xref_IDXRefData_commonID] UNIQUE  NONCLUSTERED 
	(
		[commonID],
		[idXRefID],
		[appInstanceID]
	)  ON [PRIMARY] 
GO

-- xref_MessageArgument
CREATE  CLUSTERED  INDEX [CX_xref_MessageArgument] ON [dbo].[xref_MessageArgument]([msgID], [argSequenceNum]) ON [PRIMARY]
GO

-- xref_MessageDef
ALTER TABLE [dbo].[xref_MessageDef] WITH NOCHECK ADD
	CONSTRAINT [PK_uan_MessageDef] PRIMARY KEY  CLUSTERED 
	(
		[msgID]
	)  ON [PRIMARY] 
GO

CREATE  INDEX [IX_xref_MessageDef_1] ON [dbo].[xref_MessageDef]([msgCode]) ON [PRIMARY]
GO

-- xref_MessageText
CREATE  CLUSTERED  INDEX [CX_xref_MessageText_1] ON [dbo].[xref_MessageText]([lang], [msgID]) ON [PRIMARY]
GO

-- xref_ValueXRef
ALTER TABLE [dbo].[xref_ValueXRef] WITH NOCHECK ADD
	CONSTRAINT [PK_xref_ValueXRef] PRIMARY KEY  CLUSTERED 
	(
		[valueXRefID]
	)  ON [PRIMARY] 
GO

CREATE  INDEX [IX_xref_ValueXRef_1] ON [dbo].[xref_ValueXRef]([valueXRefName]) ON [PRIMARY]
GO

-- xref_ValueXRefData
CREATE  INDEX [IX_xref_ValueXRefData_1] ON [dbo].[xref_ValueXRefData]([commonValue]) ON [PRIMARY]
GO

CREATE  INDEX [IX_xref_ValueXRefData_2] ON [dbo].[xref_ValueXRefData]([appValue]) ON [PRIMARY]
GO

--**************************************************************************************************
--	BizTalk Server 2006 changes to BizTalkMgmtDb
--**************************************************************************************************

--
-- 1. Updates from bts_administration_schema.sql
--

-- Add new columns
ALTER TABLE [dbo].[adm_Group] ADD BizTalkOperatorGroup             nvarchar(128) not null default('')
GO

ALTER TABLE [dbo].[adm_Group] ADD GroupPropertyIdentifier		uniqueidentifier not null default('{00000000-0000-0000-0000-000000000000}')
GO

ALTER TABLE [dbo].[adm_Host] ADD ClusterResourceGroupName          nvarchar(256) null 
GO

UPDATE [dbo].[adm_Host] SET ClusterResourceGroupName = ''
GO

ALTER TABLE [dbo].[adm_Host] ALTER COLUMN ClusterResourceGroupName nvarchar(256) not null
GO

ALTER TABLE [dbo].[adm_Host] ADD IsHost32BitOnly                   bit           null
GO

UPDATE [dbo].[adm_Host] SET IsHost32BitOnly = 1
GO

ALTER TABLE [dbo].[adm_Host] ALTER COLUMN IsHost32BitOnly          bit           not null
GO

ALTER TABLE [dbo].[adm_Host] ADD MessageDeliverySampleSpaceSize    int        not null default(100)
ALTER TABLE [dbo].[adm_Host] ADD MessageDeliverySampleSpaceWindow  int        not null default(15000)
ALTER TABLE [dbo].[adm_Host] ADD MessageDeliveryOverdriveFactor    int        not null default(125)
ALTER TABLE [dbo].[adm_Host] ADD MessageDeliveryMaximumDelay       int        not null default(300000)
ALTER TABLE [dbo].[adm_Host] ADD MessagePublishSampleSpaceSize     int        not null default(100)
ALTER TABLE [dbo].[adm_Host] ADD MessagePublishSampleSpaceWindow   int        not null default(15000)
ALTER TABLE [dbo].[adm_Host] ADD MessagePublishOverdriveFactor     int        not null default(125)
ALTER TABLE [dbo].[adm_Host] ADD MessagePublishMaximumDelay        int        not null default(300000)
ALTER TABLE [dbo].[adm_Host] ADD DeliveryQueueSize                 int        not null default(100)
ALTER TABLE [dbo].[adm_Host] ADD DBSessionThreshold                int        not null default(0)
ALTER TABLE [dbo].[adm_Host] ADD GlobalMemoryThreshold             int        not null default(0)
ALTER TABLE [dbo].[adm_Host] ADD ProcessMemoryThreshold            int        not null default(25)
ALTER TABLE [dbo].[adm_Host] ADD ThreadThreshold                   int        not null default(0)
ALTER TABLE [dbo].[adm_Host] ADD DBQueueSizeThreshold              int        not null default(50000)
ALTER TABLE [dbo].[adm_Host] ADD InflightMessageThreshold          int        not null default(1000)
ALTER TABLE [dbo].[adm_Host] ADD ThreadPoolSize                    int        not null default(20)
ALTER TABLE [dbo].[adm_Host] ADD DBLatencyThreshold		   int        not null default(0)
GO

ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_MessageDeliverySampleSpaceSize    CHECK (MessageDeliverySampleSpaceSize   >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_MessageDeliverySampleSpaceWindow  CHECK (MessageDeliverySampleSpaceWindow >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_MessageDeliveryOverdriveFactor    CHECK (MessageDeliveryOverdriveFactor   >= 100 )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_MessageDeliveryMaximumDelay       CHECK (MessageDeliveryMaximumDelay      >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_MessagePublishSampleSpaceSize     CHECK (MessagePublishSampleSpaceSize    >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_MessagePublishSampleSpaceWindow   CHECK (MessagePublishSampleSpaceWindow  >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_MessagePublishOverdriveFactor     CHECK (MessagePublishOverdriveFactor    >= 100 )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_MessagePublishMaximumDelay        CHECK (MessagePublishMaximumDelay       >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_DeliveryQueueSize                 CHECK (DeliveryQueueSize                >= 1   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_DBSessionThreshold                CHECK (DBSessionThreshold               >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_GlobalMemoryThreshold             CHECK (GlobalMemoryThreshold            >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_ProcessMemoryThreshold            CHECK (ProcessMemoryThreshold           >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_ThreadThreshold                   CHECK (ThreadThreshold                  >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_DBQueueSizeThreshold              CHECK (DBQueueSizeThreshold             >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_InflightMessageThreshold          CHECK (InflightMessageThreshold         >= 0   )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_ThreadPoolSize                    CHECK (ThreadPoolSize                   >= 1 and ThreadPoolSize <= 50 )
ALTER TABLE [dbo].[adm_Host] ADD CONSTRAINT adm_Host_DBLatencyThreshold                CHECK (DBLatencyThreshold               >= 0   )
GO

ALTER TABLE [dbo].[adm_SendHandler] ADD IsDefault                  bit           not null default(1)
ALTER TABLE [dbo].[adm_SendHandler] DROP CONSTRAINT                adm_SendHandler_unique_key
GO

ALTER TABLE [dbo].[adm_SendHandler] ADD CONSTRAINT adm_SendHandler_unique_key	unique(HostId, AdapterId)
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'bts_createsubids' AND type = 'TR')
   DROP TRIGGER bts_createsubids
GO

ALTER TABLE [dbo].[bts_dynamicport_subids] ADD nvcHostName	nvarchar(80) NULL
GO

ALTER TABLE [dbo].[adm_ReceiveLocation] ADD SendPipelineId             int           null
ALTER TABLE [dbo].[adm_ReceiveLocation] ADD EncryptionCert             nvarchar(256) null
ALTER TABLE [dbo].[adm_ReceiveLocation] ADD EncryptionCertThumbPrint   nvarchar(80)  null
ALTER TABLE [dbo].[adm_ReceiveLocation] ADD Description                ntext         null
ALTER TABLE [dbo].[adm_ReceiveLocation] ADD SendPipelineData           ntext         null
GO

ALTER TABLE [dbo].[adm_MessageBox]      ADD nvcDescription	nvarchar(256) null
ALTER TABLE [dbo].[adm_HostInstance]    ADD nvcDescription	nvarchar(256) null
ALTER TABLE [dbo].[adm_ReceiveHandler]  ADD nvcDescription	nvarchar(256) null
ALTER TABLE [dbo].[adm_SendHandler]     ADD nvcDescription	nvarchar(256) null
GO


-- Update MQSeries Adapter

IF EXISTS(select * from adm_Adapter where MgmtCLSID=N'{B0942470-A5A1-45AF-8D01-27481B306441}')
BEGIN
UPDATE adm_Adapter
SET 
	InboundTypeName = N'Microsoft.BizTalk.Adapter.MqsAdapter.MqsReceiver, Microsoft.BizTalk.Adapter.MQS',
	OutboundTypeName = N'Microsoft.BizTalk.Adapter.MqsAdapter.MqsTransmitter, Microsoft.BizTalk.Adapter.MQS'
WHERE MgmtCLSID = N'{B0942470-A5A1-45AF-8D01-27481B306441}'	
END
GO

-- Making MSMQT adapter removable
UPDATE [dbo].[adm_Adapter] SET Capabilities = 16463 WHERE Name = 'MSMQT'
GO

-- Create BAS Properties Table
CREATE TABLE [dbo].[bas_Properties] (
	[PropertyName] [nvarchar] (80) NOT NULL ,
	[PropertyValue] [nvarchar] (260) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[bas_Properties] WITH NOCHECK ADD 
	CONSTRAINT [PK_bas_Properties] PRIMARY KEY  CLUSTERED 
	(
		[PropertyName]
	)  ON [PRIMARY] 
GO

-- Allow select for operators
GRANT SELECT ON [dbo].[adm_Group] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[adm_Server] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[adm_Host] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[adm_Adapter] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[adm_ReceiveHandler] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[adm_SendHandler] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[adm_ReceiveLocation] TO BTS_OPERATORS


--
-- 2. Updates from bts_administration_schema_eap2rtm.sql
--

UPDATE adm_ServiceClass SET LowMemorymark = 90, ThrottleFlag = 2 WHERE Name = N'Messaging InProcess'
UPDATE adm_ServiceClass SET LowMemorymark = 90, ThrottleFlag = 2 WHERE Name = N'Messaging Isolated'

-- Add new adapter aliases for MSMQT
declare @MSMQT_AdapterId as int
select @MSMQT_AdapterId = Id from adm_Adapter where MgmtCLSID = '{9A7B0162-2CD5-4F61-B7EB-C40A3442A5F8}'

-- If MSMQT adapter has been installed
if ( @MSMQT_AdapterId > 0 )
begin
	if not exists ( select * from adm_AdapterAlias where AdapterId = @MSMQT_AdapterId and AliasValue = N'DIRECT=' )
		insert into adm_AdapterAlias (AdapterId, AliasValue) values (@MSMQT_AdapterId, N'DIRECT=')

	if not exists ( select * from adm_AdapterAlias where AdapterId = @MSMQT_AdapterId and AliasValue = N'PRIVATE=' )
		insert into adm_AdapterAlias (AdapterId, AliasValue) values (@MSMQT_AdapterId, N'PRIVATE=')

	if not exists ( select * from adm_AdapterAlias where AdapterId = @MSMQT_AdapterId and AliasValue = N'PUBLIC=' )
		insert into adm_AdapterAlias (AdapterId, AliasValue) values (@MSMQT_AdapterId, N'PUBLIC=')
end

--
-- 3. Updates from partnermgmt_schema.sql and bts_deployment_schema.sql
--

-- Add Tables to support the application feature
if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_application_reference]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_application_reference]
if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_application]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_application]
CREATE TABLE [dbo].[bts_application]
(
	nID int identity(1, 1),
	nvcName nvarchar(256) NOT NULL,
	isDefault bit NOT NULL,
	isSystem bit NOT NULL, 
	nvcDescription nvarchar(1024) NULL,
	DateModified datetime NOT NULL,

	CONSTRAINT bts_application_unique_key	primary key(nID),
	CONSTRAINT bts_application_unique_name	unique(nvcName),
)
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[bts_application] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[bts_application] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[bts_application] TO BTS_OPERATORS
GO

CREATE TABLE [dbo].[bts_application_reference]
(
	nID int identity(1, 1),
	nApplicationID int,
	nReferencedApplicationID int,

	CONSTRAINT bts_applicationreference_unique_key	primary key(nID),
	CONSTRAINT bts_application_reference_unique	unique(nApplicationID, nReferencedApplicationID),
)
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[bts_application_reference] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[bts_application_reference] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[bts_application_reference] TO BTS_OPERATORS
GO

-- Add pre-defined applications
declare @localized_string_default_application_name AS nvarchar(256)
set @localized_string_default_application_name = N'BizTalk Application 1'
if not exists(select * from bts_application where nvcName = @localized_string_default_application_name)
begin
    insert into bts_application(nvcName, isDefault, isSystem, nvcDescription, DateModified) values(@localized_string_default_application_name, 1, 0, N'BizTalk Application 1', GETUTCDATE())
end
GO

declare @localized_string_system_application_name AS nvarchar(256)
set @localized_string_system_application_name = N'BizTalk.System'
if not exists(select * from bts_application where nvcName = @localized_string_system_application_name)
begin
    insert into bts_application(nvcName, isDefault, isSystem, nvcDescription, DateModified) values(@localized_string_system_application_name, 0, 1, N'System Application', GETUTCDATE())
end
GO

-- Add Application ID and other new columns to required artifact tables
ALTER TABLE [dbo].[bts_sendport] ADD nApplicationID          int            NULL
GO

UPDATE [dbo].[bts_sendport] SET nApplicationID = 1
GO

ALTER TABLE [dbo].[bts_sendport] ALTER COLUMN nApplicationID int            NOT NULL
GO

ALTER TABLE [dbo].[bts_sendport] ADD nvcDescription        nvarchar(1024) NULL 
ALTER TABLE [dbo].[bts_sendport] ADD bStopSendingOnFailure bit            NULL
ALTER TABLE [dbo].[bts_sendport] ADD bRouteFailedMessage   bit            NULL
GO

ALTER TABLE [dbo].[bts_sendport_transport] ADD nSendHandlerID   int       NULL
ALTER TABLE [dbo].[bts_sendport_transport] ADD CONSTRAINT bts_sendport_transport_foreign_sendhandlerid foreign key(nSendHandlerID) references [dbo].[adm_SendHandler](Id)
GO

ALTER TABLE [dbo].[bts_sendportgroup] ADD nApplicationID           int   NULL
GO

UPDATE [dbo].[bts_sendportgroup] SET nApplicationID = 1
GO

ALTER TABLE [dbo].[bts_sendportgroup] ALTER COLUMN nApplicationID  int   NOT NULL 
GO

ALTER TABLE [dbo].[bts_sendportgroup] ADD nvcDescription   nvarchar(1024) NULL
GO

ALTER TABLE [dbo].[bts_receiveport] ADD nApplicationID          int          NULL
GO

UPDATE [dbo].[bts_receiveport] SET nApplicationID = 1
GO

ALTER TABLE [dbo].[bts_receiveport] ALTER COLUMN nApplicationID int          NOT NULL 
GO

ALTER TABLE [dbo].[bts_receiveport] ADD nvcDescription       nvarchar(1024)  NULL
ALTER TABLE [dbo].[bts_receiveport] ADD bRouteFailedMessage  bit             NULL DEFAULT(0)
GO

ALTER TABLE [dbo].[bts_pipeline] ADD [nvcDescription] [nvarchar] (1024) NULL
ALTER TABLE [dbo].[bts_pipeline] ADD [Release] [int] NULL
GO

UPDATE [dbo].[bts_pipeline] SET Release = 1
GO

ALTER TABLE [dbo].[bts_pipeline] ALTER COLUMN [Release] [int] NOT NULL
GO

ALTER TABLE [dbo].[bts_assembly] ADD [nApplicationID] [int] NULL
GO

UPDATE [dbo].[bts_assembly] SET nApplicationID = 1
GO

ALTER TABLE [dbo].[bts_assembly] ALTER COLUMN [nApplicationID] [int] NOT NULL
GO

GRANT UPDATE ON [dbo].[bts_assembly] TO BTS_ADMIN_USERS
GO

ALTER TABLE [dbo].[bts_orchestration] ADD [nvcDescription] [nvarchar] (1024) NULL
GO

ALTER TABLE [dbo].[bt_DocumentSpec] ADD	[description] [nvarchar] (1024) NULL
GO

ALTER TABLE [dbo].[bt_MapSpec] ADD [description] [nvarchar] (1024) NULL 
GO

ALTER TABLE [dbo].[bts_item] ADD [description] [nvarchar] (1024) NULL
GO

-- Grant Select permission to the operator role
GRANT SELECT ON [dbo].[bts_sendport_transport] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_sendport] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_sendport_transform] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_party] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_party_alias] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_party_sendport] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_sendportgroup] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_spg_sendport] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_receiveport] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_receiveport_transform] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_orchestration_port_binding] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_enlistedparty] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_enlistedparty_operation_mapping] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_enlistedparty_port_mapping] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_pipeline] TO BTS_OPERATORS
GRANT UPDATE ON [dbo].[bts_pipeline] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[bts_component] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[bts_stage_config] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[bts_pipeline_stage] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[bts_pipeline] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[bt_DocumentSpec] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bt_MapSpec] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bt_Properties] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bt_XMLShare] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_item] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_assembly] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_rolelink_type] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_role] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_role_porttype] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_porttype] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_porttype_operation] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_orchestration] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_rolelink] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_orchestration_port] TO BTS_OPERATORS
GRANT SELECT ON [dbo].[bts_orchestration_invocation] TO BTS_OPERATORS

GO

--
-- 4. Additional updates
--

-- Add reference from 'BizTalk Application 1' (default application) to 'System Application'
if not exists(select * from bts_application_reference where nApplicationID = 1 and nReferencedApplicationID = 2)
begin
    insert into bts_application_reference(nApplicationID, nReferencedApplicationID) values(1, 2)
end
GO

-- Move BizTalk assemblies to System App
UPDATE bts_assembly 
SET nApplicationID = 2 
WHERE nvcName in (
                'Microsoft.BizTalk.GlobalPropertySchemas',
                'Microsoft.BizTalk.DefaultPipelines',
                'Microsoft.BizTalk.Hws.HwsPromotedProperties',
                'Microsoft.BizTalk.Hws.HwsSchemas',
                'Microsoft.BizTalk.KwTpm.StsDefaultPipelines',
                'Microsoft.BizTalk.KwTpm.RoleLinkTypes'
                )
GO

-- Set the send handler ID for sendport transport 
UPDATE bts_sendport_transport
SET
	nSendHandlerID = adm_SendHandler.Id
FROM
	adm_SendHandler
WHERE
	adm_SendHandler.AdapterId = bts_sendport_transport.nTransportTypeId
GO

-- Set Message tracking options for SendPorts and ReceivePorts
UPDATE bts_sendport SET nTracking = nTracking | 16 | 32
UPDATE bts_receiveport SET nTracking = nTracking | 16 | 32
GO

-- Set Message tracking options for orchestrations
DECLARE @uidServiceId uniqueidentifier
DECLARE @uidInterceptorId uniqueidentifier
DECLARE @trackingOptionLowByte varbinary(1)
DECLARE @tempTxtPtr varbinary(16)

DECLARE trackingInfo_cursor CURSOR FOR
    SELECT uidServiceId, uidInterceptorId FROM StaticTrackingInfo

OPEN trackingInfo_cursor

FETCH NEXT FROM trackingInfo_cursor
    INTO @uidServiceId, @uidInterceptorId

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @trackingOptionLowByte = SUBSTRING(imgData, 1, 1),
            @tempTxtPtr = textptr(StaticTrackingInfo.imgData)
        FROM StaticTrackingInfo 
        WHERE uidServiceId = @uidServiceId AND uidInterceptorId = @uidInterceptorId

    IF(@tempTxtPtr is not null)
    BEGIN
        SET @trackingOptionLowByte = @trackingOptionLowByte | 32 | 64
        UPDATETEXT StaticTrackingInfo.imgData @tempTxtPtr 0 1 @trackingOptionLowByte 
    END

    FETCH NEXT FROM trackingInfo_cursor
    INTO @uidServiceId, @uidInterceptorId
END
CLOSE trackingInfo_cursor
DEALLOCATE trackingInfo_cursor
GO

-- Update receive location table with its parent receive port pipeline data

UPDATE adm_ReceiveLocation
SET SendPipelineId = bts_receiveport.nSendPipelineId,
    SendPipelineData = bts_receiveport.nvcSendPipelineData
FROM bts_receiveport
WHERE adm_ReceiveLocation.ReceivePortId = bts_receiveport.nID
GO

/******************************************************************************
* Dropping stored procs which are not present in a BizTalk Server 2006-only install
*
*******************************************************************/

IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[trk_EnumAppModules]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [trk_EnumAppModules]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[trk_GetLibraryModuleFromServiceType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [trk_GetLibraryModuleFromServiceType]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[trk_GetTrackingProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [trk_GetTrackingProfile]

GO

--
-- 5. Updates from BTS_Tracking_Editor.sql.
--    Also recreating sprocs here instead of running the sql file so that quoted_identifier and ansi_nulls values are
--    set appropriately.
--
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_TrackPoints]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_TrackPoints]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_TrackingProfiles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_TrackingProfiles]
CREATE TABLE [dbo].[bam_TrackPoints] (
	[nTrackPointId] [int] NOT NULL ,
	[nProfileId] [int] NOT NULL ,
	[nvcMsgType] [nvarchar](2048) NULL ,
	[uidPortId] [uniqueidentifier] NOT NULL ,
	[nDirection] [int] NOT NULL ,
	[ntxtData] [ntext] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[bam_TrackingProfiles] (
	[nvcName] [nvarchar] (128) NOT NULL ,
	[uidVersionId] [uniqueidentifier] NOT NULL ,
	[nMinorVersionId] [int] NOT NULL ,
	[nID] [int] NOT NULL IDENTITY(1,1)
) ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_ActivityToOrchestrationMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_ActivityToOrchestrationMapping]
GO
CREATE TABLE [dbo].[bam_ActivityToOrchestrationMapping] (
	[activityName]	[nvarchar](128) NOT NULL ,
	[serviceId]	[uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO

--
-- 6. Updates from PartnerMgmt_Schema.sql, bts_Administration_Schema.sql
--
if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_removeschema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[bts_removeschema]
GO

CREATE PROCEDURE [dbo].[bts_removeschema]
AS
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_removeschema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_removeschema]
	
	--/---------------------------------------------------------------------------------------------------------------
	--// Partner Management tables
	--/---------------------------------------------------------------------------------------------------------------
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_enlistedparty_operation_mapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_enlistedparty_operation_mapping]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_enlistedparty_port_mapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_enlistedparty_port_mapping]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_enlistedparty]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_enlistedparty]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_orchestration_port_binding]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_orchestration_port_binding]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_receiveport_transform]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_receiveport_transform]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_receiveport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_receiveport]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_spg_sendport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_spg_sendport]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_sendportgroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_sendportgroup]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_dynamicport_subids]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_dynamicport_subids]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_party_alias]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_party_alias]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_party_sendport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_party_sendport]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_party]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_party]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_sendport_transform]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_sendport_transform]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_sendport_transport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_sendport_transport]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_sendport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_sendport]

	-- Tables to support the application feature
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_application_reference]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_application_reference]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_application]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bts_application]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_removeschema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) 
	drop procedure [dbo].[adm_removeschema]
GO

CREATE PROCEDURE [dbo].[adm_removeschema]
AS

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_removeschema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[adm_removeschema]

   --/---------------------------------------------------------------------------------------------------------------
   --// Trackinginterceptor Configuration tables
   --/---------------------------------------------------------------------------------------------------------------
   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StaticTrackingInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[StaticTrackingInfo]
   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TrackinginterceptorVersions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[TrackinginterceptorVersions]
   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Trackinginterceptor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Trackinginterceptor]
   

	--/---------------------------------------------------------------------------------------------------------------
	--// Specific Constraints
	--/---------------------------------------------------------------------------------------------------------------
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group_fk_DefaultHost]')and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
		alter table [dbo].[adm_Group] drop constraint adm_Group_fk_DefaultHost

	--/---------------------------------------------------------------------------------------------------------------
	--// Admin tables
	--/---------------------------------------------------------------------------------------------------------------
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ServiceClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_ServiceClass]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveLocation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_ReceiveLocation]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_AdapterAlias]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_AdapterAlias]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_DefaultReceiveHandler]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_DefaultReceiveHandler]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveHandler]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_ReceiveHandler]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_SendHandler]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveService]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_ReceiveService]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstanceZombie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_HostInstanceZombie]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_HostInstance]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Server2HostMapping]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Host]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance_SubServices]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_HostInstance_SubServices]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_MessageBox]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Group]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Server]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Adapter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[adm_Adapter]

	--/---------------------------------------------------------------------------------------------------------------
	--// Backup tables
	--/---------------------------------------------------------------------------------------------------------------
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_BackupHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) 
		DROP TABLE [dbo].[adm_BackupHistory]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_OtherBackupDatabases]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 		DROP TABLE [dbo].[adm_OtherBackupDatabases]

	IF exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ForceFullBackup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE [dbo].[adm_ForceFullBackup]

	IF exists (select * from sysobjects where id = object_id(N'[dbo].[adm_BackupSetId]' ) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE [dbo].[adm_BackupSetId]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[adm_BackupWriterLock]' ) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE [dbo].[adm_BackupWriterLock]

	--/------------------------------------------------------------------------------------------------------
	--// Views for getting local and utc date values for access in user functions
	--/------------------------------------------------------------------------------------------------------
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_UTCDate]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[admv_UTCDate]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_LocalDate]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[admv_LocalDate]

	--/------------------------------------------------------------------------------------------------------
	--// BAS Table
	--/------------------------------------------------------------------------------------------------------
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[bas_Properties]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE [dbo].[bas_Properties]

	
	--/------------------------------------------------------------------------------------------------------
	--// TPE Table
	--/------------------------------------------------------------------------------------------------------
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_TrackPoints]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_TrackPoints]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_TrackingProfiles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_TrackingProfiles]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bam_ActivityToOrchestrationMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[bam_ActivityToOrchestrationMapping]

GO

--Temporary hack to workaround an issue in Yukon. This will be removed for BETA2 when Yukon fixes this
--*******************************************************
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_LocalDate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bts_LocalDate]
GO

CREATE TABLE [dbo].[bts_LocalDate] (
	[dt] datetime NOT NULL
)
GO

INSERT INTO bts_LocalDate (dt) VALUES (GetDATE())
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_UTCDate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bts_UTCDate]
GO

CREATE TABLE [dbo].[bts_UTCDate] (
	[dt] datetime NOT NULL
)
GO

INSERT INTO bts_UTCDate (dt) VALUES (GetUTCDate())
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_UpdateStoredTimeStamps]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  drop procedure [dbo].[bts_UpdateStoredTimeStamps]
GO

CREATE PROCEDURE [dbo].[bts_UpdateStoredTimeStamps]
AS
	UPDATE bts_LocalDate SET dt = GetDate()
	UPDATE bts_UTCDate SET dt = GetUTCDate()
GO

--************************************************************************
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_LocalDate]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[admv_LocalDate]
GO

CREATE VIEW [dbo].[admv_LocalDate]
AS
	--SELECT GetDate() AS LocalDate
	SELECT dt as LocalDate FROM bts_LocalDate
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_UTCDate]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[admv_UTCDate]
GO

CREATE VIEW [dbo].[admv_UTCDate]
AS
	--SELECT GetUTCDate() AS UTCDate
	SELECT dt as UTCDate FROM bts_UTCDate
GO

--//
--// Updates for Orchestration Event Stream
--//
DECLARE	@rowCount INT
SELECT	@rowCount = COUNT(*) 
FROM	TDDS_CustomFormats
WHERE	FormatID = N'{1a6c57f0-3826-4254-9a91-9813a4cf2fce}'

IF (@rowCount = 0)
BEGIN
	INSERT INTO	TDDS_CustomFormats(
		FormatID,
		DecoderClass,
		DllName
	)
	VALUES(
		N'{1a6c57f0-3826-4254-9a91-9813a4cf2fce}', 
		N'Microsoft.BizTalk.Bam.EventBus.DotNetDeserializer', 
		N'Microsoft.BizTalk.Bam.EventBus.dll'
	)
END
GO
