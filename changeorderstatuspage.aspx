<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="changeorderstatuspage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="changeorderstatuspagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="order-status">
        <h1>Change Order Status</h1>
        <div class="order-status-form">
            <!-- ASP.NET Form for Changing Order Status -->
            <asp:Label ID="lblOrderId" runat="server" Text="Order ID"></asp:Label>
            <asp:TextBox ID="txtOrderId" runat="server" CssClass="order-id" Placeholder="Enter Order ID"></asp:TextBox>
            <asp:Label ID="lblOrderStatus" runat="server" Text="Order Status"></asp:Label>
            <asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="order-status-dropdown">
                <asp:ListItem Text="Processing" Value="processing"></asp:ListItem>
                <asp:ListItem Text="Shipped" Value="shipped"></asp:ListItem>
                <asp:ListItem Text="Delivered" Value="delivered"></asp:ListItem>
                <asp:ListItem Text="Canceled" Value="canceled"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnUpdateStatus" runat="server" Text="Update Status" CssClass="btn" OnClick="UpdateStatus_Click" />
            <asp:Label ID="lblResultMessage" runat="server" Text=""></asp:Label>
        </div>
    </section>
</asp:Content>
