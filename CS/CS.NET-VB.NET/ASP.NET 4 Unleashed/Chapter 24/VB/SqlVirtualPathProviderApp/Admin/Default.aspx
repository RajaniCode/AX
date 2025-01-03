<%@ Page Language="VB" ValidateRequest="false" %>
<%@ Import Namespace="AspNetUnleashed" %>
<%@ Import Namespace="System.Collections.Generic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
 
    Private Sub Page_Load()
        If Not Page.IsPostBack Then
            PopulateTreeNodes()
        End If
    End Sub
 
    Private Sub PopulateTreeNodes()
        treeDirectories.Nodes.Clear()
        Dim rootNode As New TreeNode("Directories", "~/")
        treeDirectories.Nodes.Add(rootNode)
        PopulateDirectoryNode(rootNode)
    End Sub
 
    Private Sub PopulateDirectoryNode(ByVal parentNode As TreeNode)
        Dim dirs As List(Of SqlVirtualDirectory) = VirtualFiles.DirectorySelectDirectories(parentNode.Value)
        For Each dir As SqlVirtualDirectory In dirs
            Dim node As New TreeNode(dir.Name, dir.VirtualPath)
            node.PopulateOnDemand = True
            parentNode.ChildNodes.Add(node)
        Next
    End Sub
 
    Protected Sub treeDirectories_TreeNodePopulate(ByVal sender As Object, ByVal e As TreeNodeEventArgs)
        PopulateDirectoryNode(e.Node)
    End Sub
 
    Protected Sub grdFiles_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        pnlEditFile.Visible = True
    End Sub
 
    Protected Sub frmEditFile_ItemCommand(ByVal sender As Object, ByVal e As FormViewCommandEventArgs)
        If e.CommandName = "Cancel" Then
            pnlEditFile.Visible = False
        End If
    End Sub
 
    Protected Sub frmEditFile_ItemUpdated(ByVal sender As Object, ByVal e As FormViewUpdatedEventArgs)
        pnlEditFile.Visible = False
    End Sub
 
    Protected Sub lnkDeleteDirectory_Click(ByVal sender As Object, ByVal e As EventArgs)
        If Not IsNothing(treeDirectories.SelectedNode) Then
            VirtualFiles.DirectoryDelete(treeDirectories.SelectedNode.Value)
        End If
        PopulateTreeNodes()
        treeDirectories.DataBind()
    End Sub
 
    Protected Sub lnkAddDirectory_Click(ByVal sender As Object, ByVal e As EventArgs)
        pnlAddDirectory.Visible = True
    End Sub
 
    Protected Sub srcDirectories_Inserted(ByVal sender As Object, ByVal e As ObjectDataSourceStatusEventArgs)
        PopulateTreeNodes()
        treeDirectories.DataBind()
        pnlAddDirectory.Visible = False
    End Sub
 
    Protected Sub lnkAddFile_Click(ByVal sender As Object, ByVal e As EventArgs)
        pnlAddFile.Visible = True
    End Sub
 
    Protected Sub frmAddFile_ItemCommand(ByVal sender As Object, ByVal e As FormViewCommandEventArgs)
        If e.CommandName = "Cancel" Then
            pnlAddFile.Visible = False
        End If
    End Sub
 
    Protected Sub frmAddFile_ItemInserted(ByVal sender As Object, ByVal e As FormViewInsertedEventArgs)
        grdFiles.DataBind()
        pnlAddFile.Visible = False
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <style type="text/css">
        html
        {
            background-color:navy;
            font:12px Verdana;
        }
        a
        {
            color:Navy;
        }
        h1
        {
            color: #444444  ;
            font-size:18px;
        }
        .grid th, .grid td
        {
            padding:5px 15px;
        }
        .editPanel
        {
            border:outset;
            position:absolute;
            top:50px;
            left:250px;
            padding:10px;
            background-color:white;
        }
    </style>
    <title>Admin Virtual Files</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:750px;border:solid 1px black;background-color:LightGrey">
    
    <h1 style="border-bottom:solid 1px black;padding:10px">Virtual Web Site Editor</h1>
    
    <div style="float:left;width:250px;padding:10px;border-right:solid 1px black">

    <asp:TreeView
        id="treeDirectories"
        OnTreeNodePopulate="treeDirectories_TreeNodePopulate"
        ShowLines="true"
        SelectedNodeStyle-BackColor="darkgray"
        Runat="server" />        
    
    </div>
    <div style="float:left;width:450px;padding:10px">
    
    <asp:GridView
        id="grdFiles"
        DataSourceID="srcFiles"
        DataKeyNames="VirtualPath"
        EmptyDataText="There are no files in this directory."
        AutoGenerateColumns="false"
        GridLines="none"
        CssClass="grid"
        Runat="server" OnSelectedIndexChanged="grdFiles_SelectedIndexChanged">
        <Columns>
        <asp:CommandField SelectText="Edit" ShowSelectButton="true" ShowDeleteButton="true" />
        <asp:HyperLinkField DataTextField="Name" DataNavigateUrlFields="VirtualPath" Target="_blank" HeaderText="File Name" />
        </Columns>
    </asp:GridView>    
    
    </div>
    
    <hr style="clear:both" />
    <div style="padding:10px">
    <asp:LinkButton
        id="lnkDeleteDirectory"
        Text="Delete Selected Directory"
        Runat="server" OnClick="lnkDeleteDirectory_Click" />

    &nbsp;|&nbsp; 
        
    <asp:LinkButton
        id="lnkAddDirectory"
        Text="Add Directory"
        Runat="server" OnClick="lnkAddDirectory_Click" />

    &nbsp;|&nbsp; 
    
    <asp:LinkButton
        id="lnkAddFile"
        Text="Add File"
        Runat="server" OnClick="lnkAddFile_Click" />
        


    </div>

    <asp:Panel
        id="pnlEditFile"
        Visible="false"
        CssClass="editPanel"
        Runat="server">
        
        <asp:FormView
            id="frmEditFile"
            DataSourceID="srcEditFiles"
            DefaultMode="Edit"
            OnItemCommand="frmEditFile_ItemCommand"
            OnItemUpdated="frmEditFile_ItemUpdated"
            Runat="Server">
            <EditItemTemplate>
            
            <h1>Edit <%# Eval("Name") %></h1>            
            <asp:Label
                id="lblContent"
                Text="Content"
                AssociatedControlID="txtContent"
                Runat="server" />
            <br />
            <asp:TextBox
                id="txtContent"
                Text='<%# Bind("Content") %>'
                TextMode="MultiLine"
                Columns="60"
                Rows="10"
                Wrap="false"
                Runat="server" />
        
            <br /><br />
            <asp:Button
                id="btnUpdate"
                Text="Update"
                CommandName="Update"
                Runat="server" />
            <asp:Button
                id="btnCancel"
                Text="Cancel"
                CommandName="Cancel"
                CausesValidation="false"
                Runat="server" />           
            
            </EditItemTemplate>
        </asp:FormView>    
    </asp:Panel>

    <asp:Panel
        id="pnlAddFile"
        Visible="false"
        CssClass="editPanel"
        Runat="server">
        
        <asp:FormView
            id="frmAddFile"
            DataSourceID="srcEditFiles"
            DefaultMode="Insert"
            Runat="Server" OnItemCommand="frmAddFile_ItemCommand" OnItemInserted="frmAddFile_ItemInserted">
            <InsertItemTemplate>
            
            <h1>Add File</h1>
            <asp:Label
                id="lblFileName"
                Text="File Name"
                AssociatedControlID="txtFileName"
                Runat="server" />
            <br />
            <asp:TextBox
                id="txtFileName"
                Text='<%# Bind("Name") %>'
                Runat="server" />
            <br /><br />
            <asp:Label
                id="lblContent"
                Text="Content"
                AssociatedControlID="txtContent"
                Runat="server" />
            <br />
            <asp:TextBox
                id="txtContent"
                Text='<%# Bind("Content") %>'
                TextMode="MultiLine"
                Columns="60"
                Rows="10"
                Wrap="false"
                Runat="server" />
        
            <br /><br />
            <asp:Button
                id="btnAdd"
                Text="Add"
                CommandName="Insert"
                Runat="server" />
            <asp:Button
                id="btnCancel"
                Text="Cancel"
                CommandName="Cancel"
                CausesValidation="false"
                Runat="server" />           
            
            </InsertItemTemplate>
        </asp:FormView>    
    </asp:Panel>



    <asp:Panel
        id="pnlAddDirectory"
        Visible="false"
        CssClass="editPanel"
        Runat="server">
        
        <h1>Add Directory</h1>
        
        <asp:FormView
            id="frmAddDirectory"
            DataSourceID="srcDirectories"
            DefaultMode="Insert"
            Runat="server">
            <InsertItemTemplate>
            
            <asp:Label
                id="lblDirectoryName"
                Text="Directory Name:"
                AssociatedControlID="txtDirectoryName"
                Runat="server" />
            <asp:TextBox
                id="txtDirectoryName"
                Text='<%# Bind("Path") %>'
                Runat="server" />    
            <br /><br /> 
            <asp:Button
                id="btnInsert"
                Text="Add"
                CommandName="Insert"
                Runat="server" />
            </InsertItemTemplate>    
        </asp:FormView>
        
   </asp:Panel>


    <asp:ObjectDataSource
        id="srcFiles"
        TypeName="AspNetUnleashed.VirtualFiles"
        SelectMethod="DirectorySelectFiles"
        DeleteMethod="FileDelete"
        Runat="server">
        <SelectParameters>
        <asp:ControlParameter Name="VirtualPath" ControlID="treeDirectories" DefaultValue="~/" />
        </SelectParameters>
    </asp:ObjectDataSource>    


    <asp:ObjectDataSource
        id="srcEditFiles"
        TypeName="AspNetUnleashed.VirtualFiles"
        SelectMethod="FileSelect"
        UpdateMethod="FileContentUpdate"
        InsertMethod="FileInsert"
        Runat="server">
        <SelectParameters>
        <asp:ControlParameter Name="VirtualPath" ControlID="grdFiles" />
        </SelectParameters>
        <UpdateParameters>
        <asp:ControlParameter Name="VirtualPath" ControlID="grdFiles" />
        </UpdateParameters>
        <InsertParameters>
        <asp:ControlParameter Name="VirtualPath" ControlID="treeDirectories" DefaultValue="~/" />
        </InsertParameters>
    </asp:ObjectDataSource>    

    <asp:ObjectDataSource
        id="srcDirectories"
        TypeName="AspNetUnleashed.VirtualFiles"
        InsertMethod="DirectoryInsert"
        OnInserted="srcDirectories_Inserted"
        Runat="server" >
        <InsertParameters>
        <asp:ControlParameter Name="VirtualPath" ControlID="treeDirectories" DefaultValue="~/" />
        </InsertParameters>
    </asp:ObjectDataSource>    
        


    </div>
    </form>
</body>
</html>
