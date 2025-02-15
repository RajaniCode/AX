@REM --------------------------------------------------------------------
@REM File: Cleanup.bat
@REM
@REM Summary: Calls scripts and programs to stop and undeploy the ShipperProcess.
@REM
@REM Sample: BPEL Import
@REM
@REM --------------------------------------------------------------------
@REM This file is part of the Microsoft BizTalk Server 2006 SDK
@REM
@REM Copyright (c) Microsoft Corporation. All rights reserved.
@REM
@REM This source code is intended only as a supplement to Microsoft BizTalk
@REM Server 2006 release and/or on-line documentation. See these other
@REM materials for detailed information regarding Microsoft code samples.
@REM
@REM THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
@REM KIND, WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
@REM IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
@REM PURPOSE.
@REM --------------------------------------------------------------------

@SETLOCAL

@CALL "%VS80COMNTOOLS%vsvars32.bat"

@SET OrchestrationName=Microsoft.Samples.BizTalk.BPEL.ShipperProcess_Schedule
@SET AssemblyName=ShipperProcess
@SET SchemaAssemblyName=ShippingSchemas
@SET SchemaProjectName=ShippingSchemas
@SET ShipperProjectName=ShipperProcess

@ECHO.
@ECHO Calling the WMI script to stop and unenlist the orchestration...

@CScript /NoLogo "..\..\..\..\Admin\WMI\Stop Orchestration\VBScript\StopOrch.vbs" %OrchestrationName% %AssemblyName% Unenlist
@ECHO.


@ECHO Undeploying the assembly...
@BTSDeploy Remove Assembly=%ShipperProjectName%\bin\Development\%AssemblyName%.dll Uninstall=True Log=Undeploy
@ECHO Undeploying the schema assembly...
@BTSDeploy Remove Assembly=%SchemaProjectName%\bin\Development\%SchemaAssemblyName%.dll Uninstall=True Log=Undeploy

@ECHO.
@SET SendPortName=SHIPSendAck
@ECHO Calling the WMI script to remove the send port %SendPortName%...
@CScript /NoLogo "..\..\..\..\Admin\WMI\Remove Send Port\VBScript\RemoveSendPort.vbs" %SendPortName%

@ECHO.
@SET SendPortName=Ship_SendPickup
@ECHO Calling the WMI script to remove the send port %SendPortName%...
@CScript /NoLogo "..\..\..\..\Admin\WMI\Remove Send Port\VBScript\RemoveSendPort.vbs" %SendPortName%

@ECHO.
@SET SendPortName=Ship_SendPaymentConfirmation
@ECHO Calling the WMI script to remove the send port %SendPortName%...
@CScript /NoLogo "..\..\..\..\Admin\WMI\Remove Send Port\VBScript\RemoveSendPort.vbs" %SendPortName%

@ECHO.
@SET SendPortName=Ship_SendInvoice
@ECHO Calling the WMI script to remove the send port %SendPortName%...
@CScript /NoLogo "..\..\..\..\Admin\WMI\Remove Send Port\VBScript\RemoveSendPort.vbs" %SendPortName%


@ECHO.
@SET ReceivePortName=Ship_ReceiveOrder
@ECHO Calling the WMI script to remove the receive port %ReceivePortName%...
@CScript /NoLogo "..\..\..\..\Admin\WMI\Remove Receive Port\VBScript\RemoveReceivePort.vbs" %ReceivePortName%

@ECHO.
@SET ReceivePortName=Ship_ReceiveInvoiceAck
@ECHO Calling the WMI script to remove the receive port %ReceivePortName%...
@CScript /NoLogo "..\..\..\..\Admin\WMI\Remove Receive Port\VBScript\RemoveReceivePort.vbs" %ReceivePortName%

@ENDLOCAL

@PAUSE