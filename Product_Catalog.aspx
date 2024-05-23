<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product_Catalog.aspx.cs" Inherits="WebApplication2_database_members_lesson.Product_Catalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        Products</p>
    <p>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="pId" DataSourceID="SqlDataSource1" Height="546px" RepeatColumns="4" RepeatDirection="Horizontal" Width="1453px" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl ='<%# Eval("image") %>' Height="200" Width="200"
                    />
                pId:
                <asp:Label ID="pIdLabel" runat="server" Text='<%# Eval("pId") %>' />
                <br />
                name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                <br />
                <asp:Button ID="btndetails" CommandName="details" runat="server" Text="Details" />
                
<br />
            </ItemTemplate>
        </asp:DataList>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="pId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="877px">
            <Columns>
                <asp:BoundField DataField="pId" HeaderText="pId" ReadOnly="True" SortExpression="pId" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="descriptopn" HeaderText="descriptopn" SortExpression="descriptopn" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" >
                <ControlStyle Height="80px" Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="cid" HeaderText="cid" SortExpression="cid" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Miaconstr %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
    </p>
</asp:Content>
