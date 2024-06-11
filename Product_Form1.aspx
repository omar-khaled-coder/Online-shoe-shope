<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product_Form1.aspx.cs" Inherits="WebApplication2_database_members_lesson.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .product-form-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }
        .product-form-container p {
            margin-bottom: 10px;
        }
        .product-form-container label {
            display: block;
            margin-bottom: 5px;
            color: #343a40;
        }
        .product-form-container input[type="text"],
        .product-form-container input[type="number"],
        .product-form-container textarea,
        .product-form-container select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
        }
        .product-form-container .form-actions {
            text-align: center;
        }
        .product-form-container .btn {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }
        .product-form-container .btn-update {
            background-color: #ffc107;
        }
        .product-form-container .btn-delete {
            background-color: #dc3545;
        }
        .product-form-container .btn:hover {
            opacity: 0.8;
        }
        .product-form-container .gridview-container {
            margin-top: 20px;
            overflow-x: auto;
        }
        .product-form-container .gridview-container table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #dee2e6;
        }
        .product-form-container .gridview-container th,
        .product-form-container .gridview-container td {
            padding: 8px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid #dee2e6;
        }
        .product-form-container .gridview-container th {
            background-color: #343a40;
            color: white;
        }
    </style>

    <div class="product-form-container">
        <h2>Add Product</h2>
        <p style="font-size: large">
            <label for="ddicategory">Category:</label>
            <asp:DropDownList ID="ddicategory" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="cId">
                <asp:ListItem>Audio</asp:ListItem>
                <asp:ListItem>Computers</asp:ListItem>
                <asp:ListItem>Home Appliances</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblcid" runat="server" Text="Label"></asp:Label>
        </p>
        <p style="font-size: large">
            <label for="txtname">Product Name:</label>
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
        </p>
        <p style="font-size: large">
            <label for="txtprice">Product Price:</label>
            <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
        </p>
        <p style="font-size: large">
            <label for="txtdescription">Product Description:</label>
            <asp:TextBox ID="txtdescription" runat="server"></asp:TextBox>
        </p>
        <p style="font-size: large">
            <label for="FileUploadimage">Images:</label>
            <asp:FileUpload ID="FileUploadimage" runat="server" Height="50px" Width="386px" />
            <asp:Label ID="Lblfilename" runat="server" Text="Label"></asp:Label>
        </p>
        <div class="form-actions">
            <asp:Button ID="Btnadd" runat="server" OnClick="Btnadd_Click" Text="Add" CssClass="btn" />
            <asp:Button ID="Btnupdate" runat="server" Text="Update" OnClick="Btnupdate_Click" CssClass="btn btn-update" />
            <asp:Button ID="Btndelete" runat="server" Text="Delete" OnClick="Btndelete_Click" CssClass="btn btn-delete" />
        </div>
        <p style="font-size: large">
            <asp:Label ID="Lblmassege" runat="server" ForeColor="#000099" Text="Label"></asp:Label>
        </p>
        <p class="text-center" style="font-size: large">
            <asp:Label ID="lblpid" runat="server" Text="Label"></asp:Label>
        </p>
        <div class="gridview-container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cId,pId" DataSourceID="Sdproducts" ForeColor="#333333" GridLines="None" Height="222px" Width="908px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="cId" HeaderText="cId" InsertVisible="False" ReadOnly="True" SortExpression="cId" />
                    <asp:BoundField DataField="pId" HeaderText="pId" SortExpression="pId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="name" HeaderText="Category" SortExpression="name" />
                    <asp:BoundField DataField="name1" HeaderText="Product Name" SortExpression="name1" />
                    <asp:BoundField DataField="descriptopn" HeaderText="Product Description" SortExpression="descriptopn" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                    <asp:ImageField DataImageUrlField="image" HeaderText="Picture">
                        <ControlStyle Height="80px" Width="80px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="image" HeaderText="Image" SortExpression="image" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <p style="font-size: large">
            <asp:SqlDataSource ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
                SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Sdproducts" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
                DeleteCommand="DELETE FROM [Products] WHERE [pId] = @pId" 
                InsertCommand="INSERT INTO [Products] ([name], [descriptopn], [price], [image], [cid]) VALUES (@name, @descriptopn, @price, @image, @cid)" 
                SelectCommand="SELECT Category.*, Products.* FROM Category, Products WHERE Category.cid = Products.cid" 
                UpdateCommand="UPDATE [Products] SET [name] = @name, [descriptopn] = @descriptopn, [price] = @price, [image] = @image, [cid] = @cid WHERE [pId] = @pId">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="lblpid" Name="pId" PropertyName="Text" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtname" Name="name" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtdescription" Name="descriptopn" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtprice" Name="price" PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="Lblfilename" Name="image" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddicategory" Name="cid" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtname" Name="name" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtdescription" Name="descriptopn" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtprice" Name="price" PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="FileUploadimage" Name="image" PropertyName="FileBytes" Type="String" />
                    <asp:ControlParameter ControlID="ddicategory" Name="cid" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="lblpid" Name="pId" PropertyName="Text" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
