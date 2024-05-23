<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manageprofile.aspx.cs" Inherits="WebApplication2_database_members_lesson.manageprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        Mange Your Profile</p>
    <p class="text-center">
        First Name:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fill-up the first name" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Last name:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Fill-up the last name" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    </p>
    <p class="text-center">
        Email:
        <asp:TextBox ID="Txt_email" runat="server"  TextMode="Email"></asp:TextBox>
&nbsp;
        </p>
    <p class="text-center">
        <asp:Button ID="Btnupdate" runat="server" OnClick="Btnsignup_Click" Text="Update" />
    </p>
    <p class="text-center">
        <asp:Label ID="Lblmessag" runat="server"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" SelectCommand="SELECT * FROM [Members]" DeleteCommand="DELETE FROM [Members] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Members] ([First_name], [Last_Name], [Email], [Password], [dtSignup]) VALUES (@First_name, @Last_Name, @Email, @Password, @dtSignup)" UpdateCommand="UPDATE [Members] SET [First_name] = @First_name, [Last_Name] = @Last_Name, [Email] = @Email, [Password] = @Password, [dtSignup] = @dtSignup WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="First_name" Type="String" />
                <asp:Parameter Name="Last_Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="dtSignup" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="First_name" Type="String" />
                <asp:Parameter Name="Last_Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="dtSignup" Type="DateTime" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
