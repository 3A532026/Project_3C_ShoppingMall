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
    public partial class BangConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LblName.Text = Session["Name"].ToString();
            LblEmail.Text = Session["Email"].ToString();
            LblPhone.Text = Session["Phone"].ToString();
            LblAddress.Text = Session["Address"].ToString();

            R_LblName.Text = Session["R_Name"].ToString();
            R_LblEmail.Text = Session["R_Email"].ToString();
            R_LblPhone.Text = Session["R_Phone"].ToString();
            R_LblAddress.Text = Session["R_Address"].ToString();

            LblPayment.Text = Session["LblPayment"].ToString();
            LblBranch.Text = Session["LblBranch"].ToString();
            Lb1Invoice.Text = Session["Lb1Invoice"].ToString();


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)//購物明細
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

      /*public void AddOrderInfo()
        {
            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();
            string date = DateTime.Now.Day.ToString();
            string h = DateTime.Now.Hour.ToString();
            string m = DateTime.Now.Minute.ToString();
            string s = DateTime.Now.Second.ToString();
            string orderid = year + month + date + h + m + s + Session["UserID"].ToString();
            string time =year+"/"+month+"/"+date;

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO Orders (orderid,status,deliver_status,total,name,email,phone,address, takename,takeemail,takephone,takeaddress,paytype,purchasedate,userid)" +
           "values("+"'"+ orderid +"'"+","+ "N'未付款'"+","+ "N'未出貨'"+","+"'100'"+","+ 
           "N'"+LblName.Text+"'"+","+"'"+ LblEmail.Text+ "'"+","+"'"+ LblPhone.Text+ "'"+","+"N'"+LblAddress.Text + "'"+","+
           "N'"+R_LblName.Text + "'"+","+"'"+R_LblEmail.Text + "'" +","+"'"+R_LblPhone.Text+ "'"+","+"N'"+R_LblAddress.Text + "'"+","+
           "'"+LblPayment.Text + "'"+","+"N'"+DateTime.Now+"'"+","+"'"+Session["UserID"]+"')", Conn);*/

            /*
            Response.Write("<script> alert ('"+orderid+"') </script>");
            Response.Write("<script> alert ('" + LblName.Text + "') </script>");
            Response.Write("<script> alert ('" + LblEmail.Text + "') </script>");
            Response.Write("<script> alert ('" + LblPhone.Text + "') </script>");
            Response.Write("<script> alert ('" + LblAddress.Text + "') </script>");
            Response.Write("<script> alert ('" + R_LblName.Text + "') </script>");
            Response.Write("<script> alert ('" + R_LblEmail.Text + "') </script>");
            Response.Write("<script> alert ('" + R_LblPhone.Text + "') </script>");
            Response.Write("<script> alert ('" + R_LblAddress.Text + "') </script>");
            Response.Write("<script> alert ('" + LblPayment.Text + "') </script>");
            Response.Write("<script> alert ('" + DateTime.Now + "') </script>");
            Response.Write("<script> alert ('" + Session["UserID"]  + "') </script>");
            */

            /* cmd.Parameters.AddWithValue("@OID", orderid.ToString());
             cmd.Parameters.AddWithValue("@Status","未付款");
             cmd.Parameters.AddWithValue("@D_Status","未出貨");
             cmd.Parameters.AddWithValue("@Total", "100");
             cmd.Parameters.AddWithValue("@Name",LblName.Text);
             cmd.Parameters.AddWithValue("@Email",LblEmail.Text);
             cmd.Parameters.AddWithValue("@Phone", LblPhone.Text);
             cmd.Parameters.AddWithValue("@Address",LblAddress.Text);

             cmd.Parameters.AddWithValue("@T_Name",R_LblName.Text);
             cmd.Parameters.AddWithValue("@T_Email",R_LblEmail.Text);
             cmd.Parameters.AddWithValue("@T_Phone",R_LblPhone.Text);
             cmd.Parameters.AddWithValue("@T_Address",R_LblAddress.Text);
             cmd.Parameters.AddWithValue("@PayType",LblPayment.Text);
             cmd.Parameters.AddWithValue("@PurchaseDate",DateTime.Now);
             cmd.Parameters.AddWithValue("@UID", Session["UserID"]);


             "values(@OID,@Status,@D_Status,@Total,@Name,@Email,@Phone,@Address," +
            "@T_Name,@T_Email,@T_Phone,@T_Address,@PayType,@PurchaseDate,@UID)"
            */

            /*
            "values(" + "'" + orderid.ToString() + "'" + "," + "N'未付款'" + "," + "N'未出貨'" + "," + "100" + "," +
           "N'" + LblName.Text.ToString() + "'" + "," + "'" + LblEmail.Text.ToString() + "'" + "," + "'" + LblPhone.Text.ToString() + "'" + "," + "N'" + LblAddress.Text.ToString() + "'" + "," +
           "N'" + R_LblName.Text.ToString() + "'" + "," + "'" + R_LblEmail.Text.ToString() + "'" + "," + "'" + R_LblPhone.Text.ToString() + "'" + "," + "N'" + R_LblAddress.Text.ToString() + "'" + "," +
           "'" + LblPayment.Text.ToString() + "'" + "," + "N'" + DateTime.Now + "'" + "," + "'" + Session["UserID"].ToString() + "'" + ")"
           */


        /*  Conn.Open();
            cmd.ExecuteNonQuery();
            Conn.Close();
           

         }*/

         protected void BtnSent_Click(object sender, EventArgs e)
         {
            // AddOrderInfo();


             string year = DateTime.Now.Year.ToString();
             string month = DateTime.Now.Month.ToString();
             string date = DateTime.Now.Day.ToString();
             string h = DateTime.Now.Hour.ToString();
             string m = DateTime.Now.Minute.ToString();
             string s = DateTime.Now.Second.ToString();
             string orderid = year + month + date + h + m + s + Session["UserID"].ToString();
             SqlDataSource2.InsertParameters["orderid"].DefaultValue = orderid;
             SqlDataSource2.InsertParameters["status"].DefaultValue = "未付款";
             SqlDataSource2.InsertParameters["deliver_status"].DefaultValue = "未出貨";
             SqlDataSource2.InsertParameters["total"].DefaultValue = total.Text;
             SqlDataSource2.InsertParameters["name"].DefaultValue = LblName.Text;
             SqlDataSource2.InsertParameters["email"].DefaultValue = LblEmail.Text;
             SqlDataSource2.InsertParameters["phone"].DefaultValue = LblPhone.Text;
             SqlDataSource2.InsertParameters["address"].DefaultValue = LblAddress.Text;
             SqlDataSource2.InsertParameters["takename"].DefaultValue = R_LblName.Text;
             SqlDataSource2.InsertParameters["takeemail"].DefaultValue = R_LblEmail.Text;
             SqlDataSource2.InsertParameters["takeaddress"].DefaultValue = R_LblEmail.Text;
             SqlDataSource2.InsertParameters["takephone"].DefaultValue = R_LblPhone.Text;
             SqlDataSource2.InsertParameters["paytype"].DefaultValue = LblPayment.Text;
             SqlDataSource2.InsertParameters["purchasedate"].DefaultValue = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
             SqlDataSource2.InsertParameters["userid"].DefaultValue = Session["UserID"].ToString();
             SqlDataSource2.Insert();
             SqlDataSource4.SelectParameters["orderid"].DefaultValue = orderid;
             SqlDataSource5.SelectParameters["orderid"].DefaultValue = orderid;
             string[] TempStrArray;
             SqlDataSource3.InsertParameters["orderid"].DefaultValue = orderid;
             foreach (string CItem in Request.Cookies)
             {
                 if (CItem.StartsWith("Product_"))
                 {
                     TempStrArray = CItem.Split('_');
                     SqlDataSource3.InsertParameters["productid"].DefaultValue = TempStrArray[1];
                     SqlDataSource3.InsertParameters["quantity"].DefaultValue = Request.Cookies["Product_" + TempStrArray[1]].Value;
                     SqlDataSource3.Insert();
                 }
             }
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                Response.Cookies["Product_" + GridView1.Rows[i].Cells[0].Text].Expires = DateTime.Now.AddDays(-1);
            }

            
            Response.Write("<script>alert('購買成功');location.href='BangPurchaseSuccessNotice.aspx';</script>");
         }

        public void Delete()
        {                    
          
        }
    }
}