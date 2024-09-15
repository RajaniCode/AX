// CS 9
/*
Attributes on local functions
*/


/******************************************************************************/
// using directives
/******************************************************************************/
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.IO;
/******************************************************************************/


/******************************************************************************/
Console.WriteLine("Environment Properties");
/******************************************************************************/
EnvironmentProperties propertiesEnvironment = new();
propertiesEnvironment.Print();
Console.WriteLine();
/******************************************************************************/


/******************************************************************************/
Console.WriteLine("Attributes on local functions");
/******************************************************************************/
if (Environment.OSVersion.Platform == PlatformID.Win32NT)
{
    try
    {
#nullable enable
        string? currentFilePathAndNameWin32NT = new StackTrace(true).GetFrame(0)?.GetFileName();
        string? currentDirectoryWin32NT = Path.GetDirectoryName(currentFilePathAndNameWin32NT);
#nullable disable
        string sourceDirectoryWin32NT = currentDirectoryWin32NT + @"\GCCWin32NT\C";
        string targetDirectoryWin32NT = Directory.GetCurrentDirectory();

        // Console.WriteLine($"Current Directory: {currentDirectoryWin32NT}");
        // Console.WriteLine($"Source Directory: {sourceDirectoryWin32NT}");
        // Console.WriteLine($"Target Directory: {targetDirectoryWin32NT}");

        const string fileNameWin32NT = "msys64-mingw64-gcc.dll";
        Console.WriteLine($"C Library File Name: {fileNameWin32NT}");
        File.Copy(Path.Combine(sourceDirectoryWin32NT, fileNameWin32NT), Path.Combine(targetDirectoryWin32NT, fileNameWin32NT), true);

        // CS 9 extern modifier for local functions
        Console.WriteLine("static extern in local function");
        [DllImport(fileNameWin32NT, CharSet = CharSet.Unicode)]
        static extern int c_code();

        Console.WriteLine($"C Code: Call Void Fuction: c_code(): {c_code()}");
    }
    catch (IOException ex)
    {
        // Console.WriteLine($"ArgumentException StackTrace: {ex.StackTrace}");
        Console.WriteLine($"ArgumentException Message: {ex.Message}");
    }
    catch (UnauthorizedAccessException ex)
    {
        // Console.WriteLine($"ArgumentException StackTrace: {ex.StackTrace}");
        Console.WriteLine($"ArgumentException Message: {ex.Message}");
    }
    catch (Exception ex)
    {
        // Console.WriteLine($"ArgumentException StackTrace: {ex.StackTrace}");
        Console.WriteLine($"ArgumentException Message: {ex.Message}");
    }
}

if (Environment.OSVersion.Platform == PlatformID.Unix)
{
    try
    {
#nullable enable
        string? currentFilePathAndName = new StackTrace(true).GetFrame(0)?.GetFileName();
        string? currentDirectory = Path.GetDirectoryName(currentFilePathAndName);
#nullable disable
        string sourceDirectory = currentDirectory + "/GCC/C_x86_64";
        string targetDirectory = Directory.GetCurrentDirectory();

        // Console.WriteLine($"Current Directory: {currentDirectory}");
        // Console.WriteLine($"Source Directory: {sourceDirectory}");
        // Console.WriteLine($"Target Directory: {targetDirectory}");

        const string fileName = "msys64-mingw64-gcc.so";
        Console.WriteLine($"C Library File Name: {fileName}");
        File.Copy(Path.Combine(sourceDirectory, fileName), Path.Combine(targetDirectory, fileName), true);

        // CS 9 extern modifier for local functions
        Console.WriteLine("static extern in local function");
        [DllImport(fileName, CharSet = CharSet.Unicode)]
        static extern int c_code(int number);

        Console.WriteLine($"C Code: Multiply By 10: By Passing Argument (int.MaxValue / 10) For Parameter (number) To c_code(int number): {c_code(int.MaxValue / 10)}");
    }
    catch (IOException ex)
    {
        // Console.WriteLine($"ArgumentException StackTrace: {ex.StackTrace}");
        Console.WriteLine($"ArgumentException Message: {ex.Message}");
    }
    catch (UnauthorizedAccessException ex)
    {
        // Console.WriteLine($"ArgumentException StackTrace: {ex.StackTrace}");
        Console.WriteLine($"ArgumentException Message: {ex.Message}");
    }
    catch (Exception ex)
    {
        // Console.WriteLine($"ArgumentException StackTrace: {ex.StackTrace}");
        Console.WriteLine($"ArgumentException Message: {ex.Message}");
    }
}
/******************************************************************************/


/******************************************************************************/
// Environment Properties
/******************************************************************************/
class EnvironmentProperties
{
    public void Print()
    {
        Console.WriteLine($"Environment.OSVersion: {Environment.OSVersion}");
        Console.WriteLine($"Environment.OSVersion.Platform: {Environment.OSVersion.Platform}");
        Console.WriteLine($"Environment.OSVersion.Version: {Environment.OSVersion.Version}");
        Console.WriteLine($"Environment.OSVersion.VersionString: {Environment.OSVersion.VersionString}");
        Console.WriteLine($"Environment.OSVersion.Version.Major: {Environment.OSVersion.Version.Major}");
        Console.WriteLine($"Environment.OSVersion.Version.Minor: {Environment.OSVersion.Version.Minor}");

        Console.WriteLine($"Environment.OSVersion.Platform == System.PlatformID.Win32NT: {Environment.OSVersion.Platform == System.PlatformID.Win32NT}");
        Console.WriteLine($"Environment.OSVersion.Platform == System.PlatformID.Unix: {Environment.OSVersion.Platform == System.PlatformID.Unix}");
        // Mono JIT compiler version 6.12.0.206 'PlatformID' does not contain a definition for 'Other'
	// Console.WriteLine($"Environment.OSVersion.Platform == System.PlatformID.Other: {Environment.OSVersion.Platform == System.PlatformID.Other}");
        // System.PlatformID.Win32NT
        // Console.WriteLine($"Environment.OSVersion.ServicePack: {Environment.OSVersion.ServicePack}");

        // Environment.Version property returns the .NET runtime version for .NET 5+ and .NET Core 3.x
        // Not recommend for .NET Framework 4.5+
        Console.WriteLine($"Environment.Version: {Environment.Version}");
        //  <-- Keep this information secure! -->
        // Console.WriteLine($"Environment.UserName: {Environment.UserName}");

        //  <-- Keep this information secure! -->
        // Console.WriteLine($"Environment.MachineName: {Environment.MachineName}");

        //  <-- Keep this information secure! -->
        // Console.WriteLine($"Environment.UserDomainName: {Environment.UserDomainName}");

        Console.WriteLine($"Environment.Is64BitOperatingSystem: {Environment.Is64BitOperatingSystem}");
        Console.WriteLine($"Environment.Is64BitProcess: {Environment.Is64BitProcess}");

        //  <-- Keep this information secure! -->
        // Console.WriteLine("CurrentDirectory: {0}", Environment.CurrentDirectory);
        //  <-- Keep this information secure! -->
        // Console.WriteLine("SystemDirectory: {0}", Environment.SystemDirectory);

        // RuntimeInformation.FrameworkDescription property gets the name of the .NET installation on which an app is running
        // .NET 5+ and .NET Core 3.x // .NET Framework 4.7.1+ // Mono 5.10.1+
        Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription: {System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription}");

        Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture: {System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture}");
        Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.OSArchitecture: {System.Runtime.InteropServices.RuntimeInformation.OSArchitecture}");
        Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.OSDescription): {System.Runtime.InteropServices.RuntimeInformation.OSDescription}");
        // Mono JIT compiler version 6.12.0.206 'RuntimeInformation' does not contain a definition for 'RuntimeIdentifier'
        // Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.RuntimeIdentifier: {System.Runtime.InteropServices.RuntimeInformation.RuntimeIdentifier}");

        // <-- Keep this information secure! -->
#if comments
        Console.WriteLine("Environment Variables:");
        foreach (System.Collections.DictionaryEntry de in Environment.GetEnvironmentVariables())
        {
            Console.WriteLine("{0} = {1}", de.Key, de.Value);
        }
#endif
    }
}
/******************************************************************************/


// msys64-mingw64-gcc.dll
/*
$ mkdir -p "GCCWin32NT/C"
$ vim GCCWin32NT/C/msys64-mingw64-gcc.c
$ cat GCCWin32NT/C/msys64-mingw64-gcc.c
#include <stdio.h>
int 
c_code(void) {
  printf("C!\n");
}
$ gcc -c msys64-mingw64-gcc.c
$ gcc -shared -o msys64-mingw64-gcc.dll msys64-mingw64-gcc.o
*/


// msys64-mingw64-gcc.so
/* 
% mkdir -p "GCC/C_x86_64"
% nano GCC/C_x86_64/msys64-mingw64-gcc.c
% cat GCC/C_x86_64/msys64-mingw64-gcc.c
#include <stdio.h>
int
c_code(int number) {
  return number * 10;
}
/*
% sw_vers
ProductName:		macOS
ProductVersion:		14.4.1
BuildVersion:		23E224
% arch
arm64
% arch -x86_64 zsh
% arch                                                                             
i386
% gcc --version 
Apple clang version 15.0.0 (clang-1500.3.9.4)
Target: x86_64-apple-darwin23.4.0
Thread model: posix
InstalledDir: /Library/Developer/CommandLineTools/usr/bin
% gcc -c -fPIC msys64-mingw64-gcc.c
% gcc -shared -o msys64-mingw64-gcc.so msys64-mingw64-gcc.o
*/


// NB
// CS 8 Nullable reference type
// <Nullable>enable</Nullable> in .csproj
// Or
// #nullable enable // #nullable disable in .cs
// % dotnet run --configuration Debug
// Or
// % dotnet run --configuration Release


// Output
/*
Environment Properties
Environment.OSVersion: Unix 14.4.1
Environment.OSVersion.Platform: Unix
Environment.OSVersion.Version: 14.4.1
Environment.OSVersion.VersionString: Unix 14.4.1
Environment.OSVersion.Version.Major: 14
Environment.OSVersion.Version.Minor: 4
Environment.OSVersion.Platform == System.PlatformID.Win32NT: False
Environment.OSVersion.Platform == System.PlatformID.Unix: True
Environment.Version: 5.0.17
Environment.Is64BitOperatingSystem: True
Environment.Is64BitProcess: True
System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription: .NET 5.0.17
System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture: X64
System.Runtime.InteropServices.RuntimeInformation.OSArchitecture: X64
System.Runtime.InteropServices.RuntimeInformation.OSDescription): Darwin 23.4.0 Darwin Kernel Version 23.4.0: Fri Mar 15 00:10:42 PDT 2024; root:xnu-10063.101.17~1/RELEASE_ARM64_T6000

Attributes on local functions
C Library File Name: msys64-mingw64-gcc.so
static extern in local function
C Code: Multiply By 10: By Passing Argument (int.MaxValue / 10) For Parameter (number) To c_code(int number): 2147483640
*/


// Credits:
/*
https://dotnet.microsoft.com/
https://gcc.gnu.org/
*/