using System;
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
                    TextBox1.Text = Session["First_name"].ToString();
                    TextBox2.Text = Session["last_name"].ToString();
                    Txt_email.Text = Session["email"].ToString();
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
            Lblmessag.Text = "Profile has been updated!";
            //instead of logging out, reset your session to this code
            Session["fullname"] = TextBox1.Text + " " + TextBox2.Text;

        }
    }
}