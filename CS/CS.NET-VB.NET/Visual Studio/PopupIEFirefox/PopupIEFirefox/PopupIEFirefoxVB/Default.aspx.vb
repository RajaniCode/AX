
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnPopup.Attributes.Add("onClick", "javascript:InvokePop('" & txtFName.ClientID & "');")
    End Sub
End Class
