﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebProgressBar.aspx.cs" Inherits="WebProgressBar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>WebProgressBar</title>
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a:link {
	color: #0000FF;
}
a:visited {
	color: #0000FF;
}
a:hover {
	color: #0000FF;
	text-decoration: none;
}
a:active {
	color: #0000FF;
	}
.basix {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
.header1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: bold;
	color: #006699;
}
.lgHeader1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
	font-weight: bold;
	color: #0066CC;
	background-color: #CEE9FF;
}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button id="Button1" runat="server" Text="Start Long Task!" OnClick="Button1_Click"></asp:Button>
        </p>
    </form>
</body>
</html>
