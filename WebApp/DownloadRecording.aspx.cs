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
    public partial class DownloadRecording : System.Web.UI.Page
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
                }
            } 
            
            else
            {
                if (ddlAssembly.SelectedValue == "0")
                {
                    usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                } 
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
                    FromDt.Text = DateTime.Now.ToString("yyyy/MM/dd");
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
                            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                            LoadBooth(usertype);
                        }
                        else if (utypeall.StartsWith("sch"))
                        {
                            usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                            LoadBooth(usertype);
                        }
                        else
                        {
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
                int startRow = ((PageNumber - 1) * pageitemcount) + 1;
                DataSet ds = new DataSet();
                List<dbData> data = new List<dbData>();

                IQueryable<dbData> alldata = Enumerable.Empty<dbData>().AsQueryable();
                IQueryable<dbData> data_grd = Enumerable.Empty<dbData>().AsQueryable();
                string status = ""; 
                DataSet dsNew = _boothlist.GetMapBoothListNew_Download(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, status, -1, -1, "", strm_txtBox.Text, "", FromDt.Text.Trim());
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
            LoadBooth(usertype); 
        }
        private void LoadDistrict(string usertype)
        {
            try
            {
                var Alldist = _boothlist.GetAllDistrictByStateId(stateid);
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
        private void LoadAssembly(string District)
        {
            try
            { 
                var Assembly = _boothlist.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);
                ddlAssembly.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "acname";
                ddlAssembly.DataBind(); 
                ddlAssembly.Items.Insert(0, new ListItem("ALL Assembly", "")); 
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
                LoadAssembly(ddlDistrict.SelectedItem.Text); 
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
                 for (int i = startPageLink; i <= lastPageLink; i++)
                {
                     pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPageIndex != i));
                }

                pageLinkContainer.Add(new ListItem("Last", totalPageCount.ToString(), currentPageIndex != totalPageCount));
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
                    if (int.Parse(btnPage.Text) == PageNumber)
                    {
                        btnPage.Font.Underline = true;
                        btnPage.CssClass = "btn btn-primary btncustom";
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
            PageNumber = 1;
            LoadBooth(usertype); 
        }
    }
}