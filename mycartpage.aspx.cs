using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace sweetShopManagementSystem
{
    public partial class WebForm4 : System.Web.UI.Page
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
            string query = "SELECT cartID, image, name, quantity, price FROM Cart WHERE customerID = 8";  // Change based on logged-in user

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                MyCartRepeater1.DataSource = dt;
                MyCartRepeater1.DataBind();

                // Calculate total price
                decimal totalAmount = 0;
                foreach (DataRow row in dt.Rows)
                {
                    totalAmount += Convert.ToDecimal(row["price"]) * Convert.ToInt32(row["quantity"]);
                }

                lblTotalAmount.Text = "₹" + totalAmount.ToString("F2");
            }
        }

        protected void MyCartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int cartID = Convert.ToInt32(e.CommandArgument);
                RemoveCartItem(cartID);
                LoadCartItems(); // Refresh cart after removal
            }
        }

        private void RemoveCartItem(int cartID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string deleteQuery = "DELETE FROM Cart WHERE cartID = @CartID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@CartID", cartID);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void ProceedToPayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("paymentpage.aspx");
        }
    }
}
