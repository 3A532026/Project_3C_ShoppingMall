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
    public partial class ProductDetail1 : System.Web.UI.Page
    {
        int length;
        byte[] pic;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            id.Text = Request.QueryString["Id"];
            SqlDataSource3.SelectParameters["Id"].DefaultValue = id.Text;
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Product where Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id.Text);
                SqlDataAdapter sda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sda.SelectCommand = cmd;
                sda.Fill(ds, "Product");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        productname.Text = dr["Name"].ToString();
                        safetystock.Text = dr["Safety"].ToString();
                        cost.Text = dr["cost"].ToString();
                        price.Text = dr["Price"].ToString();
                        TextBox1.Text = dr["ProductDetail"].ToString();
                    }
                }
                else
                {
                }
                con.Close();
            }
        }
        protected void bb_update_Click(object sender, EventArgs e)
        {
            string path = "~/image/";
            if (FileUpload1.HasFile)
            {
                path += FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(path));
                DataList1.DataBind();
            }
            else
            {

            }
            con.Open();
            length = FileUpload1.PostedFile.ContentLength;
            pic = new byte[length];
            FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
            SqlCommand cmd = new SqlCommand("update Product set Name=@Name,Categoryid=@Categoryid,Category=@Category,supplierid=@supplierid,supplier=@supplier,price=@price,safetystock=@safetystock,cost=@cost,img=@img,description=@description where productid = @productid", con);
            cmd.Parameters.AddWithValue("@productname", productname.Text);
            cmd.Parameters.AddWithValue("@categoryid", ddcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@category", ddcategory.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@supplierid", ddsupplier.SelectedValue);
            cmd.Parameters.AddWithValue("@supplier", ddsupplier.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@price", price.Text);
            cmd.Parameters.AddWithValue("@safetystock", safetystock.Text);
            cmd.Parameters.AddWithValue("@cost", cost.Text);
            cmd.Parameters.AddWithValue("@img", pic);
            cmd.Parameters.AddWithValue("@description", TextBox1.Text);
            cmd.Parameters.AddWithValue("@productid", id.Text);
            cmd.ExecuteNonQuery();
            DataList1.DataBind();
            con.Close();
        }

        protected void bb_clear_Click(object sender, EventArgs e)
        {
            productname.Text = "";
            price.Text = "";
            safetystock.Text = "";
            cost.Text = "";
            TextBox1.Text = "";
        }
    }
}