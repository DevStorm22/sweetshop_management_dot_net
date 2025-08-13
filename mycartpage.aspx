<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="mycartpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="mycartpagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-container">
        <h2>Your Cart</h2>
        <asp:Repeater ID="MyCartRepeater1" runat="server" OnItemCommand="MyCartRepeater_ItemCommand">
            <HeaderTemplate>
                <table border="1">
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                    <tr>
                        <td><img src='<%# Eval("image") %>' alt="Sweet Image" width="50" height="50"></td>
                        <td><%# Eval("name") %></td>
                        <td><%# Eval("quantity") %></td>
                        <td>₹<%# Eval("price", "{0:F2}") %></td>
                        <td>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn remove-btn"
                                CommandName="RemoveItem" CommandArgument='<%# Eval("cartID") %>' />
                        </td>
                    </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <div class="cart-footer">
            <h3 id="total-price">Total Price: <asp:Label ID="lblTotalAmount" runat="server"></asp:Label></h3>
            <asp:Button ID="btProceedToPayment" runat="server" Text="Proceed to Payment" CssClass="proceed-btn" OnClick="ProceedToPayment_Click" />
            <asp:Label ID="lbResultMessage" runat="server" Text="" CssClass="result-message"></asp:Label>
        </div>
    </div>
</asp:Content>
