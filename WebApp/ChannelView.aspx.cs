using exam.DAL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exam
{
    public partial class ChannelView : System.Web.UI.Page
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
        public int StateOfflineTotle
        {
            get
            {
                if (ViewState["StateOfflineTotle"] != null)
                    return (int)ViewState["StateOfflineTotle"];
                else
                    return 0;
            }
            set
            {
                ViewState["StateOfflineTotle"] = value;
            }
        }
        public int StateOnlineTotle
        {
            get
            {
                if (ViewState["StateOnlineTotle"] != null)
                    return (int)ViewState["StateOnlineTotle"];
                else
                    return 0;
            }
            set
            {
                ViewState["StateOnlineTotle"] = value;
            }
        }
        public int StateTotle
        {
            get
            {
                if (ViewState["StateTotle"] != null)
                    return (int)ViewState["StateTotle"];
                else
                    return 0;
            }
            set
            {
                ViewState["StateTotle"] = value;
            }
        }
        public string VehicleInfoList
        {
            get
            {
                if (ViewState["VehicleInfoList"] != null)
                    return (string)ViewState["VehicleInfoList"];
                else
                    return null;
            }
            set
            {
                ViewState["VehicleInfoList"] = value;
            }
        }

        private void LoadDistrict()
        {
            db_data dbContext = new db_data();
            try
            {
                var Alldist = dbContext.GetAllDistrictByStateId(stateid);

                ddlDistrict.DataSource = Alldist;
                ddlDistrict.DataTextField = "district";
                ddlDistrict.DataValueField = "district";
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new ListItem("All District", ""));
                ddlAssembly.Items.Insert(0, new ListItem("All Assembly", ""));
                loadData();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  LoadDistrict()" + ex.Message);
            }
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            db_data dbContext = new db_data();
            try
            {
                var Assembly = dbContext.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);

                ddlAssembly.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "accode";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new ListItem("All Assembly", ""));
                loadData();
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
                loadData();
            }
            catch (Exception ex)
            {

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            db_data dbContext = new db_data();
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                Session["MenuName"] = "ChannelView";
                stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"]);
                if (!IsPostBack)
                {
                    LoadDistrict();
                    loadData();
                }
            }
            catch (Exception ex)
            {
                Common.Log("Page_Load_gridauto() -- >  " + ex.Message);
            }
        }

        protected void loadData()
        {
            db_data dbContext = new db_data();
            var vehicleDataList = dbContext.GetChannelviewdata(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue).Tables[0].AsEnumerable().ToList();

            var assemblyWizeTotle = dbContext.GetAssemblyWizeTotlechannelData().Tables[0].AsEnumerable().ToList();

            var AssemblyInfoList = vehicleDataList.Join(assemblyWizeTotle,
                                        vehicleData => vehicleData.Field<int>("DistrictId"),
                                        assemblyTotle => assemblyTotle.Field<int>("DISETRICTID"),
                                        (vehicleData, assemblyTotle) => new
                                        {
                                            VehicleNo = vehicleData.Field<string>("VehicleNo"),
                                            StaffMobileNo = vehicleData.Field<string>("Staff_Mobile_No"),
                                            StaffName = vehicleData.Field<string>("Staff_Name"),
                                            HlsUrl = vehicleData.Field<string>("HlsUrl"),
                                            CamaraId = vehicleData.Field<string>("CamaraId"),
                                            AssemblyName = vehicleData.Field<string>("acname"),
                                            DistrictId = vehicleData.Field<int>("DistrictId"),
                                            AssemblyOnline = assemblyTotle.Field<int>("ONLINE"),
                                            AssemblyOffline = assemblyTotle.Field<int>("OFFLINE"),
                                            AssemblyInstalled = assemblyTotle.Field<int>("INSTALLED"),
                                            District = assemblyTotle.Field<string>("district"),
                                            Assembly = assemblyTotle.Field<string>("acname")
                                        });
            var districtWizeTotle = assemblyWizeTotle.GroupBy(i => i.Field<string>("district"))
                                        .Select(i => new
                                        {
                                            DistrictOnline = i.ToList().Sum(j => j.Field<int>("ONLINE")),
                                            DistrictOffline = i.ToList().Sum(j => j.Field<int>("OFFLINE")),
                                            DistrictInstalled = i.ToList().Sum(j => j.Field<int>("OFFLINE")) + i.ToList().Sum(k => k.Field<int>("ONLINE")),
                                            District = i.Key
                                        })
                                                .ToList();

            var VehicleInfoList = AssemblyInfoList.Join(districtWizeTotle,
                                    list => list.District,
                                    districtTotle => districtTotle.District,
                                    (list, districtTotle) => new VehicleInfo
                                    {
                                        VehicleNo = list.VehicleNo,
                                        StaffMobileNo = list.StaffMobileNo,
                                        StaffName = list.StaffName,
                                        CamaraID = list.CamaraId,
                                        HlsUrl = list.HlsUrl,
                                        AssemblyName = list.AssemblyName,
                                        DistrictId = list.DistrictId,
                                        AssemblyOnline = list.AssemblyOnline,
                                        AssemblyOffline = list.AssemblyOffline,
                                        AssemblyInstalled = list.AssemblyInstalled,
                                        District = list.District,
                                        Assembly = list.Assembly,
                                        DistrictOnline = districtTotle.DistrictOnline,
                                        DistrictOffline = districtTotle.DistrictOffline,
                                        DistrictInstalled = districtTotle.DistrictInstalled
                                    })
                                    .ToList();
            StateTotle = districtWizeTotle.Sum(i => i.DistrictInstalled);
            StateOnlineTotle = districtWizeTotle.Sum(i => i.DistrictOnline);
            StateOfflineTotle = districtWizeTotle.Sum(i => i.DistrictOffline);

            VehicleInfoList = VehicleInfoList.OrderBy(i => i.DistrictId).ToList();
            ViewState["VehicleInfoList"] = JsonConvert.SerializeObject(VehicleInfoList);
        }
    }


    [Serializable]
    public class VehicleInfo
    {
        public string VehicleNo { get; set; }
        public string StaffMobileNo { get; set; }
        public string StaffName { get; set; }
        public string HlsUrl { get; set; }
        public string AssemblyName { get; set; }
        public string CamaraID { get; set; }
        public int DistrictId { get; set; }
        public int AssemblyOnline { get; set; }
        public int AssemblyOffline { get; set; }
        public int AssemblyInstalled { get; set; }
        public string District { get; set; }
        public string Assembly { get; set; }
        public int DistrictOnline { get; set; }
        public int DistrictOffline { get; set; }
        public int DistrictInstalled { get; set; }
    }
}