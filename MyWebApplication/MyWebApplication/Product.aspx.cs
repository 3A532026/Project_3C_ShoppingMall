using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MyWebApplication
{
    public partial class Product : System.Web.UI.Page
    {
        DateTime time = DateTime.Now;
        int length;
        byte[] pic;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!Page.IsPostBack)
            {
                Process_select();
            }
            else
            {
                Process_select();
            }
        }
        private void Process_select()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From Product WHERE (Id Like '%'+@search+'%') OR (Name Like '%'+@search+'%') OR (Category Like '%'+@search+'%') OR (cost Like '%'+@search+'%') OR (Safety Like '%'+@search+'%') OR (Price Like '%'+@search+'%')OR (Store Like '%'+@search+'%')OR (Supplier Like '%'+@search+'%')OR (Status Like '%'+@search+'%')", con);
            cmd.Parameters.AddWithValue("@search", TextBox2.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        //<!--產品管理#menu3-->
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bdelete")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete From Product Where Id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select();
            }
            if (e.CommandName == "stop")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Product set Status=N'下架' where Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select();
            }
            if (e.CommandName == "start")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Product set Status=N'上架中' where Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select();
            }
        }
        //<!--產品管理#menu3 新增-->
        protected void Btn_add2_Click(object sender, EventArgs e)
        {
            string path = "~/image/";
            if (FileUpload1.HasFile)
            {
                path += FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(path));
            }
            else
            {

            }
            string myDate = time.ToString("yyyy-MM-dd HH:mm:ss");
            con.Open();
            length = FileUpload1.PostedFile.ContentLength;
            pic = new byte[length];
            FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
            SqlCommand cmd = new SqlCommand("insert into Product(productname,categoryid,category,supplierid,supplier,price,inventory,safetystock,cost,img,description,status)values(@productname,@categoryid,@category,@supplierid,@supplier,@price,@inventory,@safetystock,@cost,@img,@description,@status)", con);
            cmd.Parameters.AddWithValue("@productname", productname.Text);
            cmd.Parameters.AddWithValue("@categoryid", ddcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@category", ddcategory.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@supplierid", ddsupplier.SelectedValue);
            cmd.Parameters.AddWithValue("@supplier", ddsupplier.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@price", price.Text);
            cmd.Parameters.AddWithValue("@inventory", inventory.Text);
            cmd.Parameters.AddWithValue("@safetystock", safetystock.Text);
            cmd.Parameters.AddWithValue("@cost", cost.Text);
            cmd.Parameters.AddWithValue("@img", pic);
            cmd.Parameters.AddWithValue("@description", TextBox1.Text);
            cmd.Parameters.AddWithValue("@status", "上架中");
            cmd.ExecuteNonQuery();
            con.Close();
            Process_select();

        }
        //<!--產品管理#menu3 清空-->
        protected void Clear_Click(object sender, EventArgs e)
        {
            productname.Text = "";
            inventory.Text = "";
            safetystock.Text = "";
            cost.Text = "";
            price.Text = "";
            TextBox1.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                Process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox2.Text + "</span>";

                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 2; i <= 9; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox2.Text, highlight);
                    }
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                Process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox2.Text + "</span>";
                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 2; i <= 9; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox2.Text, highlight);
                    }
                }
            }
        }
    }
}