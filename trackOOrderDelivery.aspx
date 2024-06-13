<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="trackOOrderDelivery.aspx.cs" Inherits="WebApplication2_database_members_lesson.trackOOrderDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .padding {
            padding: 10px;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>
    <p class="text-center">
        Track Orders
    </p>
    
    <p class="text-center">
        <asp:DataList ID="DataList1" runat="server"
            DataKeyField="SCID" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Vertical" Width="100%">
            
            <HeaderTemplate>
                <table class="auto-style1">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Product Details</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Sub Total</th>
                            <th>Delivery Status</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td class="padding">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Height="100px" Width="96px" />
                        </td>
                        <td>
                            <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblqty" runat="server" Text='<%# Eval("qty") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>
                        <td>
                            <asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                        </td>
                        <td>
                            <strong>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("deliveryStatus") %>' />
                            </strong>
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:DataList>
    </p>
    
    <asp:Label ID="lblGrandToal" runat="server" Text=""></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
        SelectCommand="SELECT p.*, sc.*, sc.qty * sc.price AS subtotal FROM Products p
                        INNER JOIN ShoppingCart sc ON p.pid = sc.pid
                        WHERE sc.id = @id AND sc.paymentStatus = 'paid'"
        DeleteCommand="DELETE FROM ShoppingCart WHERE SCID=@SCID AND id=@id">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="id" />
        </SelectParameters>
        <DeleteParameters>
            <asp:SessionParameter Name="id" SessionField="id" />
            <asp:Parameter Name="SCID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>

