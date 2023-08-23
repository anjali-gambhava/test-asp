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
    public partial class ExcelReport : System.Web.UI.Page
    {
        db_data _data = new db_data(); 
        DataSet ds1 = new DataSet();
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
        public DataSet dsReport1 { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }

                Session["MenuName"] = "ExcelReport";
                stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"]);
                if (!IsPostBack)
                {
                    FromDt.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    ToDt.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    LoadDistrict();
                    GetStopCameraTotalList();
                }
                // ScriptManager1.RegisterPostBackControl(this.btnExportPDF);
                //ScriptManager1.RegisterPostBackControl(this.btnsearch);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void GetStopCameraTotalList()
        
        {
            DataSet dsColName = new DataSet();
            string fromdate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string todate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
          
                ddlFromTime.Enabled = true;
                ddlToTime.Enabled = true;
                dsReport1 = ds1;
                string fromtime = ddlFromTime.SelectedValue;
                string totime = ddlToTime.SelectedValue;
                fromtime = fromtime == "" ? "" : fromtime;
                totime = totime == "" ? "" : totime; 
                DataSet ds = _data.GetExcelReport(fromdate + " " + fromtime, todate + " " + totime, ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, ddlcamara.SelectedValue,Convert.ToInt32(ddlislive.SelectedValue),ddlStatus.SelectedValue);
                dsReport = ds;
        }

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
                ddlcamara.Items.Insert(0, new ListItem("Select Vehicle", ""));

            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  LoadDistrict()" + ex.Message);
            }
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                var Assembly = _data.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);

                ddlAssembly.Items.Clear();
                ddlcamara.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "acname";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new ListItem("All Assembly", ""));
                ddlcamara.Items.Insert(0, new ListItem("All Vehicle", ""));
                if (ddlDistrict.SelectedValue == "")
                {
                    ddlDistrict.Style.Add("background", "#fff");
                    ddlDistrict.Style.Add("color", "#333");
                    ddlAssembly.Style.Add("background", "#fff");
                    ddlAssembly.Style.Add("color", "#333");
                }
                else
                {
                    ddlDistrict.Style.Add("background", "#dc7c3c");
                    ddlDistrict.Style.Add("color", "#fff");
                }
                GetStopCameraTotalList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  ddlDistrictOnSelectedIndexChanged()" + ex.Message);
            }
        }

        protected void ddlAssembly_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //var vehicle = _data.GetAllVehicleByAcCode(ddlAssembly.SelectedItem.Value);

                //ddlcamara.Items.Clear();
                //ddlcamara.DataSource = vehicle;
                //ddlcamara.DataTextField = "Vehicle_no";
                //ddlcamara.DataValueField = "Vehicle_no";
                //ddlcamara.DataBind();
                //ddlcamara.Items.Insert(0, new ListItem("All Vehicle", ""));
                if (ddlAssembly.SelectedValue == "")
                {
                    ddlAssembly.Style.Add("background", "#fff");
                    ddlAssembly.Style.Add("color", "#333");
                }
                else
                {
                    ddlAssembly.Style.Add("background", "#dc7c3c");
                    ddlAssembly.Style.Add("color", "#fff");
                }
                GetStopCameraTotalList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  AssemblyDropDownOnSelectedIndexChanged()" + ex.Message);
            }
        }

        protected void ddlcamara_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                GetStopCameraTotalList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  ddlcamara_SelectedIndexChanged()" + ex.Message);
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            GetStopCameraTotalList();
        }

        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    _data.SaveRptSetting("StatusUpdate",Session["UserName"].ToString(), "District", chkDist.Checked ? "true" : "false");
        //    _data.SaveRptSetting("StatusUpdate",Session["UserName"].ToString(), "Assembly", chkAcName.Checked ? "true" : "false");
        //    _data.SaveRptSetting("StatusUpdate",Session["UserName"].ToString(), "PS No", chkPSNO.Checked ? "true" : "false");
        //    _data.SaveRptSetting("StatusUpdate",Session["UserName"].ToString(), "Location", chkLocation.Checked ? "true" : "false");
        //    _data.SaveRptSetting("StatusUpdate",Session["UserName"].ToString(), "Operator Name", chkoperator.Checked ? "true" : "false");
        //    _data.SaveRptSetting("StatusUpdate",Session["UserName"].ToString(), "DID", chkDID.Checked ? "true" : "false");
        //    _data.SaveRptSetting("StatusUpdate", Session["UserName"].ToString(), "Date", chkDate.Checked ? "true" : "false");
        //    dsReport1 = ds1;
        //}
        protected void btnSetting_Click(object sender, EventArgs e)
        {
            dsReport1 = ds1;
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            string content = "";
            var sb = new StringBuilder();
            divReport.RenderControl(new HtmlTextWriter(new StringWriter(sb)));
            content = sb.ToString();
            DateTime currentTime = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Consolidated_Camera_Status_Report_" + currentTime.ToString("ddMMyyyyhhmmss") + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            string headertext = "";
            if (FromDt.Text.Trim() != "" && ToDt.Text.Trim() != "")
            {
                headertext = "<h2><div style='text-align:center;'>Consolidated Camera Status Report From " + FromDt.Text.Trim() + " To " + ToDt.Text.Trim() + "</div></h2><br/><br/>";
            }
            else
            {
                headertext = "<h2><div style='text-align:center;'>Consolidated Camera Status Report</div></h2><br/><br/>";
            }

            string legendtext = "";
            legendtext = "<br/><br/><div style='text-align:right;'>This is system genereted report. Printed on " + currentTime.ToString("dd/MM/yyyy hh:mm:ss tt") + "</div>";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
            divReport.RenderControl(htmlTextWriter);
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

        protected void ddlislive_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlislive.SelectedValue == "")
            {
                ddlislive.Style.Add("background", "#fff");
                ddlislive.Style.Add("color", "#333");
            }
            else
            {
                ddlislive.Style.Add("background", "#dc7c3c");
                ddlislive.Style.Add("color", "#fff");
            }
            GetStopCameraTotalList();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStatus.SelectedValue == "")
            {
                ddlStatus.Style.Add("background", "#fff");
                ddlStatus.Style.Add("color", "#333");
            }
            else
            {
                ddlStatus.Style.Add("background", "#dc7c3c");
                ddlislive.Style.Add("color", "#fff");
            }
            GetStopCameraTotalList();
        }
    }
}