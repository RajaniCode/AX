﻿<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Sub Page_Load()
        Dim AddNumbers = Function(x, y) x + y
        Response.Write(AddNumbers(5, 6))
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Lamda Expressions</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Button 
        id="btn"
        Text="Go!"
        Runat="server" />
    
    <asp:Label
        id="lblResult"
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
