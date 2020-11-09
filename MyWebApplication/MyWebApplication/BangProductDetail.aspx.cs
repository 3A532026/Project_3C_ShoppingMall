using System;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;

namespace MyWebApplication
{
    public partial class BangProductDetail : System.Web.UI.Page
    {
        public ArrayList productArray = new ArrayList();
        public String test = "";
        public string BB;

        protected void Page_Load(object sender, EventArgs e)
        {
           /*if (Session["Login"] == null)// 登入登出控制
            {
                Label3.Text = "登入";
            }
            else
            {
                Label3.Text = "登出";
            }
            */
            // Response.Write("<script> alert ('"+ Request.QueryString["ID"] + "')</script>");
            SqlConnection Bang = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
            Bang.Open();
            SqlCommand sqlC = new SqlCommand("Select Id,Name,Price,Picture,Store,Safety,ProductDetail from openjson(" +
                "(Select Id,Name, Price, Picture, Store, Safety, ProductDetail from Product" +
               " where Id =" + Request.QueryString["ID"] + "for json auto ))" +
                "with(Id int,Name nvarchar(max), Price int, Picture varchar(max), Store INT, Safety nchar(10), ProductDetail nvarchar(max))", Bang);

            SqlDataReader sdr = sqlC.ExecuteReader();

            while (true)
            {
                if (sdr.Read())
                {
                    Product p = new Product();
                    BB = sdr["Picture"].ToString();
                    p.setId(sdr.GetInt32(0));
                    p.setProductName(sdr.GetString(1));
                    p.setPrice(sdr.GetInt32(2));
                    p.setImage(sdr.GetString(3));
                    p.setStore(sdr.GetInt32(4));
                    p.setSafety(sdr.GetString(5));
                    p.setDetail(sdr.GetString(6));
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
            private int store;
            private String safety;
            private String detail;
            private int id;


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

            public void setStore(int store)
            {
                this.store = store;
            }
            public int getstore()
            {
                return store;
            }

            public void setSafety(String safety)
            {
                this.safety = safety;
            }
            public string getSafety()
            {
                return safety;
            }

            public void setDetail(String detail)
            {
                this.detail = detail;
            }
            public string getDetail()
            {
                return detail;
            }

            public void setId(int id)
            {
                this.id = id;
            }
            public int getId()
            {
                return id;
            }
        }

        public void check()//判斷購物車商品是否重複
        {
            SqlDataReader objDr;
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
            Conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT Count(*) as Q FROM Cart where Id=@ID", Conn);
            cmd.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
            objDr = cmd.ExecuteReader();
            if (objDr.HasRows)
            {
                while (objDr.Read())
                {
                    Session["Q"] = objDr["Q"].ToString();
                    if(Session["Q"].ToString() =="0")
                    {
                        AddCart();
                        Response.Cookies["Product_" + Request.QueryString["ID"]].Value = "1";
                    }
                    else
                    {
                        Response.Write("<Script Language = JavaScript> alert('已有同樣商品')</Script>");
                    }
                }
            }

        }

        public void AddCart()//加入購物車(語法)
        {
            
            //Label2.Text = Session["ProductID_" + 3].ToString();
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO Cart(Id,Name,Price,Purchaser)SELECT Id,Name,Price,@Account FROM Product where Id =@ID", Conn);
            cmd.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
            cmd.Parameters.AddWithValue("@Account", Session["UserID"].ToString());
            Conn.Open();
            cmd.ExecuteNonQuery();
            Conn.Close();
        }

        protected void BtnBuy_Click(object sender, EventArgs e)//加入購物車(button click)
        {
            check();                            
        }


    }
}