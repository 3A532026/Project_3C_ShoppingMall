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
    public partial class BangLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (Request.Form["Acc"] == "" || Request.Form["Pass"] == "" || Request.Form["Ran"] == "")
            {
                Response.Write("<script>alert ('有值尚未填寫，請重新再填寫！') </script>");
            }
            else
            {
                SqlConnection Bang = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                Bang.Open();
                SqlCommand sqlC = new SqlCommand("Select * from Users where Account=" + "'" + Request.Form["Acc"] + "'"
                + "and password=" + "'" + Request.Form["Pass"] + "'", Bang);
                SqlDataReader SqlD = sqlC.ExecuteReader();

                if ((SqlD.HasRows) && (Request.Form["Ran"].ToUpper() == Session["randomStr"].ToString().ToUpper()))
                {
                    Session["UserID"] = Request.Form["Acc"].ToString();
                    Session["Login"] = "OK";
                    Response.Redirect("BangShop.aspx");
                }
                else
                {
                    Response.Write("<script> alert ('填的值有誤，請重新輸入！') </script>");

                    SqlD.Close();
                    Bang.Close();
                    sqlC.Cancel();
                }
            }
        }
    }
}
