using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MyWebApplication
{
    public partial class MemberDetail : System.Web.UI.Page
    {
        string sexvalue;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            id.Text = Request.QueryString["UserID"];
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Users where UserID = @Account", con);
                cmd.Parameters.AddWithValue("@Account", id.Text);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds, "Users");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        name.Text = dr["UserName"].ToString();
                        if (dr["Birthday"].ToString() == "")
                        {
                            date.Text = dr["Birthday"].ToString();
                        }
                        else
                        {
                            date.Text = Convert.ToDateTime(dr["Birthday"]).ToString("yyyy-MM-dd");
                        }
                        phone.Text = dr["Phone"].ToString();
                        mail.Text = dr["Email"].ToString();
                        address.Text = dr["Address"].ToString();
                        DropDownList1.SelectedValue = dr["Level"].ToString();
                    }
                }
                else
                {
                }
                con.Close();
            }
        }
        protected void b_update_Click(object sender, EventArgs e)
        {

            if (man.Checked)
            {
                sexvalue = "男";
            }
            else
            {
                sexvalue = "女";
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Users Set UserName=@username,email=@email,Sex=@sex,Birthday=@birthday,Phone=@phone,Address=@address,Level=@level Where UserID = @Account", con);
            cmd.Parameters.AddWithValue("@username", name.Text);
            cmd.Parameters.AddWithValue("@sex", sexvalue);
            if (date.Text == "")
            {
                cmd.Parameters.AddWithValue("@birthday", date.Text);
            }
            else
            {
                DateTime time = DateTime.Parse(date.Text);
                cmd.Parameters.AddWithValue("@birthday", time);
            }
            cmd.Parameters.AddWithValue("@phone", phone.Text);
            cmd.Parameters.AddWithValue("@email", mail.Text);
            cmd.Parameters.AddWithValue("@address", address.Text);
            cmd.Parameters.AddWithValue("@level", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@Account", id.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void b_clear_Click(object sender, EventArgs e)
        {
            name.Text = "";
            man.Checked = true;
            date.Text = "";
            phone.Text = "";
            mail.Text = "";
            address.Text = "";
        }
    }
}