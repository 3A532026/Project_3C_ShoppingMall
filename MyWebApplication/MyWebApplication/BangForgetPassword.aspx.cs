using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

public partial class BangForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        SqlConnection Bang = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        Bang.Open();
        SqlCommand sqlC = new SqlCommand("Select UserID,Password,UserName,Email,Status from Users " +
            "Where UserID=" + "'" + Request.Form["Account"] + "'" + "AND Email=" + "'" + Request.Form["Email"] + "'", Bang);
        SqlDataReader sqlD = sqlC.ExecuteReader();
        while (sqlD.Read())
        {
            if (sqlD["Status"].ToString() == "停用")
            {
                Response.Write("<script> alert ('帳戶已停用，請重新申請帳戶或連繫我們。');</script>");
            }
        

            if (!sqlD.HasRows || Request.Form["Email"].ToString() == "" || Request.Form["Account"].ToString() == "")
            {
                Response.Write("<script> alert ('輸入值可能有誤，或有欄位尚未填入。');</script>");

            }
            else
            {
                string str = Request.ServerVariables["Http_Host"];
                MailMessage msg = new MailMessage();
                msg.To.Add(new MailAddress(Request.Form["Email"]));
                msg.From = new MailAddress(Request.Form["Email"], "忘記密碼", System.Text.Encoding.UTF8);
                msg.Subject = "忘記密碼";
                msg.SubjectEncoding = System.Text.Encoding.UTF8;
                string body = string.Format("親愛的{0} 您好！" + "<br><br>" + "請點選網址變更您的密碼" + "http://localhost:12597/BangChangePassword.aspx", sqlD["UserName"]);
                msg.Body = body;
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;
                msg.Priority = MailPriority.Low;
                SmtpClient MySmtp = new SmtpClient("smtp.gmail.com",587);
                MySmtp.Credentials = new System.Net.NetworkCredential(sqlD["Email"].ToString(),sqlD["Password"].ToString());
                MySmtp.EnableSsl = true;
                MySmtp.Send(msg);
                Response.Write("<script> alert ('信件已發送，請盡速去收取。'); location.href='BangLogin.aspx';</script>");
            }
        }
        Bang.Close();
        sqlC.Cancel();
    }
}