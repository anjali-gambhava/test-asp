using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using exam.DAL;

namespace exam
{
    public partial class WatchVideo : System.Web.UI.Page
    {
        public string servername = string.Empty;
        public string streamname = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            servername = Request.QueryString["sname"].ToString();
            streamname = Request.QueryString["vid"].ToString();
            playeritem.playerid = streamname;
            playeritem.playerURL = servername;
            try
            {
                int sflag = Convert.ToInt32(Common.Decode(Request.QueryString["playerType"].ToString()));
                //if (sflag == 2)
                //{
                //    int sid = Convert.ToInt32(Common.Decode(Request.QueryString["code2"].ToString()));
                //    db_list_lq db = new db_list_lq();
                //    streamlist info = db.Getstreaminfo(sid);
                //    if (info != null)
                //    {
                //        servername = info.servername;
                //        streamname = info.streamname;
                //        playeritem.playerid = streamname;
                //        playeritem.playerURL = servername;
                //    }
                //}
                string streamnamebkp = Common.Decode(Request.QueryString["streamnamebkp"].ToString());
                if (sflag == 4)
                {
                    streamname = streamname + "_";
                    playeritem.playerid = streamname + "_";
                }
                //if (sflag == 2)
                //{
                //    streamname = streamnamebkp == "" ? streamname : streamnamebkp;
                //    playeritem.playerid = streamnamebkp == "" ? streamname : streamnamebkp;
                //}
            }
            catch (Exception ex)
            {
            }
        }
    }
}