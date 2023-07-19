using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace exam
{
    public partial class Watchvideodownload : System.Web.UI.Page
    {
        public string servername = string.Empty;
        public string streamname = string.Empty;
        public string stateid = string.Empty;
        public string currentstateid = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                servername = Request.QueryString["sname"].ToString();
                streamname = Request.QueryString["vid"].ToString();
                stateid = Request.QueryString["phase"].ToString();
                currentstateid = ConfigurationManager.AppSettings["stateid"];
                playeritem.playerid = streamname;
                playeritem.playerURL = servername;
                playeritem.playerstateid = stateid;
            }
            catch (Exception ex)
            {
            }
        }
    }
}