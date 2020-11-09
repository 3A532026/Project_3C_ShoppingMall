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
    public partial class SupplierDetail1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Request.QueryString["supplierid"];
            SqlDataSource1.SelectParameters["supplierid"].DefaultValue = Label2.Text;
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Supplier where supplierid = @supplierid", con);
                cmd.Parameters.AddWithValue("@supplierid", Label2.Text);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds, "Supplier");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        supplier.Text = dr["supplier"].ToString();
                        phone.Text = dr["phone"].ToString();
                        email.Text = dr["email"].ToString();
                        address.Text = dr["address"].ToString();
                    }
                }
                else
                {
                }
                con.Close();
            }
        }
        protected void update_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update Supplier set supplier=@supplier,phone=@phone,email=@email,address=@address where supplierid = @supplierid", con);
            SqlCommand cmds = new SqlCommand("update Product set supplier=@supplier where supplierid = @supplierid", con);
            cmd.Parameters.AddWithValue("@supplier", supplier.Text);
            cmd.Parameters.AddWithValue("@phone", phone.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@address", address.Text);
            cmd.Parameters.AddWithValue("@supplierid", Label2.Text);
            cmds.Parameters.AddWithValue("@supplier", supplier.Text);
            cmds.Parameters.AddWithValue("@supplierid", Label2.Text);
            cmd.ExecuteNonQuery();
            cmds.ExecuteNonQuery();
            GridView1.DataBind();
            con.Close();
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            supplier.Text = "";
            phone.Text = "";
            email.Text = "";
            address.Text = "";
        }
    }
}