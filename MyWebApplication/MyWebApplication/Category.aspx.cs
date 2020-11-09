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
    public partial class Category : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("SELECT * From Category WHERE (categoryid Like '%'+@search+'%') OR (category Like '%'+@search+'%')", con);
            cmd.Parameters.AddWithValue("@search", TextBox1.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        //<!--類別管理#menu2-->
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bdelete")
            {
                SqlDataSource2.SelectParameters["categoryid"].DefaultValue = e.CommandArgument.ToString();
                GridView2.DataBind();
                if (GridView2.Rows.Count > 0)
                {
                    GridView2.Visible = true;
                    Label1.Visible = true;
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete From Category Where categoryid=@categoryid", con);
                    cmd.Parameters.AddWithValue("@categoryid", e.CommandArgument);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    process_select();
                }
            }
        }
        //<!--類別管理#menu2 新增-->
        protected void add_categ_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Category(category)values(@category)", con);
            cmd.Parameters.AddWithValue("@category", categ.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            process_select();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox1.Text + "</span>";

                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 1; i <= 2; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox1.Text, highlight);
                    }
                }
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox1.Text + "</span>";
                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 1; i <= 2; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox1.Text, highlight);
                    }
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Panel1.Visible == false)
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
            
        }
    }
}