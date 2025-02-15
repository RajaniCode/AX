﻿<%@ Page Language="vb" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of MvcMusicStore.RegisterModel)" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a New Account</h2>
    <p>
        Use the form below to create a new account. 
    </p>
    <p>
        Passwords are required to be a minimum of <%:ViewData("PasswordLength")%> characters in length.
    </p>

    <%
    Using Html.BeginForm()
    %>
        <%:Html.ValidationSummary(True, "Account creation was unsuccessful. Please correct the errors and try again.")%>
        <div>
            <fieldset>
                <legend>Account Information</legend>

                <div class="editor-label">
                    <%:Html.LabelFor(Function(m) m.UserName)%>
                </div>
                <div class="editor-field">
                    <%:Html.TextBoxFor(Function(m) m.UserName)%>
                    <%:Html.ValidationMessageFor(Function(m) m.UserName)%>
                </div>

                <div class="editor-label">
                    <%:Html.LabelFor(Function(m) m.Email)%>
                </div>
                <div class="editor-field">
                    <%:Html.TextBoxFor(Function(m) m.Email)%>
                    <%:Html.ValidationMessageFor(Function(m) m.Email)%>
                </div>

                <div class="editor-label">
                    <%:Html.LabelFor(Function(m) m.Password)%>
                </div>
                <div class="editor-field">
                    <%:Html.PasswordFor(Function(m) m.Password)%>
                    <%:Html.ValidationMessageFor(Function(m) m.Password)%>
                </div>

                <div class="editor-label">
                    <%:Html.LabelFor(Function(m) m.ConfirmPassword)%>
                </div>
                <div class="editor-field">
                    <%:Html.PasswordFor(Function(m) m.ConfirmPassword)%>
                    <%:Html.ValidationMessageFor(Function(m) m.ConfirmPassword)%>
                </div>

                <p>
                    <input type="submit" value="Register" />
                </p>
            </fieldset>
        </div>
    <%
    End Using
    %>
</asp:Content>