using ClosedXML.Excel;
using exam.DAL;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exam
{
    public partial class CameraConnectedOnceReport : System.Web.UI.Page
    {
        db_data _data = new db_data();
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
        public DataSet dsReport
        {
            get
            {
                if (ViewState["dsReport"] != null)
                    return (DataSet)ViewState["dsReport"];
                else
                    return null;
            }
            set
            {
                ViewState["dsReport"] = value;
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

                Session["MenuName"] = "CameraConnectedOnceReport";
                stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"]);
                if (!IsPostBack)
                {
                    //FromDt.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    //ToDt.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    LoadDistrict();
                    GetStopCameraTotalList();
                }
                ScriptManager1.RegisterPostBackControl(this.btnExportPDF);
                ScriptManager1.RegisterPostBackControl(this.btnExportExcel);
                //ScriptManager1.RegisterPostBackControl(this.btnsearch);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void GetStopCameraTotalList()
        {
            DataSet ds = new DataSet();
            ds = _data.GetMapBoothListNew(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue,"", "");
            gridview1.DataSource = ds.Tables[0];
            gridview1.DataBind();
        }

        private void LoadDistrict()
        {
            try
            {
                var Alldist = _data.GetAllDistrictByStateId(stateid);

                ddlDistrict.DataSource = Alldist;
                ddlDistrict.DataTextField = "district";
                ddlDistrict.DataValueField = "district";
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select District", ""));
                ddlAssembly.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Assembly", ""));
                //ddlcamara.Items.Insert(0, new ListItem("Select Camera", ""));

            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  LoadDistrict()" + ex.Message);
            }
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                var Assembly = _data.GetAllAssemblyByDistrict(stateid, ddlDistrict.SelectedItem.Text);

                ddlAssembly.Items.Clear();
                //ddlcamara.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "acname";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Assembly", ""));
                //ddlcamara.Items.Insert(0, new ListItem("All Camera", ""));
                GetStopCameraTotalList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  ddlDistrictOnSelectedIndexChanged()" + ex.Message);
            }
        }

        protected void ddlAssembly_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //var vehicle = _data.GetAllVehicleByAcCode(ddlAssembly.SelectedItem.Value);

                //ddlcamara.Items.Clear();
                //ddlcamara.DataSource = vehicle;
                //ddlcamara.DataTextField = "Vehicle_no";
                //ddlcamara.DataValueField = "Vehicle_no";
                //ddlcamara.DataBind();
                //ddlcamara.Items.Insert(0, new ListItem("All Camera", ""));

                GetStopCameraTotalList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  AssemblyDropDownOnSelectedIndexChanged()" + ex.Message);
            }
        }

        protected void ddlcamara_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GetStopCameraTotalList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  ddlcamara_SelectedIndexChanged()" + ex.Message);
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            GetStopCameraTotalList();
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = _data.GetMapBoothListNew(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, "","");


            DataTable dtPdf = new DataTable();
            dtPdf.Columns.Add("District");
            dtPdf.Columns.Add("Assembly");
            dtPdf.Columns.Add("Operator Info");
            dtPdf.Columns.Add("Location");
            dtPdf.Columns.Add("Camera Id");
            dtPdf.Columns.Add("PS Number");
            dtPdf.Columns.Add("Status");


            foreach (DataRow row in ds.Tables[0].Rows)
            {
                DataRow dr = dtPdf.NewRow();
                dr[0] = row["district"];
                dr[1] = row["acname"];
                dr[2] = row["operatorName"] + " / " + row["operatorNumber"];
                dr[3] = row["location"];
                dr[4] = row["streamname"];
                dr[5] = row["PSNum"];
                dr[6] = row["isLive"];
                dtPdf.Rows.Add(dr);
            }

            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dtPdf, "Customers");

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=First Trial Run " + DateTime.Now.ToString() +".xlsx");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }

        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = _data.GetMapBoothListNew(ddlDistrict.SelectedValue, ddlAssembly.SelectedValue,"", "");


            DataTable dtPdf = new DataTable();
            dtPdf.Columns.Add("No");
            dtPdf.Columns.Add("District");
            dtPdf.Columns.Add("Assembly");
            dtPdf.Columns.Add("Operator Info");
            dtPdf.Columns.Add("Location");
            dtPdf.Columns.Add("Camera Id");
            dtPdf.Columns.Add("PS Number");
            dtPdf.Columns.Add("Status");

            var i = 0;
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                DataRow dr = dtPdf.NewRow();
                dr[0] = ++i;
                dr[1] = row["district"];
                dr[2] = row["acname"];
                dr[3] = row["operatorName"] + " / " + row["operatorNumber"];
                dr[4] = row["location"];
                dr[5] = row["streamname"];
                dr[6] = row["PSNum"];
                dr[7] = row["isLive"];
                dtPdf.Rows.Add(dr);
            }

            GeneratePDF(dtPdf, "First Trial Run ");
        }

        private void GeneratePDF(DataTable dataTable, string Name)
        {
            try
            {
                string[] columnNames = (from dc in dataTable.Columns.Cast<DataColumn>()
                                        select dc.ColumnName).ToArray();
                int Cell = 0;
                int count = columnNames.Length;
                object[] array = new object[count];

                dataTable.Rows.Add(array);

                Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
                System.IO.MemoryStream mStream = new System.IO.MemoryStream();
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, mStream);
                int cols = dataTable.Columns.Count;
                int rows = dataTable.Rows.Count;


                HeaderFooter header = new HeaderFooter(new Phrase(Name), false);

                // Remove the border that is set by default  
                header.Border = iTextSharp.text.Rectangle.TITLE;
                // Align the text: 0 is left, 1 center and 2 right.  
                header.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Header = header;
                // Header.  
                pdfDoc.Open();
                iTextSharp.text.Table pdfTable = new iTextSharp.text.Table(cols, rows);
                pdfTable.BorderWidth = 1; pdfTable.Width = 100;
                pdfTable.Padding = 1; pdfTable.Spacing = 4;

                //creating table headers  
                for (int i = 0; i < cols; i++)
                {
                    Cell cellCols = new Cell();
                    Chunk chunkCols = new Chunk();
                    cellCols.BackgroundColor = new iTextSharp.text.Color(System.Drawing.ColorTranslator.FromHtml("#548B54"));
                    iTextSharp.text.Font ColFont = FontFactory.GetFont(FontFactory.HELVETICA, 14, iTextSharp.text.Font.BOLD, iTextSharp.text.Color.WHITE);

                    chunkCols = new Chunk(dataTable.Columns[i].ColumnName, ColFont);

                    cellCols.Add(chunkCols);
                    pdfTable.AddCell(cellCols);
                }
                //creating table data (actual result)   

                for (int k = 0; k < rows; k++)
                {
                    for (int j = 0; j < cols; j++)
                    {
                        Cell cellRows = new Cell();
                        if (k % 2 == 0)
                        {
                            cellRows.BackgroundColor = new iTextSharp.text.Color(System.Drawing.ColorTranslator.FromHtml("#cccccc")); ;
                        }
                        else { cellRows.BackgroundColor = new iTextSharp.text.Color(System.Drawing.ColorTranslator.FromHtml("#ffffff")); }
                        iTextSharp.text.Font RowFont = FontFactory.GetFont(FontFactory.HELVETICA, 12);
                        Chunk chunkRows = new Chunk(dataTable.Rows[k][j].ToString(), RowFont);
                        cellRows.Add(chunkRows);

                        pdfTable.AddCell(cellRows);
                    }
                }

                pdfDoc.Add(pdfTable);
                pdfDoc.Close();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Name + "_" + DateTime.Now.ToString() + ".pdf");
                Response.Clear();
                Response.BinaryWrite(mStream.ToArray());
                Response.End();

            }
            catch (Exception ex)
            {

            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gridview1.PageIndex = e.NewPageIndex;
                this.GetStopCameraTotalList();
            }
            catch (Exception ex)
            {
                Common.Log("GridView1 -- >  OnPageIndexChanging()" + ex.Message);
            }
        }
    }
}