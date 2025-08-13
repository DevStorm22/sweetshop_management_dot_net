<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="vieworderpage.aspx.cs" Inherits="sweetShopManagementSystem.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="vieworderpagestyle.css" rel="stylesheet" />
    <link href="masterpagestyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="view-orders">
        <h1>View Orders</h1>
        <asp:GridView ID="OrdersGrid" runat="server" AutoGenerateColumns="False" CssClass="orders-table" OnRowCommand="OrdersGrid_RowCommand">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnViewDetails" runat="server" Text="View Details" CssClass="btn view-details-btn" CommandName="ViewDetails" CommandArgument='<%# Eval("OrderID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </section>

    <!-- Order Details Modal -->
    <asp:Panel ID="OrderDetailsModal" CssClass="modal" runat="server" Visible="False">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Order Details</h2>
            <asp:GridView ID="OrderDetailsGrid" runat="server" AutoGenerateColumns="False" CssClass="details-table">
                <Columns>
                    <asp:BoundField DataField="SweetName" HeaderText="Sweet Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>

    <script>
        function closeModal() {
            document.getElementById('<%= OrderDetailsModal.ClientID %>').style.display = 'none';
        }
    </script>
</asp:Content>