<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signin_Form1.aspx.cs" Inherits="WebApplication2_database_members_lesson.Signin_form1aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <style>
        .form-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container p {
            margin-bottom: 15px;
        }
        .form-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }
    </style>
    <div class="form-container">
            <div class="form-title">
                Sign In
            </div>
            <div class="form-group">
                <label for="Txtemail">Email:</label>
                <asp:TextBox ID="Txtemail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Txtpassword">Password:</label>
                <asp:TextBox ID="Txtpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group text-center">
                <asp:Button ID="btnsignin" runat="server" OnClick="btnsignin_Click" Text="Sign in" CssClass="btn btn-primary" />
            </div>
        </div>
</asp:Content>
