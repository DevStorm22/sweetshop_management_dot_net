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
namespace sweetShopManagementSystem
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string str = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string path;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void ShowAddPanel(object sender, EventArgs e)
        {
            addNewItemPanel.Visible = true;
            editItemPanel.Visible = false;
            removeItemPanel.Visible = false;
            viewItemsPanel.Visible = false;
        }
        protected void ShowEditPanel(object sender, EventArgs e)
        {
            addNewItemPanel.Visible = false;
            editItemPanel.Visible = true;
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

        protected void ShowViewPanel(object sender, EventArgs e)
        {
            addNewItemPanel.Visible = false;
            editItemPanel.Visible = false;
            removeItemPanel.Visible = false;
            viewItemsPanel.Visible = true;
            LoadProductList();
        }
        protected void LoadProductList()
        {
            using (SqlConnection con = new SqlConnection(str))
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

        /*protected void btnSaveNewProduct_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    string sName = txtNewProductName.Text;
                    string sDescription = txtNewProductDescription.Text;
                    string sPrice = txtNewProductPrice.Text;
                    string sQuantity = txtNewProductQuantity.Text;
                    string sStatus = ddlNewProductStatus.SelectedValue;
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
        }*/
        protected void btnSaveNewProduct_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    string sName = txtNewProductName.Text;
                    string sDescription = txtNewProductDescription.Text;
                    string sPrice = txtNewProductPrice.Text;
                    string sQuantity = txtNewProductQuantity.Text;
                    string sStatus = ddlNewProductStatus.SelectedValue;
                    string sImage = ""; // Initialize image path variable

                    if (fuNewUploadImage.HasFile)
                    {
                        string fileName = Path.GetFileName(fuNewUploadImage.FileName);
                        string folderPath = Server.MapPath("~/UploadedImages/"); // Absolute path

                        // Ensure the directory exists
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        // Create the full file path
                        string fullPath = Path.Combine(folderPath, fileName);
                        fuNewUploadImage.SaveAs(fullPath);

                        // Store relative path for database
                        sImage = "UploadedImages/" + fileName;
                    }

                    // SQL Insert Query
                    string query = "INSERT INTO Sweet (sweetImage, name, description, price, quantity, status) " +
                                   "VALUES (@Image, @Name, @Description, @Price, @Quantity, @Status)";

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
                        lblNewProductResultMessage.Text = "Product Added Successfully!";
                        lblNewProductResultMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblNewProductResultMessage.Text = "Product Addition Failed!";
                        lblNewProductResultMessage.ForeColor = System.Drawing.Color.Red;
                    }

                    con.Close();
                }
            }
            catch (Exception ex)
            {
                lblNewProductResultMessage.Text = "Error: " + ex.Message;
                lblNewProductResultMessage.ForeColor = System.Drawing.Color.Red;
            }
        }


        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    string sID = txtEditProductId.Text;
                    string sName = txtEditProductName.Text;
                    string sDescription = txtEditProductDescription.Text;
                    string sPrice = txtEditProductPrice.Text;
                    string sQuantity = txtEditProductQuantity.Text;
                    string sStatus = ddlNewProductStatus.SelectedValue;
                    string sImage = ""; // Initialize image path

                    if (fuEditProductImage.HasFile)
                    {
                        string fileName = Path.GetFileName(fuEditProductImage.FileName);
                        string folderPath = Server.MapPath("~/UploadedImages/"); // Rooted absolute path

                        // Ensure the directory exists
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        // Create the full file path
                        string fullPath = Path.Combine(folderPath, fileName);
                        fuEditProductImage.SaveAs(fullPath);

                        // Store only the relative path for the database
                        sImage = "UploadedImages/" + fileName;
                    }
                    else
                    {
                        // Fetch existing image path if no new file is uploaded
                        string queryToRetrieveImage = "SELECT sweetImage FROM Sweet WHERE sweetID = @SweetID";
                        SqlCommand cmd1 = new SqlCommand(queryToRetrieveImage, con);
                        cmd1.Parameters.AddWithValue("@SweetID", sID);
                        SqlDataReader dr = cmd1.ExecuteReader();
                        if (dr.Read())
                        {
                            sImage = dr["sweetImage"].ToString();
                        }
                        dr.Close();
                    }

                    // SQL Update Query
                    string query = "UPDATE Sweet SET sweetImage = @Image, name = @Name, description = @Description, " +
                                   "price = @Price, quantity = @Quantity, status = @Status WHERE sweetID = @SweetID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Image", sImage);
                    cmd.Parameters.AddWithValue("@Name", sName);
                    cmd.Parameters.AddWithValue("@Description", sDescription);
                    cmd.Parameters.AddWithValue("@Price", sPrice);
                    cmd.Parameters.AddWithValue("@Quantity", sQuantity);
                    cmd.Parameters.AddWithValue("@Status", sStatus);
                    cmd.Parameters.AddWithValue("@SweetID", sID);

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        lblEditProductResultMessage.Text = "Product Updated Successfully!";
                        lblEditProductResultMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblEditProductResultMessage.Text = "Product Update Failed!";
                        lblEditProductResultMessage.ForeColor = System.Drawing.Color.Red;
                    }

                    con.Close();
                }
            }
            catch (Exception ex)
            {
                lblEditProductResultMessage.Text = "Error: " + ex.Message;
                lblEditProductResultMessage.ForeColor = System.Drawing.Color.Red;
            }
        }


        protected void btnRemoveProduct_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(str))
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
            catch(Exception ex)
            {
                lblRemoveProductResultMessage.Text = ex.Message;
                lblRemoveProductResultMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void txtEditProductId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(str))
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
    }
}