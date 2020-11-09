using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Web.Configuration;
using System.Text;
using System.Globalization;
using System.IO;
using System.Configuration;
using System.Collections;

namespace MyWebApplication
{
    public partial class BangShopSearch : System.Web.UI.Page
    {
        public ArrayList productArray = new ArrayList();
        public string BB;
        public new string ID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Label3.Text = "登入";
            }
            else
            {
                Label3.Text = "登出";
            }

            SqlConnection Bang = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
            Bang.Open();
            SqlCommand sqlC = new SqlCommand("Select Id,Name,Price,Picture from openjson(" +
            "(Select Id, Name, Price, Picture from Product" +
            " where NAME like N'%" + Request.QueryString["SearchKey"] + "%'" + "for json auto ))" +
            "with(Id int, Name nvarchar(max), Price int, Picture nvarchar(max))", Bang);

            SqlDataReader sdr = sqlC.ExecuteReader();
            string T3 = "style =" + '"' + "height: 300px; width: 270px; " + '"' + "alt = " + "沒圖片啦 />" + "</a>";
            while (true)
            {
                if (sdr.Read())
                {
                    Product p = new Product();
                    ID = sdr["Id"].ToString();
                    BB = sdr["Picture"].ToString();
                    p.setProductName("<a href =BangProductDetail.aspx?Id=" + ID + ">" + sdr.GetString(1) + "</a>");
                    p.setImage("<a href =BangProductDetail.aspx?Id=" + ID + ">" +
                    "<img src = " + '"' + "data:image/png;base64," + sdr.GetString(3) + '"' + T3);
                    p.setPrice(sdr.GetInt32(2));
                    productArray.Add(p);
                }
                else
                {
                    break;
                }
            }
            Bang.Close();
            sqlC.Dispose();
        }

        public class Product
        {
            private String productName;
            private int price;
            private String image;
            private String id;

            public void setImage(String image)
            {
                this.image = image;
            }
            public String getImage()
            {
                return this.image;
            }

            public void setProductName(String productName)
            {
                this.productName = productName;
            }
            public String getProductName()
            {
                return this.productName;
            }


            public void setPrice(int price)
            {
                this.price = price;
            }
            public int getPrice()
            {
                return this.price;
            }

            public void setId(string id)
            {
                this.id = id;
            }
            public string getId()
            {
                return this.id;
            }
        }
    }
}