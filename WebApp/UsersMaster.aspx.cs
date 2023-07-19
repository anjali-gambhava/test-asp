using exam.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Configuration;
using ClosedXML.Excel;
using System.IO;
using System.Data.SqlClient;

namespace exam
{
    public partial class UsersMaster : System.Web.UI.Page
    {
        db_data dbContext = new db_data();
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
            if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (Session["userType"].ToString().ToLower() != "master_admin")
            {
                Response.Redirect("Default.aspx");
            }
            Session["MenuName"] = "Users";
            stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"]);
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        protected void UserChange(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            try
            {
                if (btn.CommandName.Equals("AddConfirm") && ValidateUser())
                {
                    dbContext.UpdateUserDetails(userName.Value, userpassword.Value,1,Convert.ToInt32( isenabled.SelectedValue),1,0, Accessids.Value, userRole.SelectedValue);
                    this.BindGrid();
                }
                else if (btn.CommandName.Equals("EditConfirm") && ValidateUser())
                {
                    int id = Convert.ToInt32(btn.CommandArgument);
                    dbContext.UpdateUserDetails(userName.Value, userpassword.Value, 1, Convert.ToInt32(isenabled.SelectedValue), 1, id, Accessids.Value, userRole.SelectedValue);
                    this.BindGrid();
                }
                else if (btn.CommandName.Equals("DeleteConfirm"))
                {
                    int id = Convert.ToInt32(btn.CommandArgument);
                    dbContext.DeleteUserById(id);
                    this.BindGrid();
                }
            }
            catch (Exception ex)
            {
                Common.Log("UserMaster -- >  deleteShiftConfirmed()" + ex.Message);
            }
        }
        protected void Adduser(object sender, EventArgs e)
        {
            db_data dbContext = new db_data();
            var btn = (Button)sender;
            try
            {
                headerText.InnerText = "Add User";
                ChangeConfirm.CommandName = "AddConfirm";
                ChangeConfirm.Text = "Submit";
                userName.Value = "";
                userpassword.Value = "";
                Accessids.Value = "";
                isenabled.SelectedIndex = 0;
                userRole.SelectedIndex = 0;

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display = 'block'; addUpdate.style.display='block'; dlt.style.display='none'; ", true);
            }
            catch (Exception ex)
            {
                Common.Log("UserMaster -- >  Adduser()" + ex.Message);
            }
        }
        protected void userGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            db_data dbContext = new db_data();
            if (e.CommandName == "DeleteUser")
            {
                headerText.InnerText = "Delete User";
                ChangeConfirm.CommandName = "DeleteConfirm";
                ChangeConfirm.CommandArgument = e.CommandArgument.ToString();
                ChangeConfirm.Text = "Delete User";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display='block'; addUpdate.style.display='none'; dlt.style.display='block';", true);
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "swal('Confirm!','Are you sure you want to delete this record?','warning');$('#loaderdiv').hide();", true);
            }
            else if (e.CommandName == "EditUser")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                var row = dbContext.GetUserById(id).Tables[0].Rows[0];
                userName.Value = row["username"].ToString();
                userpassword.Value = row["password"].ToString();
                Accessids.Value= row["AssemblyAccesIds"].ToString();
                userRole.SelectedValue = row["usercode"].ToString();
                isenabled.SelectedValue = row["isenable"].ToString().Replace("True","1").Replace("False","0");
                headerText.InnerText = "Edit User";
                ChangeConfirm.CommandName = "EditConfirm";
                ChangeConfirm.CommandArgument = id.ToString();
                ChangeConfirm.Text = "Submit";


                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display = 'block'; addUpdate.style.display='block'; dlt.style.display='none'; ", true);
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                userGrid.PageIndex = e.NewPageIndex;
                this.BindGrid();
            }
            catch (Exception ex)
            {
                Common.Log("UserMaster -- >  OnPageIndexChanging()" + ex.Message);
            }
        }
        private void BindGrid()
        {
            db_data dbContext = new db_data();

            try
            {
                var dt = dbContext.GetAllUsers().Tables[0];
                userGrid.DataSource = dt;
                userGrid.DataBind();
            }
            catch (Exception ex)
            {
                Common.Log("UserMaster() -- >  BindGrid()" + ex.Message);
            }
        }

        [WebMethod]
        public static string GetDistrictList()
        {
            db_data _data = new db_data();
            DataSet ds = new DataSet();
            ds = _data.GetDistrictAssemblyList();
         
            return DataTableToJSONWithJSONNet(ds.Tables[0]);
        }

        public static string DataTableToJSONWithJSONNet(DataTable table)
        {
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }

        private bool ValidateUser()
        {
            var validatation = true;

            userName.Style.Add("border-color", "LightGray");
            userpassword.Style.Add("border-color", "LightGray");

            if (userName.Value.Equals(""))
            {
                validatation = false;
                userName.Style.Add("border-color", "DarkRed");
            }
            if (userpassword.Value.Equals(""))
            {
                validatation = false;
                userpassword.Style.Add("border-color", "DarkRed");
            }
            if (!validatation)
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display = 'block'; addUpdate.style.display='block'; dlt.style.display='none'; ", true);
            return validatation;
        }

        protected void btnUploadMasterData_Click(object sender, EventArgs e)
        {
            try
            {
                var dataTable = new DataTable();
                //Open the Excel file using ClosedXML.
                using (XLWorkbook workBook = new XLWorkbook(FileUploadData.PostedFile.InputStream))
                {
                    //Read the first Sheet from Excel file.
                    IXLWorksheet workSheet = workBook.Worksheet(1);

                    //Loop through the Worksheet rows.
                    bool firstRow = true;
                    foreach (IXLRow row in workSheet.Rows())
                    {
                        //Use the first row to add columns to DataTable.
                        if (firstRow)
                        {
                            foreach (IXLCell cell in row.Cells())
                            {
                                if (!string.IsNullOrEmpty(cell.Value.ToString()))
                                {
                                    dataTable.Columns.Add(cell.Value.ToString());
                                }
                            }
                            firstRow = false;
                        }
                        else
                        {
                            //Add rows to DataTable.
                            dataTable.Rows.Add();
                            int i = 0;
                            foreach (IXLCell cell in row.Cells())
                            {
                                if (!string.IsNullOrEmpty(cell.Value.ToString()))
                                {
                                    dataTable.Rows[dataTable.Rows.Count - 1][i] = cell.Value.ToString();
                                }
                                //if (i == 4 || i == 5 || i == 6 || i == 8 || i == 9)
                                //    dataTable.Rows[dataTable.Rows.Count - 1][i] = cell.Value.ToString().Equals("") ? null
                                //         : DateTime.FromOADate(double.Parse(cell.Value.ToString())).ToString("MM/dd/yyyy");
                                //else
                                //    dataTable.Rows[dataTable.Rows.Count - 1][i] = cell.Value.ToString();

                                i++;
                            }
                        }
                    }
                }

                dbContext.UploadMasterData(dataTable);
                this.BindGrid();
            }
            catch (Exception ex)
            {
                Common.Log("Upload Master Data -- >" + ex.Message);
            }
        }
        public DataSet GetExcelData(string filepath, out List<string> columnsnames)
        {
            DataSet ds = new DataSet();
            try
            {
                DataTable dt = new DataTable();
                using (XLWorkbook workBook = new XLWorkbook(Server.MapPath(filepath)))
                {
                    columnsnames = new List<string>();
                    //Read the first Sheet from Excel file.
                    IXLWorksheet workSheet = workBook.Worksheet(1);
                    bool firstRow = true;
                    foreach (IXLRow row in workSheet.Rows())
                    {
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
        protected void btnupload_Click(object sender, EventArgs e)
        {
            string filename = DateTime.Now.ToString().Replace(" ", "").Replace(":", "").Replace("/", "").Replace("AM", "").Replace("PM", "") + ".xlsx";
            if (FileUploadbooth.PostedFile.ContentLength == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "swal('Fail!','Please Choose excel file!!','error');$('#loaderdiv').hide();", true);
                return;
            }
            else
            {
                string extn = Path.GetExtension(FileUploadbooth.PostedFile.FileName).ToLower();
                if (extn != ".xls" && extn != ".xlsx")
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "swal('Fail!','Please select only .xlsx file','error');$('#loaderdiv').hide();", true);
                    return;
                }
                //8/3/2021 4:30:41 PM
                FileUploadbooth.SaveAs(Server.MapPath(filename));
                MainFunc(filename);
               // SendUploadAutomatedEmail();
            }
        }
        public DataSet MainFunc(string filepath)
        {
            DataSet ds = new DataSet();
            DataSet dsDID = new DataSet();
            string connstr = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                List<string> columnsnames = new List<string>();
                DataSet ds_Excel = GetExcelData(filepath, out columnsnames);
                
                DataTable firstTable = ds_Excel.Tables[0];
                string query = "BulkUserInsert";
                SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
                SQLcommand.CommandType = CommandType.StoredProcedure;
                SQLcommand.Parameters.AddWithValue("@tbl", firstTable);
                SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
                SQLconn.Open();
                adp.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "swal('Success!','"+ ds.Tables[0].Rows[0]["Msg"].ToString() + "','success');$('#loaderdiv').hide();", true);
                    BindGrid();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "alert", "swal('Fail!','Error.. Please try again!!','error');$('#loaderdiv').hide();", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "alert", "swal('Fail!','Error.. Please try again!!','error');$('#loaderdiv').hide();", true);
            }
            finally
            {
                SQLconn.Close();
            }
            return ds;
        }

    }
}