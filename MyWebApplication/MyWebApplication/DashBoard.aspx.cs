using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebApplication
{
    public partial class DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int Store = int.Parse(e.Row.Cells[6].Text);
                int Safety = int.Parse(e.Row.Cells[7].Text);
                int qty = Store - Safety;
                e.Row.Cells[8].Text = qty.ToString();
                if (qty <= 0)
                {
                    e.Row.Cells[9].Text = "<span style='color:red;'>!</span>";
                }
            }
        }
    }
}