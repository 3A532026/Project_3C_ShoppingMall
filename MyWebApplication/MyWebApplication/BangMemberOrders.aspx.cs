using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebApplication
{
    public partial class BangMemberOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
            SqlDataSource2.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
            SqlDataSource3.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
            SqlDataSource4.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = true;


        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*   if (DropDownList1.SelectedValue == "未出貨")
               {
                   //SqlDataSource1.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
                   GridView1.Enabled = true;
                   GridView2.Enabled = false;
                   GridView3.Enabled = false;
                   GridView4.Enabled = false;
               }
               else if (DropDownList1.SelectedValue == "已出貨")
               {
                  // SqlDataSource2.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
                   GridView1.Enabled = false;
                   GridView2.Enabled = true;
                   GridView3.Enabled = false;
                   GridView4.Enabled = false;
               }
               else if (DropDownList1.SelectedValue == "已結案")
               {
                  // SqlDataSource3.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
                   GridView1.Enabled = false;
                   GridView2.Enabled = false;
                   GridView3.Enabled = true;
                   GridView4.Enabled = false;
               }
               else
               {
                   SqlDataSource4.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
                   GridView1.Enabled = false;
                   GridView2.Enabled = false;
                   GridView3.Enabled = false;
                   GridView4.Enabled = true;
               }*/

          if (DropDownList1.SelectedValue == "未出貨")
          {
              //SqlDataSource1.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
              GridView1.Visible = true;
              GridView2.Visible = false;
              GridView3.Visible = false;
              GridView4.Visible = false;
          }
          else if (DropDownList1.SelectedValue == "已出貨")
          {
             // SqlDataSource2.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
              GridView1.Visible = false;
              GridView2.Visible = true;
              GridView3.Visible = false;
              GridView4.Visible = false;
                Response.Write("BangShop.aspx");
          }
          else if (DropDownList1.SelectedValue == "已結案")
          {
             // SqlDataSource3.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
              GridView1.Visible = false;
              GridView2.Visible = false;
              GridView3.Visible = true;
              GridView4.Visible = false;
          }
          else
          {
              //SqlDataSource4.SelectParameters["userid"].DefaultValue = Session["UserID"].ToString();
              GridView1.Visible = false;
              GridView2.Visible = false;
              GridView3.Visible = false;
              GridView4.Visible = true;
          }
        }
    }
}