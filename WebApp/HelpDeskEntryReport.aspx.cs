using exam.DAL;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exam
{
    public partial class HelpDeskEntryReport : System.Web.UI.Page
    {
        db_data _data = new db_data();
        public string district = ConfigurationManager.AppSettings["district"].ToString();
        public string allKeyword = ConfigurationManager.AppSettings["AllSelectKeword"].ToString() + " ";
        public int pageitemcount = Convert.ToInt32(ConfigurationManager.AppSettings["pageitemcount"]);
        public static int totalDatacount = 0;
        public string pcname = ConfigurationManager.AppSettings["pcname"].ToString();
        public string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();
        public string usernametotal = ConfigurationManager.AppSettings["usertotal"].ToString();
        public int usernametotalen = Convert.ToInt32(ConfigurationManager.AppSettings["usertotalen"].ToString());
        public bool hrflag = Convert.ToBoolean(ConfigurationManager.AppSettings["hrflag"].ToString());
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
        public DataSet dsReport1
        {
            get
            {
                if (ViewState["dsReport1"] != null)
                    return (DataSet)ViewState["dsReport1"];
                else
                    return null;
            }
            set
            {
                ViewState["dsReport1"] = value;
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

                Session["MenuName"] = "HelpDeskReports";
                stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"]);
                if (!IsPostBack)
                {
                    FromDt.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    ToDt.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    LoadDistrict();
                    GetStopVehicleReasonList();
                }
                //ScriptManager1.RegisterPostBackControl(this.btnExportPDF);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void GetStopVehicleReasonList()
        {
            DataSet ds = new DataSet();
            ToDt.Text = FromDt.Text.Trim();
            string fromdate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string todate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string fromtime = "00:00:00";
            string totime = "23:59:59.999";
            var dt = _data.GetStopVehicleList(fromdate ,todate, ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, ddlVehicle.SelectedValue,strm_txtBox.Text);
            //dsReport = ds;
          
            dsReport1 = dt;
            //GridView1.DataSource = ds.Tables[0].DefaultView;
        }
            //GridView1.DataBind();

        //private void GetStopVehicleReasonList()
        //{
        //    DataSet ds = new DataSet();
        //    ds = _data.GetManualStopVehicleReasonList(FromDt.Text.Trim(), ToDt.Text.Trim(), ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, ddlVehicle.SelectedValue, 0);
        //    //dsReport = ds;
        //    DataTable dt1 = new DataTable();
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        dt1 = ds.Tables[0].AsEnumerable()
        //       .GroupBy(r => new { District = r["Districtname"], Accode = r["Acname"], Vehicle_No = r["VehicleNo"] })
        //       .Select(g => g.OrderBy(r => r["addedOn"]).First())
        //       .CopyToDataTable();
        //    }
        //    else
        //    {
        //        dt1 = ds.Tables[0].Clone();
        //    }
        //    dt1.TableName = "GroupTable";

        //    DataSet dataSet = new DataSet();
        //    dataSet.Tables.Add(dt1.Copy());
        //    dataSet.Tables.Add(ds.Tables[0].Copy());
        //    dsReport = dataSet;
        //    //GridView1.DataSource = ds.Tables[0].DefaultView;
        //    //GridView1.DataBind();
        //}

        private void LoadDistrict()
        {
            try
            {
                var Alldist = _data.GetAllDistrictByStateId(stateid);

                ddlDistrict.DataSource = Alldist;
                ddlDistrict.DataTextField = "district";
                ddlDistrict.DataValueField = "district";
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new ListItem("Select District", ""));
                ddlAssembly.Items.Insert(0, new ListItem("Select Assembly", ""));
                ddlVehicle.Items.Insert(0, new ListItem("Select Vehicle", ""));

            }
            catch (Exception ex)
            {
                Common.Log("HelpDeskEntryReport -- >  LoadDistrict()" + ex.Message);
            }
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                var Assembly = _data.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);

                ddlAssembly.Items.Clear();
                ddlVehicle.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "acname";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new ListItem("Select Assembly", ""));
                ddlVehicle.Items.Insert(0, new ListItem("Select Vehicle", ""));
                GetStopVehicleReasonList();
            }
            catch (Exception ex)
            {
                Common.Log("HelpDeskEntryReport -- >  ddlDistrictOnSelectedIndexChanged()" + ex.Message);
            }
        }

        protected void ddlAssembly_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Loadvehicalddl();
                GetStopVehicleReasonList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  AssemblyDropDownOnSelectedIndexChanged()" + ex.Message);
            }
        }


        protected void ddlVehicle_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GetStopVehicleReasonList();
            }
            catch (Exception ex)
            {
                Common.Log("HelpDeskEntryReport -- >  ddlVehicle_SelectedIndexChanged()" + ex.Message);
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            GetStopVehicleReasonList();
        }

        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            string content = "";
            var sb = new StringBuilder();
            //divReport1.RenderControl(new HtmlTextWriter(new StringWriter(sb)));
            content = sb.ToString();

            DateTime currentTime = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Help_Desk_Entry_Report_" + currentTime.ToString("ddMMyyyyhhmmss") + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            string headertext = "";
            if (FromDt.Text.Trim() != "" && ToDt.Text.Trim() != "")
            {
                headertext = "<h2><div style='text-align:center;'>Help Desk Entry Report From " + FromDt.Text.Trim() + " To " + ToDt.Text.Trim() + "</div></h2><br/><br/>";
            }
            else
            {
                headertext = "<h2><div style='text-align:center;'>Help Desk Entry Report</div></h2><br/><br/>";
            }

            string legendtext = "";
            legendtext = "<br/><br/><div style='text-align:right;'>This is system genereted report. Printed on " + currentTime.ToString("dd/MM/yyyy hh:mm:ss tt") + "</div>";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
           // divReport.RenderControl(htmlTextWriter);
            StringReader stringReader = new StringReader(headertext + stringWriter.ToString() + legendtext);
            iTextSharp.text.Document Doc = new iTextSharp.text.Document(iTextSharp.text.PageSize.A4, 10, 10, 100, 0);
            HTMLWorker htmlparser = new HTMLWorker(Doc);
            PdfWriter.GetInstance(Doc, Response.OutputStream);
            Doc.Open();
            htmlparser.Parse(stringReader);
            Doc.Close();

            Response.Write(Doc);
            Response.End();
        }
        private void Loadvehicalddl()
        {
            try
            {
                db_data dbContext = new db_data();
                var vehicle = dbContext.GetShiftWizeVehicleByAcname(ddlAssembly.SelectedItem.Value);

                ddlVehicle.Items.Clear();
                ddlVehicle.DataSource = vehicle;
                ddlVehicle.DataTextField = "location";
                ddlVehicle.DataValueField = "location";
                ddlVehicle.DataBind();
                ddlVehicle.Items.Insert(0, new ListItem("Select Vehicle", ""));

            }
            catch (Exception ex)
            {
                Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }
    }
}