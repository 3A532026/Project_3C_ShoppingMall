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
    public partial class Supplier : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView2.Visible = false;
            Label1.Visible = false;
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!Page.IsPostBack)
            {
                process_select();
            }
            else
            {
                process_select();
            }
        }
        private void process_select()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From Supplier WHERE (supplierid Like '%'+@search+'%') OR (supplier Like '%'+@search+'%') OR (phone Like '%'+@search+'%') OR (email Like '%'+@search+'%') OR (address Like '%'+@search+'%')", con);
            cmd.Parameters.AddWithValue("@search", TextBox2.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        //<!--供應商管理#menu4-->
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bdelete")
            {
                SqlDataSource2.SelectParameters["supplierid"].DefaultValue = e.CommandArgument.ToString();
                GridView2.DataBind();
                if (GridView2.Rows.Count > 0)
                {
                    GridView2.Visible = true;
                    Label1.Visible = true;
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete From Supplier Where supplierid=@supplierid", con);
                    cmd.Parameters.AddWithValue("@supplierid", e.CommandArgument);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    process_select();
                }
            }

        }
        //<!--供應商管理#menu4 新增-->
        protected void btn_add_supplier_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Supplier(supplier,phone,email,address)values(@supplier,@phone,@email,@address)", con);
            cmd.Parameters.AddWithValue("@supplier", suppliername.Text);
            cmd.Parameters.AddWithValue("@phone", supplierphone.Text);
            cmd.Parameters.AddWithValue("@email", supplieremail.Text);
            cmd.Parameters.AddWithValue("@address", supplieraddress.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            process_select();
        }
        //<!--供應商管理#menu4 清空-->
        protected void btn_clear2_Click(object sender, EventArgs e)
        {
            suppliername.Text = "";
            supplierphone.Text = "";
            supplieremail.Text = "";
            supplieraddress.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox2.Text + "</span>";

                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 1; i <= 5; i++)
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
                process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox2.Text + "</span>";
                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 1; i <= 5; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox2.Text, highlight);
                    }
                }
            }
        }
    }
}