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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                String str = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = cmd.ExecuteReader();
                con.Close();
                string userEmail = email.Text;
                string userPassword = password.Text;
                if (email.Text.ToString() == "kaushik@gmail.com" && password.Text.ToString() == "admin")
                {
                    Response.Redirect("indexpage.aspx");
                }
                else
                {
                    lblErrorMessage.Text = "Invalid email or password.";
                    lblErrorMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        //private bool AuthenticateUser(string email, string password)
        //{
        //    try
        //    {
        //        String str = WebConfigurationManager.ConnectionStrings["c1"].ConnectionString;
        //        SqlConnection con = new SqlConnection(str);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand();
        //        SqlDataReader dr = cmd.ExecuteReader();
        //        con.Close();
        //        return email == "kaushik@gmail.com" && password == "admin";
        //    }
        //    catch(Exception ex)
        //    {
        //        Console.WriteLine(ex);
        //        return false;
        //    }
        //}
    }
}