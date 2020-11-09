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
    public partial class BangPaymentInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadUserInfo();//讀會員資料
        }

        public void LoadUserInfo()//讀會員資料
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select*from Users Where Account = @Account", Conn);
            SqlDataReader objDr;
            cmd.Parameters.AddWithValue("@Account", Session["UserID"].ToString());
            Conn.Open();
            objDr = cmd.ExecuteReader();
            if (objDr.HasRows)
            {
                while (objDr.Read())
                {
                    TbName.Text = objDr["Username"].ToString();
                    TbPhone.Text = objDr["Phone"].ToString();
                    TbEmail.Text = objDr["Email"].ToString();
                    TbAddress.Text = objDr["address"].ToString();
                }
            }         
            objDr.Close();
            Conn.Close();
        }

        protected void CBSynchronize_CheckedChanged(object sender, EventArgs e)//同步訂購人資訊到收貨人資訊
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select*from Users Where Account = @Account", Conn);
            SqlDataReader objDr;
            cmd.Parameters.AddWithValue("@Account", Session["UserID"].ToString());
            Conn.Open();
            objDr = cmd.ExecuteReader();
            if (objDr.HasRows)
            {
                while (objDr.Read())
                {
                    R_TbName.Text = objDr["Username"].ToString();
                    R_TbPhone.Text = objDr["Phone"].ToString();
                    R_TbEmail.Text = objDr["Email"].ToString();
                    R_TbAddress.Text = objDr["address"].ToString();
                }
            }     
            objDr.Close();
            Conn.Close();
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("BangCart.aspx");
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            Session["Name"] = TbName.Text;
            Session["Phone"] = TbPhone.Text;
            Session["Email"] = TbEmail.Text;
            Session["Address"] = TbAddress.Text;

            Session["R_Name"] = R_TbName.Text;
            Session["R_Phone"] = R_TbPhone.Text;
            Session["R_Email"] = R_TbEmail.Text;
            Session["R_Address"] = R_TbAddress.Text;

            Session["LblPayment"]= "超商付款";
            Session["LblBranch"] = "三重"; 
            Session["Lb1Invoice"] = "發票";

            Response.Redirect("BangConfirm.aspx");
        }
    }   
}