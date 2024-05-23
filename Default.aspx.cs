using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2_database_members_lesson
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                Lblname.Text = "Welcome back " + Session["fullname"].ToString();
            
            }
            else
            {
                
                Lblname.Text = "Welcom gust";

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("default.aspx"); // signin.aspx
        }


        protected void lnksignin_Click(object sender, EventArgs e)
        {
            Response.Redirect("signin_Form1.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup_Form1.aspx");
        }

        protected void lnkmanageprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageprofile.aspx");
        }
    }

}