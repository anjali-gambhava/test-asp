using exam.DAL;
using exam.services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exam
{
    public partial class downloadrecordings : System.Web.UI.Page
    {
        LoadTopSelections objloadtop = new LoadTopSelections();
        db_data _boothlist = new db_data();
        db_list_lq c1 = new db_list_lq();
        public string district = ConfigurationManager.AppSettings["district"].ToString();
        public string allKeyword = ConfigurationManager.AppSettings["AllSelectKeword"].ToString() + " ";

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
        public int pageitemcount = Convert.ToInt32(ConfigurationManager.AppSettings["pageitemcount"]);
        public static int totalDatacount = 0;
        public string pcname = ConfigurationManager.AppSettings["pcname"].ToString();
        public string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();
        public void setusertype()
        {
            if (utypeall.Contains("_all"))
            {
                if (ddlDistrict.SelectedValue == "0")
                {
                    //  DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
                    if (ddlDistrict.SelectedValue != "0")
                    {

                        if (ddlAssembly.SelectedValue != "0")
                        {
                            usertype = "pc1_ALL District_" + ddlAssembly.SelectedItem.Text;
                        }
                        else
                        {
                            usertype = utypeall.Replace("_all", "");
                        }

                    }
                }
                else
                {
                    if (ddlAssembly.SelectedValue == "0")
                    {
                        usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                    }
                    else
                    {
                        if (ddlbooth.SelectedValue == "0")
                        {
                            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                        }
                        //else
                        //{
                        //    // usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                        //    if (ddlpsbooth.SelectedValue == "0")
                        //    {
                        //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                        //    }
                        //    else
                        //    {
                        //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
                        //    }
                        //}
                    }
                }
            }
            else if (utypeall.StartsWith("pc"))
            {

                // usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                if (ddlbooth.SelectedValue == "0")
                {
                    usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                }
                //else
                //{
                //    // usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    if (ddlpsbooth.SelectedValue == "0")
                //    {
                //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    }
                //    else
                //    {
                //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
                //    }
                //}

            }
            else if (utypeall.StartsWith("sch_"))
            {
                if (ddlbooth.SelectedValue == "0")
                {
                    usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                }
                //else
                //{
                //    //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    if (ddlpsbooth.SelectedValue == "0")
                //    {
                //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    }
                //    else
                //    {
                //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
                //    }
                //}
            }
            else if (utypeall.StartsWith("zn"))
            {
                if (ddlDistrict.SelectedValue == "0")
                {
                    // DataSet ds = _booth.GetUserData(Page.User.Identity.Name);
                    usertype = utypeall;
                }
                else
                {
                    if (ddlAssembly.SelectedValue == "0")
                    {
                        usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                    }
                    else
                    {
                        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                    }
                }
            }
            else
            {
                if (ddlAssembly.SelectedValue == "0")
                {
                    usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                }
                else
                {
                    if (ddlbooth.SelectedValue == "0")
                    {
                        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                    }
                    //else
                    //{
                    //    //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                    //    if (ddlpsbooth.SelectedValue == "0")
                    //    {
                    //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                    //    }
                    //    else
                    //    {
                    //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
                    //    }
                    //}
                }
                //else
                //{
                //    usertype = "dd_" + ddlDistrict.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddllocation.SelectedItem.Text + "_" + ddlDate.SelectedItem.Text;
                //}
            }
        }
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
        public string usernametotal = ConfigurationManager.AppSettings["usertotal"].ToString();
        public int usernametotalen = Convert.ToInt32(ConfigurationManager.AppSettings["usertotalen"].ToString());
        public bool hrflag = Convert.ToBoolean(ConfigurationManager.AppSettings["hrflag"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }

                Session["MenuName"] = "Download";
                if (!IsPostBack)
                {
                    
                    DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
                    usertype = ds.Tables[0].Rows[0]["usercode"].ToString();
                    stateid = Convert.ToInt32(ds.Tables[0].Rows[0]["stateid"]);
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
                    if (Request.QueryString.Count > 0 && Request.QueryString["d"] != null)
                    {
                        string str = Common.Decode(Request.QueryString["d"].ToString());
                        _usertype = str.StartsWith("000") ? "online" : usertype;
                        _usertype = str.StartsWith("002") ? "offline" : _usertype;
                        usertype = "sch_" + str.Split('$')[1].ToString();
                    }
                    if (Request.QueryString.Count > 0 && Request.QueryString["s"] != null)
                    {
                        string str = Common.Decode(Request.QueryString["s"].ToString());
                        usertype = str;
                        searchtext = Request.QueryString["s1"] != null ? Common.base64Decode(Request.QueryString["s1"].ToString()) : string.Empty;
                        txtSearch.Value = searchtext;
                        searchtext2 = Request.QueryString["s2"] != null ? Common.base64Decode(Request.QueryString["s2"].ToString()) : string.Empty;
                        txtSearch2.Value = searchtext2;
                    }
                    if (!string.IsNullOrEmpty(usertype))
                    {
                        LoadDistrict(usertype);
                        if (utypeall.Contains("_all"))
                        {

                            if (ddlDistrict.SelectedIndex > 0)
                            {
                                usertype = "dst_" + ddlDistrict.SelectedItem.Text;
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
                            //   Literal4.Visible = false;
                            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                            LoadBooth(usertype);
                        }
                        else if (utypeall.StartsWith("sch"))
                        {
                            usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                            LoadBooth(usertype);
                        }
                        //if (usertype.StartsWith("zn"))
                        //{
                        //    LoadBooth(usertype);
                        //}
                        else
                        {
                            // LoadBooth("dst_" + ddlDistrict.SelectedItem.Text);
                            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                            LoadBooth(usertype);
                        }
                    }
                   
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
                setusertype();
                // int startRow = this.PageNumber * pageitemcount;
                int startRow = ((PageNumber - 1) * pageitemcount) + 1;
                DataSet ds = new DataSet();
                List<dbData> data = new List<dbData>();

                IQueryable<dbData> alldata = Enumerable.Empty<dbData>().AsQueryable();
                IQueryable<dbData> data_grd = Enumerable.Empty<dbData>().AsQueryable();
                //if (_usertype == "live")
                //{
                //    alldata = c1.GetBoothList(usertype, true, stateid, startRow, startRow + pageitemcount - 1, searchtext, searchtext2, ddlStatus.SelectedValue);
                //}
                //else
                //{
                //    if (utypeall.StartsWith("eci"))
                //    {
                //        ds = _boothlist.GetBoothListECI(usertype, false, stateid);
                //    }
                //    else
                //    {
                //        //ds = _boothlist.GetBoothList(usertype, false, stateid, startRow, startRow + pageitemcount - 1);
                //        alldata = c1.GetBoothList(usertype, false, stateid, startRow, startRow + pageitemcount - 1, searchtext, searchtext2, ddlStatus.SelectedValue);
                //    }
                //}
                //totalDatacount = alldata.Count();
                //data_grd = alldata;
                //if (_usertype == "offline")
                //{
                //    //string lastworking = alldata.Where(x => x.lastseen >= DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1)).Count().ToString();

                //    //data_grd = alldata.Where(x => x.lastseen < DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1));
                //    data_grd = alldata.Where(x => x.sFlag == 0);
                //    GridView1.DataSource = data_grd.Skip(startRow - 1).Take(pageitemcount).OrderBy(x => x.district);
                //        //OrderBy(x => x.acname).ThenBy(x => x.location).ThenBy(x => x.streamname).ToList();
                //    GridView1.DataBind();
                //    BindPager(data_grd.Count(), this.PageNumber, pageitemcount);
                //}
                //else if (_usertype == "online")
                //{
                //    // data_grd = alldata.Where(x => x.lastseen >= DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1));
                //    data_grd = alldata.Where(x => x.lastseen >= DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1) || x.sFlag == 2).OrderBy(x => x.status);
                //    GridView1.DataSource = data_grd.Skip(startRow - 1).Take(pageitemcount).OrderBy(x => x.district).ToList();//ds.Tables[0];
                //    GridView1.DataBind();
                //    BindPager(data_grd.Count(), this.PageNumber, pageitemcount);

                //}
                //else
                //{

                //    GridView1.DataSource = data_grd.Skip(startRow - 1).Take(pageitemcount).OrderBy(x => x.district);
                //        //OrderBy(x => x.acname).ThenBy(x => x.location).ThenBy(x => x.streamname).ToList();

                //    GridView1.DataBind();
                //    BindPager(alldata.Count(), this.PageNumber, pageitemcount);

                //}
                ////alldata = c1.GetBoothListNew(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, stateid);

                ////DataTable dtAccess = (DataTable)HttpContext.Current.Session["userAssemblyAccess"];
                //////var districtlist = string.Join(",", dtAccess.AsEnumerable().Select(r => r.Field<string>("district")).ToArray());
                //////var assemblylist = string.Join(",", dtAccess.AsEnumerable().Select(r => r.Field<string>("acname")).ToArray());
                ////var districtlist = dtAccess.AsEnumerable().Select(r => r.Field<string>("district")).Distinct().ToArray();
                ////var assemblylist = dtAccess.AsEnumerable().Select(r => r.Field<string>("acname")).Distinct().ToArray();
                ////alldata = alldata.Where(x => districtlist.Contains(x.district));
                ////alldata = alldata.Where(x => assemblylist.Contains(x.acname));

                ////if (ddlStatus.SelectedValue!="" && ddlStatus.SelectedValue != "BOTH")
                ////{
                ////    alldata = alldata.Where(x => x.status == ddlStatus.SelectedValue);
                ////}
                ////totalDatacount = alldata.Count();
                ////int totalPages = (totalDatacount + pageitemcount - 1) / pageitemcount;

                ////if (PageNumber > totalPages)
                ////{
                ////    PageNumber = 1;
                ////}
                ////startRow = ((PageNumber - 1) * pageitemcount);
                ////GridView1.DataSource = alldata.Skip(startRow).Take(pageitemcount).OrderBy(x => x.district);
                ////GridView1.DataBind();
                ////BindPager(alldata.Count(), this.PageNumber, pageitemcount);
                string status = "";
                //if (ddlStatus.SelectedValue != "BOTH" && ddlStatus.SelectedValue != "")
                //{
                //    status = ddlStatus.SelectedValue;
                //}
                DataSet dsNew = _boothlist.GetMapBoothListNew_Download(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, status, -1, -1, "", strm_txtBox.Text,"",FromDt.Text.Trim());
                totalDatacount = dsNew.Tables[0].Rows.Count;
                int totalPages = (totalDatacount + pageitemcount - 1) / pageitemcount;

                if (PageNumber > totalPages)
                {
                    PageNumber = 1;
                }
                startRow = ((PageNumber - 1) * pageitemcount);
                if (dsNew.Tables[0].Rows.Count != 0)
                {
                    GridView1.DataSource = dsNew.Tables[0].Select("rn >= " + (startRow + 1).ToString() + " AND rn <= " + (startRow + pageitemcount).ToString()).CopyToDataTable();
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
                GridView1.DataSource = dsNew.Tables[0].Select("rn >= " + (startRow + 1).ToString() + " AND rn <= " + (startRow + pageitemcount).ToString()).CopyToDataTable();
                GridView1.DataBind();
                BindPager(totalDatacount, this.PageNumber, pageitemcount);
                //  BindPager(totalDatacount, this.PageNumber, pageitemcount);
                //DataSet dstotal = new DataSet();
                //dstotal = _boothlist.GetBoothList("admin", false);
                //LiveCount2(usertype, dstotal.Tables[0].Rows.Count, dstotal.Tables[0].Select().Where(s => s["status"].ToString().ToUpper() == "RUNNING").Count(), Convert.ToInt32(dstotal.Tables[1].Rows[0]["staticcount"]), Convert.ToBoolean(dstotal.Tables[1].Rows[0]["isenable"].ToString()));
                //DataPager1.Visible = (DataPager1.PageSize < DataPager1.TotalRowCount);
                //if (utypeall.StartsWith("eci"))
                //{
                //    LiveCountECI(usertype, ds.Tables[0].Rows.Count, ds.Tables[0].Select().Where(s => s["status"].ToString().ToUpper() == "RUNNING").Count());
                //}
                //else
                //{
                //    // LiveCount(usertype, totalDatacount, ds.Tables[0].Select().Where(s => s["status"].ToString().ToUpper() == "RUNNING").Count());
                //    string lastworking = alldata.Where(x => x.lastseen >= DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1)).Count().ToString();
                //    int total_offline = alldata.Where(x => x.islive == false).Count();
                //    int total_online = alldata.Where(x => x.islive == true).Count();
                //    int total_count = total_online + total_offline;
                //    //<b>District :</b> " + ddlDistrict.SelectedItem.Text + ",
                //    //   lblonlinecounter.Text = "<b> Alloted Booth : </b>" + total_count + " | <b>Last hour Live Booth :  </b>" + lastworking;
                //    //lblonlinecounter.Text = "<b> Alloted Booth : </b>" + total_count + " |  <b>Connected Once :  </b>" + total_online.ToString();
                //    totalbooth.InnerHtml = total_count.ToString();
                //    runningbooth.InnerHtml = total_online.ToString();
                //    stopbooth.InnerHtml = total_offline.ToString();
                //}

                //  Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                Common.Log("LoadBooth_list() -- >  " + ex.Message);
            }
        }
        [WebMethod]
        public static List<string> GetBoothLocation(string locationtext, string district, string acname, int f)
        {
            db_data _db = new db_data();
            string usertype_loc;
            string districtm = ConfigurationManager.AppSettings["district"].ToString();
            string allKeywordm = ConfigurationManager.AppSettings["AllSelectKeword"].ToString() + " ";
            if (district == allKeywordm + districtm)

            {
                //  DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
                usertype_loc = "admin";
            }
            else
            {
                if (acname == "ALL " + ConfigurationManager.AppSettings["assemblyname"].ToString())
                {
                    usertype_loc = "dst_" + district;
                }
                else
                {
                    usertype_loc = "sch_" + district + "_" + acname;
                }
            }

            if (f == 1)

                return _db.Getbooth(locationtext, "ac/ps#" + usertype_loc);
            else
                return _db.GetLocation(locationtext, usertype_loc);


        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //string Status = DataBinder.Eval(e.Row.DataItem, "status").ToString();
                    //string islive = DataBinder.Eval(e.Row.DataItem, "islive").ToString();
                    //int min = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "mincount").ToString());
                    // HtmlAnchor hplocbtn = (HtmlAnchor)e.Row.FindControl("lnkplay");

                    //if (Status == "RUNNING")
                    //{
                    //    //hplocbtn.Controls.Add(new LiteralControl("<span class='glyphicon glyphicon-stop green pull-left'></span> "));
                    //}
                    //else
                    //{
                    //    //hplocbtn.Controls.Add(new LiteralControl("<span class='glyphicon glyphicon-stop red pull-left'></span> "));
                    //}
                    //string location = DataBinder.Eval(e.Row.DataItem, "location").ToString();
                    //Common cm = new Common();
                    //if (cm.isMobile())
                    //{
                    //    GridView1.Columns[1].Visible = false;
                    //    GridView1.Columns[2].Visible = false;
                    //    GridView1.Columns[3].Visible = false;
                    //    GridView1.Columns[4].Visible = true;
                    //    GridView1.Columns[5].Visible = false;
                    //}
                    //if (Page.User.Identity.Name.ToString().ToLower() == ConfigurationManager.AppSettings["viewcountuser"].ToString())
                    //{
                    //    GridView1.Columns[7].Visible = true;
                    //    GridView1.Columns[8].Visible = true;
                    //}
                    //if (min > 0)
                    //{
                    //    int h = min / 60;
                    //    int m = min % 60;

                    //    string hour = h.ToString();
                    //    string minute = m.ToString();
                    //    if (hour.Length == 1)
                    //    {
                    //        hour = "0" + hour;
                    //    }
                    //    if (minute.Length == 1)
                    //    {
                    //        minute = "0" + minute;
                    //    }
                    //    e.Row.Cells[8].Text = hour + ":" + minute;

                    //}

                    //if (islive.ToUpper() == "TRUE")
                    //{
                    //    e.Row.Cells[7].Text = "Tested";
                    //}
                    //else
                    //{
                    //    e.Row.Cells[7].Text = "Pending";
                    //}


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
                // Thread.Sleep(5000);
                // Timer1.Enabled = false;

                loaddata();

            }
            catch (Exception ex)
            {

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                loaddata();
            }
            catch (Exception ex)
            {
            }
        }

        private void LiveCount2(string usertype, int totalcount, int cur_livecount, int staticlivecount, bool displaystaticlive)
        {
            //lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ", <b> AC Name : </b> " + ddlbooth.SelectedItem.Text + " - <b> Alloted Booth : </b>" + totalcount + " | <b> Working booth : </b>" + _boothlist.LiveCounter("uadmin2");
            if (displaystaticlive)
            {
                totalbooth.InnerHtml = totalcount.ToString();
                runningbooth.InnerHtml = staticlivecount.ToString();
                //stopbooth.InnerHtml = total_offline.ToString();
                //lblonlinecounter.Text = "<b>Total Alloted Booth : </b>" + totalcount + " | <b>Working Booth : </b>" + staticlivecount;
            }
            else
            {
                totalbooth.InnerHtml = totalcount.ToString();
                runningbooth.InnerHtml = cur_livecount.ToString();
                //stopbooth.InnerHtml = total_offline.ToString();
                //lblonlinecounter.Text = "<b>Total Alloted Booth : </b>" + totalcount + " | <b>Working Booth : </b>" + cur_livecount;
            }
        }
        private void LiveCount(string usertype, int totalcount, int cur_livecount)
        {
            if (utypeall != "live_all")
            {
                if (utypeall != "live")
                {
                    if (usertype != "live")
                    {
                        if (!utypeall.Contains("_all"))
                        {
                            if (!utypeall.StartsWith("sch"))
                            {
                                loadonlinecounter(totalcount);
                            }
                        }
                        else
                        {
                            if (ddlDistrict.SelectedIndex > 0)
                            {
                                loadonlinecounter(totalcount);
                            }
                            else
                            {
                                totalbooth.InnerHtml = totalcount.ToString();
                                runningbooth.InnerHtml = _boothlist.LiveCounter("uadmin2", hrflag, stateid);
                                //stopbooth.InnerHtml = total_offline.ToString();
                                //lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ", <b> Alloted Booth : </b>" + totalcount + " | <b>Live Booth :  </b>" + _boothlist.LiveCounter("uadmin2", hrflag, stateid);
                            }
                        }
                    }
                    else
                    {
                        divonlinecounter.Visible = false;
                        //lblonlinecounter.Visible = false;
                    }
                }
            }
        }
        private void LiveCountECI(string usertype, int totalcount, int cur_livecount)
        {
            if (ddlDistrict.SelectedIndex > 0)
            {
                totalbooth.InnerHtml = totalcount.ToString();
                runningbooth.InnerHtml = _boothlist.LiveCounterECI("dst_" + ddlDistrict.SelectedItem.Text, stateid);
                //stopbooth.InnerHtml = total_offline.ToString();
                //lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ",  <b> Alloted Booth : </b>" + totalcount + " | <b>Live Booth of District : </b>" + _boothlist.LiveCounterECI("dst_" + ddlDistrict.SelectedItem.Text, stateid);

            }
            else
            {
                totalbooth.InnerHtml = totalcount.ToString();
                runningbooth.InnerHtml = _boothlist.LiveCounterECI("uadmin2", stateid);
                //stopbooth.InnerHtml = total_offline.ToString();
                //lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ", <b> Alloted Booth : </b>" + totalcount + " | <b>Live Booth :  </b>" + _boothlist.LiveCounterECI("uadmin2", stateid);
            }

        }
        private void loadonlinecounter(int totalcount)
        {
            totalbooth.InnerHtml = _boothlist.LiveCounter("dst_" + ddlDistrict.SelectedItem.Text + "_dstcount", hrflag, stateid);
            runningbooth.InnerHtml = _boothlist.LiveCounter("dst_" + ddlDistrict.SelectedItem.Text, hrflag, stateid);
            //stopbooth.InnerHtml = total_offline.ToString();
            //lblonlinecounter.Text = "<b>District :</b> " + ddlDistrict.SelectedItem.Text + ",  <b> Alloted Booth : </b>" + _boothlist.LiveCounter("dst_" + ddlDistrict.SelectedItem.Text + "_dstcount", hrflag, stateid) + " | <b>Live Booth of District : </b>" + _boothlist.LiveCounter("dst_" + ddlDistrict.SelectedItem.Text, hrflag, stateid);
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
            //        usertype = utypeall.Replace("_all", "");
            //    }
            //    else
            //    {
            //        if (ddlAssembly.SelectedValue == "0")
            //        {
            //            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //        }
            //        else
            //        {
            //            if (ddlbooth.SelectedValue == "0")
            //            {
            //                usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
            //            }
            //            else
            //            {
            //                usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //            }
            //        }
            //    }
            //}
            //else if (utypeall.StartsWith("pc"))
            //{
            //    //usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
            //    if (ddlbooth.SelectedValue == "0")
            //    {
            //        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
            //    }
            //    else
            //    {
            //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;

            //    }
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
            //        if (ddlAssembly.SelectedValue == "0")
            //        {
            //            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //        }
            //        else
            //        {
            //            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
            //        }
            //    }
            //}
            //else
            //{
            //    if (ddlAssembly.SelectedValue == "0")
            //    {
            //        usertype = "dst_" + ddlDistrict.SelectedItem.Text;
            //    }
            //    else
            //    {
            //        if (ddlbooth.SelectedValue == "0")
            //        {
            //            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
            //        }
            //        else
            //        {
            //            usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
            //        }
            //    }
            //    //else
            //    //{
            //    //    usertype = "dd_" + ddlDistrict.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddllocation.SelectedItem.Text + "_" + ddlDate.SelectedItem.Text;
            //    //}
            //}
            LoadBooth(usertype);
            //Timer1.Enabled = true;
        }
        private void LoadDistrict(string usertype)
        {
            try
            {
                //DataSet ds_dist = new DataSet();
                //if (utypeall.StartsWith("sch_") || utypeall.StartsWith("dst_"))
                //{
                //    ddlDistrict.Items.Clear();
                //    ddlDistrict.Items.Insert(0, new ListItem(usertype.Split('_')[1], usertype.Split('_')[1]));
                //}
                //else
                //{
                //    objloadtop.LoadDistrict(usertype, utypeall, stateid, out ds_dist);

                //    ddlDistrict.DataSource = ds_dist;
                //    ddlDistrict.DataTextField = "District";
                //    ddlDistrict.DataValueField = "SelValue";
                //    ddlDistrict.DataBind();
                //}
                //string seldist = "";
                //var a =usertype.Split('_');
                //if (a.Length >= 2)
                //    seldist = a[1];

                //if (seldist != "")
                //{
                //    ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByText(seldist));
                //}
                //else
                //{
                //   // ddlDistrict.SelectedIndex = Session["ddldistgrid"] != null ? Convert.ToInt32(Session["ddldistgrid"]) : 0;
                //}
                //ddlDistrict_SelectedIndexChanged(ddlDistrict, null);
                var Alldist = _boothlist.GetAllDistrictByStateId(stateid);

                ddlDistrict.DataSource = Alldist;
                ddlDistrict.DataTextField = "district";
                ddlDistrict.DataValueField = "district";
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new ListItem("ALL District", ""));
                ddlAssembly.Items.Insert(0, new ListItem("ALL Assembly", ""));
                //ddlStatus.Items.Clear();
                //ddlStatus.Items.Insert(0, new ListItem("Select Status", ""));
            }
            catch (Exception ex)
            {
                Common.Log("LoadDistrict_list() -- >  " + ex.Message);
            }
        }
        private void LoadAssembly(string District)
        {
            try
            {
                //if (!utypeall.StartsWith("pc_"))
                //{
                //DataSet ds_PC = new DataSet();
                // if (utypeall.StartsWith("sch_"))
                //    {
                //        ddlAssembly.Items.Clear();
                //        ddlAssembly.Items.Insert(0, new ListItem(utypeall.Split('_')[2], utypeall.Split('_')[2]));
                //    }
                //    else
                //    {
                //objloadtop.LoadPC(District, usertype, selectpc, utypeall, stateid, out ds_PC);

                //ddlAssembly.DataSource = ds_PC;
                //ddlAssembly.DataTextField = "accode";
                //ddlAssembly.DataValueField = "SelValue";
                //ddlAssembly.DataBind();
                //}
                //ddlAssembly.SelectedIndex = 0;
                //ddlAssembly_SelectedIndexChanged(ddlAssembly, null);
                //LoadSchool(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Text, usertype);
                var Assembly = _boothlist.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);

                ddlAssembly.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "acname";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new ListItem("ALL Assembly", ""));
                //ddlStatus.Items.Clear();
                //ddlStatus.Items.Insert(0, new ListItem("Select Status", ""));
            }
            catch (Exception ex)
            {
                Common.Log("LoadSchool_list() -- >  " + ex.Message);
            }
        }
        //private void LoadStatus()
        //{
        //    List<ListItem> items = new List<ListItem>();
        //    items.Add(new ListItem() { Text = "Select Status", Value = "" });
        //    items.Add(new ListItem() { Text = "Online", Value = "RUNNING" });
        //    items.Add(new ListItem() { Text = "Offline", Value = "STOPPED" });
        //    items.Add(new ListItem() { Text = "Both", Value = "BOTH" });

        //    ddlStatus.Items.Clear();
        //    ddlStatus.DataSource = items;
        //    ddlStatus.DataTextField = "Text";
        //    ddlStatus.DataValueField = "Value";
        //    ddlStatus.DataBind();
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
        //     //   int sch_count = ds_booth.Tables[0].Rows.Count;
        //        //if (sch_count > 1 || sch_count == 0)
        //        //{
        //        //    ddlbooth.Items.Insert(0, new ListItem("ALL " + assemblyname, "0"));
        //        //    ddlpsbooth.Items.Insert(0, new ListItem("ALL Booth", "0"));

        //        //}
        //        ddlbooth.SelectedIndex = 0;
        //        ddlbooth_SelectedIndexChanged(ddlAssembly, null);
        //        //loadpsbooth(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Text, ddlbooth.SelectedItem.Text, usertype);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadSchool_list() -- >  " + ex.Message);
        //    }
        //}
        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PageNumber = 1;
                //ddlAssembly.Items.Clear();
                //ddlbooth.Items.Clear();
                //string selpc = "";
                //if (utypeall.Contains("_all"))
                //{
                //    if (ddlDistrict.SelectedValue == "0")
                //    {
                //        //DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
                //        usertype = utypeall.Replace("_all", "");
                //        //ddlAssembly.Items.Insert(0, new ListItem("ALL " + pcname, "0"));
                //        LoadAssembly("", "ALL District-ALL PC", "");
                //    }
                //    else
                //    {
                //        usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                //        selpc = "SELECTPC";
                //        LoadAssembly(ddlDistrict.SelectedItem.Text, usertype, selpc);
                //    }
                //}
                //else if (utypeall.StartsWith("pc_"))
                //{
                //    LoadAssembly(ddlDistrict.SelectedItem.Text, usertype, utypeall.Split('_')[2]);
                //}
                //else
                //{
                //    usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                //    LoadAssembly(ddlDistrict.SelectedItem.Text, usertype, selpc);
                //}

                //ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByText(ddlDistrict.SelectedItem.Text));
                //Session["ddldistgrid"] = ddlDistrict.SelectedIndex;
                ////   usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                LoadAssembly(ddlDistrict.SelectedItem.Text);
                //if (ddlDistrict.SelectedValue != "")
                //{
                //    LoadStatus();
                //}
                //else
                //{
                //    ddlStatus.Items.Clear();
                //    ddlStatus.Items.Insert(0, new ListItem("Select Status", ""));
                //}
                LoadBooth(usertype);
            }
            catch (Exception ex)
            {
                Common.Log("ddlDistrict_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }
        protected void ddlAssembly_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PageNumber = 1;

                //LoadSchool(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Text, usertype);
                //if (ddlAssembly.SelectedValue != "")
                //{
                //    LoadStatus();
                //}
                //else
                //{
                //    ddlStatus.Items.Clear();
                //    ddlStatus.Items.Insert(0, new ListItem("Select Status", ""));
                //}
                //LoadStatus();
                LoadBooth(usertype);
            }
            catch (Exception ex)
            {
                Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }
        protected void ddlbooth_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PageNumber = 1;

                LoadBooth(usertype);
            }
            catch (Exception ex)
            {
                Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }

        public void BindPager(int totalRecordCount, int currentPageIndex, int pageSize)
        {
            int totalLinkInPage = 10;
            int totalPageCount = (int)Math.Ceiling((decimal)totalRecordCount / pageSize);
            List<ListItem> pageLinkContainer = new List<ListItem>();
            if (totalPageCount > 1)
            {
                int startPageLink = Math.Max(currentPageIndex - (int)Math.Floor((decimal)totalLinkInPage / 2), 1);
                int lastPageLink = Math.Min(startPageLink + totalLinkInPage - 1, totalPageCount);

                if ((startPageLink + totalLinkInPage - 1) > totalPageCount)
                {
                    lastPageLink = Math.Min(currentPageIndex + (int)Math.Floor((decimal)totalLinkInPage / 2), totalPageCount);
                    startPageLink = Math.Max(lastPageLink - totalLinkInPage + 1, 1);
                }



                pageLinkContainer.Add(new ListItem("First", "1", currentPageIndex != 1));
                // pageLinkContainer.Add(new ListItem("FIRST", "1", currentPageIndex > 0));
                for (int i = startPageLink; i <= lastPageLink; i++)
                {
                    //pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPageIndex + 1 != i));
                    pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPageIndex != i));
                }

                pageLinkContainer.Add(new ListItem("Last", totalPageCount.ToString(), currentPageIndex != totalPageCount));
                //  pageLinkContainer.Add(new ListItem("LAST", totalPageCount.ToString(), currentPageIndex < totalPageCount - 1));
                prev.Visible = true;
                next.Visible = true;
            }
            else
            {
                prev.Visible = false;
                next.Visible = false;
            }
            prev.Enabled = currentPageIndex != 1;
            next.Enabled = currentPageIndex != totalPageCount;
            rptPages.DataSource = pageLinkContainer;
            rptPages.DataBind();

        }

        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = Convert.ToInt32(((sender as LinkButton).CommandArgument));
            this.PageNumber = pageIndex;
            loaddata();
        }



        protected void rptPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    LinkButton btnPage = (LinkButton)e.Item.FindControl("btn_page_camera");
                    // System.Web.UI.HtmlControls.HtmlAnchor lipager = (System.Web.UI.HtmlControls.HtmlAnchor)e.Item.FindControl("pager");
                    if (int.Parse(btnPage.Text) == PageNumber)
                    {
                        btnPage.Font.Underline = true;
                        btnPage.CssClass = "btn btn-primary btncustom";
                        //btnPage.Attributes.Add("class", "btn-primary");
                    }
                    else
                    {
                        btnPage.Font.Underline = false;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void next_Click(object sender, EventArgs e)
        {
            PageNumber = PageNumber + 1;

            loaddata();

        }

        protected void prev_Click(object sender, EventArgs e)
        {
            PageNumber = PageNumber - 1;

            loaddata();

        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                searchtext = txtSearch.Value;
                searchtext2 = txtSearch2.Value;
                PageNumber = 1;
                LoadBooth(usertype);
            }
            catch
            {

            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PageNumber = 1;

                LoadBooth(usertype);
            }
            catch (Exception ex)
            {
                Common.Log("ddlStatus_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }

        public void streamdownload(string uuid)
        {
            Response.Write("<script>alert('Hello');</script>");
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            //searchtext = Button2.Value;
            //searchtext2 = Button2.Value;
            PageNumber = 1;
            LoadBooth(usertype);
            
        }
    }
}