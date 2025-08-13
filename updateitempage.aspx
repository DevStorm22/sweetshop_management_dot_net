<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="updateitempage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="updateitempagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="update-items">
        <h1>Manage Items</h1>
        <div class="button-group">
            <!-- Buttons for different actions -->
            <asp:Button ID="btnAddNewItem" runat="server" Text="Add New Item" CssClass="btn btn-action" OnClick="ShowAddPanel" />
            <asp:Button ID="btnEditItem" runat="server" Text="Edit Item" CssClass="btn btn-action" OnClick="ShowEditPanel" />
            <asp:Button ID="btnRemoveItem" runat="server" Text="Remove Item" CssClass="btn btn-action" OnClick="ShowRemovePanel" />
            <asp:Button ID="btnViewItems" runat="server" Text="View Items" CssClass="btn btn-action" OnClick="ShowViewPanel" />
            <br />
            <br />
            <br />
        </div>

        <!-- Panel for Adding New Item -->
        <asp:Panel ID="addNewItemPanel" runat="server" Visible="false">
            <h2>Add New Product</h2>
            <div class="form-group">
                <asp:Label ID="lblNewProductName" runat="server" AssociatedControlID="txtNewProductName" Text="Product Name"></asp:Label>
                <asp:TextBox ID="txtNewProductName" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblNewProductDescription" runat="server" AssociatedControlID="txtNewProductDescription" Text="Product Description"></asp:Label>
                <asp:TextBox ID="txtNewProductDescription" runat="server" CssClass="form-control" placeholder="Enter Description" TextMode="MultiLine" Height="153px" Width="537px"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblNewProductPrice" runat="server" AssociatedControlID="txtNewProductPrice" Text="Product Price"></asp:Label>
                <asp:TextBox ID="txtNewProductPrice" runat="server" CssClass="form-control" placeholder="Enter Product Price"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblNewProductQuantity" runat="server" AssociatedControlID="txtNewProductQuantity" Text="Product Quantity"></asp:Label>
                <asp:TextBox ID="txtNewProductQuantity" runat="server" CssClass="form-control" placeholder="Enter Product Quantity"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblNewProductStatus" runat="server" AssociatedControlID="txtNewProductPrice" Text="Product Status"></asp:Label>
                <asp:DropDownList ID="ddlNewProductStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Available" Value="available"></asp:ListItem>
                    <asp:ListItem Text="Out of Stock" Value="out_of_stock"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="lblNewProductImage" runat="server" AssociatedControlID="fuNewUploadImage" Text="Product Image"></asp:Label>
                <asp:FileUpload ID="fuNewUploadImage" runat="server" CssClass="file-upload-control" />
                <br />
                <br />
            </div>
            <div class="form-group">
                <asp:Button ID="btnSaveNewProduct" runat="server" Text="Save New Product" CssClass="btn" OnClick="btnSaveNewProduct_Click" />
                <br />
                <asp:Label ID="lblNewProductResultMessage" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>

        <!-- Panel for Editing Item -->
        <asp:Panel ID="editItemPanel" runat="server" Visible="false">
            <h2>Edit Product Details</h2>
            <div class="form-group">
                <asp:Label ID="lblEditProductId" runat="server" AssociatedControlID="txtEditProductId" Text="Product ID"></asp:Label>
                <asp:TextBox ID="txtEditProductId" runat="server" CssClass="form-control" placeholder="Enter Product ID" OnTextChanged="txtEditProductId_TextChanged"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEditProductName" runat="server" AssociatedControlID="txtEditProductName" Text="Product Name"></asp:Label>
                <asp:TextBox ID="txtEditProductName" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEditProductDescription" runat="server" AssociatedControlID="txtEditProductDescription" Text="Product Description"></asp:Label>
                <asp:TextBox ID="txtEditProductDescription" runat="server" CssClass="form-control" placeholder="Enter Description" TextMode="MultiLine" Height="153px" Width="537px"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEditProductPrice" runat="server" AssociatedControlID="txtEditProductPrice" Text="Product Price"></asp:Label>
                <asp:TextBox ID="txtEditProductPrice" runat="server" CssClass="form-control" placeholder="Enter Product Price"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEditProductQuantity" runat="server" AssociatedControlID="txtEditProductQuantity" Text="Product Quantity"></asp:Label>
                <asp:TextBox ID="txtEditProductQuantity" runat="server" CssClass="form-control" placeholder="Enter Product Quantity"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEditProductStatus" runat="server" AssociatedControlID="txtNewProductPrice" Text="Product Status"></asp:Label>
                <asp:DropDownList ID="ddlEditProductStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Available" Value="available"></asp:ListItem>
                    <asp:ListItem Text="Out of Stock" Value="out_of_stock"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEditProductImage" runat="server" AssociatedControlID="fuEditProductImage" Text="Product Image"></asp:Label>
                <asp:FileUpload ID="fuEditProductImage" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnUpdateProduct" runat="server" CssClass="btn" OnClick="btnUpdateProduct_Click" Text="Update Product" />
                <br />
                <asp:Label ID="lblEditProductResultMessage" runat="server" CssClass="message-label" />
            </div>
        </asp:Panel>

        <!-- Panel for Removing Item -->
        <asp:Panel ID="removeItemPanel" runat="server" Visible="false">
            <h2>Remove Product</h2>
            <div class="form-group">
                <asp:Label ID="lblRemoveProductId" runat="server" AssociatedControlID="txtRemoveProductId" Text="Product ID"></asp:Label>
                <asp:TextBox ID="txtRemoveProductId" runat="server" CssClass="form-control" placeholder="Enter Product ID"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnRemoveProduct" runat="server" Text="Remove Product" CssClass="btn" OnClick="btnRemoveProduct_Click" />
                <br />
                <asp:Label ID="lblRemoveProductResultMessage" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>

        <asp:Panel ID="viewItemsPanel" runat="server" Visible="false">
            <h2>Product List</h2>
            <asp:GridView ID="gvProductList" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="sweetID" HeaderText="Product ID" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:BoundField DataField="sweetImage" HeaderText="Image" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </section>
</asp:Content>