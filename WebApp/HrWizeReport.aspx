<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HrWizeReport.aspx.cs" Inherits="exam.HrWizeReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="loaderdiv" class="table-responsive" align="center" style="height: calc(100vh - 230px); display: none; position: absolute; margin: -15em auto auto -8em; z-index: 1000; top: 50%; left: 50%; width: 30em; height: 18em;">
        <asp:Image ID="ImgProgress1" runat="server" ImageUrl="images/loading.gif" ToolTip="loading..."
            Width="20%" /><br />
        Please wait...
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <section class="flex-auto flex-col">
        <div>
            <div class="bg-white shadow flex-stretch">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                            <table class="f-size-xxs">
                                <tr>
                                    <td class="pr-xs">
                                        <div id='datepicker' class=" pull-right col-md-3 input-group date datepicker border p-thin" style="width: 130px" data-date="" data-link-field="dtp_input2">
                                            <asp:TextBox ID="FromDt" runat="server" CssClass="fromdate form-control" size="16" autocomplete="off" Width="80%"
                                                value="" />
                                        </div>
                                    </td>
                                    <td class="pr-xs" style="min-width: 1.5rem;">
                                        <div class="select">
                                            <asp:DropDownList ID="ddlDistrict" runat="server"
                                                AutoPostBack="True" Width="150px"
                                                OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" CssClass="datalist border pr-md pl-xs py-xs">
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="pr-xs">
                                        <div class="select">
                                            <asp:DropDownList ID="ddlAssembly" runat="server"
                                                AutoPostBack="True" Width="150px"
                                                OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" CssClass="datalist border pr-md pl-xs py-xs">
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="pr-xs">
                                        <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                            OnClick="btnsearch_Click" />
                                    </td>
                                    <td class="d-hidden pr-xs">
                                        <asp:Button ID="btnExportPDF" runat="server" OnClick="btnExportPDF_Click" Text="PDF Report" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                        <asp:Button ID="btnExportExcel" runat="server" OnClick="btnExportExcel_Click" Text="Excel Report" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                        <%--<asp:Button ID="btnExport" runat="server" Text="PDF Report" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="btnExport_Click" />--%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="row-fluid">
                    <div id="scrollDiv" class="pd0 f-size-xxs" align="center" style="overflow-y: auto;">
                        <asp:UpdatePanel ID="hourWise" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div id="divReport" runat="server">
                                    <div style="overflow-x: auto; width: calc(100vw - 220px);">
                                        <table border="1" id="datatbl"  class="table-striped stacked table-zebra w-full text-center capitalize border-t border-default">
                                            <thead>
                                                <tr>
                                                    <th class="p-thin text-left">SR.No</th>
                                                    <th class="p-thin text-left">streamname</th>
                                                    <th class="p-thin text-left">district</th>
                                                    <th class="p-thin text-left">assembly</th>
                                                      <th class="p-thin text-left">PSNo</th>
                                                    <th class="p-thin text-left">location</th>
                                                    <%--<th class="p-thin text-left">Oprator NO</th>
                                                    <th class="p-thin text-left">Oprator Number</th>--%>
                                                    <th class="p-thin text-left">00:00 - 00:01</th>
                                                    <th class="p-thin text-left">00:01 - 00:02</th>
                                                    <th class="p-thin text-left">00:02 - 00:03</th>
                                                    <th class="p-thin text-left">00:03 - 00:04</th>
                                                    <th class="p-thin text-left">00:04 - 00:05</th>
                                                    <th class="p-thin text-left">00:05 - 00:06</th>
                                                    <th class="p-thin text-left">00:06 - 00:07</th>
                                                    <th class="p-thin text-left">00:07 - 00:08</th>
                                                    <th class="p-thin text-left">00:08 - 00:09</th>
                                                    <th class="p-thin text-left">00:09 - 00:10</th>
                                                    <th class="p-thin text-left">00:10 - 00:11</th>
                                                    <th class="p-thin text-left">00:11 - 00:12</th>
                                                    <th class="p-thin text-left">00:12 - 00:13</th>
                                                    <th class="p-thin text-left">00:13 - 00:14</th>
                                                    <th class="p-thin text-left">00:14 - 00:15</th>
                                                    <th class="p-thin text-left">00:15 - 00:16</th>
                                                    <th class="p-thin text-left">00:16 - 00:17</th>
                                                    <th class="p-thin text-left">00:17 - 00:18</th>
                                                    <th class="p-thin text-left">00:18 - 00:19</th>
                                                    <th class="p-thin text-left">00:19 - 00:20</th>
                                                    <th class="p-thin text-left">00:20 - 00:21</th>
                                                    <th class="p-thin text-left">00:22 - 00:22</th>
                                                    <th class="p-thin text-left">00:22 - 00:23</th>
                                                    <th class="p-thin text-left">00:23 - 00:24</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                           <%--    if (dsReport.Tables[0].Rows.Count == 0)
          
                        <div align="center">
                                        <h4>
                                            <label class="text-center text-danger">
                                                No Data Found</label>
                                        </h4>
                                    </div>--%>
<%--       }--%>


                                                        
                                                <%  var i = 0;
                                                    
                                                    foreach (System.Data.DataRow row in dsReport.Tables[0].Rows)
                                                    {
                                                        i++;
                                                   %>
                                                    <tr>
		                                                <td class="p-thin text-left"> <%= i %></td>
                                                         <td class="p-thin text-left"> <%= row["streamname"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["district"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["acname"] %> </td>
                                                         <td class="p-thin text-left"> <%= row["PSNum"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["location"] %> </td>
		                                               <%-- <td class="p-thin text-left"> <%= row["operatorName"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["operatorNumber"] %> </td>--%>
		                                                <td class="p-thin text-left"> <%= row["T_0"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_1"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_2"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_3"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_4"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_5"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_6"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_7"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_8"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_9"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_10"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_11"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_12"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_13"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_14"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_15"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_16"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_17"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_18"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_19"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_20"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_21"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_22"] %> </td>
		                                                <td class="p-thin text-left"> <%= row["T_23"] %> </td>
                                                    </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </ContentTemplate>
                             <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                                </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        var $j = jQuery.noConflict();
        $j(".fromdate, .todate").datepicker({
            dateFormat: 'dd/mm/yy',
            showOn: "both",
            buttonImage: "images/calender.png",
            //buttonImageOnly: true,
            buttonText: "Select date"
        });

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
            $j("#loaderdiv").show();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            $j("#loaderdiv").hide();
            $j(".fromdate, .todate").datepicker({
                dateFormat: 'dd/mm/yy',
                showOn: "both",
                buttonImage: "images/calender.png",
                //buttonImageOnly: true,
                buttonText: "Select date"
            });
            $j('#datatbl').DataTable().destroy();
            $j('#datatbl').DataTable({
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "pageLength": 10,
                "bSort": false,
                dom: 'Bfrtip',
                buttons: [
                    //'copy', 'csv', 'excel', 'pdf', 'print'
                    {
                        extend: 'excelHtml5',
                        orientation: 'landscape',
                        pageSize: 'LEGAL',
                       // title: 'GUJARAT VIDHAN SABHA ELECTION 2022 - CAMERA HOUR WISE REPORT',
                      //  messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        title: '<%=ConfigurationManager.AppSettings["HrWizeReport_excel_title"].ToString()%> - CAMERA HOUR WISE REPORT',
                        messageBottom: '<%=ConfigurationManager.AppSettings["HrWizeReport_excel_footer"].ToString()%>, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                    },
                     {
                         extend: 'pdfHtml5',
                         orientation: 'landscape',
                         pageSize: 'LEGAL',
                        // title: 'GUJARAT VIDHAN SABHA ELECTION 2022 - CAMERA HOUR WISE REPORT',
                       //  messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                         title: '<%=ConfigurationManager.AppSettings["HrWizeReport_pdf_title"].ToString()%> - CAMERA HOUR WISE REPORT',
                         messageBottom: '<%=ConfigurationManager.AppSettings["HrWizeReport_pdf_footer"].ToString()%>, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                     }
                ]
            });
        });
    </script>
    <script>$j(document).ready(function () {
            $j('#datatbl').DataTable({
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "pageLength": 10,
                "bSort": false,
                dom: 'Bfrtip',
                buttons: [
                    //'copy', 'csv', 'excel', 'pdf', 'print'
                    {
                        extend: 'excelHtml5',
                        orientation: 'landscape',
                        pageSize: 'LEGAL',
                      //  title: 'GUJARAT VIDHAN SABHA ELECTION 2022 - CAMERA HOUR WISE REPORT',
                      //  messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        title: '<%=ConfigurationManager.AppSettings["HrWizeReport_excel_title"].ToString()%> - CAMERA HOUR WISE REPORT',
                        messageBottom: '<%=ConfigurationManager.AppSettings["HrWizeReport_excel_footer"].ToString()%>, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                    },
                     {
                         extend: 'pdfHtml5',
                         orientation: 'landscape',
                         pageSize: 'LEGAL',
                       //  title: 'GUJARAT VIDHAN SABHA ELECTION 2022 - CAMERA HOUR WISE REPORT',
                       //  messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                         title: '<%=ConfigurationManager.AppSettings["HrWizeReport_pdf_title"].ToString()%> - CAMERA HOUR WISE REPORT',
                         messageBottom: '<%=ConfigurationManager.AppSettings["HrWizeReport_pdf_footer"].ToString()%>, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                    }
                ]
            });
        });</script>
</asp:Content>