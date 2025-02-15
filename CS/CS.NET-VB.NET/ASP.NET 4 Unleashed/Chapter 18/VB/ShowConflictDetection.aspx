<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<script runat="server">
 
    Protected Sub srcMovies_Updated(ByVal sender As Object, ByVal e As ObjectDataSourceStatusEventArgs)
        If Not e.Exception Is Nothing Then
            e.ExceptionHandled = True
            lblError.Text = "Could not update record"
        End If
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <style type="text/css">
        .error
        {
            color:red;
            font:bold 16px Arial,Sans-Serif;
        }
        a
        {
            color:blue;
        }
    </style>
    <title>Show Conflict Detection</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Label
        id="lblError"
        EnableViewState="false"
        CssClass="error"
        Runat="server" />
    
    <asp:GridView
        id="grdMovies"
        DataSourceID="srcMovies"
        DataKeyNames="Id"
        AutoGenerateEditButton="true"
        Runat="server" />
        
    <asp:ObjectDataSource
        id="srcMovies"
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original_{0}"
        TypeName="ConflictedMovies"
        SelectMethod="GetMovies"
        UpdateMethod="UpdateMovie"
        OnUpdated="srcMovies_Updated" 
        Runat="server" />    
    
    </div>
    </form>
</body>
</html>
