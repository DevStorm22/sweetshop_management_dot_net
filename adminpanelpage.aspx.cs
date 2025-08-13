using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace sweetShopManagementSystem
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] != null && (bool)Session["AdminLoggedIn"])
            {
                adminContent.Visible = true;
                adminLoginModal.Visible = false;
            }
            else
            {
                adminContent.Visible = false;
                adminLoginModal.Visible = true;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string adminId = txtAdminID.Text.Trim();
                string password = txtPassword.Text.Trim();
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT * FROM Customer WHERE customerID = @AdminID AND password = @Password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@AdminID", adminId);
                    cmd.Parameters.AddWithValue("@Password", password);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session["AdminLoggedIn"] = true;
                        Session.Timeout = 20;
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        lblMessage.Text = "Invalid ID or password. Please try again.";
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}