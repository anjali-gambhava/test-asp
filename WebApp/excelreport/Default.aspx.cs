using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using exam.DAL;

namespace exam.excelreport
{
    public partial class Default : System.Web.UI.Page
    {
        //public string connstr = ConfigurationManager.ConnectionStrings["connectionstr_download"].ToString();
        //public string table_prefix = ConfigurationManager.AppSettings["phase_stateid"].ToString();
        public string connstr = ConfigurationManager.ConnectionStrings["connectionstr"].ToString();
        public string table_prefix = ConfigurationManager.AppSettings["tb_prefix"].ToString();

        db_data_admin _dbadmin = new db_data_admin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        private DataSet LoaddataReport()
        {
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                DataSet ds = new DataSet();

                //string query = "select b.district,accode as 'District Code', acname as 'Panchayatname',psnum as PSNumber,location,streamname as Camera, s.status,islive,FORMAT(LastSeen,'dd/MM/yyyy hh:mm:ss tt') AS LastSeen ,o.operatorName,o.operatorNumber,s.servername from booth" + table_prefix + " b inner join streamlist" + table_prefix + " s on b.streamid = s.id inner join operator_info" + table_prefix + " o on o.id = b.operatorid  where b.isdisplay='True' and s.IsEnable=1 and b.boothstateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "' order by district,accode,acname";
                //SqlCommand command = new SqlCommand(query, conn);
                //SqlDataAdapter da = new SqlDataAdapter(command);
                //conn.Open();
                SqlCommand command = new SqlCommand("GetExeclBoothReport", conn);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                return new DataSet();
            }
            finally
            {
                conn.Close();
            }
        }


        protected void btnreportdst_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=" + ConfigurationManager.AppSettings["titlename"].ToString() + "ALLBooth" + DateTime.Now.ToString("ddMMyyyy") + ".xls");
                Response.ContentEncoding = System.Text.Encoding.Unicode;
                Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
                Response.ContentType = "application/vnd.ms-excel";
                DataSet ds = new DataSet();
                ds = LoaddataReport();
                // create a string writer
                //ds.Tables[0].Columns[0].ColumnName = "District";
                //ds.Tables[0].Columns[1].ColumnName = "PC Name";
                //ds.Tables[0].Columns[2].ColumnName = "Assembly";
                //ds.Tables[0].Columns[3].ColumnName = "PS No.";
                //ds.Tables[0].Columns[4].ColumnName = "Location";
                //ds.Tables[0].Columns[5].ColumnName = "Camera";
                //ds.Tables[0].Columns[6].ColumnName = "Status";
                //ds.Tables[0].Columns[7].ColumnName = "Once Connected";

                using (StringWriter sw = new StringWriter())
                {
                    using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                    {
                        DataGrid dg = new DataGrid();
                        dg.DataSource = ds.Tables[0];
                        dg.DataBind();
                        foreach (DataGridItem i in dg.Items)
                        {
                            foreach (TableCell tc in i.Cells)

                                tc.Attributes.Add("class", "text");
                        }
                        dg.RenderControl(htw);
                        string style = @"<style> .text { mso-number-format:\@; } </style> ";
                        Response.Write(style);
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

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
    }
}