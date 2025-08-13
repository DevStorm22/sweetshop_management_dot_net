<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="adminpanelpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="adminpanelpagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Login Popup -->
    <asp:Panel ID="adminLoginModal" runat="server" CssClass="modal">
        <div class="modal-content">
            <h2>Admin Login</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
            <div class="form-group">
                <asp:Label ID="lblAdminID" runat="server" Text="Admin ID:" CssClass="label"></asp:Label>
                <asp:TextBox ID="txtAdminID" runat="server" CssClass="input-field"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="label"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
            </div>
            <div class="form-group form-group-btn">
                <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" CssClass="btn login-btn" />
            </div>
        </div>
    </asp:Panel>
    <!-- Admin Dashboard -->
    <asp:Panel ID="adminContent" runat="server" CssClass="admin-dashboard" Visible="false">
        <h1>Admin Dashboard</h1>
        <div class="dashboard-grid">
            <!-- Update Price & Items Section -->
            <div class="dashboard-item">
                <h2>Update Products</h2>
                <p>Update prices, add or remove products, and change details.</p>
                <asp:HyperLink ID="hlUpdateItems" runat="server" NavigateUrl="updateitempage.aspx" CssClass="btn">Update Items</asp:HyperLink>
            </div>
            <!-- Change Order Status Section -->
            <div class="dashboard-item">
                <h2>Change Order Status</h2>
                <p>Modify the status of orders. Changes reflect on customer pages.</p>
                <asp:HyperLink ID="hlChangeOrderStatus" runat="server" NavigateUrl="changeorderstatuspage.aspx" CssClass="btn">Order Status</asp:HyperLink>
            </div>
            <!-- New User Creation Section -->
            <div class="dashboard-item">
                <h2>Create New User</h2>
                <p>Create new user as a new admin with all authorities.</p>
                <asp:HyperLink ID="hlCreateNewUser" runat="server" NavigateUrl="signupadminpage.aspx" CssClass="btn">New User</asp:HyperLink>
            </div>
        </div>
    </asp:panel>
</asp:Content>
