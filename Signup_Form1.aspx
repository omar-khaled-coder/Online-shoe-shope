<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup_Form1.aspx.cs" Inherits="WebApplication2_database_members_lesson.Signup_Form1" %>
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
    </style>
    <p class="text-center">
        <strong>
        <br style="font-size: large" />
        </strong><span style="font-size: x-large"><strong>Sign Up</strong></span></p>
   
    <form id="form1">
        <div class="form-container">
            <p class="text-center">
                <div class="form-group">
                    <label for="TextBox1">First Name:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fill-up the first name" ForeColor="Red" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="TextBox2">Last Name:</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Fill-up the last name" ForeColor="Red" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </p>

            <p class="text-center">
                <div class="form-group">
                    <label for="Txt_email">Email:</label>
                    <asp:TextBox ID="Txt_email" runat="server" OnTextChanged="text_email_TextChanged" TextMode="Email" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Txt_email" ErrorMessage="Fill-up the Email" ForeColor="Red" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_email" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>
            </p>

            <p class="text-center">
                <div class="form-group">
                    <label for="Txt_password">Password:</label>
                    <asp:TextBox ID="Txt_password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Txt_password" ErrorMessage="Add password" ForeColor="Red" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="Txtconfirmpassword">Confirm Password:</label>
                    <asp:TextBox ID="Txtconfirmpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Txt_password" ControlToValidate="Txtconfirmpassword" ErrorMessage="Password does not match" ForeColor="Red" CssClass="text-danger"></asp:CompareValidator>
                </div>
                <div class="form-group text-center"> 
                            <asp:Button ID="Btnsignup" runat="server" OnClick="Btnsignup_Click" Text="Sign up" CssClass="btn btn-primary" />

                </div>

            </p>

            <p class="text-center">
                <asp:Label ID="DTsignup" runat="server" CssClass="form-text text-muted"></asp:Label>
            </p>
        </div>
    </form>
       
    <p class="text-center">
    </p>
    <p class="text-center">
        <asp:Label ID="donemassege" runat="server"></asp:Label>
    </p>
    <p class="text-center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" DeleteCommand="DELETE FROM [Members] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Members] ([First_name], [Last_Name], [Email], [Password], [dtSignup]) VALUES (@First_name, @Last_Name, @Email, @Password, @dtSignup)" SelectCommand="SELECT * FROM [Members]" UpdateCommand="UPDATE [Members] SET [First_name] = @First_name, [Last_Name] = @Last_Name, [Email] = @Email, [Password] = @Password, [dtSignup] = @dtSignup WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="First_name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="Last_Name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Txt_email" Name="Email" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Txt_password" Name="Password" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="DTsignup" Name="dtSignup" PropertyName="Text" Type="DateTime" />
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
