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
    public partial class AIView1 : System.Web.UI.Page
    {
        LoadTopSelections objloadtop = new LoadTopSelections();

        db_data _boothgrid = new db_data();
        db_list_lq c1 = new db_list_lq();
        //public int pageitemcount = 6;
        //public static int totalDatacount = 0;
        public string pcname = ConfigurationManager.AppSettings["pcname"].ToString();
        public string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();
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
                Session["MenuName"] = "AIView";
                if (!IsPostBack)
                {

                    DataSet ds = _boothgrid.GetUserData(Page.User.Identity.Name);
                    usertype = ds.Tables[0].Rows[0]["usercode"].ToString();
                    stateid = Convert.ToInt32(ds.Tables[0].Rows[0]["stateid"]);
                    utypeall = usertype;
                    if (utypeall.Contains("_all"))
                    {
                        usertype = usertype.Replace("_all", "");
                    }
                }
            }
            catch (Exception ex)
            {
                Common.Log("Page_Load_gridauto() -- >  " + ex.Message);
            }
        }

    }
}