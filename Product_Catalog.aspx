<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product_Catalog.aspx.cs" Inherits="WebApplication2_database_members_lesson.Product_Catalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
 /* General styling for the page */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

/* Container for product list */
.product-container {
    max-width: 1200px;
    margin: 100px auto 20px; /* Adjust margin-top to ensure full visibility */
    padding: 20px;
}

/* Styling for the product heading */
.product-container h1 {
    text-align: center;
    color: #333;
    margin-bottom: 40px;
}

/* Styling for the DataList items */
.product-container .datalist-item {
    background: white;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin: 10px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease;
}

/* Hover effect for the DataList items */
.product-container .datalist-item:hover {
    transform: scale(1.05);
}

/* Styling for the image */
.product-container .datalist-item img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
}

/* Styling for the labels */
.product-container .datalist-item label {
    display: block;
    margin: 10px 0;
    color: #555;
}

/* Styling for the buttons */
.product-container .datalist-item button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.product-container .datalist-item button:hover {
    background-color: #218838;
}

/* Remove extra space */
.product-container p {
    margin: 0;
}



    </style>
  <div class="product-container">
    <h1>Products</h1>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="pId" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <div class="datalist-item">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Height="200" Width="200" CssClass="product-image" />
                
                <!-- This is the product ID label, it is hidden from the view and it must be there (it's Value) to pass to the details page -->
                <label>
                     <asp:Label ID="pIdLabel" runat="server" Text='<%# Eval("pId") %>' Visible="false" />
                </label>

                <label>
                    Name: <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </label>
                <label>
                    Price: $<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </label>
                <asp:Button ID="btndetails" CommandName="details" runat="server" Text="Details" />
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
</div>


</asp:Content>
