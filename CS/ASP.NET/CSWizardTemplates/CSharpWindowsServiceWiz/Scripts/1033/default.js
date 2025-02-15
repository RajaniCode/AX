// (c) Microsoft Corporation
// created by Michael Groeger
function CreationDate()
{
       var Months = new Array("JAN","FEB","MAR","APR","MAY","JUN",
                "JUL","AUG","SEP","OCT","NOV","DEC");
    var myDate = new Date();
    var currentDate = 
    myDate.getFullYear()
    +Months[myDate.getMonth()]    
    +myDate.getDate();
    
    wizard.AddSymbol("CREATION_DATE",currentDate);
}

function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
		var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
		var strProjectName = wizard.FindSymbol("PROJECT_NAME");
		var strSafeProjectName = CreateSafeName(strProjectName);
		wizard.AddSymbol("SAFE_PROJECT_NAME", strSafeProjectName);
		
		// add CreationDate() call    
    	CreationDate();
    	//
		
		var bEmptyProject = 0; //wizard.FindSymbol("EMPTY_PROJECT");

		var proj = CreateCSharpProject(strProjectName, strProjectPath, "DefaultWinExe.csproj");

		var InfFile = CreateInfFile();
		if (!bEmptyProject)
		{
			AddReferencesForWinService(proj);
			AddFilesToCSharpProject(proj, strProjectName, strProjectPath, InfFile, false);

		}
		proj.Save();
	}
	catch(e)
	{
		if( e.description.length > 0 )
			SetErrorInfo(e);
		return e.number;
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
   		if( InfFile )
			InfFile.Delete();
    }
}

function GetCSharpTargetName(strName, strProjectName)
{
	var strTarget = strName;

	switch (strName)
	{
		case "readme.txt":
			strTarget = "ReadMe.txt";
			break;
		case "File1.cs":
			strTarget = "Service1.cs";
			break;
		case "assemblyinfo.cs":
			strTarget = "AssemblyInfo.cs";
			break;
	}
	return strTarget; 
}

function DoOpenFile(strName)
{
	var bOpen = false;
    
	switch (strName)
	{
		case "Service1.cs":
			bOpen = true;
			break;
	}
	return bOpen; 
}

function SetFileProperties(oFileItem, strFileName)
{
    if(strFileName == "File1.cs")
    {
        oFileItem.Properties("SubType").Value = "Component";
    }
}

