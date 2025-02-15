<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
        If rdlOther.Checked Then
            pnlOther.Visible = True
        Else
            pnlOther.Visible = False
        End If
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Show Panel</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    Select your favorite programming language:
    <br /><br />
    <asp:RadioButton
        id="rdlVisualBasic"
        GroupName="language"
        Text="Visual Basic"
        Runat="server" />
    <br /><br />
    <asp:RadioButton
        id="rdlCSharp"
        GroupName="language"
        Text="C#"
        Runat="server" />
    <br /><br />
    <asp:RadioButton
        id="rdlOther"
        GroupName="language"
        Text="Other Language"
        Runat="server" />
    <br />    
    <asp:Panel
        id="pnlOther"
        Visible="false"
        Runat="server">
        
        <asp:Label
            id="lblOther"
            Text="Other Language:"
            AssociatedControlID="txtOther"
            Runat="server" />
        <asp:TextBox
            id="txtOther"
            Runat="server" />    
        
    </asp:Panel>
    
    <br /><br />
    
    <asp:Button
        id="btnSubmit"
        Text="Submit"
        OnClick="btnSubmit_Click" 
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
