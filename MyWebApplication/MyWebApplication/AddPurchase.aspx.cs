using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MyWebApplication
{
    public partial class AddPurchase1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (IsPostBack)
            {
                string FilterStr = "";
                string[] TempStrArray = null;
                foreach (string CItem in Request.Cookies)
                {
                    if (CItem.StartsWith("Purchase_"))
                    {
                        TempStrArray = CItem.Split('_');
                        if (FilterStr == "")
                        {
                            FilterStr = " WHERE [Id]=" + TempStrArray[1].ToString();
                        }
                        else
                        {
                            FilterStr += " OR [Id]=" + TempStrArray[1].ToString();
                        }
                    }
                }
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
                for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
                {
                    productid.Text = GridView2.Rows[i].Cells[1].Text;
                    Response.Cookies["Purchase_" + productid.Text].Expires = DateTime.Now.AddDays(-1);
                }
            }
            
        }
            protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                LinkButton sup = (LinkButton)((Control)e.CommandSource).FindControl("LinkButton1");
                if (supplierid.Text == "")
                {
                    supplierid.Text = e.CommandArgument.ToString();
                    Label1.Text = supplierid.Text;
                    supplier.Text = sup.Text;
                    Label2.Text = supplier.Text;
                    GridView1.DataBind();
                    MultiView1.ActiveViewIndex = 1;
                    SqlDataSource2.SelectParameters["Supplierid"].DefaultValue = supplierid.Text;
                }
                else
                {
                    if (supplierid.Text == e.CommandArgument.ToString())
                    {
                        MultiView1.ActiveViewIndex = 1;
                    }
                    else
                    {
                        Response.Write("<script type='text/javascript'>alert('將進貨供應商" + supplier.Text + "更換成" + sup.Text + "!!');</script>");
                        supplierid.Text = e.CommandArgument.ToString();
                        Label1.Text = supplierid.Text;
                        supplier.Text = sup.Text;
                        Label2.Text = supplier.Text;
                        GridView1.DataBind();
                        MultiView1.ActiveViewIndex = 1;
                        SqlDataSource2.SelectParameters["Supplierid"].DefaultValue = supplierid.Text;
                        for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
                        {
                            productid.Text = GridView2.Rows[i].Cells[1].Text;
                            Response.Cookies["Purchase_" + productid.Text].Expires = DateTime.Now.AddDays(-1);
                        }
                    }
                }
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int invetory = int.Parse(e.Row.Cells[4].Text);
                int stock = int.Parse(e.Row.Cells[5].Text);
                int qty = invetory - stock;
                e.Row.Cells[6].Text = qty.ToString();
                if (qty <= 0)
                {
                    e.Row.Cells[7].Text = "<span style='color:red;'>!</span>";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string FilterStr = "";
            string[] TempStrArray = null;
            foreach (string CItem in Request.Cookies)
            {
                if (CItem.StartsWith("Purchase_"))
                {
                    TempStrArray = CItem.Split('_');
                    if (FilterStr == "")
                    {
                        FilterStr = " WHERE [Id]=" + TempStrArray[1].ToString();
                    }
                    else
                    {
                        FilterStr += " OR [Id]=" + TempStrArray[1].ToString();
                    }
                }
            }
            if (FilterStr == "")
            {
                FilterStr = " WHERE [Id]=0";
                Response.Write("<script type='text/javascript'>alert('至少選擇一項進貨產品!!');</script>");
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                MultiView1.ActiveViewIndex = 2;
            }
            SqlDataSource3.SelectCommand += FilterStr;
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            double t = 0;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox p = (TextBox)e.Row.FindControl("p");
                TextBox q = (TextBox)e.Row.FindControl("q");
                if (p.Text == "")
                {
                    p.Text = "0";
                }
                if (q.Text == "")
                {
                    q.Text = "0";
                }
                int cost = int.Parse(p.Text);
                int qty = int.Parse(q.Text);
                int sub = cost * qty;
                t += sub;
                e.Row.Cells[5].Text = sub.ToString();
            }
            total.Text = t.ToString();
        }

        protected void P_TextChanged(object sender, EventArgs e)
        {
            double t = 0;
            for (int i = 0; i <= GridView3.Rows.Count - 1; i++)
            {
                TextBox p = (TextBox)GridView3.Rows[i].FindControl("p");
                TextBox q = (TextBox)GridView3.Rows[i].FindControl("q");
                if (p.Text == "")
                {
                    p.Text = "0";
                }
                if (q.Text == "")
                {
                    q.Text = "0";
                }
                int cost = int.Parse(p.Text);
                int qty = int.Parse(q.Text);
                int sub = cost * qty;
                t += sub;
                GridView3.Rows[i].Cells[5].Text = sub.ToString();
            }
            total.Text = t.ToString();
        }
        protected void Q_TextChanged(object sender, EventArgs e)
        {
            double t = 0;
            for (int i = 0; i <= GridView3.Rows.Count - 1; i++)
            {
                TextBox p = (TextBox)GridView3.Rows[i].FindControl("p");
                TextBox q = (TextBox)GridView3.Rows[i].FindControl("q");
                if (p.Text == "")
                {
                    p.Text = "0";
                }
                if (q.Text == "")
                {
                    q.Text = "0";
                }
                int cost = int.Parse(p.Text);
                int qty = int.Parse(q.Text);
                int sub = cost * qty;
                t += sub;
                GridView3.Rows[i].Cells[5].Text = sub.ToString();
            }
            total.Text = t.ToString();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            
            string purchaseid = "po" + DateTime.Now.ToString("yyyyMMddHHmmss");
            SqlDataSource4.InsertParameters["Purchaseid"].DefaultValue = purchaseid;
            SqlDataSource4.InsertParameters["Supplierid"].DefaultValue = supplierid.Text;
            SqlDataSource4.InsertParameters["Supplier"].DefaultValue = supplier.Text;
            SqlDataSource4.InsertParameters["userid"].DefaultValue = Session["id"].ToString();
            SqlDataSource4.InsertParameters["Date"].DefaultValue = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            SqlDataSource4.InsertParameters["Total"].DefaultValue = total.Text;
            SqlDataSource4.InsertParameters["Status"].DefaultValue = "未收貨";
            SqlDataSource4.Insert();

            for (int i = 0; i <= GridView3.Rows.Count - 1; i++)
            {

                TextBox p = (TextBox)GridView3.Rows[i].FindControl("p");
                TextBox q = (TextBox)GridView3.Rows[i].FindControl("q");
                SqlDataSource5.InsertParameters["Purchaseid"].DefaultValue = purchaseid;
                SqlDataSource5.InsertParameters["Productid"].DefaultValue = GridView3.Rows[i].Cells[0].Text;
                SqlDataSource5.InsertParameters["Product"].DefaultValue = GridView3.Rows[i].Cells[1].Text;
                SqlDataSource5.InsertParameters["Cost"].DefaultValue = p.Text;
                SqlDataSource5.InsertParameters["Quantity"].DefaultValue = q.Text;

                SqlDataSource5.Insert();
            }
            SqlDataSource6.SelectParameters["Purchaseid"].DefaultValue = purchaseid;
            SqlDataSource7.SelectParameters["Purchaseid"].DefaultValue = purchaseid;
            MultiView1.ActiveViewIndex = 3;
        }

        protected void Chose_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
            {
                CheckBox IsChosed = (CheckBox)GridView2.Rows[i].FindControl("chose");
                productid.Text = GridView2.Rows[i].Cells[1].Text;
                if (IsChosed.Checked == true)
                {
                    if (Request.Cookies["Purchase_" + productid.Text] != null)
                    {
                    }
                    else
                    {
                        Response.Cookies["Purchase_" + productid.Text].Value = "1";
                        Response.Cookies["Purchase_" + productid.Text].Expires = DateTime.Now.AddDays(30);
                    }
                }
                if (IsChosed.Checked == false)
                {
                    if (Request.Cookies["Purchase_" + productid.Text] != null)
                    {
                        Response.Cookies["Purchase_" + productid.Text].Expires = DateTime.Now.AddDays(-1);
                    }
                }
            }
        }
    }
}