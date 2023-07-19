using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using exam.DAL;
using System.Web.Security;
using System.Configuration;

namespace exam
{
    public partial class Default : System.Web.UI.Page
    {
        db_data _user = new db_data();
        CallSP _callSP = new CallSP();
        public string defaultpage = ConfigurationManager.AppSettings["defaultpage"].ToString();
        public string defaultpageforsm = ConfigurationManager.AppSettings["defaultpageforsm"].ToString();
        public string defaultpagefordm = ConfigurationManager.AppSettings["defaultpagefordm"].ToString();
        public string defaultpageforeci = ConfigurationManager.AppSettings["defaultpageforeci"].ToString();
        public int logincount = Convert.ToInt32(ConfigurationManager.AppSettings["logincount"].ToString());
        public int stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblMsg.Visible = false;
                lblMsg.Text = "";
                if (Page.User.Identity.IsAuthenticated && Session["userType"] != null)
                {
                    DataSet ds = _user.GetUserData(Page.User.Identity.Name);
                    int useridentifier = Convert.ToInt32(ds.Tables[0].Rows[0]["identifier"].ToString());
                    if (useridentifier == 1)
                    {
                        if (Page.User.Identity.Name.ToUpper() == "TNECI")
                        {
                            Response.Redirect(defaultpageforeci);
                        }
                        else
                        {
                            Response.Redirect(defaultpage);
                        }
                    }
                    else
                    {
                        Response.Redirect(defaultpagefordm);
                    }
                }


            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            try
            {
                
                    DataSet ds = _callSP.GetFolderListWithCount(txtUsername.Text, txtPassword.Text);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string usertype = ds.Tables[0].Rows[0]["usercode"].ToString();
                    try
                    {
                        _user.SaveLoginUserHistory(Convert.ToInt32(ds.Tables[0].Rows[0]["id"]), System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString());
                    }
                    catch { }
                    if (Convert.ToInt32(ds.Tables[0].Rows[0]["logincount"]) >= logincount && Convert.ToBoolean(ds.Tables[0].Rows[0]["logincountenable"]))
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = ResponseReturnMessages.Contact_Administrator;
                        }
                        else
                        {
                            Session["userid"] = ds.Tables[0].Rows[0]["id"].ToString();
                            Session["username"] = ds.Tables[0].Rows[0]["username"].ToString();
                            Session["AssemblyAccesIds"] = ds.Tables[0].Rows[0]["AssemblyAccesIds"].ToString();
                            Session["userType"] = ds.Tables[0].Rows[0]["usercode"].ToString();
                            string usrty = ds.Tables[0].Rows[0]["usercode"].ToString();
                            if (usrty.StartsWith("dst_"))
                            {
                                Session["userdist"] = usrty.Split('_')[1];
                            }
                            else if (usrty.StartsWith("sch_"))
                            {
                                Session["userdist"] = usrty.Split('_')[1];
                                Session["userpc"] = usrty.Split('_')[2];
                                Session["userbooth"] = usrty.Split('_')[3];
                            }

                            int state_id_user = Convert.ToInt32(ds.Tables[0].Rows[0]["stateid"].ToString());
                            if (state_id_user == stateid)
                        {
                                Session["userAssemblyAccess"] = ds.Tables[1];

                                int useridentifier = Convert.ToInt32(ds.Tables[0].Rows[0]["identifier"].ToString());
                                if (useridentifier == 1)
                                {
                                   // Common.Log("btn_Login_Click() -- >  " + string.Format("{0} Login at {1}", txtUsername.Text, DateTime.Now.ToString()));
                                    setuser_cookie(txtUsername.Text);
                                    if (txtUsername.Text.ToUpper() == "TNECI")
                                    {
                                        Response.Redirect(defaultpageforeci);
                                    }
                                    else
                                    {
                                        Response.Redirect(defaultpage);
                                    }
                                }
                                else if (useridentifier == 2)
                                {
                                    //Common.Log("btn_Login_Click() -- >  " + string.Format("{0} Login at {1}", txtUsername.Text, DateTime.Now.ToString()));
                                    setuser_cookie(txtUsername.Text);
                                    Response.Redirect(defaultpagefordm);
                                }
                                else if (useridentifier == 3)
                                {
                                    //Common.Log("btn_Login_Click() -- >  " + string.Format("{0} Login at {1}", txtUsername.Text, DateTime.Now.ToString()));
                                    setuser_cookie(txtUsername.Text);
                                    Response.Redirect(defaultpagefordm);
                                }
                                else if (useridentifier == 4)
                                {
                                    //Common.Log("btn_Login_Click() -- >  " + string.Format("{0} Login at {1}", txtUsername.Text, DateTime.Now.ToString()));
                                    setuser_cookie(txtUsername.Text);
                                    Response.Redirect(defaultpagefordm);
                                }

                                else if (useridentifier == 5)
                                {
                                    //Common.Log("btn_Login_Click() -- >  " + string.Format("{0} Login at {1}", txtUsername.Text, DateTime.Now.ToString()));                              
                                    setuser_cookie(txtUsername.Text);
                                    Response.Redirect("sitePages.aspx");
                                }
                                else if (useridentifier == 6)
                                {
                                    //Common.Log("btn_Login_Click() -- >  " + string.Format("{0} Login at {1}", txtUsername.Text, DateTime.Now.ToString()));                              
                                    setuser_cookie(txtUsername.Text);
                                    Response.Redirect(defaultpagefordm);
                                }  
                                else
                                {
                                    lblMsg.Visible = true;
                                    lblMsg.Text = ResponseReturnMessages.Contact_Administrator;
                                }
                            }
                            else
                            {
                                lblMsg.Visible = true;
                                lblMsg.Text = ResponseReturnMessages.InvalidCredential;
                            }

                        }
                    }
                    else
                    {
                    //lblMsg.Visible = true;
                    //lblMsg.Text = "Invalid Username or Password";
                    
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr", "$(function () { toastr.error('Invalid Username or Password..'); });", true);
                     
                }

            }
            catch (Exception ex)
            {
                Common.Log("btn_Login_Click() -- >  " + ex.Message);
                lblMsg.Visible = true;
            }
        }


        private void setuser_cookie(string uname)
        {
            FormsAuthenticationTicket _ticket = new FormsAuthenticationTicket(1, uname, DateTime.Now, DateTime.Now.AddMonths(1), false, uname, FormsAuthentication.FormsCookiePath);
            string encTicket = FormsAuthentication.Encrypt(_ticket);
            HttpCookie _cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
            _cookie.Expires = DateTime.Now.AddHours(24);
            Response.Cookies.Add(_cookie);
            _user.updatelogincount(uname);
        }
    }
}