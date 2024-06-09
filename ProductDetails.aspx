<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WebApplication2_database_members_lesson.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .product-details {
            display: flex;
            flex-wrap: wrap;
            margin: 20px 0;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .product-image, .product-info {
            flex: 1;
            padding: 20px;
        }

        .product-image {
            background-color: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-info {
            background-color: #fdfdfd;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
        }

        .product-info h2 {
            margin-top: 0;
            color: #333;
            font-family: 'Arial', sans-serif;
        }

        .product-info p, .product-info h2 {
            margin-bottom: 20px;
            font-family: 'Arial', sans-serif;
        }

        .product-info label {
            font-weight: bold;
            font-family: 'Arial', sans-serif;
        }

        .product-info .quantity {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .product-info .quantity input {
            width: 60px;
            margin-left: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .product-info .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-size: 16px;
            font-family: 'Arial', sans-serif;
            text-decoration: none;
            display: inline-block;
        }

        .product-info .btn:hover {
            background-color: #218838;
        }

        .product-info .btn:focus {
            outline: none;
            box-shadow: none;
        }

        .product-info .btn:active {
            transform: scale(0.98);
        }

        .product-info .message {
            margin-top: 20px;
            color: #d9534f;
        }

        @media (max-width: 768px) {
            .product-details {
                flex-direction: column;
            }

            .product-info {
                padding: 20px;
            }
        }
    </style>

    <div class="product-details">
        <div class="product-image">
            <asp:Image ID="imgproduct" runat="server" Height="398px" Width="381px" />
        </div>

        <div class="product-info">
            <h2>Product Name: <asp:Label ID="Lblname" runat="server" Text="Label"></asp:Label></h2>
            <h2 style="display: none;">&nbsp;<asp:Label ID="lblpid" runat="server" Text="Label"></asp:Label></h2>
            <h2>Price: <asp:Label ID="lblprice" runat="server" Text="Label"></asp:Label></h2>
            <div class="quantity">
                <label>Quantity: </label>
                <asp:TextBox ID="txtquntity" runat="server" TextMode="Number" Text="1"></asp:TextBox>
            </div>
            <p>Product description: <asp:Label ID="lbldescription" runat="server" Text="Label"></asp:Label></p>
            <a href="#" class="btn">
                <asp:Button ID="Btnaddtocart" runat="server" Text="Add to Cart" OnClick="Btnaddtocart_Click" CssClass="btn" />
            </a>
            <p class="message"><asp:Label ID="lblmassage" runat="server"></asp:Label></p>
        </div>
    </div>
</asp:Content>

