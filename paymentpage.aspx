<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="paymentpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="paymentpagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="payment-section">
        <h1>Complete Your Payment</h1>
        <div class="payment-form">
            <asp:Label ID="lblPaymentMethod" runat="server" Text="Select Payment Method:"></asp:Label>
            <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="payment-method-dropdown">
                <asp:ListItem Text="Credit Card" Value="credit_card"></asp:ListItem>
                <asp:ListItem Text="Debit Card" Value="debit_card"></asp:ListItem>
                <asp:ListItem Text="UPI" Value="upi"></asp:ListItem>
                <asp:ListItem Text="Cash on Delivery" Value="cod"></asp:ListItem>
            </asp:DropDownList>
            <asp:Repeater ID="CartRepeater" runat="server" DataSourceID="SqlDataSource2">
                <HeaderTemplate>
                    <table border="1">
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr>
                            <td><img src='<%# Eval("image") %>' alt="Sweet Image" width="50" height="50"></td>
                            <td><%# Eval("name") %></td>
                            <td><%# Eval("quantity") %></td>
                            <td>₹<%# Eval("price", "{0:F2}") %></td>
                        </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Cart] WHERE [cartID] = @original_cartID AND [sweetID] = @original_sweetID AND [customerID] = @original_customerID AND [quantity] = @original_quantity AND [price] = @original_price AND [image] = @original_image AND [name] = @original_name" InsertCommand="INSERT INTO [Cart] ([sweetID], [customerID], [quantity], [price], [image], [name]) VALUES (@sweetID, @customerID, @quantity, @price, @image, @name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Cart]" UpdateCommand="UPDATE [Cart] SET [sweetID] = @sweetID, [customerID] = @customerID, [quantity] = @quantity, [price] = @price, [image] = @image, [name] = @name WHERE [cartID] = @original_cartID AND [sweetID] = @original_sweetID AND [customerID] = @original_customerID AND [quantity] = @original_quantity AND [price] = @original_price AND [image] = @original_image AND [name] = @original_name">
                <DeleteParameters>
                    <asp:Parameter Name="original_cartID" Type="Int32" />
                    <asp:Parameter Name="original_sweetID" Type="Int32" />
                    <asp:Parameter Name="original_customerID" Type="Int32" />
                    <asp:Parameter Name="original_quantity" Type="Int32" />
                    <asp:Parameter Name="original_price" Type="Double" />
                    <asp:Parameter Name="original_image" Type="String" />
                    <asp:Parameter Name="original_name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="sweetID" Type="Int32" />
                    <asp:Parameter Name="customerID" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="price" Type="Double" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="sweetID" Type="Int32" />
                    <asp:Parameter Name="customerID" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="price" Type="Double" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="original_cartID" Type="Int32" />
                    <asp:Parameter Name="original_sweetID" Type="Int32" />
                    <asp:Parameter Name="original_customerID" Type="Int32" />
                    <asp:Parameter Name="original_quantity" Type="Int32" />
                    <asp:Parameter Name="original_price" Type="Double" />
                    <asp:Parameter Name="original_image" Type="String" />
                    <asp:Parameter Name="original_name" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblAddress" runat="server" Text="Enter Shipping Address:"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="address-details" Placeholder="Enter your address"></asp:TextBox>

            <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount:"></asp:Label>
            <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="total-amount" ReadOnly></asp:TextBox>

            <asp:Button ID="btnMakePayment" runat="server" Text="Make Payment" CssClass="btn" OnClick="MakePayment_Click" />
            <asp:Label ID="lblResultMessage" runat="server" Text="" CssClass="result-message"></asp:Label>
        </div>
    </section>
</asp:Content>
