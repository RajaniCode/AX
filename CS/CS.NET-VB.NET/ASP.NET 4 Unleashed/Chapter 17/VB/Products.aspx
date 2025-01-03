<%@ Page Language="VB" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <style type="text/css">
    html
    {
        background-color:silver;
    }
    .content
    {
        padding:10px;
        background-color:white;
    }
    .products
    {
        margin-bottom:20px;
    }
    .products td,.products th
    {
        padding:5px;
        border-bottom:solid 1px blue;
    }
    a
    {
        color:blue;
    }
    </style>
    <title>Products</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="content">
    
    <asp:GridView
        id="grdProducts"
        DataSourceID="srcProducts"
        DataKeyNames="Id"
        AutoGenerateEditButton="true"
        AutoGenerateDeleteButton="true"
        AutoGenerateColumns="false"
        CssClass="products"
        GridLines="none"
        Runat="server">
        <Columns>
        <asp:BoundField 
            DataField="Id" 
            ReadOnly="true"
            HeaderText="Id" />
        <asp:BoundField 
            DataField="Name" 
            HeaderText="Name" />
        <asp:BoundField 
            DataField="Price"
            DataFormatString="{0:c}" 
            HeaderText="Price" />
        <asp:BoundField 
            DataField="Description" 
            HeaderText="Description" />
        </Columns>
    </asp:GridView>    
    
    <fieldset>
    <legend>Add Product</legend>
    <asp:DetailsView
        id="dtlProduct"
        DataSourceID="srcProducts"
        DefaultMode="Insert"
        AutoGenerateInsertButton="true"
        AutoGenerateRows="false"
        Runat="server">
        <Fields>
        <asp:BoundField 
            DataField="Name"
            HeaderText="Name:" />
        <asp:BoundField
            DataField="Price" 
            HeaderText="Price:"/>
        <asp:BoundField
            DataField="Description"
            HeaderText="Description:" />        
        </Fields>
    </asp:DetailsView>        
    </fieldset>    
    
    
    <asp:ObjectDataSource
        id="srcProducts"
        TypeName="AcmeStore.BusinessLogicLayer.Product"
        SelectMethod="SelectAll"
        UpdateMethod="Update"
        InsertMethod="Insert"
        DeleteMethod="Delete"
        Runat="server" />    
    
    </div>
    </form>
</body>
</html>
