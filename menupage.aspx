<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="menupage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="menupagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu-container">
        <asp:Repeater ID="MenuRepeater" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="menu-item">
                    <img class="menu-image" src='<%# DataBinder.Eval(Container.DataItem, "sweetImage") %>' 
                         alt='<%# DataBinder.Eval(Container.DataItem, "name") %>' />
                    <h3><%# DataBinder.Eval(Container.DataItem, "name") %></h3>
                    <p class="description"><%# DataBinder.Eval(Container.DataItem, "description") %></p>
                    <span class="price">₹<%# DataBinder.Eval(Container.DataItem, "price") %></span>
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "sweetID") %>'  OnClick="AddToCart_Click" CssClass="add-to-cart-btn" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Sweet] WHERE [sweetID] = @original_sweetID AND [sweetImage] = @original_sweetImage AND [name] = @original_name AND [description] = @original_description AND [price] = @original_price AND [quantity] = @original_quantity AND [status] = @original_status" InsertCommand="INSERT INTO [Sweet] ([sweetImage], [name], [description], [price], [quantity], [status]) VALUES (@sweetImage, @name, @description, @price, @quantity, @status)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Sweet]" UpdateCommand="UPDATE [Sweet] SET [sweetImage] = @sweetImage, [name] = @name, [description] = @description, [price] = @price, [quantity] = @quantity, [status] = @status WHERE [sweetID] = @original_sweetID AND [sweetImage] = @original_sweetImage AND [name] = @original_name AND [description] = @original_description AND [price] = @original_price AND [quantity] = @original_quantity AND [status] = @original_status">
            <DeleteParameters>
                <asp:Parameter Name="original_sweetID" Type="Int32" />
                <asp:Parameter Name="original_sweetImage" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_description" Type="String" />
                <asp:Parameter Name="original_price" Type="Double" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
                <asp:Parameter Name="original_status" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="sweetImage" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="status" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="sweetImage" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="original_sweetID" Type="Int32" />
                <asp:Parameter Name="original_sweetImage" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_description" Type="String" />
                <asp:Parameter Name="original_price" Type="Double" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
                <asp:Parameter Name="original_status" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>