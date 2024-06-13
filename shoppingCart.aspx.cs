using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2_database_members_lesson
{
    public partial class shoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // Session["id"] = 4; //this is for debugging purposes,
            grandTotal();
            if(Session["id"]== null)
            {
                Response.Redirect("signin.aspx");
            }


        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "update")
            {
                Label scid = e.Item.FindControl("scidLabel1") as Label;
                TextBox qty = e.Item.FindControl("TextBox1") as TextBox;
                Response.Write(qty.Text);
                string connStr = ConfigurationManager.ConnectionStrings["miaConStr"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                string query = "UPDATE ShoppingCart SET qty=@qty WHERE SCID=@SCID";
                SqlCommand comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@scid", scid.Text);
                comm.Parameters.AddWithValue("@qty", qty.Text);
                int result = comm.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("item has been Updated in shopping cart");
                }
                Response.Redirect("shoppingCart.aspx");
                conn.Close();
            }

            if(e.CommandName == "delete")
            {
                Label scid = e.Item.FindControl("scidLabel1") as Label;
                Response.Write(scid.Text);
                string connStr = ConfigurationManager.ConnectionStrings["miaConStr"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                string query = "DELETE FROM ShoppingCart WHERE SCID=@SCID";
                SqlCommand comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@scid", scid.Text);
                int result = comm.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("item has been Deleted in shopping cart");
                }
                Response.Redirect("shoppingCart.aspx");
                conn.Close();
            }
        }

 
        private void grandTotal()
        {
            string connStr = ConfigurationManager.ConnectionStrings["miaConStr"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string query = "SELECT sum(subtotal) AS grand_total  FROM( " +
                            "SELECT sc.qty * sc.price as subtotal " +
                            "FROM Products p, ShoppingCart sc " +
                             "WHERE p.pId = SC.pid AND sc.id = @id " +
                            "AND SC.paymentStatus = 'pending' AND sc.deliveryStatus = 'pending') as subquery";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@id", Session["id"].ToString());
            object result = comm.ExecuteScalar(); //this will just retrive 1 value
            decimal grandTotal;
            if (result != null && decimal.TryParse(result.ToString(), out grandTotal))
            {
                lblGrandToal.Text = grandTotal.ToString("C");
            }
            else
            {
                lblGrandToal.Text = "Grand totoal: 0.0";
            }
            //Response.Redirect("shoppingCart.aspx");
            conn.Close();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnpay_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("Checkout.aspx");
        }
    }
}