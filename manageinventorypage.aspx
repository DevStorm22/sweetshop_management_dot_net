<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="manageinventorypage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="manageinventorypagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="manage-inventory">
        <h1>Manage Inventory</h1>
        <asp:GridView ID="InventoryTable" runat="server" AutoGenerateColumns="False" CssClass="inventory-table" OnSelectedIndexChanged="InventoryTable_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn edit-btn" CommandArgument='<%# Eval("ProductID") %>' OnClick="EditItem_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </section>
    <!-- Edit Product Modal -->
    <asp:Panel ID="EditModal" runat="server" CssClass="modal" Visible="True">
        <div class="modal-content">
            <asp:LinkButton ID="CloseModal" runat="server" CssClass="close" OnClick="CloseModal_Click">&times;</asp:LinkButton>
            <h2>Edit Product</h2>
            <asp:FormView ID="EditForm" runat="server">
                <ItemTemplate>
                    <label for="edit-product-id">Product ID</label>
                    <asp:TextBox ID="EditProductID" runat="server" CssClass="form-control" ReadOnly="true" Text='<%# Bind("ProductID") %>' />
                    <label for="edit-product-name">Product Name</label>
                    <asp:TextBox ID="EditProductName" runat="server" CssClass="form-control" Text='<%# Bind("ProductName") %>' />
                    <label for="edit-product-price">Product Price</label>
                    <asp:TextBox ID="EditProductPrice" runat="server" CssClass="form-control" Text='<%# Bind("Price") %>' TextMode="Number" />
                    <label for="edit-product-quantity">Quantity</label>
                    <asp:TextBox ID="EditProductQuantity" runat="server" CssClass="form-control" Text='<%# Bind("Quantity") %>' TextMode="Number" />
                    <label for="edit-product-status">Status</label>
                    <asp:DropDownList ID="EditProductStatus" runat="server" CssClass="form-control" SelectedValue='<%# Bind("Status") %>'>
                        <asp:ListItem Value="Available">Available</asp:ListItem>
                        <asp:ListItem Value="Out of Stock">Out of Stock</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="btn" OnClick="SaveChanges_Click" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </asp:Panel>
</asp:Content>
