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

    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblGrandTotal.Text = Session
            //Session["id"] = 4; //this is for debugging purposes,
            grandTotal();
            if (Session["id"] == null)
            {
                Response.Redirect("signin.aspx");
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

        protected void btnpayment_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["miaConStr"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            string query = "UPDATE ShoppingCart SET paymentStatus= 'paid', dtAdded=@dtAdded " +
                "WHERE id=@id AND deliveryStatus='pending'";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@dtAdded", DateTime.Now.ToString());
            comm.Parameters.AddWithValue("@id", Session["id"].ToString());
            comm.ExecuteNonQuery();
            conn.Close();
            Response.AddHeader("REFRESH", "1;URL=thankyou.aspx");
        }
    }
}