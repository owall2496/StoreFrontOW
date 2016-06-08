<%@ Page Title="Customers - Settings" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CustomersAdmin.aspx.cs" Inherits="StoreFrontOW.CustomersAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:rgba(255, 255, 255, 0.6); border-radius:6px; margin-top:10px; padding:20px;">

    <h2>View All Users</h2>
    <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="False" OnRowEditing="SwitchToUserDetails" DataKeyNames="UserID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AllowPaging="True" AllowSorting="True" PageSize="50">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:CommandField ButtonType="Button" InsertVisible="False" ShowCancelButton="False" ShowEditButton="True" EditText="Edit Info" ShowSelectButton="False"/>
            <asp:BoundField DataField="UserID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
            <asp:BoundField DataField="EmailAddress" HeaderText="Email" SortExpression="EmailAddress" />
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

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:storefrontConnectionString %>" DeleteCommand="DELETE FROM [tblUser] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [tblUser] ([UserName], [EmailAddress]) VALUES (@UserName, @EmailAddress)" SelectCommand="spGetUsers" UpdateCommand="UPDATE [tblUser] SET [UserName] = @UserName, [EmailAddress] = @EmailAddress WHERE [UserID] = @UserID" SelectCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:Parameter Name="UserID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="EmailAddress" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="EmailAddress" Type="String" />
        <asp:Parameter Name="UserID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

    <hr />
    <br />
    <h2>Add New User</h2>
    
    <asp:DetailsView ID="DetailsView1" runat="server" DefaultMode="Insert" OnItemInserted="RefresherMethod" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Vertical">
        <AlternatingRowStyle BackColor="Gainsboro" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
            <asp:BoundField DataField="EmailAddress" HeaderText="Email" SortExpression="EmailAddress" />
            <asp:CommandField ButtonType="Button" InsertText="Add User" ShowCancelButton="False" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:storefrontConnectionString %>" InsertCommand="spAddUser" InsertCommandType="StoredProcedure" SelectCommand="SELECT UserName, EmailAddress FROM [tblUser] WHERE UserID = 0">
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>
