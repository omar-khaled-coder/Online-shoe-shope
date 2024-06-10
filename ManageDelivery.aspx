<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDelivery.aspx.cs" Inherits="WebApplication2_database_members_lesson.ManageDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .delivery-container {
            width: 100%; /* Use full width */
            margin: 20px auto; /* Centering the container */
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .delivery-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }
        .table-container {
            margin-top: 20px;
            overflow-x: auto; /* Allow horizontal scrolling if needed */
        }
        .table-container table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #dee2e6;
            margin-bottom: 0; /* Remove bottom margin to maintain spacing consistency */
        }
        .table-container th, .table-container td {
            padding: 8px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid #dee2e6;
        }
        .thead-dark {
            background-color: #343a40;
            color: white;
        }
        .btn-update {
            background-color: #28a745;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
        }
        .btn-update:hover {
            background-color: #218838;
        }
        .auto-style3 {
            margin-top: 20px;
            overflow-x: auto;
            width: 1573px;
            text-align: left;
        }
        .auto-style4 {
            width: 96%; /* Use full width */
            margin: 20px auto;
/* Centering the container */padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>

    <div class="auto-style4">
        <h2>Manage Delivery</h2>
        <div class="auto-style3">
            <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" CssClass="table table-striped" OnItemCommand="DataList1_ItemCommand" Width="1238px">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Image</th>
                                <th>Product Name</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Sub total</th>
                                <th>SCID</th>
                                <th>Customer Name</th>
                                <th>Customer ID</th>
                                <th>Date Added</th>
                                <th>Payment Status</th>
                                <th>Delivery Status</th>
                                <th>Action</th>
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
                            <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' /><br />
                        </td>

                        <td>
                            <asp:Label ID="lblqty" runat="server" Text='<%# Eval("qty") %>' />
                        </td>

                        <td>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>

                        <td>
                            <asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                        </td>
                        
                        <td>
                            <asp:Label ID="scidLabel" runat="server" Text='<%# Eval("SCID") %>' CssClass="form-control" />
                        </td>

                        <td>
                            <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("customerName") %>' />
                        </td>

                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' CssClass="form-control" />
                        </td>

                        <td>
                            <asp:Label ID="orderDateLabel" runat="server" Text='<%# Eval("dtAdded") %>' CssClass="form-control" />
                        </td>

                        <td>
                            <asp:Label ID="paymentStatusLabel" runat="server" Text='<%# Eval("paymentStatus") %>' CssClass="form-control" />
                        </td>

                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem>pending</asp:ListItem>
                                <asp:ListItem>out for delivery</asp:ListItem>
                                <asp:ListItem>completed</asp:ListItem>
                            </asp:DropDownList>
                        </td>

                        <td>
                            <asp:Button ID="btnupdate" CommandName="update" runat="server" Text="Update" CssClass="btn btn-update" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:DataList>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
        SelectCommand="SELECT DISTINCT sc.id, p.*, CONCAT(m.First_name, ' ', m.Last_name) AS customerName, sc.dtAdded, sc.SCID, sc.paymentStatus,
                       sc.qty * sc.price as subtotal, sc.qty
                       FROM ShoppingCart sc
                       INNER JOIN Products p ON p.pid = sc.pid
                       INNER JOIN Members m ON sc.Id = m.Id
                       WHERE sc.paymentStatus = 'paid' AND (sc.deliveryStatus = 'pending' OR sc.deliveryStatus = 'out for delivery')">
    </asp:SqlDataSource>
</asp:Content>
