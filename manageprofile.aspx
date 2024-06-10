<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manageprofile.aspx.cs" Inherits="WebApplication2_database_members_lesson.manageprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .profile-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .profile-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .text-danger {
            color: #dc3545;
        }
    </style>

    <div class="profile-container">
        <h2>Manage Your Profile</h2>
        <asp:Panel ID="Panel1" runat="server" CssClass="form-horizontal">
            <div class="form-group">
                <label for="TextBox1" class="control-label col-md-3">First Name:</label>
                <div class="col-md-9">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fill-up the first name" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label for="TextBox2" class="control-label col-md-3">Last Name:</label>
                <div class="col-md-9">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Fill-up the last name" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label for="Txt_email" class="control-label col-md-3">Email:</label>
                <div class="col-md-9">
                    <asp:TextBox ID="Txt_email" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group text-center">
                <asp:Button ID="Btnupdate" runat="server" OnClick="Btnsignup_Click" Text="Update" CssClass="btn btn-primary" />
            </div>
            <div class="form-group text-center">
                <asp:Label ID="Lblmessag" runat="server"></asp:Label>
            </div>
        </asp:Panel>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
        SelectCommand="SELECT * FROM [Members]" 
        DeleteCommand="DELETE FROM [Members] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Members] ([First_name], [Last_Name], [Email], [Password], [dtSignup]) VALUES (@First_name, @Last_Name, @Email, @Password, @dtSignup)" 
        UpdateCommand="UPDATE [Members] SET [First_name] = @First_name, [Last_Name] = @Last_Name, [Email] = @Email, [Password] = @Password, [dtSignup] = @dtSignup WHERE [Id] = @Id">
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
</asp:Content>
