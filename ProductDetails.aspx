<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WebApplication2_database_members_lesson.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .column{
            float:left;
            width:50%;
            padding:20px;
            height:470px;
        }
        .row:after{
            content:"";
            display:table;
            clear:both;
        }
    </style>

    <div class="row">

        <div class="column" style="background-color:burlywood">
            
                <asp:Image ID="imgproduct" runat="server" Height="398px" Width="381px" />
            
        </div>

        <div class="column" style="background-color:cadetblue">
             

             <h2>
                 Product Name:
                <asp:Label ID="Lblname" runat="server" Text="Label"></asp:Label>
            &nbsp;<asp:Label ID="lblpid" runat="server" Text="Label"></asp:Label>
            </h2>
    
            <h2>
              Price: 
                <asp:Label ID="lblprice" runat="server" Text="Label"></asp:Label>
             </h2>

            <h2>
              Quantity :<asp:TextBox ID="txtquntity" runat="server" TextMode="Number">1</asp:TextBox>
            </h2>
             <p>
                 Product description:
                 <asp:Label ID="lbldescription" runat="server" Text="Label"></asp:Label>
            </p>

             <h2>
                 <asp:Button ID="Btnaddtocart" runat="server" Text="Add to Cart" OnClick="Btnaddtocart_Click" />
            </h2>
             <p>
                 <asp:Label ID="lblmassage" runat="server" Text="Label"></asp:Label>
            </p>

            <h2></h2>

        </div>

    </div>

   
   
</asp:Content>
