<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product_Form1.aspx.cs" Inherits="WebApplication2_database_members_lesson.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p>
        Add Product</p>
    <p style="font-size: large">
        Category:
        <asp:DropDownList ID="ddicategory" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="cId">
            <asp:ListItem>Audio</asp:ListItem>
            <asp:ListItem>Computers</asp:ListItem>
            <asp:ListItem>home Applinces</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
    &nbsp;<asp:Label ID="lblcid" runat="server" Text="Label"></asp:Label>
    </p>
    <p style="font-size: large">
        Brand: </p>
    <p style="font-size: large">
        Product Name:
        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
    </p>
    <p style="font-size: large">
        Product Price: <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
&nbsp;</p>
    <p style="font-size: large">
        Proudct description:<asp:TextBox ID="txtdescription" runat="server"></asp:TextBox>
    </p>
    <p style="font-size: large">
        Images:
        <asp:FileUpload ID="FileUploadimage" runat="server" Height="50px" Width="386px" />
        <asp:Label ID="Lblfilename" runat="server" Text="Label"></asp:Label>
&nbsp;</p>
    <h3 class="text-center"><strong>Quantity: </strong></h3>
    <p class="text-center">Sizes: </p>
    <p class="text-center" style="font-size: large">
        Ships From:
    </p>
    <p class="text-center" style="font-size: large">
        <asp:Label ID="Lblmassege" runat="server" ForeColor="#000099" Text="Label"></asp:Label>
    </p>
    <p class="text-center" style="font-size: large">
        <asp:Button ID="Btnadd" runat="server" OnClick="Btnadd_Click" Text="Add" />
&nbsp;<asp:Button ID="Btnupdate" runat="server" Text="Update" OnClick="Btnupdate_Click" />
&nbsp;<asp:Button ID="Btndelete" runat="server" Text="Delete" OnClick="Btndelete_Click" />
    </p>
    <p class="text-center" style="font-size: large">
        <asp:Label ID="lblpid" runat="server" Text="Label"></asp:Label>
    </p>
    <p class="text-center" style="font-size: large">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cId,pId" DataSourceID="Sdproducts" ForeColor="#333333" GridLines="None" Height="222px" Width="908px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="cId" HeaderText="cId" InsertVisible="False" ReadOnly="True" SortExpression="cId" />
                <asp:BoundField DataField="pId" HeaderText="pId" SortExpression="pId" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="name" HeaderText="Category" SortExpression="name" />
                <asp:BoundField DataField="name1" HeaderText="Product_name" SortExpression="name1" />
                <asp:BoundField DataField="descriptopn" HeaderText="Product descriptopn" SortExpression="descriptopn" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:ImageField DataImageUrlField="image" HeaderText="Picture">
                    <ControlStyle Height="80px" Width="80px" />
                </asp:ImageField>
                <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
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
    </p>
    <p style="font-size: large">
        <asp:SqlDataSource ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
            SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Sdproducts" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" 
            DeleteCommand="DELETE FROM [Products] WHERE [pId] = @pId" 
            InsertCommand="INSERT INTO [Products] ([name], [descriptopn], [price], [image], [cid]) VALUES (@name, @descriptopn, @price, @image, @cid)" 
            SelectCommand="SELECT Category.*, Products. * FROM Category, Products WHERE Category.cid = Products.cid" 
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
</asp:Content>
