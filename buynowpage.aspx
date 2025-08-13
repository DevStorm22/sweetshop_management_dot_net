<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="buynowpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="buynowpagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="order-section">
        <div class="order-box">
            <h2>Order Product</h2>
            <p>Fill in your details to place an order.</p>
            <div class="form-group">
                <label for="product-name">Product Name</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Text="Sample Product" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="customer-name">Your Name</label>
                <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control" placeholder="Enter your name" Required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email" Required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="address">Shipping Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter your address" Required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" TextMode="Number" Text="1" Required="true" MinLength="1"></asp:TextBox>
            </div>
            <asp:Button ID="btnPlaceOrder" runat="server" CssClass="btn order-btn" Text="Place Order" OnClick="btnPlaceOrder_Click" />
        </div>
    </section>
</asp:Content>
