<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="shoppingCart.aspx.cs" Inherits="WebApplication2_database_members_lesson.shoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .shopping-cart-container {
            margin: 20px auto;
            max-width: 900px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .shopping-cart-header {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .message-label {
            font-size: 18px;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }

        .table th {
            background-color: #f7f7f7;
            color: #333;
            font-weight: bold;
        }

        .table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            display: inline-block;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-primary:focus {
            outline: none;
            box-shadow: none;
        }

        .table-buttons img {
            cursor: pointer;
            width: 30px;
            height: 30px;
        }

        .text-center {
            text-align: center;
        }
    </style>

    <div class="shopping-cart-container">
        <div class="shopping-cart-header">
            Shopping Cart
        </div>

        <div class="message-label">
            <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>
        </div>

        <asp:DataList ID="DataList1" runat="server"
            DataKeyField="pId" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" CssClass="table">
            
            <HeaderTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Product Details</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Sub Total</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Height="100" Width="100" />
                    </td>
                    <td>
                        <strong>Name:</strong> <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' /><br />
                        
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
                    <td class="table-buttons">
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/product_images/image.png" height="50" Width="50" CommandName="update" runat="server" />
                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/product_images/image (1).png" height="50" Width="50" CommandName="delete" runat="server" />
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:DataList>

        <div class="text-center">
            <asp:Label ID="lblGrandToal" runat="server" Text=""></asp:Label>
        </div>

        <div class="text-center">
            <asp:Button ID="btnpay" runat="server" OnClick="btnpay_Click" Text="Check out" CssClass="btn-primary" />
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
        SelectCommand="SELECT p.*, sc.*, sc.qty*sc.price as subtotal FROM Products p, ShoppingCart sc
            WHERE p.pid = sc.pid AND sc.id = @id AND sc.paymentStatus = 'pending' AND sc.deliveryStatus = 'pending'" 
        DeleteCommand="DELETE FROM ShoppingCart">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
