using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2_database_members_lesson
{
    public partial class CategoryForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Lblcid.Text = GridView1.SelectedRow.Cells[1].Text;
            Txtname.Text = GridView1.SelectedRow.Cells[2].Text;
            Txtdescription.Text = GridView1.SelectedRow.Cells[3].Text;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            Lblmassege.Text = "Category has been Updated";
        }

        protected void Btndelete_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
            Lblmassege.Text = "Category has been Deleted";
            Txtname.Text = "";
            Txtdescription.Text = "";
        }

        protected void Btnadd_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
        }
    }
}