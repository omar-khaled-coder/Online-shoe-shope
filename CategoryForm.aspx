<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryForm.aspx.cs" Inherits="WebApplication2_database_members_lesson.CategoryForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        Create Category</p>
    <p>
        Name:
        <asp:TextBox ID="Txtname" runat="server"></asp:TextBox>
    </p>
    <p>
        Description:
        <asp:TextBox ID="Txtdescription" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Btnadd" runat="server" OnClick="Btnadd_Click" Text="Add" />
    &nbsp;
        <asp:Button ID="BtnUpdate" runat="server"  Text="Update" OnClick="BtnUpdate_Click"  />
    &nbsp;
        <asp:Button ID="Btndelete" runat="server"  Text="Delete" OnClick="Btndelete_Click"  />
    &nbsp;</p>
    <p>
        <asp:Label ID="Lblcid" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Lblmassege" runat="server" ForeColor="#0000CC" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" DeleteCommand="DELETE FROM [Category] WHERE [cId] = @cId" InsertCommand="INSERT INTO [Category] ([name], [description]) VALUES (@name, @description)" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [name] = @name, [description] = @description WHERE [cId] = @cId">
            <DeleteParameters>
                <asp:ControlParameter ControlID="Lblcid" Name="cId" PropertyName="Text" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="Txtname" Name="name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Txtdescription" Name="description" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="Txtname" Name="name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Txtdescription" Name="description" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Lblcid" Name="cId" PropertyName="Text" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="cId" HeaderText="cId" InsertVisible="False" ReadOnly="True" SortExpression="cId" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>
