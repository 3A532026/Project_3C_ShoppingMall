using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Configuration;

namespace MyWebApplication
{
    public partial class MissPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Random Rnd = new Random();
            string num1 = Rnd.Next(0, 9).ToString();
            string num2 = Rnd.Next(0, 9).ToString();
            string num3 = Rnd.Next(0, 9).ToString();
            string num4 = Rnd.Next(0, 9).ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("update Users set password=@password where userid = @userid and email = @email", con);
            cmd.Parameters.AddWithValue("@password", num1+num2+num3+num4);
            cmd.Parameters.AddWithValue("@userid", id.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.ExecuteNonQuery();
            string str = Request.ServerVariables["Http_Host"];
            MailMessage msg = new MailMessage();
            msg.To.Add(new MailAddress(email.Text, id.Text));
            msg.From = new MailAddress("asdflkj13717421@gmail.com", "會員密碼", System.Text.Encoding.UTF8);
            msg.Subject = "會員密碼";
            msg.SubjectEncoding = System.Text.Encoding.UTF8;
            string body = string.Format("http://{0}/Login.aspx?" + "<br>"
            + "Hi,{1}" + "<br>"
            + "新密碼如下：" + "<br>"
            + "新密碼：{2}" + "<br>"
            , str, id.Text, num1 + num2 + num3 + num4);
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