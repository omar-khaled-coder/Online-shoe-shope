<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2_database_members_lesson._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
   .row {
    margin-top: 50px;
}

.col-md-4 {
    text-align: center;
    margin-bottom: 30px;
}

.col-md-4 h2 {
    font-size: 1.8em;
    margin-bottom: 20px;
    font-family: 'Arial', sans-serif;
}

.col-md-4 img {
    max-width: 100%;
    height: auto;
    border-radius: 10px;
    margin-bottom: 20px;
}

.col-md-4 p {
    font-size: 1em;
    color: #666;
    font-family: 'Arial', sans-serif;
}

.btn-primary {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    text-transform: uppercase;
    font-weight: bold;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s;
}

.btn-primary:hover {
    background-color: #0056b3;
}

@media (max-width: 768px) {
    .col-md-4 {
        margin-bottom: 20px;
    }
}

.jumbotron {
    background-color: #f8f9fa;
    padding: 50px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.jumbotron h1 {
    font-size: 3em;
    font-family: 'Arial', sans-serif;
    color: #333;
}

.jumbotron .lead {
    font-size: 1.5em;
    margin: 20px 0;
    font-family: 'Arial', sans-serif;
    color: #555;
}

.jumbotron .btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    padding: 15px 30px;
    font-size: 1.2em;
    border-radius: 5px;
    text-transform: uppercase;
}

.jumbotron .btn-primary:hover {
    background-color: #0056b3;
    border-color: #004b93;
}

.jumbotron img {
    width: 50px;
    height: 50px;
    margin-top: 20px;
}


    </style>
    
    <div class="jumbotron text-center" style="background-color: #f8f9fa; padding: 50px; border-radius: 10px;">
    <h1>
        <asp:Label ID="Lblname" runat="server" Text="Welcome to ShoeHaven"></asp:Label>
    </h1>
    <p class="lead" style="font-size: 1.5em; margin: 20px 0;">
        Discover the perfect blend of style, comfort, and quality at ShoeHaven. We offer a wide range of trendy and affordable footwear for every occasion. Whether you're looking for casual sneakers, elegant heels, or sturdy boots, we've got you covered. Our collection is carefully curated to bring you the latest in fashion and timeless classics.
    </p>
    <p>
        <a href="Product_Catalog.aspx" class="btn btn-primary" style="background-color: #007bff; border-color: #007bff; padding: 10px 20px; font-size: 14px;">
        Our Products &raquo;
         </a>
    </p>

 
    </div>


      <div class="row">
        <div class="col-md-4">
            <h2>Latest Collection</h2>
            <img src="/Product_images/shoes/boots1.jpg" alt="Latest Collection" class="img-responsive img-thumbnail" />
   

            <p>
                Discover the latest trends in footwear with our newest collection of shoes. Perfect for any occasion.
            </p>
            <p>
                <a class="btn btn-primary" href="Product_Catalog.aspx">Shop Now &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Exclusive Deals</h2>
            <img src="/Product_images/shoes/sneakers3.jpg" alt="Exclusive Deals" class="img-responsive img-thumbnail" />
            <p>
                Get the best deals on our exclusive range of shoes. Hurry, limited time offers!
            </p>
            <p>
                <a class="btn btn-primary" href="Deals.aspx">View Deals &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Customer Favorites</h2>
            <img src="/Product_images/shoes/espadrilles3.jpg" alt="Customer Favorites" class="img-responsive img-thumbnail" />
            <p>
                Check out our customers' favorite picks. Tried and loved by many!
            </p>
            <p>
                <a class="btn btn-primary" href="Favorites.aspx">See Favorites &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
