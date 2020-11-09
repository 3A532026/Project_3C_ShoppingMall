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
    public partial class CategoryDetail1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["categoryid"];
            SqlDataSource1.SelectParameters["categoryid"].DefaultValue = Label1.Text;
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Category where categoryid = @categoryid", con);
                cmd.Parameters.AddWithValue("@categoryid", Label1.Text);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds, "Category");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        categ.Text = dr["category"].ToString();
                    }
                }
                else
                {
                }
                con.Close();
            }
        }
        protected void add_Click(object sender, EventArgs e)
        {
            string ca = categ.Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("update Category set category=@category where categoryid = @categoryid", con);
            SqlCommand cmds = new SqlCommand("update Products set category=@category where categoryid = @categoryid", con);
            cmd.Parameters.AddWithValue("@category", categ.Text);
            cmd.Parameters.AddWithValue("@categoryid", Label1.Text);
            cmds.Parameters.AddWithValue("@category", categ.Text);
            cmds.Parameters.AddWithValue("@categoryid", Label1.Text);
            cmd.ExecuteNonQuery();
            cmds.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            categ.Text = "";
        }
    }
}