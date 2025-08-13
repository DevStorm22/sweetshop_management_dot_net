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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignupButton_Click(object sender, EventArgs e)
        {
            try
            {
                string adminName = NewUserName.Text;
                string adminEmail = NewUserEmail.Text;
                string adminPassword = NewUserPassword.Text;
                string str = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    string sql = "select * from Admin where email = " + adminEmail;
                    SqlCommand cmd = new SqlCommand(sql, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        UserCreationMessage.Text = "<p class='success-message'>User already exists!!!</p>";
                        NewUserName.Text = string.Empty;
                        NewUserEmail.Text = string.Empty;
                        NewUserPassword.Text = string.Empty;
                    }
                    else
                    {
                        string insertQuery = "insert into Admin values(@AdminName, @AdminEmail, @Password)";
                        cmd = new SqlCommand(insertQuery, con);
                        cmd.Parameters.AddWithValue("@AdminName", adminName);
                        cmd.Parameters.AddWithValue("@AdminEmail", adminEmail);
                        cmd.Parameters.AddWithValue("@Password", adminPassword);
                        dr = cmd.ExecuteReader();
                        con.Close();
                        UserCreationMessage.Text = "<p class='success-message'>Admin signed up successfully!</p>";
                        NewUserName.Text = string.Empty;
                        NewUserEmail.Text = string.Empty;
                        NewUserPassword.Text = string.Empty;
                    }
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void CreateUserButton_Click(object sender, EventArgs e)
        {

        }
    }
}