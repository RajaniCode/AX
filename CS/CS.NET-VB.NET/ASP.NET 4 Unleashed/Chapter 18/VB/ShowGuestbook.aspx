<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<script runat="server">
 
    Protected  Sub srcGuestbook_Inserting(ByVal sender As Object, ByVal e As ObjectDataSourceMethodEventArgs)
        e.InputParameters.Add("IPAddress", Request.UserHostAddress)
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <style type="text/css">
        .guestbook td,.guestbook th
        {
            padding:5px;
            font:14px Arial,Sans-Serif;
        }
    </style>
    <title>Show Guestbook</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:FormView
        id="frmGuestbook"
        DataSourceID="srcGuestbook"
        DefaultMode="Insert"
        Runat="server">
        <InsertItemTemplate>
        <asp:Label
            ID="lblComment"
            Text="Comment:"
            AssociatedControlID="txtComment"
            Runat="server" />
        <br />
        <asp:TextBox
            id="txtComment"
            Text='<%# Bind("comment") %>'
            TextMode="MultiLine"
            Columns="50"
            Rows="4"
            Runat="server" />    
        <br />
        <asp:Button
            id="btnInsert"
            Text="Add Entry"
            CommandName="Insert"
            Runat="server" /> 
        </InsertItemTemplate>
    </asp:FormView>
    
    <hr />
    
    <asp:GridView
        id="grdGuestbook"
        DataSourceID="srcGuestbook"
        CssClass="guestbook"
        Runat="server" />
    
    <asp:ObjectDataSource
        id="srcGuestbook"
        TypeName="Guestbook"
        SelectMethod="GetEntries"
        InsertMethod="AddEntry"
        OnInserting="srcGuestbook_Inserting"
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
