using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sweetShopManagementSystem
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
            }
        }

        private void LoadCartItems()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            DataTable cartTable = new DataTable();

            using (SqlConnection sqlConnection = new SqlConnection(connectionString))
            {
                sqlConnection.Open();
                string query = "SELECT name, price, quantity FROM Cart WHERE customerID = 8";
                using (SqlCommand cmd = new SqlCommand(query, sqlConnection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(cartTable);
                    }
                }
            }

            if (cartTable.Rows.Count > 0)
            {

                // ✅ Calculate total price
                decimal totalAmount = 0;
                foreach (DataRow row in cartTable.Rows)
                {
                    totalAmount += Convert.ToDecimal(row["price"]) * Convert.ToInt32(row["quantity"]);
                }

                txtTotalAmount.Text = "₹" + totalAmount.ToString("F2");
            }
            else
            {
                lblResultMessage.Text = "No cart data available.";
                lblResultMessage.CssClass = "error-message";
            }
        }

        protected void MakePayment_Click(object sender, EventArgs e)
        {
            decimal totalAmount = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            int customerID = 8; // Change this dynamically as needed

            // ✅ Step 1: Retrieve cart items from database
            DataTable cartTable = new DataTable();
            string fetchCartQuery = "SELECT sweetID, quantity, price FROM Cart WHERE customerID = @customerID";

            using (SqlConnection sqlConnection = new SqlConnection(connectionString))
            {
                sqlConnection.Open();
                using (SqlCommand cmd = new SqlCommand(fetchCartQuery, sqlConnection))
                {
                    cmd.Parameters.AddWithValue("@customerID", customerID);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(cartTable);
                }
            }

            // ✅ Step 2: Calculate total amount dynamically
            foreach (DataRow row in cartTable.Rows)
            {
                totalAmount += Convert.ToDecimal(row["price"]) * Convert.ToInt32(row["quantity"]);
            }

            // ✅ Step 3: Insert a new order and get the generated orderID
            int newOrderID = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string orderQuery = "INSERT INTO [Order] (orderDate, status, customerID, address, totalPrice) OUTPUT INSERTED.orderID VALUES (@date, 'Pending', @customerID, 'rtn', @price)";

                using (SqlCommand orderCmd = new SqlCommand(orderQuery, connection))
                {
                    orderCmd.Parameters.AddWithValue("@date", DateTime.Now);
                    orderCmd.Parameters.AddWithValue("@customerID", customerID);
                    orderCmd.Parameters.AddWithValue("@price", totalAmount);

                    newOrderID = (int)orderCmd.ExecuteScalar();
                }

                // ✅ Step 4: Insert each cart item into OrderDetails
                string orderDetailsQuery = "INSERT INTO OrderDetail (orderID, sweetID, quantity, price) VALUES (@orderID, @sweetID, @quantity, @price)";

                foreach (DataRow row in cartTable.Rows)
                {
                    using (SqlCommand orderDetailsCmd = new SqlCommand(orderDetailsQuery, connection))
                    {
                        orderDetailsCmd.Parameters.AddWithValue("@orderID", newOrderID);
                        orderDetailsCmd.Parameters.AddWithValue("@sweetID", row["sweetID"]);
                        orderDetailsCmd.Parameters.AddWithValue("@quantity", row["quantity"]);
                        orderDetailsCmd.Parameters.AddWithValue("@price", row["price"]);
                        int r = orderDetailsCmd.ExecuteNonQuery();
                    }
                }

                // ✅ Step 5: Clear the Cart table after order placement
                string clearCartQuery = "DELETE FROM Cart WHERE customerID = @customerID";
                using (SqlCommand clearCartCmd = new SqlCommand(clearCartQuery, connection))
                {
                    clearCartCmd.Parameters.AddWithValue("@customerID", customerID);
                    clearCartCmd.ExecuteNonQuery();
                }
            }

            lblResultMessage.Text = "Order placed successfully!";
            lblResultMessage.CssClass = "success-message";
        }

    }
}