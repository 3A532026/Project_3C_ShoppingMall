using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace MyWebApplication
{
    public partial class GoodsDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
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