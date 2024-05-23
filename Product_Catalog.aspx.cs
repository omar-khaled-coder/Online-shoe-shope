using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2_database_members_lesson
{
    public partial class Product_Catalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "details")
            {
                Label pid = e.Item.FindControl("pidLabel") as Label;
                Response.Write(pid.Text);
                Session["pid"] = pid.Text;
                Response.Redirect("ProductDetails.aspx");
            }
        }
    }
}