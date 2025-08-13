using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace sweetShopManagementSystem
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            try
            {
                string productName = txtProductName.Text;
                string customerName = txtCustomerName.Text;
                string email = txtEmail.Text;
                string address = txtAddress.Text;
                string quantity = txtQuantity.Text;
                string str = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    string query = "select * from order";
                    SqlCommand cmd = new SqlCommand();
                    SqlDataReader dr = cmd.ExecuteReader();
                    con.Close();
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}