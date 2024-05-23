<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApplication2_database_members_lesson.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-center">
        <br />
        Check out</p>
    <p class="text-center">
        <asp:Label ID="lblGrandTotal" runat="server" Text="Label"></asp:Label>
    </p>
    
    <p class="text-center">
        <asp:DataList ID="DataList1" runat="server"
            DataKeyField="pId" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal">
            
            <HeaderTemplate>
            
                <Table>
                    <thead>
                        <th>image</th>
                        <th> product details</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Sub total</th>
                    </thead>

                    </HeaderTemplate>
            <ItemTemplate>
                <tbody>
                    <tr>

                        <td>
                            <asp:Image ID="Image1" runat="server" 
                            ImageUrl ='<%# Eval("image") %>' Height="100" Width="100" />

                        </td>
   
                        <td>
                            name:
                              <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                               pId:
                              <asp:Label ID="pIdLabel"  runat="server" Text='<%# Eval("pId") %>' />
                                
                                scid:
                              <asp:Label ID="scidLabel1"  runat="server" Text='<%# Eval("SCId") %>' />

                        </td>

                        <td>
                    
                                
                            <asp:Label ID="lblqty" TextMode="Number" runat="server" Text='<%# Eval("qty") %>'></asp:Label>
                        </td>

                        <td>
                            
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>

                        <td>
                              
                               <asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                        </td>
                        

                        
                    </tr>
                </tbody>
               
            </ItemTemplate>
            <FooterTemplate>

                </Table>

            </FooterTemplate>
        </asp:DataList>
</p>
       <asp:Label ID="lblGrandToal" runat="server" Text=""></asp:Label>
    <p class="text-center">
        <asp:Button ID="btnpayment" runat="server" OnClick="btnpayment_Click" Text="Pay Now" />
    </p>

    <br />

    <p class="text-center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
            SelectCommand="SELECT p.*, sc. *, sc.qty* sc.price as subtotal FROM Products p, ShoppingCart sc
                WHERE p.pid =sc.pid AND sc.id =@id AND sc.paymentStatus = 'pending' AND sc.deliveryStatus = 'pending'" 
            DeleteCommand="DELETE FROM ShoppingCart"  >
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>
