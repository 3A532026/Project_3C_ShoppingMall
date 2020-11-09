using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Data.SqlClient;
using System.Data;


namespace MyWebApplication
{
    public partial class Checkout : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Yo\Desktop\MyWebApplication\MyWebApplication\App_Data\Database1.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userid = Session["id"].ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Users where Account = @Account", con);
                cmd.Parameters.AddWithValue("@Account", userid);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds, "Users");


                if (ds.Tables[0].Rows.Count > 0)
                {

                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        name.Text = dr["username"].ToString();
                        phone.Text = dr["phone"].ToString();
                        email.Text = dr["email"].ToString();
                        address.Text = dr["address"].ToString();
                    }

                }
                else
                {
                }
                con.Close();
            }
            MultiView1.ActiveViewIndex = 0;
            string FilterStr = "";
            string[] TempStrArray;
            foreach (string CItem in Request.Cookies)
            {
                if (CItem.StartsWith("Product_"))
                {
                    TempStrArray = CItem.Split('_');
                    if (FilterStr == "")
                    {
                        FilterStr = "WHERE [productid]=" + TempStrArray[1].ToString();
                    }
                    else
                    {
                        FilterStr += "OR [productid]=" + TempStrArray[1].ToString();
                    }
                }
            }
            if (FilterStr == "")
            {
                FilterStr = "WHERE [productid]=0";
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
            }
            SqlDataSource1.SelectCommand += FilterStr;
        }

        protected void GoToConfirm_Click(object sender, EventArgs e)
        {
            string paytype;
            if (RadioButton1.Checked == true)
            {
                paytype = "7-11取貨付款";
            }
            else
            {
                paytype = "宅配貨到付款";
            }
            if (Page.IsValid)
            {
                MultiView1.ActiveViewIndex = 1;
                Label1.Text = paytype;
                Label2.Text = takename.Text;
                Label4.Text = takephone.Text;
                Label5.Text = takeemail.Text;
                Label6.Text = takeaddress.Text;
            }
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string MyQty = Request.Cookies["Product_" + e.Row.Cells[0].Text].Value;
                int qty = int.Parse(MyQty);
                double price = double.Parse(e.Row.Cells[2].Text);
                double sub = qty * price;
                e.Row.Cells[3].Text = MyQty;
                e.Row.Cells[4].Text = sub.ToString();
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                double totalp = 0;
                int totalq = 0;
                if (GridView1.Rows.Count > 0)
                {
                    for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
                    {
                        totalq += int.Parse(GridView1.Rows[i].Cells[3].Text);
                        totalp += int.Parse(GridView1.Rows[i].Cells[4].Text);
                    }
                    e.Row.Cells[3].Text = totalq.ToString();
                    total.Text = totalp.ToString();
                    e.Row.Cells[4].Text = totalp.ToString();
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //'XX'型別 必須置於有 runat=server 的表單標記之中
        }

        protected void btn_checkout_Click(object sender, EventArgs e)
        {
            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();
            string date = DateTime.Now.Day.ToString();
            string h = DateTime.Now.Hour.ToString();
            string m = DateTime.Now.Minute.ToString();
            string s = DateTime.Now.Second.ToString();
            string orderid=year+month+date+h+m+s+ Session["userno"].ToString();
            SqlDataSource2.InsertParameters["orderid"].DefaultValue = orderid;
            SqlDataSource2.InsertParameters["status"].DefaultValue ="未付款";
            SqlDataSource2.InsertParameters["deliver_status"].DefaultValue = "未出貨";
            SqlDataSource2.InsertParameters["total"].DefaultValue = total.Text;
            SqlDataSource2.InsertParameters["name"].DefaultValue = name.Text;
            SqlDataSource2.InsertParameters["email"].DefaultValue = email.Text;
            SqlDataSource2.InsertParameters["phone"].DefaultValue = phone.Text;
            SqlDataSource2.InsertParameters["address"].DefaultValue = address.Text;
            SqlDataSource2.InsertParameters["takename"].DefaultValue = takename.Text;
            SqlDataSource2.InsertParameters["takeemail"].DefaultValue = takeemail.Text;
            SqlDataSource2.InsertParameters["takeaddress"].DefaultValue = takeaddress.Text;
            SqlDataSource2.InsertParameters["takephone"].DefaultValue = takephone.Text;
            SqlDataSource2.InsertParameters["paytype"].DefaultValue = Label1.Text;
            SqlDataSource2.InsertParameters["purchasedate"].DefaultValue = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            SqlDataSource2.InsertParameters["userid"].DefaultValue = Session["id"].ToString(); 
            SqlDataSource2.Insert();
            SqlDataSource4.SelectParameters["orderid"].DefaultValue = orderid;
            SqlDataSource5.SelectParameters["orderid"].DefaultValue = orderid;
            string[] TempStrArray;
            SqlDataSource3.InsertParameters["orderid"].DefaultValue =orderid;
            foreach (string CItem in Request.Cookies)
            {
                if (CItem.StartsWith("Product_"))
                {
                    TempStrArray = CItem.Split('_');
                    SqlDataSource3.InsertParameters["productid"].DefaultValue = TempStrArray[1];
                    SqlDataSource3.InsertParameters["quantity"].DefaultValue = Request.Cookies["Product_"+ TempStrArray[1]].Value;
                    SqlDataSource3.Insert();
                }
            }
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                Response.Cookies["Product_" + GridView1.Rows[i].Cells[0].Text].Expires = DateTime.Now.AddDays(-1);
            }
            using (StringWriter sw = new System.IO.StringWriter())
            {
                using(HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    GridView2.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    MailMessage msg = new MailMessage();
                    msg.To.Add(new MailAddress(takeemail.Text, takename.Text));
                    msg.From = new MailAddress("asdflkj13717421@gmail.com", "訂單確認", System.Text.Encoding.UTF8);
                    msg.Subject = "訂單確認";
                    msg.SubjectEncoding = System.Text.Encoding.UTF8;
                    string body = string.Format("收件人資訊" + "<br>"+"<hr/>" +"<br>"
                        + "姓名:{0}" + "<br>"
                        + "email:{1}" + "<br>"
                        + "付款方式:{2}" + "<br>"
                        + "收貨地點:{3}" + "<br>" + "<br>"
                        + "訂單明細:"+ "<br>" + "<hr/>" + "<br>"
                        + "訂單編號{4}" + "<br>"
                        + "{5}" + "<br>"
                        + "總額：{6}" + "<br>"
                        ,takename.Text , takeemail.Text, Label1.Text, takeaddress.Text, orderid, sw.ToString(), total.Text);
                    msg.Body = body;
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.UTF8;
                    msg.Priority = MailPriority.Normal;
                    SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);
                    MySmtp.Credentials = new System.Net.NetworkCredential("asdflkj13717421@gmail.com", "fdsajkl314159268");
                    MySmtp.EnableSsl = true;
                    MySmtp.Send(msg);
                }
            }
            MultiView1.ActiveViewIndex = 2;
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                takename.Text = name.Text;
                takephone.Text = phone.Text;
                takeemail.Text = email.Text;
                takeaddress.Text = address.Text;
            }
            
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                int qty = int.Parse(e.Row.Cells[2].Text);
                double price = double.Parse(e.Row.Cells[1].Text);
                double sub = qty * price;
                e.Row.Cells[3].Text = sub.ToString();
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                double totalp = 0;
                int totalq = 0;
                if (GridView2.Rows.Count > 0)
                {
                    for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
                    {
                        totalq += int.Parse(GridView2.Rows[i].Cells[2].Text);
                        totalp += int.Parse(GridView2.Rows[i].Cells[1].Text);
                    }
                    
                    e.Row.Cells[3].Text = totalp.ToString();
                }
            }
        }
    }
}