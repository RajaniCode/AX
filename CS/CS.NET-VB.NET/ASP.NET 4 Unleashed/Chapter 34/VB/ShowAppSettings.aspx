<%@ Page Language="VB" %>
<%@ Import Namespace="System.Web.Configuration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Sub Page_Load()
        lblWelcome.Text = WebConfigurationManager.AppSettings("welcome")
    End Sub
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Show AppSettings</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Label
        id="lblWelcome"
        Runat="server" />
        
    <hr />
    
    <asp:Literal
        id="ltlCopyright"
        Text="<%$ AppSettings:copyright %>"    
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
