<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TrailRunReport.aspx.cs" Inherits="exam.TrailRunReport" %>
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
                                        
                                        <td class="pr-xs" style="min-width: 1.5rem;">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlStatus" runat="server"
                                                    AutoPostBack="True" Width="150px"
                                                    OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"
                                                    CssClass="datalist border pr-md pl-xs py-xs">
                                                    <asp:listitem Value="" Text="All"></asp:listitem>
                                                    <asp:listitem Value="Connected" Text="Connected"></asp:listitem>
                                                    <asp:listitem Value="Not Connected" Text="Not Connected"></asp:listitem>
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="btnsearch_Click" />
                                        </td>
                                       
                                    </tr>
                                </table>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlStatus" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    
                    <div class="row-fluid">
                       
                        <div id="scrollDiv" class="pd0 f-size-xxs" align="center" style="overflow-y: auto;">
                            
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                         
                                        <div id="divReport" runat="server">
                                            <div style="overflow-x:scroll;width:calc(100vw - 220px); ">
                                            <table border="1" id="datatbl"  class="table-striped stacked table-zebra w-full text-center capitalize border-t border-default">
                                                <thead>
                                                <tr>
                                                    <th class="p-thin text-left">District</th>
                                                    <th class="p-thin text-left">Assembly</th>
                                                    <th class="p-thin text-left">Operator Name / Contact No</th>
                                                    <th class="p-thin text-left">PS No</th>
                                                    <th class="p-thin text-left">Location</th>
                                                    <th class="p-thin text-left">Camera No</th>
                                                    <th class="p-thin text-left">Status</th>
                                                </tr>
                                                    </thead>
                                                <tbody>
                                                  <%for (int i = 0; i < dsReport.Tables[0].Rows.Count; i++)
                                                    { 
                                                          %>
                                                <tr>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["District"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=(dsReport.Tables[0].Rows[i]["accode"]).ToString()%></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["operatorName"].ToString()%></td>
                                                 <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["PSNum"].ToString() %></td>
                                                <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["location"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["streamname"].ToString() %></td>
                                                     <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["Trial"].ToString() %></td>
                                                </tr>
                                                <%} %>
                                                    </tbody>
                                            </table>
 
                                       </div>    
                        </div>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                                         <asp:AsyncPostBackTrigger ControlID="ddlStatus" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="btnsearch" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
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
                 "bSort": false,
                 dom: 'Bfrtip',
                 buttons: [
                     //'copy', 'csv', 'excel', 'pdf', 'print'
                     {
                         extend: 'excelHtml5',
                         orientation: 'landscape',
                         pageSize: 'LEGAL',
                         title: 'GUJARAT VIDHAN SABHA ELECTION  - REPORT',
                         messageBottom: 'This is system generated report on 21.06.2022, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                    },
                    {
                        extend: 'pdfHtml5',
                        orientation: 'landscape',
                        pageSize: 'LEGAL',
                        title: 'GUJARAT VIDHAN SABHA ELECTION  - REPORT',
                        messageBottom: 'This is system generated report on 21.06.2022, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
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
                title: 'GUJARAT VIDHAN SABHA ELECTION  - REPORT',
                messageBottom: 'This is system generated report on 21.06.2022, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
                    },
                     {
                         extend: 'pdfHtml5',
                         orientation: 'landscape',
                         pageSize: 'LEGAL',
                         title: 'GUJARAT VIDHAN SABHA ELECTION  - REPORT',
                         messageBottom: 'This is system generated report on 21.06.2022, Downloaded on <%=TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd/MM/yyyy hh:mm:ss tt")%>'
            }
        ]
    });
});</script>
</asp:Content>
