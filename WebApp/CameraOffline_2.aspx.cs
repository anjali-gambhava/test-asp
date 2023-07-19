using exam.DAL;
using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using NReco.PdfGenerator;
using iTextSharp.text;
using PageSize = iTextSharp.text.PageSize;


namespace exam
{
    public partial class CameraOffline_2 : System.Web.UI.Page
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

                Session["MenuName"] = "ConsolidatedCameraOffline";
                stateid = Convert.ToInt32(ConfigurationManager.AppSettings["stateid"]);

                if (!IsPostBack)
                {
                    FromDt.Text = DateTime.Now.ToString("dd/MM/yyyy");//"20/02/2022";// 
                    ToDt.Text = DateTime.Now.ToString("dd/MM/yyyy");//"20/02/2022";// 
                    ddlFromTime.SelectedValue = ConfigurationManager.AppSettings["starthour"].ToString();
                    ddlToTime.SelectedValue = ConfigurationManager.AppSettings["endhour"].ToString();
                    LoadDistrict();
                    GetStopCameraList();
                }
                ScriptManager1.RegisterPostBackControl(this.btnExportPDF);
            }
            catch (Exception ex)
            {

            }
        }

        private void GetStopCameraList()
        {
            DataSet ds = new DataSet();
            string fromdate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string todate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string fromtime = ddlFromTime.SelectedValue;
            string totime = ddlToTime.SelectedValue;
            fromtime = fromtime == "" ? ConfigurationManager.AppSettings["starthour"].ToString() : fromtime;
            totime = totime == "" ? ConfigurationManager.AppSettings["endhour"].ToString() : totime;
            ds = _data.GetCameraOfflineList(fromdate + " " + fromtime, todate + " " + totime, ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, ddlcamara.SelectedValue, ShiftDropDown.SelectedValue);
            if (ds.Tables[0].Rows.Count > 0)
            {

                EmpGridView.DataSource = ds;
                EmpGridView.DataBind();
                ViewState["data"] = ds;
            }
            else
            {
                EmpGridView.DataSource = null;
                EmpGridView.DataBind();
            }
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

                ddlDistrict.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All District", ""));
                ddlAssembly.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Assembly", ""));
                ddlcamara.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Vehicle", ""));

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
                ddlcamara.Items.Clear();
                ddlAssembly.DataSource = Assembly;
                ddlAssembly.DataTextField = "acname";
                ddlAssembly.DataValueField = "accode";
                ddlAssembly.DataBind();

                ddlAssembly.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Assembly", ""));
                ddlcamara.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Vehicle", ""));
                GetStopCameraList();
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
                var vehicle = _data.GetAllVehicleByAcCode(ddlAssembly.SelectedItem.Value);

                ddlcamara.Items.Clear();
                ddlcamara.DataSource = vehicle;
                ddlcamara.DataTextField = "Vehicle_no";
                ddlcamara.DataValueField = "Vehicle_no";
                ddlcamara.DataBind();
                ddlcamara.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Vehicle", ""));

                GetStopCameraList();
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
                GetStopCameraList();
            }
            catch (Exception ex)
            {
                Common.Log("VehicleStartStopReport -- >  ddlcamara_SelectedIndexChanged()" + ex.Message);
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            GetStopCameraList();
        }

        protected void btnExportPDF_Click(object sender, EventArgs e)
            {
            

            DataSet ds1 = new DataSet();
            string fromdate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string todate = FromDt.Text.Trim().Split(new char[] { '/', '-' })[2] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[1] + "-" + FromDt.Text.Trim().Split(new char[] { '/', '-' })[0];
            string fromtime = ddlFromTime.SelectedValue;
            string totime = ddlToTime.SelectedValue;
            fromtime = fromtime == "" ? ConfigurationManager.AppSettings["starthour"].ToString() : fromtime;
            totime = totime == "" ? ConfigurationManager.AppSettings["endhour"].ToString() : totime;
            ds1 = _data.GetCameraOfflineList(fromdate + " " + fromtime, todate + " " + totime, ddlDistrict.SelectedValue, ddlAssembly.SelectedValue, ddlcamara.SelectedValue, ShiftDropDown.SelectedValue);
            EmpGridView.DataSource = ds1;
            EmpGridView.AllowPaging = false;
            EmpGridView.DataBind();
            BaseFont bf = BaseFont.CreateFont(Environment.GetEnvironmentVariable("windir") + @"\Fonts\ArialUni.TTF", BaseFont.IDENTITY_H, true);

            iTextSharp.text.pdf.PdfPTable table = new iTextSharp.text.pdf.PdfPTable(EmpGridView.Columns.Count);
            int[] widths = new int[EmpGridView.Columns.Count];
            for (int x = 0; x < EmpGridView.Columns.Count; x++)
            {
                widths[x] = (int)EmpGridView.Columns[x].ItemStyle.Width.Value;
                string cellText = Server.HtmlDecode(EmpGridView.HeaderRow.Cells[x].Text);

                //Set Font and Font Color
                iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
                //font.Color = new Color(EmpGridView.HeaderStyle.ForeColor);
                iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, font));

                //Set Header Row BackGround Color
                // cell.BackgroundColor = new Color(EmpGridView.HeaderStyle.BackColor);


                table.AddCell(cell);
            }
            table.SetWidths(widths);

            for (int i = 0; i < EmpGridView.Rows.Count; i++)
            {
                if (EmpGridView.Rows[i].RowType == DataControlRowType.DataRow)
                {
                    for (int j = 0; j < EmpGridView.Columns.Count; j++)
                    {
                        string cellText = ds1.Tables[0].Rows[i][j].ToString();

                        //Set Font and Font Color
                        iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
                        ///  font.Color = new Color(EmpGridView.RowStyle.ForeColor);
                        iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, font));


                        //Set Color of row
                        if (i % 2 == 0)
                        {
                            //Set Row BackGround Color
                            //  cell.BackgroundColor = new Color(EmpGridView.RowStyle.BackColor);
                        }

                        table.AddCell(cell);
                    }
                }
            }

            //Create the PDF Document
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            pdfDoc.Add(table);
            pdfDoc.Close();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDoc);
            Response.End();
        }
    /// <summary>
    /// Returns HTML string.
    /// </summary>
    /// <remarks>Its test data. You can create html using data
    /// getting from database or whatever your data source.</remarks>
    /// <returns></returns>
    
    public string ShowHtml()
        {
            StringBuilder html = new StringBuilder("<table id=\"tblReport\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-width: 0px;border - collapse: collapse; font - family: Tahoma; font - size: 11px; table - layout: fixed; line - height: 20px;\">" +
                      "<thead>" +
                          "<tr style=\"background-color: #4862A3; font-family: verdana; color: white;\">" +
                              "<th style=\"width: 200px; text-align: center;\">Name</th>           " +
                              "<th style=\"width: 150px; text-align: center;\">Date Published</th> " +
                              "<th style=\"width: 200px; text-align: center;\">Category</th>     " +
                              "<th style=\"width: 100px; text-align: center;\">Popularity</th>     " +
                          "</tr>" +
                      "</thead>" +
                      "<tbody>" +
                          "<tr>" +
                              "<th style=\"width: 200px; text-align: left; text-align: center;\">Domain Driven Design</th>" +
                              "<th style=\"width: 150px; text-align: left; text-align: center;\">02/05/2011</th>          " +
                              "<th style=\"width: 200px; text-align: center; text-align: center;\">Design Patterns</th>   " +
                              "<th style=\"width: 100px; text-align: left; text-align: center;\">6 out of 10</th>         " +
                          "</tr>" +
                          "<tr>" +
                              "<th style=\"width: 200px; text-align: left; text-align: center;\">When Not to use jQuery</th> " +
                              "<th style=\"width: 150px; text-align: left; text-align: center;\">02/05/2011</th>             " +
                              "<th style=\"width: 200px; text-align: center; text-align: center;\">jQuery in ASP.Net</th>    " +
                              "<th style=\"width: 100px; text-align: left; text-align: center;\">8 out of 10</th>            " +
                          "</tr>" +
                          "<tr>" +
                              "<th style=\"width: 200px; text-align: left; text-align: center;\">Programmer's evolution</th> " +
                              "<th style=\"width: 150px; text-align: left; text-align: center;\">02/05/2011</th>             " +
                              "<th style=\"width: 200px; text-align: center; text-align: center;\">General Programming</th>  " +
                              "<th style=\"width: 100px; text-align: left; text-align: center;\">4 out of 10</th>            " +
                          "</tr>");
            for (int i = 0; i < 150; i++)
            {
                html.Append("<tr>" +
                    "<th style=\"width: 200px; text-align: left; text-align: center;\">Test Data</th> " +
                    "<th style=\"width: 150px; text-align: left; text-align: center;\">02/05/2011</th>             " +
                    "<th style=\"width: 200px; text-align: center; text-align: center;\">import html to pdf in asp.net</th>  " +
                    "<th style=\"width: 100px; text-align: left; text-align: center;\">4 out of 10</th>            " +
                "</tr>");
            }
            html.Append("</tbody></html>");
            return html.ToString();
        }
        /// <summary>
        /// Converts html into PDF using nReco dll and wkhtmltopdf.exe.
        /// </summary>        
    //    private byte[] ConvertHtmlToPDF()
    //{
    //    HtmlToPdfConverter nRecohtmltoPdfObj = new HtmlToPdfConverter();
    //    nRecohtmltoPdfObj.Orientation = PageOrientation.Portrait;
    //    nRecohtmltoPdfObj.PageFooterHtml = "";
    //    nRecohtmltoPdfObj.CustomWkHtmlArgs =
    //    "--margin-top 35 --header-spacing 0 --margin-left 0 --margin-right 0";
    //    return nRecohtmltoPdfObj.GeneratePdf(CreatePDFScript() +
    //    ShowHtml() + "</body></html>");
    //}
        private string CreatePDFScript()
        {
            return "<html><head><style>td,th{line-height:20px;} tr { page-break-inside: avoid }</style><script>function subst()  {var vars={};var x=document.location.search.substring(1).split('&'); for(var i in x) {var z=x[i].split('=',2);vars[z[0]] = unescape(z[1]);}" +
            "var x=['frompage','topage','page','webpage', 'section','subsection','subsubsection'];for(var i in x)  {var y = document.getElementsByClassName(x[i]);" +
            "for(var j=0; j<y.length; ++j) y[j].textContent =  vars[x[i]];}}</script></head><body onload=\"subst()\">";
        }
    //protected void Button1_Click1(object sender, EventArgs e)
    //{

    //    PdfDocument doc = new PdfDocument();

    //    //Add a page to the document
    //    PdfPage page = doc.Pages.Add();

    //    //Initialize the PDF page graphics
    //    PdfGraphics graphics = page.Graphics;

    //    //Set the font with Unicode option
    //    Font font = new Font("Nirmala UI", 14);

    //    PdfFont pdfFont = new PdfTrueTypeFont(font, true);

    //    //Create a new instance for PdfStringFormrat
    //    PdfStringFormat format = new PdfStringFormat();

    //    //Set the format as complex script layout type
    //    format.ComplexScript = true;

    //    //Draw the text to page graphics 
    //    graphics.DrawString("मेरा नाम है दिनेश", pdfFont, PdfBrushes.Black, new RectangleF(0, 0, page.GetClientSize().Width, page.GetClientSize().Height), format);

    //    //Save the document
    //    doc.Save("Sample.pdf");
    //    doc.Close(true);

    //    //Close the document 
    //    //    DataTable dt = new DataTable();
    //    //    EmpGridView.AllowPaging = false;
    //    //    GetStopCameraList();
    //    //    EmpGridView.DataBind();
    //    //    string path = Path.GetFullPath(@"C:\Users\hp\Downloads\UttrakhandElection2022\UtrakhandElection2022\fonts\Mangal400.ttf");
    //    //    BaseFont bf = BaseFont.CreateFont(path, BaseFont.IDENTITY_H, true);

    //    //    iTextSharp.text.pdf.PdfPTable table = new iTextSharp.text.pdf.PdfPTable(EmpGridView.Columns.Count);
    //    //    int[] widths = new int[EmpGridView.Columns.Count];
    //    //    //for (int x = 0; x < EmpGridView.Columns.Count; x++)
    //    //    //{
    //    //    //    widths[x] = (int)EmpGridView.Columns[x].ItemStyle.Width.Value;
    //    //    //    string cellText = Server.HtmlDecode(EmpGridView.HeaderRow.Cells[x].Text);

    //    //    //    //Set Font and Font Color
    //    //    //    iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
    //    //    //    font.Color = new Color(EmpGridView.HeaderStyle.ForeColor);
    //    //    //    iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, font));

    //    //    //    //Set Header Row BackGround Color
    //    //    //    cell.BackgroundColor = new Color(EmpGridView.HeaderStyle.BackColor);


    //    //    //    table.AddCell(cell);
    //    //    //}
    //    //    table.SetWidths(widths);

    //    //    for (int i = 0; i < EmpGridView.Rows.Count; i++)
    //    //    {
    //    //        if (EmpGridView.Rows[i].RowType == DataControlRowType.DataRow)
    //    //        {
    //    //            for (int j = 0; j < EmpGridView.Columns.Count; j++)
    //    //            {
    //    //                string cellText = Server.HtmlDecode(EmpGridView.Rows[i].Cells[j].Text);

    //    //                //Set Font and Font Color
    //    //                iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
    //    //                font.Color = new Color(EmpGridView.RowStyle.ForeColor);
    //    //                iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, font));

    //    //                //Set Color of row
    //    //                if (i % 2 == 0)
    //    //                {
    //    //                    //Set Row BackGround Color
    //    //                    cell.BackgroundColor = new Color(EmpGridView.RowStyle.BackColor);
    //    //                }

    //    //                table.AddCell(cell);
    //    //            }
    //    //        }
    //    //    }

    //    //    //Create the PDF Document
    //    //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
    //    //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
    //    //    pdfDoc.Open();
    //    //    pdfDoc.Add(table);
    //    //    pdfDoc.Close();
    //    //    Response.ContentType = "application/pdf";
    //    //    Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
    //    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //    //    Response.Write(pdfDoc);
    //    //    Response.End();
    //    //}


    public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        //}
    }
}