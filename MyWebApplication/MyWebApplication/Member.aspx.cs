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
    public partial class Member : System.Web.UI.Page
    {
        string sexvalue;
        DateTime time = DateTime.Now;
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
            SqlCommand cmd = new SqlCommand("SELECT * From Users WHERE (Username Like '%'+@search+'%') OR (UserID Like '%'+@search+'%') OR (Jointime Like '%'+@search+'%') OR (LastLoginTime Like '%'+@search+'%') OR (Status Like '%'+@search+'%') OR (Level Like '%'+@search+'%') Order by (CASE WHEN (Level=N'管理員') THEN 0 WHEN NOT(Level=N'管理員') THEN 1 ELSE NULL END)", con);
            cmd.Parameters.AddWithValue("@search", TextBox1.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bdelete")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete From Users Where UserID=@Account", con);
                cmd.Parameters.AddWithValue("@Account", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select();
            }
            if (e.CommandName == "stop")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Users set status=N'停用' where UserID = @Account", con);
                cmd.Parameters.AddWithValue("@Account", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select();
            }
            if (e.CommandName == "start")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Users Set Status=N'使用中' where UserID = @Account", con);
                cmd.Parameters.AddWithValue("@Account", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Process_select();
            }
        }
        //<!--會員管理#menu1 新增-->
        protected void Bt_add_Click(object sender, EventArgs e)
        {
            
            if (man.Checked)
            {
                sexvalue = "男";
            }
            else
            {
                sexvalue = "女";
            }
            string mydate = time.ToString("yyyy-MM-dd HH:mm:ss");
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Users(Username,UserID,Password,Sex,Birthday,Phone,Email,Address,Jointime,Status,Level) values" +
                " (@username,@Account,@password,@sex,@birthday,@phone,@email,@address,@jointime,@status,@level)", con);
            cmd.Parameters.AddWithValue("@Account", userid.Text);
            cmd.Parameters.AddWithValue("@password", "admin"+userid.Text);
            cmd.Parameters.AddWithValue("@username", name.Text);
            cmd.Parameters.AddWithValue("@sex", sexvalue);
            if (date.Text == "")
            {
                cmd.Parameters.AddWithValue("@birthday", date.Text);
            }
            else
            {
                DateTime birthday = DateTime.Parse(date.Text);
                cmd.Parameters.AddWithValue("@birthday", birthday);
            }
            cmd.Parameters.AddWithValue("@phone", phone.Text);
            cmd.Parameters.AddWithValue("@email", mail.Text);
            cmd.Parameters.AddWithValue("@address", address.Text);
            cmd.Parameters.AddWithValue("@jointime", mydate);
            cmd.Parameters.AddWithValue("@status", "使用中");
            cmd.Parameters.AddWithValue("@level", "管理員");
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            con.Close();

        }
        //<!--會員管理#menu1 清空-->
        protected void Bt_clear_Click(object sender, EventArgs e)
        {
            name.Text = "";
            man.Checked = true;
            date.Text = "";
            phone.Text = "";
            mail.Text = "";
            address.Text = "";
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox1.Text + "</span>";
                
                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 2; i <= 7; i++)
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
                Process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox1.Text + "</span>";
                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 2; i <= 7; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox1.Text, highlight);
                    }
                }
            }
        }
    }
}