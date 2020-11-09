using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Web.Configuration;
using System.Text;
using System.Globalization;
using System.IO;
using System.Configuration;
namespace MyWebApplication
{
    public partial class BangBulletin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadBulletin();
            if (Session["Login"] == null)
            {
                Label1.Text = "登入";
            }
            else
            {
                Label1.Text = "登出";
            }
        }
        private void LoadBulletin()
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            Conn.Open();
            SqlCommand cmd = new SqlCommand("Select*From BulletinBoard", Conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
        }
    }
}