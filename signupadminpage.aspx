<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="signupadminpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="signupadminpagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-wrapper">
        <div class="new-user-section">
            <h2>Create New User</h2>
            <asp:Panel ID="NewUserFormPanel" runat="server">
                <div class="form-group">
                    <label for="NewUserName">Name</label>
                    <asp:TextBox ID="NewUserName" runat="server" CssClass="input-field" Placeholder="Enter user name" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="NewUserEmail">Email</label>
                    <asp:TextBox ID="NewUserEmail" runat="server" CssClass="input-field" Placeholder="Enter user email" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="NewUserPassword">Password</label>
                    <asp:TextBox ID="NewUserPassword" runat="server" CssClass="input-field" TextMode="Password" Placeholder="Enter user password" required="true"></asp:TextBox>
                </div>
                <asp:Button ID="CreateUserButton" runat="server" CssClass="btn" Text="Create User" OnClick="CreateUserButton_Click" />
                <asp:Label ID="UserCreationMessage" runat="server" CssClass="message-label"></asp:Label>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
