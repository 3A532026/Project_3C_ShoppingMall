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
    public partial class PurchaseDetail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            productid.Text = Request.QueryString["Id"];
            SqlDataSource1.SelectParameters["Id"].DefaultValue=productid.Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from PurchaseOrderDetail where productid = @productid", con);
            cmd.Parameters.AddWithValue("@productid", productid.Text);
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            sda.SelectCommand = cmd;
            sda.Fill(ds, "PurchaseOrderDetail");
            if (ds.Tables[0].Rows.Count > 0)
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    purchaseid.Text = dr["purchaseid"].ToString();
                    
                }
            }
            SqlDataSource2.SelectParameters["purchaseid"].DefaultValue = purchaseid.Text;
            SqlDataSource3.SelectParameters["purchaseid"].DefaultValue = purchaseid.Text;
            con.Close();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int invetory = int.Parse(e.Row.Cells[5].Text);
                int stock = int.Parse(e.Row.Cells[6].Text);
                int qty = invetory - stock;
                e.Row.Cells[7].Text = qty.ToString();
                if (qty <= 0)
                {
                    e.Row.Cells[8].Text = "<span style='color:red;'>!</span>";
                }
            }
        }
    }
}