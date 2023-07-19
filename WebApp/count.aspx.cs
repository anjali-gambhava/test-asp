using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using exam.DAL;

namespace exam
{
    public partial class count : System.Web.UI.Page
    {

        db_data_admin _data = new db_data_admin();
        protected void Page_Load(object sender, EventArgs e)
        {
            HideMessage_error();
            HideMessage_Success();
            if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                Loaddata();
            }
        }

        private void Loaddata()
        {
          
            try
            {
                DataSet ds = new DataSet();
                ds = _data.GetBoothData();

                GridView1.DataSource = ds.Tables[1];
                GridView1.DataBind();

                GridView2.DataSource = ds.Tables[0];
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                Common.Log("LoadBooth() -- >  " + ex.Message);
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                Loaddata();
            }
            catch (Exception ex)
            {
            }
        }

        protected void GridViewbooth_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                HideMessage_Success();
                HideMessage_error();
                GridView1.EditIndex = e.NewEditIndex;
                Loaddata();
            }
            catch (Exception ex)
            {
                Common.Log("GridViewuser_RowEditing" + ex.Message);
            }
        }

        protected void GridViewbooth_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                HideMessage_Success();
                HideMessage_error();
                GridView1.EditIndex = -1;
                Loaddata();
            }
            catch (Exception ex)
            {
                Common.Log("GridViewuser_RowCancelingEdit" + ex.Message);
            }
        }

        protected void GridViewbooth_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                TextBox txtstaticlive = (TextBox)row.FindControl("txtslive");
                GridViewRow row1 = GridView2.Rows[e.RowIndex];
                Label lbltotalbooth = (Label)row1.FindControl("lblbooth");
                HideMessage_error();
                if (!System.Text.RegularExpressions.Regex.IsMatch(txtstaticlive.Text, "^[0-9]*$"))
                {
                    ShowMessage_error("Enter only numbers");
                }
                else
                {
                    int staticlive = Convert.ToInt32(txtstaticlive.Text);
                    int totalbooth = Convert.ToInt32(lbltotalbooth.Text);

                    if (totalbooth < staticlive)
                    {
                        ShowMessage_error("Live must be less than total booth");
                    }
                    else
                    {
                        bool updateuser = _data.updatecount(Convert.ToInt32(txtstaticlive.Text));
                        ShowMessage_success("Successfully Updated...");
                        GridView1.EditIndex = -1;
                        Loaddata();
                    }
                }
            }
            catch (Exception ex)
            {
                Common.Log("GridViewuser_RowUpdating" + ex.Message);
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