using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MyWebApplication
{
    public partial class OrderdetailAdmin1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            orderid.Text = Request.QueryString["orderid"];
            SqlDataSource1.SelectParameters["orderid"].DefaultValue = orderid.Text;
            if (!IsPostBack)
            {
                Order_select();
                Process_select();
            }
            else
            {
                Order_select();
                Process_select();
            }
        }
        private void Order_select()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [Orders] where orderid = @orderid", con);
            cmd.Parameters.AddWithValue("@orderid", orderid.Text);
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            sda.SelectCommand = cmd;
            sda.Fill(ds, "[Orders]");
            if (ds.Tables[0].Rows.Count > 0)
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    purchasedate.Text = dr["purchasedate"].ToString();
                    paytype.Text = dr["paytype"].ToString();
                    userid.Text = dr["userid"].ToString();
                    name.Text = dr["name"].ToString();
                    phone.Text = dr["phone"].ToString();
                    email.Text = dr["email"].ToString();
                    address.Text = dr["address"].ToString();
                    takename.Text = dr["takename"].ToString();
                    takephone.Text = dr["takephone"].ToString();
                    takeemail.Text = dr["takeemail"].ToString();
                    takeaddress.Text = dr["takeaddress"].ToString();
                    total.Text = dr["total"].ToString();
                    status.Text = dr["status"].ToString();
                    deliver_status.Text = dr["deliver_status"].ToString();
                }
            }
            con.Close();
        }
        private void Process_select()
        {
            if (deliver_status.Text == "未出貨")
            {
                Image1.ImageUrl = "~/image/圖片1.png";
                btn1.Visible = true;
            }
            else if (deliver_status.Text == "已出貨")
            {
                Image1.ImageUrl = "~/image/圖片2.png";
                if (status.Text == "未付款")
                {
                    btn2.Visible = true;
                }
                else
                {
                    btn3.Visible = true;
                }
                
            }
            else
            {
                Image1.ImageUrl = "~/image/圖片3.png";
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label inv = (Label)e.Row.FindControl("inv");
                Label subinv = (Label)e.Row.FindControl("subinv");
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Product", con);
                cmd.Parameters.AddWithValue("@Id", e.Row.Cells[0].Text);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds,"Product");
                
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                       
                        e.Row.Cells[1].Text = dr["Name"].ToString();
                        e.Row.Cells[2].Text = dr["Price"].ToString();
                        int pri = int.Parse(e.Row.Cells[2].Text);
                        int qty = int.Parse(e.Row.Cells[3].Text);
                        int sub = pri * qty;
                        e.Row.Cells[4].Text = sub.ToString();
                        inv.Text = dr["Store"].ToString();
                        int inventory= int.Parse(inv.Text);
                        int last = inventory - qty;
                        subinv.Text = last.ToString();
                    }
                }
                con.Close();
            }
        }

        protected void Btn1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update [Orders] set deliver_status=@deliver_status where orderid = @orderid", con);
            cmd.Parameters.AddWithValue("@deliver_status", "已出貨");
            cmd.Parameters.AddWithValue("@orderid", orderid.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                Label subinv = (Label)GridView1.Rows[i].FindControl("subinv");
                SqlDataSource2.UpdateParameters["Store"].DefaultValue = subinv.Text;
                SqlDataSource2.UpdateParameters["Id"].DefaultValue = GridView1.Rows[i].Cells[0].Text;
                SqlDataSource2.Update();
            }
            Response.Write("<script type='text/javascript'>alert('訂單編號" + orderid.Text + "已出貨!!');</script>");
            btn1.Visible = false;
            Process_select();
        }

        protected void Btn2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update [Orders] set status=@status where orderid = @orderid", con);
            cmd.Parameters.AddWithValue("@status", "已付款");
            cmd.Parameters.AddWithValue("@orderid", orderid.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script type='text/javascript'>alert('訂單編號" + orderid.Text + "已付款!!');</script>");
            btn2.Visible = false;
            Process_select();
        }

        protected void Btn3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update [Orders] set deliver_status=@deliver_status where orderid = @orderid", con);
            cmd.Parameters.AddWithValue("@deliver_status", "已結案");
            cmd.Parameters.AddWithValue("@orderid", orderid.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script type='text/javascript'>alert('訂單編號" + orderid.Text + "已結案!!');</script>");
            btn3.Visible = false;
            Process_select();
        }
    }
}