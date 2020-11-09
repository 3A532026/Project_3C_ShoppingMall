using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

namespace MyWebApplication
{
    public partial class Register : System.Web.UI.Page
    {
        DateTime time = DateTime.Now;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Yo\Desktop\MyWebApplication\MyWebApplication\App_Data\Database1.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            string date = time.ToString("yyyy-MM-dd HH:mm:ss");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Users(username,userid,password,email,jointime,status,level)values(@username,@userid,@password,@email,@jointime,@status,@level)", con);
            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@userid", id.Text);
            cmd.Parameters.AddWithValue("@password", psw.Text);
            cmd.Parameters.AddWithValue("@email", e_mail.Text);
            cmd.Parameters.AddWithValue("@jointime", time);
            cmd.Parameters.AddWithValue("@status", "使用中");
            cmd.Parameters.AddWithValue("@level", "會員");
            cmd.ExecuteNonQuery();

            string str = Request.ServerVariables["Http_Host"];
            MailMessage msg = new MailMessage();
            msg.To.Add(new MailAddress(e_mail.Text, username.Text));
            msg.From = new MailAddress("asdflkj13717421@gmail.com", "會員驗證", System.Text.Encoding.UTF8);
            msg.Subject = "會員驗證";
            msg.SubjectEncoding = System.Text.Encoding.UTF8;
            string body = string.Format("http://{0}/Login.aspx?" + "<br>"
                + "Hi,{1}" + "<br>"
                + "個人資料如下：" + "<br>"
                + "使用者帳號：{2}" + "<br>"
                + "密碼：{3}" + "<br>"
                , str, username.Text, id.Text, psw.Text);
            msg.Body = body;
            msg.IsBodyHtml = true;
            msg.BodyEncoding = System.Text.Encoding.UTF8;
            msg.Priority = MailPriority.Normal;
            SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);
            MySmtp.Credentials = new System.Net.NetworkCredential("asdflkj13717421@gmail.com", "fdsajkl314159268");
            MySmtp.EnableSsl = true;
            MySmtp.Send(msg);
            con.Close();

            Response.Redirect("SuccessMail.aspx");
        }
    }
}