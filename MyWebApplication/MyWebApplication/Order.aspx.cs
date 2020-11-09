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
    public partial class Order : System.Web.UI.Page
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
                Process_select3();
            }
            else
            {
                Process_select();
                Process_select1();
                Process_select2();
                Process_select3();
            }
        }
        //所有訂單查詢
        private void Process_select()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From [Orders] WHERE (orderid Like '%'+@search+'%') OR (purchasedate Like '%'+@search+'%') OR (total Like '%'+@search+'%') OR (paytype Like '%'+@search+'%') OR (status Like '%'+@search+'%') OR (deliver_status Like '%'+@search+'%') ORDER BY [purchasedate] DESC", con);
            cmd.Parameters.AddWithValue("@search", TextBox2.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView4.DataSource = ds;
            GridView4.DataBind();
        }
        //未出貨訂單查詢
        private void Process_select1()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From [Orders] WHERE (deliver_status = N'未出貨') AND ((orderid Like '%'+@search+'%') OR (purchasedate Like '%'+@search+'%') OR (total Like '%'+@search+'%') OR (paytype Like '%'+@search+'%') OR (status Like '%'+@search+'%') OR (deliver_status Like '%'+@search+'%')) ORDER BY [purchasedate] DESC", con);
            cmd.Parameters.AddWithValue("@search", TextBox1.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        //已出貨訂單查詢
        private void Process_select2()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From [Orders] WHERE (deliver_status = N'已出貨') AND ((orderid Like '%'+@search+'%') OR (purchasedate Like '%'+@search+'%') OR (total Like '%'+@search+'%') OR (paytype Like '%'+@search+'%') OR (status Like '%'+@search+'%') OR (deliver_status Like '%'+@search+'%')) ORDER BY [purchasedate] DESC", con);
            cmd.Parameters.AddWithValue("@search", TextBox3.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        //已結案訂單查詢
        private void Process_select3()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From [Orders] WHERE (deliver_status = N'已結案') AND ((orderid Like '%'+@search+'%') OR (purchasedate Like '%'+@search+'%') OR (total Like '%'+@search+'%') OR (paytype Like '%'+@search+'%') OR (status Like '%'+@search+'%') OR (deliver_status Like '%'+@search+'%')) ORDER BY [purchasedate] DESC", con);
            cmd.Parameters.AddWithValue("@search", TextBox4.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView3.DataSource = ds;
            GridView3.DataBind();
        }
        //所有訂單查詢
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                Process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox2.Text + "</span>";

                foreach (GridViewRow row in GridView4.Rows)
                {
                    for (int i = 1; i <= 6; i++)
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
                foreach (GridViewRow row in GridView4.Rows)
                {
                    for (int i = 1; i <= 6; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox2.Text, highlight);
                    }
                }
            }
        }
        //未出貨訂單查詢
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Process_select1();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox1.Text + "</span>";

                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 1; i <= 6; i++)
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
                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 1; i <= 6; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox1.Text, highlight);
                    }
                }
            }
        }
        //已出貨訂單查詢
        protected void Button3_Click(object sender, EventArgs e)
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
                    for (int i = 1; i <= 6; i++)
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
                    for (int i = 1; i <= 6; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox3.Text, highlight);
                    }
                }
            }
        }
        //已結案訂單查詢
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBox4.Text == "")
            {
                Process_select3();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox4.Text + "</span>";

                foreach (GridViewRow row in GridView4.Rows)
                {
                    for (int i = 1; i <= 6; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox4.Text, highlight);
                    }
                }
            }
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            if (TextBox4.Text == "")
            {
                Process_select3();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox4.Text + "</span>";
                foreach (GridViewRow row in GridView4.Rows)
                {
                    for (int i = 1; i <= 6; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox4.Text, highlight);
                    }
                }
            }
        }
    }
}