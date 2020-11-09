using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;

namespace MyWebApplication
{
    public partial class Purchase : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!Page.IsPostBack)
            {
                process_select();
            }
            else
            {
                process_select();
            }
        }
        private void process_select()
        {
            con.Open();
            System.Data.DataSet ds = new System.Data.DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * From Product WHERE (Id Like '%'+@search+'%') OR (Name Like '%'+@search+'%') OR (Category Like '%'+@search+'%') OR (Store Like '%'+@search+'%') OR (Safety Like '%'+@search+'%') Order by (CASE WHEN (Store<=Safety) THEN 0 WHEN NOT(Store<=Safety) THEN 1 ELSE NULL END)", con);
            cmd.Parameters.AddWithValue("@search", TextBox2.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.CommandTimeout = 1000;
            sda.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int invetory = int.Parse(e.Row.Cells[6].Text);
                int stock = int.Parse(e.Row.Cells[7].Text);
                int qty = invetory - stock;
                e.Row.Cells[8].Text = qty.ToString();
                if (qty <= 0)
                {
                    e.Row.Cells[9].Text = "<span style='color:red;'>!</span>";
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox2.Text + "</span>";

                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 0; i <= 7; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox2.Text, highlight);
                    }
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                process_select();
            }
            else
            {
                string highlight = "<span style='color:red;'>" + TextBox2.Text + "</span>";
                foreach (GridViewRow row in GridView1.Rows)
                {
                    for (int i = 0; i <= 7; i++)
                    {
                        row.Cells[i].Text = row.Cells[i].Text.Replace(TextBox2.Text, highlight);
                    }
                }
            }
        }
    }
}