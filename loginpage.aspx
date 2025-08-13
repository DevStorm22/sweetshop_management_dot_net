<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="loginpagestyle.css" type = "text/css" />
    <link rel = "stylesheet" href = "masterpagestyle.css" type = "text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Login Form Section -->
    <section class="login-section">
        <div class="login-container">
            <h2>Log In to Your Account</h2>

            <asp:Panel ID="pnlLoginForm" runat="server" CssClass="login-form">
                <div class="form-group">
                    <label for="email">Email</label>
                    <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Enter your email" required="true" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" />
                </div>
            
                <div class="form-group">
                    <label for="password">Password</label>
                    <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password" required="true" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password" ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" />
                </div>

                <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
            
                <div class="form-group">
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn submit-btn" OnClick="btnLogin_Click" />
                </div>
            
                <p>Don't have an account? <a href="signuppage.aspx" class="signup-link">Sign Up</a></p>
            </asp:Panel>
        </div>
    </section>
</asp:Content>
