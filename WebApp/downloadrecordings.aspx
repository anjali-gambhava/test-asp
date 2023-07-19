<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="downloadrecordings.aspx.cs" Inherits="exam.downloadrecordings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @font-face {
          font-family: 'Kruti Dev 010';
          src: url(fonts/K010.TTF);
        }

        .select:after {
            width: 0.7rem !important;
            height: 0.7rem !important;
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
        .download {
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <div class="bg-white">
        &nbsp;Center List - Listwise View</div>--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <section class="flex-auto flex-col">
        <div>
            <%-- class="container"--%>
            <div class="col-12 lg:col-12 pb-sm flex-col">
                <div class="bg-white shadow flex-stretch">
                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                                <%-- p-sm--%>
                                <table class="f-size-xxs">
                                    <tr>
                                        <td class="pr-xs">
                                            <div class="select">
                                                <%-- <asp:Literal ID="Literal4" runat="server" Text="<%$appSettings:district%>" />--%>
                                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="datalist border pr-md pl-xs py-xs"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Width="150px">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <div class="select">
                                                <%--   <label><asp:Literal ID="Literal1" runat="server" Text="<%$appSettings:pcname%>" /></label>--%>
                                                <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="datalist border pr-md pl-xs py-xs"
                                                    OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" Width="150px">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <div class="select d-hidden">
                                                 <label> <asp:Literal ID="Literal2" runat="server" Text="<%$appSettings:assemblyname%>" /></label>
                                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="datalist border pr-md pl-xs py-xs"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" class="d-hidden">
                                                    <asp:ListItem Text="Select Status" Value="" Selected="True" Width="100px" />
                                                    <asp:ListItem Text="Online" Value="RUNNING" />
                                                    <asp:ListItem Text="Offline" Value="STOPPED" />
                                                    <asp:ListItem Text="Both" Value="BOTH" />
                                                </asp:DropDownList>
                                                 
                                            </div>
                          
                                            <div class="select d-hidden">
                                                <%-- <label> <asp:Literal ID="Literal2" runat="server" Text="<%$appSettings:assemblyname%>" /></label>--%>
                                                <asp:DropDownList ID="ddlbooth" runat="server" CssClass="datalist border pr-md pl-xs py-xs"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlbooth_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <div id='datepicker' class=" pull-right col-md-3 input-group date datepicker border p-thin" style="width:130px" data-date="" data-link-field="dtp_input2">
                                                <asp:TextBox ID="FromDt" runat="server" ClientIDMode="Static" CssClass="fromdate form-control" size="16" autocomplete="off" Width="80%"
                                                     />
                                            </div>
                                            <%--<asp:Calendar Id="FromDt" runat="server"></asp:Calendar>--%>

                                        </td>
                                        <td class="pr-xs">
                                            <asp:TextBox ID="strm_txtBox" runat="server" AutoPostBack="true" CssClass="datalist border pr-md pl-xs py-xs"
                                                   Width="150px">
                                                </asp:TextBox>
                                        </td>
                                        <td class="pr-xs" style="display: none">
                                            <%--<label>  Location</label>--%>
                                            <input type="text" id="txtSearch" runat="server" placeholder="Enter Vehicle No" class="border p-xs txtSearch" />
                                        </td>
                                        <td class="pr-xs" style="display: none">
                                            <%-- <label> Block/PS</label>--%>
                                            <input type="text" id="txtSearch2" runat="server" placeholder="Enter AC/PS No" class="border p-xs txtSearch2" />
                                        </td>
                                        <td class="pr-xs" >
                                           <%-- <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="btnsearch_Click" />--%>
                                              <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="BtnSearch_Click" />
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
                    <div class="panel panel-primary">
                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="30000" Enabled="true">
                        </asp:Timer>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <div class="panel panel-primary hide">
                                    <div class="panel-heading navbar-inverse">
                                        <%--   Live Counter :--%>
                                        <%--<asp:Label ID="lblonlinecounter" runat="server"></asp:Label>
                                    <div style="float: right">
                                        <asp:Label ID="lbltotalonline" runat="server"></asp:Label>
                                    </div>--%>
                                        <div id="divonlinecounter" runat="server" class="flex-row flex-wrap -mr-sm d-hidden">
                                            <div class="col-12 md:col-20 pr-sm pb-sm flex-col">
                                                <div class="flex-stretch p-xs bg-primary f-color-white f-size-sm md:f-size-sm flex-col justify-center text-center shadow-md-primary capitalize">
                                                    <h2 class="f-size-md md:f-size-md"><a id="totalbooth" href="javascript:void(0);" tabindex="0" runat="server"
                                                        class='f-color-white no-underline'></a></h2>
                                                    <p>
                                                        <asp:Literal runat="server" Text="<%$appSettings:InstalledCameraName%>" /></p>
                                                </div>
                                            </div>
                                            <div class="col-12 md:col-20 pr-sm pb-sm flex-col">
                                                <div class="flex-stretch p-xs bg-success f-color-white f-size-sm md:f-size-sm flex-col justify-center text-center shadow-md-success capitalize">
                                                    <h2 class="f-size-md md:f-size-md"><a id="runningbooth" href="javascript:void(0);" tabindex="0" runat="server"
                                                        class='f-color-white no-underline'></a></h2>
                                                    <p>
                                                        <asp:Literal runat="server" Text="<%$appSettings:OnlineCameraName%>" /></p>
                                                </div>
                                            </div>
                                            <div class="col-12 md:col-20 pr-sm pb-sm flex-col">
                                                <div class="flex-stretch p-xs bg-warning f-color-white f-size-sm md:f-size-sm flex-col justify-center text-center shadow-md-warning capitalize">
                                                    <h2 class="f-size-md md:f-size-md"><a id="stopbooth" href="javascript:void(0);" tabindex="0" runat="server"
                                                        class='f-color-white no-underline'></a></h2>
                                                    <p>
                                                        <asp:Literal runat="server" Text="<%$appSettings:OfflineCameraName%>" /></p>
                                                </div>
                                            </div>
                                            <%--<%if (useridentifer == "5")
                                              {%>--%>
                                            <%--<div class="col-12 md:col-20 pr-sm pb-sm flex-col">
                                            <div class="flex-stretch p-xs bg-secondary f-color-white f-size-sm md:f-size-sm flex-col justify-center text-center shadow-md capitalize">
                                                <h2 class="f-size-md md:f-size-md"><a id="Connectedonce" href="javascript:void(0);" tabindex="0" runat="server"
                                                    class='f-color-white no-underline'></a></h2>
                                                <p><asp:Literal runat="server" Text="<%$appSettings:ConnectedOnceCameraName%>" /></p>
                                            </div>
                                        </div>
                                        <div class="col-12 md:col-20 pr-sm pb-sm flex-col">
                                            <div class="flex-stretch p-xs bg-primary-light f-color-white f-size-sm md:f-size-sm flex-col justify-center text-center shadow-md-primary capitalize">
                                                <h2 class="f-size-md md:f-size-md"><a id="runningboothlast" href="javascript:void(0);" tabindex="0" runat="server"
                                                    class='f-color-white no-underline'></a></h2>
                                                <p><asp:Literal runat="server" Text="<%$appSettings:LastOneHourCameraName%>" /></p>
                                            </div>
                                        </div>--%>
                                            <%--<%} %>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                                        DisplayAfter="0">
                                        <ProgressTemplate>
                                            <div id="loaderdiv" class="table-responsive" align="center" style="height: calc(100vh - 230px);">
                                                <asp:Image ID="ImgProgress1" runat="server" ImageUrl="images/loading.gif" ToolTip="loading..."
                                                    Width="20%" />&nbsp;Please wait...
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <asp:UpdateProgress ID="UpdateProgress2" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                                        DisplayAfter="0">
                                        <ProgressTemplate>
                                            <div id="loaderdiv2" class="pd0" align="center" style="height: calc(100vh - 250px);">
                                                <asp:Image ID="ImgProgress2" runat="server" ImageUrl="images/loading.gif" ToolTip="loading..."
                                                    Width="20%" />&nbsp;Please wait...
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <div id="scrollDiv" class="pd0" align="center" style="overflow-y: auto; height: calc(108vh - 250px);">
                                        <div align="right" style="width: 85%">
                                            <strong><i>You are viewing page
                                <%=PageNumber%>
                                of
                                <%=(int)Math.Ceiling((double)((decimal)totalDatacount / (decimal)pageitemcount))%>
                                            </i></strong>
                                        </div>
                                        <asp:GridView ID="GridView1" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default f-size-1xs" runat="server" AutoGenerateColumns="false"
                                            OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" AlternatingRowStyle-CssClass="bg-light">
                                            <%--   <PagerSettings Position="TopAndBottom" />
                            <PagerStyle VerticalAlign="Bottom" />--%>
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
                                                    <%# Container.DataItemIndex + 1 + (pageitemcount *(this.PageNumber-1))%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="district" HeaderText="District" />
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="acname" HeaderText="Assembly" />
                                                <%--<asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="operatorName" HeaderText="Operator Info" />--%>
                                                <%--<asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="operatorNumber" HeaderText="Operator Contact No" />--%>
                                                
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="PSNum" HeaderText="PS No" />
                                                <asp:TemplateField HeaderText="Location" ItemStyle-CssClass="p-thin text-left"  HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                        <span title='<%# Eval("location") %>'>
                                                            <%#Eval("location").ToString().Length > 30 ? Eval("location").ToString().PadRight(140).Substring(0, 30).TrimEnd() + "..." : Eval("location")%>
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="streamname" HeaderText="camera No" />


                                                <%--<asp:TemplateField HeaderText="Operator Info" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                            <%#Eval("operatorName").ToString() + " / " + Eval("operatorNumber")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                 <asp:TemplateField HeaderText="Size" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                            <%#Eval("Size").ToString()%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="islive" HeaderText="Stream Tested" Visible="false" />
                                                <asp:BoundField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" DataField="mincount" HeaderText="Up Time (hh:mm)" Visible="false" />
                                                <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                        <%#Eval("status").ToString() == "RUNNING" ? "Online" : Eval("status").ToString() == "STOPPED" ? "Offline" : "" %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Operator" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs">
                                                <ItemTemplate>
                                                    <%#Eval("operator_name")%>-<%#Eval("operator_no")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                              <%--  <asp:TemplateField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                        <a href="javascript:void(0)" id="lnkplay" runat="server"></a>
                                                        <div align="center" style="vertical-align: top; display: inline">
                                                            <a href="#" data-backdrop="static" title="View" data-title=" <%#Eval("acname") %>" data-content=" <%#Eval("location") %>"
                                                                style="color: #1499d6" onclick="watchvideopopup('<%# Eval("streamname") %>','<%# Eval("servername") %>','<%#exam.Common.Encode(Eval("statusFlag").ToString())%>','<%#exam.Common.Encode(Eval("bkpstreamid") == DBNull.Value ? "0" : Eval("bkpstreamid").ToString())%>');return false">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye">
                                                                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle>
                                                                </svg>
                                                           
                                                            </a>
                                                            <a href="http://<%# Eval("servername") %>.vmukti.com:8080/recordings/<%# Eval("streamname") %>.flv"
                                                                style="color: #1499d6">

                                                        </div>
                                                        <div style="display: none;" id="ifc<%# Eval("streamname") %>">
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                              <%--  <asp:TemplateField ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                    <ItemTemplate>
                                                        <%if (Session["userType"].ToString().ToLower() == "master_admin" || Session["userType"].ToString().ToLower() == "vmukti_internal")
                                                            {%>
                                                        <div align="center" style="vertical-align: top; display: inline">
                                                            <a href="camerasetting.aspx?did=<%# Eval("streamname") %>&prourl=<%# Eval("prourl") %>" data-backdrop="static" title="Camera Settings" data-title=" <%#Eval("acname") %>" data-content=" <%#Eval("location") %>"
                                                                style="color: #1499d6">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
                                                            </a>
                                                        </div>
                                                        <%} %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>


                                            
                                               <%-- <a href="<%#Eval("url")%>">
                                                    Download
                                                </a>--%>
                                                <%--<asp:Button ID="<%# Eval("streamname") %>" runat="server" Text="Download"  OnClick="btndownload(<%# Eval("streamname") %>)" />
                                                <asp:HyperLink ID="<%# Eval("streamname") %>" runat="server">HyperLink</asp:HyperLink>--%>
                                              
                                                <%--<asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <%if (utypeall.Contains("admin"))
                                          { %>
                                        <div id="divsettings" style="font-size: 18px;">
                                            <a data-toggle='modal' href='#' style="" data-target='#myModal1' id='btnsettings'
                                                onclick="LoadSettings('<%# Eval("deviceid") %>');"><i class='fa fa-cog'></i>&nbsp;Settings</a>
                                        </div>
                                        <%} %>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                       <asp:TemplateField  ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" >
                                            <ItemTemplate>
                                               <asp:Button ID="Button1" runat="server" Text="Download" CssClass="download" style="background-color:burlywood;height:25px;width:150px;"  OnClientClick='<%# Eval("Link", "streamdownload(\"{0}\"); return false;") %>' />
                                             
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
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
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>

            </div>

        </div>
        <%if (Page.User.Identity.IsAuthenticated && Session["userType"] != null)
            { %>
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">

                <div class="card" style="background: #FFFFFF">
                    <div style="height: 20px; padding-right: 10px">
                        <span aria-hidden="true" class="close">&times;</span>
                    </div>
                    <br />
                    <div class="embed-responsive embed-responsive-16by9 mr-thin" style="border-radius: 0px; margin: 0">
                        <iframe id="iframevideo" class="embed-responsive-item" frameborder="0" scrolling="no"></iframe>
                    </div>
                </div>
            </div>

        </div>
        <div id="myModal1" data-backdrop="static" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div id="diviframe" class="embed-responsive pb100">
                                <iframe id="iframesetting" class="embed-responsive-item" frameborder="0" scrolling="no"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
        <script type="text/javascript">

            jQuery(function ($) {

                var xPos, yPos;
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(BeginRequestHandler);
                prm.add_endRequest(EndRequestHandler);
                var nodeId;
                function BeginRequestHandler(sender, args) {
                    nodeId = args.get_postBackElement().id;

                    if (nodeId != "<%=Timer1.ClientID %>" && nodeId != "<%=rptPages.ClientID %>") {
                        $("#scrollDiv").hide();
                    }
                    xPos = $get('scrollDiv').scrollLeft;
                    yPos = $get('scrollDiv').scrollTop;

                }
                function EndRequestHandler(sender, args) {
                    $get('scrollDiv').scrollLeft = xPos;
                    $get('scrollDiv').scrollTop = yPos;
                    $("#scrollDiv").show();
                    if (sender._postBackSettings.panelsToUpdate != null) {
                        $(".txtSearch").bind("keydown.autocomplete", searchtext);
                        $(".txtSearch2").bind("keydown.autocomplete", searchtext2);
                    }
                }

            });

            $(document).ready(function () {
                $(".txtSearch").bind("keydown.autocomplete", searchtext);
                $(".txtSearch2").bind("keydown.autocomplete", searchtext2);
            });
            $(document).on('keydown', '.txtSearch:not(.autocompleted)', searchtext);
            $(document).on('keydown', '.txtSearch2:not(.autocompleted)', searchtext2);



            function searchtext() {
                var dst_text = $("#<%=ddlDistrict.ClientID %> :selected").text();
                var ac_text = $("#<%=ddlbooth.ClientID %> :selected").text();
                var pc_text = $("#<%=ddlAssembly.ClientID %> :selected").text();

                $(this).addClass("autocompleted").onclick({
                    source: function (request, response) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "eledata.asmx/GetBoothLocation",
                            data: "{'locationtext':'" + document.getElementById('<%=txtSearch.ClientID %>').value + "', 'district':'" + dst_text + "','pcname':'" + pc_text + "','acname':'" + ac_text + "','f':0}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);

                            },
                            error: function (result) {
                                // alert("No Match");
                            }
                        });
                    }
                });
            }
            function searchtext2() {
                var dst_text = $("#<%=ddlDistrict.ClientID %> :selected").text();
                var ac_text = $("#<%=ddlbooth.ClientID %> :selected").text();
                var pc_text = $("#<%=ddlAssembly.ClientID %> :selected").text();

                $(this).addClass("autocompleted").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "eledata.asmx/GetBoothLocation",
                            data: "{'locationtext':'" + document.getElementById('<%=txtSearch2.ClientID %>').value + "', 'district':'" + dst_text + "','pcname':'" + pc_text + "','acname':'" + ac_text + "','f':1}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);

                            },
                            error: function (result) {
                                //alert("No Match");
                            }
                        });
                    }
                });
            }

            function streamdownload(Link) {
                var recDt = $("#FromDt").val();
                //recDt = "2022-03-30";
                //straeamname = "AAAA-100429-OUXYO";
                //var url = "https://biharbyelection2022.blob.core.windows.net/byelection2022/" + recDt + "/" + recDt + "_" + straeamname + ".zip";
                var url =Link;
                window.open(url);
                //$.ajax({
                //            type: "POST",
                //            contentType: "application/json; charset=utf-8",
                //            url: "eledata.asmx/GetCameraRecordingDownloadlist",
                //            //data: "{'uuid':'" + straeamname + "','dt':'" + recDt + "'}",
                //            data: "{'uuid':'" + straeamname + "','dt':'2022-03-31'}",
                //            dataType: "json",
                //            success: function (data) {
                //                if (data.d.length > 0)
                //                {
                //                    for (i = 0; i < data.d.length; i++)
                //                    {
                //                        window.open(data.d[i]);
                //                    }
                //                }
                //                else {
                //                    alert("No recording found.");
                //                }
                //            },
                //            error: function (result) {
                //                console.log(result)
                //                // alert("No Match");
                //            }
                //        });
                 //    }
                 //});
            }

            //$(document).ready(function () {
            //    $(".download").click(function () {
            //        $(this).hide();
            //    });
            var $j = jQuery.noConflict();
            $j(".fromdate, .todate").datepicker({
                dateFormat: 'yy-mm-dd',
                showOn: "both",
                buttonImage: "images/calender.png",
                //buttonImageOnly: true,
                buttonText: "Select date"
            });
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                $j(".fromdate, .todate").datepicker({
                    dateFormat: 'yy-mm-dd',
                    showOn: "both",
                    buttonImage: "images/calender.png",
                    //buttonImageOnly: true,
                    buttonText: "Select date"
                });
            });
        </script>
    </section>
</asp:Content>
