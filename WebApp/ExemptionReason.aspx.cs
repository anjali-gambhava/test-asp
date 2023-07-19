using exam.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exam
{
    public partial class ExemptionReason : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated || Session["userType"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            Session["MenuName"] = "ExemptionReason";

            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        private void BindGrid()
        {
            db_data dbContext = new db_data();

            try
            {
                var dt = dbContext.GetAllReason().Tables[0];

                ReasonGrid.DataSource = dt;
                ReasonGrid.DataBind();
            }
            catch (Exception ex)
            {
                Common.Log("ShiftMaster() -- >  BindGrid()" + ex.Message);
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                ReasonGrid.PageIndex = e.NewPageIndex;
                this.BindGrid();
            }
            catch (Exception ex)
            {
                Common.Log("ShiftMaster -- >  OnPageIndexChanging()" + ex.Message);
            }
        }

        protected void ReasonGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            db_data dbContext = new db_data();
            if (e.CommandName == "DeleteReason")
            {
                headerText.InnerText = "Delete Reason";
                ReasonChangeConfirm.CommandName = "DeleteConfirm";
                ReasonChangeConfirm.CommandArgument = e.CommandArgument.ToString();
                ReasonChangeConfirm.Text = "Delete Reason";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display='block'; addUpdate.style.display='none'; dlt.style.display='block';", true);
            }
            else if (e.CommandName == "EditReason")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                var row = dbContext.GetReasonById(id).Tables[0].Rows[0];

                headerText.InnerText = "Edit Reason";
                ReasonChangeConfirm.CommandName = "EditConfirm";
                ReasonChangeConfirm.CommandArgument = id.ToString();
                ReasonChangeConfirm.Text = "Submit";
                name.Value = row.Field<string>("name");
                desc.Value = row.Field<string>("desc");

                activeCBox.SelectedIndex = Convert.ToInt32(!row.Field<bool>("active"));

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display = 'block'; addUpdate.style.display='block'; dlt.style.display='none'; ", true);
            }
        }

        protected void AddReason(object sender, EventArgs e)
        {
            db_data dbContext = new db_data();
            var btn = (Button)sender;
            try
            {
                headerText.InnerText = "Add Reason";
                ReasonChangeConfirm.CommandName = "AddConfirm";
                ReasonChangeConfirm.Text = "Submit";
                name.Value = "";
                desc.Value = "";
                activeCBox.SelectedIndex = 0;

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display = 'block'; addUpdate.style.display='block'; dlt.style.display='none'; ", true);
            }
            catch (Exception ex)
            {
                Common.Log("ShiftMaster -- >  deleteShiftConfirmed()" + ex.Message);
            }
        }
        protected void ReasonChange(object sender, EventArgs e)
        {
            db_data dbContext = new db_data();
            var btn = (LinkButton)sender;
            try
            {
                if (btn.CommandName.Equals("AddConfirm") && ValidateReason())
                {
                    dbContext.AddReason(name.Value, desc.Value, Convert.ToInt32(activeCBox.SelectedValue));
                    this.BindGrid();
                }
                else if (btn.CommandName.Equals("EditConfirm") && ValidateReason())
                {
                    int id = Convert.ToInt32(btn.CommandArgument);
                    dbContext.UpdateReasonById(id, name.Value, desc.Value, Convert.ToInt32(activeCBox.SelectedValue));
                    this.BindGrid();
                }
                else if (btn.CommandName.Equals("DeleteConfirm"))
                {
                    int id = Convert.ToInt32(btn.CommandArgument);
                    dbContext.DeleteReasonById(id);
                    this.BindGrid();
                }
            }
            catch (Exception ex)
            {
                Common.Log("ShiftMaster -- >  deleteShiftConfirmed()" + ex.Message);
            }
        }

        private bool ValidateReason()
        {
            var validatation = true;

            name.Style.Add("border-color", "LightGray");
            
            if (name.Value.Equals(""))
            {
                validatation = false;
                name.Style.Add("border-color", "DarkRed");
            }
            if (!validatation)
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "modal.style.display = 'block'; addUpdate.style.display='block'; dlt.style.display='none'; ", true);
            return validatation;
        }
    }
}