using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebApplication
{
    public partial class Goods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory" && e.CommandArgument != null)
            {
                SqlDataSource2.SelectParameters["category"].DefaultValue = e.CommandArgument.ToString();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddtoCart")
            {
                string productid = e.CommandArgument.ToString();
                if (Request.Cookies["Product_" + productid] != null)
                {
                   
                }
                else
                {
                    Response.Cookies["Product_" + productid].Value = "1";
                    Response.Cookies["Product_" + productid].Expires = DateTime.Now.AddDays(30);
                }
            }
        }
    }
}