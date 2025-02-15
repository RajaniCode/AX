﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DialogDemo.Models.Person>" %>
    <div id="customerInfo">
    <fieldset class="display-set">
        
        <div class="display-label">Person Id:</div>
        <div class="display-field"><%: Model.PersonId %></div>
        
        <div class="display-label">First Name:</div>
        <div class="display-field"><%: Model.FirstName%></div>
        
        <div class="display-label">Last Name:</div>
        <div class="display-field"><%: Model.LastName%></div>
        
    </fieldset>
    <p>      
        <%: Html.ActionLink("Edit", "CustomerEdit", new { customerid = Model.PersonId }, new { @class = "modalDlg", title = "Edit Customer" })%> 
    </p>
    </div>