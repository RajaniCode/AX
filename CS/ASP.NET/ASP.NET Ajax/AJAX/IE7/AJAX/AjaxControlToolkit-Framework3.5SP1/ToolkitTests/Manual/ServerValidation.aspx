﻿<%@ Page Language="C#" %>
<%@ Register Namespace="CustomValidators" TagPrefix="tp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ValidatorCalloutExtender with Server Validation</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager runat="server" />

        <asp:TextBox ID="TB" runat="server" />
        <br />
        <asp:RequiredFieldValidator ID="RFV" runat="server" ControlToValidate="TB" ErrorMessage="Missing text (client-side RequiredFieldValidator)" />
        <ajaxToolkit:ValidatorCalloutExtender ID="VCE_RFV" runat="server" TargetControlID="RFV" />
        <br />
        <tp:ServerValidator ID="SV" runat="server" ControlToValidate="TB" ErrorMessage="Must be '1' (server side ServerValidator)" />
        <ajaxToolkit:ValidatorCalloutExtender ID="VCE_CSV" runat="server" TargetControlID="SV" />

        <br />
        <asp:Button runat="server" Text="Submit" />
    </div>
    </form>
</body>
</html>
