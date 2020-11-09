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
    public partial class BangPurchaseSuccessNotice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStrings2"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Delete * from Cart where Purchase = @ID", Conn);
            cmd.Parameters.AddWithValue("@ID", Session["UserID"].ToString());

            Conn.Open();
            cmd.ExecuteNonQuery();
            Conn.Close();
        }
    }
}