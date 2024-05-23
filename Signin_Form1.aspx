<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signin_Form1.aspx.cs" Inherits="WebApplication2_database_members_lesson.Signin_form1aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        Sign In</p>
    <p>
        Email:
        <asp:TextBox ID="Txtemail" runat="server" ></asp:TextBox>
    </p>
    <p>
        password: <asp:TextBox ID="Txtpassword" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnsignin" runat="server" OnClick="btnsignin_Click" Text="Sign in" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </p>
</asp:Content>
