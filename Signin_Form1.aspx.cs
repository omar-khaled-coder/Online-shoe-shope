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
    public partial class Signin_form1aspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsignin_Click(object sender, EventArgs e)
        {
            // step2 create sql connection
            string connStr = ConfigurationManager.ConnectionStrings["Miaconstr"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            // step 3 create an sql command - SELECT, INSERT, UPDATE< DELETE
            string query = "SELECT * FROM Members WHERE email=@email AND password=@password";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@email" , Txtemail.Text.Trim());
            comm.Parameters.AddWithValue("@password", Txtpassword.Text.Trim());
            // "pasword123" = "password123 "
            // step4 - create a reader
            SqlDataReader reader = comm.ExecuteReader();
            // step 5 - manipulate the reader /data
            if(reader.Read())
            {
                Response.Write("record found");
                //create sessions = globle varibles that cna be accesseed in any page
                Session["id"] = reader["id"].ToString();
                Session["fullname"] = reader["First_name"].ToString() + " " + reader["Last_Name"].ToString();
                // peter parker
                Response.Write(Session["fullname"].ToString());
                
                Session["first_name"] = reader["First_name"];
                Session["last_name"] = reader["Last_name"];
                Session["email"] = reader["email"];


                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("Record Not Found");
            }
            // step 6 close the connection
            conn.Close();
        }
    }
}