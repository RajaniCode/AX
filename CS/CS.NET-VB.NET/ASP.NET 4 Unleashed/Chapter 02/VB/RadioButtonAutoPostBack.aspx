<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Sub RadioButton_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim selectedRadioButton As RadioButton = CType(sender, RadioButton)
        lblResult.Text = selectedRadioButton.Text
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>RadioButton AutoPostBack</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    How did you hear about our Website?
    
    <ul>
        <li>
        <asp:RadioButton
            id="rdlMagazine"
            Text="Magazine Article"
            GroupName="Source"
            AutoPostBack="true"
            OnCheckedChanged="RadioButton_CheckedChanged"
            Runat="server" />
        </li>
        <li>
        <asp:RadioButton
            id="rdlTelevision"
            Text="Television Program"
            GroupName="Source"
            AutoPostBack="true"
            OnCheckedChanged="RadioButton_CheckedChanged"
            Runat="server" />
        </li>
        <li>
        <asp:RadioButton
            id="rdlOther"
            Text="Other Source"
            GroupName="Source"
            AutoPostBack="true"
            OnCheckedChanged="RadioButton_CheckedChanged"
            Runat="server" />
        </li>
    </ul>

    <hr />
    
    <asp:Label
        id="lblResult"
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
