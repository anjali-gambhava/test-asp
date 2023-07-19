using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using exam.DAL;
using System.Data;
using System.Configuration;
using exam.services;

namespace exam
{
    public partial class GridView : System.Web.UI.Page
    {
        LoadTopSelections objloadtop = new LoadTopSelections();

        db_data _boothgrid = new db_data();
        db_list_lq c1 = new db_list_lq();
        //public int pageitemcount = 6;
        //public static int totalDatacount = 0;
        public string pcname = ConfigurationManager.AppSettings["pcname"].ToString();
        public string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();
        string PrevNextBtnEnable = ConfigurationManager.AppSettings["PrevNextBtnEnable"].ToString();
        // registrationDAL _regDal = new registrationDAL();
        public int pageitemcount
        {
            get
            {
                if (ViewState["pageitemcount"] != null)
                    return (int)ViewState["pageitemcount"];
                else
                    return 6;
            }
            set
            {
                ViewState["pageitemcount"] = value;
            }
        }
        public int gridcolumns
        {
            get
            {
                if (ViewState["gridcolumns"] != null)
                    return (int)ViewState["gridcolumns"];
                else
                    return 3;
            }
            set
            {
                ViewState["gridcolumns"] = value;
            }
        }
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


        public string username
        {
            get
            {
                if (ViewState["username"] != null)
                    return (string)ViewState["username"];
                else
                    return "1";
            }
            set
            {
                ViewState["username"] = value;
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
        public int gridtypeval
        {
            get
            {
                if (ViewState["gridtypeval"] != null)
                    return (int)ViewState["gridtypeval"];
                else
                    return 6;
            }
            set
            {
                ViewState["gridtypeval"] = value;
            }
        }
        public int totalDatacount
        {
            get
            {
                if (ViewState["totalDatacount"] != null)
                    return (int)ViewState["totalDatacount"];
                else
                    return 6;
            }
            set
            {
                ViewState["totalDatacount"] = value;
            }
        }
        public void setusertype()
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Session.Timeout = 240;
                }
                Session["MenuName"] = "GridView";
                if (!IsPostBack)
                {
                    DataSet ds = _boothgrid.GetUserData(Page.User.Identity.Name);
                    usertype = ds.Tables[0].Rows[0]["usercode"].ToString();
                    username = ds.Tables[0].Rows[0]["username"].ToString();
                    stateid = Convert.ToInt32(ds.Tables[0].Rows[0]["stateid"]);
                    utypeall = usertype;
                    if (utypeall.Contains("_all"))
                    {
                        usertype = usertype.Replace("_all", "");
                    }
                    if (!string.IsNullOrEmpty(usertype))
                    {
                        LoadDistrict(usertype);
                    }
                    int t = Convert.ToInt32(ddlTimer.SelectedValue);
                    if (t == 0)
                    {
                        Timer1.Enabled = false;
                    }
                    LoadBooth(usertype);
                }
            }
            catch (Exception ex)
            {
                Common.Log("Page_Load_gridauto() -- >  " + ex.Message);
            }
        }

        private void LoadBooth(string usertype)
        {
            var dsNew = new DataSet();
            try
            {
                setusertype();
                pageitemcount = gridtypeval;

                int startRow = ((PageNumber - 1) * pageitemcount);
                DataSet ds = new DataSet();
                IQueryable<dbData> alldata = Enumerable.Empty<dbData>().AsQueryable();
                bool isgrid = false;
                int? ident = c1.getUserIdentifier(Convert.ToInt32(Session["userid"]));
                if (ident == 4)
                    isgrid = true;

                if (usertype.ToLower().Equals("ceo") || usertype.ToLower().Equals("eci"))
                {
                    dsNew = _boothgrid.GetOnlineMapBoothListNew(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, "", -1, -1, "", "", "status");
                    DataTable dtAccess = (DataTable)HttpContext.Current.Session["userAssemblyAccess"];
                    var districtlist = dtAccess.AsEnumerable().Select(r => r.Field<string>("district")).Distinct().ToArray();
                    var assemblylist = dtAccess.AsEnumerable().Select(r => r.Field<string>("acname")).Distinct().ToArray();
                    var data = dsNew.Tables[0].AsEnumerable().Where(x => districtlist.Contains(x.Field<string>("district")));
                    data = data.Where(x => assemblylist.Contains(x.Field<string>("acname")));

                    data = data.OrderBy(x => x.Field<string>("status")).ThenBy(x => x.Field<string>("district"));
                    int totalCount = data.Count();
                    int totalPages = (totalCount + pageitemcount - 1) / pageitemcount;


                    startRow = ((PageNumber - 1) * pageitemcount);
                    listview1.DataSource = data.Skip(startRow).Take(pageitemcount).ToList().CopyToDataTable();
                    listview1.DataBind();
                    totalDatacount = data.Count();
                    BindPager(totalDatacount, this.PageNumber, pageitemcount);
                }

                else
                {

                    dsNew = _boothgrid.GetMapBoothListNew(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, "", -1, -1, "", "", "status");
                    DataTable dtAccess = (DataTable)HttpContext.Current.Session["userAssemblyAccess"];
                    var districtlist = dtAccess.AsEnumerable().Select(r => r.Field<string>("district")).Distinct().ToArray();
                    var assemblylist = dtAccess.AsEnumerable().Select(r => r.Field<string>("acname")).Distinct().ToArray();
                    var data = dsNew.Tables[0].AsEnumerable().Where(x => districtlist.Contains(x.Field<string>("district")));
                    data = data.Where(x => assemblylist.Contains(x.Field<string>("acname")));

                    data = data.OrderBy(x => x.Field<string>("status")).ThenBy(x => x.Field<string>("district"));
                    int totalCount = data.Count();
                    int totalPages = (totalCount + pageitemcount - 1) / pageitemcount;

                    //if (usertype.ToLower() == "district_level" || usertype.ToLower() == "assembly_level")
                    //{
                    //    int totalOnlineCount = data.Where(x => x.Field<string>("status") == "RUNNING").Count();
                    //    int totalOnlinePages = (totalOnlineCount + pageitemcount - 1) / pageitemcount;
                    //    if (PageNumber > totalPages || PageNumber > totalOnlinePages)
                    //    {
                    //        PageNumber = 1;
                    //    }
                    //}
                    //else
                    //{
                    //    if (PageNumber > totalPages || PageNumber < 1)
                    //    {
                    //        PageNumber = 1;
                    //    }
                    //}
                    startRow = ((PageNumber - 1) * pageitemcount);
                    listview1.DataSource = data.Skip(startRow).Take(pageitemcount).ToList().CopyToDataTable();
                    listview1.DataBind();
                    totalDatacount = data.Count();
                    BindPager(totalDatacount, this.PageNumber, pageitemcount);
                }



            }
            catch (Exception ex)
            {
                Common.Log("LoadBooth_grid() -- >  " + ex.Message);
            }
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            double getPageCount = (double)((decimal)totalDatacount / (decimal)pageitemcount);
            int pageCount = (int)Math.Ceiling(getPageCount);
            //PageNumber = PageNumber >= pageCount - 1 ? PageNumber = 1 : PageNumber + 1;
            PageNumber = PageNumber >= pageCount ? 1 : PageNumber + 1;

            loaddata();
        }
        private void loaddata()
        {
            LoadBooth(usertype);
            //Timer1.Enabled = true;
        }
        private void LoadDistrict(string usertype)
        {
            try
            {

                var Alldist = _boothgrid.GetAllDistrictByStateId(stateid);

                ddlDistrict.DataSource = Alldist;
                ddlDistrict.DataTextField = "district";
                ddlDistrict.DataValueField = "district";
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new ListItem("ALL District", ""));
                ddlAssembly.Items.Insert(0, new ListItem("ALL Assembly", ""));
            }
            catch (Exception ex)
            {
                Common.Log("LoadDistrict_list() -- >  " + ex.Message);
            }
        }
        private void LoadAssembly()
        {
            try
            {

                var Assembly = _boothgrid.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);

                ddlAssembly.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "acname";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new ListItem("ALL Assembly", ""));
                //LoadSchool(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Text, usertype);
            }
            catch (Exception ex)
            {
                Common.Log("LoadSchool_list() -- >  " + ex.Message);
            }
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PageNumber = 1;

                LoadAssembly();
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
            //pageSize = 1;
            int totalLinkInPage = 10;
            int totalPageCount = (int)Math.Ceiling((decimal)totalRecordCount / pageSize);
            List<ListItem> pageLinkContainer = new List<ListItem>();
            //if (totalPageCount > 1)
            //{
            int startPageLink = Math.Max(currentPageIndex - (int)Math.Floor((decimal)totalLinkInPage / 2), 1);
            int lastPageLink = Math.Min(startPageLink + totalLinkInPage - 1, totalPageCount);

            if ((startPageLink + totalLinkInPage - 1) > totalPageCount)
            {
                lastPageLink = Math.Min(currentPageIndex + (int)Math.Floor((decimal)totalLinkInPage / 2), totalPageCount);
                startPageLink = Math.Max(lastPageLink - totalLinkInPage + 1, 1);
            }



            ////////pageLinkContainer.Add(new ListItem("First", "1", currentPageIndex != 1));
            // pageLinkContainer.Add(new ListItem("FIRST", "1", currentPageIndex > 0));
            for (int i = startPageLink; i <= lastPageLink; i++)
            {
                //pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPageIndex + 1 != i));
                pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPageIndex != i));
            }

            ////////pageLinkContainer.Add(new ListItem("Last", totalPageCount.ToString(), currentPageIndex != totalPageCount));
            //  pageLinkContainer.Add(new ListItem("LAST", totalPageCount.ToString(), currentPageIndex < totalPageCount - 1));
            if (PrevNextBtnEnable == "Y")
            {
                prev.Text = "PREV";
                next.Text = "NEXT";
            }
            //prev.Visible = true;
            //next.Visible = true;
            //}
            //else
            //{
            //    //prev.Visible = false;
            //    //next.Visible = false;
            //}
            prev.Enabled = currentPageIndex > 1;
            next.Enabled = currentPageIndex <= totalPageCount;
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
            if (PrevNextBtnEnable == "Y")
            {
                PageNumber = PageNumber + 1;

            }
            else
            {
                PageNumber = PageNumber <= 5 ? 10 : (PageNumber + 4);
            }


            loaddata();

        }

        protected void prev_Click(object sender, EventArgs e)
        {
            if (PrevNextBtnEnable == "Y")
            {
                PageNumber = PageNumber - 1;
            }
            else
            {
                PageNumber = PageNumber > 5 ? (PageNumber - 5) : 1;
            }

            loaddata();

        }
        protected void ddlgrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            var dimention = ddlgrid.SelectedValue.Split('x');
            gridcolumns = Convert.ToInt32(dimention[0]);
            gridtypeval = Convert.ToInt32(dimention[0]) * Convert.ToInt32(dimention[1]);

            loaddata();
        }

        protected void ddlTimer_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = Convert.ToInt32(ddlTimer.SelectedValue);
            if (t == 0)
            {
                Timer1.Enabled = false;
            }
            else
            {
                Timer1.Enabled = true;
                Timer1.Interval = Convert.ToInt32(ddlTimer.SelectedValue);
            }
            loaddata();
        }

    }
}