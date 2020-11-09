using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class BangChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        SqlConnection Bang = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        Bang.Open();

        if (Request.Form["UserID"].ToString()=="" || Request.Form["NewPassword"].ToString() == "" || Request.Form["CheckPassword"].ToString() == "")
        {
            Response.Write("<script> alert ('有欄位值尚未輸入！'); </script>");
        }
        else if(Request.Form["NewPassword"].ToString() != Request.Form["CheckPassword"].ToString())
        {
            Response.Write("<script> alert ('新密碼與確認密碼不合，請重新輸入！'); </script>");
        }
        else
        {
            SqlCommand sqlC = new SqlCommand("Update Users Set Password=" + "'" + Request.Form["NewPassword"] + "'"
            +"Where UserID=" + "'" + Request.Form["UserID"] + "'" ,Bang);
            Response.Write("<script> alert ('密碼更改完成，現在去登入吧！');location.href='BangLogin.aspx'; </script>");
            sqlC.ExecuteNonQuery();
        }
        Bang.Close();
        
    }
}