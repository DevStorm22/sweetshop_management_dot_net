using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace sweetShopManagementSystem
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMenuItems();
            }
        }
        private void BindMenuItems()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT sweetImage, name, description, price FROM Sweet";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            Button btnAddToCart = (Button)sender;
            int sweetID = Convert.ToInt32(btnAddToCart.CommandArgument);

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Query to fetch sweet details
            string fetchQuery = "SELECT sweetID, sweetImage, name, description, price FROM Sweet WHERE sweetID = @sweetID";

            // Query to insert data into Cart
            string insertQuery = "INSERT INTO Cart (sweetID, sweetImage, name, description, price, userID) " +
                                 "VALUES (@sweetID, @sweetImage, @name, @description, @price, @userID)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                using (SqlCommand fetchCmd = new SqlCommand(fetchQuery, con))
                {
                    fetchCmd.Parameters.AddWithValue("@sweetID", sweetID);

                    using (SqlDataReader reader = fetchCmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string sweetImage = reader["sweetImage"].ToString();
                            string name = reader["name"].ToString();
                            string description = reader["description"].ToString();
                            decimal price = Convert.ToDecimal(reader["price"]);

                            reader.Close();

                            // Insert sweet data into Cart
                            using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                            {
                                insertCmd.Parameters.AddWithValue("@sweetID", sweetID);
                                insertCmd.Parameters.AddWithValue("@sweetImage", sweetImage);
                                insertCmd.Parameters.AddWithValue("@name", name);
                                insertCmd.Parameters.AddWithValue("@description", description);
                                insertCmd.Parameters.AddWithValue("@price", price);
                                insertCmd.Parameters.AddWithValue("@userID", 101); // Replace with actual logged-in user ID

                                insertCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }

            // Optionally display a success message
            ScriptManager.RegisterStartupScript(this, GetType(), "AddToCartAlert", "alert('Item added to cart successfully!');", true);
        }
    }
}