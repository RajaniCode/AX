﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DatabaseInfo._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="Info.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">    
        <asp:DropDownList ID="cboDatabase" runat="server" AutoPostBack="True" 
            onselectedindexchanged="cboDatabase_SelectedIndexChanged">
        </asp:DropDownList>
        <br /><br />
        <asp:GridView ID="grdTableInfo" runat="server">
        </asp:GridView>   
    </form>
</body>
</html>
