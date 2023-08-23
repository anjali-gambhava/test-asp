
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
    public partial class VideoBitrate : System.Web.UI.Page
    {
        db_data _data = new db_data();

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
            get;
            set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }

                Session["MenuName"] = "VideoBitrate";
                stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"]);

                if (!IsPostBack)
                {
                    FromDt.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    LoadDistrict();
                    GetStopCameraList();
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void GetStopCameraList()
        {

            DataSet ds = new DataSet();
            string status = "";
            if (ddlStatus.SelectedValue != "All" && ddlStatus.SelectedValue != "")
            {
                status = ddlStatus.SelectedValue;
            }
            ds = _data.getvideobitratedata(FromDt.Text,ddlDistrict.SelectedValue, ddlAssembly.SelectedValue);
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

                ddlDistrict.Items.Insert(0, new ListItem("All District", ""));
                ddlAssembly.Items.Insert(0, new ListItem("All Assembly", ""));

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
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "accode";
                ddlAssembly.DataBind();
                ddlAssembly.Items.Insert(0, new ListItem("All Assembly", ""));
                GetStopCameraList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  ddlDistrictOnSelectedIndexChanged()" + ex.Message);
            }
        }



        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                GetStopCameraList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  ddlcamara_SelectedIndexChanged()" + ex.Message);
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            GetStopCameraList();
        }
        protected void ddlAssembly_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GetStopCameraList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  AssemblyDropDownOnSelectedIndexChanged()" + ex.Message);
            }
        }

    }
}