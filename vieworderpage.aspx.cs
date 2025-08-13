using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace sweetShopManagementSystem
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"SELECT o.orderID, c.name, o.orderDate, o.totalPrice AS TotalAmount, o.status
                             FROM [Order] o
                             INNER JOIN Customer c ON o.customerID = c.customerID
                             ORDER BY o.orderDate DESC";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                OrdersGrid.DataSource = dt;
                OrdersGrid.DataBind();
            }
        }

        protected void OrdersGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int orderID = Convert.ToInt32(e.CommandArgument);
                LoadOrderDetails(orderID);
            }
        }

        private void LoadOrderDetails(int orderID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"SELECT s.name, od.quantity, od.price, (od.quantity * od.price) AS TotalPrice
                             FROM OrderDetails od
                             INNER JOIN Sweets s ON od.SweetID = s.SweetID
                             WHERE od.OrderID = 8";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderID);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    OrderDetailsGrid.DataSource = dt;
                    OrderDetailsGrid.DataBind();
                }
            }

            OrderDetailsModal.Visible = true; // Show modal
        }
    }
}