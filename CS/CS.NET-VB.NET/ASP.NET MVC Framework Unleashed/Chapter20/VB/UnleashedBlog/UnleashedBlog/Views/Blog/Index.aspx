<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of UnleashedBlog.PagedList (Of UnleashedBlog.BlogEntry))" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <div id="blogEntries">
    <% Html.RenderPartial("BlogEntries")%>
  </div>
    
  <div id="loadingMoreEntries" style="display:none">
    Loading more entries...
    <img src="<%= Url.Content("~/Content/ajax-loader.gif") %>" 
         alt="Loading more entries" />
  </div>  
    
</asp:Content>
