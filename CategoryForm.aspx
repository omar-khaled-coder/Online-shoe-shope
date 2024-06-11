<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryForm.aspx.cs" Inherits="WebApplication2_database_members_lesson.CategoryForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .category-form-container {
            max-width: 600px; /* Adjusted width for better layout */
            margin: 20px auto; /* Centering the container */
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .category-form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }
        .category-form-container p {
            margin-bottom: 10px;
        }
        .category-form-container label {
            display: block;
            margin-bottom: 5px;
            color: #343a40;
        }
        .category-form-container input[type="text"],
        .category-form-container textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
        }
        .category-form-container .form-actions {
            text-align: center;
        }
        .category-form-container .btn {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }
        .category-form-container .btn-update {
            background-color: #ffc107;
        }
        .category-form-container .btn-delete {
            background-color: #dc3545;
        }
        .category-form-container .btn:hover {
            opacity: 0.8;
        }
        .category-form-container .gridview-container {
            margin-top: 20px;
            overflow-x: auto; /* Allow horizontal scrolling if needed */
        }
        .category-form-container .gridview-container table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #dee2e6;
        }
        .category-form-container .gridview-container th,
        .category-form-container .gridview-container td {
            padding: 8px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid #dee2e6;
        }
        .category-form-container .gridview-container th {
            background-color: #343a40;
            color: white;
        }
    </style>

    <div class="category-form-container">
        <h2>Create Category</h2>
        <p>
            <label for="Txtname">Name:</label>
            <asp:TextBox ID="Txtname" runat="server"></asp:TextBox>
        </p>
        <p>
            <label for="Txtdescription">Description:</label>
            <asp:TextBox ID="Txtdescription" runat="server"></asp:TextBox>
        </p>
        <div class="form-actions">
            <asp:Button ID="Btnadd" runat="server" OnClick="Btnadd_Click" Text="Add" CssClass="btn" />
            <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click" CssClass="btn btn-update" />
            <asp:Button ID="Btndelete" runat="server" Text="Delete" OnClick="Btndelete_Click" CssClass="btn btn-delete" />
        </div>
        <p>
            <asp:Label ID="Lblcid" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Lblmassege" runat="server" ForeColor="#0000CC" Text="Label"></asp:Label>
        </p>
        <div class="gridview-container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="cId" HeaderText="cId" InsertVisible="False" ReadOnly="True" SortExpression="cId" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
        DeleteCommand="DELETE FROM [Category] WHERE [cId] = @cId" 
        InsertCommand="INSERT INTO [Category] ([name], [description]) VALUES (@name, @description)" 
        SelectCommand="SELECT * FROM [Category]" 
        UpdateCommand="UPDATE [Category] SET [name] = @name, [description] = @description WHERE [cId] = @cId">
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
</asp:Content>
