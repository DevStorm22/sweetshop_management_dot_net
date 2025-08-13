using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml.Linq;
using System.IO;
using System.Configuration;
using System.Collections;
using System.Drawing;

namespace sweetShopManagementSystem
{
    public partial class WebForm5 : System.Web.UI.Page
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
            string fetchQuery = "SELECT sweetID, sweetImage, name, price FROM Sweet WHERE sweetID = @sweetID";

            // Query to insert data into Cart
            string insertQuery = "INSERT INTO Cart (sweetID, image, price, customerID, quantity, name) " +
                                 "VALUES (@sweetID, @sweetImage, @price, @userID, 1, @name)";

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
                            string name = reader["name"].ToString();
                            string sweetImage = reader["sweetImage"].ToString();
                            decimal price = Convert.ToDecimal(reader["price"]);

                            reader.Close();

                            // Insert sweet data into Cart
                            using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                            {
                                insertCmd.Parameters.AddWithValue("@sweetID", sweetID);
                                insertCmd.Parameters.AddWithValue("@sweetImage", sweetImage);
                                insertCmd.Parameters.AddWithValue("@price", price);
                                insertCmd.Parameters.AddWithValue("@userID", 8);
                                insertCmd.Parameters.AddWithValue("@name", name);

                                int a = insertCmd.ExecuteNonQuery();
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