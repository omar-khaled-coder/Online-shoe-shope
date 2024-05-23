<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup_Form1.aspx.cs" Inherits="WebApplication2_database_members_lesson.Signup_Form1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>

    </style>
    <p class="text-center">
        <strong>
        <br style="font-size: large" />
        </strong><span style="font-size: x-large"><strong>Sign Up</strong></span></p>
   
    <div >
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
        <asp:TextBox ID="Txt_email" runat="server" OnTextChanged="text_email_TextChanged" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Txt_email" ErrorMessage="Fill_up the Email" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_email" ErrorMessage=", invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </p>
    <p class="text-center">
        password:
        <asp:TextBox ID="Txt_password" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Txt_password" ErrorMessage="Add password" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;Confirm password:
        <asp:TextBox ID="Txtconfirmpassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Txt_password" ControlToValidate="Txtconfirmpassword" ErrorMessage="password does not match" ForeColor="#FF3300"></asp:CompareValidator>
    </p>
    <p class="text-center">
        <asp:Label ID="DTsignup" runat="server"></asp:Label>
    </p>
</div>
       
    <p class="text-center">
        <asp:Button ID="Btnsignup" runat="server" OnClick="Btnsignup_Click" Text="Sign up" />
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
