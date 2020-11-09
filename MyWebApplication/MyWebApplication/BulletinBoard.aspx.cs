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
    public partial class BulletinBoard1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["Bulletinid"];
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from BulletinBoard where Bulletinid = @Bulletinid", con);
                cmd.Parameters.AddWithValue("@bulletinid", Label1.Text);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds, "BulletinBoard");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        bulletin.Text = dr["Bulletin"].ToString();
                        time.Text = dr["Time"].ToString();
                        userid.Text = dr["Userid"].ToString();
                        TextBox1.Text = dr["Content"].ToString();
                        DropDownList1.SelectedValue = dr["category"].ToString();
                    }
                }
                else
                {
                }
                con.Close();
            }
        }
        protected void addd_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update BulletinBoard set Bulletin=@Bulletin,Content=@Content,category=@category where Bulletinid = @Bulletinid", con);
            cmd.Parameters.AddWithValue("@Bulletin", bulletin.Text);
            cmd.Parameters.AddWithValue("@Content", TextBox1.Text);
            cmd.Parameters.AddWithValue("@category", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@Bulletinid", Label1.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void clearr_Click(object sender, EventArgs e)
        {
            bulletin.Text = "";
            TextBox1.Text = "";
        }
    }
}