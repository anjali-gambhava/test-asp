﻿using exam.DAL;
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
    public partial class InventoryUpdationReport : System.Web.UI.Page
    {
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
        db_data dbContext = new db_data();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            Session["MenuName"] = "InventoryUpdationReport";
            stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"]);
            if (!this.IsPostBack)
            {
                FromDt.Text = DateTime.Now.ToString("yyyy/MM/dd");
               // ToDt.Text = DateTime.Now.ToString("dd/MM/yyyy");
                this.LoadDistrict();
                //this.LoadMaterial();
                this.BindGrid();
            }
         //   ScriptManager1.RegisterPostBackControl(this.btnExportPDF);
            ScriptManager1.RegisterPostBackControl(this.btnsearch);
        }

        private void BindGrid()
        {
            db_data dbContext = new db_data();

            try
            {
                var dt = dbContext.GetAllInventoryUpdationReport(FromDt.Text.Trim(), "", ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, ddlVehicle.SelectedValue, 0);

                dsReport = dt;
               

            }
            catch (Exception ex)
            {
                Common.Log("ShiftMaster() -- >  BindGrid()" + ex.Message);
            }
        }

        //private void LoadMaterial()
        //{
        //    try
        //    {
        //        db_data dbContext = new db_data();
        //        var Alldist = dbContext.GetAllMaterial();

        //        ddlMaterial.DataSource = Alldist;
        //        ddlMaterial.DataTextField = "name";
        //        ddlMaterial.DataValueField = "name";
        //        ddlMaterial.DataBind();

        //        ddlMaterial.Items.Insert(0, new ListItem("Select Material", "0"));
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("VehicleStartStopReport -- >  LoadDistrict()" + ex.Message);
        //    }
        //}

        //protected void DistrictDropDownOnSelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        db_data dbContext = new db_data();
        //        var Assembly = dbContext.GetAllAssemblyByDistrict(stateid, DistrictDropDown.SelectedItem.Text);

        //        AssemblyDropDownList.Items.Clear();
        //        VehicleDropDownList.Items.Clear();
        //        AssemblyDropDownList.DataSource = Assembly;
        //        AssemblyDropDownList.DataTextField = "acname";
        //        AssemblyDropDownList.DataValueField = "accode";
        //        AssemblyDropDownList.DataBind();

        //        AssemblyDropDownList.Items.Insert(0, new ListItem("Select Assembly", ""));
        //        VehicleDropDownList.Items.Insert(0, new ListItem("Select Vehicle", "0"));
        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display = 'block'; addUpdate.style.display='block'; dlt.style.display='none'; ", true);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("VehicleStartStopReport -- >  DistrictDropDownOnSelectedIndexChanged()" + ex.Message);
        //    }
        //}

        //protected void AssemblyDropDownOnSelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        var vehicle = dbContext.GetAllVehicleByAcCode(AssemblyDropDownList.SelectedItem.Value);

        //        VehicleDropDownList.Items.Clear();
        //        VehicleDropDownList.DataSource = vehicle;
        //        VehicleDropDownList.DataTextField = "Vehicle_no";
        //        VehicleDropDownList.DataValueField = "Vehicle_no";
        //        VehicleDropDownList.DataBind();
        //        VehicleDropDownList.Items.Insert(0, new ListItem("Select Vehicle", "0"));

        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display = 'block'; addUpdate.style.display='block'; dlt.style.display='none'; ", true);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("VehicleStartStopReport -- >  AssemblyDropDownOnSelectedIndexChanged()" + ex.Message);
        //    }
        //}
        private void LoadDistrict()
        {
            try
            {
                var Alldist = dbContext.GetAllDistrictByStateId(stateid);

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
                Common.Log("VehicleStartStopReport -- >  LoadDistrict()" + ex.Message);
            }
        }
        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                var Assembly = dbContext.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);

                ddlAssembly.Items.Clear();
                ddlVehicle.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "accode";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new ListItem("Select Assembly", ""));
                ddlVehicle.Items.Insert(0, new ListItem("Select Vehicle", ""));
                BindGrid();
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
                Loadvehicalddl();
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
                BindGrid();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  ddlVehicle_SelectedIndexChanged()" + ex.Message);
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            DateTime currentTime = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Inventory_Updation_Report_" + currentTime.ToString("ddMMyyyyhhmmss") + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            string headertext = "";
            if (FromDt.Text.Trim() != "")
            {
                headertext = "<h2><div style='text-align:center;'>Inventory Updation Report From " + FromDt.Text.Trim() + " To " + "" + "</div></h2><br/><br/>";
            }
            else
            {
                headertext = "<h2><div style='text-align:center;'>Inventory Updation Report</div></h2><br/><br/>";
            }

            string legendtext = "";
            legendtext = "<br/><br/><div style='text-align:right;'>This is system genereted report. Printed on " + currentTime.ToString("dd/MM/yyyy hh:mm:ss tt") + "</div>";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
           // InventoryUpdationGrid.RenderControl(htmlTextWriter);
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

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        private void Loadvehicalddl()
        {
            try
            {
                db_data dbContext = new db_data();
                var vehicle = dbContext.GetShiftWizeVehicleByAcCode(ddlAssembly.SelectedItem.Value);

                ddlVehicle.Items.Clear();
                ddlVehicle.DataSource = vehicle;
                ddlVehicle.DataTextField = "location";
                ddlVehicle.DataValueField = "location";
                ddlVehicle.DataBind();
                ddlVehicle.Items.Insert(0, new ListItem("Select location", "0"));

            }
            catch (Exception ex)
            {
                Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }
    }
}