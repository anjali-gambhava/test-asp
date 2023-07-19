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
using System.Text;
using ClosedXML.Excel; 
using System.Drawing; 

namespace exam
{
    public partial class CameraStatus : System.Web.UI.Page
    {
        LoadTopSelections objloadtop = new LoadTopSelections();

        db_data _boothlist = new db_data();
        db_data_admin _dbadmin = new db_data_admin();
        db_list_lq c1 = new db_list_lq();
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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                Session["MenuName"] = "CameraStatus";
                if (!IsPostBack)
                { 
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
                        if (utypeall.Contains("_all"))
                        {
                            LoadBooth(usertype);
                        }
                        else if (utypeall.StartsWith("pc"))
                        {
                            LoadBooth(usertype);
                        }
                        else if (utypeall.StartsWith("sch"))
                        {
                            LoadBooth(usertype);
                        }

                        else
                        {
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
                int startRow = ((PageNumber - 1) * pageitemcount);
                DataSet ds = new DataSet();

                int UserID = 0;
                if (Session["userid"] != null)
                    UserID = Convert.ToInt32(Session["userid"]);
                DataSet dspc = _dbadmin.allcountlivenew(usertype, UserID);
                DateTime chklastseen = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);

                BoothList = dspc; 
                if (utypeall.StartsWith("eci"))
                {
                    
                }
                else
                {
                    LiveCount(usertype, dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(TotalBooth)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(Live)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(stop)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(connectedonce)", string.Empty)) : 0
                        , dspc.Tables[0].Rows.Count >= 0 ? Convert.ToInt32(dspc.Tables[0].Compute("SUM(lastLive)", string.Empty)) : 0
                        
                    );

                      }
                 
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
        
        private void LiveCount(string usertype, int totalcount, int cur_livecount, int cur_stopcount, int cur_ConnectedOnce, int cur_lastlivecount)
        {
             
            totalbooth.InnerHtml = totalcount.ToString();
            runningbooth.InnerHtml = cur_livecount.ToString();
            runningboothlast.InnerHtml = cur_lastlivecount.ToString();
            stopbooth.InnerHtml = cur_stopcount.ToString();
            Connectedonce.InnerHtml = cur_ConnectedOnce.ToString();
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

        public void setusertype()
        {
             
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
         
        public override void VerifyRenderingInServerForm(Control control)
        {
             
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
                PageNumber = 1; 
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

        protected void btnexport_Click(object sender, EventArgs e)
        {

            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);
            DataSet dataexport = _dbadmin.ExportDashboardStatus(usertype, UserID);
            DataTable dataexportdt = dataexport.Tables[0];
            string datetime = dataexport.Tables[1].Rows[0]["fileName"].ToString();
            string attachment = "attachment; filename=" + datetime + ".xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.ms-excel";
            string tab = "";
            dataexportdt.Columns.Remove(dataexportdt.Columns[0]);
            foreach (DataColumn dc in dataexportdt.Columns)
            {
                Response.Write(tab + dc.ColumnName);
                tab = "\t";
            }
            Response.Write("\n");
            int i;
            foreach (DataRow dr in dataexportdt.Rows)
            {
                tab = "";
                for (i = 0; i < dataexportdt.Columns.Count; i++)
                {
                    Response.Write(tab + dr[i].ToString());
                    tab = "\t";
                }

                Response.Write("\n");
            }
            Response.End(); 
        }

        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            loaddata(); 
         
    }
    }
}