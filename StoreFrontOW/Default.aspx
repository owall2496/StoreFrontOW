<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StoreFrontOW._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Image ID="Image1" ImageUrl="Images/banner_lg.png" Width="100%" runat="server" ImageAlign="Middle" AlternateText="StoreFront; A Computer Aid, Inc. Technology." />
        <p class="lead" style="text-align:center;">A Computer Aid, Inc.® Technology.</p>
    </div>

    <div class="row" style="background-color:rgba(255, 255, 255, 0.6); border-radius:6px; margin:0px;">
        <div class="col-md-6" style="padding:20px">
            <h2>Customer Portal</h2>
            <p>
                <asp:Label ID="CustomerPortalLabel" runat="server" Text="Looking to make a purchase or simply just browse?"></asp:Label>
            </p>
            <p>
                <a class="btn btn-default" href="Customer/CustomersAdmin.aspx">Enter Customer Portal &raquo;</a>
            </p>
        </div>

        <div class="col-md-6" style="padding:20px">
            <h2>Admin Portal</h2>
            <p>
                Administrator access can be found here.
            </p>
            <p>
                <a class="btn btn-default" href="Admin/CustomersAdmin.aspx">Enter Users Admin Portal &raquo;</a>
            </p>
            <p>
                <a class="btn btn-default" href="Admin/ProductsAdmin.aspx">Enter Products Admin Portal &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
