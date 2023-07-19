using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exam
{
    public partial class gridauto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                Session["MenuName"] = "GridAuto";
            }
            catch (Exception ex)
            {
                Common.Log("Page_Load_gridauto() -- >  " + ex.Message);
            }
        }
    }
}