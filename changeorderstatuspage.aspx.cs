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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UpdateStatus_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtOrderId.Text))
            {
                lblResultMessage.Text = "Please enter a valid Order ID.";
                return;
            }
            try
            {
                string str = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string orderId = txtOrderId.Text;
                string selectedStatus = ddlOrderStatus.SelectedValue;
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    string query = "UPDATE [Order] SET status = @Status WHERE orderID = @ID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Status", selectedStatus);
                        cmd.Parameters.AddWithValue("@ID", orderId);

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            lblResultMessage.Text = "Status changed successfully.";
                        }
                        else
                        {
                            lblResultMessage.Text = "Failed to change status. Order ID not found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblResultMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}