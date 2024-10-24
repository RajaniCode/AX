--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Remove existing Partner management storedproc
-- //////////////////////////////////////////////////////////////////////////////////////////////////
if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_removesprocs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) exec bts_removesprocs
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_removesprocs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_removesprocs]
GO

CREATE PROCEDURE [dbo].[bts_removesprocs]
AS
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_PartnerMgmtValidator]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_PartnerMgmtValidator]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_validate_unenlisted_sendport]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_validate_unenlisted_sendport]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_validate_unenlisted_sendportgroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_validate_unenlisted_sendportgroup]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_validate_stopped_orchestration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_validate_stopped_orchestration]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_validate_started_orchestration]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_validate_started_orchestration]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_validate_started_sendportgroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_validate_started_sendportgroup]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_validate_enlisted_parties]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_validate_enlisted_parties]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_ReceiveLocation_Status_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_ReceiveLocation_Status_Update]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_SendPort_Status_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_SendPort_Status_Update]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_SendPortGroup_Status_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_SendPortGroup_Status_Update]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_Orchestration_Status_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_Orchestration_Status_Update]
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_ReceivePort_Timestamp_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_ReceivePort_Timestamp_Update]	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_RoleInfoFromPortMappingId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_RoleInfoFromPortMappingId]	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_schema_description_update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_schema_description_update]	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[bts_transform_description_update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[bts_transform_description_update]	
GO

exec bts_removesprocs
GO

--/---------------------------------------------------------------------------------------------------------------
--
-- create stored procedures
--
--/---------------------------------------------------------------------------------------------------------------


--/---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bts_PartnerMgmtValidator]
AS
	--// Party Signature Cert Validator
	declare @localized_string_error_certificate as NVARCHAR(4000)
	set @localized_string_error_certificate = N'Party Signature Certificate should be unique.'
	declare @nCount int
	select @nCount = count(nvcSignatureCertHash) from bts_party group by nvcSignatureCertHash having count(nvcSignatureCertHash) > 1
	if(@nCount > 1)
		RAISERROR(@localized_string_error_certificate , 16, 1)
GO
GRANT EXEC ON [dbo].[bts_PartnerMgmtValidator] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[bts_PartnerMgmtValidator] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bts_validate_enlisted_parties]
AS
	--// validate all the parties enlisted under roles which are used by the started orchesrations
	select party.nvcName, role.nvcName, rolelinktype.nvcFullName, assembly.nvcFullName from bts_enlistedparty enlistedparty
	inner join bts_party party on enlistedparty.nPartyID = party.nID
	inner join bts_role role on enlistedparty.nRoleID = role.nID
	inner join bts_rolelink_type rolelinktype on rolelinktype.nID = role.nRoleLinkTypeID
	inner join bts_assembly assembly on assembly.nID = rolelinktype.nAssemblyID
	where 0 < 	(
			select count(*) from bts_orchestration orch
			where orch.nOrchestrationStatus >= 3 and 
			role.nID in (select nRoleID from bts_rolelink where nOrchestrationID = orch.nID and bImplements = 0)
			)
	and 0 <		(
			select count(*) from bts_enlistedparty_port_mapping portMapping
			inner join bts_enlistedparty_operation_mapping operationMapping on operationMapping.nPortMappingID = portMapping.nID
			inner join bts_party_sendport partysendport on operationMapping.nPartySendPortID = partysendport.nID
			inner join bts_sendport sendport on partysendport.nSendPortID = sendport.nID and sendport.nPortStatus = 1
			where portMapping.nEnlistedPartyID = enlistedparty.nID
			)
GO
GRANT EXEC ON [dbo].[bts_validate_enlisted_parties] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[bts_validate_enlisted_parties] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bts_validate_unenlisted_sendport]
@nSPID int
AS
	--// validate unenlisted send port, select started send port groups which has no send port enlisted
	select spg.nvcName from bts_sendportgroup spg
	where spg.nPortStatus = 3 and 
		@nSPID IN (select spg_sp.nSendPortID from bts_spg_sendport spg_sp where spg_sp.nSendPortGroupID = spg.nID) and
		(select count(*) from bts_spg_sendport spg_sp 
		join bts_sendport sp on sp.nID = spg_sp.nSendPortID and sp.nPortStatus > 1
		where spg_sp.nSendPortGroupID = spg.nID )= 0

	--// validate unenlisted send port, select started orchestration which has this send port in binding
	select orch.nvcFullName, assembly.nvcFullName from bts_orchestration orch
	inner join bts_assembly assembly on assembly.nID = orch.nAssemblyID
	where orch.nOrchestrationStatus >= 3 and 
		@nSPID IN (	select orch_port_binding.nSendPortID from bts_orchestration_port orch_port 
		join bts_orchestration_port_binding orch_port_binding on orch_port_binding.nOrcPortID = orch_port.nID 
		where orch.nID = orch_port.nOrchestrationID )
		
	--// validate unenlisted send port, select enlisted party which has their roles used by started orchestrations
	select party.nvcName, role.nvcName, rolelinktype.nvcFullName, assembly.nvcFullName from bts_sendport sendport 
	inner join bts_party_sendport partysendport on partysendport.nSendPortID = sendport.nID
	inner join bts_enlistedparty_operation_mapping operationMapping on operationMapping.nPartySendPortID = partysendport.nID
	inner join bts_enlistedparty_port_mapping portMapping on portMapping.nID = operationMapping.nPortMappingID
	inner join bts_enlistedparty enlistedparty on portMapping.nEnlistedPartyID = enlistedparty.nID
	inner join bts_party party on enlistedparty.nPartyID = party.nID
	inner join bts_role role on role.nID = enlistedparty.nRoleID
	inner join bts_rolelink_type rolelinktype on rolelinktype.nID = role.nRoleLinkTypeID
	inner join bts_assembly assembly on assembly.nID = rolelinktype.nAssemblyID
	where sendport.nID = @nSPID and 
		enlistedparty.nRoleID in 
		(
		select distinct(rolelink.nRoleID) from bts_orchestration orch
		inner join bts_rolelink rolelink on rolelink.nOrchestrationID = orch.nID
		where orch.nOrchestrationStatus >= 3 and rolelink.bImplements = 0
		)
	group by party.nvcName, role.nvcName, rolelinktype.nvcFullName, assembly.nvcFullName

GO
GRANT EXEC ON [dbo].[bts_validate_unenlisted_sendport] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[bts_validate_unenlisted_sendport] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bts_validate_unenlisted_sendportgroup]
@nSPGID int
AS
	--// validate unenlisted send port group, select all started orchestration which depends upon send port group
	select orch.nvcFullName, assembly.nvcFullName from bts_orchestration orch
	inner join bts_assembly assembly on assembly.nID = orch.nAssemblyID
	where orch.nOrchestrationStatus >= 3 and 
		@nSPGID IN (select orch_port_binding.nSpgID from bts_orchestration_port orch_port 
		join bts_orchestration_port_binding orch_port_binding on orch_port_binding.nOrcPortID = orch_port.nID 
		where orch.nID = orch_port.nOrchestrationID)
GO
GRANT EXEC ON [dbo].[bts_validate_unenlisted_sendportgroup] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[bts_validate_unenlisted_sendportgroup] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bts_validate_stopped_orchestration]
@nOrchID int
AS
	--// validate unenlisted orchestration, select all started orchestration which invokes this orchestration
	select orch.nvcFullName, assembly.nvcFullName from adm_GetOrchestrationDependencies(@nOrchID, 'U') up
	join bts_orchestration orch on up.CallerSvcId = orch.nID 
	join bts_assembly assembly on assembly.nID = orch.nAssemblyID
	where orch.nOrchestrationStatus >= 3
GO
GRANT EXEC ON [dbo].[bts_validate_stopped_orchestration] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[bts_validate_stopped_orchestration] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bts_validate_started_orchestration]
@nOrchID int
AS
	--// validate started orchestration, it must have all of its port bindings enlisted
	select sp.nvcName, spg.nvcName from bts_orchestration_port orch_port
	join bts_orchestration_port_binding orch_port_binding on orch_port_binding.nOrcPortID = orch_port.nID
	left outer join bts_sendport sp on sp.nID = orch_port_binding.nSendPortID
	left outer join bts_sendportgroup spg on spg.nID = orch_port_binding.nSpgID
	where orch_port.nOrchestrationID = @nOrchID and orch_port.nPolarity = 1
	and (sp.nPortStatus = 1 or spg.nPortStatus = 1)

	--// validate started orchestration, it must have all the invoked orchestrations started
	select orch2.nvcFullName, assembly.nvcFullName from adm_GetOrchestrationDependencies(@nOrchID, 'D') inv_orch
	join bts_orchestration orch2 on orch2.nID = inv_orch.CalleeSvcId
	join bts_assembly assembly on assembly.nID = orch2.nAssemblyID
	where orch2.nOrchestrationStatus != 3

	--// validate started orchestration, select all the enlisted party which are enlisted under the roles
	--// used by this orchestration and has send ports which are not enlisted or started
	select party.nvcName, role.nvcName, rolelinktype.nvcFullName, assembly.nvcFullName from bts_orchestration orch
	inner join bts_rolelink rolelink on orch.nID = rolelink.nOrchestrationID and rolelink.bImplements = 0
	inner join bts_enlistedparty enlistedparty on enlistedparty.nRoleID = rolelink.nRoleID
	inner join bts_party party on enlistedparty.nPartyID = party.nID
	inner join bts_role role on role.nID = rolelink.nRoleID
	inner join bts_rolelink_type rolelinktype on rolelinktype.nID = role.nRoleLinkTypeID
	inner join bts_assembly assembly on assembly.nID = rolelinktype.nAssemblyID
	where 0 < 	(
				select count(*) from bts_enlistedparty_port_mapping portMapping
				inner join bts_enlistedparty_operation_mapping operationMapping on operationMapping.nPortMappingID = portMapping.nID
				inner join bts_party_sendport partySendPort on operationMapping.nPartySendPortID = partySendPort.nID
				inner join bts_sendport sendport on partySendPort.nSendPortID = sendport.nID
				where sendport.nPortStatus = 1 and enlistedparty.nID = portMapping.nEnlistedPartyID
				)
			and orch.nID = @nOrchID
	group by party.nvcName, role.nvcName, rolelinktype.nvcFullName, assembly.nvcFullName 

GO
GRANT EXEC ON [dbo].[bts_validate_started_orchestration] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[bts_validate_started_orchestration] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[bts_validate_started_sendportgroup]
@nSPGID int
AS
	--// validate started send port group, it must have at least one enlisted send port
	select count(*) from bts_spg_sendport spg_sp 
	join bts_sendport sp on sp.nID = spg_sp.nSendPortID and sp.nPortStatus > 1
	where spg_sp.nSendPortGroupID = @nSPGID
GO
GRANT EXEC ON [dbo].[bts_validate_started_sendportgroup] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[bts_validate_started_sendportgroup] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
create procedure [dbo].[bts_schema_description_update]
@itemid int,
@docspec_name nvarchar(513),
@description nvarchar(1024)
AS
set nocount on
declare @property int
select @property = is_property_schema from bt_DocumentSpec where itemid = @itemid
if (@property = 1)
begin
	update bts_item
	set description = @description
	where id = @itemid
end
else
begin
	update bt_DocumentSpec
	set description = @description
	where itemid = @itemid AND docspec_name = @docspec_name
end
set nocount off
GO
GRANT EXEC ON [dbo].[bts_schema_description_update] TO BTS_ADMIN_USERS
GO
--/---------------------------------------------------------------------------------------------------------------
create procedure [dbo].[bts_transform_description_update]
@id uniqueidentifier,
@description nvarchar(1024)
AS
set nocount on
update bt_MapSpec
set description = @description
where id = @id
set nocount off
GO
GRANT EXEC ON [dbo].[bts_transform_description_update] TO BTS_ADMIN_USERS
GO
--/---------------------------------------------------------------------------------------------------------------
create procedure [dbo].[bts_ReceiveLocation_Status_Update]
@ReceiveLocationId int,
@Status int,
@DateModified datetime,
@DateModifiedOut datetime output
as
begin tran
set @DateModifiedOut = GETUTCDATE()
UPDATE adm_ReceiveLocation SET Disabled = @Status, DateModified = @DateModifiedOut 
WHERE Id = @ReceiveLocationId AND DateModified = @DateModified
commit tran
GO
GRANT EXEC ON [dbo].[bts_ReceiveLocation_Status_Update] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[bts_ReceiveLocation_Status_Update] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
create procedure [dbo].[bts_SendPort_Status_Update]
@SendPortId int,
@Status int,
@DateModified datetime,
@DateModifiedOut datetime output
as
begin tran
set @DateModifiedOut = GETUTCDATE()
UPDATE bts_sendport SET nPortStatus = @Status, DateModified = @DateModifiedOut 
WHERE nID = @SendPortId AND DateModified = @DateModified
commit tran
GO
GRANT EXEC ON [dbo].[bts_SendPort_Status_Update] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[bts_SendPort_Status_Update] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
create procedure [dbo].[bts_SendPortGroup_Status_Update]
@SendPortGroupId int,
@Status int,
@DateModified datetime,
@DateModifiedOut datetime output
as
begin tran
set @DateModifiedOut = GETUTCDATE()
UPDATE bts_sendportgroup SET nPortStatus = @Status, DateModified = @DateModifiedOut 
WHERE nID = @SendPortGroupId AND DateModified = @DateModified
commit tran
GO
GRANT EXEC ON [dbo].[bts_SendPortGroup_Status_Update] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[bts_SendPortGroup_Status_Update] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
create procedure [dbo].[bts_Orchestration_Status_Update]
@OrchestrationId int,
@Status int,
@DateModified datetime,
@DateModifiedOut datetime output
as
begin tran
set @DateModifiedOut = GETUTCDATE()
UPDATE bts_orchestration  SET nOrchestrationStatus = @Status, dtModified = @DateModifiedOut 
WHERE nID = @OrchestrationId AND dtModified = @DateModified
commit tran
GO
GRANT EXEC ON [dbo].[bts_Orchestration_Status_Update] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[bts_Orchestration_Status_Update] TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
create procedure [dbo].[bts_ReceivePort_Timestamp_Update]
@ReceivePortId int,
@DateModified datetime output
as
set nocount on
begin tran
set @DateModified = GETUTCDATE()
UPDATE bts_receiveport SET DateModified = @DateModified where nID = @ReceivePortId
commit tran
set nocount off
GO
GRANT EXEC ON [dbo].[bts_ReceivePort_Timestamp_Update]TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[bts_ReceivePort_Timestamp_Update]TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
create procedure [dbo].[bts_RoleInfoFromPortMappingId]
@nPortMappingID int
as
set nocount on

select bts_porttype.nvcFullName, bts_role.nvcName, bts_porttype_operation.nvcName
	from
		bts_enlistedparty_port_mapping, 
		bts_role_porttype,
		bts_porttype_operation,
		bts_porttype,
		bts_role
	where
		bts_enlistedparty_port_mapping.nID = @nPortMappingID
		and bts_enlistedparty_port_mapping.nRolePortTypeID = bts_role_porttype.nID
		and bts_porttype_operation.nPortTypeID = bts_role_porttype.nID
		and bts_role_porttype.nPortTypeID = bts_porttype.nID
		and bts_role.nID = bts_role_porttype.nRoleID

set nocount off
GO
GRANT EXEC ON [dbo].[bts_ReceivePort_Timestamp_Update]TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[bts_ReceivePort_Timestamp_Update]TO BTS_OPERATORS
GO
--/---------------------------------------------------------------------------------------------------------------
declare @localized_string_default_application_name AS nvarchar(256)
set @localized_string_default_application_name = N'BizTalk Application 1'
if not exists(select * from bts_application where nvcName = @localized_string_default_application_name)
   and not exists(select * from bts_application where isDefault = 1)
begin
    insert into bts_application(nvcName, isDefault, isSystem, nvcDescription, DateModified) values(@localized_string_default_application_name, 1, 0, N'BizTalk Application 1', GETUTCDATE())
end
GO
--/---------------------------------------------------------------------------------------------------------------
declare @localized_string_system_application_name AS nvarchar(256)
set @localized_string_system_application_name = N'BizTalk.System'
if not exists(select * from bts_application where nvcName = @localized_string_system_application_name)
begin
    insert into bts_application(nvcName, isDefault, isSystem, nvcDescription, DateModified) values(@localized_string_system_application_name, 0, 1, N'System Application', GETUTCDATE())
end
GO
--/---------------------------------------------------------------------------------------------------------------
-- Add reference from 'BizTalk Application 1' (default application) to 'System Application'
declare @nApplicationIDValue as int
declare @nReferencedApplicationIDValue as int
select @nApplicationIDValue = nID from bts_application where isDefault = 1
select @nReferencedApplicationIDValue = nID from bts_application where isSystem = 1
if not exists(select * from bts_application_reference where nApplicationID = @nApplicationIDValue and nReferencedApplicationID = @nReferencedApplicationIDValue)
begin
    insert into bts_application_reference(nApplicationID, nReferencedApplicationID) values(@nApplicationIDValue, @nReferencedApplicationIDValue)
end
GO
--/---------------------------------------------------------------------------------------------------------------

