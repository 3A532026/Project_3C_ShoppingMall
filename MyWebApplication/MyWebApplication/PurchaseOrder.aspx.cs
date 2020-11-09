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
    public partial class PurchaseOrder1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!Page.IsPostBack)
            {
                Process_select();
                Process_select1();
                Process_select2();
            }
            else
            {
                Process_select();
                Process_select1();
                Process_select2();
            }
        }

        private void Process_select()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From PurchaseOrder WHERE (purchaseid Like '%'+@search+'%') OR (supplierid Like '%'+@search+'%') OR (supplier Like '%'+@search+'%') OR (userid Like '%'+@search+'%') OR (date Like '%'+@search+'%') OR (total Like '%'+@search+'%') OR (status Like '%'+@search+'%')", con);
            cmd.Parameters.AddWithValue("@search", TextBox2.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        private void Process_select1()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From PurchaseOrder WHERE (status = N'未收貨') AND ((purchaseid Like '%'+@search+'%') OR (supplierid Like '%'+@search+'%') OR (supplier Like '%'+@search+'%') OR (userid Like '%'+@search+'%') OR (date Like '%'+@search+'%') OR (total Like '%'+@search+'%') OR (status Like '%'+@search+'%'))", con);
            cmd.Parameters.AddWithValue("@search", TextBox1.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        private void Process_select2()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From PurchaseOrder WHERE (status = N'已收貨') AND ((purchaseid Like '%'+@search+'%') OR (supplierid Like '%'+@search+'%') OR (supplier Like '%'+@search+'%') OR (userid Like '%'+@search+'%') OR (date Like '%'+@search+'%') OR (total Like '%'+@search+'%') OR (status Like '%'+@search+'%'))", con);
            cmd.Parameters.AddWithValue("@search", TextBox3.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView3.DataSource = ds;
            GridView3.DataBind();
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
                    for (int i = 1; i <= 7; i++)
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
                    for (int i = 1; i <= 7; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox2.Text, highlight);
                    }
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Process_select1();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox1.Text + "</span>";

                foreach (GridViewRow row in GridView2.Rows)
                {
                    for (int i = 1; i <= 7; i++)
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
                Process_select1();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox1.Text + "</span>";
                foreach (GridViewRow row in GridView2.Rows)
                {
                    for (int i = 1; i <= 7; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox1.Text, highlight);
                    }
                }
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBox3.Text == "")
            {
                Process_select2();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox3.Text + "</span>";

                foreach (GridViewRow row in GridView3.Rows)
                {
                    for (int i = 1; i <= 7; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox3.Text, highlight);
                    }
                }
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            if (TextBox3.Text == "")
            {
                Process_select2();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox3.Text + "</span>";
                foreach (GridViewRow row in GridView3.Rows)
                {
                    for (int i = 1; i <= 7; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox3.Text, highlight);
                    }
                }
            }
        }
    }
}