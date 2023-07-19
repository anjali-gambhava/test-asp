using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exam
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    //Response.Redirect("Default.aspx");
                    //bdy.Attributes.Add("class", "body");
                }
                else
                {
                    //bdy.Attributes.Remove("class");
                }
                if (Session["MenuName"] == "GridView1")
                {
                    headerid.Style.Add("display", "none");
                    navMenu.Style.Add("display", "none");
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}