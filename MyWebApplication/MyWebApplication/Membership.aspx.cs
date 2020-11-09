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
    public partial class Membership : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["userid"].DefaultValue = Session["id"].ToString();
            SqlDataSource2.SelectParameters["userid"].DefaultValue = Session["id"].ToString();
            SqlDataSource3.SelectParameters["userid"].DefaultValue = Session["id"].ToString();
            userid.Text = Session["id"].ToString();
            id.Text = Session["id"].ToString();
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Users where Account = @Account", con);
                cmd.Parameters.AddWithValue("@Account", userid.Text);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds, "Users");
                if (ds.Tables[0].Rows.Count > 0)
                {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                    {
                    name.Text = dr["username"].ToString();
                    date.Text = dr["birthday"].ToString();
                    phone.Text = dr["phone"].ToString();
                    mail.Text = dr["email"].ToString();
                    address.Text = dr["address"].ToString();
                    }
                }
                else
                {
                }
            con.Close();
            }
        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            DateTime time = DateTime.Parse(date.Text);
            string sexvalue;
            if (man.Checked)
            {
                sexvalue = "男";
            }
            else
            {
                sexvalue = "女";
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("update Users set username=@username,email=@email,sex=@sex,birthday=@birthday,phone=@phone,address=@address where Account = @Account", con);
            cmd.Parameters.AddWithValue("@username", name.Text);
            cmd.Parameters.AddWithValue("@sex", sexvalue);
            cmd.Parameters.AddWithValue("@birthday", time);
            cmd.Parameters.AddWithValue("@phone", phone.Text);
            cmd.Parameters.AddWithValue("@email", mail.Text);
            cmd.Parameters.AddWithValue("@address", address.Text);
            cmd.Parameters.AddWithValue("@Account", userid.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            name.Text = "";
            man.Checked = true;
            date.Text = "";
            phone.Text = "";
            mail.Text = "";
            address.Text = "";
        }

        protected void update_psw_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update Users set password=@password where Account = @Account", con);
            cmd.Parameters.AddWithValue("@password", psw.Text);
            cmd.Parameters.AddWithValue("@Account", userid.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}