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
    public partial class Bulletin : System.Web.UI.Page
    {
        DateTime time = DateTime.Now;
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
            SqlCommand cmd = new SqlCommand("SELECT * From BulletinBoard WHERE (bulletinid Like '%'+@search+'%') OR (bulletin Like '%'+@search+'%') OR (time Like '%'+@search+'%') OR (Userid Like '%'+@search+'%')", con);
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
            SqlCommand cmd = new SqlCommand("SELECT * From BulletinBoard WHERE([category] = N'系統') AND ((bulletinid Like '%'+@search+'%') OR (bulletin Like '%'+@search+'%') OR (time Like '%'+@search+'%') OR (Userid Like '%'+@search+'%') OR (category Like '%'+@search+'%'))", con);
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
            SqlCommand cmd = new SqlCommand("SELECT * From BulletinBoard WHERE([category] = N'活動') AND ((bulletinid Like '%'+@search+'%') OR (bulletin Like '%'+@search+'%') OR (time Like '%'+@search+'%') OR (Userid Like '%'+@search+'%') OR (category Like '%'+@search+'%'))", con);
            cmd.Parameters.AddWithValue("@search", TextBox3.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView3.DataSource = ds;
            GridView3.DataBind();
        }
        //<!--公告管理#menu6-->
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bdelete")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete From BulletinBoard Where bullentinid= 4", con);
                //cmd.Parameters.AddWithValue("@bullentinid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select();
            }
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bdelete")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete From BulletinBoard Where bullentinid=@bullentinid", con);
                cmd.Parameters.AddWithValue("@bullentinid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select1();
            }
        }
        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bdelete")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete From BulletinBoard Where bullentinid=@bullentinid", con);
                cmd.Parameters.AddWithValue("@bullentinid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select2();
            }
        }
        //<!--公告管理#menu6 新增-->
        protected void Btn_add_bulletin_Click(object sender, EventArgs e)
        {
            string id = Session["id"].ToString();
            string d = time.ToString("yyyy-MM-dd HH:mm:ss");
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO BulletinBoard(bulletin,content,time,Userid,category)VALUES(@bulletin,@Content,@Time,@Userid,@category)", con);
            cmd.Parameters.AddWithValue("@bulletin", bulletin.Text);
            cmd.Parameters.AddWithValue("@Content", bulletincontent.Text);
            cmd.Parameters.AddWithValue("@Time", d);
            cmd.Parameters.AddWithValue("@Userid", id);
            cmd.Parameters.AddWithValue("@category", DropDownList1.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            Process_select();
        }
        //<!--公告管理#menu6 清空-->
        protected void Btn_clear3_Click(object sender, EventArgs e)
        {
            bulletin.Text = "";
            bulletincontent.Text = "";
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
                    for (int i = 1; i <= 4; i++)
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
                    for (int i = 1; i <= 4; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox2.Text, highlight);
                    }
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
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
                    for (int i = 1; i <= 4; i++)
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
                    for (int i = 1; i <= 4; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox1.Text, highlight);
                    }
                }
            }
        }
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
                    for (int i = 1; i <= 4; i++)
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
                    for (int i = 1; i <= 4; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox3.Text, highlight);
                    }
                }
            }
        }
    }
}