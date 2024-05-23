using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2_database_members_lesson
{
    public partial class Signup_Form1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void text_email_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Btnsignup_Click(object sender, EventArgs e)
        {
            DTsignup.Text = DateTime.Now.ToString();
            SqlDataSource1.Insert();
            donemassege.Text = "Thank you for signing up";
        }
    }
}