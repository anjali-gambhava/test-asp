<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DownloadRecording.aspx.cs" Inherits="exam.DownloadRecording" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <style>
         .fixheader{
            background-color: #000;
    border-bottom: 0;
    box-shadow: inset 0 1px 0 #dee2e6, inset 0 -1px 0 #dee2e6;
    position: -webkit-sticky;
    position: sticky;
    top: 0;
    z-index: 10; 
    color:#fff;
        }
           .form-group {
    margin-bottom: 0px;
    padding: 4px 4px;
}
        button.dt-button
        {
            padding: 3px 15px;
        }
        .dataTables_wrapper .dataTables_filter input { 
    border-radius: 4px!important;
    padding: 0px!important;
}
        div.dt-buttons { 
    padding: 0px 10px!important;
}
     .ui-datepicker-trigger{
            display:none!important;
        }
        #ui-datepicker-div
        {
            z-index:999!important;
        }
        table.dataTable thead th, table.dataTable thead td {
    padding: 5px 25px!important; 
}
        .p-td{
            padding:5px;
        }
        
        .card-body.p-0 .table tbody>tr>td:last-of-type, .card-body.p-0 .table tbody>tr>th:last-of-type, .card-body.p-0 .table tfoot>tr>td:last-of-type, .card-body.p-0 .table tfoot>tr>th:last-of-type, .card-body.p-0 .table thead>tr>td:last-of-type, .card-body.p-0 .table thead>tr>th:last-of-type {
     padding-right: 0; 
} 
.paging
        {
        }
         
        .paging a
        {
            background-color: #add8e6;
            padding: 5px 7px;
            text-decoration: none;
            border: 1px solid #00C157;
        }
         
        .paging a:hover
        {
            background-color: #add8e6;
            color: #00C157;
            border: 1px solid #00C157;
        }
         
        .paging span
        {
            background-color: #add8e6;
            padding: 5px 7px;
            color: #00C157;
            border: 1px solid #00C157;
        }
         
        tr.paging
        {
            background: none !important;
        }
         
        tr.paging tr
        {
            background: none !important;
        }
        tr.paging td
        {
            border: none;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager> 
     <script src="<%=ResolveUrl("~/js/flv.min.js") %>" type="text/javascript"></script> 
     <div class="content-wrapper">
          <section class="content">
      <div class="container-fluid">
            <div class="row">
          <div class="col-12">
            <div class="card">
                 <div class="card-header row"> 
                     <div class="form-group"> 
                      <div id='datepicker' class="row" data-date="" data-link-field="dtp_input2">
                                                <asp:TextBox ID="FromDt" runat="server" CssClass="form-control fromdate" size="16" autocomplete="off" Width="80%" Text=''/>
                                            </div>
                     </div>
                     <div class="form-group"> 
                         <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" 
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Width="150px">
                                                </asp:DropDownList>
                         </div>
                     <div class="form-group"> 
                     <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" Width="150px">
                                                </asp:DropDownList>
                    </div>
                       
                      <div class="form-group">
                   <asp:TextBox ID="strm_txtBox" runat="server" AutoPostBack="true" CssClass="form-control"
                                                   Width="150px">
                                                </asp:TextBox>
                          </div>
                     <div class="form-group">
                          <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="btn btn-block btn-primary"
                                                OnClick="BtnSearch_Click" />
                         </div>
                    </div>
                <asp:GridView ID="GridView1" CssClass="table table-head-fixed text-nowrap" runat="server" AutoGenerateColumns="false"
                                            OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" AlternatingRowStyle-CssClass="bg-light">
                                                <EmptyDataTemplate>
                                                <div align="center">
                                                    <h4>
                                                        <label class="text-center text-danger">
                                                            No Data Found</label>
                                                    </h4>
                                                </div>
                                            </EmptyDataTemplate>
                                            <Columns>
                                            <asp:TemplateField HeaderText="No" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 + (pageitemcount *(this.PageNumber-1))%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" DataField="district" HeaderText="District" />
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" DataField="acname" HeaderText="Assembly" />
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" DataField="PSNum" HeaderText="PS No" />
                                                <asp:TemplateField HeaderText="Location" ItemStyle-CssClass="p-thin text-left"  HeaderStyle-CssClass="fixheader">
                                                    <ItemTemplate>
                                                        <span title='<%# Eval("location") %>'>
                                                            <%#Eval("location").ToString().Length > 30 ? Eval("location").ToString().PadRight(140).Substring(0, 30).TrimEnd() + "..." : Eval("location")%>
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:TemplateField> 
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" DataField="streamname" HeaderText="camera No" />
                                                 <asp:TemplateField HeaderText="Size" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" Visible="false">
                                                    <ItemTemplate>
                                                            <%#Eval("Size").ToString()%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" DataField="islive" HeaderText="Stream Tested" Visible="false" />
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" DataField="mincount" HeaderText="Up Time (hh:mm)" Visible="false" />
                                                <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" Visible="false">
                                                    <ItemTemplate>
                                                        <%#Eval("status").ToString() == "RUNNING" ? "Online" : Eval("status").ToString() == "STOPPED" ? "Offline" : "" %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="fixheader" ItemStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <a href="#" class="download-icon" onclick='<%# Eval("Link", "streamdownload(\"{0}\"); return false;") %>'>
                                                            <svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512">
                                                                <path d="M336 176h40a40 40 0 0140 40v208a40 40 0 01-40 40H136a40 40 0 01-40-40V216a40 40 0 0140-40h40" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" />
                                                                <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M176 272l80 80 80-80M256 48v288" />
                                                            </svg>
                                                        </a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                 <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
                                    <div class="mrfive">
                                        <div class="page text-center">
                                            <div>
                                                <asp:LinkButton ID="prev" runat="server" Text="«" OnClick="prev_Click" CssClass="btn btn-default btncustom"></asp:LinkButton>
                                                <asp:Repeater ID="rptPages" runat="server" OnItemDataBound="rptPages_ItemDataBound">
                                                    <ItemTemplate>

                                                        <asp:LinkButton ID="btn_page_camera" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>'
                                                            Enabled='<%#Eval("Enabled") %>' OnClick="Page_Changed" CssClass="btn btn-default btncustom" />

                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:LinkButton ID="next" runat="server" Text="»" OnClick="next_Click" CssClass="btn btn-default btncustom" ></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </nav>
                </div>
              </div>
                </div>
          </div>
              </section>
         </div> 
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
                  <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script type="text/javascript">
        var $j = jQuery.noConflict();
        $j(".fromdate, .todate").datepicker({
            dateFormat: 'yy/mm/dd',
            showOn: "both",
            buttonImage: "images/calender.png",
            //buttonImageOnly: true,
            buttonText: "Select date",
            //minDate: "06/06/2022",
            //maxDate: "26/06/2022"
        });
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
            $j("#loaderdiv").show();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            var date = $(".fromdate").val();
            var newdate = date.split("/").join("-");
            $j(".fromdate, .todate").datepicker({
                dateFormat: 'yy/mm/dd',
                showOn: "both",
                buttonImage: "images/calender.png",
                //buttonImageOnly: true,
                buttonText: "Select date",
                //minDate: "06/06/2022",
                //maxDate: "26/06/2022"
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
                        title: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_excel_title"].ToString()%> - CAMERA STATUS REPORT' + '-' + newdate,
                        messageBottom: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_excel_footer"].ToString()%> , Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                      , exportOptions: {
                          columns: ':not(.d-hidden)',
                      }
                  },
                  {
                      extend: 'pdfHtml5',
                      orientation: 'landscape',
                      pageSize: 'LEGAL', 
                        title: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_pdf_title"].ToString()%> - CAMERA STATUS REPORT' + '-' + newdate,
                        messageBottom: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_pdf_footer"].ToString()%> , Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        , exportOptions: {
                            columns: ':not(.d-hidden)',
                        }
                    }
                ]
            });
        });
        function streamdownload(Link) {
            var recDt = $("#FromDt").val();
            var url = Link;
            window.open(url); 
        }
    </script>
    <script>
            $j(document).ready(function () {
                var date = $(".fromdate").val();
                var newdate = date.split("/").join("-");
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
                            title: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_excel_title"].ToString()%> - CAMERA STATUS REPORT' + '-' + newdate,
                        messageBottom: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_excel_footer"].ToString()%> , Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        , exportOptions: {
                            columns: ':not(.d-hidden)',
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        orientation: 'landscape',
                        pageSize: 'LEGAL',
                        title: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_pdf_title"].ToString()%> - CAMERA STATUS REPORT' + '-' + newdate,
                        messageBottom: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_pdf_footer"].ToString()%> , Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        , exportOptions: {
                            columns: ':not(.d-hidden)',
                        }
                    }
                ]
            });
        });

    </script>
</asp:Content>
