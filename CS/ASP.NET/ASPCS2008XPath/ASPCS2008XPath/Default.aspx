﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPCS2008XPath._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:XmlDataSource
        id="XmlSource"
        DataFile="bookstore.xml"
        runat="server"
        XPath="bookstore/genre[@name='fiction']"/>

    <asp:Repeater ID="Repeater1"
        DataSourceID="XmlSource"
        runat="server">        
        <ItemTemplate>
        <h1><%# XPath ("book/title") %></h1>
        <b>Price:</b>
        <%# XPath ("book/price") %>
        </ItemTemplate>    
    </asp:Repeater>

    </div>
    </form>
</body>
</html>
