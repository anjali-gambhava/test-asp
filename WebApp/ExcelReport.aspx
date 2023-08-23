<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ExcelReport.aspx.cs" Inherits="exam.ExcelReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .select:after {
            width: 0.7rem !important;
            height: 0.7rem !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <section class="flex-auto flex-col">
        <div>
            <%-- class="container"--%>
            <div class="col-12 lg:col-12 pb-sm flex-col">
                <div class="bg-white shadow flex-stretch">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                                <%-- p-sm--%>
                                <table class="f-size-xxs">
                                    <tr>
                                        <td class="pr-xs">
                                            <div id='datepicker' class=" pull-right col-md-3 input-group date datepicker border p-thin" style="width: 130px" data-date="" data-link-field="dtp_input2">
                                                <asp:TextBox ID="FromDt" runat="server" CssClass="fromdate form-control" size="16" autocomplete="off" Width="80%"
                                                    value="" />
                                            </div>
                                            <%--<asp:Calendar Id="FromDt" runat="server"></asp:Calendar>--%>
                                        </td>
                                        <td class="d-hidden pr-xs">
                                            <div id='datepicker2' class="d-hidden pull-right col-md-3 input-group date datepicker border p-thin" style="width: 130px" data-date="" data-link-field="dtp_input2">
                                                <asp:TextBox ID="ToDt" runat="server" CssClass="todate form-control" size="16" autocomplete="off" Width="80%"
                                                    value="" />
                                            </div>
                                            <%--<asp:Calendar Id="ToDt" runat="server"></asp:Calendar>--%>
                                        </td>
                                          <td class="pr-xs" style="min-width: 1rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlFromTime" runat="server" Width="150px"
                                                    CssClass="datalist border pr-md pl-xs py-xs">
                                                    <asp:ListItem Text="Select From Time" Value="" />
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
                                        </td>
                                         <td class="pr-xs" style="min-width: 1.5rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlToTime" runat="server" Width="150px"
                                                    CssClass="datalist border pr-md pl-xs py-xs">
                                                    <asp:ListItem Text="Select To Time" Value="" />
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
                                        </td>
                                        <td class="pr-xs" style="min-width: 1.5rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlDistrict" runat="server"
                                                    AutoPostBack="True" Width="130px"
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
                                        <td class="d-hidden pr-xs">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlcamara" runat="server" Width="120px"
                                                    OnSelectedIndexChanged="ddlcamara_SelectedIndexChanged"
                                                    AutoPostBack="True" CssClass="datalist border pr-md pl-xs py-xs">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="d-hidden pr-xs" style="min-width: 1.5rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ShiftDropDown" runat="server"
                                                    AutoPostBack="True" Width="120px"
                                                    OnSelectedIndexChanged="ddlcamara_SelectedIndexChanged"
                                                    CssClass="datalist border pr-md pl-xs py-xs">
                                                    <asp:ListItem Value="" Text="All Shift"></asp:ListItem>
                                                    <asp:ListItem Value="Morning Shift" Text="Morning Shift"></asp:ListItem>
                                                    <asp:ListItem Value="Night Shift" Text="Night Shift"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                          <td class="pr-xs" style="min-width: 1.5rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlislive" runat="server"
                                                    AutoPostBack="True" Width="120px"
                                                    OnSelectedIndexChanged="ddlislive_SelectedIndexChanged"
                                                    CssClass="datalist border pr-md pl-xs py-xs">
                                                     <asp:ListItem Value="-1" Text="Select IsLive" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="YES"></asp:ListItem>
                                                    <asp:ListItem Value="0" Text="NO"></asp:ListItem>
                                                    
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                          <td class="pr-xs" style="min-width: 1.5rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlStatus" runat="server"
                                                    AutoPostBack="True" Width="120px"
                                                    OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" 
                                                    CssClass="datalist border pr-md pl-xs py-xs">
                                                    <asp:ListItem Value="" Text="Select Status" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="STOPPED" Text="STOPPED"></asp:ListItem>
                                                    <asp:ListItem Value="RUNNING" Text="RUNNING"></asp:ListItem>
                                                    
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="btnsearch_Click" />
                                        </td>
                                          <%if (Session["userType"].ToString().ToLower() == "master_admin"  || Session["userType"].ToString().ToLower() == "vmukti_internal")
                                        { %>
                                        <td class="pr-xs d-hidden">
                                            <asp:Button ID="btnExportPDF" runat="server" OnClick="btnExportPDF_Click" Text="PDF Report" CssClass="d-hidden cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                            <%--<asp:Button ID="btnExport" runat="server" Text="PDF Report" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="btnExport_Click" />--%>
                                            <%--<a href="#" onclick="OpenPopupAdd()" class="flex-row p-xs align-center f-size-1xs f-color-secondary no-underline"
                                                style="padding:0px">
                                                <span class="icon mr-xs flex-none f-color-primary" style="top:7px">
                                                    <span class=""><i data-feather="settings"></i></span>
                                                </span>
                                            </a>--%>
                                             <asp:Button ID="btnSetting" runat="server" Text="Setting" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                              OnClientClick="OpenPopupAdd()" OnClick="btnSetting_Click"  />
                                        </td><%} %>
                                    </tr>
                                </table>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlcamara" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="row-fluid">
                        <div id="scrollDiv" class="pd0 f-size-xxs" align="center" style="overflow-y: auto;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="divReport" runat="server">
                                        <div style="overflow-x: auto; width: calc(100vw - 220px);">
                                            <table border="1" id="datatbl" class="table-striped stacked table-zebra w-full text-center capitalize border-t border-default">
                                                <thead>
                                                    <tr>
                                                        <th class="p-thin text-left tdist">District</th>
                                                        <th class="p-thin text-left tacname ">Assembly</th>
                                                         <th class="p-thin text-left tpsno">PS No</th>
                                                        <th class="p-thin text-left tlocation">Location</th>
                                                        <th class="p-thin text-left toperator">Contact No/Operator Name</th>
                                                        <th class="p-thin text-left tdid">Camera Id</th>
                                                        
                                                        <th class="p-thin text-center">Status</th>
                                                        <th class="p-thin text-center">IsLive</th>
                                                        <th class="p-thin text-center">LastSeen</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% if (dsReport.Tables[0].Rows.Count > 0)%>
                                                        <% {%>
                                                          <%  for (int i = 0; i < dsReport.Tables[0].Rows.Count; i++) {%>
                                                    <tr >
                                                    <td class="p-thin text-left tdist"><%=dsReport.Tables[0].Rows[i]["District"].ToString() %></td>
                                                    <td class="p-thin text-left tacname"><%=dsReport.Tables[0].Rows[i]["AssemblyName"].ToString() %></td>
                                                        
                                                    <td class="p-thin text-left tpsno"><%=dsReport.Tables[0].Rows[i]["PSNumber"].ToString() %></td>
                                                         <td class="p-thin text-left tpsno"><%=dsReport.Tables[0].Rows[i]["location"].ToString() %></td>
                                                    <td class="p-thin text-left tlocation"><%=dsReport.Tables[0].Rows[i]["operatorNumber"].ToString()+"/"+dsReport.Tables[0].Rows[i]["operatorName"].ToString() %></td>
                                                    
                                                    <td class="p-thin text-left tdid"><%=dsReport.Tables[0].Rows[i]["Camera"].ToString() %></td>
                                                  <%--  <td class="p-thin text-left tdate"><%=dsReport1.Tables[0].Rows[i]["Dt"].ToString() %></td>--%>
                                                    <td class="p-thin text-center ttotal"><%=dsReport.Tables[0].Rows[i]["Status"].ToString() %></td>
                                                    <td class="p-thin text-center tonline"><%=dsReport.Tables[0].Rows[i]["islive"].ToString() %></td>
                                                    <td class="p-thin text-center toffline"><%=dsReport.Tables[0].Rows[i]["LastSeen"].ToString() %></td>
                                                   <%  }%>
                                                   <% }%>
                                                   <% else{%>
                                                      <%for (int i = 0; i < dsReport.Tables[0].Rows.Count; i++)
                                                          {  
                                                              
                                                              
                                                    %>

                                                    <tr>
                                                         <td class="p-thin text-left tdist"><%=dsReport.Tables[0].Rows[i]["District"].ToString() %></td>
                                                    <td class="p-thin text-left tacname"><%=dsReport.Tables[0].Rows[i]["AssemblyName"].ToString() %></td>
                                                    <td class="p-thin text-left tpsno"><%=dsReport.Tables[0].Rows[i]["PSNumber"].ToString() %></td>
                                                    <td class="p-thin text-left tlocation"><%=dsReport.Tables[0].Rows[i]["operatorNumber"].ToString() %></td>
                                                    <td class="p-thin text-left toperator"><%=dsReport.Tables[0].Rows[i]["operatorName"].ToString() %></td>
                                                    <td class="p-thin text-left tdid"><%=dsReport.Tables[0].Rows[i]["Camera"].ToString() %></td>
                                                    <td class="p-thin text-left tdate"><%=dsReport.Tables[0].Rows[i]["Dt"].ToString() %></td>
                                                    <td class="p-thin text-center ttotal"><%=dsReport.Tables[0].Rows[i]["Status"].ToString() %></td>
                                                    <td class="p-thin text-center tonline"><%=dsReport.Tables[0].Rows[i]["islive"].ToString() %></td>
                                                    <td class="p-thin text-center toffline"><%=dsReport.Tables[0].Rows[i]["LastSeen"].ToString() %></td>
                                                        
                                                    </tr>

                                                     <%  }
                                                         }%>
                                                </tbody>
                                            </table>

                                        </div>



                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlcamara" EventName="SelectedIndexChanged" />
                                    <%--<asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />--%>
                                    <asp:AsyncPostBackTrigger ControlID="btnsearch" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSetting" EventName="Click"/>    
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="modal wow fadeInUp animated" id="PopupRptSetting" tabindex="-1" data-wow-animation-name="fadeInUp"
            style="visibility: visible; animation-name: fadeInUp; -webkit-animation-name: fadeInUp;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="d-inline-block">
                            <asp:Label ID="lblTitle" runat="server" Text="Report Setting" class="modal-title" ClientIDMode="Static"></asp:Label>
                        </div>
                        <div class="d-inline-block text-right f-right pr-sm" style="width: 10%;">
                            <button type="button" onclick="ClosePopupAdd()" class="btnclose close cursor-pointer" id="btncancel" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                        </div>
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
              dateFormat: 'dd/mm/yy',
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
                     // title: 'GUJARAT VIDHAN SABHA ELECTION 2022 - CAMERA STATUS REPORT' + '-' + newdate,
                    //  messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on<%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        //messageBottom: 'This is system generated report, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        //messageBottom: 'This is system genereted report. Printed on 20/02/2022 10:15:18 PM'
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
                        //title: 'GUJARAT VIDHAN SABHA ELECTION 2022 - CAMERA STATUS REPORT' + '-' + newdate,
                        //messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on<%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        //messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on<%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        //messageBottom: 'This is system genereted report. Printed on 20/02/2022 10:15:39 PM'
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
                       // title: 'GUJARAT VIDHAN SABHA ELECTION 2022 - CAMERA STATUS REPORT' + '-' + newdate,
                      //  messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on<%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                //messageBottom: 'This is system genereted report. Printed on 20/02/2022 10:15:18 PM'
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
                       //title: 'GUJARAT VIDHAN SABHA ELECTION 2022 - CAMERA STATUS REPORT' + '-' + newdate,
                     //   messageBottom: 'This is system generated report on ' + $(".fromdate").val() + ', Downloaded on<%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        //messageBottom: 'This is system genereted report. Printed on 20/02/2022 10:15:39 PM'
                        title: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_pdf_title"].ToString()%> - CAMERA STATUS REPORT' + '-' + newdate,
                        messageBottom: '<%=ConfigurationManager.AppSettings["CameraStatusReport_2_pdf_footer"].ToString()%> , Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        , exportOptions: {
                            columns: ':not(.d-hidden)',
                        }
                    }
                ]
            });
});
        function OpenPopupAdd() {
            $j("#PopupRptSetting").show();
        }
        function ClosePopupAdd() {
            $j("#PopupRptSetting").hide();
        }
       <%-- function hideshowcol() {
            var lfckvDist = document.getElementById('<%=chkDist.ClientID%>').checked;
            var lfckvAcName = document.getElementById('<%=chkAcName.ClientID%>').checked;
            var lfckvPSNo = document.getElementById('<%=chkPSNO.ClientID%>').checked;
            var lfckvLocation = document.getElementById('<%=chkLocation.ClientID%>').checked;
            var lfckvoperator = document.getElementById('<%=chkoperator.ClientID%>').checked;
            var lfckvDID = document.getElementById('<%=chkDID.ClientID%>').checked;
            var lfckvDate = document.getElementById('<%=chkDate.ClientID%>').checked;
            if (lfckvDist != true) {
                $j('.tdist').addClass("d-hidden");
            }
            else {
                $j('.tdist').removeClass("d-hidden");
            }
            if (lfckvAcName != true) {
                $j('.tacname').addClass("d-hidden");
            }
            else {
                $j('.tacname').removeClass("d-hidden");
            }
            if (lfckvPSNo != true) {
                $j('.tpsno').addClass("d-hidden");
            }
            else {
                $j('.tpsno').removeClass("d-hidden");
            }
            if (lfckvLocation != true) {
                $j('.tlocation').addClass("d-hidden");
            }
            else {
                $j('.tlocation').removeClass("d-hidden");
            }
            if (lfckvoperator != true) {
                $j('.toperator').addClass("d-hidden");
            }
            else {
                $j('.toperator').removeClass("d-hidden");
            }
            if (lfckvDID != true) {
                $j('.tdid').addClass("d-hidden");
            }
            else {
                $j('.tdid').removeClass("d-hidden");
            }
            if (lfckvDate != true) {
                $j('.tdate').addClass("d-hidden");
            }
            else {
                $j('.tdate').removeClass("d-hidden");
            }
            
        }--%>
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            $j('#datatbl').on('draw.dt', function () {
                //hideshowcol();
            });
            //hideshowcol();
        });
    </script>
</asp:Content>
