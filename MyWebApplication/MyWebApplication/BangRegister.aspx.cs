using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class BangRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         
    }


    protected void Register_Click(object sender, EventArgs e)
    {
        if (Request.Form["UserID"]=="" || Request.Form["UserName"] == "" ||  Request.Form["Password"]==""
            || Request.Form["CheckPassword"] == "" || Request.Form["Sex"] == ""|| Request.Form["Birthday"] ==""
           || Request.Form["Phone"] == "" || Request.Form["E-mail"] == "" || Request.Form["Address"] == "" )
        {
            Response.Write("<script> alert ('有值尚未輸入，請重新填寫！') </script>");
        } 
        
        else
        {
            SqlConnection Bang = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
            Bang.Open();
              string bb = "Insert into Users (UserName,UserID,Password,Sex,Birthday,Phone,Email,Address,Status,Level)Values("              
               + "N'" + Request.Form["UserName"].ToString() + "',"
               + "N'"+ Request.Form["UserID"].ToString() +"'" + ","
               + "N'"+ Request.Form["Password"].ToString()+"'" + ","
               + "N'" + Request.Form["Sex"].ToString() + "',"
               + "N'" + Request.Form["Birthday"].ToString() + "',"
               + "N'"+Request.Form["Phone"].ToString() +"'" + ","
               + "N'"+ Request.Form["E-mail"].ToString()+"'" + ","
               + "N'" + Request.Form["Address"].ToString() + "',"
               + "N'"+ "使用中" + "',"
               + "N'"+ "會員"+ "')";
            SqlCommand sqlC = new SqlCommand(bb,Bang);
            sqlC.ExecuteNonQuery();            
            Response.Write("<script> alert('會員註冊成功，馬上去登入吧！');location.href='BangLogin.aspx';</script>");
            Bang.Close();
        }
    }
     

    protected void Clear_Click(object sender, EventArgs e)
    {
        Request.Form["UserID"] ="";
        Request.Form["UserName"] = "";
        Request.Form["Password"] = "";
        Request.Form["CheckPassword"] = "";
        Request.Form["Sex"] = "";
        Request.Form["Birthday"] = "";
        Request.Form["Phone"] = "";
        Request.Form["E-mail"] = "";
        Request.Form["Address"] = "";
    }
}