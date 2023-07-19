using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Web.UI;
using Newtonsoft.Json;

namespace exam
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
            }
            
        }
      
        public DataSet getStreamList()
        {
            DataSet ds = new DataSet();
            string conString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
            SqlConnection conn = new SqlConnection(conString);
            try
            {
                string query = "Select deviceid,servername,status from streamlist where deviceid=@DID";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@DID", strm_txtBox.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                if(ds.Tables[0].Rows.Count>0)
                {
                    if(ds.Tables[0].Rows[0]["status"].ToString()== "RUNNING")
                    {
                        txtserverName.Text = ds.Tables[0].Rows[0]["servername"].ToString();
                        divPlayer.Visible = true;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "swal('Fail!','Camera Offline,Please Check POWER and INTERNET Connection!!','error');", true);
                        divPlayer.Visible = false;
                    }
                   
                }
              else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "swal('Fail!','Camera ID not found in Database!!','error');", true);
                    divPlayer.Visible = false;
                }
            }
            catch(Exception ex)
            {

            }
            return ds;
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            getStreamList();
        }

        public class CameraAPI
        {
            public string deviceid { get; set; }
            public string rtmp { get; set; }
            public string tcpurl { get; set; }
            public string message { get; set; }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("Test.aspx");
        }
    }

    
}