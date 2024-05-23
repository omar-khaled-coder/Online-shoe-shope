<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDelivery.aspx.cs" Inherits="WebApplication2_database_members_lesson.ManageDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-center">
        Manage Delivery</p>
    <p class="text-center">
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" Width="695px" OnItemCommand="DataList1_ItemCommand">
           
            <HeaderTemplate>
            
                <Table border="1">
                    <thead>
                        <th>ID</th>
                        <th> Delivery Status</th>
                        <th>Action</th>
                        
                    </thead>

                    </HeaderTemplate>
            
            
            
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EFF3FB" />
            
            <ItemTemplate>

                <tbody>

                    <td>
                   
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />

                    </td>

                    <td>
                        
                         <asp:DropDownList ID="DropDownList1" runat="server" >
                            <asp:ListItem>pending</asp:ListItem>
                            <asp:ListItem>out for delivery</asp:ListItem>
                            <asp:ListItem>completed</asp:ListItem>
                             </asp:DropDownList>

                    </td>
                    <td>
                       <asp:Button ID="btnupdate" CommandName="update" runat="server" Text="Update" />
                    </td>

                <br />
                    <br />

                </tbody>
                
            </ItemTemplate>

            <FooterTemplate>
                </Table>
            </FooterTemplate>

            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
    </p>
    
    <p class="text-center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" SelectCommand="SELECT DISTINCT(id) FROM ShoppingCart
            WHERE paymentStatus='paid' AND deliveryStatus='pending' OR deliveryStatus= 'out for delivery'"></asp:SqlDataSource>
    </p>
   
</asp:Content>
