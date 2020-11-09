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
    public partial class BangBulletinDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Label3.Text = "登入";
            }
            else
            {
                Label3.Text = "登出";
            }

            string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string ID;
                ID = Request.QueryString["bulletinid"];
                SqlDataReader objDr;
                SqlCommand cmd = new SqlCommand("Select*from BulletinBoard where bulletinid = @BID", con);
                cmd.Parameters.AddWithValue("@BID", ID);
                con.Open();
                objDr = cmd.ExecuteReader();
                if (objDr.HasRows)
                {

                    while (objDr.Read())
                    {
                        Label2.Text = "<font-family:標楷體><h1>" + objDr["bulletin"] + "</h3></font><hr>" +
                                      "公告分類：<font color=red>" + objDr["category"] + "</font><br>" +
                                      "公告內容：<font color=blue>" + objDr["content"] + "</font><hr>";


                        //不要
                        /*Response.Write("<font-family:標楷體><h1>" + objDr["BTitle"] + "</h3></font><hr>");
                          Response.Write("公告分類：<font color=red>" + objDr["BClassification"] + "</font><br>");
                          Response.Write("公告內容：<font color=>" + objDr["Context"] + "</font><hr>");
                          Response.Write("<asp: bitton ID=Btn_Back runat=server Text=返回/>");*/

                    }
                }
                else
                {

                }
                objDr.Close();
                con.Close();
            }
        }

        protected void Btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("BangBulletin.aspx");
        }
    }
}
