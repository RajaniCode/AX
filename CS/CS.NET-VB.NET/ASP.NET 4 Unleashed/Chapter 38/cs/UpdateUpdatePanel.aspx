﻿<%@ Page Language="C#" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ArrayList results = Movie.Search(txtSearch.Text);
        if (results.Count > 0)
        {
            grdResults.DataSource = results;
            grdResults.DataBind();
            upResults.Update();
        }        
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update UpdatePanel</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:ScriptManager
        id="sm1"
        Runat="server" />
    
    <asp:UpdatePanel    
        id="upSearch"
        Runat="server">
        <ContentTemplate>
        <asp:TextBox
            id="txtSearch"
            Runat="server" />
        <asp:Button
            id="btnSearch"
            Text="Search"
            OnClick="btnSearch_Click" 
            Runat="server" />
        </ContentTemplate>    
    </asp:UpdatePanel>
    
    <asp:UpdatePanel    
        id="upResults"
        UpdateMode="Conditional"
        Runat="server">
        <ContentTemplate>
        Results Time: <%= DateTime.Now.ToString("T") %>
        <br />
        <asp:GridView
            id="grdResults"
            runat="server" />
        </ContentTemplate>    
    </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
