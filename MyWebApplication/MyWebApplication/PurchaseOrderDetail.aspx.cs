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
    public partial class PurchaseOrderDetail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            purchaseid.Text = Request.QueryString["purchaseid"];
            SqlDataSource1.SelectParameters["purchaseid"].DefaultValue = purchaseid.Text;
            SqlDataSource2.SelectParameters["purchaseid"].DefaultValue = purchaseid.Text;
            if (!IsPostBack)
            {
                purchase_select();
                process_select();
            }
            else
            {
                purchase_select();
                process_select();
            }

        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            double t = 0;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label inv = (Label)e.Row.FindControl("inv");
                Label subinv = (Label)e.Row.FindControl("subinv");
                int cost = int.Parse(e.Row.Cells[2].Text);
                int qty = int.Parse(e.Row.Cells[3].Text);
                int sub = cost * qty;
                t += sub;
                e.Row.Cells[4].Text = sub.ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Product where Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", e.Row.Cells[0].Text);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds, "Product");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        inv.Text = dr["Store"].ToString();
                        
                    }
                }
                con.Close();
                int inventory = int.Parse(inv.Text);
                int subinventory = inventory + qty;
                subinv.Text = subinventory.ToString();
            }
        }
        private void purchase_select()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from PurchaseOrder where purchaseid = @purchaseid", con);
            cmd.Parameters.AddWithValue("@purchaseid", purchaseid.Text);
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            sda.SelectCommand = cmd;
            sda.Fill(ds, "PurchaseOrder");
            if (ds.Tables[0].Rows.Count > 0)
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    status.Text = dr["status"].ToString();
                    total.Text = dr["total"].ToString();

                }
            }
            con.Close();
        }
            private void process_select()
        {
            if (status.Text != "未收貨")
            {
                Button2.Visible = false;
            }
            else
            {
                Button2.Visible = true;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update PurchaseOrder set status=@status where purchaseid = @purchaseid", con);
            cmd.Parameters.AddWithValue("@status", "已收貨");
            cmd.Parameters.AddWithValue("@purchaseid", purchaseid.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
            {
                Label subinv = (Label)GridView2.Rows[i].FindControl("subinv");
                SqlDataSource3.UpdateParameters["Store"].DefaultValue = subinv.Text;
                SqlDataSource3.UpdateParameters["Id"].DefaultValue = GridView2.Rows[i].Cells[0].Text;
                SqlDataSource3.Update();
            }
            Response.Write("<script type='text/javascript'>alert('採購單編號" + purchaseid.Text + "已收貨!!');</script>");
            purchase_select();
            process_select();

        }
    }
}