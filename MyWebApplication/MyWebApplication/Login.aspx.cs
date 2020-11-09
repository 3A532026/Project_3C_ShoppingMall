using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace MyWebApplication
{
    public partial class Login : System.Web.UI.Page
    {
        DateTime time = DateTime.Now;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string date = time.ToString("yyyy-MM-dd HH:mm:ss");
            SqlCommand cmds = new SqlCommand("Update Users set LastLoginTime=@lastlogintime where UserID = @Account and Password = @password", con);
            cmds.Parameters.AddWithValue("@lastlogintime", date);
            cmds.Parameters.AddWithValue("@Account", id.Text);
            cmds.Parameters.AddWithValue("@password", psw.Text);
            cmds.ExecuteNonQuery();
            con.Close();
        }

        protected void Btn_login_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Users where UserID = @Account and Password = @password", con);
            cmd.Parameters.AddWithValue("@Account", id.Text);
            cmd.Parameters.AddWithValue("@password", psw.Text);
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            sda.SelectCommand = cmd;
            sda.Fill(ds, "Users");

            if (ds.Tables[0].Rows.Count > 0)
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (dr["Status"].ToString() == "停用")
                    {
                        ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('使用者權限已被停止!!！');</script>");
                    }
                    else
                    {
                        //MasterPage
                        Session["IsLogined"] = "y";
                        Session["UserName"] = dr["Username"].ToString();
                        Session["level"] = dr["Level"].ToString();

                        //Membership,checkout
                        Session["id"] = id.Text;
                        Session["userno"] = dr["UserNo"].ToString();
                        Response.Redirect("Admin.aspx");
                    }
                } 
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('使用者帳號或密碼錯誤!!！');</script>");
            }
            con.Close();
        }
    }
}