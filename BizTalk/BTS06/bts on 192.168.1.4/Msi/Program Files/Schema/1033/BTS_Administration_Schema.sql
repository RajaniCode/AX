--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 


-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Remove existing global constraints
-- //////////////////////////////////////////////////////////////////////////////////////////////////
if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_removeconstraints]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) exec bts_removeconstraints
GO


-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Remove existing Admin schema
-- //////////////////////////////////////////////////////////////////////////////////////////////////
if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_removeschema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) exec adm_removeschema
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
	--// Backup tables and views
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

	IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[admv_BackupDatabases]') and OBJECTPROPERTY(id, N'IsView') = 1)
		DROP VIEW [dbo].[admv_BackupDatabases]
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

--/----------------------------------------------------------------------------------------------------------------
--
-- create views for accessing dates in user functions
--
--/--------------------------------------------------------------------------------------------------------------
CREATE VIEW [dbo].[admv_LocalDate]
AS
	SELECT GetDate() AS LocalDate
GO

CREATE VIEW [dbo].[admv_UTCDate]
AS
	SELECT GetUTCDate() AS UTCDate
GO

--/---------------------------------------------------------------------------------------------------------------
--
-- create tables ordered by referential integrity
--
--/---------------------------------------------------------------------------------------------------------------


--/---------------------------------------------------------------------------------------------------------------
--// Admin tables definition
--/---------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[adm_Group]
(
	Id									int				not null	identity(1,1),
	Name								nvarchar(256)	not null,
	DateModified						datetime		not null	default GETUTCDATE(),
	BizTalkAdminGroup					nvarchar(128)	not null,
	TrackingDBServerName				nvarchar(80)	not null,
	TrackingDBName						nvarchar(128)	not null,
	SubscriptionDBServerName			nvarchar(80)	not null,
	SubscriptionDBName					nvarchar(128)	not null,
	TrackAnalysisServerName				nvarchar(80)	not null,
	TrackAnalysisDBName					nvarchar(128)	not null,
	BamDBServerName						nvarchar(80)	not null,
	BamDBName							nvarchar(128)	not null,
	RuleEngineDBServerName				nvarchar(80)	not null,
	RuleEngineDBName					nvarchar(128)	not null,
	SSOServerName						nvarchar(80)	not null,
	GlobalTrackingOption				int				not null,
	SignCertName						nvarchar(256)	not null,
	SignCertThumbprint					nvarchar(80)	not null,
	ConfigurationCacheRefreshInterval	int				not null,
	TrackingConfiguration				image			not null	default 0x13000000,	-- Service = 1, MessageMetadata = 2, InMessageBody = 4, OutMessageBody = 8, InternalActions = 16, InternalBody = 32
	LMSFragmentSize						int				not null,	-- Fragment size (Kb) - defines the size of fragments that are stored in Message Box (Default value defined in MSBTS3.mof file)
	LMSThreshold						int				not null,	-- Large message threshold (factor of fragment size) - defines the size threshold at which to start fragmenting the messages in Message Box (Default value defined in MSBTS3.mof file)
	DefaultHostId						int				null,
	BizTalkOperatorGroup					nvarchar(128)	not null default(''),
	GroupPropertyIdentifier					uniqueidentifier not null default('{00000000-0000-0000-0000-000000000000}'),

	CONSTRAINT adm_Group_pk					primary key(Id),
	CONSTRAINT adm_Group_unique_key			unique(Name),
)
GO
GRANT SELECT ON [dbo].[adm_Group] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[adm_Group] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[adm_Group] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_MessageBox]
(
	Id						int				not null	identity(1,1),
	GroupId					int				not null,
	DateModified			datetime		not null	default GETUTCDATE(),
	DBServerName			nvarchar(80)	not null,
	DBName					nvarchar(128)	not null,
	DisableNewMsgPublication int				not null,
	ConfigurationState		int				not null,
	UniqueId			uniqueidentifier not null	default NEWID(),
	IsMasterMsgBox         int            not null,
	nvcDescription			nvarchar(256)	null,

	CONSTRAINT adm_MessageBox_pk			primary key(Id),
	CONSTRAINT adm_MessageBox_unique_key	unique(DBServerName, DBName),
	CONSTRAINT adm_MessageBox_fk_group		foreign key(GroupId) references adm_Group(Id),
)
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_Server]
(
	Id								int				not null	identity(1,1),
	Name							nvarchar(63)	not null,
	DateModified					datetime		not null	default GETUTCDATE(),

	CONSTRAINT adm_Server_pk			primary key(Id),
	CONSTRAINT adm_Server_unique_key	unique(Name),
)
GRANT SELECT ON [dbo].[adm_Group] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[adm_Server] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[adm_Server] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_Host]
(
	Id				int				not null	identity(1,1),
	GroupId			int				not null,
	Name			nvarchar(80)	not null,
	NTGroupName		nvarchar(128)	not null,
	DateModified	datetime		not null	default GETUTCDATE(),
	LastUsedLogon	nvarchar(128)	not null,
	HostTracking	int				not null,
	AuthTrusted		int				not null,
	HostType		int				not null,	-- 1-eHostTypeInProcess,
												-- 2-eHostTypeIsolated,
	DecryptCertName       nvarchar(256)	not null,
	DecryptCertThumbprint nvarchar(80)		not null,                                    
	
	ClusterResourceGroupName nvarchar(256)	not null,
	IsHost32BitOnly        bit           not null,

	-- Throttling Configuration
	MessageDeliverySampleSpaceSize    int  not null default(100),
	MessageDeliverySampleSpaceWindow  int  not null default(15000),
	MessageDeliveryOverdriveFactor    int  not null default(125),
	MessageDeliveryMaximumDelay       int  not null default(300000),
	MessagePublishSampleSpaceSize     int  not null default(100),
	MessagePublishSampleSpaceWindow   int  not null default(15000),
	MessagePublishOverdriveFactor     int  not null default(125),
	MessagePublishMaximumDelay        int  not null default(300000),
	DeliveryQueueSize                 int  not null default(100),
	DBSessionThreshold                int  not null default(0),
	GlobalMemoryThreshold             int  not null default(0),
	ProcessMemoryThreshold            int  not null default(25),
	ThreadThreshold                   int  not null default(0),
	DBQueueSizeThreshold              int  not null default(50000),
	InflightMessageThreshold          int  not null default(1000),
	ThreadPoolSize                    int  not null default(20),

	CONSTRAINT adm_Host_MessageDeliverySampleSpaceSize    CHECK (MessageDeliverySampleSpaceSize   >= 0   ),
	CONSTRAINT adm_Host_MessageDeliverySampleSpaceWindow  CHECK (MessageDeliverySampleSpaceWindow >= 0),
	CONSTRAINT adm_Host_MessageDeliveryOverdriveFactor    CHECK (MessageDeliveryOverdriveFactor   >= 100 ),
	CONSTRAINT adm_Host_MessageDeliveryMaximumDelay       CHECK (MessageDeliveryMaximumDelay      >= 0   ),
	CONSTRAINT adm_Host_MessagePublishSampleSpaceSize     CHECK (MessagePublishSampleSpaceSize    >= 0   ),
	CONSTRAINT adm_Host_MessagePublishSampleSpaceWindow   CHECK (MessagePublishSampleSpaceWindow  >= 0),
	CONSTRAINT adm_Host_MessagePublishOverdriveFactor     CHECK (MessagePublishOverdriveFactor    >= 100 ),
	CONSTRAINT adm_Host_MessagePublishMaximumDelay        CHECK (MessagePublishMaximumDelay       >= 0   ),
	CONSTRAINT adm_Host_DeliveryQueueSize                 CHECK (DeliveryQueueSize                >= 1   ),
	CONSTRAINT adm_Host_DBSessionThreshold                CHECK (DBSessionThreshold               >= 0   ),
	CONSTRAINT adm_Host_GlobalMemoryThreshold             CHECK (GlobalMemoryThreshold            >= 0   ),
	CONSTRAINT adm_Host_ProcessMemoryThreshold            CHECK (ProcessMemoryThreshold           >= 0   ),
	CONSTRAINT adm_Host_ThreadThreshold                   CHECK (ThreadThreshold                  >= 0   ),
	CONSTRAINT adm_Host_DBQueueSizeThreshold              CHECK (DBQueueSizeThreshold             >= 0   ),
	CONSTRAINT adm_Host_InflightMessageThreshold          CHECK (InflightMessageThreshold         >= 0   ),
	CONSTRAINT adm_Host_ThreadPoolSize                    CHECK (ThreadPoolSize                   >= 1 and ThreadPoolSize <= 50 ),

	CONSTRAINT adm_Host_pk			primary key(Id),
	CONSTRAINT adm_Host_unique_key	unique(GroupId, Name),
	CONSTRAINT adm_Host_fk_group		foreign key(GroupId) references adm_Group(Id),
)

ALTER TABLE adm_Group ADD CONSTRAINT adm_Group_fk_DefaultHost foreign key(DefaultHostId) references adm_Host(Id)
GO
GRANT SELECT ON [dbo].[adm_Host] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[adm_Host] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[adm_Host] TO BTS_OPERATORS
GO

--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_Server2HostMapping]
(
	Id				int			not null	identity(1,1),
	ServerId		int			not null,
	HostId			int			not null,
	DateModified	datetime	not null	default GETUTCDATE(),
	IsMapped		int			not null,

	CONSTRAINT adm_Server2HostMapping_pk			primary key(Id),
	CONSTRAINT adm_Server2HostMapping_unique_key	unique(ServerId, HostId),
	CONSTRAINT adm_Server2HostMapping_fk_server		foreign key(ServerId) references adm_Server(Id),
	CONSTRAINT adm_Server2HostMapping_fk_host		foreign key(HostId) references adm_Host(Id),
)
GO

--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_HostInstance]
(
	Id					int				not null	identity(1,1),
	Svr2HostMappingId	int			not null,
	Name				nvarchar(256)	not null,
	DateModified		datetime		not null	default GETUTCDATE(),
	LoginName			nvarchar(128)	not null,
	DisableHostInstance  int				not null,
	ConfigurationState	int				not null,
	UniqueId			uniqueidentifier not null	default NEWID(),
	InstallationContext nvarchar(256)	not null	default N'',
	nvcDescription		nvarchar(256)	null,
	
	CONSTRAINT adm_HostInstance_pk			primary key(Id),
	CONSTRAINT adm_HostInstance_unique_key	unique(Svr2HostMappingId),
	CONSTRAINT adm_HostInstance_unique_id	unique(UniqueId),
--	CONSTRAINT adm_HostInstance_fk_Host		foreign key(HostId) references adm_Host(Id),
	CONSTRAINT adm_HostInstance_fk_srv2host	foreign key(Svr2HostMappingId) references adm_Server2HostMapping(Id),
)
GO

--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_HostInstance_SubServices]
(
	Id					int				not null	identity(1,1),
	Name				nvarchar(256)	not null,
	MonikerName			nvarchar(256)	not null,
	ContextParam		nvarchar(256)	not null,
	Type				int		 		not null,	-- 0 required by everybody,
													-- 1 required by Tracking,
													-- 2 required by Messaging,
													-- 4 required by XLANG
													-- 16 required by MSMQT
	UniqueId			uniqueidentifier not null	default NEWID(),
--	DateModified		datetime		not null	default GETUTCDATE(),
)
GO

--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_HostInstanceZombie]
(
	Id					int				not null	identity(1,1),
	Name				nvarchar(256)	not null,
	GroupName			nvarchar(256)	not null,
	HostName			nvarchar(80)	not null,
	ServerName			nvarchar(63)	not null,
	DateModified		datetime		not null	default GETUTCDATE(),
	NTGroupName			nvarchar(128)	not null,
	LoginName			nvarchar(128)	not null,
	UniqueId			uniqueidentifier not null,

	CONSTRAINT adm_HostInstanceZombie_pk				primary key(Id),
--	CONSTRAINT adm_HostInstanceZombie_unique_key		unique(Svr2MsgBoxMappingId, HostId),
	CONSTRAINT adm_HostInstanceZombie_unique_id		unique(UniqueId),
--	CONSTRAINT adm_HostInstanceZombie_fk_host		foreign key(HostId) references adm_Host(Id),
--	CONSTRAINT adm_HostInstanceZombie_fk_svr2msgbox	foreign key(Svr2HostMappingId) references adm_Server2HostMapping(Id),
)
GO

--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_Adapter]
(
	Id						int					not null	identity(1,1),
	Name					nvarchar(256)		not null,
	Capabilities			int					not null	default(0),
															-- 1-eProtocolSupportsReceive,
															-- 2-eProtocolSupportsTransmit,
															-- 4-eProtocolRequireSingleInstancePerServer,
															-- 8-eProtocolReceiveIsCreatable,
															-- 16-eProtocolIsApplicationProtocol,
															-- 32-eProtocolDeleteProtected,
															-- 64-eProtocolStaticHandlers - one receive and send handler mapped to the same App; handlers cannot be reassigned to different app (MSMQT-like)
															-- 128-eProtocolSupportsRequestResponse - inbound synchronous message pattern
															-- 256-eProtocolSupportsSolicitResponse - outbound synchronous message pattern
															-- 512-eProtocolSupportsSOAP - SOAP
															-- 1024-eOutboundProtocolRequiresContextInitialization - property page provider needs to be initialized with GUID of the property page provider and UI plug-in
															-- 2048-eInboundProtocolRequiresContextInitialization - property page provider needs to be initialized with GUID of the property page provider and UI plug-in
															-- 4096-eReceiveLocationRequiresContextInitialization - property page provider needs to be initialized with GUID of the property page provider and UI plug-in
															-- 8192-eTransmitLocationRequiresContextInitialization - property page provider needs to be initialized with GUID of the property page provider and UI plug-in
															-- 16384-eSupportsOrderedDelivery - SupportsOrderedDelivery
															-- 32768-eInitTransmitterOnServiceStart - transmitter will be started when the service starts instead of when the first message to be sent
	Comment					nvarchar(256)		not null,
	DateModified			datetime			not null	default GETUTCDATE(),
--	IsDeleteProtected		int					not null	default(0),

	MgmtCLSID				uniqueidentifier 	not null,	-- CLSID of the management component for the transport
-- either InboundEngineCLSID or both InboundAssemblyPath and InboundTypeName must be specified at the same time.
	InboundEngineCLSID		uniqueidentifier 	null,	-- CLSID of the receive run-time component
	InboundAssemblyPath		nvarchar(256)		null,	
	InboundTypeName			nvarchar(256)		null,
-- either OutboundEngineCLSID or both OutboundAssemblyPath and OutboundTypeName must be specified at the same time.
	OutboundEngineCLSID		uniqueidentifier 	null,	-- CLSID of the send run-time component
	OutboundAssemblyPath	nvarchar(256)		null,	
	OutboundTypeName		nvarchar(256)		null,
	PropertyNameSpace		nvarchar(256)		not null,

	DefaultRHCfg			ntext				null,
	DefaultTHCfg			ntext				null,

	CONSTRAINT adm_Adapter_pk				primary key(Id),
	CONSTRAINT adm_Adapter_unique_key1		unique(Name),
	CONSTRAINT adm_Adapter_unique_key2		unique(MgmtCLSID)
)
GO
GRANT SELECT ON [dbo].[adm_Adapter] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[adm_Adapter] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[adm_Adapter] TO BTS_OPERATORS
GO

--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_ReceiveHandler]
(
	Id					int						not null	identity(1,1),
	GroupId				int						not null,
--	Name				nvarchar(256)			not null,
--	VirtServerName		nvarchar(256)			not null,
	AdapterId			int						not null,
	HostId				int						null,
	CustomCfg			ntext					null,
	uidCustomCfgID		uniqueidentifier 		not null	default NEWID(),
	uidReceiveLocationSSOAppID		uniqueidentifier 		not null	default NEWID(),
	DateModified		datetime				not null	default GETUTCDATE(),
	nvcDescription		nvarchar(256)			null,
	
	CONSTRAINT adm_ReceiveHandler_pk			primary key(Id),
--	CONSTRAINT adm_ReceiveHandler_unique_key	unique(Name, GroupId),
	CONSTRAINT adm_ReceiveHandler_unique_key	unique(HostId, AdapterId),
	CONSTRAINT adm_ReceiveHandler_fk_host		foreign key(HostId) references adm_Host(Id),
	CONSTRAINT adm_ReceiveHandler_fk_group		foreign key(GroupId) references adm_Group(Id),
	CONSTRAINT adm_ReceiveHandler_fk_adapter	foreign key(AdapterId) references adm_Adapter(Id),
	
)
GO
GRANT SELECT ON [dbo].[adm_ReceiveHandler] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[adm_ReceiveHandler] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[adm_ReceiveHandler] TO BTS_OPERATORS
GO

--/---------------------------------------------------------------------------------------------------------------
--CREATE TABLE [dbo].[adm_DefaultReceiveHandler]
--(
--	Id					int				not null	identity(1,1),
--	GroupId				int				not null,
--	AdapterId			int				not null,
--	ReceveiHandlerId	int				not null,
--
--	CONSTRAINT adm_DefaultReceiveHandler_pk				primary key(Id),
--	CONSTRAINT adm_DefaultReceiveHandler_unique_key		unique(GroupId, AdapterId),	-- only one default for adapter per group is allowed
--	CONSTRAINT adm_DefaultReceiveHandler_fk_adapter	foreign key(AdapterId) references adm_Adapter(Id),
--	CONSTRAINT adm_DefaultReceiveHandler_fk_group		foreign key(GroupId) references adm_Group(Id),
--	CONSTRAINT adm_DefaultReceiveHandler_fk_RH			foreign key(ReceiveHandlerId) references adm_ReceiveHandler(Id),
--)
--GO

--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_SendHandler]
(
	Id					int						not null	identity(1,1),
	GroupId				int						not null,
--	Name				nvarchar(256)			not null,
	AdapterId			int						not null,
	HostId				int						null,
	IsDefault			bit						not null	default 1,
	CustomCfg			ntext					null,
	DateModified		datetime				not null	default GETUTCDATE(),
	SubscriptionId		uniqueidentifier		null,
	uidCustomCfgID		uniqueidentifier 		not null	default NEWID(),
	uidTransmitLocationSSOAppId		uniqueidentifier		not null	default NEWID(),
	nvcDescription		nvarchar(256)			null,
	
	CONSTRAINT adm_SendHandler_pk			primary key(Id),
--	CONSTRAINT adm_SendHandler_unique_key	unique(Name, GroupId),
--	CONSTRAINT adm_SendHandler_unique_key	unique(GroupId, AdapterId),
	CONSTRAINT adm_SendHandler_unique_key	unique(HostId, AdapterId),
	CONSTRAINT adm_SendHandler_fk_host	foreign key(HostId) references adm_Host(Id),
	CONSTRAINT adm_SendHandler_fk_group		foreign key(GroupId) references adm_Group(Id),
	CONSTRAINT adm_SendHandler_fk_adapter	foreign key(AdapterId) references adm_Adapter(Id),
)
GO
GRANT SELECT ON [dbo].[adm_SendHandler] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[adm_SendHandler] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[adm_SendHandler] TO BTS_OPERATORS
GO

--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_ReceiveLocation]
(
	Id						int				not null	identity(1,1),
	AdapterId				int				not null,
	Name					nvarchar(256)   not null,
	ReceiveHandlerId		int				null,
	GroupId					int				null,
	DateModified			datetime		not null	default GETUTCDATE(),
	Comment					nvarchar(256)	not null,
	OperatingWindowEnabled	int				not null,
	ActiveStartDT			datetime		null,
	ActiveStopDT			datetime		null,
	StartDTEnabled			bit				not null,
	SrvWinStartDT			datetime		null,
	StopDTEnabled			bit				not null,
	SrvWinStopDT			datetime		null,
	Disabled				int				not null,
	CustomCfg				ntext			null,
	uidCustomCfgID			uniqueidentifier 	null,
	bSSOMappingExists		bit				not null,
--	InboundTransportWSDL	nvarchar(1024)	null, -- not being used
	InboundTransportURL		nvarchar(256)	not null, -- SQL limits unique key size to 900 bytes
	InboundAddressableURL	nvarchar(256)	null, -- SQL limits unique key size to 900 bytes
	ReceivePipelineId		int				null, -- changed to null to allow unbinding
	ReceivePipelineData		ntext			null ,
	ReceivePortId			int				not null,
	IsPrimary				int				not null,
	Fragmentation			int				not null	default 0,
	nvcCustomData			ntext			null ,
	SendPipelineId			int			null,
	EncryptionCert			nvarchar(256)		null,
	EncryptionCertThumbPrint	nvarchar(80)		null,
	Description 			ntext			null,
	SendPipelineData		ntext			null,
	
--	InboundEnvelopeName		nvarchar(64)	null,
--	OutboundEnvelopeName	nvarchar(64)	null,

	CONSTRAINT adm_ReceiveLocation_pk			primary key(Id),
	CONSTRAINT adm_ReceiveLocation_unique_key	unique(InboundTransportURL),
	CONSTRAINT adm_ReceiveLocation_unique_key1	unique(Name, GroupId),
--	CONSTRAINT adm_ReceiveLocation_unique_key2	unique(InboundAddressableURL),	
	CONSTRAINT adm_ReceiveLocation_fk_group		foreign key(GroupId) references adm_Group(Id),
	CONSTRAINT adm_ReceiveLocation_fk_RH		foreign key(ReceiveHandlerId) references adm_ReceiveHandler(Id),
	CONSTRAINT adm_ReceiveLocation_fk_adapter	foreign key(AdapterId) references adm_Adapter(Id),
	CONSTRAINT adm_ReceiveLocation_EnabledOnlyWhenHasHost  CHECK((Disabled <> 0) OR (ReceiveHandlerId IS NOT NULL)),
)
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[adm_ReceiveLocation] TO BTS_ADMIN_USERS
GRANT SELECT ON [dbo].[adm_ReceiveLocation] TO BTS_HOST_USERS
GRANT SELECT ON [dbo].[adm_ReceiveLocation] TO BTS_OPERATORS
GO

CREATE NONCLUSTERED INDEX adm_ReceiveLocation_ix_RH ON [dbo].[adm_ReceiveLocation] (ReceiveHandlerId)
GO

--/---------------------------------------------------------------------------------------------------------------
--/--- Each Adapter may have one or more aliases, the alias is used for dynamic send ports -----------------------
--/--- to determine the transport type.
--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[adm_AdapterAlias]
(
	Id						int				not null	identity(1,1),
	AdapterId				int				not null,
	AliasValue				nvarchar(64)	not null,

	CONSTRAINT adm_AdapterAlias_pk			primary key(Id),
	CONSTRAINT adm_AdapterAlias_unique_key	unique(AliasValue),
)
GO

CREATE TABLE [dbo].[adm_ServiceClass]
(
	Id							int					not null	identity(1,1),
	Name						nvarchar(256)		not null,
	UniqueId					uniqueidentifier	not null,
	LowWatermark				int					not null,
	HighWatermark				int					not null,
	BatchSize					int					not null,
	MaxReceiveInterval			int					not null,
	SingleDequeueSession		int					not null,
	SerializeInstanceDelivery	int					not null,
	GroupBatchByInstance		int					not null,
	LowMemorymark				int					not null,
	HighMemorymark				int					not null,
	ThrottleFlag				int					not null,
	LowSessionmark				int					not null,
	HighSessionmark				int					not null,
	CacheInstanceState			int					not null,
	MaxDequeueThread			int					not null,

	CONSTRAINT adm_ServiceClass_unique_key	unique(Name),
)
GO


--/---------------------------------------------------------------------------------------------------------------
--// MessageBox Configuration tables
--/---------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[StaticTrackingInfo] (
	GroupId 					int   			 NULL,
	strServiceName				nvarchar(256)	 NOT NULL,
	uidServiceId				uniqueidentifier NOT NULL,
	uidInterceptorId 			uniqueidentifier NOT NULL,
    dtDeploymentTime			datetime		 NOT NULL,
	dtUndeploymentTime			datetime		 NULL,
    ismsgBodyTrackingEnabled    int              NOT NULL,
    imgData						image			 NULL,
    
	CONSTRAINT adm_StaticTrackingInfo_pk		primary key(uidServiceId, uidInterceptorId),
	CONSTRAINT StaticTrackingInfo_fk_group  	foreign key(GroupId) references adm_Group(Id) on delete cascade,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Trackinginterceptor] (
	uidInterceptorID 			uniqueidentifier	NOT NULL,
	InterceptorType				int					NOT NULL, -- 0 stands for XLANGs interceptor, 1 stands for Messaging interceptor, 
	AssemblyName				nvarchar(256)		not null,
	TypeName					nvarchar(256)		not null
    
	CONSTRAINT adm_Trackinginterceptor_pk		primary key(uidInterceptorID),
)
GO

CREATE TABLE [dbo].[TrackinginterceptorVersions] (
	uidRootInterceptorID		uniqueidentifier	NOT NULL, -- Relation with the TrackingInterceptor Table. Id of the root interceptor
	uidInterceptorID			uniqueidentifier	NOT NULL, -- Version Id for the Interceptor
	AssemblyName				nvarchar(1024)		NOT NULL, -- Strong name of the assembly
	TypeName					nvarchar(256)		NOT NULL, -- Type Name of the interceptor
	dtDeploymentTime			datetime			NOT NULL  -- Deployment time of this version of the interceptor

	CONSTRAINT adm_TrackinginterceptorVersions_idx_version	PRIMARY KEY(uidInterceptorID),
	CONSTRAINT adm_TrackinginterceptorVersions_fk_id		FOREIGN KEY(uidRootInterceptorID) REFERENCES Trackinginterceptor(uidInterceptorID),
)
GO


/**************************************************************************************************
	adm_BackupSetId table

	Holds a single column/row that indicates the next BackupSetId value.  
	The stored proc sp_GetNextBackupSetId should always be used to retrieve the next id
	as it correctly increments the value and updates the table.
**************************************************************************************************/

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

CREATE TABLE [dbo].[adm_ForceFullBackup]
(
	ForceFull	bit NOT NULL DEFAULT 0
)

INSERT [dbo].[adm_ForceFullBackup] VALUES ( 0 )
GO


CREATE TABLE [dbo].[adm_BackupWriterLock](
	Lock	bit NOT NULL
)

INSERT [dbo].[adm_BackupWriterLock] VALUES ( 0 )
GO

/**************************************************************************************************
	adm_BackupHistory table

	Holds a row for each database back produced
**************************************************************************************************/

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
	,ServerName		nvarchar(128)	NULL --allow nulls to support upgrade
)
GO
CREATE UNIQUE INDEX [IX_BackupHistory] ON [adm_BackupHistory]( BackupSetId, DatabaseName, ServerName  )
GO


/****************************************************************************************************
		[adm_OtherBackupDatabases] table

	Holds information on tables outside our default tables which we need to backup.

****************************************************************************************************/
CREATE TABLE [adm_OtherBackupDatabases](
	[DefaultDatabaseName] nvarchar(128) NOT NULL,
	[DatabaseName] nvarchar(128) not NULL,
	[ServerName] nvarchar(80) not NULL,
	[BTSServerName] nvarchar(80) not NULL
)


ALTER TABLE [adm_OtherBackupDatabases] ADD CONSTRAINT [adm_OtherBackupDatabases_PK] PRIMARY KEY ([DefaultDatabaseName], [BTSServerName])	
GO

/*****************************************************************************************************
		[dbo].[admv_BackupDatabases]

	View of all databases which we need to backup
***************************************************************************************************/

CREATE VIEW [dbo].[admv_BackupDatabases]
AS

	SELECT CAST(SERVERPROPERTY('servername') as sysname) as ServerName, DB_NAME() as DatabaseName
	
	UNION
	
	SELECT TrackingDBServerName as ServerName, TrackingDBName as DatabaseName FROM [dbo].[adm_Group] 
	WHERE TrackingDBServerName IS NOT NULL AND TrackingDBServerName != '' 

	UNION
	
	SELECT BamDBServerName as ServerName, BamDBName as DatabaseName FROM [dbo].[adm_Group] 
	WHERE BamDBServerName IS NOT NULL AND BamDBServerName != ''
	
	UNION
	
	SELECT RuleEngineDBServerName as ServerName, RuleEngineDBName as DatabaseName FROM [dbo].[adm_Group] 
	WHERE RuleEngineDBServerName IS NOT NULL AND RuleEngineDBServerName != ''
	
	UNION

	SELECT 	DBServerName as ServerName, DBName as DatabaseName FROM [dbo].[adm_MessageBox]
	WHERE DBServerName IS NOT NULL AND DBServerName != ''
	
	UNION 
	
	SELECT ServerName, DatabaseName	FROM [dbo].[adm_OtherBackupDatabases]
	WHERE ServerName IS NOT NULL AND ServerName != ''
	GROUP BY ServerName, DatabaseName --group by here so we can handle dupe rows
GO


-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Populate default values to tables
-- //////////////////////////////////////////////////////////////////////////////////////////////////

BEGIN
	set nocount on

	-- Populate other DTA tables with default values
	declare @localized_string_HTTP_Comment as nvarchar(256)
	declare @localized_string_SOAP_Comment as nvarchar(256)
	declare @localized_string_FILE_Comment as nvarchar(256)
	declare @localized_string_WSS_Comment as nvarchar(256)
	declare @localized_string_SMTP_Comment as nvarchar(256)
	declare @localized_string_SQL_Comment as nvarchar(256)
	declare @localized_string_FTP_Comment as nvarchar(256)
	declare @localized_string_POP3_Comment as nvarchar(256)
	declare @localized_string_MSMQ_Comment as nvarchar(256)
	declare @localized_string_EDI_Comment as nvarchar(256)
	declare @localized_string_BTF_Comment as nvarchar(256)
	declare @localized_string_MQS_Comment as nvarchar(256)
	declare @DefaultHTTP_RcvHandler_CFG as nvarchar(1024)
	declare @DefaultHTTP_SendHandler_CFG as nvarchar(1024)
	declare @DefaultSOAP_RcvHandler_CFG as nvarchar(1024)
	declare @DefaultSOAP_SendHandler_CFG as nvarchar(1024)
	declare @DefaultFILE_RcvHandler_CFG as nvarchar(1024)
	declare @DefaultFILE_SendHandler_CFG as nvarchar(1024)
	declare @DefaultWSS_RcvHandler_CFG as nvarchar(1024)
	declare @DefaultWSS_SendHandler_CFG as nvarchar(1024)
	declare @DefaultSMTP_SendHandler_CFG as nvarchar(1024)
	declare @DefaultSQL_RcvHandler_CFG as nvarchar(1024)
	declare @DefaultSQL_SendHandler_CFG as nvarchar(1024)
	declare @DefaultFTP_RcvHandler_CFG as nvarchar(1024)
	declare @DefaultFTP_SendHandler_CFG as nvarchar(1024)
	declare @DefaultMSMQ_RcvHandler_CFG as nvarchar(1024)
	declare @DefaultMSMQ_SendHandler_CFG as nvarchar(1024)
	declare @DefaultMQS_RcvHandler_CFG as nvarchar(1024)
	declare @DefaultMQS_SendHandler_CFG as nvarchar(1024)
	
	declare @HTTP_AdapterId as int
	declare @SOAP_AdapterId as int
	declare @FILE_AdapterId as int
	declare @WSS_AdapterId as int
	declare @SMTP_AdapterId as int
	declare @SQL_AdapterId as int
	declare @FTP_AdapterId as int
	declare @POP3_AdapterId as int
	declare @MSMQ_AdapterId as int
	declare @EDI_AdapterId as int
	declare @BTF_AdapterId as int
	declare @MQS_AdapterId as int

	-- Localizable Strings
	set @localized_string_HTTP_Comment = N'HTTP adapter'
	set @localized_string_SOAP_Comment = N'SOAP adapter'
	set @localized_string_FILE_Comment = N'FILE adapter'
	set @localized_string_WSS_Comment = N'Windows SharePoint Services adapter'
	set @localized_string_SMTP_Comment = N'SMTP adapter'
	set @localized_string_SQL_Comment = N'SQL adapter'
	set @localized_string_FTP_Comment = N'FTP adapter'
	set @localized_string_POP3_Comment = N'POP3 adapter'
	set @localized_string_MSMQ_Comment = N'MSMQ adapter'
	set @localized_string_EDI_Comment = N'EDI adapter'
	set @localized_string_BTF_Comment = N'BTF adapter'
	set @localized_string_MQS_Comment = N'MQSeries adapter'
	
	set @DefaultHTTP_RcvHandler_CFG = N'<CustomProps/>'
	set @DefaultHTTP_SendHandler_CFG = N'<CustomProps><RequestTimeout vt="3">0</RequestTimeout><MaxRedirects vt="3">5</MaxRedirects><ContentType vt="8">text/xml</ContentType><UseProxy vt="11">0</UseProxy><ProxyPort vt="19">80</ProxyPort></CustomProps>'
	set @DefaultSOAP_RcvHandler_CFG = N'<CustomProps/>'
	set @DefaultSOAP_SendHandler_CFG = N'<CustomProps><ProxyPort vt="3">80</ProxyPort><UseProxy vt="11">0</UseProxy></CustomProps>'
	
	set @DefaultFILE_RcvHandler_CFG = N'<CustomProps/>'
	set @DefaultFILE_SendHandler_CFG = N'<CustomProps/>'

	set @DefaultWSS_RcvHandler_CFG = N'<CustomProps/>'
	set @DefaultWSS_SendHandler_CFG = N'<CustomProps/>'
	
	set @DefaultSMTP_SendHandler_CFG = N'<CustomProps><SMTPAuthenticate vt="19">2</SMTPAuthenticate></CustomProps>'
	
	set @DefaultSQL_RcvHandler_CFG = N'<CustomProps/>'
	set @DefaultSQL_SendHandler_CFG = N'<CustomProps/>'
	set @DefaultFTP_RcvHandler_CFG = N'<CustomProps/>'
	set @DefaultFTP_SendHandler_CFG = N'<CustomProps/>'
	set @DefaultMSMQ_RcvHandler_CFG = N'<CustomProps/>'
	set @DefaultMSMQ_SendHandler_CFG = N'<CustomProps/>'
	set @DefaultMQS_RcvHandler_CFG = N'<CustomProps/>'
	set @DefaultMQS_SendHandler_CFG = N'<CustomProps/>'

	-- Definitions for default set of adapters
	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, OutboundEngineCLSID, OutboundTypeName, PropertyNameSpace, DefaultRHCfg, DefaultTHCfg)
				VALUES	(N'HTTP',
						 N'{1C56D157-0553-4345-8A1F-55D2D1A3FFB6}',
						 @localized_string_HTTP_Comment, 387,
						 N'{9d0e430c-4cce-4536-83fa-4a5040674ad6}', 
						 N'{6B12DCBB-37B4-4f9a-AFA5-C3F9B7400CD1}',
						 N'Microsoft.BizTalk.HttpTransport.HttpTransmitter, Microsoft.BizTalk.HttpTransport, Version=3.0.1.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
						 N'http://schemas.microsoft.com/BizTalk/2003/http-properties',
						 @DefaultHTTP_RcvHandler_CFG, 
						 @DefaultHTTP_SendHandler_CFG)
	set @HTTP_AdapterId = @@IDENTITY
	
	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, InboundTypeName, OutboundEngineCLSID, OutboundTypeName, PropertyNameSpace, DefaultRHCfg, DefaultTHCfg)
				VALUES	(N'SOAP',
						 N'{7E104B2F-003C-4d9f-A6A5-168F727289F0}',
						 @localized_string_SOAP_Comment, 899,
						 N'{C8F975BF-5C97-4f17-9CA1-F894BC258761}',
						 N'Microsoft.BizTalk.WebServices.ServerProxy',
						 N'{6796973A-3ABB-30F7-A30A-A48797B885BD}',
						 N'Microsoft.BizTalk.SoapTransport,Microsoft.BizTalk.SoapTransport',
						 N'http://schemas.microsoft.com/BizTalk/2003/soap-properties',
						 @DefaultSOAP_RcvHandler_CFG, 
						 @DefaultSOAP_SendHandler_CFG)
	set @SOAP_AdapterId = @@IDENTITY

	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, OutboundEngineCLSID, PropertyNameSpace, DefaultRHCfg, DefaultTHCfg)
				VALUES	(N'FILE',
						 N'{5E49E3A6-B4FC-4077-B44C-22F34A242FDB}', @localized_string_FILE_Comment, 11,
						 N'{9d0e4357-4cce-4536-83fa-4a5040674ad6}',
						 N'{9d0e4341-4cce-4536-83fa-4a5040674ad6}',
						 N'http://schemas.microsoft.com/BizTalk/2003/file-properties',
						 @DefaultFILE_RcvHandler_CFG, 
						 @DefaultFILE_SendHandler_CFG)
	set @FILE_AdapterId = @@IDENTITY

	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, InboundTypeName,OutboundEngineCLSID, OutboundTypeName, PropertyNameSpace, DefaultRHCfg, DefaultTHCfg)
				VALUES	(N'Windows SharePoint Services',
						 N'{BA7DAD66-5FC8-4a24-A27E-D9F68FD67C3A}', @localized_string_WSS_Comment, 15371,
						 N'{24F0A7F1-1E1C-489a-AB5C-26BDB9B63978}',
						 N'Microsoft.BizTalk.KwTpm.WssAdapter.SharePointReceiver, Microsoft.BizTalk.KwTpm.WssAdapter.Runtime, Culture=neutral, PublicKeyToken=31bf3856ad364e35, Version=3.0.1.0',
						 N'{C3A1A6BA-CF8E-4803-BB45-509BAB393CE7}',
						 N'Microsoft.BizTalk.KwTpm.WssAdapter.SharePointTransmitter, Microsoft.BizTalk.KwTpm.WssAdapter.Runtime, Culture=neutral, PublicKeyToken=31bf3856ad364e35, Version=3.0.1.0',
						 N'http://schemas.microsoft.com/BizTalk/2006/WindowsSharePointServices-properties',
						 @DefaultWSS_RcvHandler_CFG, 
						 @DefaultWSS_SendHandler_CFG)
	set @WSS_AdapterId = @@IDENTITY

	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, OutboundEngineCLSID, PropertyNameSpace, DefaultTHCfg)
				VALUES	(N'SMTP',
						 N'{8F36B311-B670-4CF6-AAEC-04EBB80ED48D}', @localized_string_SMTP_Comment, 2,
						 N'{9d0e4344-4cce-4536-83fa-4a5040674ad6}',
						 N'http://schemas.microsoft.com/BizTalk/2003/smtp-properties',
						 @DefaultSMTP_SendHandler_CFG)
	set @SMTP_AdapterId = @@IDENTITY

	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, OutboundEngineCLSID, InboundTypeName, OutboundTypeName, DefaultRHCfg, DefaultTHCfg, PropertyNameSpace)
				VALUES	(N'SQL',
						 N'{6E688659-1374-4F37-90DC-40CB6DD3C73D}',
						 @localized_string_SQL_Comment, 81163,
						 N'{1784F66B-E2FD-4AE4-9A61-E8D1A80EDFB5}', 
						 N'{628DAF24-1983-4B90-9244-B6791872B97A}',
						 N'Microsoft.BizTalk.Adapter.SqlReceiver.SqlReceiver,Microsoft.BizTalk.Adapter.SQL',
						 N'Microsoft.BizTalk.Adapter.SqlTransmitter.SqlTransmitter,Microsoft.BizTalk.Adapter.SQL',
						 @DefaultSQL_RcvHandler_CFG, 
						 @DefaultSQL_SendHandler_CFG,
						 N'http://schemas.microsoft.com/BizTalk/2003/sql-properties')
	set @SQL_AdapterId = @@IDENTITY

	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, OutboundEngineCLSID, InboundTypeName, OutboundTypeName, DefaultRHCfg, DefaultTHCfg, PropertyNameSpace)
				VALUES	(N'FTP',
						 N'{3979FFED-0067-4CC6-9F5A-859A5DB6E9BB}',
						 @localized_string_FTP_Comment, 80907,
						 N'{765E1565-FC16-4F98-9831-12631AC26F7A}', 
						 N'{110017A4-A96F-4B07-A2F3-FD783EFC44B4}',
						 N'Microsoft.BizTalk.Adapter.FtpAdapter.FtpReceiver,Microsoft.BizTalk.CoreAdapter',
						 N'Microsoft.BizTalk.Adapter.FtpAdapter.FtpTransmitter,Microsoft.BizTalk.CoreAdapter',
						 @DefaultFTP_RcvHandler_CFG,
						 @DefaultFTP_SendHandler_CFG,
						 N'http://schemas.microsoft.com/BizTalk/2003/ftp-properties')
	set @FTP_AdapterId = @@IDENTITY

	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, OutboundEngineCLSID, 
                                 InboundTypeName, OutboundTypeName, DefaultRHCfg, DefaultTHCfg, PropertyNameSpace)
				VALUES	(N'POP3',
						 N'{1787fcc1-9aaa-4bbd-9096-7eb77e3d9d9b}',
						 @localized_string_POP3_Comment, 71689,
						 N'{A06B76F1-3E36-4D8D-9A9C-847363793E08}', 
						 null,
						 N'Microsoft.BizTalk.Adapters.POP3.POP3,Microsoft.BizTalk.Adapter.Runtime',
						 null,
						 null,
						 null,
						 N'http://schemas.microsoft.com/BizTalk/2003/pop3-properties')
	set @POP3_AdapterId = @@IDENTITY

	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, OutboundEngineCLSID, 
                                 InboundTypeName, OutboundTypeName, DefaultRHCfg, DefaultTHCfg, PropertyNameSpace)
				VALUES	(N'MSMQ',
						 N'{FF5CEE87-FD92-4422-B47D-F7D033311693}',
						 @localized_string_MSMQ_Comment, 13579,
						 N'{D78E41EB-FBEF-4EEB-BA9A-24EC9D298A43}', 
						 N'{2BBE5DA9-5E44-4B8C-8E67-A2BEF50CFD1D}',
						 N'Microsoft.BizTalk.MsmqAdapter.MsmqReceiver, Microsoft.BizTalk.Adapter.MSMQ.MsmqAdapter',
						 N'Microsoft.BizTalk.MsmqAdapter.MsmqTransmitter, Microsoft.BizTalk.Adapter.MSMQ.MsmqAdapter',
						 @DefaultMSMQ_RcvHandler_CFG, 
						 @DefaultMSMQ_SendHandler_CFG,
						 N'http://schemas.microsoft.com/BizTalk/2003/msmq-properties')
	set @MSMQ_AdapterId = @@IDENTITY

	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, InboundEngineCLSID, OutboundEngineCLSID, 
                                 InboundTypeName, OutboundTypeName, DefaultRHCfg, DefaultTHCfg, PropertyNameSpace)
				VALUES	(N'MQSeries',
						 N'{B0942470-A5A1-45AF-8D01-27481B306441}',
						 @localized_string_MQS_Comment, 15627,
						 N'{0173F3B3-A1C5-480C-9D94-E25E014D5DFB}', 
						 N'{D743DEB0-D252-4586-BADB-8570B62DAA3B}',
						 N'Microsoft.BizTalk.Adapter.MqsAdapter.MqsReceiver, Microsoft.BizTalk.Adapter.MQS',
						 N'Microsoft.BizTalk.Adapter.MqsAdapter.MqsTransmitter, Microsoft.BizTalk.Adapter.MQS',
						 @DefaultMQS_RcvHandler_CFG, 
						 @DefaultMQS_SendHandler_CFG,
						 N'http://schemas.microsoft.com/BizTalk/2003/mqs-properties')
	set @MQS_AdapterId = @@IDENTITY

--	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, Type, OutboundEngineCLSID)
--				VALUES	(N'EDI', N'{00000000-0000-0000-0000-000000000000}', @localized_string_EDI_Comment, 2, 2, N'{9d0e4344-4cce-4536-83fa-4a5040674ad6}')
--	set @EDI_AdapterId = @@IDENTITY

--	INSERT into adm_Adapter (Name, MgmtCLSID, Comment, Capabilities, Type, OutboundEngineCLSID)
--				VALUES	(N'BTF', N'{00000000-0000-0000-0000-000000000000}', @localized_string_BTF_Comment, 2, 2, N'{9d0e4344-4cce-4536-83fa-4a5040674ad6}')
--	set @BTF_AdapterId = @@IDENTITY


	-- Definitions for default set of sub services

	--
	-- Caching Service
	--
        declare @localized_string_cachingServiceName as nvarchar(64)
        set @localized_string_cachingServiceName = N'Caching Service'

	INSERT into adm_HostInstance_SubServices (Name, Type, MonikerName, ContextParam)
                VALUES (@localized_string_cachingServiceName, 0, N'new:Microsoft.BizTalk.CachingService.CacheManager', N'')
				
	--
	-- EPM
	--
        declare @localized_string_EPMName as nvarchar(64)
        set @localized_string_EPMName = N'End Point Manager'

	INSERT into adm_HostInstance_SubServices (Name, Type, MonikerName, ContextParam)
		VALUES	(@localized_string_EPMName, 0, N'new:{9d0e434e-4cce-4536-83fa-4a5040674ad6}', N'EndPtMgr')

	--
	-- Tracking
	--
        declare @localized_string_TrackingName as nvarchar(64)
        set @localized_string_TrackingName = N'Tracking'

	INSERT into adm_HostInstance_SubServices (Name, Type, MonikerName, ContextParam)
		VALUES	(@localized_string_TrackingName, 1, N'new:Microsoft.BizTalk.Bam.EventBus.BiztalkService', N'')

    -- TODO: figure out whether SubService type is really required. For now, flag xlang
    -- as 0, which means "load always".

	--
	-- XLANG/s
	--
        declare @localized_string_xlangName as nvarchar(64)
        set @localized_string_xlangName = N'XLANG/s'

	INSERT into adm_HostInstance_SubServices (Name, Type, MonikerName, ContextParam)
                VALUES (@localized_string_xlangName, 0, N'new:Microsoft.XLANGs.BizTalk.Process.XLANGSubService', N'')

	--
	-- MSMQT
	--
        declare @localized_string_msmqtName as nvarchar(64)
        set @localized_string_msmqtName = N'MSMQT'

	INSERT into adm_HostInstance_SubServices (Name, Type, MonikerName, ContextParam)
		VALUES (@localized_string_msmqtName, 16, N'new:{0EE2AEC3-F646-41A6-80A1-A1AF5ED4F02B}', N'')
				
	-- Definitions for default set of Service Classes

	INSERT INTO adm_ServiceClass (Name, UniqueId, LowWatermark, HighWatermark, BatchSize, MaxReceiveInterval, SingleDequeueSession, SerializeInstanceDelivery, GroupBatchByInstance, LowMemorymark, HighMemorymark, ThrottleFlag, LowSessionmark, HighSessionmark, CacheInstanceState, MaxDequeueThread) 
				VALUES (N'XLANG/s', N'{226FC6B9-0416-47a4-A8E8-4721F1DB1A1B}', 10, 20, 20, 500, 0, 1, 0, 100, 100, 2, 5, 10, 0, 5)
	INSERT INTO adm_ServiceClass (Name, UniqueId, LowWatermark, HighWatermark, BatchSize, MaxReceiveInterval, SingleDequeueSession, SerializeInstanceDelivery, GroupBatchByInstance, LowMemorymark, HighMemorymark, ThrottleFlag, LowSessionmark, HighSessionmark, CacheInstanceState, MaxDequeueThread) 
				VALUES (N'Messaging InProcess', N'{59F295B0-3123-416e-966B-A2C6D65FF8E6}', 100, 200, 20, 500, 0, 1, 0, 90, 100, 2, 5, 10, 1, 5)
	INSERT INTO adm_ServiceClass (Name, UniqueId, LowWatermark, HighWatermark, BatchSize, MaxReceiveInterval, SingleDequeueSession, SerializeInstanceDelivery, GroupBatchByInstance, LowMemorymark, HighMemorymark, ThrottleFlag, LowSessionmark, HighSessionmark, CacheInstanceState, MaxDequeueThread) 
				VALUES (N'MSMQT', N'{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}', 100, 200, 20, 500, 0, 1, 1, 90, 100, 2, 12, 15, 1, 5)
	INSERT INTO adm_ServiceClass (Name, UniqueId, LowWatermark, HighWatermark, BatchSize, MaxReceiveInterval, SingleDequeueSession, SerializeInstanceDelivery, GroupBatchByInstance, LowMemorymark, HighMemorymark, ThrottleFlag, LowSessionmark, HighSessionmark, CacheInstanceState, MaxDequeueThread) 
				VALUES (N'Messaging Isolated', N'{683AEDF1-027D-4006-AE9A-443D1A5746FC}', 100, 200, 20, 500, 0, 1, 0, 90, 100, 2, 5, 10, 1, 5)

	-- GUIDs of standard interceptors:
	-- Messaging
	INSERT INTO Trackinginterceptor (uidInterceptorID, InterceptorType, AssemblyName, TypeName) 
				VALUES (N'{D90B63BA-3EEB-4e8a-A20E-7BE683319552}', 1, N'BTSMsgCore.dll', N'CInterceptor') 

	INSERT INTO TrackinginterceptorVersions (uidRootInterceptorID, uidInterceptorID, AssemblyName, TypeName, dtDeploymentTime) 
				VALUES (N'{D90B63BA-3EEB-4e8a-A20E-7BE683319552}', N'{D90B63BA-3EEB-4e8a-A20E-7BE683319552}', N'BTSMsgCore.dll', N'CInterceptor', GETUTCDATE()) 

	-- XlangHealthMonitoring
	INSERT INTO Trackinginterceptor (uidInterceptorID, InterceptorType, AssemblyName, TypeName) 
				VALUES (N'{1E83A7DC-435E-49df-BA83-F09CA50DFBE7}', 0, N'Microsoft.BizTalk.XLangInterceptor, Culture=neutral, PublicKeyToken=31bf3856ad364e35, Version=3.0.1.0', N'Microsoft.XLANGs.Mozart.NativeInterceptor') 

	INSERT INTO TrackinginterceptorVersions (uidRootInterceptorID, uidInterceptorID, AssemblyName, TypeName, dtDeploymentTime) 
				VALUES (N'{1E83A7DC-435E-49df-BA83-F09CA50DFBE7}', N'{1E83A7DC-435E-49df-BA83-F09CA50DFBE7}', N'Microsoft.BizTalk.XLangInterceptor, Culture=neutral, PublicKeyToken=31bf3856ad364e35, Version=3.0.1.0', N'Microsoft.XLANGs.Mozart.NativeInterceptor', GETUTCDATE()) 

	-- XlangBI
	INSERT INTO Trackinginterceptor (uidInterceptorID, InterceptorType, AssemblyName, TypeName) 
				VALUES (N'{58E2AB42-51EB-441d-9C93-8795982336B8}', 0, N'Microsoft.BizTalk.XLangInterceptor, Culture=neutral, PublicKeyToken=31bf3856ad364e35, Version=3.0.1.0', N'Microsoft.XLANGs.Mozart.BIWrapperInterceptor')

	INSERT INTO TrackinginterceptorVersions (uidRootInterceptorID, uidInterceptorID, AssemblyName, TypeName, dtDeploymentTime) 
				VALUES (N'{58E2AB42-51EB-441d-9C93-8795982336B8}', N'{58E2AB42-51EB-441d-9C93-8795982336B8}', N'Microsoft.BizTalk.XLangInterceptor, Culture=neutral, PublicKeyToken=31bf3856ad364e35, Version=3.0.1.0', N'Microsoft.XLANGs.Mozart.BIWrapperInterceptor', GETUTCDATE())

	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @HTTP_AdapterId, 'HTTP://')

	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @HTTP_AdapterId, 'HTTPS://')
		
	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @SOAP_AdapterId, 'SOAP://')
		
	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @FILE_AdapterId, 'FILE://')

	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @WSS_AdapterId, 'WSS://')

	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @WSS_AdapterId, 'WSSs://')
				
	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @SMTP_AdapterId, 'MAILTO:')

	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @SQL_AdapterId, 'SQL://')

	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @FTP_AdapterId, 'FTP://')
	
	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @MSMQ_AdapterId, 'MSMQ://')

	INSERT INTO adm_AdapterAlias 
		(AdapterId, AliasValue) 
		values 
		( @MQS_AdapterId, 'MQS://')

	set nocount off
END
GO


-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Re-apply global constraints
-- //////////////////////////////////////////////////////////////////////////////////////////////////
if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_addconstraints]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) exec bts_addconstraints
GO

-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Create BAS Properties Table
-- //////////////////////////////////////////////////////////////////////////////////////////////////
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

--/--------------------------------------------------------------------------------------------------------
--/--
--	TPE Tables
--/--
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
--	TABLE: bam_TrackPoints
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[bam_TrackPoints] (
	[nTrackPointId] [int] NOT NULL ,
	[nProfileId] [int] NOT NULL ,
	[nvcMsgType] [nvarchar](2048) NULL ,
	[uidPortId] [uniqueidentifier] NOT NULL ,
	[nDirection] [int] NOT NULL ,
	[ntxtData] [ntext] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: bam_TrackingProfiles
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[bam_TrackingProfiles] (
	[nvcName] [nvarchar] (128) NOT NULL ,
	[uidVersionId] [uniqueidentifier] NOT NULL ,
	[nMinorVersionId] [int] NOT NULL ,
	[nID] [int] NOT NULL IDENTITY(1,1)
) ON [PRIMARY]
GO

--/--------------------------------------------------------------------------------------------------------
--	TABLE: bam_ActivityToOrchestrationMapping
--/--------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[bam_ActivityToOrchestrationMapping] (
	[activityName]	[nvarchar](128) NOT NULL ,
	[serviceId]	[uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO

