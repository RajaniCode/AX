'--------------------------------------------------------------------------
'
' WMI script to remove a receive port.
'
'--------------------------------------------------------------------------
' This file is part of the Microsoft BizTalk Server 2006 SDK
'
' Copyright (c) Microsoft Corporation. All rights reserved.
'
' This source code is intended only as a supplement to Microsoft BizTalk
' Server 2006 release and/or on-line documentation. See these other
' materials for detailed information regarding Microsoft code samples.
'
' THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
' KIND, WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
' IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
' PURPOSE.
'--------------------------------------------------------------------------

Option Explicit

RemoveReceivePort
Sub RemoveReceivePort()
	'Get the command line arguments entered for the script
	Dim objArgs: Set objArgs = WScript.Arguments

	'error handling is done by explicity checking the err object rather than using
	'the VB ON ERROR construct, so set to resume next on error.
	On Error Resume Next
	
	'Make sure the expected number of arguments were provided on the command line.
	'if not, print usage text and exit.
	If (objArgs.Count <> 1) Then
		PrintUsage()
		WScript.Quit 0
	End If

	Dim objInstSet, objInst, strQuery
	Dim strReceivePortName
	
	strReceivePortName = objArgs(0)
			
	'set up a WMI query to acquire a list of receive locations with the given Name and 
	'ReceivePortName key values.  This should be a list of zero or one Receive Locations.
	strQuery = "SELECT * FROM MSBTS_ReceivePort WHERE Name =""" & strReceivePortName & """"
	Set objInstSet = GetObject("Winmgmts:!root\MicrosoftBizTalkServer").ExecQuery(strQuery)
	
	'Check for error condition before continuing.
	If Err <> 0	Then
		PrintWMIErrorThenExit Err.Description, Err.Number
	End If

	'If Receive Location found, enable it, otherwise print error and end.
	If objInstSet.Count > 0 then
		For Each objInst in objInstSet
			'Now remove the receive port
			objInst.Delete_()
			If Err <> 0	Then
				PrintWMIErrorThenExit Err.Description, Err.Number
			End If
			WScript.Echo "The Receive Port was successfully removed."
		Next
	Else
		WScript.Echo "No Receive Port was found matching that Name."
	End If
			
End Sub 

'This subroutine deals with all errors using the WbemScripting object.  Error descriptions
'are returned to the user by printing to the console.
Sub	PrintWMIErrorThenExit(strErrDesc, nErrNum)
	On Error Resume	Next
	Dim	objWMIError	: Set objWMIError =	CreateObject("WbemScripting.SwbemLastError")

	If ( TypeName(objWMIError) = "Empty" ) Then
		WScript.Echo strErrDesc & " (HRESULT: "	& Hex(nErrNum) & ")."
	Else
		WScript.Echo objWMIError.Description & "(HRESULT: "	& Hex(nErrNum) & ")."
		Set objWMIError	= Nothing
	End	If
	
	'bail out
	WScript.Quit 0
End Sub 

Sub PrintUsage()
	WScript.Echo "Usage:" + Chr(10) + Chr(10) + _
				 "cscript RemoveReceivePort.vbs <Receive Port Name>" + _
				 Chr(10) + Chr(10) + "Where: " + Chr(10) + _
				 "  <Receive Port Name>     = The name of the receive port to be removed." + _
				 Chr(10) + "       Example: 'MyBusinessReceivePort'" + Chr(10) + Chr(10)
End Sub
