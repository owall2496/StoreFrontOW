<%@ Page Title="Products - Settings" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductsAdmin.aspx.cs" Inherits="StoreFrontOW.Admin.ProductsAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:rgba(255, 255, 255, 0.6); border-radius:6px; margin-top:10px; padding:20px;">

    <h2>View All Products</h2>
    <asp:GridView ID="AllProducts_GridView" runat="server" OnRowEditing="SwitchToProductDetails" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" GridLines="Vertical" PageSize="50">
        <AlternatingRowStyle BackColor="Gainsboro" />
        <Columns>
            <asp:CommandField ButtonType="Button" CancelText="" DeleteText="" InsertText="" NewText="" SelectText="" ShowCancelButton="False" ShowEditButton="True" UpdateText="" />
            <asp:BoundField DataField="ProductID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CheckBoxField DataField="IsPublished" HeaderText="Published" SortExpression="IsPublished" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:F0}" />
            <asp:BoundField DataField="ImageFile" HeaderText="Image" SortExpression="ImageFile" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:storefrontConnectionString %>" SelectCommand="spGetProducts" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="false" Name="PublishedOnly" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

    <hr />
    <h2>Add New Product</h2>

    <asp:DetailsView ID="DetailsView1" runat="server" DefaultMode="Insert" OnItemInserted="RefresherMethod" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ProductID" DataSourceID="SqlDataSource2" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="ProductID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CheckBoxField DataField="IsPublished" HeaderText="Published" SortExpression="IsPublished" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" InsertVisible="False" SortExpression="Quantity" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="ImageFile" HeaderText="Image" InsertVisible="False" SortExpression="ImageFile" />
            <asp:CommandField ButtonType="Button" DeleteText="" EditText="" InsertText="Add New Item" NewText="" SelectText="" ShowCancelButton="False" ShowInsertButton="True" UpdateText="" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:storefrontConnectionString %>" InsertCommand="spAddProduct" InsertCommandType="StoredProcedure" SelectCommand="spGetProduct" SelectCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="IsPublished" Type="Boolean" />
            <asp:Parameter Name="Price" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="AllProducts_GridView" DefaultValue="0" Name="ProductID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

        </div>

</asp:Content>
