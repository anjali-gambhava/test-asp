using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using exam.DAL;
using Newtonsoft.Json;
using System.Web.Services;
using System.Reflection;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using exam.BAL;
using System.Web.Script.Serialization;

namespace exam
{
    public partial class MapView1 : System.Web.UI.Page
    {
        db_data _boothlist = new db_data();
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
        public string usernametotal = ConfigurationManager.AppSettings["usertotal"].ToString();
        public int usernametotalen = Convert.ToInt32(ConfigurationManager.AppSettings["usertotalen"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                Session["MenuName"] = "LiveTracking";
                //var oresp = GetVehicleDetails();
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
                    _usertype = usertype;
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
                        else if (utypeall.StartsWith("sch"))
                        {
                            usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                            LoadBooth(usertype);
                        }
                        else
                        {
                            LoadBooth("dst_" + ddlDistrict.SelectedItem.Text);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Common.Log("Page_Load_list() -- >  " + ex.Message);
            }
        }

        private GPSAPIResponse GetVehicleDetails()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://pullapi.tracknowgps.com/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue BasicAuthenticationHeaderValue("Vmspl", "Vmukti2021");
                var base64EncodedAuthenticationString = Convert.ToBase64String(System.Text.ASCIIEncoding.UTF8.GetBytes("Vmspl" + ":" + "Vmukti2021"));
                client.DefaultRequestHeaders.Add("Authorization", "Basic " + base64EncodedAuthenticationString);
                //GET Method
                HttpResponseMessage response = client.GetAsync("api/v1/index.php/getDevPos").Result;
                if (response.IsSuccessStatusCode)
                {
                    string res = response.Content.ReadAsStringAsync().Result;
                    GPSAPIResponse oresponse = JsonConvert.DeserializeObject<GPSAPIResponse>(res);
                    return oresponse;
                }
                else
                {
                    return null;
                }
            }
        }
        private void LoadDistrict(string usertype)
        {
            try
            {
                //DataSet ds_dist = _boothlist.GetDistrictList(usertype, stateid);
                //ddlDistrict.DataSource = ds_dist;
                //ddlDistrict.DataTextField = "District";
                //ddlDistrict.DataValueField = "District";
                //ddlDistrict.DataBind();
                //int dist_count = ds_dist.Tables[0].Rows.Count;
                //if (utypeall.Contains("_all"))
                //{
                //    if (dist_count > 1)
                //    {
                //        ddlDistrict.Items.Insert(0, new ListItem("ALL District", "0"));
                //        ddlAssembly.Items.Insert(0, new ListItem("ALL Hall No", "0"));
                //        if (Session["ddldistgrid"] != null)
                //        {
                //            ddlDistrict.SelectedIndex = Convert.ToInt32(Session["ddldistgrid"]);
                //        }
                //        else
                //        {
                //            ddlDistrict.SelectedIndex = 1;
                //        }
                //        if (ddlDistrict.SelectedIndex > 0)
                //        {
                //            usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                //            LoadSchool(ddlDistrict.SelectedItem.Text, usertype);
                //        }
                //    }
                //    else
                //    {
                //        LoadSchool(ddlDistrict.Items[0].ToString(), usertype);
                //    }
                //}
                //else
                //{
                //    if (dist_count > 0)
                //    {
                //        if (Session["ddldistgrid"] != null)
                //        {
                //            ddlDistrict.SelectedIndex = Convert.ToInt32(Session["ddldistgrid"]);
                //            Session["ddldistgrid"] = ddlDistrict.SelectedIndex;
                //        }
                //        else
                //        {
                //            ddlDistrict.SelectedIndex = 0;
                //        }
                //        ddlAssembly.Items.Insert(0, new ListItem("ALL Hall No", "0"));
                //        ddlAssembly.SelectedIndex = 0;
                //        LoadSchool(ddlDistrict.SelectedItem.Text, usertype);
                //    }
                //    else
                //    {
                //        ddlAssembly.Items.Clear();
                //    }
                //}
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
                Common.Log("LoadDistrict_map() -- >  " + ex.Message);
            }
        }
        private void LoadSchool(string District, string usertype)
        {
            try
            {
                //DataSet ds_booth = _boothlist.GetBoothFromDistrict(District, usertype, stateid);
                //ddlAssembly.DataSource = ds_booth;
                //ddlAssembly.DataTextField = "schoolname";
                //ddlAssembly.DataValueField = "schoolname";
                //ddlAssembly.DataBind();
                //int sch_count = ds_booth.Tables[0].Rows.Count;
                //if (sch_count > 1 || sch_count == 0)
                //{
                //    ddlAssembly.Items.Insert(0, new ListItem("All Hall No", "0"));
                //}
                //ddlAssembly.SelectedIndex = 0;
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
                Common.Log("LoadSchool_map() -- >  " + ex.Message);
            }
        }
        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (utypeall.Contains("_all"))
                {
                    if (ddlDistrict.SelectedValue == "0")
                    {
                        //DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
                        usertype = utypeall.Replace("_all", "");
                    }
                    else
                    {
                        usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                    }
                }
                else
                {
                    usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                }
                LoadSchool(ddlDistrict.SelectedItem.Text, usertype);
                ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByText(ddlDistrict.SelectedItem.Text));
                Session["ddldistgrid"] = ddlDistrict.SelectedIndex;
                LoadBooth(usertype);
            }
            catch (Exception ex)
            {
                Common.Log("ddlDistrict_SelectedIndexChanged_map() -- >  " + ex.Message);
            }
        }
        protected void ddlAssembly_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlAssembly.SelectedValue == "0")
                {
                    usertype = "dst_" + ddlDistrict.SelectedItem.Text;
                }
                else
                {
                    usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                }
                LoadBooth(usertype);
            }
            catch (Exception ex)
            {
                Common.Log("ddlAssembly_SelectedIndexChanged_map() -- >  " + ex.Message);
            }
        }


        private void LoadBooth(string usertype)
        {
            try
            {
                // DataSet ds = new DataSet();

                //ds = _boothlist.GetMapBoothList(usertype, false);

                // string json = JsonConvert.SerializeObject(ds, Formatting.Indented);

                string json = Common.Encode(usertype);
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", " jQuery(function ($) {LoadMap(" + json + ",'"+usertype+"');});", true);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", " jQuery(function ($) {LoadLocation('" + json + "',0);});", true);


            }
            catch (Exception ex)
            {
                Common.Log("LoadBooth_map() -- >  " + ex.Message);
            }
        }
        [WebMethod]
        public static string LoadMap(string d)
        {
            try
            {
                db_data _boothlist = new db_data();
                DataSet ds = new DataSet();

                ds = _boothlist.GetMapBoothList(Common.Decode(d), false, 1);

                string json = JsonConvert.SerializeObject(ds, Formatting.Indented);
                return json;
            }
            catch (Exception ex)
            {
                return string.Empty;
            }
        }
    }


    //protected void Timer1_Tick(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        Timer1.Enabled = false;
    //        DataSet ds = new DataSet();

    //        ds = _boothlist.GetMapBoothList(usertype, false);

    //        string json = JsonConvert.SerializeObject(ds, Formatting.Indented);

    //        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", " jQuery(function ($) {LoadMap(" + json + ",'"+usertype+"');});", true);
    //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", " jQuery(function ($) {LoadLocation(" + json + ",1);});", true);
    //        Timer1.Enabled = true;
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}



}