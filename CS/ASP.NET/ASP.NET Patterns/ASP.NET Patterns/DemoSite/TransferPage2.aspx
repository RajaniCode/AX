<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TransferPage2.aspx.cs" Inherits="TransferPage2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
  <title ID="pageTitleElement" runat="server" />
  <link href="stylesheets/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div ID="pageHeadingElement" class="heading" runat="server" />
  <form id="form1" runat="server">
  <div>
    Actual URL is: <asp:Label ID="lblActualPath" runat="server" />
    <p />
    <asp:Button ID="btn_Close" runat="server" Text="Close" OnClick="btn_Close_Click" />
    <p />
    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
    </div>
  </form>
  <!--#include file="stylesheets\footer.inc" -->
</body>
</html>
