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
using System.Collections;


namespace MyWebApplication
{
    public partial class BangMemberEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = "bean";
            if (!IsPostBack)
            {
                LoadInformation();
            }
        }

        public void LoadInformation()//讀會員資料
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select * from Users Where Account = @ID", Conn);
            SqlDataReader objDr;
            cmd.Parameters.AddWithValue("@ID", Session["UserID"].ToString());
            Conn.Open();
            objDr = cmd.ExecuteReader();
            if (objDr.HasRows)
            {
                while (objDr.Read())
                {
                    TxtName.Text = objDr["username"].ToString();
                    TxtPhone.Text = objDr["phone"].ToString();
                    TxtEmail.Text = objDr["email"].ToString();
                    TxtAddress.Text = objDr["address"].ToString();
                    TxtAccount.Text = objDr["Account"].ToString();
                    TxtBirthday.Text = objDr["birthday"].ToString();

                }
            }
            else
            {

            }
            objDr.Close();
            Conn.Close();
        }

      

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            string cmdst = "UPDATE Users SET username= @Name,phone=@Phone,email=@Email,address= @Address WHERE  Account = @ID";
            SqlCommand cmd = new SqlCommand(cmdst, Conn);
            cmd.Parameters.AddWithValue("@ID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Name", TxtName.Text);
            cmd.Parameters.AddWithValue("@Email", TxtEmail.Text);
            cmd.Parameters.AddWithValue("@Phone", TxtPhone.Text);
            cmd.Parameters.AddWithValue("@Address", TxtAddress.Text);
            Conn.Open();
            cmd.ExecuteNonQuery();
            Conn.Close();
            Response.Write("<script>alert(\"修改成功!\");location.href='BangMemberEdit.aspx';</script>");
        }
    }
}
