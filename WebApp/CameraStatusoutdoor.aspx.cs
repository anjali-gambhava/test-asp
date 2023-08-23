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
    public partial class CameraStatusoutdoor : System.Web.UI.Page
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
        public string selectedValue
        {
            get
            {
                if (ViewState["selectedValue"] != null)
                    return (string)ViewState["selectedValue"];
                else
                    return "";
            }
            set
            {
                ViewState["selectedValue"] = value;
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
        public DataSet BoothList1
        {
            get
            {
                if (ViewState["BoothList"] != null)
                    return (DataSet)ViewState["BoothList1"];
                else
                    return BoothList1;
            }
            set
            {
                ViewState["BoothList1"] = value;
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

                    testdist.Attributes.Add("onclick", "triggerPostBack();");
                    testtotalps.Attributes.Add("onclick", "triggerPostBack();");
                    testlastonehour.Attributes.Add("onclick", "triggerPostBack();");
                    testonline.Attributes.Add("onclick", "triggerPostBack();");
                    testco.Attributes.Add("onclick", "triggerPostBack();");
                    testoffline.Attributes.Add("onclick", "triggerPostBack();");
                    Session["IsDescending"] = true;
                    DataSet ds = _boothlist.GetUserData(Page.User.Identity.Name);
                    usertype = ds.Tables[0].Rows[0]["usercode"].ToString();
                    stateid = Convert.ToInt32(ds.Tables[0].Rows[0]["stateid"]);
                    useridentifer = ds.Tables[0].Rows[0]["identifier"].ToString();
                    utypeall = usertype;
                    string assembly = ds.Tables[0].Rows[0]["AssemblyAccesIds"].ToString();
                    string[] assemblyIds = assembly.Split(',');

                    // Convert the array to a comma-separated string
                    string assemblyIdsString = string.Join(",", assemblyIds);

                    // Store the string in a session variable
                    Session["AssemblyIdsString"] = assemblyIdsString;

                    
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
                DataSet dspc = _dbadmin.allcountlivenewout(usertype, UserID);
                BoothList = dspc;
                DateTime chklastseen = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);

                // Check if the session variable exists
                if (Session["IsDescending"] == null)
                {
                    // Initialize the session variable with default value (false for ascending)
                    Session["IsDescending"] = false;
                }

                // Retrieve the current sorting order from the session variable
                bool isDescending = Convert.ToBoolean(Session["IsDescending"]);

                // Toggle the sorting order for the next click
                isDescending = !isDescending;

                // Save the updated sorting order back to the session variable
                Session["IsDescending"] = isDescending;

                // Now use the updated sorting order to build the orderby clause
                string orderby = selectedValue + (isDescending ? " DESC" : " ASC");




                DataSet dspc1 = _dbadmin.allcountlive_assemblyneworderbyout("", UserID, orderby);
                BoothList = dspc1;
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
        //string selectedValue = "";
        // Declare a variable to store the previously selected radio button
        private CheckBox previouslySelectedRadioButton = null;

        protected void RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox selectedRadioButton = (CheckBox)sender;

            // Check if the current radio button is the same as the previously selected one
            if (selectedRadioButton == previouslySelectedRadioButton)
            {
                // If yes, unselect the radio button by setting Checked to false
                selectedRadioButton.Checked = false;
                selectedRadioButton.CssClass = "unselectedRadioButton";
                selectedValue = null; // Or set it to the appropriate default value
                previouslySelectedRadioButton = null; // Reset the previouslySelectedRadioButton variable
            }
            else
            {
                // If no, mark the current radio button as selected
               
                selectedValue = selectedRadioButton.Text;
                previouslySelectedRadioButton = selectedRadioButton; // Update the previouslySelectedRadioButton variable
            }

            // Loop through all other radio buttons in the same group and set their class
            foreach (Control control in selectedRadioButton.Parent.Controls)
            {
                if (control is RadioButton radioButton && radioButton != selectedRadioButton)
                {
                    radioButton.CssClass = "unselectedRadioButton";
                }
            }
          
            LoadBooth(usertype);
            
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

        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        loaddata();
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}

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
        private void loaddata(string orderby)
        {
            int UserID = 0;
            if (Session["userid"] != null)
                UserID = Convert.ToInt32(Session["userid"]);

            DataSet dspc1 = _dbadmin.allcountlive_assemblyneworderby("", UserID, orderby);
            BoothList = dspc1;
            // LoadBooth(usertype);
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
            bool isDescending = Convert.ToBoolean(Session["IsDescending"]);

    
            // Save the updated sorting order back to the session variable
            Session["IsDescending"] = isDescending;

            // Now use the updated sorting order to build the orderby clause
            string orderby = selectedValue + (isDescending ? " DESC" : " ASC");
            loaddata(orderby);

        }
    }
}