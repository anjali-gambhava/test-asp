<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="cam_alert.aspx.cs" Inherits="exam.cam_alert" %>
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
        .cardarchive{
             overflow:auto;
         }
          .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding: 0px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
        }

        /* Modal Content */
        .modal-content {
            margin: auto;
            padding: 20px;
            /*border: 1px solid #888;*/
            width: 50%;
        }
        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
 .modal
{
    display: none;
    position: absolute;
    top: 50px;
    left: 0px;
    background-color: black;
    z-index: 100;
    opacity: 0.8;
    filter: alpha(opacity=60);
    -moz-opacity: 0.8;
    min-height: 100%;
}
#divImage
{
    display: none;
    z-index: 1000;
    position: fixed;
    top: 70;
    left: 0;
    background-color: White;
    height: 550px;
    width: 600px;
    padding: 3px;
    border: solid 1px black;
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
    <!-- Content Header (Page header) -->
    

    <!-- Main content -->
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
                           <asp:DropDownList ID="ddlFromTime" runat="server" Width="150px"
                                                    CssClass="form-control">
                                                    <asp:ListItem Text="From Time" Value="" />
                                                    <asp:ListItem Text="12:00 AM" Value="00:00:00" />
                                                    <asp:ListItem Text="12:30 AM" Value="00:30:00" />
                                                    <asp:ListItem Text="1:00 AM" Value="01:00:00" />
                                                    <asp:ListItem Text="1:30 AM" Value="01:30:00" />
                                                    <asp:ListItem Text="2:00 AM" Value="02:00:00" />
                                                    <asp:ListItem Text="2:30 AM" Value="02:30:00" />
                                                    <asp:ListItem Text="3:00 AM" Value="03:00:00" />
                                                    <asp:ListItem Text="3:30 AM" Value="03:30:00" />
                                                    <asp:ListItem Text="4:00 AM" Value="04:00:00" />
                                                    <asp:ListItem Text="4:30 AM" Value="04:30:00" />
                                                    <asp:ListItem Text="5:00 AM" Value="05:00:00" />
                                                    <asp:ListItem Text="5:30 AM" Value="05:30:00" />
                                                    <asp:ListItem Text="6:00 AM" Value="06:00:00" />
                                                    <asp:ListItem Text="6:30 AM" Value="06:30:00" />
                                                    <asp:ListItem Text="7:00 AM" Value="07:00:00" />
                                                    <asp:ListItem Text="7:30 AM" Value="07:30:00" />
                                                    <asp:ListItem Text="8:00 AM" Value="08:00:00" />
                                                    <asp:ListItem Text="8:30 AM" Value="08:30:00" />
                                                    <asp:ListItem Text="9:00 AM" Value="09:00:00" />
                                                    <asp:ListItem Text="9:30 AM" Value="09:30:00" />
                                                    <asp:ListItem Text="10:00 AM" Value="10:00:00" />
                                                    <asp:ListItem Text="10:30 AM" Value="10:30:00" />
                                                    <asp:ListItem Text="11:00 AM" Value="11:00:00" />
                                                    <asp:ListItem Text="11:30 AM" Value="11:30:00" />
                                                    <asp:ListItem Text="12:00 PM" Value="12:00:00" />
                                                    <asp:ListItem Text="12:30 PM" Value="12:30:00" />
                                                    <asp:ListItem Text="1:00 PM" Value="13:00:00" />
                                                    <asp:ListItem Text="1:30 PM" Value="13:30:00" />
                                                    <asp:ListItem Text="2:00 PM" Value="14:00:00" />
                                                    <asp:ListItem Text="2:30 PM" Value="14:30:00" />
                                                    <asp:ListItem Text="3:00 PM" Value="15:00:00" />
                                                    <asp:ListItem Text="3:30 PM" Value="15:30:00" />
                                                    <asp:ListItem Text="4:00 PM" Value="16:00:00" />
                                                    <asp:ListItem Text="4:30 PM" Value="16:30:00" />
                                                    <asp:ListItem Text="5:00 PM" Value="17:00:00" />
                                                    <asp:ListItem Text="5:30 PM" Value="17:30:00" />
                                                    <asp:ListItem Text="6:00 PM" Value="18:00:00" />
                                                    <asp:ListItem Text="6:30 PM" Value="18:30:00" />
                                                    <asp:ListItem Text="7:00 PM" Value="19:00:00" />
                                                    <asp:ListItem Text="7:30 PM" Value="19:30:00" />
                                                    <asp:ListItem Text="8:00 PM" Value="20:00:00" />
                                                    <asp:ListItem Text="8:30 PM" Value="20:30:00" />
                                                    <asp:ListItem Text="9:00 PM" Value="21:00:00" />
                                                    <asp:ListItem Text="9:30 PM" Value="21:30:00" />
                                                    <asp:ListItem Text="10:00 PM" Value="22:00:00" />
                                                    <asp:ListItem Text="10:30 PM" Value="22:30:00" />
                                                    <asp:ListItem Text="11:00 PM" Value="23:00:00" />
                                                    <asp:ListItem Text="11:30 PM" Value="23:30:00" />
                                                    <asp:ListItem Text="11:59 PM" Value="23:59:59.999" />
                                                </asp:DropDownList>
                      </div>
                  <div class="form-group">
                           <asp:DropDownList ID="ddlToTime" runat="server" Width="150px"
                                                    CssClass="form-control">
                                                    <asp:ListItem Text="To Time" Value="" />
                                                    <asp:ListItem Text="12:00 AM" Value="00:00:00" />
                                                    <asp:ListItem Text="12:30 AM" Value="00:30:00" />
                                                    <asp:ListItem Text="1:00 AM" Value="01:00:00" />
                                                    <asp:ListItem Text="1:30 AM" Value="01:30:00" />
                                                    <asp:ListItem Text="2:00 AM" Value="02:00:00" />
                                                    <asp:ListItem Text="2:30 AM" Value="02:30:00" />
                                                    <asp:ListItem Text="3:00 AM" Value="03:00:00" />
                                                    <asp:ListItem Text="3:30 AM" Value="03:30:00" />
                                                    <asp:ListItem Text="4:00 AM" Value="04:00:00" />
                                                    <asp:ListItem Text="4:30 AM" Value="04:30:00" />
                                                    <asp:ListItem Text="5:00 AM" Value="05:00:00" />
                                                    <asp:ListItem Text="5:30 AM" Value="05:30:00" />
                                                    <asp:ListItem Text="6:00 AM" Value="06:00:00" />
                                                    <asp:ListItem Text="6:30 AM" Value="06:30:00" />
                                                    <asp:ListItem Text="7:00 AM" Value="07:00:00" />
                                                    <asp:ListItem Text="7:30 AM" Value="07:30:00" />
                                                    <asp:ListItem Text="8:00 AM" Value="08:00:00" />
                                                    <asp:ListItem Text="8:30 AM" Value="08:30:00" />
                                                    <asp:ListItem Text="9:00 AM" Value="09:00:00" />
                                                    <asp:ListItem Text="9:30 AM" Value="09:30:00" />
                                                    <asp:ListItem Text="10:00 AM" Value="10:00:00" />
                                                    <asp:ListItem Text="10:30 AM" Value="10:30:00" />
                                                    <asp:ListItem Text="11:00 AM" Value="11:00:00" />
                                                    <asp:ListItem Text="11:30 AM" Value="11:30:00" />
                                                    <asp:ListItem Text="12:00 PM" Value="12:00:00" />
                                                    <asp:ListItem Text="12:30 PM" Value="12:30:00" />
                                                    <asp:ListItem Text="1:00 PM" Value="13:00:00" />
                                                    <asp:ListItem Text="1:30 PM" Value="13:30:00" />
                                                    <asp:ListItem Text="2:00 PM" Value="14:00:00" />
                                                    <asp:ListItem Text="2:30 PM" Value="14:30:00" />
                                                    <asp:ListItem Text="3:00 PM" Value="15:00:00" />
                                                    <asp:ListItem Text="3:30 PM" Value="15:30:00" />
                                                    <asp:ListItem Text="4:00 PM" Value="16:00:00" />
                                                    <asp:ListItem Text="4:30 PM" Value="16:30:00" />
                                                    <asp:ListItem Text="5:00 PM" Value="17:00:00" />
                                                    <asp:ListItem Text="5:30 PM" Value="17:30:00" />
                                                    <asp:ListItem Text="6:00 PM" Value="18:00:00" />
                                                    <asp:ListItem Text="6:30 PM" Value="18:30:00" />
                                                    <asp:ListItem Text="7:00 PM" Value="19:00:00" />
                                                    <asp:ListItem Text="7:30 PM" Value="19:30:00" />
                                                    <asp:ListItem Text="8:00 PM" Value="20:00:00" />
                                                    <asp:ListItem Text="8:30 PM" Value="20:30:00" />
                                                    <asp:ListItem Text="9:00 PM" Value="21:00:00" />
                                                    <asp:ListItem Text="9:30 PM" Value="21:30:00" />
                                                    <asp:ListItem Text="10:00 PM" Value="22:00:00" />
                                                    <asp:ListItem Text="10:30 PM" Value="22:30:00" />
                                                    <asp:ListItem Text="11:00 PM" Value="23:00:00" />
                                                    <asp:ListItem Text="11:30 PM" Value="23:30:00" />
                                                    <asp:ListItem Text="11:59 PM" Value="23:59:59.999" />
                                                </asp:DropDownList>
                      </div>
                  <div class="form-group">
                                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" 
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Width="150px">
                                                </asp:DropDownList>
                        </div>
                    <div class="form-group">
                  <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" Width="150px" DataValueField="1">
                                                </asp:DropDownList>
                          </div>
                   <div class="form-group">
                    <asp:DropDownList ID="ddltype" runat="server" Width="150px"
                                                    CssClass="form-control" OnSelectedIndexChanged="ddltype_SelectedIndexChanged">
                                                    <asp:ListItem Text="Select Type" Value="" />
                                                    <asp:ListItem Text="FootFall Detection" Value="1" />
                         <asp:ListItem Text="Violation Detection" Value="2" />
                        </asp:DropDownList>
                       </div>
                    <div class="form-group">
                   <asp:TextBox ID="strm_txtBox" runat="server" AutoPostBack="true" CssClass="form-control"
                                                   Width="150px">
                                                </asp:TextBox>
                          </div>
                    <div class="form-group">
                  <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-block btn-primary"
                                                OnClick="btnsearch_Click" />
                          </div> 
                     <div class="form-group">
                     <asp:Button ID="btnExportExcel" runat="server" OnClick="btnExportExcel_Click"   Text="Excel Report" CssClass="btn btn-block btn-primary" />
                         </div>
                     <div class="form-group" style="display:none">
                     <asp:Button ID="btnpdf" runat="server" OnClick="btnpdf_Click" Text="PDF" CssClass="btn btn-block btn-primary" />
                         </div>
                 
              </div>
                    
              <!-- /.card-header -->
            
               <%-- <table class="table table-head-fixed text-nowrap">
                 
                </table>--%>
                   <%--<div class="panel-body"> --%>
                                 <%--<table id="myTable">--%>
                                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-head-fixed text-nowrap"
                                            OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" 
                                                 AlternatingRowStyle-CssClass="bg-light" AllowPaging="true" 
                                                 OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100" 
                                                 PagerStyle-CssClass="paging">
                                             <EmptyDataTemplate>
                                                <div align="center">
                                                    <h4>
                                                        <label class="text-center text-danger">
                                                            No Data Found</label>
                                                    </h4>
                                                </div>
                                            </EmptyDataTemplate>
                                            <Columns>
                                                
                                                <asp:BoundField DataField="district" HeaderText="District" HeaderStyle-CssClass="fixheader" />
                                                <asp:BoundField DataField="acname" HeaderText="Assembly" HeaderStyle-CssClass="fixheader" />

                                                <asp:BoundField DataField="PSNum" HeaderText="PS No" HeaderStyle-CssClass="fixheader" />
                                                <asp:TemplateField HeaderText="Location" HeaderStyle-CssClass="fixheader">
                                                    <ItemTemplate>
                                                        <span title='<%# Eval("location") %>'>
                                                            <%#Eval("location").ToString().Length > 30 ? Eval("location").ToString().PadRight(140).Substring(0, 30).TrimEnd() + "..." : Eval("location")%>
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="cameradid" HeaderText="Camera ID" HeaderStyle-CssClass="fixheader" />
                                                 <asp:BoundField DataField="ImgCount" HeaderText="Count" HeaderStyle-CssClass="fixheader" />
                                                 <asp:BoundField DataField="sendtime" HeaderText="Detection Time" HeaderStyle-CssClass="fixheader" />
                                                <asp:TemplateField HeaderStyle-CssClass="fixheader" HeaderText="Detection Image">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#Eval("imgurl")%>'
                                                            Height="100px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  </Columns>
                                        </asp:GridView>  
                          <%--  </table>--%>
                 <button id="exportButton">Export to Excel</button>
                               <%-- </div> --%>
            </div>

            <!-- /.card -->
          </div>
        </div> 
      </div><!-- /.container-fluid -->
    </section> 
    

    <!-- /.content -->
  </div>
                        
           <div id="divBackground" class="modal">
</div>
<div id="divImage" >
<table style="height: 100%; width: 100%">
    <tr>
        <td valign="middle" align="center">
            <img id="imgLoader" alt="" src="images/loader.gif" />
            <img id="imgFull" alt="" src="" style="display: none; height: 500px; width: 590px" />
        </td>
    </tr>
    <tr>
        <td align="center" valign="bottom">
            <input id="btnClose" class="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" type="button" value="close" onclick="HideDiv()" />
        </td>
    </tr>
</table>
</div>
  <!-- /.content-wrapper -->
       
    <script type="text/javascript" >   
        var $j = jQuery.noConflict();
        function OpenPopupAdd() {
            $j("#myModal").show();
        }
        function ClosePopupAdd() {
            $j("#myModal").hide();
        }
        function loadplayer(streamname, servername, flag, bkupstreamid) {
            if (flvjs.isSupported()) {
                var videoElement = document.getElementById('videoElement');
                var videoContainer = videoElement.parentElement;
                var logoImg = document.createElement('img');
                logoImg.src = 'images/Player-Logo1.png';
                logoImg.style.position = 'absolute';
                logoImg.style.bottom = '100px';
                logoImg.style.right = '30px';
                logoImg.style.width = '20%';
                videoContainer.appendChild(logoImg);
                var flvurl = 'wss://' + servername + '/live-record/' + streamname + '.flv';
                var flvPlayer = flvjs.createPlayer({
                    type: 'flv',
                    url: flvurl
                });
                flvPlayer.attachMediaElement(videoElement);
                flvPlayer.load();
                flvPlayer.play();
                var zoomLevel = 1;
                videoElement.addEventListener('wheel', function (event) {
                    if (event.deltaY < 0) {
                        zoomLevel += 0.1;
                    } else if (event.deltaY > 0) {
                        if (zoomLevel != 1)
                            zoomLevel -= 0.1;
                    }
                    videoElement.style.transform = 'scale(' + zoomLevel + ')';
                });

            }
        }
        function LoadDiv(url) {
            var img = new Image();
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            var imgLoader = document.getElementById("imgLoader");
            imgLoader.style.display = "block";
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
                imgLoader.style.display = "none";
            };
            img.src = url;
            var width = document.body.clientWidth;
            if (document.body.clientHeight > document.body.scrollHeight) {
                bcgDiv.style.height = document.body.clientHeight + "px";
            }
            else {
                bcgDiv.style.height = document.body.scrollHeight + "px";
            }
            imgDiv.style.left = (width - 650) / 2 + "px";
            imgDiv.style.top = "70px";
            bcgDiv.style.width = "100%";

            bcgDiv.style.display = "block";
            imgDiv.style.display = "block";
            return false;
        }
        function HideDiv() {
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            if (bcgDiv != null) {
                bcgDiv.style.display = "none";
                imgDiv.style.display = "none";
                imgFull.style.display = "none";
            }
        }
    </script>
            <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
                  <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
                
    <script>
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
       <script type="text/javascript"> 
           $('#viewmenu').addClass('active');
           $('#listviewmenu').addClass('active'); 
       </script> 
      <script type="text/javascript">
          $(document).ready(function () {
              $('#exportButton').click(function () {
                  exportToExcel();
              });
          });

          function exportToExcel() {
              var table = document.getElementById("ContentPlaceHolder1_GridView1");

              // Hide pagination controls
              var pager = table.getElementsByClassName("paging")[0];
              if (pager) {
                  pager.style.display = "none";
              }

              // Set the height and width of all table cells
              var cells = table.getElementsByTagName("td");
              for (var i = 0; i < cells.length; i++) {
                  cells[i].style.height = "100px";
                  cells[i].style.width = "100px";
              }
              var clonedTable = table.cloneNode(true);

              // Remove the pager row from the cloned table
              var clonedPager = clonedTable.getElementsByClassName("paging")[0];
              if (clonedPager) {
                  clonedPager.parentNode.removeChild(clonedPager);
              }

              // Get the HTML of the cloned table
              var html = clonedTable.outerHTML;
              var html = table.outerHTML;

              // Replace the ASP.NET ImageButton control with an <img> tag
              html = html.replace(/<input[^>]*?type="image"[^>]*>/gi, function (match) {
                  var src = /src="([^"]*)"/i.exec(match);
                  return '<img src="' + src[1] + '" height="80" width="100">';
              });

              var uri = 'data:application/vnd.ms-excel;base64,';
              var base64 = function (s) {
                  return window.btoa(unescape(encodeURIComponent(s)));
              };

              var link = document.createElement('a');
              link.href = uri + base64(html);
              link.download = 'GridViewData.xls';
              link.click();
          }
      </script>
</asp:Content>
