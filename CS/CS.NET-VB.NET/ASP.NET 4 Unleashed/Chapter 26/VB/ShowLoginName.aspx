<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Show LoginName</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <asp:LoginName
        id="LoginName1"
        FormatString="{0} /"
        Runat="server" />
    
    <asp:LoginStatus
        id="LoginStatus1"
        Runat="server" />
    
    <hr />

    Additional information is available to registered users. Log in to view
    the additional information. 
    
    </div>
    </form>
</body>
</html>
