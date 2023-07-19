
using exam.DAL;
using exam.services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Control = System.Web.UI.Control;
using TableCell = System.Web.UI.WebControls.TableCell;

namespace exam
{
    public partial class cam_alert : System.Web.UI.Page
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
        public DataSet dsReport
        {
            get
            {
                if (ViewState["dsReport"] != null)
                    return (DataSet)ViewState["dsReport"];
                else
                    return null;
            }
            set
            {
                ViewState["dsReport"] = value;
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

                }
            }
            else if (utypeall.StartsWith("pc"))
            {

                // usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;


            }
            else if (utypeall.StartsWith("sch_"))
            {

            }
            else if (utypeall.StartsWith("zn"))
            {
                if (ddlDistrict.SelectedValue == "0")
                {
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

                Session["MenuName"] = "NetWorkStatusReport";
                ScriptManager1.RegisterPostBackControl(this.btnExportExcel);
                ScriptManager1.RegisterPostBackControl(this.btnpdf);
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
                    if (Request.QueryString.Count > 0 && Request.QueryString["s"] != null)
                    {
                        string str = Common.Decode(Request.QueryString["s"].ToString());
                        usertype = str;
                        searchtext = Request.QueryString["s1"] != null ? Common.base64Decode(Request.QueryString["s1"].ToString()) : string.Empty;
                        // txtSearch.Text = searchtext;
                        searchtext2 = Request.QueryString["s2"] != null ? Common.base64Decode(Request.QueryString["s2"].ToString()) : string.Empty;
                        // txtSearch2.Text = searchtext2;
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
                string fromdate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
                string todate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
                string fromtime = ddlFromTime.SelectedValue;
                string totime = ddlToTime.SelectedValue;
                fromtime = fromtime == "" ? "00:00:00" : fromtime;
                totime = totime == "" ? "23:59:59.999" : totime;
                //  string fromdate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
                DataSet dsNew = _boothlist.Getnotification(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, FromDt.Text + " " + fromtime, FromDt.Text + " " + totime, strm_txtBox.Text, "", ddltype.SelectedIndex);
                totalDatacount = dsNew.Tables[0].Rows.Count;
                int totalPages = (totalDatacount + pageitemcount - 1) / pageitemcount;

                ////if (PageNumber > totalPages)
                ////{
                ////    PageNumber = 1;
                ////}
                ////int startindex = 0;
                ////try
                ////{
                ////    startindex = Convert.ToInt32(dsNew.Tables[0].Rows[0]["rn"].ToString());
                     
                ////}
                ////catch (Exception ex)
                ////{
                ////    Common.Log("LoadBooth_list() -- >  " + ex.Message);
                ////} 
                GridView1.DataSource = dsNew;
                GridView1.DataBind();
                

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

                }
            }
            catch (Exception ex)
            {
                Common.Log("dsReport_RowDataBound_list() -- >  " + ex.Message);
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
                        }
                    }
                    else
                    {
                       
                    }
                }
            }
        }
        private void LiveCountECI(string usertype, int totalcount, int cur_livecount)
        {
            if (ddlDistrict.SelectedIndex > 0)
            {
                
            }
            else
            {
                   }

        }
        private void loadonlinecounter(int totalcount)
        {
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
            //Timer1.Enabled = true;
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

                ddlDistrict.Items.Insert(0, new System.Web.UI.WebControls.ListItem("ALL District", ""));
                ddlAssembly.Items.Insert(0, new System.Web.UI.WebControls.ListItem("ALL Assembly", "")); 
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

                ddlAssembly.Items.Insert(0, new System.Web.UI.WebControls.ListItem("ALL Assembly", ""));
                //ddlStatus.Items.Clear();
                //ddlStatus.Items.Insert(0, new ListItem("Select Status", ""));
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
                searchtext = strm_txtBox.Text;
                //int search=Convert.ToInt32(searchtext);
                //  searchtext2 = txtSearch2.Text;

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

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            //// Retrieve the dataset or datatable containing the data to export
            //DataSet dataSet = GetDataSet(); // Replace with your actual method to get the dataset/table

            //// Create a new GridView control to render the data
            //GridView gridView = new GridView();
            //gridView.DataSource = dataSet.Tables[0]; // Assuming the first table in the dataset
            //gridView.DataBind();

            //// Hide pagination controls
            //gridView.PagerSettings.Visible = false;

            //// Set the height and width of all table cells
            //foreach (GridViewRow row in gridView.Rows)
            //{
            //    foreach (TableCell cell in row.Cells)
            //    {
            //        cell.Style["height"] = "100px";
            //        cell.Style["width"] = "100px";
            //    }
            //}

            //// Prepare the response for Excel
            //Response.Clear();
            //Response.Buffer = true;
            //Response.AddHeader("content-disposition", "attachment;filename=GridViewData.xls");
            //Response.Charset = "";
            //Response.ContentType = "application/vnd.ms-excel";
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);

            //// Manually render the HTML for each row and cell
            //foreach (GridViewRow row in gridView.Rows)
            //{
            //    hw.Write("<tr>");
            //    foreach (TableCell cell in row.Cells)
            //    {
            //        hw.Write("<td style='height:100px;width:100px;'>");
            //        hw.Write(cell.Text);
            //        hw.Write("</td>");
            //    }
            //    hw.Write("</tr>");
            //}

            //// Write the HTML to the response
            //Response.Output.Write(sw.ToString());
            //Response.Flush();
            //Response.End();

        }

        protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
        {
            PageNumber = 1;

            LoadBooth(usertype);
        } 
        public override void VerifyRenderingInServerForm(Control control)
        {

        } 
        protected void btnpdf_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            string fromdate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string todate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string fromtime = ddlFromTime.SelectedValue;
            string totime = ddlToTime.SelectedValue;
            fromtime = fromtime == "" ? "00:00:00" : fromtime;
            totime = totime == "" ? "23:59:59.999" : totime;
            // Set up the GridView
            GridView1.AllowPaging = false;
            DataSet dsNew = _boothlist.Getnotification(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, FromDt.Text + " " + fromtime, FromDt.Text + " " + totime, strm_txtBox.Text, "", ddltype.SelectedIndex);
            GridView1.DataSource = dsNew;
            GridView1.DataBind();

            // Apply text style to each row
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                row.Attributes.Add("class", "textmode");
            }

            // Render the GridView to the StringWriter
            GridView1.RenderControl(hw);

            // Add style to format numbers as strings
            string style = @"<style>.textmode { mso-number-format:\@; }</style>";
            Response.Write(style);

            // Export the image column separately
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                TableCell cell = row.Cells[5]; // Replace 'ImageColumnIndex' with the index of the image column in your GridView

                // Find the image control within the cell
                ImageButton image = cell.FindControl("ImageButton1") as ImageButton; // Replace 'ImageControlID' with the ID of the Image control in your GridView

                if (image != null)
                {
                    string imageUrl = image.ImageUrl;
                    // Write the image URL to the response
                    Response.Write("<img src='" + imageUrl + "'/>");
                }
            }

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        
    }
        
}


