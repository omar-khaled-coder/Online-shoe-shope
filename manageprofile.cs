musing System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2_database_members_lesson
{
    public partial class manageprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    first_name.Text = Session["First_name"].ToString();
                    last_name.Text = Session["lastname"].ToString();
                    Email.Text = Session["email"].ToString();
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }
        }

        protected void Btnsignup_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            Labelmassage.Text = "Profile has been updated!";
            //instead of logging out, reset your session to this code
            Session["fullname"] = First_name.Text + " " + txtLName.Text;
        }
    }
}