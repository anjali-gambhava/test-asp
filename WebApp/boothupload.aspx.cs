using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.IO;
using exam.DAL;
using System.Data.OleDb;
using System.Collections;
using System.Text.RegularExpressions;
using ClosedXML.Excel;
using exam.services;
using System.Net.Http;
using Newtonsoft.Json;
namespace exam
{
    public partial class boothupload : System.Web.UI.Page
    {
        db_data _boothlist = new db_data();
        LoadTopSelections objloadtop = new LoadTopSelections();
        db_data _dbdata = new db_data();
        db_data_admin _db = new db_data_admin();
        ArrayList CheckBoxArray = new ArrayList();
        public string oldst, olac, olps, oloperatordetail;
        public string nwdst, nwac, nwps;
        public string pcname = ConfigurationManager.AppSettings["pcname"].ToString();
        public string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();
        public string district = ConfigurationManager.AppSettings["district"].ToString();
        public string allKeyword = ConfigurationManager.AppSettings["AllSelectKeword"].ToString() + " ";
        public string nwstrm
        {
            get
            {
                if (ViewState["nwstrm"] != null)
                    return (string)ViewState["nwstrm"];
                else
                    return null;
            }
            set
            {
                ViewState["nwstrm"] = value;
            }
        }
        public string olstrm
        {
            get
            {
                if (ViewState["olstrm"] != null)
                    return (string)ViewState["olstrm"];
                else
                    return null;
            }
            set
            {
                ViewState["olstrm"] = value;
            }
        }
        public int oldschid
        {
            get
            {
                if (ViewState["oldschid"] != null)
                    return (int)ViewState["oldschid"];
                else
                    return 0;
            }
            set
            {
                ViewState["oldschid"] = value;
            }
        }
        public int newschid
        {
            get
            {
                if (ViewState["newschid"] != null)
                    return (int)ViewState["newschid"];
                else
                    return 0;
            }
            set
            {
                ViewState["newschid"] = value;
            }
        }
        public int nwboothid
        {
            get
            {
                if (ViewState["nwboothid"] != null)
                    return (int)ViewState["nwboothid"];
                else
                    return 0;
            }
            set
            {
                ViewState["nwboothid"] = value;
            }
        }
        public int nwstreamid
        {
            get
            {
                if (ViewState["nwstreamid"] != null)
                    return (int)ViewState["nwstreamid"];
                else
                    return 0;
            }
            set
            {
                ViewState["nwstreamid"] = value;
            }
        }
        public string nwoperatordetail
        {
            get
            {
                if (ViewState["nwoperatordetail"] != null)
                    return (string)ViewState["nwoperatordetail"];
                else
                    return string.Empty;
            }
            set
            {
                ViewState["nwoperatordetail"] = value;
            }
        }
        public string nwoperatornum
        {
            get
            {
                if (ViewState["nwoperatornum"] != null)
                    return (string)ViewState["nwoperatornum"];
                else
                    return string.Empty;
            }
            set
            {
                ViewState["nwoperatordetail"] = value;
            }
        }
        public string nwlocation
        {
            get
            {
                if (ViewState["nwlocation"] != null)
                    return (string)ViewState["nwlocation"];
                else
                    return string.Empty;
            }
            set
            {
                ViewState["nwlocation"] = value;
            }
        }
        public string nwlocationnew
        {
            get
            {
                if (ViewState["nwlocationnew"] != null)
                    return (string)ViewState["nwlocationnew"];
                else
                    return string.Empty;
            }
            set
            {
                ViewState["nwlocationnew"] = value;
            }
        }
        public string nwoperatordetailnew
        {
            get
            {
                if (ViewState["nwoperatordetailnew"] != null)
                    return (string)ViewState["nwoperatordetailnew"];
                else
                    return string.Empty;
            }
            set
            {
                ViewState["nwoperatordetailnew"] = value;
            }
        }
        public string nwoperatornumnew
        {
            get
            {
                if (ViewState["nwoperatornumnew"] != null)
                    return (string)ViewState["nwoperatornumnew"];
                else
                    return string.Empty;
            }
            set
            {
                ViewState["nwoperatornumnew"] = value;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                Session["MenuName"] = "BoothUpload";

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



                clearmsg();
                if (!IsPostBack)
                {
                    LoadDistrict(usertype);
                    LoadPC(ddlDistrict.SelectedItem.Text, usertype);
                    //LoadAC(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Text, usertype);
                    LoadBooth(ddlDistrict.SelectedItem.Text, "");
                }

            }
            catch (Exception ex)
            {
                Common.Log("Page_Load() -- >  " + ex.Message);
            }
        }
        private void clearmsg()
        {
            lblerror.Text = "";
            lblsuccess.Text = "";
            lblduplicate.Text = "";
            lblcount.Text = "";
            lblduplicateps.Text = "";
            lblnolist.Text = "";
        }
        protected void btnupload_Click(object sender, EventArgs e)
        {
            if (ddlDistrict.SelectedItem.Text != "ALL District" && ddlAssembly.SelectedItem.Text != "ALL Assembly")
            {
                string filename = DateTime.Now.ToString().Replace(" ", "").Replace(":", "").Replace("/", "").Replace("AM", "").Replace("PM", "") + ".xlsx";

                try
                {
                    if (FileUploadbooth.PostedFile.ContentLength == 0)
                    {
                        return;
                    }
                    string extn = Path.GetExtension(FileUploadbooth.PostedFile.FileName).ToLower();
                    if (extn != ".xls" && extn != ".xlsx")
                    {
                        //lblerror.Text = "Excel File Invalid,Please ensure it is in .xls or .xlsx format";
                        return;
                    }
                    //8/3/2021 4:30:41 PM

                    FileUploadbooth.SaveAs(Server.MapPath(filename));
                    MainFunc(filename);
                    LoadBooth(ddlDistrict.SelectedItem.Text, "");
                }
                catch (Exception ex)
                {
                    Common.Log("fileupload --->" + DateTime.Now + "-->" + ex.Message);
                }
                finally
                {
                    if (File.Exists(Server.MapPath(filename)))
                    {
                        File.Delete(Server.MapPath(filename));
                    }
                }
            }
            else
                //lblerrnofile.Text = allKeyword + assemblyname;
                lblerrnofile.Text = "Please Select District and Assembly";
        }

        protected void btnaddevent_Click(object sender, EventArgs e)
        {


            try
            {
                HideMessage_Success();
                HideMessage_error();

                hideerrormessage();
                string str_psno = txtps.Text;


                str_psno = str_psno + (txtpart.Text != "" ? ("-" + txtpart.Text) : drpIsOutside.SelectedValue == "1" && txtpart.Text == "" ? ("-O") : "");
                string cameralocationtype = drpIsOutside.SelectedValue == "1" ? "Outside" : drpIsOutside.SelectedValue == "0" ? "Inside" : "";

                DataSet ds = _db.boothexist(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Text, "", str_psno, txtstreamname.Text);
                if (string.IsNullOrEmpty(txtps.Text))
                {
                    showerrormessage("Enter PS Number");
                }
                else if (ds.Tables[0].Rows.Count > 0)
                {
                    showerrormessage("PS Number already exist");
                }
                else
                {
                    if (!string.IsNullOrEmpty(txtopno.Text))
                    {
                        if (!Regex.IsMatch(txtopno.Text.Trim(), @"^\d{10}$"))
                        {
                            showerrormessage("Enter valid contact no.");
                            return;
                        }
                    }


                    int streamid = 0;
                    if (!string.IsNullOrEmpty(txtstreamname.Text.Trim()))
                    {
                        if (ds.Tables[1].Rows.Count < 1)
                        {
                            streamid = SaveCameraDetailsByDeviceID(txtstreamname.Text.Trim().ToUpper());
                            if (streamid == 0)
                            {
                                showerrormessage("Invalid Camera name");
                                return;
                            }
                        }
                        else
                        {
                            streamid = Convert.ToInt32(ds.Tables[1].Rows[0]["id"]);
                        }
                    }

                    HideMessage_error();

                    int op_id = 0;
                    if (!string.IsNullOrEmpty(txtopno.Text.Trim()))
                    {
                        DataSet ds_operator = _db.operatorexist(txtopno.Text.Trim());
                        if (ds_operator.Tables[0].Rows.Count == 0)
                        {
                            if (!string.IsNullOrEmpty(txtopno.Text.Trim()))
                            {
                                op_id = _db.ADDoperatorlist(txtopname.Text.Trim(), txtopno.Text.Trim(), "", txtopDesig.Text, ddlDistrict.SelectedItem.Text);
                            }
                        }
                        else
                        {
                            op_id = Convert.ToInt32(ds_operator.Tables[0].Rows[0]["id"]);
                            _db.UpdateOperator(txtopname.Text.Trim(), txtopno.Text.Trim(), "", txtopDesig.Text, op_id, ddlDistrict.SelectedItem.Text);
                        }
                    }
                    int boothid = _db.IsStreamIDExists(streamid);
                    if (boothid > 0)
                    {
                        streamid = 0;
                        showerrormessage("Duplicate Streamname");
                        return;
                    }

                    int booth_id = _db.addboothlocation(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Value, ddlAssembly.SelectedItem.Text, str_psno
                        , txtlocation.Text.Replace("'", ""), streamid, Page.User.Identity.Name, "Admin Portal", op_id, "0", "0", drpIsPink.SelectedValue, drpIsOutside.SelectedValue, cameralocationtype, drpIsARO.SelectedValue);
                    if (booth_id > 0)
                    {
                        txtps.Text = "";
                        txtlocation.Text = "";
                        txtstreamname.Text = "";
                        txtopname.Text = "";
                        txtopno.Text = "";
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "ClosePopup()", true);
                        // upModal.Update();
                        //UpdatePanel2.Update();
                    }
                    else
                    {
                        // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#addevent').modal('');", true);
                        // upModal.Update();
                        // UpdatePanel2.Update();
                    }

                    LoadBooth(ddlDistrict.SelectedItem.Text, "");
                    //UpdatePanel1.UpdateMode = UpdatePanelUpdateMode.Conditional;
                    //UpdatePanel1.Update();
                    //UpdatePanel1.UpdateMode = UpdatePanelUpdateMode.Always;

                }
            }
            catch (Exception ex)
            {
            }

        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                LoadBooth(ddlDistrict.SelectedItem.Text, "");
            }
            catch (Exception ex)
            {
                Common.Log("UserMaster -- >  OnPageIndexChanging()" + ex.Message);
            }
        }

        public void MainFunc(string filepath)
        {
            try
            {
                List<string> columnsnames = new List<string>();
                DataSet ds_Excel = GetExcelData(filepath, out columnsnames);
                List<string> dvrlist = new List<string>();
                List<string> insertlist = new List<string>();
                List<string> duplicatelist = new List<string>();
                List<string> duplicateps = new List<string>();
                List<string> nodatalist = new List<string>();
                List<string> listToUpdate = new List<string>();
                int count = 0;
                for (int i = 0; i < ds_Excel.Tables[0].Rows.Count; i++)
                {
                    string str_district = ddlDistrict.SelectedItem.Text.Trim();
                    string str_pc = ddlAssembly.SelectedItem.Value.Trim();
                    string str_schoolname = ddlAssembly.SelectedItem.Text.Trim();
                    string str_psno = ds_Excel.Tables[0].Rows[i]["PS_BUILDINGS_ID"].ToString().Trim();
                    string str_partno = ds_Excel.Tables[0].Rows[i]["PART_NO"].ToString().Trim();
                    string str_location = ds_Excel.Tables[0].Rows[i]["Location"].ToString().Replace("'", "").Trim();
                    string str_stream = ds_Excel.Tables[0].Rows[i]["CameraDid"].ToString().ToLower().Trim();
                    string str_operator = ds_Excel.Tables[0].Rows[i]["Operator_Name"].ToString().Trim();
                    string str_opno = ds_Excel.Tables[0].Rows[i]["Mobile_no"].ToString().Trim();
                    string str_opno_Desig = ds_Excel.Tables[0].Rows[i]["Designation"].ToString().Trim();

                    string str_isARO = (columnsnames.Contains("isARO")) ? ds_Excel.Tables[0].Rows[i]["isARO"].ToString().Trim() : "0";
                    string ispinkbooth = (columnsnames.Contains("IsPink_booth")) ? ds_Excel.Tables[0].Rows[i]["IsPink_booth"].ToString() : "0";
                    string outsidebooth = (columnsnames.Contains("Outside_booth")) ? ds_Excel.Tables[0].Rows[i]["Outside_booth"].ToString() : "0";
                    string cameralocationtype = outsidebooth == "1" ? "Outside" : outsidebooth == "0" ? "Inside" : "";

                    str_psno = str_psno + (str_partno != "" ? ("-" + str_partno) : outsidebooth == "1" && str_partno == "" ? ("-O") : "");

                    // string latlong = ds_Excel.Tables[0].Rows[i]["Lat_Long"].ToString();
                    string str_long = "0";
                    string str_lat = "0";

                    List<string> listdup = new List<string>();
                    List<string> listps = new List<string>();
                    List<string> listnodata = new List<string>();
                    if (!string.IsNullOrEmpty(str_opno))
                    {
                        if (!Regex.IsMatch(str_opno, @"^\d{10}$"))
                        {
                            listToUpdate.Add(str_opno);
                            continue;
                        }
                    }

                    if (string.IsNullOrEmpty(str_psno))
                    {
                        duplicateps.Add(listps.ToString());
                        continue;
                    }
                    else
                    {
                        str_stream.Replace(", ", ",");
                        if (str_stream.IndexOf("dvr") > 0)
                        {
                            //dvrlist.Add(i.ToString() + "@" + str_district + "@" + str_schoolname + "@" + str_location + "@" + str_stream);
                            //continue;
                        }
                        else
                        {

                            //  List<string> liststreamname = GET_FormatedStreamname(str_stream);
                            string streamname = str_stream.ToUpper();

                            int streamid = 0;
                            DataSet ds = _db.GETSchoolIDofStreamwithbooth(streamname);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                // Valid Stream name
                                streamid = Convert.ToInt32(ds.Tables[0].Rows[0]["id"]);
                            }
                            else
                            {
                                streamid = SaveCameraDetailsByDeviceID(streamname);
                                if (streamid == 0)
                                {
                                    // Invalid Stream name or Blank
                                    nodatalist.Add("(PS Number) --> " + str_psno);
                                }
                            }
                            int schoolid_old = _db.IsSchoolExist(str_district, str_pc, str_schoolname, str_psno);
                            if (schoolid_old > 0)
                            {

                                int op_id = 0;
                                if (!string.IsNullOrEmpty(str_opno.Trim()))
                                {
                                    DataSet ds_operator = _db.operatorexist(str_opno.Trim());
                                    if (ds_operator.Tables[0].Rows.Count == 0)
                                    {
                                        if (!string.IsNullOrEmpty(str_opno.Trim()))
                                        {
                                            op_id = _db.ADDoperatorlist(str_operator.Trim(), str_opno.Trim(), "", str_opno_Desig.Trim(), ddlDistrict.SelectedItem.Text);
                                        }
                                    }
                                    else
                                    {
                                        op_id = Convert.ToInt32(ds_operator.Tables[0].Rows[0]["id"]);
                                        _db.UpdateOperator(str_operator.Trim(), str_opno.Trim(), "", str_opno_Desig.Trim(), op_id, ddlDistrict.SelectedItem.Text);
                                    }
                                }
                                int boothid = _db.IsStreamIDExists(streamid);
                                //if (boothid > 0)
                                //{
                                //    //DataSet dsstream = _db.GETSchoolIDofStreamwithbooth("FAKE-123456-FFAKE");
                                //    //if (dsstream.Tables[0].Rows.Count > 0)
                                //    //{
                                //    //    // Valid Stream name
                                //    //    bool upd2 = _db.UpdateboothdetailFAKE(boothid, Convert.ToInt32(dsstream.Tables[0].Rows[0]["id"]));
                                //    //}
                                //    // Invalid Stream name or Blank
                                //    nodatalist.Add("(Duplicate Streamname) --> " + streamname.ToString() + " District --> " + str_district + " PC --> " + str_pc + " PS No --> " + str_psno);
                                //    DataSet dsstream = _db.GETSchoolIDofStreamwithbooth();
                                //    if (dsstream.Tables[0].Rows.Count > 0)
                                //    {
                                //        // Valid Stream name
                                //        //bool upd2 = _db.UpdateboothdetailFAKE(boothid, Convert.ToInt32(dsstream.Tables[0].Rows[0]["id"]));
                                //        bool upd2 = _db.UpdateboothdetailFAKE(boothid, Convert.ToInt32(dsstream.Tables[0].Rows[0]["streamID"]));
                                //    }
                                //}
                                bool upd = _db.Updateboothdetail(str_location, Convert.ToInt32(schoolid_old), streamid, "updateboothwithalldata", op_id, Page.User.Identity.Name.ToString(), "Excel", ispinkbooth, outsidebooth, cameralocationtype, str_isARO);
                                count++;
                            }
                            else
                            {

                                int op_id = 0;
                                if (!string.IsNullOrEmpty(str_opno))
                                {
                                    DataSet ds_operator = _db.operatorexist(str_opno.Trim());
                                    if (ds_operator.Tables[0].Rows.Count == 0)
                                    {
                                        op_id = _db.ADDoperatorlist(str_operator.Trim(), str_opno.Trim(), "", str_opno_Desig.Trim(), ddlDistrict.SelectedItem.Text);
                                    }
                                    else
                                    {
                                        op_id = Convert.ToInt32(ds_operator.Tables[0].Rows[0]["id"]);
                                        _db.UpdateOperator(str_operator.Trim(), str_opno.Trim(), "", str_opno_Desig.Trim(), op_id, ddlDistrict.SelectedItem.Text);

                                    }

                                }
                                int boothid = _db.IsStreamIDExists(streamid);
                                //if (boothid > 0)
                                //{
                                //    // Invalid Stream name or Blank
                                //    nodatalist.Add("(Duplicate Streamname) --> " + streamname.ToString() + " District --> " + str_district + " PC --> " + str_pc + " PS No --> " + str_psno);
                                //    //streamid = 0;
                                //    //DataSet dsstream = _db.GETSchoolIDofStreamwithbooth("FAKE-123456-FFAKE");
                                //    DataSet dsstream = _db.GETSchoolIDofStreamwithbooth();
                                //    if (dsstream.Tables[0].Rows.Count > 0)
                                //    {
                                //        // Valid Stream name
                                //        //bool upd2 = _db.UpdateboothdetailFAKE(boothid, Convert.ToInt32(dsstream.Tables[0].Rows[0]["id"]));
                                //        bool upd2 = _db.UpdateboothdetailFAKE(boothid, Convert.ToInt32(dsstream.Tables[0].Rows[0]["streamID"]));
                                //    }
                                //}
                                string StreamName = str_stream.ToUpper();
                                bool boothid1 = _db.isExistStreaminBooth(StreamName);
                                if (boothid1 ==true)
                                {
                                    nodatalist.Add("(Allready Assign to Booth) --> " + streamname.ToString() + " District --> " + str_district + " PC --> " + str_pc + " PS No --> " + str_psno);
                                }
                                else
                                {
                                    int schoolid_new = _db.addboothlocation(str_district, str_pc, str_schoolname, str_psno, str_location, streamid, Page.User.Identity.Name.ToString(), "Excel", op_id, str_long, str_lat, ispinkbooth, outsidebooth, cameralocationtype, str_isARO);

                                    count++;
                                }
                            }
                            if (listdup.Count > 0)
                            {
                                duplicatelist.Add(string.Join(",", listdup));
                            }


                            if (listnodata.Count > 0)
                            {
                                nodatalist.Add(string.Join(",", listnodata));
                            }
                        }
                    }

                }

                lblcount.Text = count + " booth uploaded successfully...<br/>";
                if (listToUpdate.Count > 0)
                {
                    lblerror.Text = "Invalid Operator Number:" + string.Join(",", listToUpdate.ToArray()) + "<br/>";
                }
                if (duplicatelist.Count > 0)
                {
                    lblduplicate.Text = "Camera already assigned : " + string.Join(",", duplicatelist.ToArray()) + "<br/>";
                }
                if (duplicateps.Count > 0)
                {
                    // lblduplicateps.Text = "PS Number already assigned : " + string.Join("<br/>", duplicateps.ToArray()) + "<br/>";
                    lblduplicateps.Text = "PS Number can't be blank. <br/>";
                }
                if (nodatalist.Count > 0)
                {
                    //lblnolist.Text = "Invalid Camera name : " + string.Join(",", nodatalist.ToArray()) + "<br/>";
                    lblnolist.Text = string.Join(",", nodatalist.ToArray()) + "<br/>";
                }
            }
            catch (Exception ex)
            {
                Common.Log("MainFunc() -- >  " + ex.Message);
            }
        }


        public List<string> GET_FormatedStreamname(string streamname)
        {
            List<string> list_streamname = new List<string>();
            string stream_prefix = ConfigurationManager.AppSettings["str_prefix"].ToString().ToLower();
            string[] str_streamlist = streamname.Split(',');
            foreach (string stream_pattern in str_streamlist)
            {
                if (!string.IsNullOrEmpty(stream_pattern) && stream_pattern != " " && stream_pattern.Contains("dvr") == false)
                {
                    //if (stream_pattern.IndexOf("to") > 0)
                    //{
                    //    //series
                    //    int startindex = Convert.ToInt32(stream_pattern.Split('t')[0]);
                    //    int endindex = Convert.ToInt32(stream_pattern.Split('o')[1]);
                    //    for (int index = startindex; index <= endindex; index++)
                    //    {
                    //        list_streamname.Add(stream_prefix + index);
                    //    }
                    //}
                    //else
                    //{
                    //    list_streamname.Add(stream_prefix + Convert.ToInt32(stream_pattern));
                    //}
                    list_streamname.Add(stream_pattern);
                }
            }
            return list_streamname;
        }

        public DataSet GetExcelData(string filepath, out List<string> columnsnames)
        {
            DataSet ds = new DataSet();
            try
            {
                //string connString = "Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath(filepath) + ";" + "Extended Properties=Excel 12.0 Xml;";
                //OleDbConnection oledbConn = new OleDbConnection(connString);
                //oledbConn.Open();
                //OleDbCommand cmd = new OleDbCommand("SELECT * FROM [Sheet1$]", oledbConn);
                //OleDbDataAdapter oleda = new OleDbDataAdapter();
                //oleda.SelectCommand = cmd;
                //oleda.Fill(ds, "boothlist");
                //oleda.Dispose();
                //oledbConn.Close();
                DataTable dt = new DataTable();
                using (XLWorkbook workBook = new XLWorkbook(Server.MapPath(filepath)))
                {
                    columnsnames = new List<string>();
                    //Read the first Sheet from Excel file.
                    IXLWorksheet workSheet = workBook.Worksheet(1);
                    bool firstRow = true;
                    foreach (IXLRow row in workSheet.Rows())
                    {
                        //Use the first row to add columns to DataTable.
                        if (firstRow)
                        {
                            foreach (IXLCell cell in row.Cells())
                            {
                                dt.Columns.Add(cell.Value.ToString());
                                columnsnames.Add(cell.Value.ToString());
                            }
                            firstRow = false;
                        }
                        else
                        {
                            //Add rows to DataTable.

                            if (row.FirstCellUsed() != null && row.LastCellUsed() != null)
                            {
                                dt.Rows.Add();
                                int i = 0;
                                foreach (IXLCell cell in row.Cells(row.FirstCellUsed().Address.ColumnNumber, row.LastCellUsed().Address.ColumnNumber))
                                {
                                    dt.Rows[dt.Rows.Count - 1][i] = cell.Value.ToString();
                                    i++;
                                }
                            }
                        }

                    }
                    ds.Tables.Add(dt);
                }
            }
            catch (Exception ex)
            {

                throw;
            }
           
            return ds;
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                HideMessage_error();
                HideMessage_Success();
                clearmsg();
                if (ddlDistrict.SelectedValue == "0")
                    LoadPC("", usertype);
                else
                    LoadPC(ddlDistrict.SelectedItem.Text, usertype);
                //LoadAC(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Text, usertype);

                LoadBooth(ddlDistrict.SelectedItem.Text, "");
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
                HideMessage_error();
                HideMessage_Success();
                clearmsg();
                //LoadAC(ddlDistrict.SelectedItem.Text, ddlAssembly.SelectedItem.Text, usertype);
                LoadBooth(ddlDistrict.SelectedItem.Text, "");
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
                HideMessage_error();
                HideMessage_Success();
                clearmsg();
                LoadBooth(ddlDistrict.SelectedItem.Text, "");
            }
            catch (Exception ex)
            {
                Common.Log("ddlDistrict_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }
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
                    else
                    {
                        if (ddlbooth.SelectedValue == "0")
                        {
                            usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                        }
                        //else
                        //{
                        //    // usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                        //    if (ddlpsbooth.SelectedValue == "0")
                        //    {
                        //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                        //    }
                        //    else
                        //    {
                        //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
                        //    }
                        //}
                    }
                }
            }
            else if (utypeall.StartsWith("pc"))
            {

                // usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                if (ddlbooth.SelectedValue == "0")
                {
                    usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                }
                //else
                //{
                //    // usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    if (ddlpsbooth.SelectedValue == "0")
                //    {
                //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    }
                //    else
                //    {
                //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
                //    }
                //}

            }
            else if (utypeall.StartsWith("sch_"))
            {
                if (ddlbooth.SelectedValue == "0")
                {
                    usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                }
                //else
                //{
                //    //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    if (ddlpsbooth.SelectedValue == "0")
                //    {
                //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                //    }
                //    else
                //    {
                //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
                //    }
                //}
            }
            else if (utypeall.StartsWith("zn"))
            {
                if (ddlDistrict.SelectedValue == "0")
                {
                    // DataSet ds = _booth.GetUserData(Page.User.Identity.Name);
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
                    if (ddlbooth.SelectedValue == "0")
                    {
                        usertype = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text;
                    }
                    //else
                    //{
                    //    //usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                    //    if (ddlpsbooth.SelectedValue == "0")
                    //    {
                    //        usertype = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;
                    //    }
                    //    else
                    //    {
                    //        usertype = "psbooth_" + ddlDistrict.SelectedItem.Text + "_" + ddlAssembly.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddlpsbooth.SelectedItem.Text;
                    //    }
                    //}
                }
                //else
                //{
                //    usertype = "dd_" + ddlDistrict.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text + "_" + ddllocation.SelectedItem.Text + "_" + ddlDate.SelectedItem.Text;
                //}
            }
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                LoadBooth(ddlDistrict.SelectedItem.Text, "");
            }
            catch
            {

            }
        }
        private void LoadBooth(string usertype, string acname)
        {
            try
            {
                DataSet ds = new DataSet();
                // ds = _db.GetList(usertype, acname, 0);
                ds = _boothlist.GetMapBoothListNew(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue != "" ? ddlAssembly.SelectedItem.Text : "", "",-1,-1,"", strm_txtBox.Text);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    int res = 1;
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    int columncount = GridView1.Rows[0].Cells.Count;
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                    GridView1.Rows[0].Cells[0].Text = "<div align='center'><label class='text-center text-danger'>No Records Found</label></div>";
                }
                else
                {
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Common.Log("LoadBooth() -- >  " + ex.Message);
            }
        }

        private void LoadDistrict(string user_type)
        {
            try
            {
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
                Common.Log("LoadDistrict() -- >  " + ex.Message);
            }
        }
        private void LoadPC(string District, string usertype)
        {
            try
            {




                var Assembly = _boothlist.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);

                ddlAssembly.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "accode";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new ListItem("ALL Assembly", ""));
            }
            catch (Exception ex)
            {
                Common.Log("LoadPC() -- >  " + ex.Message);
            }
        }
        //private void LoadAC(string District, string PCname, string usertype)
        //{
        //    try
        //    {
        //        lblcount.Text = "";
        //        lblerror.Text = "";

        //        DataSet ds_booth;

        //        ds_booth = _db.GetACList(District, PCname);
        //        DataRow dr = ds_booth.Tables[0].NewRow();
        //        dr[0] = allKeyword + assemblyname;
        //        dr[1] = "0";
        //        ds_booth.Tables[0].Rows.InsertAt(dr, 0);

        //        ddlbooth.DataSource = ds_booth;
        //        ddlbooth.DataTextField = "acname";
        //        ddlbooth.DataValueField = "SelValue";
        //        ddlbooth.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadAC() -- >  " + ex.Message);
        //    }
        //}
        protected void GridViewbooth_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadBooth(ddlDistrict.SelectedItem.Text, "");
        }

        protected void GridViewbooth_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadBooth(ddlDistrict.SelectedItem.Text, "");
            UpdatePanel1.Update();
        }

        protected void GridViewbooth_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {


            }
            catch (Exception ex)
            {
                Common.Log("GridViewuser_RowCommand" + ex.Message);
            }
        }

        private void ShowMessage_error(string message)
        {
            div_error.Visible = true;
            div_error.InnerHtml = "<button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times font-small\"></i></button>" + message;
        }
        private void ShowMessage_success(string message)
        {
            div_success.Visible = true;
            div_success.InnerHtml = "<button data-dismiss=\"alert\" class=\"close close-sm\" type=\"button\"><i class=\"fa fa-times font-small\"></i></button>" + message;
        }
        private void HideMessage_error()
        {
            div_error.Visible = false;
            div_error.InnerText = "";
            lblerrnofile.Text = "";
        }
        private void HideMessage_Success()
        {
            div_success.Visible = false;
            div_success.InnerText = "";
        }
        private void showerrormessage(string message)
        {
            lbl_error_addbooth.Visible = true;
            lbl_error_addbooth.InnerHtml = message;
        }
        private void hideerrormessage()
        {
            lbl_error_addbooth.Visible = false;
            lbl_error_addbooth.InnerHtml = "";
        }
        protected void GridViewbooth_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                Label boothid = (Label)row.FindControl("lblid");
                Label lbldistrict = (Label)row.FindControl("lbldistrict");
                Label lblacname = (Label)row.FindControl("lblschoolname");
                Label lblpsnum = (Label)row.FindControl("lblps");
                TextBox schlocation = (TextBox)row.FindControl("editlocation");
                TextBox dsp = (TextBox)row.FindControl("editdisp");
                TextBox dspmob = (TextBox)row.FindControl("editdispmob");
                TextBox dspDesignation = (TextBox)row.FindControl("editdispDesignation");
                TextBox stream = (TextBox)row.FindControl("editstreamnames");
                Label hdstream = (Label)GridView1.Rows[e.RowIndex].FindControl("hd_stream");
                DropDownList ispinkbooth = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("drpispink");
                //DropDownList outsidebooth = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("drpisoutside");
                //TextBox outsidebooth1 = (TextBox)row.FindControl("IsOutsideBooth");
                DropDownList str_isARO = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("drpisaro");
                //string cameralocationtype = outsidebooth.SelectedValue == "1" ? "Outside" : outsidebooth.SelectedValue == "0" ? "Inside" : "";
                TextBox cameralocationtype1 = (TextBox)row.FindControl("CameraLocationType");

                nwlocationnew = schlocation.Text.Trim().Split(',').FirstOrDefault() ?? "";
                nwoperatordetailnew = dsp.Text.Trim().Split(',').FirstOrDefault() ?? "";
                nwoperatornumnew = dspmob.Text.Trim().Split(',').FirstOrDefault() ?? "";
                string oldStreamName = hdstream.Text.Trim().Split(',').FirstOrDefault() ?? "";
                string newStreamName = stream.Text.ToString().Trim().Split(',').FirstOrDefault() ?? "";
                string outsidebooth = "";// outsidebooth1.Text.Trim().Split(',').FirstOrDefault() ?? "";
                string cameralocationtype = "";//; cameralocationtype1.Text.Trim().Split(',').FirstOrDefault() ?? "";

                // no streamname changes
                if (oldStreamName == newStreamName)
                {

                    int op_id = 0;
                    if (!string.IsNullOrEmpty(dspmob.Text.Trim().Split(',').FirstOrDefault() ?? ""))
                    {
                        DataSet ds_operator = _db.operatorexist(dspmob.Text.Trim().Split(',').FirstOrDefault() ?? "");
                        if (ds_operator.Tables[0].Rows.Count == 0)
                        {
                            if (!string.IsNullOrEmpty(dspmob.Text.Trim().Split(',').FirstOrDefault() ?? ""))
                            {
                                op_id = _db.ADDoperatorlist(dsp.Text.Trim().Split(',').FirstOrDefault() ?? "", dspmob.Text.Trim().Split(',').FirstOrDefault() ?? "", "", dspDesignation.Text.Trim().Split(',').FirstOrDefault() ?? "", ddlDistrict.SelectedItem.Text);
                            }
                        }
                        else
                        {
                            op_id = Convert.ToInt32(ds_operator.Tables[0].Rows[0]["id"]);
                            _db.UpdateOperator(dsp.Text.Trim().Split(',').FirstOrDefault() ?? "", dspmob.Text.Trim().Split(',').FirstOrDefault() ?? "", "", dspDesignation.Text.Trim().Split(',').FirstOrDefault() ?? "", op_id, ddlDistrict.SelectedItem.Text);
                        }
                    }
                    bool res = _db.Updateboothdetail(nwlocationnew, Convert.ToInt32(boothid.Text), 0, "", op_id, Page.User.Identity.Name.ToString(), "Excel",
                        ispinkbooth.SelectedValue, outsidebooth, cameralocationtype, str_isARO.SelectedValue);
                }
                else
                {
                    //stm name booth id get and check wheather allocate to any one
                    DataSet ds = _db.getBoothNumber(newStreamName);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        // Exist
                        oldst = lbldistrict.Text.Trim().Split(',').FirstOrDefault() ?? "";
                        olac = lblacname.Text.Trim().Split(',').FirstOrDefault() ?? "";
                        olps = lblpsnum.Text.Trim().Split(',').FirstOrDefault() ?? "";
                        oloperatordetail = dsp.Text.Trim().Split(',').FirstOrDefault() ?? "" + "-" + dspmob.Text.Trim().Split(',').FirstOrDefault() ?? "";
                        olstrm = hdstream.Text.Trim().Split(',').FirstOrDefault() ?? "";


                        nwdst = ds.Tables[0].Rows[0]["district"].ToString();
                        nwac = ds.Tables[0].Rows[0]["acname"].ToString();
                        nwps = ds.Tables[0].Rows[0]["accode"].ToString();
                        nwlocation = ds.Tables[0].Rows[0]["location"].ToString();

                        nwstrm = ds.Tables[0].Rows[0]["streamname"].ToString();
                        if (ds.Tables[1].Rows.Count > 0)
                        {
                            nwstreamid = Convert.ToInt32(ds.Tables[1].Rows[0]["id"]);
                        }
                        else
                        {
                            nwstreamid = SaveCameraDetailsByDeviceID(newStreamName);
                        }
                        nwboothid = Convert.ToInt32(boothid.Text);
                        // oldschid = Int32.Parse(ds.Tables[0].Rows[0]["schoolid"].ToString());

                        //newschid = Int32.Parse(nw.Tables[0].Rows[0]["schoolid"].ToString());
                        
                        //                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#conflictdata').modal({ backdrop: 'static',keyboard: false});", true);
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#conflictdata').show();", true);
                        //  UpdatePanel2.Update();
                    }
                    else
                    {
                        // Not Exist


                        int op_id = 0;
                        if (!string.IsNullOrEmpty(dspmob.Text.Trim()))
                        {
                            DataSet ds_operator = _db.operatorexist(dspmob.Text);
                            if (ds_operator.Tables[0].Rows.Count == 0)
                            {
                                if (!string.IsNullOrEmpty(dspmob.Text.Trim()))
                                {
                                    op_id = _db.ADDoperatorlist(dsp.Text.Trim(), dspmob.Text.Trim(), "", dspDesignation.Text, ddlDistrict.SelectedItem.Text);
                                }
                            }
                            else
                            {
                                op_id = Convert.ToInt32(ds_operator.Tables[0].Rows[0]["id"]);
                                _db.UpdateOperator(dsp.Text.Trim(), dspmob.Text.Trim(), "", dspDesignation.Text, op_id, ddlDistrict.SelectedItem.Text);
                            }
                        }
                        int streamid = 0;
                        if (ds.Tables[1].Rows.Count > 0)
                        {
                            streamid = Convert.ToInt32(ds.Tables[1].Rows[0]["id"]);
                        }
                        else
                        {
                            streamid = SaveCameraDetailsByDeviceID(newStreamName);
                        }

                        int bid = _db.IsStreamIDExists(streamid);
                        if (bid > 0)
                        {
                            streamid = 0;
                            showerrormessage("Duplicate Streamname");
                            return;
                        }
                        //bool upd = _db.Updateboothdetail(schlocation.Text, Convert.ToInt32(boothid.Text), streamid, "updatestreamid", op_id);
                        bool upd = _db.Updateboothdetail(nwlocationnew, Convert.ToInt32(boothid.Text), streamid, "updateboothwithalldata", op_id, Page.User.Identity.Name.ToString(), "Excel",
                            ispinkbooth.SelectedValue, outsidebooth, cameralocationtype, str_isARO.SelectedValue);

                    }

                }
                GridView1.EditIndex = -1;
                LoadBooth(ddlDistrict.SelectedItem.Text, "");
                UpdatePanel1.Update();
            }
            catch (Exception ex)
            {
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                Label boothid = (Label)row.FindControl("lblid");
                Label lblstreamname = (Label)row.FindControl("lblstreamnames");
                if (lblstreamname.Text.Contains(","))
                {
                    //lblerror.Text = "Please try after sometime !";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "alert('Please try after sometime !')", true);
                }
                else
                {
                    bool result = _db.deletebooth(Convert.ToInt32(boothid.Text), 0);
                    if (result)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Successful Deleted')");
                        //  ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "alert", "alert('Successful Deleted')", true);
                        //lblsuccess.Text = "Successfully Deleted !";

                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please try after sometime !!')");

                        // ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "alert", "alert('Please try after sometime !')", true);

                        return;
                    }
                }
                // UpdatePanel2.Update();
                LoadBooth(ddlDistrict.SelectedItem.Text, "");
                //UpdatePanel1.UpdateMode = UpdatePanelUpdateMode.Conditional;
                //UpdatePanel1.Update();
                //UpdatePanel1.UpdateMode = UpdatePanelUpdateMode.Always;
            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                //old streamname booth name zero
                // _db.UpdateStramNameUsingSchoolid(olstrm, newschid);
                //new streamnanme update school id to old schoolid
                //_db.Updateboothdetail(nwlocationnew, nwboothid, nwstreamid, "updateboothwithstream", 0);
                //bool upd = _db.Updateboothdetail(str_location.Trim(), Convert.ToInt32(schoolid_old), streamid, "updateboothwithalldata", op_id, Page.User.Identity.Name.ToString(), "Excel", ispinkbooth, outsidebooth, cameralocationtype, str_isARO);


                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#conflictdata').modal('hide');", true);
                LoadBooth(ddlDistrict.SelectedItem.Text, "");
            }
            catch (Exception ex)
            {
                Common.Log("btn_save_Click() -- >  " + ex.Message);
            }
        }

        protected void GetSelectedRecords(object sender, EventArgs e)
        {
            List<int> lstchk = new List<int>();
            List<int> lstunchk = new List<int>();

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    int boothid = Convert.ToInt32((row.Cells[1].FindControl("lblid") as Label).Text);
                    CheckBox chkRow = (row.Cells[0].FindControl("checkbox") as CheckBox);
                    if (chkRow.Checked)
                    {
                        lstchk.Add(boothid);
                    }
                    else
                    {
                        lstunchk.Add(boothid);
                    }
                }
            }
            _db.UpdateBoothdisplay(lstchk, 1);

            _db.UpdateBoothdisplay(lstunchk, 0);


            ShowMessage_success("Successfully Updated.");
        }


        private bool validcontact(string contact)
        {
            string rgx = @"((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$";
            if (System.Text.RegularExpressions.Regex.IsMatch(contact, rgx))
            {
                //input matches pattern

            }
            else
            {
                return false;
                //input does NOT match pattern
            }
            return true;
        }
        private void PopulateGridByIndex(int index)
        {
            //this.GridView1.PageIndex = index;
            LoadBooth(ddlDistrict.SelectedItem.Text, "");
            CheckData();
        }
        protected void check_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                int tempIndex = -1;
                CheckBox headerCheckbox = (sender as CheckBox);
                bool checkedvalue = headerCheckbox.Checked;
                ViewState["Uncheck"] = checkedvalue;
                tempIndex = GridView1.PageIndex;
                int pageindex = tempIndex;
                for (int i = 0; i <= GridView1.PageCount; i++)
                {
                    if (i == GridView1.PageCount)
                    {
                        PopulateGridByIndex(0);
                    }
                    else
                    {
                        PopulateGridByIndex(i);
                    }
                    string checkAllIndex = "chkAll-" + GridView1.PageIndex;
                    if (checkedvalue)
                    {
                        CheckBoxArray.Add(checkAllIndex);
                    }
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        (row.FindControl("checkbox") as CheckBox).Checked = checkedvalue;
                    }

                    ((CheckBox)GridView1.HeaderRow.Cells[0].FindControl("checkAll")).Checked = checkedvalue;
                }

                ViewState["CheckBoxArray"] = CheckBoxArray;
            }
            catch (Exception ex)
            {
            }
        }

        private void CheckData()
        {
            if (ViewState["CheckBoxArray"] != null)
            {
                ArrayList CheckBoxArray = (ArrayList)ViewState["CheckBoxArray"];
                string checkAllIndex = "chkAll-" + GridView1.PageIndex;
                if (CheckBoxArray.IndexOf(checkAllIndex) != -1)
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        (row.FindControl("checkbox") as CheckBox).Checked = true;
                    }
                    CheckBox chkAll = (CheckBox)GridView1.HeaderRow.Cells[0].FindControl("checkAll");
                    chkAll.Checked = true;
                }
            }
        }
        private int SaveCameraDetailsByDeviceID(string deviceid)
        {
            using (var client = new HttpClient())
            {
                //client.BaseAddress = new Uri("http://15.235.147.153:5000");
                client.BaseAddress = new Uri("http://media5.ambicam.com:5000");
                client.DefaultRequestHeaders.Accept.Clear();
                //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                HttpResponseMessage response = client.GetAsync("api/camera/query/?uuid=" + deviceid.ToString().ToUpper()).Result;
                if (response.IsSuccessStatusCode)
                {
                    string res = response.Content.ReadAsStringAsync().Result;
                    CameraAPI oresponse = JsonConvert.DeserializeObject<CameraAPI>(res);

                    if (oresponse?.rtmp != null && oresponse?.tcpurl != null)
                    {
                        string servername = "";
                        string tcpurl = "";
                        servername = oresponse.rtmp.Split('/')[2]?.Split(':').FirstOrDefault() ?? "";
                        tcpurl = oresponse.tcpurl.Split('/')[2] ?? "";
                        return _boothlist.SaveStreamList(deviceid, servername, tcpurl,Session["username"].ToString(), "BoothUpload.aspx");
                    }
                    if (oresponse?.message != null)
                    {
                        // string boothid = _db.IsStreamIDExists(deviceid);
                        DataSet dsstream = _db.GETSchoolIDofStreamwithbooth();
                        //if (dsstream.Tables[0].Rows.Count > 0)
                        //{
                        //    bool upd2 = _db.UpdateboothdetailFAKE(deviceid, Convert.ToInt32(dsstream.Tables[0].Rows[0]["streamID"]));
                        //}
                    }
                }
            }
            return 0;
        }


    }
   
}