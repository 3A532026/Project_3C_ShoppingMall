using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebApplication
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (!IsPostBack)
            {
                if (Session["IsLogined"] == null)
                {
                    login.NavigateUrl = "~/Login.aspx";
                    cart.NavigateUrl = "~/Login.aspx";
                }
                else
                {
                    
                    login.Text = Session["UserName"].ToString();

                    if(Session["level"].ToString() == "管理員")
                    {
                        login.NavigateUrl = "~/Admin.aspx";
                        cart.Visible = false;
                    }
                    else
                    {
                        login.NavigateUrl = "~/Membership.aspx";
                        cart.NavigateUrl = "~/Cart.aspx";
                    }
                }
            }
        }
    }
}