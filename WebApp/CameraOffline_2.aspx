<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CameraOffline_2.aspx.cs" Inherits="exam.CameraOffline_2" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .select:after {
            width: 0.7rem !important;
            height: 0.7rem !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3000">
    </asp:ScriptManager>
    <div id="loaderdiv" class="table-responsive" align="center" style="height: calc(100vh - 230px);display:none;position: absolute;margin: -15em auto auto -8em;z-index: 1000;top: 50%;
left: 50%;width:30em;height:18em;">
                                                <asp:Image ID="ImgProgress1" runat="server" ImageUrl="images/loading.gif" ToolTip="loading..."
                                                    Width="20%" /><br />Please wait...
                                            </div>
    <section class="flex-auto flex-col">
        <div>
            <div class="col-12 lg:col-12 pb-sm flex-col">
                <div class="bg-white shadow flex-stretch">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                                <table class="f-size-xxs">
                                    <tr>
                                        <td class="pr-xs">
                                            <div id='datepicker' class=" pull-right col-md-3 input-group date datepicker border p-thin" style="width: 130px" data-date="" data-link-field="dtp_input2">
                                                <asp:TextBox ID="FromDt" runat="server" CssClass="fromdate form-control" size="16" autocomplete="off" Width="80%" Text='' />
                                            </div>
                                        </td>
                                        <td class="pr-xs d-hidden">
                                            <div id='datepicker2' class=" pull-right col-md-3 input-group date datepicker border p-thin" style="width: 130px" data-date="" data-link-field="dtp_input2">
                                                <asp:TextBox ID="ToDt" runat="server" CssClass="todate form-control" size="16" autocomplete="off" Width="80%"
                                                    value="" />
                                            </div>
                                        </td>
                                        <td class="pr-xs" style="min-width: 1.5rem;">
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
                                        <td class="pr-xs d-hidden" style="min-width: 1.5rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlcamara" runat="server"
                                                    AutoPostBack="True" Width="150px"
                                                    OnSelectedIndexChanged="ddlcamara_SelectedIndexChanged"
                                                    CssClass="datalist border pr-md pl-xs py-xs">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs d-hidden" style="min-width: 1.5rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ShiftDropDown" runat="server"
                                                    AutoPostBack="True" Width="150px"
                                                    OnSelectedIndexChanged="ddlcamara_SelectedIndexChanged"
                                                    CssClass="datalist border pr-md pl-xs py-xs">
                                                    <asp:listitem Value="" Text="All Shift"></asp:listitem>
                                                    <asp:listitem Value="Day Shift" Text="Day Shift"></asp:listitem>
                                                    <asp:listitem Value="Night Shift" Text="Night Shift"></asp:listitem>
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="btnsearch_Click" />
                                        </td>
                                        <td>
                                               
                                   <%-- <asp:Button ID="Button1" runat="server" Text="PDF Report" CssClass="btn btn-sm btn-primary"
                                        OnClick="Button1_Click1" />--%>
                              
                                        </td>
                                        <td class="pr-xs">
                                            <asp:Button ID="btnExportPDF" runat="server" OnClick="btnExportPDF_Click" Text="PDF Report" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
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
                            <asp:AsyncPostBackTrigger ControlID="ddlcamara" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ShiftDropDown" EventName="SelectedIndexChanged" />
                                 <%--<asp:PostBackTrigger ControlID="Button1" />--%>
                        </Triggers>
                    </asp:UpdatePanel>
                    </div>
                </div>
                    <div class="row-fluid">
                        <%--<asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                                        DisplayAfter="0">
                                        <ProgressTemplate>
                                            <div id="loaderdiv" class="table-responsive" align="center" style="height: calc(100vh - 230px);">
                                                <asp:Image ID="ImgProgress1" runat="server" ImageUrl="images/loading.gif" ToolTip="loading..."
                                                    Width="20%" />&nbsp;Please wait...
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>--%>
                        <%--<asp:UpdateProgress ID="UpdateProgress2" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                                        DisplayAfter="0">
                                        <ProgressTemplate>
                                            <div id="loaderdiv2" class="pd0" align="center" style="height: calc(100vh - 250px);">
                                                <asp:Image ID="ImgProgress2" runat="server" ImageUrl="images/loading.gif" ToolTip="loading..."
                                                    Width="20%" />&nbsp;Please wait...
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>--%>
                         <%--height: calc(108vh - 205px);--%>
                        <div id="scrollDiv" class="pd0 f-size-xxs" align="center" style="overflow-y: auto;"  runat="server">
                            
                           
                                    
                                        <div class="panel panel-primary">
                        <div class="panel-body table-responsive">

                                        <%--<div id="divReport" runat="server">
                                            <div style="overflow-x:scroll;width:calc(100vw - 220px); ">
                                            <table border="1" id="datatbl"  class="table-striped stacked table-zebra w-full text-center capitalize border-t border-default">
                                                <thead>
                                                <tr>
                                                    <th class="p-thin text-left">District</th>
                                                    <th class="p-thin text-left">Assembly</th>
                                                    <th class="p-thin text-left">Location</th>
                                                    <%--<th class="p-thin text-left">Operator Name / Contact No</th>--%>
                                                   <%-- <th class="p-thin text-left">Camera Id</th>
                                                    <th class="p-thin text-left">Date</th>
                                                    <th class="p-thin text-left">Start Time</th>
                                                    <th class="p-thin text-left">End Time</th>
                                                    <th class="p-thin text-center">Time (Hours:Minutes)</th>
                                                    <th class="p-thin text-left">Remarks</th>--%>
                                               <%-- </tr>
                                                    </thead>
                                                <tbody>--%>
                                               <%--  <%for (int i = 0; i < dsReport.Tables[0].Rows.Count; i++)--%>
                                                
                                               <%-- <tr >
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["District"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["Acname"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["VehicleNo"].ToString() %></td>
<%--                                                    <td class="p-thin text-left"><%=Convert.ToDateTime(dsReport.Tables[0].Rows[i]["ShiftStartTime"]).ToString("hh:mm tt") %></td>
                                                    <td class="p-thin text-left"><%=Convert.ToDateTime(dsReport.Tables[0].Rows[i]["ShiftEndTime"]).ToString("hh:mm tt") %></td>--%>
                                                    <%--<td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["DriverName"].ToString() + " / " + dsReport.Tables[0].Rows[i]["DriverContactNo"].ToString() %></td>--%>
                                                  <%--  <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["streamname"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=Convert.ToDateTime(dsReport.Tables[0].Rows[i]["DayDate"]).ToString("dd/MM/yyyy") %></td>
                                                   <td class="p-thin text-left"><%=Convert.ToDateTime(dsReport.Tables[0].Rows[i]["StartTime"]).ToString("dd/MM/yyyy tt") %></td>
                                                    <td class="p-thin text-left"><%=Convert.ToDateTime(dsReport.Tables[0].Rows[i]["StopTime"]).ToString("dd/MM/yyyy tt") %></td>
                                                    <td  class="p-thin text-center"><%= String.Format(@"{0:hh\:mm}", TimeSpan.FromMinutes(Convert.ToInt32(dsReport.Tables[0].Rows[i]["DiffMin"]))) %></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["Reason"].ToString() %></td>
                                                </tr>--%>
                                                    
                                                <%--<%} %>--%>
                                           <%--         </tbody>
                                            </table>
 
                                       </div>    --%>
                        <%--</div>--%>
                              <asp:GridView ID="EmpGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" EmptyDataText="No Camera Found"  class="table table-bordered table-condensed table-responsive table-hover"  AllowPaging="true" PageSize="10"  PagerStyle-CssClass="page">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No."  ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="District" Visible="true"  ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("District")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assembly" Visible="true"  ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("Acname")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location" Visible="true"  ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("VehicleNo")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Camera Id" Visible="true"  ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("streamname")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date" Visible="true"  ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("DayDate")!= System.DBNull.Value ? Convert.ToDateTime(Eval("DayDate")).ToString("dd/MM/yyyy"): "" %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Start Time" Visible="true"  ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("StartTime")!= System.DBNull.Value ? Convert.ToDateTime(Eval("StartTime")).ToString("dd/MM/yyyy tt"): "" %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="StartTime" Visible="true"  ItemStyle-Width="30px">
                                    <ItemTemplate>

                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("StartTime", "{0:dd/MM/yyyy:hh:mm:ss  tt}")%>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EndTime" Visible="true"  ItemStyle-Width="30px">
                                    <ItemTemplate>

                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("StopTime","{0:dd/MM/yyyy:hh:mm:ss  tt}")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time(Hours:Minutes)" Visible="true"  ItemStyle-Width="30px">
                                    <ItemTemplate>

                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("DiffMin")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              
                               

                              
                            </Columns>
                        </asp:GridView>
                        </div>
                                           
                                 
                              
                            </div>
                       
                    </div>
                </div>
          
    </section>
    <%-- class="container"--%>
    
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
                "bSort" : false,
                dom: 'Bfrtip',
                buttons: [
                    //'copy', 'csv', 'excel', 'pdf', 'print'
                    {
                        extend: 'excelHtml5',
                        orientation: 'landscape',
                        pageSize: 'LEGAL',
                        title: 'Kolhapur By Election 2022 - CAMERA OFFLINE REPORT',
                        messageBottom: 'This is system genereted report. Printed on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        //messageBottom: 'This is system genereted report. Printed on 20/02/2022 10:16:21 PM'
                    },
                     {
                         extend: 'pdfHtml5',
                         orientation: 'landscape',
                         pageSize: 'LEGAL',
                         title: 'Kolhapur By Election 2022 - CAMERA OFFLINE REPORT',
                         messageBottom: 'This is system genereted report. Printed on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                        //messageBottom: 'This is system genereted report. Printed on 20/02/2022 10:16:49 PM'
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
                title: 'Kolhapur By Election 2022 - CAMERA OFFLINE REPORT',
                messageBottom: 'This is system genereted report. Printed on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                //messageBottom: 'This is system genereted report. Printed on 20/02/2022 10:16:21 PM'
                    },
                     {
                         extend: 'pdfHtml5',
                         orientation: 'landscape',
                         pageSize: 'LEGAL',
                         title: 'Kolhapur By Election 2022 - CAMERA OFFLINE REPORT',
                         messageBottom: 'This is system genereted report. Printed on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                         //messageBottom: 'This is system genereted report. Printed on 20/02/2022 10:16:49 PM'
            }
        ]
    });
});</script>
</asp:Content>
