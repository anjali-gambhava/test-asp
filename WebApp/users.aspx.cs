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
    public partial class users : System.Web.UI.Page
    {
        LoadTopSelections objloadtop = new LoadTopSelections();
        db_data_admin _db = new db_data_admin();
        public string district = ConfigurationManager.AppSettings["district"].ToString();
        public string allKeyword = ConfigurationManager.AppSettings["AllSelectKeword"].ToString() + " ";
        public string pcname = ConfigurationManager.AppSettings["pcname"].ToString();
        public string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();
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
            if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            HideMessage_error();
            HideMessage_Success();
            DataSet ds = _db.GetUserData(Page.User.Identity.Name);
            usertype = ds.Tables[0].Rows[0]["usercode"].ToString();
            stateid = Convert.ToInt32(ds.Tables[0].Rows[0]["stateid"]);
            utypeall = usertype;
            if (utypeall.Contains("_all"))
            {
                usertype = usertype.Replace("_all", "");
            }
            if (!IsPostBack)
            {
                LoadDistrict(usertype);
                LoadPC(ddlDistrict.SelectedItem.Text, usertype);
                LoadAC(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);
                Loaduser();
            }
        }

        private void Loaduser()
        {
            try
            {
                DataSet ds = new DataSet();
                if (ddlbooth.SelectedIndex > 0)
                {
                    ds = _db.getuserlist("", "loaduserslist", "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text);
                }
                else
                {
                    if (ddlPC.SelectedIndex > 0)
                    {
                        ds = _db.getuserlist("", "loaduserslist", "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text);
                    }
                    else
                    {
                        ds = _db.getuserlist("", "loaduserslist", "dst_" + ddlDistrict.SelectedItem.Text);
                    }
                }
                if (ds.Tables[0].Rows.Count == 0)
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    GridViewuser.DataSource = ds;
                    GridViewuser.DataBind();
                    int columncount = GridViewuser.Rows[0].Cells.Count;
                    GridViewuser.Rows[0].Cells.Clear();
                    GridViewuser.Rows[0].Cells.Add(new TableCell());
                    GridViewuser.Rows[0].Cells[0].ColumnSpan = columncount;
                    GridViewuser.Rows[0].Cells[0].Text = "<div align='center'><label class='text-center text-danger'>No Records Found</label></div>";
                }
                else
                {
                    GridViewuser.DataSource = ds;
                    GridViewuser.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void GridViewuser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                HideMessage_Success();
                HideMessage_error();
                GridViewuser.EditIndex = e.NewEditIndex;
                Loaduser();
            }
            catch (Exception ex)
            {
                Common.Log("GridViewuser_RowEditing" + ex.Message);
            }
        }

        protected void GridViewuser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                HideMessage_Success();
                HideMessage_error();
                GridViewuser.EditIndex = -1;
                Loaduser();
            }
            catch (Exception ex)
            {
                Common.Log("GridViewuser_RowCancelingEdit" + ex.Message);
            }
        }

        protected void GridViewuser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                GridViewRow row = GridViewuser.Rows[e.RowIndex];
                Label userid = (Label)row.FindControl("lblid");
                TextBox username = (TextBox)row.FindControl("txteditusername");
                TextBox password = (TextBox)row.FindControl("txteditpassword");
                DropDownList ddluser_identifier = (DropDownList)row.FindControl("ddledituser");
                DataSet ds = _db.getuserlist(username.Text, "chkuserslist", "");

                HideMessage_error();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToInt32(ds.Tables[0].Rows[0]["id"]) == Convert.ToInt32(userid.Text))
                    {
                        bool updateuser = _db.updateuserlist(Convert.ToInt32(userid.Text), username.Text, password.Text, Convert.ToInt32(ddluser_identifier.SelectedItem.Value));
                        ShowMessage_success("Successfully Updated...");
                        GridViewuser.EditIndex = -1;
                    }
                    else
                    {
                        ShowMessage_error("Username already exist...");
                    }
                }
                else
                {
                    bool updateuser = _db.updateuserlist(Convert.ToInt32(userid.Text), username.Text, password.Text, Convert.ToInt32(ddluser_identifier.SelectedItem.Value));
                    ShowMessage_success("Successfully Updated...");
                    GridViewuser.EditIndex = -1;
                }

                Loaduser();

            }
            catch (Exception ex)
            {
                Common.Log("GridViewuser_RowUpdating" + ex.Message);
            }
        }

        protected void GridViewuser_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddledituser = (DropDownList)e.Row.FindControl("ddledituser");
                    Label lbleditidf = (Label)e.Row.FindControl("lbleditidentifier");

                    ddledituser.SelectedValue = lbleditidf.Text;
                    if (ddlbooth.SelectedIndex > 0)
                    {
                        ddledituser.Enabled = false;
                    }
                }

            }
        }
        private void LoadDistrict(string user_type)
        {
            try
            {
              
                DataSet ds_dist = _db.GetDistrictList(user_type, stateid);
                DataRow dr = ds_dist.Tables[0].NewRow();
                dr[0] = allKeyword + district;
                dr[1] = "0";
                ds_dist.Tables[0].Rows.InsertAt(dr, 0);

                ddlDistrict.DataSource = ds_dist;
                ddlDistrict.DataTextField = "District";
                ddlDistrict.DataValueField = "SelValue";
                ddlDistrict.DataBind();
                ddlDistrict.SelectedIndex = Session["ddldistgrid"] != null ? Convert.ToInt32(Session["ddldistgrid"]) : 0;
                ddlDistrict_SelectedIndexChanged(ddlDistrict, null);
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

                DataSet ds_PC;

                ds_PC = _db.GetPCList(District);
                DataRow dr = ds_PC.Tables[0].NewRow();
                dr[0] = allKeyword + pcname;
                dr[1] = "0";
                ds_PC.Tables[0].Rows.InsertAt(dr, 0);

                ddlPC.DataSource = ds_PC;
                ddlPC.DataTextField = "accode";
                ddlPC.DataValueField = "SelValue";
                ddlPC.DataBind();
                ddlPC.SelectedIndex = 0;
                ddlPC_SelectedIndexChanged(ddlPC, null);
            }
            catch (Exception ex)
            {
                Common.Log("LoadPC() -- >  " + ex.Message);
            }
        }
        private void LoadAC(string District, string PCname, string usertype)
        {
            try
            {
                
                DataSet ds_booth;

                ds_booth = _db.GetACList(District, PCname);
                DataRow dr = ds_booth.Tables[0].NewRow();
                dr[0] = allKeyword + assemblyname;
                dr[1] = "0";
                ds_booth.Tables[0].Rows.InsertAt(dr, 0);

                ddlbooth.DataSource = ds_booth;
                ddlbooth.DataTextField = "acname";
                ddlbooth.DataValueField = "SelValue";
                ddlbooth.DataBind();
            }
            catch (Exception ex)
            {
                Common.Log("LoadAC() -- >  " + ex.Message);
            }
        }
        //private void LoadDistrict(string user_type)
        //{
        //    try
        //    {

        //        DataSet ds_dist = _db.GetDistrictList(user_type, stateid);
        //        ddlDistrict.DataSource = ds_dist;
        //        ddlDistrict.DataTextField = "District";
        //        ddlDistrict.DataValueField = "District";
        //        ddlDistrict.DataBind();
        //        int dist_count = ds_dist.Tables[0].Rows.Count;
        //        //if (dist_count > 0)
        //        //{
        //        //    ddlDistrict.Items.Insert(0, new ListItem("All District", "0"));
        //        //    ddlDistrict.SelectedIndex = 0;
        //        //}
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadDistrict() -- >  " + ex.Message);
        //    }
        //}
        //private void LoadPC()
        //{
        //    try
        //    {
        //        ddlPC.Items.Clear();
        //        DataSet ds_PC;

        //        ds_PC = _db.GetPCList(ddlDistrict.SelectedItem.Text);

        //        ddlPC.DataSource = ds_PC;
        //        ddlPC.DataTextField = "accode";
        //        ddlPC.DataValueField = "accode";
        //        ddlPC.DataBind();
        //        int sch_count = ds_PC.Tables[0].Rows.Count;
        //        if (sch_count > 0)
        //        {
        //            ddlPC.Items.Insert(0, new ListItem("All PCName", "0"));

        //        }
        //        ddlPC.SelectedIndex = 0;


        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadSchool_list() -- >  " + ex.Message);
        //    }
        //}
        //private void LoadAC()
        //{
        //    try
        //    {
        //        ddlbooth.Items.Clear();
        //        if (ddlPC.SelectedItem.Text != "All PCName")
        //        {
        //            DataSet ds_dist = _db.GetACList(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text);
        //            ddlbooth.DataSource = ds_dist;
        //            ddlbooth.DataTextField = "acname";
        //            ddlbooth.DataValueField = "acname";
        //            ddlbooth.DataBind();
        //            int dist_count = ds_dist.Tables[0].Rows.Count;
        //            if (dist_count > 0)
        //            {
        //                ddlbooth.Items.Insert(0, new ListItem("All ACName", "0"));
        //                ddlbooth.SelectedIndex = 0;
        //            }
        //        }
        //        else
        //        {
        //            ddlbooth.Items.Insert(0, new ListItem("All ACName", "0"));
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("LoadDistrict() -- >  " + ex.Message);
        //    }
        //}

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                HideMessage_error();
                HideMessage_Success();
                if (ddlDistrict.SelectedValue == "0")
                    LoadPC("", usertype);
                else
                    LoadPC(ddlDistrict.SelectedItem.Text, usertype);
                LoadAC(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);
                Loaduser();
            }
            catch (Exception ex)
            {
                Common.Log("ddlDistrict_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }
        protected void ddlPC_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                HideMessage_error();
                HideMessage_Success();
                LoadAC(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);
                Loaduser();
            }
            catch (Exception ex)
            {
                Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }

        //protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        LoadPC(ddlDistrict.SelectedItem.Text, usertype);
        //        LoadAC(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);
        //        Loaduser();
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("ddlDistrict_SelectedIndexChanged_list() -- >  " + ex.Message);
        //    }
        //}
        //protected void ddlPC_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        HideMessage_error();
        //        HideMessage_Success();

        //        LoadAC(ddlDistrict.SelectedItem.Text, ddlPC.SelectedItem.Text, usertype);

        //        Loaduser();
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
        //    }
        //}
        protected void ddlbooth_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Loaduser();
                if (ddlbooth.SelectedIndex > 0)
                {
                    DropDownList ddluser = (DropDownList)GridViewuser.FooterRow.FindControl("ddluser");
                    ddluser.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                Common.Log("ddlbooth_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }

        protected void ddluser_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                Common.Log("ddluser_SelectedIndexChanged_list() -- >  " + ex.Message);
            }
        }
        protected void GridViewuser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName.Equals("AddNew"))
                {
                    HideMessage_Success();
                    HideMessage_error();

                    TextBox txtusercode = (TextBox)GridViewuser.FooterRow.FindControl("txtusercode");
                    TextBox txtpassword = (TextBox)GridViewuser.FooterRow.FindControl("txtpassword");
                    TextBox txtusername = (TextBox)GridViewuser.FooterRow.FindControl("txtusername");
                    TextBox txtstateid = (TextBox)GridViewuser.FooterRow.FindControl("txtstateid");
                    DropDownList ddluser = (DropDownList)GridViewuser.FooterRow.FindControl("ddluser");
                    //ddluser.Enabled = true;
                    if (string.IsNullOrEmpty(txtusername.Text))
                    {
                        ShowMessage_error("Enter Username");
                    }
                    else if (string.IsNullOrEmpty(txtpassword.Text))
                    {
                        ShowMessage_error("Enter Password");
                    }
                    else
                    {
                        DataSet ds = _db.getuserlist(txtusername.Text, "chkuserslist", "");

                        HideMessage_error();

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ShowMessage_error("Username already exist...");
                        }
                        else
                        {
                            string usercode = string.Empty;

                            if (ddlbooth.SelectedIndex > 0)
                            {
                                usercode = "sch_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text + "_" + ddlbooth.SelectedItem.Text;

                            }
                            else
                            {
                                if (ddlPC.SelectedIndex > 0)
                                {
                                    usercode = "pc_" + ddlDistrict.SelectedItem.Text + "_" + ddlPC.SelectedItem.Text;
                                }
                                else
                                {
                                    usercode = "dst_" + ddlDistrict.SelectedItem.Text;
                                }
                            }
                            bool success = _db.adduser(txtusername.Text, txtpassword.Text, usercode, stateid, Convert.ToInt32(ddluser.SelectedItem.Value));
                            if (success)
                            {
                                ShowMessage_success("User Added Successfully...");
                            }
                        }
                        Loaduser();

                    }
                }
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
        }
        private void HideMessage_Success()
        {
            div_success.Visible = false;
            div_success.InnerText = "";
        }
    }
}