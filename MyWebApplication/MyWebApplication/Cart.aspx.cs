using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebApplication
{
    public partial class Cart : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            string FilterStr = "";
            string[] TempStrArray ;
            foreach(string CItem in Request.Cookies)
            {
                if (CItem.StartsWith("Product_"))
                {
                    TempStrArray = CItem.Split('_');
                    if (FilterStr=="")
                    {
                        FilterStr = "WHERE [Productid]=" + TempStrArray[1].ToString();
                    }
                    else
                    {
                        FilterStr += "OR [Productid]=" + TempStrArray[1].ToString();
                    }
                }
            }
            if (FilterStr=="")
            {
                FilterStr = "WHERE [Productid]=0";
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
            }
            SqlDataSource1.SelectCommand += FilterStr;
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType==DataControlRowType.DataRow)
            {
                TextBox MyQty = (TextBox)e.Row.FindControl("Qty");
                MyQty.Text = Request.Cookies["Product_" + e.Row.Cells[0].Text].Value;
                int qty = int.Parse(MyQty.Text);
                double price = double.Parse(e.Row.Cells[2].Text);
                double sub = qty * price;
                e.Row.Cells[4].Text=sub.ToString();
            }
            else if (e.Row.RowType==DataControlRowType.Footer)
            {
                double totalp = 0;
                int totalq = 0;
                if (GridView1.Rows.Count>0)
                {
                    for (int i = 0; i <= GridView1.Rows.Count-1; i++)
                    {
                        TextBox MyQty = (TextBox)GridView1.Rows[i].FindControl("Qty");
                        totalq += int.Parse(MyQty.Text);
                        totalp += int.Parse(GridView1.Rows[i].Cells[4].Text);
                    }
                    e.Row.Cells[3].Text = totalq.ToString();
                    e.Row.Cells[4].Text = totalp.ToString();
                }
            }
        }

        protected void Qty_TextChanged(object sender, EventArgs e)
        {
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                TextBox MyQty = (TextBox)GridView1.Rows[i].FindControl("Qty");
                CheckBox IsDel = (CheckBox)GridView1.Rows[i].FindControl("Del");
                if (MyQty.Text == "0" || IsDel.Checked)
                {
                    Response.Cookies["Product_" + GridView1.Rows[i].Cells[0].Text].Expires = DateTime.Now.AddDays(-1);
                }
                else
                {
                    Response.Cookies["Product_" + GridView1.Rows[i].Cells[0].Text].Value = MyQty.Text;
                    Response.Cookies["Product_" + GridView1.Rows[i].Cells[0].Text].Expires = DateTime.Now.AddDays(30);
                }
            }
            Response.Redirect(Request.Url.ToString());
        }

        protected void Del_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                TextBox MyQty = (TextBox)GridView1.Rows[i].FindControl("Qty");
                CheckBox IsDel = (CheckBox)GridView1.Rows[i].FindControl("Del");
                if (MyQty.Text == "0" || IsDel.Checked)
                {
                    Response.Cookies["Product_" + GridView1.Rows[i].Cells[0].Text].Expires = DateTime.Now.AddDays(-1);
                }
                else
                {
                    Response.Cookies["Product_" + GridView1.Rows[i].Cells[0].Text].Value = MyQty.Text;
                    Response.Cookies["Product_" + GridView1.Rows[i].Cells[0].Text].Expires = DateTime.Now.AddDays(30);
                }
            }
            Response.Redirect(Request.Url.ToString());
        }
    }
}