using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sweetShopManagementSystem
{
	public partial class WebForm18 : System.Web.UI.Page
	{
        private string path;

        protected void Page_Load(object sender, EventArgs e) { }

        protected void ShowEditPanel(object sender, EventArgs e)
        {
            addNewItemPanel.Visible = false;
            editItemPanel.Visible = true;
            removeItemPanel.Visible = false;
            viewItemsPanel.Visible = false;
        }

        protected void ShowViewPanel(object sender, EventArgs e)
        {
            addNewItemPanel.Visible = false;
            editItemPanel.Visible = false;
            removeItemPanel.Visible = false;
            viewItemsPanel.Visible = true;
            LoadProductList();
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            try
            {
                string productId = txtEditProductId.Text.Trim();
                if (string.IsNullOrEmpty(productId))
                {
                    lblEditProductResultMessage.Text = "Please enter a valid Product ID.";
                    return;
                }

                string name = txtEditProductName.Text.Trim();
                string description = txtEditProductDescription.Text.Trim();
                string price = txtEditProductPrice.Text.Trim();
                string quantity = txtEditProductQuantity.Text.Trim();
                string status = ddlEditProductStatus.SelectedValue;

                string imagePath = null;
                if (fuEditProductImage.HasFile)
                {
                    string fileExtension = Path.GetExtension(fuEditProductImage.FileName);
                    if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png")
                    {
                        imagePath = "~/UploadedImages/" + fuEditProductImage.FileName;
                        fuEditProductImage.SaveAs(Server.MapPath(imagePath));
                    }
                    else
                    {
                        lblEditProductResultMessage.Text = "Only JPG and PNG images are allowed.";
                        return;
                    }
                }

                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string updateQuery = "UPDATE Sweet SET ";

                    if (!string.IsNullOrEmpty(name)) updateQuery += "name = @name, ";
                    if (!string.IsNullOrEmpty(description)) updateQuery += "description = @description, ";
                    if (!string.IsNullOrEmpty(price)) updateQuery += "price = @price, ";
                    if (!string.IsNullOrEmpty(quantity)) updateQuery += "quantity = @quantity, ";
                    if (!string.IsNullOrEmpty(status)) updateQuery += "status = @status, ";
                    if (!string.IsNullOrEmpty(imagePath)) updateQuery += "sweetImage = @sweetImage, ";

                    updateQuery = updateQuery.TrimEnd(',', ' ') + " WHERE sweetID = @productId";

                    SqlCommand cmd = new SqlCommand(updateQuery, conn);
                    cmd.Parameters.AddWithValue("@productId", productId);
                    if (!string.IsNullOrEmpty(name)) cmd.Parameters.AddWithValue("@name", name);
                    if (!string.IsNullOrEmpty(description)) cmd.Parameters.AddWithValue("@description", description);
                    if (!string.IsNullOrEmpty(price)) cmd.Parameters.AddWithValue("@price", price);
                    if (!string.IsNullOrEmpty(quantity)) cmd.Parameters.AddWithValue("@quantity", quantity);
                    if (!string.IsNullOrEmpty(status)) cmd.Parameters.AddWithValue("@status", status);
                    if (!string.IsNullOrEmpty(imagePath)) cmd.Parameters.AddWithValue("@sweetImage", imagePath);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    lblEditProductResultMessage.Text = rowsAffected > 0 ? "Product updated successfully." : "Update failed.";
                }
            }
            catch (Exception ex)
            {
                lblEditProductResultMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void LoadProductList()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM Sweet";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvProductList.DataSource = dt;
                gvProductList.DataBind();
                con.Close();
            }
        }

        protected void ShowAddPanel(object sender, EventArgs e)
        {
            addNewItemPanel.Visible = true;
            editItemPanel.Visible = false;
            removeItemPanel.Visible = false;
            viewItemsPanel.Visible = false;
        }

        protected void ShowRemovePanel(object sender, EventArgs e)
        {
            addNewItemPanel.Visible = false;
            editItemPanel.Visible = false;
            removeItemPanel.Visible = true;
            viewItemsPanel.Visible = false;
        }

        protected void btnRemoveProduct_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string sID = txtRemoveProductId.Text;
                    string query = "delete from Sweet where sweetID = @SweetID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@SweetID", sID);
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        lblRemoveProductResultMessage.Text = "Product Deleted Successfully!!!";
                        lblRemoveProductResultMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblRemoveProductResultMessage.Text = "Product Deletion Fail!!!";
                        lblRemoveProductResultMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                lblRemoveProductResultMessage.Text = ex.Message;
                lblRemoveProductResultMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void txtEditProductId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string sID = txtEditProductId.Text;
                    string query = "select name, description, price, status, sweetImage from Sweet where sweetID = @ID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ID", sID);
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        txtEditProductName.Text = r["name"].ToString();
                        txtEditProductDescription.Text = r["description"].ToString();
                        txtEditProductPrice.Text = r["price"].ToString();
                        if (r["status"].Equals("available"))
                        {
                            ddlEditProductStatus.SelectedIndex = 0;
                        }
                        else
                        {
                            ddlEditProductStatus.SelectedIndex = 1;
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                ddlEditProductStatus.SelectedIndex = 1;
            }
        }

        protected void btnSaveNewProduct_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string sName = txtNewProductName.Text;
                    string sDescription = txtNewProductDescription.Text;
                    string sPrice = txtNewProductPrice.Text;
                    string sQuantity = txtNewProductQuantity.Text;
                    string sStatus = ddlNewProductStatus.SelectedValue;
                    string path = "";
                    if (fuNewUploadImage.HasFile)
                    {
                        string fileName = fuNewUploadImage.FileName;
                        path = @"UploadedImages\" + fileName;
                        fuNewUploadImage.PostedFile.SaveAs(Server.MapPath(path));
                    }
                    string sImage = path;
                    string query = "insert into Sweet values(@Image, @Name, @Description, @Price, @Quantity, @Status)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Image", sImage);
                    cmd.Parameters.AddWithValue("@Name", sName);
                    cmd.Parameters.AddWithValue("@Description", sDescription);
                    cmd.Parameters.AddWithValue("@Price", sPrice);
                    cmd.Parameters.AddWithValue("@Quantity", sQuantity);
                    cmd.Parameters.AddWithValue("@Status", sStatus);
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        lblNewProductResultMessage.Text = "Product Added Successsfully!!!";
                        lblNewProductResultMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblNewProductResultMessage.Text = "Product Added Fail!!!";
                        lblNewProductResultMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                lblNewProductResultMessage.Text = ex.Message;
                lblNewProductResultMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}