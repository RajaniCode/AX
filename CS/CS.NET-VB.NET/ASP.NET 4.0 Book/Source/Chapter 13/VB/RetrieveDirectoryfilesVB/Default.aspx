﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Displays List of Files for the Directory Mentioned in the text box.
		<br />
		<br />
		<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
		Text="Enter path and name of directory"></asp:Label>
		
		<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		<br />
		&nbsp;<br />
		<br />
		
		<asp:Button ID="Btnshow" runat="server" Text="Show Files" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:ListBox ID="ListBox1" runat="server" Height="181px" Width="269px">
		</asp:ListBox>
        <br />
        <br />
<asp:Label ID="Label2" runat="server"></asp:Label>
    </div>
    
    </form>
</body>
</html>
