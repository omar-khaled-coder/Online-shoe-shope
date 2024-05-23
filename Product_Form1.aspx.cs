using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2_database_members_lesson
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           // lblcid.Text = ddicategory.SelectedValue;
        }

        protected void Btnadd_Click(object sender, EventArgs e)
        {
            // check if it has file
            if (FileUploadimage.HasFile.ToString() != null)
            {
                //save the physical file to your folder, please create 'images' folder
                //Sandels.jpg
                FileUploadimage.SaveAs(Server.MapPath("Product_Images//" + FileUploadimage.FileName));
                //FileUploadimage.SaveAs(Server.MapPath("Product_Images//" + FileUploadimage.FileName));
                //save it to your database
                //~/product_image/sandels.jpg
                Lblfilename.Text = "~/Product_Images/" + FileUploadimage.FileName.ToString();

                Sdproducts.Insert();
                Lblmassege.Text = "Record Has been inserted";
            }
            else
            {
                //message the admin - please select animage for the product
                Response.Write("please select an image for the producct");
            }
        }

        protected void Btndelete_Click(object sender, EventArgs e)
        {
            Sdproducts.Delete();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get the product id
           lblpid.Text = GridView1.SelectedRow.Cells[2].Text;
            // get all the values and display in your textbox, lblfilname 
            txtname.Text = GridView1.SelectedRow.Cells[4].Text;
            txtdescription.Text = GridView1.SelectedRow.Cells[5].Text;
            txtprice.Text = GridView1.SelectedRow.Cells[6].Text;
            ddicategory.SelectedItem.Text = GridView1.SelectedRow.Cells[3].Text;
            Lblfilename.Text = GridView1.SelectedRow.Cells[8].Text;

        }

        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            Sdproducts.Update();
        }
    }
}