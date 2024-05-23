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
    public partial class ManageDelivery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                DropDownList dl = e.Item.FindControl("DropdownList1") as DropDownList;
                Label id = e.Item.FindControl("idlabel") as Label;
                string connStr = ConfigurationManager.ConnectionStrings["miaConStr"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                string query = "UPDATE ShoppingCart SET deliveryStatus=@deliveryStatus " +
                                "WHERE id=@id AND paymentStatus='paid' ";
                SqlCommand comm = new SqlCommand(query, conn);
                comm.Parameters.AddWithValue("@deliveryStatus", dl.SelectedValue);
                comm.Parameters.AddWithValue("@id", id.Text);
                comm.ExecuteNonQuery();
                Response.Write("Delivery Satus has been updated");
                conn.Close();

            }
        }
    }
}