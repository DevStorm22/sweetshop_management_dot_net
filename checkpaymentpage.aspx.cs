using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sweetShopManagementSystem
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckPaymentStatus(object sender, EventArgs e)
        {
            try
            {
                String str = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = cmd.ExecuteReader();
                con.Close();
                string orderId = txtOrderId.Text;
                if (!string.IsNullOrEmpty(orderId))
                {
                    lblPaymentStatus.Text = "Payment Status: Paid";
                    lblPaymentStatus.CssClass = "payment-status-success";
                }
                else
                {
                    lblPaymentStatus.Text = "Please enter a valid Order ID.";
                    lblPaymentStatus.CssClass = "payment-status-error";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}