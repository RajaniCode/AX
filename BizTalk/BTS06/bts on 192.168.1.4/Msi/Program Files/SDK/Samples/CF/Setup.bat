@REM --------------------------------------------------------------------
@REM File: Setup.bat
@REM
@REM Summary: Calls scripts and programs to build, deploy, and start the sample.
@REM
@REM Sample: Custom Functoid
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

@SET SolutionName=CustomFunctoid.sln
@SET AssemblyKeyFile=CustomFunctoid.snk

@ECHO.
@ECHO If key files is not found, will generate a new key file...

@IF NOT EXIST %AssemblyKeyFile% sn -k %AssemblyKeyFile%

@ECHO.
@ECHO Building the project...

@DevEnv %SolutionName% /build Debug /Out Build.log

@COPY bin\Debug\Microsoft.Samples.BizTalk.CustomFunctoid.dll "..\..\..\..\Developer Tools\Mapper Extensions"

@ECHO.
@ECHO We need to GAC the .NET assembly that will be called
@GacUtil /if bin\Debug\Microsoft.Samples.BizTalk.CustomFunctoid.dll

@ENDLOCAL

@PAUSE