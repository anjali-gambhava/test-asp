<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CameraConnectedOnceReport.aspx.cs" Inherits="exam.CameraConnectedOnceReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .select:after {
            width: 0.7rem !important;
            height: 0.7rem !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="loaderdiv" class="table-responsive" align="center" style="height: calc(100vh - 230px);display:none;position: absolute;margin: -15em auto auto -8em;z-index: 1000;top: 50%;
left: 50%;width:30em;height:18em;">
                                                <asp:Image ID="ImgProgress1" runat="server" ImageUrl="images/loading.gif" ToolTip="loading..."
                                                    Width="20%" /><br />Please wait...
                                            </div>
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
                                        <%--<td class="pr-xs">
                                            <div id='datepicker' class=" pull-right col-md-3 input-group date datepicker border p-thin" style="width:130px" data-date="" data-link-field="dtp_input2">
                                                <asp:TextBox ID="FromDt" runat="server" CssClass="fromdate form-control" size="16" autocomplete="off" Width="80%"
                                                    value="" />
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <div id='datepicker2' class=" pull-right col-md-3 input-group date datepicker border p-thin" style="width:130px" data-date="" data-link-field="dtp_input2">
                                                <asp:TextBox ID="ToDt" runat="server" CssClass="todate form-control" size="16" autocomplete="off" Width="80%"
                                                    value="" />
                                            </div>
                                        </td>--%>
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
                                        <td class="pr-xs d-hidden">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlcamara" runat="server" Width="150px"
                                                    OnSelectedIndexChanged="ddlcamara_SelectedIndexChanged"
                                                    AutoPostBack="True" CssClass="datalist border pr-md pl-xs py-xs">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="btnsearch_Click" />
                                        </td>
                                        <td class="pr-xs">
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
                            <asp:AsyncPostBackTrigger ControlID="ddlcamara" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="row-fluid">
                        <div id="scrollDiv" class="pd0 f-size-xxs" align="center" style="overflow-y: auto;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="divReport" runat="server">
                                         <div style="overflow-x:auto;width:calc(100vw - 220px); ">
                                             <%--<table border="1" id="datatbl"  class="table-striped stacked table-zebra w-full text-center capitalize border-t border-default">
                                                 <thead>
                                                    <tr>
                                                        <th class="p-thin text-left" title="No">No</th>
                                                        <th class="p-thin text-left" title="District">District</th>
                                                        <th class="p-thin text-left" title="Assembly">Assembly</th>
                                                        <th class="p-thin text-left" title="Operator Info">Operator Info</th>
                                                        <th class="p-thin text-left" title="PS No">PS No</th>
                                                        <th class="p-thin text-left" title="Location">Location</th>
                                                        <th class="p-thin text-left" title="camera No">camera No</th>
                                                        <th class="p-thin text-left" title="Status">Status</th>
                                                    </tr>
                                                </thead>
                                                 <tbody>

                                                     
                                                     
                                                     <% foreach (System.Data.DataRow row in dsReport.Tables[0].Rows)
                                                         {
                                                             %>
                                                            <tr>
		                                                        <td class="p-thin text-left">1</td>
		                                                        <td class="p-thin text-left"><%= row["district"].ToString() %></td>
		                                                        <td class="p-thin text-left"></td>
		                                                        <td class="p-thin text-left"></td>
		                                                        <td class="p-thin text-left"></td>
		                                                        <td class="p-thin text-left"><%= row["location"].ToString().Length > 30 ? row["location"].ToString().PadRight(140).Substring(0, 30).TrimEnd() + "..." : row["location"].ToString() %></td>
		                                                        <td class="p-thin text-left"><%= row["streamname"].ToString() %></td>
		                                                        <td class="p-thin text-left"><%= Convert.ToBoolean(row["isLive"].ToString()) ? "Yes" : "No" %></td>
                                                            <tr>
                                                    <%} %>
                                                 </tbody>
                                             </table>--%>
                        <asp:GridView ID="gridview1" ClientIDMode="Static" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default f-size-1xs" runat="server" AutoGenerateColumns="false"
                                            AlternatingRowStyle-CssClass="bg-light" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="100" PagerStyle-CssClass="GridPager page">
                                            <EmptyDataTemplate>
                                                <div align="center">
                                                    <h4>
                                                        <label class="text-center text-danger">
                                                            No Data Found</label>
                                                    </h4>
                                                </div>
                                            </EmptyDataTemplate>
                                            <Columns>
                                            <asp:TemplateField HeaderText="No" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="district" HeaderText="District" />
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="acname" HeaderText="Assembly" />
                                                <asp:TemplateField HeaderText="Operator Info" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                            <%#Eval("operatorName").ToString() + " / " + Eval("operatorNumber")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="PSNum" HeaderText="PS No" />
                                                <asp:TemplateField HeaderText="Location" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                        <span title='<%# Eval("location") %>'>
                                                            <%#Eval("location").ToString().Length > 30 ? Eval("location").ToString().PadRight(140).Substring(0, 30).TrimEnd() + "..." : Eval("location")%>
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="streamname" HeaderText="camera No" />

                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="islive" HeaderText="Stream Tested" Visible="false" />
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="mincount" HeaderText="Up Time (hh:mm)" Visible="false" />
                                                <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                        <%#Convert.ToBoolean(Eval("Trial1")) ? "Yes" : "No" %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                            <%--<table border="1" id="datatbl"  class="table-striped stacked table-zebra w-full text-center capitalize border-t border-default">
                                                <thead>
                                                <tr>
                                                    <th class="p-thin text-left">District</th>
                                                    <th class="p-thin text-left">Assembly</th>
                                                    <th class="p-thin text-left">Location</th>
                                                    <th class="p-thin text-left">Operator Name / Contact No</th>
                                                    <th class="p-thin text-left">Camera No</th>
                                                    <th class="p-thin text-left">Date</th>
                                                    <th class="p-thin text-center">Connected</th>
                                                </tr>
                                                    </thead>
                                                <tbody>
                                                 <%for (int i = 0; i < dsReport.Tables[0].Rows.Count; i++)
                                                     {   
                                                         %>
                                               
                                                <tr >
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["District"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["Acname"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["location"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["operatorName"].ToString() + " / " + dsReport.Tables[0].Rows[i]["operatorNumber"].ToString() %></td>
                                                    <td class="p-thin text-left"><%=dsReport.Tables[0].Rows[i]["streamname"].ToString() %></td>
                                                    <td class="p-thin text-left"><%= dsReport.Tables[0].Rows[i]["Dt"] != System.DBNull.Value ? Convert.ToDateTime(dsReport.Tables[0].Rows[i]["Dt"]).ToString("dd/MM/yyyy") : "" %></td>
                                                    <td class="p-thin text-left"><%=Convert.ToBoolean(dsReport.Tables[0].Rows[i]["isLive"]) ? "Yes" : "No" %></td>
                                                </tr>
                                                    
                                                <%} %>
                                                    </tbody>
                                            </table>--%>
 
                                       </div> 


                                   
                                  </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlcamara" EventName="SelectedIndexChanged" />
                                    <%--<asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging" />--%>
                                    <asp:AsyncPostBackTrigger ControlID="btnsearch" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
    <script>
       var $j = jQuery.noConflict();
        //$j(".fromdate, .todate").datepicker({
        //    dateFormat: 'dd/mm/yy',
        //    showOn: "both",
        //    buttonImage: "images/calender.png",
        //    //buttonImageOnly: true,
        //    buttonText: "Select date"
        //});

        //Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
        //    $j("#loaderdiv").show();
        //});
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            //$j("#loaderdiv").hide();
            //$j(".fromdate, .todate").datepicker({
            //    dateFormat: 'dd/mm/yy',
            //    showOn: "both",
            //    buttonImage: "images/calender.png",
            //    //buttonImageOnly: true,
            //    buttonText: "Select date"
            //});
            $j('#datatbl').DataTable().destroy();
            $j('#datatbl').DataTable({
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "pageLength": 10,
                "bSort" : false,
                dom: 'Bfrtip',
                buttons: [
                    //'copy', 'csv', 'excel', 'pdf', 'print'
                    'excel',
                     {
                         extend: 'pdfHtml5',
                         orientation: 'landscape',
                         pageSize: 'LEGAL'
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
            'excel',
              {
                  extend: 'pdfHtml5',
                  orientation: 'landscape',
                  pageSize: 'LEGAL'
              }
        ]
    });
});</script>
</asp:Content>
