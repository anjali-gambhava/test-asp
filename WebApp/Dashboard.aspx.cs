using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Configuration;
using exam.DAL;
using System.IO;
using exam.services;
using System.Drawing;

namespace exam
{
    public partial class Dashboard : System.Web.UI.Page
    {
        LoadTopSelections objloadtop = new LoadTopSelections();

        db_data _boothlist = new db_data();
        db_data_admin _dbadmin = new db_data_admin();
        db_list_lq c1 = new db_list_lq();
        public string statename = ConfigurationManager.AppSettings["statename"].ToString();

        public string pcname = ConfigurationManager.AppSettings["pcname"].ToString();
        public string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();
        public string allKeyword = ConfigurationManager.AppSettings["AllSelectKeword"].ToString() + " ";

        public string districtname = ConfigurationManager.AppSettings["district"].ToString();
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
        public string useridentifer
        {
            get
            {
                if (ViewState["useridentifer"] != null)
                    return (string)ViewState["useridentifer"];
                else
                    return "";
            }
            set
            {
                ViewState["useridentifer"] = value;
            }
        }
        public string _usertype
        {
            get
            {
                if (ViewState["_usertype"] != null)
                    return (string)ViewState["_usertype"];
                else
                    return "live";
            }
            set
            {
                ViewState["_usertype"] = value;
            }
        }
        public string utypeall
        {
            get
            {
                if (ViewState["utypeall"] != null)
                    return (string)ViewState["utypeall"];
                else
                    return "live";
            }
            set
            {
                ViewState["utypeall"] = value;
            }
        }
        public int stateid
        {
            get
            {
                if (ViewState["stateid"] != null)
                    return (int)ViewState["stateid"];
                else
                    return 0;
            }
            set
            {
                ViewState["stateid"] = value;
            }
        }
        public string searchtext
        {
            get
            {
                if (ViewState["searchtext"] != null)
                    return (string)ViewState["searchtext"];
                else
                    return "";
            }
            set
            {
                ViewState["searchtext"] = value;
            }
        }
        public string searchtext2
        {
            get
            {
                if (ViewState["searchtext2"] != null)
                    return (string)ViewState["searchtext2"];
                else
                    return "";
            }
            set
            {
                ViewState["searchtext2"] = value;
            }
        }
        public DataSet BoothList
        {
            get
            {
                if (ViewState["BoothList"] != null)
                    return (DataSet)ViewState["BoothList"];
                else
                    return BoothList;
            }
            set
            {
                ViewState["BoothList"] = value;
            }
        }
        public int pageitemcount = 10000;
        public static int totalDatacount = 0;
        // registrationDAL _regDal = new registrationDAL();
        public int PageNumber
        {
            get
            {

                if (ViewState["PageNumber"] != null)
                    return (int)ViewState["PageNumber"];
                else
                    return 1;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }

        public int TotalCount
        {
            get
            {

                if (ViewState["TotalCount"] != null)
                    return (int)ViewState["TotalCount"];
                else
                    return 0;
            }
            set
            {
                ViewState["TotalCount"] = value;
            }
        }

        public int OnlineCount
        {
            get
            {

                if (ViewState["OnlineCount"] != null)
                    return (int)ViewState["OnlineCount"];
                else
                    return 0;
            }
            set
            {
                ViewState["OnlineCount"] = value;
            }
        }

        public int OfflineCount
        {
            get
            {

                if (ViewState["OfflineCount"] != null)
                    return (int)ViewState["OfflineCount"];
                else
                    return 0;
            }
            set
            {
                ViewState["OfflineCount"] = value;
            }
        }

        public int ConnectedOnceCount
        {
            get
            {

                if (ViewState["ConnectedOnceCount"] != null)
                    return (int)ViewState["ConnectedOnceCount"];
                else
                    return 0;
            }
            set
            {
                ViewState["ConnectedOnceCount"] = value;
            }
        }

        public int LastOneHourCount
        {
            get
            {

                if (ViewState["LastOneHourCount"] != null)
                    return (int)ViewState["LastOneHourCount"];
                else
                    return 0;
            }
            set
            {
                ViewState["LastOneHourCount"] = value;
            }
        }

        public DataSet Graph
        {
            get
            {

                if (ViewState["Graph"] != null)
                    return (DataSet)ViewState["Graph"];
                else
                    return null;
            }
            set
            {
                ViewState["Graph"] = value;
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
        
        public DataTable GUJRATTotal
        {
            get
            {

                if (ViewState["GUJRATTotal"] != null)
                    return (DataTable)ViewState["GUJRATTotal"];
                else
                    return null;
            }
            set
            {
                ViewState["GUJRATTotal"] = value;
            }
        }

        public List<string> Colors
        {
            get
            {

                if (ViewState["Colors"] != null)
                    return (List<string>)ViewState["Colors"];
                else
                    return null;
            }
            set
            {
                ViewState["Colors"] = value;
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
                if (!Page.User.Identity.IsAuthenticated || Session["userType"].ToString().ToLower().Equals("eci"))
                {
                    Response.Redirect("MultiGrid.aspx");
                }
                Session["MenuName"] = "Dashboard";
                if (!IsPostBack)
                {
                    //ddlDistrict.SelectedIndex = 0;
                    DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
                    usertype = ds.Tables[0].Rows[0]["usercode"].ToString();
                    stateid = Convert.ToInt32(ds.Tables[0].Rows[0]["stateid"]);
                    useridentifer = ds.Tables[0].Rows[0]["identifier"].ToString();
                    utypeall = usertype;
                    if (utypeall.Contains("_all"))
                    {
                        usertype = usertype.Replace("_all", "");
                    }
                    if (utypeall.StartsWith("eci"))
                    {
                        usertype = usertype.Replace("eci_", "");
                    }
                    _usertype = usertype;

                    if (!string.IsNullOrEmpty(usertype))
                    {
                        //LoadDistrict(usertype);
                        if (utypeall.Contains("_all"))
                        {

                            //if (ddlDistrict.SelectedValue != "0")
                            //{
                            //    if (ddlPC.SelectedValue != "0")
                            //    {
                            //        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
                            //    }
                            //    else
                            //    {
                            //        usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                            //    }

                            //    LoadBooth(usertype);
                            //}
                            //else
                            //{
                            LoadBooth(usertype);
                            //}
                        }
                        else if (utypeall.StartsWith("pc"))
                        {

                            //ddlDistrict.Visible = false;
                            ////      Literal4.Visible = false;
                            //usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;

                            LoadBooth(usertype);
                        }
                        else if (utypeall.StartsWith("sch"))
                        {
                            //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;

                            LoadBooth(usertype);
                        }

                        else
                        {
                            // LoadBooth("dst_" + ddlDistrict.SelectedItem.Text);

                            //usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                            LoadBooth(usertype);
                        }
                    }
                    //Timer1.Enabled = true;
                    // "#ffe1f9", 
                    Colors = new List<string>() { "#2e9df2", "#f5a4ea", "#0359f5", "#4363d8", "#f58231", "#911eb4", "#42d4f4", "#f032e6", "#bfef45", "#fabed4", "#469990", "#dcbeff", "#9A6324", "#fffa08", "#800000", "#aaffc3", "#808000", "#ffd8b1", "#000075", "#a9a9a9", "#ffff00", "#00ffff", "#222222" };

                    GetDashboardList();
                    GetDashboardIndoorList();
                    GetDashboardOutdoorList();
                    GetDashboardAroList();
                    GetDashboardPinkList();
                }

            }
            catch (Exception ex)
            {
                Common.Log("Page_Load_list() -- >  " + ex.Message);
            }
        }

        private void GetDashboardList()
        {
            DataSet ds = new DataSet();
            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);
            ds = _boothlist.GetDashboardList("", "", UserID);

            TotalCount = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("Total"));
            OnlineCount= ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("online"));
            OfflineCount= ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("offline"));
            ConnectedOnceCount = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("connectedonce"));
            LastOneHourCount = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("lastLive"));

            DataTable dtState = new DataTable();
            dtState.Columns.Add("District");
            dtState.Columns.Add("Total");
            dtState.Columns.Add("Online");
            dtState.Columns.Add("Offline");
            DataRow dr;
            dr = dtState.NewRow();
            dr[0] = statename;
            dr[1] = TotalCount;
            dr[2] = OnlineCount;
            dr[3] = OfflineCount;
            dtState.Rows.Add(dr);
            //DataRow dr;
            //dr = ds.Tables[0].NewRow();
            //dr[0] = "GUJRAT";
            //dr[1] = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("TotalBooth"));
            //dr[2] = TotalCount;
            //dr[3] = OnlineCount;
            //dr[4] = OfflineCount;
            //ds.Tables[0].Rows.InsertAt(dr,0);
            GUJRATTotal = dtState;
            grdState.DataSource = dtState;
            grdState.DataBind();
            Graph = _boothlist.GetDashboardList("", "", UserID);
            BarGraph = _boothlist.GetIndoorOutDoorForGraph("", "", UserID);
            grdDashboard.DataSource = ds;
            grdDashboard.DataBind();
            grdDashboard.Columns[2].Visible = ConfigurationManager.AppSettings["pichartdisable"].ToString() == "1" ? false : true;
            //GridViewRow firstrow = grdDashboard.Rows[0];

            //for (int i = 0; i < firstrow.Cells.Count; i++)
            //{
            //    firstrow.Cells[i].Font.Bold = true;
            //    firstrow.Cells[i].Font.Size = 20;
            //}           
        }

        private void GetDashboardIndoorList()
        {
            DataSet ds = new DataSet();
            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);
            ds = _boothlist.GetDashboardInsideList("", "", UserID);
            DataRow dr = ds.Tables[0].NewRow();
            dr[0] = statename;
            dr[2] = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("Total"));
            dr[3] = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("online"));
            dr[4] = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("offline"));
            ds.Tables[0].Rows.Add(dr);
            grdIndoor.DataSource = ds;
            grdIndoor.DataBind();
            grdIndoor.Rows[grdIndoor.Rows.Count - 1].ForeColor = System.Drawing.Color.Green;
        }

        private void GetDashboardAroList()
        {
            DataSet ds = new DataSet();
            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);
            ds = _boothlist.GetDashboardAroList("", "", UserID);
            grdAro.DataSource = ds;
            grdAro.DataBind();

            DataTable dt = new DataTable();
            dt.Columns.Add("District", typeof(string));
            dt.Columns.Add("Total", typeof(string));
            dt.Columns.Add("online", typeof(string));
            dt.Columns.Add("offline", typeof(string));

            DataRow row = dt.NewRow();
            row[0] = statename;
            row[1] = ds.Tables[0].Rows.Count;
            row[2] = ds.Tables[0].AsEnumerable().Where(i => i.Field<string>("status").Equals("ONLINE")).Count();
            row[3] = ds.Tables[0].AsEnumerable().Where(i => i.Field<string>("status").Equals("OFFLINE")).Count();
            dt.Rows.Add(row);
            dt.AcceptChanges();
            grdAroTot.DataSource = dt;
            grdAroTot.DataBind();
        }

        private void GetDashboardPinkList()
        {
            DataSet ds = new DataSet();
            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);
            ds = _boothlist.GetDashboardPinkList("", "", UserID);
            grdPink.DataSource = ds;
            grdPink.DataBind();

            DataTable dt = new DataTable();
            dt.Columns.Add("District", typeof(string));
            dt.Columns.Add("Total", typeof(string));
            dt.Columns.Add("online", typeof(string));
            dt.Columns.Add("offline", typeof(string));

            DataRow row = dt.NewRow();
            row[0] = statename;
            row[1] = ds.Tables[0].AsEnumerable().Sum(i => i.Field<int>("Total"));
            row[2] = ds.Tables[0].AsEnumerable().Sum(i => i.Field<int>("online"));
            row[3] = ds.Tables[0].AsEnumerable().Sum(i => i.Field<int>("offline"));
            dt.Rows.Add(row);
            dt.AcceptChanges();
            grdPinkTot.DataSource = dt;
            grdPinkTot.DataBind();
        }

        private void grdAro_OnDataBound(object sender, GridViewRowEventArgs  e)
        {
            foreach (GridViewRow row in grdAro.Rows)
            {
                var cell = row.Cells[1];
                var status = cell.Text.ToString();
                if (status.Equals("STOPPED"))
                {
                    cell.BackColor = Color.Red;
                }
                else
                {
                    cell.BackColor = Color.Green;
                }
            }
        }

        private void GetDashboardOutdoorList()
        {
            DataSet ds = new DataSet();
            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);
            ds = _boothlist.GetDashboardOutsideList("", "", UserID);
            DataRow dr = ds.Tables[0].NewRow();
            dr[0] = statename;
            dr[2] = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("Total"));
            dr[3] = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("online"));
            dr[4] = ds.Tables[0].AsEnumerable().Sum(row => row.Field<int>("offline"));
            ds.Tables[0].Rows.Add(dr);
            grdOutdoor.DataSource = ds;
            grdOutdoor.DataBind();
            grdOutdoor.Rows[grdOutdoor.Rows.Count - 1].ForeColor = System.Drawing.Color.Green;
        }

        //private void GetDashboardOnlineList()
        //{
        //    //lblHeaderOnline.Text = "District: " + hdndistrict.Value + " | Status: Online";
        //    lblHeaderOnline.Text = "Status: Online";
        //    divOnline.Visible = true;
        //    DataSet ds = _boothlist.GetDashboardDetailList(hdndistrict.Value, "RUNNING");
        //    //divDashboardDetails
        //    grdOnline.DataSource = ds;
        //    grdOnline.DataBind();
        //}

        //private void GetDashboardOfflineList()
        //{
        //    //lblHeaderOffline.Text = "District: " + hdndistrict.Value + " | Status: Offline";
        //    lblHeaderOffline.Text = "Status: Offline";
        //    divOffline.Visible = true;
        //    DataSet ds = _boothlist.GetDashboardDetailList(hdndistrict.Value, "STOPPED");
        //    //divDashboardDetails
        //    grdOffline.DataSource = ds;
        //    grdOffline.DataBind();
        //}

        private void LoadBooth(string usertype)
        {
            try
            {
                setusertype();
                // int startRow = this.PageNumber * pageitemcount;
                int startRow = ((PageNumber - 1) * pageitemcount);
                DataSet ds = new DataSet();


                DataSet dspc = _dbadmin.allcountlive(usertype);
                DateTime chklastseen = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);

                BoothList = dspc;
                //listview1.DataSource = dspc;
                //listview1.DataBind();
                if (utypeall.StartsWith("eci"))
                {
                    LiveCountECI(usertype, ds.Tables[0].Rows.Count, ds.Tables[0].Select().Where(s => s["status"].ToString().ToUpper() == "RUNNING").Count());
                }
                else
                {
                    //LiveCount(usertype, dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(TotalBooth)", string.Empty)) : 0
                    //    , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(Live)", string.Empty)) : 0
                    //    , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(stop)", string.Empty)) : 0
                    //    , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(connectedonce)", string.Empty)) : 0
                    //    , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(lastLive)", string.Empty)) : 0
                    //);
                    //  LiveCount(usertype, Convert.ToInt32(dspc.Tables[0].Compute("SUM(TotalBooth)", string.Empty)), Convert.ToInt32(dspc.Tables[0].Compute("SUM(Live)", string.Empty)), Convert.ToInt32(dspc.Tables[0].Compute("SUM(stop)", string.Empty)), Convert.ToInt32(dspc.Tables[0].Compute("SUM(connectedonce)", string.Empty)));

                    // LiveCount(usertype, alldata.Sum(x=>x.TotalBooth),alldata.Sum(x=>x.Live),alldata.Sum(x=>x.stop));
                }

                //  Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                Common.Log("LoadBooth_list() -- >  " + ex.Message);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string Status = DataBinder.Eval(e.Row.DataItem, "status").ToString();
                    string islive = DataBinder.Eval(e.Row.DataItem, "islive").ToString();

                    HtmlAnchor hplocbtn = (HtmlAnchor)e.Row.FindControl("lnkplay");

                    if (Status == "RUNNING")
                    {
                        //hplocbtn.Controls.Add(new LiteralControl("<span class='glyphicon glyphicon-stop green pull-left'></span> "));
                    }
                    else
                    {
                        //hplocbtn.Controls.Add(new LiteralControl("<span class='glyphicon glyphicon-stop red pull-left'></span> "));
                    }
                }
            }
            catch (Exception ex)
            {
                Common.Log("GridView1_RowDataBound_list() -- >  " + ex.Message);
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                loaddata();
            }
            catch (Exception ex)
            {

            }
        }

        //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    try
        //    {
        //        GridView1.PageIndex = e.NewPageIndex;
        //        loaddata();
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //}

        private void LiveCount2(string usertype, int totalcount, int cur_livecount, int staticlivecount, bool displaystaticlive)
        {
            //lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ", <b> AC Name : </b> " + ddlbooth.SelectedItem.Text + " - <b> Alloted Booth : </b>" + totalcount + " | <b> Working booth : </b>" + _boothlist.LiveCounter("uadmin2");
            //if (displaystaticlive)
            //{
            //    lblonlinecounter.Text = "<b>Total Alloted Booth : </b>" + totalcount + " | <b>Working Booth : </b>" + staticlivecount;
            //}
            //else
            //{
            //    lblonlinecounter.Text = "<b>Total Alloted Booth : </b>" + totalcount + " | <b>Working Booth : </b>" + cur_livecount;
            //}
        }
        //private void LiveCount(string usertype, int totalcount, int cur_livecount, int cur_stopcount,int cur_ConnectedOnce, int cur_lastlivecount)
        //{
        //    totalbooth.InnerHtml = totalcount.ToString();
        //    runningbooth.InnerHtml = cur_livecount.ToString();
        //    runningboothlast.InnerHtml = cur_lastlivecount.ToString();
        //    stopbooth.InnerHtml = cur_stopcount.ToString();
        //    Connectedonce.InnerHtml = cur_ConnectedOnce.ToString();
        //}
        private void LiveCountECI(string usertype, int totalcount, int cur_livecount)
        {
            //if (ddlDistrict.SelectedIndex > 0)
            //{
            //    lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ",  <b> Alloted Booth : </b>" + totalcount + " | <b>Live Booth of District : </b>" + _boothlist.LiveCounterECI("dst_" + ddlDistrict.SelectedItem.Text, stateid);

            //}
            //else
            //{
            //    lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ", <b> Alloted Booth : </b>" + totalcount + " | <b>Live Booth :  </b>" + _boothlist.LiveCounterECI("uadmin2", stateid);
            //}
        }
        private void loadonlinecounter(int totalcount)
        {
            //    lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ",  <b> Alloted Booth : </b>" + _boothlist.LiveCounter("dst_" + ddlDistrict.SelectedItem.Text + "_dstcount", hrflag, stateid) + " | <b>Live Booth of District : </b>" + _boothlist.LiveCounter("dst_" + ddlDistrict.SelectedItem.Text, hrflag, stateid);

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ChangeState")
                {
                    _boothlist.UpdateStatus(e.CommandArgument.ToString());
                    LoadBooth(usertype);
                }
            }
            catch (Exception ex)
            {
            }
        }
        private void loaddata()
        {
            //if (utypeall.Contains("_all"))
            //{
            //    if (ddlDistrict.SelectedValue == "0")
            //    {
            //        //  DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
            //        if (ddlDistrict.SelectedValue != "0")
            //        {

            //            if (ddlPC.SelectedValue != "0")
            //            {
            //                usertype = "pc1_ALL District_" + ddlPC.SelectedItem.Text;
            //            }
            //            else
            //            {
            //                usertype = utypeall.Replace("_all", "");
            //            }

            //        }
            //    }
            //    else
            //    {
            //        if (ddlPC.SelectedValue == "0")
            //        {
            //            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //        }
            //        else
            //        {
            //            if (ddlbooth.SelectedValue == "0")
            //            {
            //                usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //            }
            //            //else
            //            //{
            //            //    // usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //            //    if (ddlpsbooth.SelectedValue == "0")
            //            //    {
            //            //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //            //    }
            //            //    else
            //            //    {
            //            //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
            //            //    }
            //            //}
            //        }
            //    }
            //}
            //else if (utypeall.StartsWith("pc"))
            //{

            //    // usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //    if (ddlbooth.SelectedValue == "0")
            //    {
            //        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //    }
            //    //else
            //    //{
            //    //    // usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //    //    if (ddlpsbooth.SelectedValue == "0")
            //    //    {
            //    //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //    //    }
            //    //    else
            //    //    {
            //    //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
            //    //    }
            //    //}

            //}
            //else if (utypeall.StartsWith("sch_"))
            //{
            //    if (ddlbooth.SelectedValue == "0")
            //    {
            //        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //    }
            //    //else
            //    //{
            //    //    //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //    //    if (ddlpsbooth.SelectedValue == "0")
            //    //    {
            //    //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //    //    }
            //    //    else
            //    //    {
            //    //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
            //    //    }
            //    //}
            //}
            //else if (utypeall.StartsWith("zn"))
            //{
            //    if (ddlDistrict.SelectedValue == "0")
            //    {
            //        // DataSet ds = _booth.GetUserData(Page.User.Identity.Name);
            //        usertype = utypeall;
            //    }
            //    else
            //    {
            //        if (ddlPC.SelectedValue == "0")
            //        {
            //            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //        }
            //        else
            //        {
            //            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //        }
            //    }
            //}
            //else
            //{
            //    if (ddlPC.SelectedValue == "0")
            //    {
            //        usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //    }
            //    else
            //    {
            //        if (ddlbooth.SelectedValue == "0")
            //        {
            //            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //        }
            //        //else
            //        //{
            //        //    //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //        //    if (ddlpsbooth.SelectedValue == "0")
            //        //    {
            //        //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //        //    }
            //        //    else
            //        //    {
            //        //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
            //        //    }
            //        //}
            //    }
            //    //else
            //    //{
            //    //    usertype = "dd_" + ddlDistrict.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddllocation.SelectedItem.Text + "_" + ddlDate.SelectedItem.Text;
            //    //}
            //}
            LoadBooth(usertype);
            //Timer1.Enabled = true;
        }

        //private void LoadDistrict(string usertype)
        //{
        //    try
        //    {
        //        DataSet ds_dist = new DataSet();
        //        if (utypeall.StartsWith("sch_") || utypeall.StartsWith("dst_"))
        //        {
        //            ddlDistrict.Items.Clear();
        //            ddlDistrict.Items.Insert(0, new ListItem(utypeall.Split('_')[1], utypeall.Split('_')[1]));
        //        }
        //        else
        //        {
        //            objloadtop.LoadDistrict(usertype, utypeall, stateid, out ds_dist);

        //            ddlDistrict.DataSource = ds_dist;
        //            ddlDistrict.DataTextField = "District";
        //            ddlDistrict.DataValueField = "SelValue";
        //            ddlDistrict.DataBind();
        //        }


        //       // ddlDistrict.SelectedIndex = Session["ddldistgrid"] != null ? Convert.ToInt32(Session["ddldistgrid"])
        //                // : Session["userdist"] != null && Session["userdist"] != "" ?
        //                // ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByText(Session["userdist"].ToString()))
        //                 //: 0;
        //        ddlDistrict_SelectedIndexChanged(ddlDistrict, null);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadDistrict_list() -- >  " + ex.Message);
        //    }
        //}
        //private void LoadPC(string District, string usertype, string selectpc)
        //{
        //    try
        //    {
        //        //if (!utypeall.StartsWith("pc_"))
        //        //{
        //            DataSet ds_PC = new DataSet();
        //            if (utypeall.StartsWith("sch_"))
        //            {
        //                ddlPC.Items.Clear();
        //                ddlPC.Items.Insert(0, new ListItem(utypeall.Split('_')[2], utypeall.Split('_')[2]));
        //            }
        //            else
        //            {
        //                objloadtop.LoadPC(District, usertype, selectpc, utypeall, stateid, out ds_PC);

        //                ddlPC.DataSource = ds_PC;
        //                ddlPC.DataTextField = "accode";
        //                ddlPC.DataValueField = "SelValue";
        //                ddlPC.DataBind();
        //                //}
        //            }

        //        ddlPC.SelectedIndex = Session["userpc"] != null && Session["userpc"] != "" ?
        //                ddlPC.Items.IndexOf(ddlPC.Items.FindByText(Session["userpc"].ToString()))
        //                : 0;
        //        ddlPC_SelectedIndexChanged(ddlPC, null);
        //        //LoadSchool(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadSchool_list() -- >  " + ex.Message);
        //    }
        //}

        //private void LoadSchool(string District, string PCname, string usertype)
        //{
        //    try
        //    {

        //        DataSet ds_booth;
        //        if (utypeall.StartsWith("sch_"))
        //        {
        //            ddlbooth.Items.Clear();
        //            ddlbooth.Items.Insert(0, new ListItem(utypeall.Split('_')[3], utypeall.Split('_')[3]));
        //        }
        //        else
        //        {
        //            objloadtop.LoadSchool(District, PCname, usertype, utypeall, stateid, out ds_booth);

        //            ddlbooth.DataSource = ds_booth;
        //            ddlbooth.DataTextField = "acname";
        //            ddlbooth.DataValueField = "SelValue";
        //            ddlbooth.DataBind();
        //        }
        //        //int sch_count = ds_booth.Tables[0].Rows.Count;
        //        //if (sch_count > 1 || sch_count == 0)
        //        //{
        //        //    ddlbooth.Items.Insert(0, new ListItem("ALL " + assemblyname, "0"));
        //        //    ddlpsbooth.Items.Insert(0, new ListItem("ALL Booth", "0"));

        //        //}
        //       // ddlbooth.SelectedIndex = 0;
        //        ddlbooth.SelectedIndex = Session["userbooth"] != null && Session["userbooth"] != "" ?
        //                ddlbooth.Items.IndexOf(ddlbooth.Items.FindByText(Session["userbooth"].ToString()))
        //                : 0;
        //        ddlbooth_SelectedIndexChanged(ddlPC, null);
        //        //loadpsbooth(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, ddlbooth.SelectedItem.Text, usertype);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadSchool_list() -- >  " + ex.Message);
        //    }
        //}
        //private void LoadDistrict(string usertype)
        //{
        //    try
        //    {
        //        DataSet ds_dist;
        //        if (utypeall.StartsWith("eci"))
        //        {
        //            ds_dist = _boothlist.GetDistrictListECI(usertype, stateid);
        //        }
        //        else
        //        {
        //            ds_dist = _boothlist.GetDistrictList(usertype, stateid);
        //        }
        //        ddlDistrict.DataSource = ds_dist;
        //        ddlDistrict.DataTextField = "District";
        //        ddlDistrict.DataValueField = "District";
        //        ddlDistrict.DataBind();
        //        int dist_count = ds_dist.Tables[0].Rows.Count;
        //        if (utypeall.Contains("_all"))
        //        {
        //            if (dist_count > 0)
        //            {                         
        //                ddlDistrict.Items.Insert(0, new ListItem(allKeyword+ ConfigurationManager.AppSettings["district"].ToString(), "0"));
        //                ddlPC.Items.Insert(0, new ListItem(allKeyword  + pcname, "0"));
        //                ddlDistrict.SelectedIndex = Session["ddldistgrid"] != null ? Convert.ToInt32(Session["ddldistgrid"]) : 0;

        //                if (ddlDistrict.SelectedIndex > 0)
        //                {
        //                    usertype = "dst_" + ddlDistrict.SelectedItem.Text;
        //                    LoadPC(ddlDistrict.SelectedItem.Text, usertype, "");
        //                }
        //                else
        //                {
        //                    //ddlbooth.Items.Insert(0, new ListItem("ALL AC Name", "0"));
        //                    if (ddlDistrict.SelectedItem.Text == "ALL District")
        //                    {
        //                        ddlbooth.Items.Insert(0, new ListItem(allKeyword + assemblyname, "0"));
        //                        ddlpsbooth.Items.Insert(0, new ListItem("ALL Booth", "0"));
        //                        LoadPC("", "ALL District-ALL PC", "");
        //                    }
        //                }
        //            }
        //            else
        //            {
        //                LoadPC(ddlDistrict.Items[0].ToString(), usertype, "");
        //            }
        //        }
        //        else
        //        {
        //            if (utypeall.StartsWith("pc_"))
        //            {
        //                if (dist_count > 1)
        //                {
        //                    ddlDistrict.Items.Insert(0, new ListItem("ALL District", "0"));

        //                    usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + utypeall.Split('_')[2];
        //                    LoadPC(ddlDistrict.SelectedItem.Text, usertype, utypeall.Split('_')[2]);
        //                }
        //                else
        //                {
        //                    usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + utypeall.Split('_')[2];
        //                    LoadPC(ddlDistrict.SelectedItem.Text, usertype, utypeall.Split('_')[2]);
        //                }
        //            }
        //            else
        //            {
        //                if (dist_count > 0)
        //                {
        //                    ddlDistrict.SelectedIndex = Session["ddldistgrid"] != null ? Convert.ToInt32(Session["ddldistgrid"]) : 0;

        //                    ddlPC.Items.Insert(0, new ListItem("ALL " + pcname, "0"));
        //                    ddlPC.SelectedIndex = 0;


        //                    LoadPC(ddlDistrict.SelectedItem.Text, usertype, "");
        //                }
        //                else
        //                {
        //                    ddlPC.Items.Clear();
        //                    // GridView1.DataSource = null;
        //                    // GridView1.DataBind();
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadDistrict_list() -- >  " + ex.Message);
        //    }
        //}

        //private void LoadPC(string District, string usertype, string selectpc)
        //{
        //    try
        //    {
        //        if (!utypeall.StartsWith("pc_"))
        //        {
        //            DataSet ds_PC;

        //            ds_PC = _boothlist.GetPCFromDistrict(District, usertype, stateid);

        //            ddlPC.DataSource = ds_PC;
        //            ddlPC.DataTextField = "accode";
        //            ddlPC.DataValueField = "accode";
        //            ddlPC.DataBind();
        //            int sch_count = ds_PC.Tables[0].Rows.Count;
        //            if (sch_count > 1 || sch_count == 0)
        //            {
        //                if (selectpc == "SELECTPC")
        //                {
        //                    ddlPC.Items.Insert(0, new ListItem("SELECT " + pcname, "0"));
        //                }
        //                else
        //                {
        //                    ddlPC.Items.Insert(0, new ListItem("ALL " + pcname, "0"));
        //                }
        //                ddlbooth.Items.Insert(0, new ListItem("ALL " + assemblyname, "0"));
        //                ddlpsbooth.Items.Insert(0, new ListItem("ALL Booth", "0"));
        //            }
        //            else
        //            {
        //                if (utypeall.StartsWith("sch_"))
        //                {
        //                    ddlPC.Items.Clear();
        //                    ddlPC.Items.Insert(0, new ListItem(usertype.Split('_')[2], "0"));
        //                }
        //                else
        //                {
        //                    ddlPC.Items.Insert(0, new ListItem("SELECT " + pcname, "0"));
        //                }
        //            }
        //        }
        //        else
        //        {

        //            ddlPC.Items.Insert(0, new ListItem(usertype.Split('_')[2], "0"));

        //        }
        //        ddlPC.SelectedIndex = 0;

        //        LoadSchool(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadSchool_list() -- >  " + ex.Message);
        //    }
        //}

        //private void LoadSchool(string District, string PCname, string usertype)
        //{
        //    try
        //    {

        //        DataSet ds_booth;
        //        if (utypeall.StartsWith("eci"))
        //        {
        //            ds_booth = _boothlist.GetBoothFromDistrictECI(District, usertype, stateid);
        //        }
        //        else
        //        {
        //            ds_booth = _boothlist.GetBoothFromDistrictPC(District, PCname, usertype);
        //        }
        //        ddlbooth.DataSource = ds_booth;
        //        ddlbooth.DataTextField = "acname";
        //        ddlbooth.DataValueField = "acname";
        //        ddlbooth.DataBind();
        //        int sch_count = ds_booth.Tables[0].Rows.Count;
        //        if (sch_count > 1 || sch_count == 0)
        //        {
        //            ddlbooth.Items.Insert(0, new ListItem("ALL " + assemblyname, "0"));
        //            ddlpsbooth.Items.Insert(0, new ListItem("ALL Booth", "0"));

        //        }
        //        ddlbooth.SelectedIndex = 0;

        //        loadpsbooth(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, ddlbooth.SelectedItem.Text, usertype);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadSchool_list() -- >  " + ex.Message);
        //    }
        //}
        //private void loadpsbooth(string District, string PCname, string PSboothname, string usertype)
        //{
        //    DataSet ds_PSBooth;

        //    ds_PSBooth = _boothlist.GetPSBoothFromDistrictPCAC(District, PCname, PSboothname, usertype);

        //    ddlpsbooth.DataSource = ds_PSBooth;
        //    ddlpsbooth.DataTextField = "psnum";
        //    ddlpsbooth.DataValueField = "psnum";
        //    ddlpsbooth.DataBind();
        //    int ps_count = ds_PSBooth.Tables[0].Rows.Count;
        //    if (ps_count > 1 || ps_count == 0)
        //    {
        //        ddlpsbooth.Items.Insert(0, new ListItem("ALL Booth", "0"));
        //    }
        //    ddlpsbooth.SelectedIndex = 0;

        //}
        //protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        PageNumber = 1;
        //        ddlPC.Items.Clear();
        //        ddlbooth.Items.Clear();
        //        string selpc = "";
        //        if (utypeall.Contains("_all"))
        //        {
        //            if (ddlDistrict.SelectedValue == "0")
        //            {
        //                //DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
        //                usertype = utypeall.Replace("_all", "");
        //                //ddlPC.Items.Insert(0, new ListItem("ALL " + pcname, "0"));
        //                LoadPC("", "ALL District-ALL PC", "");
        //            }
        //            else
        //            {
        //                usertype = "dst_" + ddlDistrict.SelectedItem.Text;
        //                selpc = "SELECTPC";
        //                LoadPC(ddlDistrict.SelectedItem.Text, usertype, selpc);
        //            }
        //        }
        //        else if (utypeall.StartsWith("pc_"))
        //        {
        //            LoadPC(ddlDistrict.SelectedItem.Text, usertype, utypeall.Split('_')[2]);
        //        }
        //        else if (utypeall.StartsWith("sch_"))
        //        {
        //            LoadPC(ddlDistrict.SelectedItem.Text, usertype, utypeall.Split('_')[2]);
        //        }
        //        else
        //        {
        //            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
        //            LoadPC(ddlDistrict.SelectedItem.Text, usertype, selpc);
        //        }

        //        ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByText(ddlDistrict.SelectedItem.Text));
        //        Session["ddldistgrid"] = ddlDistrict.SelectedIndex;
        //        //   usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
        //       // LoadBooth(usertype);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("ddlDistrict_SelectedIndexChanged_list() -- >  " + ex.Message);
        //    }
        //}
        //protected void ddlPC_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        PageNumber = 1;
        //      /*   if (ddlPC.SelectedValue == "0")
        //         {
        //             if (ddlPC.SelectedItem.Text == "SELECT " + pcname)
        //             {

        //                 usertype = "dst_" + ddlDistrict.SelectedItem.Text;
        //             }
        //             else
        //             {
        //                 if (utypeall.Contains("_all") || utypeall.StartsWith("pc_"))
        //                 {
        //                     usertype = utypeall.Replace("_all", "");
        //                     LoadPC("", "ALL District-ALL PC", "");
        //                     ddlDistrict.SelectedIndex = 0;
        //                 }
        //                 else
        //                 {
        //                     usertype = "dst_" + ddlDistrict.SelectedItem.Text;
        //                 }
        //             }
        //         }
        //         else
        //         {

        //             // string dstfrmpc = _boothlist.GetDistrictFromPC(ddlPC.SelectedItem.Text, usertype);

        //             //ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByText(dstfrmpc));
        //             if (ddlDistrict.SelectedValue == "0")
        //             {
        //                 usertype = "pc_ALL District_" + ddlPC.SelectedItem.Text;
        //             }
        //             else
        //             {
        //                 usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
        //             }
        //           //  LoadSchool(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);
        //         }*/

        //        LoadSchool(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);
        //       // LoadBooth(usertype);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
        //    }
        //}
        public void setusertype()
        {
            /* if (utypeall.Contains("_all"))
             {
                 usertype = usertype.Replace("_all", "");
             }
             if (utypeall.StartsWith("eci"))
             {
                 usertype = usertype.Replace("eci_", "");
             }
             _usertype = usertype;
             if (!string.IsNullOrEmpty(usertype))
             {

                 if (utypeall.Contains("_all"))
                 {

                     if (ddlDistrict.SelectedValue != "0")
                     {
                         if (ddlPC.SelectedValue != "0")
                         {
                             usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
                         }
                         else
                         {
                             usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                         }

                         LoadBooth(usertype);
                     }
                     else
                     {
                         LoadBooth(usertype);
                     }
                 }
                 else if (utypeall.StartsWith("pc"))
                 {

                     ddlDistrict.Visible = false;
                     //      Literal4.Visible = false;
                     usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;

                     LoadBooth(usertype);
                 }
                 else if (utypeall.StartsWith("sch"))
                 {
                     usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;

                     LoadBooth(usertype);
                 }

                 else
                 {
                     // LoadBooth("dst_" + ddlDistrict.SelectedItem.Text);

                     usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                     LoadBooth(usertype);
                 }
             }
             */



            //if (utypeall.Contains("_all"))
            //{
            //    if (ddlDistrict.SelectedValue == "0")
            //    {
            //        //  DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
            //        if (ddlDistrict.SelectedValue != "0")
            //        {

            //            if (ddlPC.SelectedValue != "0")
            //            {
            //                usertype = "pc1_ALL District_" + ddlPC.SelectedItem.Text;
            //            }
            //            else
            //            {
            //                usertype = utypeall.Replace("_all", "");
            //            }

            //        }
            //    }
            //    else
            //    {
            //        if (ddlPC.SelectedValue == "0")
            //        {
            //            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //        }
            //        else
            //        {
            //            if (ddlbooth.SelectedValue == "0")
            //            {
            //                usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //            }
            //            //else
            //            //{
            //            //    // usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //            //    if (ddlpsbooth.SelectedValue == "0")
            //            //    {
            //            //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //            //    }
            //            //    else
            //            //    {
            //            //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
            //            //    }
            //            //}
            //        }
            //    }
            //}
            //else if (utypeall.StartsWith("pc"))
            //{

            //    // usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //    if (ddlbooth.SelectedValue == "0")
            //    {
            //        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //    }
            //    //else
            //    //{
            //    //    // usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //    //    if (ddlpsbooth.SelectedValue == "0")
            //    //    {
            //    //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //    //    }
            //    //    else
            //    //    {
            //    //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
            //    //    }
            //    //}

            //}
            //else if (utypeall.StartsWith("sch_"))
            //{
            //    if (ddlbooth.SelectedValue == "0")
            //    {
            //        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //    }
            //    //else
            //    //{
            //    //    //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //    //    if (ddlpsbooth.SelectedValue == "0")
            //    //    {
            //    //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //    //    }
            //    //    else
            //    //    {
            //    //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
            //    //    }
            //    //}
            //}
            //else if (utypeall.StartsWith("zn"))
            //{
            //    if (ddlDistrict.SelectedValue == "0")
            //    {
            //        // DataSet ds = _booth.GetUserData(Page.User.Identity.Name);
            //        usertype = utypeall;
            //    }
            //    else
            //    {
            //        if (ddlPC.SelectedValue == "0")
            //        {
            //            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //        }
            //        else
            //        {
            //            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //        }
            //    }
            //}
            //else
            //{
            //    if (ddlPC.SelectedValue == "0")
            //    {
            //        usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //    }
            //    else
            //    {
            //        if (ddlbooth.SelectedValue == "0")
            //        {
            //            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
            //        }
            //        //else
            //        //{
            //        //    //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //        //    if (ddlpsbooth.SelectedValue == "0")
            //        //    {
            //        //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //        //    }
            //        //    else
            //        //    {
            //        //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
            //        //    }
            //        //}
            //    }
            //    //else
            //    //{
            //    //    usertype = "dd_" + ddlDistrict.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddllocation.SelectedItem.Text + "_" + ddlDate.SelectedItem.Text;
            //    //}
            //}
        }
        protected void ddlbooth_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PageNumber = 1;





                //if (ddlbooth.SelectedValue == "0")
                //{
                //    usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
                //    //if (ddlbooth.SelectedItem.Text == "ALL " + assemblyname)
                //    //{
                //    //    ddlpsbooth.Items.Clear();
                //    //    ddlpsbooth.Items.Insert(0, new ListItem("ALL Booth", "0"));
                //    //}
                //}
                //else
                //{
                //    if (ddlDistrict.SelectedValue == "0")
                //    {
                //        usertype = "sch_ALL District_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    }
                //    else
                //    {
                //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    }
                //    //loadpsbooth(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, ddlbooth.SelectedItem.Text, usertype);
                //}
                LoadBooth(usertype);
            }
            catch (Exception ex)
            {
                Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }

        //protected void ddlpsbooth_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        PageNumber = 1;
        //        if (ddlpsbooth.SelectedValue == "0")
        //        {
        //            usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
        //        }
        //        else
        //        {
        //            usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
        //        }

        //        LoadBooth(usertype);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
        //    }
        //}

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void btnreport_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=" + ConfigurationManager.AppSettings["titlename"].ToString() + "LiveReport" + DateTime.Now.ToString("ddMMyyyy") + ".xls");
                Response.ContentEncoding = System.Text.Encoding.Unicode;
                Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
                Response.ContentType = "application/vnd.ms-excel";

                DataSet ds = _dbadmin.allcountlive(usertype);

                // create a string writer
                using (StringWriter sw = new StringWriter())
                {
                    using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                    {
                        DataGrid dg = new DataGrid();
                        dg.DataSource = ds.Tables[0];
                        dg.DataBind();
                        dg.RenderControl(htw);

                        Response.Output.Write(sw.ToString());
                        Response.Flush();
                        Response.End();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                //searchtext = txtSearch.Value;
                //searchtext2 = txtSearch2.Value;
                PageNumber = 1;
                //LoadBooth(usertype);
                string s_txt = string.Empty;
                if (!string.IsNullOrEmpty(searchtext))
                {
                    s_txt = "&s1=" + Common.base64Encode(searchtext);
                }
                if (!string.IsNullOrEmpty(searchtext2))
                {
                    s_txt += "&s2=" + Common.base64Encode(searchtext2);
                }

                Response.Redirect("Listview.aspx?s=" + Common.Encode(usertype) + s_txt);

            }
            catch
            {

            }
        }

        //protected void btnShowData_Click(object sender, EventArgs e)
        //{
        //    GetDashboardList();
        //    GetDashboardOnlineList();
        //    GetDashboardOfflineList();
        //}

        protected void grdDashboard_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Online")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(),"RUNNING");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Offline")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "STOPPED");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Total")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void grdDashboard_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var color = Colors[e.Row.RowIndex];
                (e.Row.FindControl("lblColor") as Label).ForeColor = Color.FromArgb(System.Drawing.ColorTranslator.FromHtml(color).ToArgb());
                decimal onlinecount = Convert.ToInt32((e.Row.FindControl("lnkOnline") as LinkButton).Text.ToString());
                decimal totalcount = Convert.ToInt32((e.Row.FindControl("lnkTotal") as LinkButton).Text.ToString());
                var onlinePer = ((onlinecount / totalcount) * 100);
                if (onlinePer < 80)
                {
                    e.Row.BackColor = Color.FromArgb(System.Drawing.ColorTranslator.FromHtml("#ffe0e0").ToArgb());
                }
                else if (onlinePer >= 90)
                {
                    e.Row.BackColor = Color.FromArgb(System.Drawing.ColorTranslator.FromHtml("#a9e2a9").ToArgb());
                }
            }
        }
        protected void grdIndoor_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Online")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "RUNNING", "Inside");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Indoor" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Offline")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "STOPPED", "Inside");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Indoor" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Total")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "", "Inside");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Indoor" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void grdPink_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Online")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "RUNNING", "");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Women(Pink)" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Offline")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "STOPPED", "");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Women(Pink)" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Total")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "", "");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Women(Pink)" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void grdOutdoor_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Online")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "RUNNING", "Outside");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Outdoor" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Offline")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "STOPPED", "Outside");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Outdoor" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Total")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList(e.CommandArgument.ToString(), "", "Outside");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'District: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + " | Type: Outdoor" + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void grdState_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Online")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList("", "RUNNING", "");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'State: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Offline")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList("", "STOPPED", "");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'State: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
                else if (e.CommandName == "Total")
                {
                    DataSet ds = _boothlist.GetDashboardDetailList("", "", "");
                    //divDashboardDetails
                    grdDashboardDetails.DataSource = ds;
                    grdDashboardDetails.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$j('form').find('.ui-dialog').remove();$j('#" + divDashboardDetails.ClientID + "').dialog({ title: 'State: " + e.CommandArgument.ToString() + " | Status: " + e.CommandName.ToString() + "', width: 1000, height: 400, position: 'center' });$j('#" + divDashboardDetails.ClientID + "').parent().appendTo($('form'));$(window).scrollTop(0)", true);
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    //public class dashboard_count_data
    //{
    //    public string DATA { get; set; }
    //    public int TotalBooth { get; set; }
    //    public int Live { get; set; }
    //    public int stop { get; set; }
    //    public string pc_code { get; set; }

    //}
}