<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="trackOOrderDelivery.aspx.cs" Inherits="WebApplication2_database_members_lesson.trackOOrderDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       .padding{
           padding:10px;
       }
    .auto-style1 {
        width: 1341px;
    }
   </style>
    <p class="text-center">
        Track Orders
    </p>
    
    
    
    <p class="text-center">
        &nbsp;&nbsp;
        <asp:DataList ID="DataList1"  runat="server"
            DataKeyField="pId" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" Width="604px" >
            
            <HeaderTemplate>
            
                <Table class="auto-style1" >
                    <thead >
                        <tr>
                            <th>image</th>
                            <th>product details</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Sub total</th>
                            <th>Delivery Status</th>
                        </tr>
                    </thead>

                    </HeaderTemplate>
            <ItemTemplate >
                <tbody>
                    <tr>

                        <td class="padding">
                            <asp:Image ID="Image1" runat="server" 
                            ImageUrl ='<%# Eval("image") %>' Height="100px" Width="96px" />

                        </td>
                        <td>
                              <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />

                              

                              &nbsp;</td>

                        <td>
                    
                                
                            <asp:Label ID="lblqty" TextMode="Number" runat="server" Text='<%# Eval("qty") %>'></asp:Label>
                        </td>

                        <td>
                            
                            &nbsp;<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>

                        <td>
                              
                               &nbsp;<asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                               &nbsp;</td>
                        <td>
                              <strong>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("deliveryStatus") %>' />

                              </strong>
                        </td>

                        
                    </tr>
                </tbody>
               
            </ItemTemplate>
            <FooterTemplate>
                <br />
                </Table>

            </FooterTemplate>
        </asp:DataList>
</p>
       <asp:Label ID="lblGrandToal" runat="server" Text=""></asp:Label>
    

    <br />

    <p class="text-center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
            SelectCommand="SELECT p.*, sc. *, sc.qty* sc.price as subtotal FROM Products p, ShoppingCart sc
                WHERE p.pid =sc.pid AND sc.id =@id AND sc.paymentStatus = 'paid' " 
            DeleteCommand="DELETE FROM ShoppingCart"  >
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>
