<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="checkpaymentpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="checkpaymentpagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="check-payment">
        <h1>Check Payment Status</h1>
        <div class="search-container">
            <asp:TextBox ID="txtOrderId" runat="server" CssClass="order-id" Placeholder="Enter Order ID"></asp:TextBox>
            <asp:Button ID="btnCheckPayment" runat="server" Text="Check Payment" CssClass="btn" OnClick="CheckPaymentStatus" />
        </div>
        <div class="payment-status">
            <asp:Label ID="lblPaymentStatus" runat="server" CssClass="payment-status" Text=""></asp:Label>
        </div>
    </section>
</asp:Content>
