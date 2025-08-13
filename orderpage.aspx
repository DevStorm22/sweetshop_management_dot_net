<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="orderpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="masterpagestyle.css" rel="stylesheet" />
    <link href="orderpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Order Tracking Section -->
    <section class="order-tracking-section">
        <h2>Order Tracking</h2>
        <div class="tracking-info">
            <p>Order ID: <strong>#<asp:Label ID="lblOrderID" runat="server" Text="12345"></asp:Label></strong></p>
            <div class="tracking-status">
                <asp:Panel ID="pnlOrderPlaced" CssClass="status-item completed" runat="server">Order Placed</asp:Panel>
                <asp:Panel ID="pnlProcessing" CssClass="status-item completed" runat="server">Processing</asp:Panel>
                <asp:Panel ID="pnlShipped" CssClass="status-item active" runat="server">Shipped</asp:Panel>
                <asp:Panel ID="pnlOutForDelivery" CssClass="status-item" runat="server">Out for Delivery</asp:Panel>
                <asp:Panel ID="pnlDelivered" CssClass="status-item" runat="server">Delivered</asp:Panel>
            </div>
        </div>
    </section>
</asp:Content>
