--/ Copyright (c) Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActionPorts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActionPorts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetOperationSchemas]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetOperationSchemas]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetPortBindingInformation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetPortBindingInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetPortOperations]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetPortOperations]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetReceiveLocationStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetReceiveLocationStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_GetActionState]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_GetActionState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_AddCustomInterceptor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_AddCustomInterceptor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_RemoveCustomInterceptor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_RemoveCustomInterceptor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Hws_Group_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Hws_Group_Enum]
GO

create proc [dbo].[Hws_GetActionPorts] (@ActionTypeID uniqueidentifier) as
begin
	select "PortID" = SvcPort.uidGUID, "PortName" = SvcPort.nvcName, "Polarity" = SvcPort.nPolarity
	from bts_orchestration_port SvcPort, bts_orchestration Svc
	where Svc.uidGUID = @ActionTypeID
	and   Svc.nID = SvcPort.nOrchestrationID
end
GO

grant EXECUTE on [dbo].[Hws_GetActionPorts] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetActionPorts] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[Hws_GetActionPorts] to HWS_AM_DESIGNER
GO

--Gets a list of schedules and their host applications that 
--have an activation port operation using Hws_Activate message.
create proc [dbo].[Hws_GetActions] as  
Begin  
	 select "ActionTypeID" = svc.uidGUID,   
		"ActionName" = svc.nvcName,   
		"ActionFullName" = svc.nvcFullName,   
		"ActionState"=svc.nOrchestrationStatus,   
		"HostApplication"=AppType.Name  
	 from   
		bts_orchestration svc left outer join adm_Host AppType
		on svc.nAdminHostID = AppType.Id
	 where   
		svc.nID in (
			select distinct svc_port.nOrchestrationID  
			from   
				bts_port_activation_operation act_port_op,  
				bts_orchestration_port svc_port,  
				bts_porttype_operation port_op,  
				bts_operation_msgtype op_msg,  
				bts_messagetype_part msg_part,  
				bt_DocumentSpec docspec,  
				bt_XMLShare xshare  
			where   
				xshare.content like N'%<xs:attribute fixed="Hws_Activate" name="HwsMessageType" type="xs:string" use="required" />%'  
				and xshare.id = docspec.shareid  
				and msg_part.nvcSchemaURTTypeName = docspec.clr_typename  
				and op_msg.nMessageTypeID = msg_part.nMessageTypeID  
				and port_op.nID = op_msg.nOperationID  
				and svc_port.nPortTypeID = port_op.nPortTypeID  
				and svc_port.nPolarity=2  
				and act_port_op.nOrchestrationID = svc_port.nOrchestrationID   
				and act_port_op.nPortID = svc_port.nID  
				and act_port_op.nOperationID = port_op.nID)
End  
GO

grant EXECUTE on [dbo].[Hws_GetActions] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetActions] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[Hws_GetActions] to HWS_AM_DESIGNER
GO

create proc [dbo].[Hws_GetOperationSchemas](@OperationID int)      
as      
begin      
 select "MessageType" = op_msg.nType,      
 "CLRTypeName"= docspec.schema_root_clr_fqn,
 "CLRAssemblyName" = docspec.clr_assemblyname,
 "SchemaXSD" =xshare.content      
 from bts_operation_msgtype op_msg,      
      bts_messagetype_part msg_part,      
      bt_DocumentSpec docspec,      
      bt_XMLShare xshare      
 where op_msg.nOperationID = @OperationID      
 and op_msg.nMessageTypeID = msg_part.nMessageTypeID      
 and msg_part.nvcSchemaURTNameSpace+N'.'+msg_part.nvcSchemaURTTypeName = docspec.schema_root_clr_fqn     
 and xshare.id = docspec.shareid      
end
GO

grant EXECUTE on [dbo].[Hws_GetOperationSchemas] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetOperationSchemas] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[Hws_GetOperationSchemas] to HWS_AM_DESIGNER
GO

create proc [dbo].[Hws_GetPortBindingInformation] (@ActionTypeID uniqueidentifier, @PortGUID uniqueidentifier) as  
begin  
 Declare @Polarity int  
 Declare @BindingType int  
 Declare @LogicalPortId int  
 Declare @PhysicalPortId int  
  
 select @Polarity=SvcPort.nPolarity,   
        @LogicalPortId=SvcPort.nID,   
        @BindingType=SvcPort.nBindingOption  
 from  bts_orchestration Svc,  
  bts_orchestration_port SvcPort  
 where SvcPort.uidGUID = @PortGUID  
 and   Svc.nID = SvcPort.nOrchestrationID  
 and   Svc.uidGUID = @ActionTypeID  
  
 if (@BindingType = 3 or @BindingType = 4) -- Direct binding (3) or Dynamic (4)  
  begin  
  select "BindingType" = @BindingType,   
         "ProtocolType" = N'',   
         "PartialURI" = N'',  
         "PublicURI" = N'',  
	 "PhysicalPortName" = N'',
	 "LocationName" = N'',
         "ConfigInfo" = N''  
  return  
 end  
  
 if (@Polarity = 1) -- Port Sends message  
 begin  
  select @PhysicalPortId = SvcPortBinding.nSendPortID  
  from bts_orchestration_port_binding SvcPortBinding  
  where SvcPortBinding.nOrcPortID = @LogicalPortId  
  
  select "BindingType" = @BindingType,   
         "ProtocolType" = Protocols.Name,   
         "PartialURI" = N'',
         "PublicURI" = SendTransport.nvcAddress,
	 "PhysicalPortName" = SendPort.nvcName,
	 "LocationName" = N'',
         "ConfigInfo" = SendTransport.nvcTransportTypeData  
         from bts_sendport_transport SendTransport,  
       	 adm_Adapter Protocols, bts_sendport SendPort
  where SendTransport.nSendPortID = @PhysicalPortId  
  and SendPort.nID = SendTransport.nSendPortID
  and SendTransport.bIsPrimary = 1  
  and Protocols.Id = SendTransport.nTransportTypeId  
 end  
 else if (@Polarity = 2) -- Port Receives message  
 begin  
    
  select @PhysicalPortId = SvcPortBinding.nReceivePortID  
  from bts_orchestration_port_binding SvcPortBinding  
  where SvcPortBinding.nOrcPortID = @LogicalPortId  
  
  select "BindingType" = @BindingType,   
         "ProtocolType" = Protocols.Name,   
         "PartialURI" = RecvLocn.InboundTransportURL,  
         "PublicURI" = RecvLocn.InboundAddressableURL,  
	 "PhysicalPortName" = ReceivePort.nvcName,
	 "LocationName" = RecvLocn.Name,
         "ConfigInfo" = RecvLocn.CustomCfg  
         from bts_receiveport ReceivePort, adm_ReceiveLocation RecvLocn,  
       adm_Adapter Protocols  
  where RecvLocn.ReceivePortId = @PhysicalPortId  
  and ReceivePort.nID = RecvLocn.ReceivePortId
  and RecvLocn.IsPrimary = 1  
  and RecvLocn.AdapterId = Protocols.Id  
 end  
end  
GO

grant EXECUTE on [dbo].[Hws_GetPortBindingInformation] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetPortBindingInformation] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[Hws_GetPortBindingInformation] to HWS_AM_DESIGNER
GO

create proc [dbo].[Hws_GetPortOperations](@ActionTypeID uniqueidentifier, @PortGUID uniqueidentifier)
as
begin
	Declare @nServiceId int 
	Declare @nPortId int

	select @nServiceId = nID 
	from bts_orchestration
	where uidGUID = @ActionTypeID
	
	select @nPortId = nID 
	from bts_orchestration_port
	where uidGUID = @PortGUID

	select "OperationID" = port_op.nID,
	"OperationName" = port_op.nvcName,
	"OperationType" = port_op.nType,
	"IsActivationOperation" = case (select count (*) from bts_port_activation_operation
		     			where nOrchestrationID = @nServiceId 
		     			and   nPortID = @nPortId
		     			and   nOperationID = port_op.nID)
		 			when 1 then 1
		 			else 0
				  end
	from bts_orchestration svc,
	     bts_orchestration_port svc_port,
	     bts_porttype_operation port_op
	where svc.uidGUID = @ActionTypeID  
	and svc_port.uidGUID = @PortGUID
	and svc_port.nPortTypeID = port_op.nPortTypeID

end

GO

grant EXECUTE on [dbo].[Hws_GetPortOperations] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetPortOperations] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[Hws_GetPortOperations] to HWS_AM_DESIGNER
GO


create proc [dbo].[Hws_GetReceiveLocationStatus] (@InBoundAddressableURL nvarchar(512))
as
Begin
	select "Status" = Disabled 
	from adm_ReceiveLocation
	where InboundTransportURL = Right(@InBoundAddressableURL, Len(InboundTransportURL))
End

GO

grant EXECUTE on [dbo].[Hws_GetReceiveLocationStatus] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetReceiveLocationStatus] to HWS_ADMIN_USER
GO

create proc [dbo].[Hws_GetActionState] (@ActionTypeID uniqueidentifier)
as
Begin
	select "ActionState" = nOrchestrationStatus
	from bts_orchestration
	where uidGUID = @ActionTypeID
End

GO

grant EXECUTE on [dbo].[Hws_GetActionState] to HWS_WS_USER
grant EXECUTE on [dbo].[Hws_GetActionState] to HWS_ADMIN_USER
grant EXECUTE on [dbo].[Hws_GetActionState] to HWS_AM_DESIGNER
GO

CREATE PROCEDURE [dbo].[Hws_AddCustomInterceptor](@ActionID uniqueidentifier) AS
Begin
	SET NOCOUNT ON

	DECLARE @Ret							int
		,@Error							int
		,@Rowcount						int
		,@ErrorDesc						nvarchar(100)
		,@RootInterceptorID					uniqueidentifier

	SET @RootInterceptorID = 'd3bffaf9-8291-4b82-9052-707aecab84a3'
	
	declare @localized_string_ServiceNameSelectFailed_Hws_AddCustomInterceptor nvarchar(100)
	set @localized_string_ServiceNameSelectFailed_Hws_AddCustomInterceptor = N'Hws_AddCustomInterceptor failed selecting ServiceName from bts_orchestration table.'

	declare @localized_string_InterceptorVersionSelectFailed_Hws_AddCustomInterceptor nvarchar(100)
	set @localized_string_InterceptorVersionSelectFailed_Hws_AddCustomInterceptor = N'Hws_AddCustomInterceptor failed selecting uidInterceptorID from TrackinginterceptorVersions table.'

	declare @localized_string_InterceptorAlreadyRegistered_Hws_AddCustomInterceptor nvarchar(100)
	set @localized_string_InterceptorAlreadyRegistered_Hws_AddCustomInterceptor = N'Hws_AddCustomInterceptor failed an Hws interceptor is already registered for this action.'

	declare @localized_string_StaticTrackingInfoInsertFailed_Hws_AddCustomInterceptor nvarchar(100)
	set @localized_string_StaticTrackingInfoInsertFailed_Hws_AddCustomInterceptor = N'Hws_AddCustomInterceptor failed inserting into StaticTrackingInfo.'

	declare @ServiceName nvarchar(1026)
	declare @ServiceDeploymentTime datetime
	/*
		Get the service name of the action
	*/
	select 	@ServiceName = nvcFullName, @ServiceDeploymentTime = dtModified
	from 	bts_orchestration 
	where 	uidGUID = @ActionID

	SELECT 	@Error = @@ERROR
		,@Rowcount = @@ROWCOUNT

	IF @Error <> 0 OR @Rowcount <> 1 OR @ServiceName IS NULL
	 BEGIN
		SELECT @ErrorDesc = @localized_string_ServiceNameSelectFailed_Hws_AddCustomInterceptor
		GOTO ERROR
	 END
	/*
		Get the id of the current version of the interceptor
	*/
	DECLARE	@uidInterceptorID uniqueidentifier

	SELECT	TOP 1	@uidInterceptorID = uidInterceptorID
	FROM		TrackinginterceptorVersions
	WHERE		uidRootInterceptorID = @RootInterceptorID
	ORDER BY	dtDeploymentTime desc

	SELECT 	@Error = @@ERROR
		,@Rowcount = @@ROWCOUNT

	IF @Error <> 0 OR @Rowcount <> 1 OR @uidInterceptorID IS NULL
	 BEGIN
		SELECT @ErrorDesc = @localized_string_InterceptorVersionSelectFailed_Hws_AddCustomInterceptor
		GOTO ERROR
	 END	
		
	IF EXISTS (	SELECT 		1
			FROM 		StaticTrackingInfo sti
			INNER JOIN	TrackinginterceptorVersions tiv
			ON		sti.uidInterceptorId = tiv.uidInterceptorID
			WHERE 		uidServiceId = @ActionID 
			AND		tiv.uidRootInterceptorID = @RootInterceptorID
	)
	BEGIN
		SELECT @ErrorDesc = @localized_string_InterceptorAlreadyRegistered_Hws_AddCustomInterceptor
		GOTO ERROR
	END
		
	INSERT  StaticTrackingInfo(
		GroupId,
		strServiceName,
		uidServiceId,
		uidInterceptorId,
		dtDeploymentTime,
		dtUndeploymentTime,
		ismsgBodyTrackingEnabled,
		imgData)
	VALUES (
		NULL,
		@ServiceName,
		@ActionID,
		@uidInterceptorID,
		@ServiceDeploymentTime,
		NULL,
		0,
		NULL)

	SELECT 	@Error = @@ERROR
		,@Rowcount = @@ROWCOUNT

	IF @Error <> 0 OR @Rowcount <> 1
	 BEGIN
		SELECT @ErrorDesc = @localized_string_StaticTrackingInfoInsertFailed_Hws_AddCustomInterceptor
		GOTO ERROR
	 END	
			
	SET @Ret = 0
	GOTO DONE

ERROR:

	SET @Ret = -1
	RAISERROR( @ErrorDesc, 16, -1 )
	GOTO DONE

DONE:

	RETURN @Ret

End
GO

grant EXECUTE on [dbo].[Hws_AddCustomInterceptor] to HWS_ADMIN_USER
GO

CREATE PROCEDURE [dbo].[Hws_RemoveCustomInterceptor](@ActionID uniqueidentifier) AS
Begin
	delete from 	[dbo].[StaticTrackingInfo]
	where 		uidServiceId = @ActionID 
	and 		uidInterceptorId in (
						select 	uidInterceptorId 
						from 	[dbo].[TrackinginterceptorVersions] 
						where 	uidRootInterceptorID = 'd3bffaf9-8291-4b82-9052-707aecab84a3')
End
GO

grant EXECUTE on [dbo].[Hws_RemoveCustomInterceptor] to HWS_ADMIN_USER
GO

CREATE PROCEDURE [dbo].[Hws_Group_Enum] 
AS
	
Begin
	set nocount on

	set xact_abort on


	select top 1  Name, TrackingDBServerName, TrackingDBName
	from adm_Group, BizTalkDBVersion

	where BizTalkDBVersion.BizTalkDBName = N'Management DB'

	order by BizTalkDBVersion.DatabaseMajor, BizTalkDBVersion.DatabaseMinor DESC

	
	set nocount off
End
GO

grant EXECUTE on [dbo].[Hws_Group_Enum] to HWS_ADMIN_USER
GO




