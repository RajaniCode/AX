﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MasterPage.master" Title="TabContainer DataBinding"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="act" %>

<script runat="server" language="c#">

    protected override void OnLoad(EventArgs e) {
        base.OnLoad(e);
        FormView1.DataSource = new Item[]{new Item("ABC")};
        FormView1.DataBind();

        FormView2.DataSource = new Item[] { new Item("XYZ") };
        FormView2.DataBind();

        FormView3.DataSource = new Item[] { new Item("XYZ") };
        FormView3.DataBind();
    }
    

    public class Item{
        private string _text;
        
        public Item(string s) {
            _text = s;
        }
        
        public string Text {
            get {
            return _text;
            }
            set {
                _text = value;
            }
        }

        public string LowerText
        {
            get
            {
                return Text.ToLowerInvariant();
            }
        }
        
    }
    

</script>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="cph1" runat="server">

        
        <div>
            <asp:FormView ID="FormView1" runat="server">
            <ItemTemplate>
                <act:TabContainer ID="tc1" runat="server">
                    <act:TabPanel ID="foo" runat="server" HeaderText="tp1">
                    <ContentTemplate>
                            
                                <%# Eval("Text") %>                
                            
                    </ContentTemplate>                
                    </act:TabPanel>
                       <act:TabPanel ID="TabPanel1" runat="server" HeaderText="tp2">
                    <ContentTemplate>
                            
                                <%# Eval("LowerText") %>                
                            
                    </ContentTemplate>                
                    </act:TabPanel>
                </act:TabContainer>
            </ItemTemplate>
           </asp:FormView>
        </div>
        
        
        </asp:Content>
        
<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="cph2" runat="server">
   <act:TabContainer ID="tc2" runat="server">
                    <act:TabPanel ID="foo2" runat="server" HeaderText="tp1">
                    <ContentTemplate>
            <asp:FormView ID="FormView2" runat="server">
            <ItemTemplate>
                            
                                <%# Eval("Text") %>                
            </ItemTemplate>
           </asp:FormView>                
                    </ContentTemplate>                
                    </act:TabPanel>
                    <act:TabPanel ID="TabPanel2" runat="server" HeaderText="tp2">
                    <ContentTemplate>
                        <asp:FormView ID="FormView3" runat="server">
                        <ItemTemplate>                                        
                              <%# Eval("LowerText") %>                
                        </ItemTemplate>
                       </asp:FormView>                
                    </ContentTemplate>                
                    </act:TabPanel>
                </act:TabContainer>
            
</asp:Content>
