using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// step1 - set up your namespace
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2_database_members_lesson
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblpid.Text = Session["pid"].ToString();
                loadproduct();
            }
        }

        private void loadproduct()
        {
            // step2 create sql connection
            string connStr = ConfigurationManager.ConnectionStrings["Miaconstr"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            // step 3 create an sql command - SELECT, INSERT, UPDATE< DELETE
            string query = "SELECT * FROM Products WHERE pid=@pid";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@pid", Session["pid"].ToString());
            SqlDataReader reader = comm.ExecuteReader();
            if(reader.Read())
            {
                Lblname.Text = reader["name"].ToString();
                lbldescription.Text = reader["descriptopn"].ToString();
                lblprice.Text = reader["price"].ToString();
                imgproduct.ImageUrl = reader["image"].ToString();
                
            }
        }


        private void checkproduct()
        {
            if (Session["id"] != null) //force the user to sign in before going to cart
            {
                string strConn = ConfigurationManager.ConnectionStrings["miaConStr"].ConnectionString;
                SqlConnection conn = new SqlConnection(strConn);
                conn.Open();
                string query = "SELECT * FROM ShoppingCart " +
                "WHERE pid=@pid AND paymentStatus= 'pending' AND id=@id";
                SqlCommand comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@id", Session["id"].ToString());
                comm.Parameters.AddWithValue("@pid", Session["pid"].ToString());
                SqlDataReader reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    lblmassage.Text = "product exists!";
                    Session["qty"] = reader["qty"];
                    Response.Write(Session["qty"].ToString());
                    //get the qantity value
                    //your update table code goes here
                    Updateproduct();
                }
                else
                {
                    addtocart();
                }
            }
            else //force the user to sign in before going to cart
            {
                Response.Redirect("signin_form1.aspx");
            }
        }

        private void addtocart()
        {
            if (Session["id"] != null) //force the user to sign in before going to cart
            {
                string connStr = ConfigurationManager.ConnectionStrings["Miaconstr"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                string query = "INSERT INTO ShoppingCart(id, pid, price, qty, dtAdded, paymentStatus, deliveryStatus) " +
                    "VALUES(@id, @pid, @price, @qty, @dtAdded, @paymentStatus, @deliveryStatus)";

                SqlCommand comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@id", Session["id"].ToString());
                comm.Parameters.AddWithValue("@pid", Session["pid"].ToString());
                comm.Parameters.AddWithValue("@price", lblprice.Text);
                comm.Parameters.AddWithValue("@qty", txtquntity.Text);
                comm.Parameters.AddWithValue("@dtAdded", DateTime.Now.ToString());
                comm.Parameters.AddWithValue("@paymentStatus", "pending");
                comm.Parameters.AddWithValue("@deliveryStatus", "pending");
                int result = comm.ExecuteNonQuery();
                if (result > 0)
                {
                    lblmassage.Text = "Item added to cart!";
                }
            }
            else //force the user to sign in before going to cart
            {
                Response.Redirect("signin_form1.aspx");
            }
        }


        private void Updateproduct()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Miaconstr"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string query = "UPDATE ShoppingCart SET qty=@qty, dtAdded=@dtAdded " +
                "WHERE  id=@id AND pid=@pid AND paymentStatus='pending'";

            SqlCommand comm = new SqlCommand(query, conn);
            int qty = Int32.Parse(Session["qty"].ToString()) + Int32.Parse(txtquntity.Text);
            comm.Parameters.AddWithValue("@qty", qty.ToString());
            comm.Parameters.AddWithValue("@id", Session["id"].ToString());
            comm.Parameters.AddWithValue("@pid", Session["pid"].ToString());
            comm.Parameters.AddWithValue("@dtAdded", DateTime.Now.ToString());
            int result = comm.ExecuteNonQuery();
            if (result > 0)
            {
                lblmassage.Text = "Item has been UPDATED!";
                lblmassage.ForeColor = System.Drawing.Color.Green;
            }
            conn.Close();
        }

        protected void Btnaddtocart_Click(object sender, EventArgs e)
        {


            checkproduct();

        }
    }
}