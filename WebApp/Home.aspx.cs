using System;
using System.Collections.Generic; 
using System.Web.UI; 
using System.Data; 
using System.Configuration;
using exam.DAL; 
using System.Data.SqlClient; 
namespace exam
{
    public partial class Home : System.Web.UI.Page
    {
        db_data _boothlist = new db_data();
        db_data_admin _dbadmin = new db_data_admin();

        public string usertype
        {
            get
            {
                if (ViewState["usertype"] != null)
                    return (string)ViewState["usertype"];
                else
                    return "live";
            }
            set
            {
                ViewState["usertype"] = value;
            }
        }
        public DataSet BarGraph
        {
            get
            {

                if (ViewState["BarGraph"] != null)
                    return (DataSet)ViewState["BarGraph"];
                else
                    return null;
            }
            set
            {
                ViewState["BarGraph"] = value;
            }
        }
        public DataSet notification
        {
            get
            {

                if (ViewState["notification"] != null)
                    return (DataSet)ViewState["notification"];
                else
                    return null;
            }
            set
            {
                ViewState["notification"] = value;
            }
        }
        public DataSet gaugechart
        {
            get
            {

                if (ViewState["gaugechart"] != null)
                    return (DataSet)ViewState["gaugechart"];
                else
                    return null;
            }
            set
            {
                ViewState["gaugechart"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }

                Session["MenuName"] = "Dashboard1";
                if (!IsPostBack)
                {
                    DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
                    usertype = ds.Tables[0].Rows[0]["usercode"].ToString();
                    LoadBooth(usertype);
                    GetDashboardList(); 
                    
                }

            }
            catch (Exception ex)
            {
                Common.Log("Page_Load_list() -- >  " + ex.Message);
            }
        }

        private void LoadBooth(string usertype)
        {
            try
            {
                int UserID = 0;
                if (Session["userid"] != null)
                    UserID = Convert.ToInt32(Session["userid"]);
                DataSet dspc = _dbadmin.allcountliveondashboard(UserID);
                DateTime chklastseen = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * 1);

                LiveCount(UserID, dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(lastonehrLive)", string.Empty)) : 0
                    ,dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(lastonehrLiveIndoor)", string.Empty)) : 0
                    ,dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(lastonehrLiveOutdoor)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(lasttwohrLive)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(lasttwohrLiveIndoor)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(lasttwohrLiveOutdoor)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(Live)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(LiveIndoor)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(LiveOutdoor)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(stop)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(stopIndoor)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(stopOutdoor)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(TotalBooth)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(TotalBoothIndoor)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(TotalBoothOutdoor)", string.Empty)) : 0
                        ,dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(connectedonce)", string.Empty)) : 0
                        ,dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(connectedonceindoor)", string.Empty)) : 0
                        ,dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(connectedonceoutdoor)", string.Empty)) : 0
                    );

            }
            catch (Exception ex)
            {
                Common.Log("LoadBooth_list() -- >  " + ex.Message);
            }
        }
        private void LiveCount(int UserID, int cur_lastonehrlivecount, int cur_lastonehrlivecountin, int cur_lastonehrlivecountout,
            int cur_lasttwohrlivecount, int cur_lasttwohrlivecountin, int cur_lasttwohrlivecountout, int cur_livecount, int cur_livecountin,
            int cur_livecountout, int cur_stopcount, int cur_stopcountin, int cur_stopcountout, int totalBooth,
            int totalBoothIn, int totalBoothOut, int connectedOnce, int connectedOnceIn, int connectedOnceOut)
        {
            double cur_lastonehrliveper = Math.Round((double)(100 * cur_lastonehrlivecount) / totalBooth, 2);
            double cur_lasttwohrliveper = Math.Round((double)(100 * cur_lasttwohrlivecount) / totalBooth, 2);
            double cur_liveper = Math.Round((double)(100 * cur_livecount) / totalBooth, 2);
            double cur_stopper = Math.Round((double)(100 * cur_stopcount) / totalBooth, 2);
            double cur_connectedonce = Math.Round((double)(100 * connectedOnce) / totalBooth, 2);

            TotalStreamBooth.InnerHtml = totalBooth.ToString();
            TotalStreamBoothin.InnerHtml = totalBoothIn.ToString();
            TotalStreamBoothout.InnerHtml = totalBoothOut.ToString();

            lastonehours.InnerHtml = cur_lastonehrlivecount.ToString();
            lastonehoursin.InnerHtml = cur_lastonehrlivecountin.ToString();
            lastonehoursout.InnerHtml = cur_lastonehrlivecountout.ToString();
            lastonehoursper.InnerHtml = "[" + cur_lastonehrliveper.ToString() + "%]";

            lasttwohours.InnerHtml = cur_lasttwohrlivecount.ToString();
            lasttwohoursin.InnerHtml = cur_lasttwohrlivecountin.ToString();
            lasttwohoursout.InnerHtml = cur_lasttwohrlivecountout.ToString();
            lasttwohoursper.InnerHtml = "[" + cur_lasttwohrliveper.ToString() + "%]";

            livecount.InnerHtml = cur_livecount.ToString();
            livecountin.InnerHtml = cur_livecountin.ToString();
            livecountout.InnerHtml = cur_livecountout.ToString();
            livecountper.InnerHtml = "[" + cur_liveper.ToString() + "%]";

            offlinecount.InnerHtml = cur_stopcount.ToString();
            offlinecountin.InnerHtml = cur_stopcountin.ToString();
            offlinecountout.InnerHtml = cur_stopcountout.ToString();
            offlinecountper.InnerHtml = "[" + cur_stopper.ToString() + "%]";

           connectedonce.InnerHtml = connectedOnce.ToString();
           connectedoncein.InnerHtml = connectedOnceIn.ToString();
           connectedonceout.InnerHtml = connectedOnceOut.ToString();
           connectedonceper.InnerHtml = "[" + cur_connectedonce.ToString() + "%]";
        }


        [System.Web.Services.WebMethod]
        public static List<object> GetChartData()
        {
            int Userid = Convert.ToInt32(System.Web.HttpContext.Current.Session["userid"]);
            List<object> data = new List<object>();
            string conString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("GetOnlineOfflineSummary", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Userid);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    object x = reader["Time"];
                    object y = reader["Online"];
                    object y1 = reader["Offline"];
                    object y2 = reader["Connecectonce"];
                    data.Add(new { x, y, y1, y2 });
                }
                reader.Close();
            }
            return data;
        }

        
        private void GetDashboardList()
        {
            DataSet ds = new DataSet();
            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);
            BarGraph = _boothlist.GetIndoorOutDoorForGraph("", "", UserID);
        }
        private void GetHeadCountNotification()
        {
            DataSet ds = new DataSet();
            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);
            notification = _boothlist.getImgNotification("GetData");
        }
        private void loadgaugechart()
        {
            gaugechart = _boothlist.getgaugechartdtls();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            LoadBooth(usertype);
            GetDashboardList(); 
        }
    }
} 