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
    public partial class BangMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Response.Write("<script>alert('請先登入');location.href='BangLogin.aspx';</script>");
            }
            else
            {
                
            }
        }
    }
}