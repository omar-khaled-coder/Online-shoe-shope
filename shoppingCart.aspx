<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="shoppingCart.aspx.cs" Inherits="WebApplication2_database_members_lesson.shoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-center">
        Shopping Cart</p>
<p class="text-center">
        <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>
</p>

<p class="text-center">
        <asp:DataList ID="DataList1" runat="server"
            DataKeyField="pId" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
            
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
                    
                                
                            <asp:TextBox ID="TextBox1" TextMode="Number" runat="server" Text='<%# Eval("qty") %>'></asp:TextBox>
                        </td>

                        <td>
                            
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>

                        <td>
                              
                               <asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                        </td>
                        
                        <td>
                            <asp:ImageButton ID="ImageButton1" ImageUrl="product_images/image.png"
                                height="50" Width="50" CommandName="update" runat="server" />
                            
                            <asp:ImageButton ID="ImageButton2" ImageUrl="product_images/image (1).png"
                                height="50" Width="50" CommandName="delete" runat="server" />

                        </td>
                        
                    </tr>
                </tbody>
                <br />
               
            </ItemTemplate>
            <FooterTemplate>
                </Table>
            </FooterTemplate>
        </asp:DataList>
</p>
       <asp:Label ID="lblGrandToal" runat="server" Text=""></asp:Label>

    <br />
        <asp:Button ID="btnpay" runat="server" OnClick="btnpay_Click" Text="Check out" />

         

    <p class="text-center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" SelectCommand="SELECT p.*, sc. *, sc.qty* sc.price as subtotal FROM Products p, ShoppingCart sc
WHERE p.pid =sc.pid AND sc.id =@id AND sc.paymentStatus = 'pending' AND sc.deliveryStatus = 'pending'" 
            DeleteCommand="DELETE FROM ShoppingCart" OnSelecting="SqlDataSource1_Selecting"  >
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>

</asp:Content>
