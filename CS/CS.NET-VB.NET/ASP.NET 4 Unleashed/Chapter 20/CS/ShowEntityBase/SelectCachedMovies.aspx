﻿<%@ Page Language="C#" Trace="true" %>
<%@ Register TagPrefix="custom" Namespace="Superexpert.Controls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Select Movies</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:GridView
        id="grdMovies"
        DataSourceId="srcMovies"
        Runat="server" />
    
    <custom:EntityDataSource
        id="srcMovies"
        TypeName="Movie"
        SelectMethod="SelectCached"
        Runat="Server" />
    
    </div>
    </form>
</body>
</html>
