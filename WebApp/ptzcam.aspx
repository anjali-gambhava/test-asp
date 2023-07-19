<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ptzcam.aspx.cs" Inherits="exam.ptzcam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .ptzbtn{
            background:#64BDD3;
            border-radius:7px
        }
        .ptzbtn:hover{
            background:#267588;
        }
        .ptzbtn:active {
         background:#39B54A
        }
        .right {
            font-size: 8px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #fff;
            background-color: #00A0E3;
            border: none;
            border-radius: 15px;
            display: inline-block;
            width: 4em;
            height: 4em;
            margin-left: 1.5em;
        }

            .right:hover {
                background-color: #B3B3B3;
            }

            .right:active {
                background-color: #B3B3B3;
                transform: translateY(4px);
            }

            .right:after {
                content: '';
                display: inline-block;
                margin-top: 1.10em;
                margin-left: -0.6em;
                width: 1.4em;
                height: 1.4em;
                border-top: 0.5em solid #fff;
                border-right: 0.5em solid #fff;
                -moz-transform: rotate(45deg);
                -webkit-transform: rotate(45deg);
                transform: rotate(45deg);
            }

        .left {
            font-size: 8px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #fff;
            background-color: #00A0E3;
            border: none;
            border-radius: 15px;
            display: inline-block;
            width: 4em;
            height: 4em;
            margin-left: 1.5em;
        }

            .left:hover {
                background-color: #B3B3B3;
            }

            .left:active {
                background-color: #B3B3B3;
                transform: translateY(4px);
            }

            .left:after {
                content: '';
                display: inline-block;
                margin-top: 1.10em;
                margin-left: 0.6em;
                width: 1.4em;
                height: 1.4em;
                border-top: 0.5em solid #fff;
                border-right: 0.5em solid #fff;
                -moz-transform: rotate(-135deg);
                -webkit-transform: rotate(-135deg);
                transform: rotate(-135deg);
            }


        .up {
            font-size: 8px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #fff;
            background-color: #00A0E3;
            border: none;
            border-radius: 15px;
            display: inline-block;
            width: 4em;
            height: 4em;
            margin-left: 1.5em;
        }

            .up:hover {
                background-color: #B3B3B3;
            }

            .up:active {
                background-color: #B3B3B3;
                transform: translateY(4px);
            }

            .up:after {
                content: '';
                display: inline-block;
                margin-top: 1.4em;
                width: 1.4em;
                height: 1.4em;
                border-top: 0.5em solid #fff;
                border-right: 0.5em solid #fff;
                -moz-transform: rotate(-45deg);
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }

        .bottom {
            font-size: 8px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #fff;
            background-color: #00A0E3;
            border: none;
            border-radius: 15px;
            display: inline-block;
            width: 4em;
            height: 4em;
            margin-left: 1.5em;
        }

            .bottom:hover {
                background-color: #B3B3B3;
            }

            .bottom:active {
                background-color: #B3B3B3;
                transform: translateY(4px);
            }

            .bottom:after {
                content: '';
                display: inline-block;
                margin-top: 1.0em;
                width: 1.4em;
                height: 1.4em;
                border-top: 0.5em solid #fff;
                border-right: 0.5em solid #fff;
                -moz-transform: rotate(135deg);
                -webkit-transform: rotate(135deg);
                transform: rotate(135deg);
            }

        .zoomcss {
            font-size: 20px;
            background-color: #00A0E3;
            color: White;
            border-radius: 2px;
            padding: 9px 26px 12px 26px;
        }

        .card {
            /*box-shadow: 0 4px 8px 0 rgba(0,0,0,1.0);*/
            transition: 0.3s;
            width: 95%;
            border-radius: 0px;
            border: 0.1rem solid #000;
        }

            .card:hover {
                background-color: cornsilk;
                box-shadow: 0 8px 16px 0 rgba(0,0,0,1.0);
            }

        .heading {
            font-size: 1.5rem;
            font-weight: 900;
            color: #0d6efd;
            letter-spacing: .025em;
            margin-bottom: 0.6rem;
            margin-top: 0.6rem;
            line-height: 1.2;
        }

        .sub-heading {
            font-size: 1.45rem;
            color: #6c757d;
            line-height: 1.2;
            margin-bottom: 0.3rem;
        }

        .data {
            font-size: 1.25rem;
            line-height: 1.2;
            margin-bottom: 0.5rem;
        }

        .container {
            padding: 2px 16px;
        }
    </style>


    <link href="css/ptzctrl.css" rel="stylesheet" type="text/css" />
    <script src="<%=ResolveUrl("~/js/nodeplayer/NodePlayer.min.js") %>"></script>
    <%
        exam.Common cm1 = new exam.Common();
        if (cm1.isMobile())
        { %>
    <%--<script src="<%=ResolveUrl("~/js/jwp6/jwplayer.js") %>" type="text/javascript"></script>--%>
    <%--<script src="<%=ResolveUrl("~/js/jwplayer.8.24.0.js") %>" type="text/javascript"></script>--%>
    <script type="text/javascript">
        /*jwplayer.key = 'gzBqq3hBwmtwCjW1HlG8vi3KHEVLaqRk/zMnHQ==';*/
        jwplayer.key = 'UeOwyRhgpc5Og22j+4YM7uzrcbTwxTV9r+XadsoRGr8=';
    </script>
    <%}
        else
        { %>
    <%--<script src="<%=ResolveUrl("~/js/jwp7/jwplayer.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        jwplayer.key = '+Amzd6SXh2+L9OeORFc8SMH9bZZtyha7IZ/DPg==';
    </script>--%>
    <script src="https://cdn.jwplayer.com/libraries/9pu77ByB.js"></script>
    <%-- <script src="<%=ResolveUrl("~/js/jwp5/jwplayer.js") %>" type="text/javascript"></script>--%>
    <%}%>
    <script src="<%=ResolveUrl("~/js/screenfull.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/jwp8/jwplayer.js") %>" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="bg-white">
        &nbsp;Center List - Single Booth view</div>--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="bg-info">
        <div class="row">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <%-- <div class="panel panel-info">
                    <div class="panel-heading row">
                        <div class="form-inline">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control drpwidth"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                           <div class="form-group">
                                <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="form-control drpwidth"
                                    OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlbooth" runat="server" CssClass="form-control drpwidth"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlbooth_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            
                             <div class="pull-right hide">
                            <div class="form-group">
                                <input type="text" id="txtSearch" runat="server" placeholder="Enter Location" class="form-control drpwidth input-sm txtSearch" />
                            </div>
                            <div class="form-group">
                                <input type="text" id="txtSearch2" runat="server" placeholder="Enter AC/PS No" class="form-control  drpwidth input-sm txtSearch2" />
                            </div>
                            <div class="form-group">
                               
                            </div>
                            
                        </div> </div>
                    </div></div>--%>
                    <div class="col-12 lg:col-12 pb-sm flex-col">
                        <div class="bg-white shadow flex-stretch">
                            <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                                <%-- p-sm--%>
                                <table class="f-size-xxs">
                                    <tr>
                                        <td class="pr-xs">
                                            <div class="select">
                                                <%-- <label>
                            District</label>--%>
                                                <asp:DropDownList ID="ddlDistrict" runat="server" Width="150px" CssClass="datalist border pr-md pl-xs py-xs"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <div class="select">
                                                <%-- <label>
                          <asp:Literal ID="Literal1" runat="server" Text="<%$appSettings:pcname%>" /></label>--%>
                                                <asp:DropDownList ID="ddlPC" runat="server" AutoPostBack="true" CssClass="datalist border pr-md pl-xs py-xs"
                                                    OnSelectedIndexChanged="ddlbooth_SelectedIndexChanged" Width="150px">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="select">
                                            <asp:DropDownList ID="VehicleDropDownList"
                                                runat="server" Width="150px"
                                                AutoPostBack="true"
                                                CssClass="datalist border pr-md pl-xs py-xs"
                                                OnSelectedIndexChanged="VehicleDropDownList_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        </td>

                                    </tr>
                                </table>
                                <%
                                    exam.Common cm = new exam.Common();
                                    if (!cm.isMobile())
                                    {
                                %>
                                <div class="f-right d-hidden">
                                    <label>
                                        Not able to View?
                                    </label>
                                    <a href="<%=ResolveUrl("~/Help/index.html") %>" target="_blank">Click Here for System
                            Test</a>
                                </div>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="VehicleDropDownList" EventName="SelectedIndexChanged" />

                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="flex-row flex-wrap -mr-sm">
        <%--<div class="col-2 lg:col-2 pb-sm flex-col">
        </div>--%>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
        <div class="col-12 lg:col-12 pb-sm flex-col">
            <div class="pd0 flex-row flex-wrap" align="center" style="height: calc(100vh - 290px)">
                <div class="col-9 lg:col-9"><%--embed-responsive  embed-responsive-16by9--%>
                    <div class="embed-responsive-item" id="div_player">
                            <div id="divptz" class="card d-inline-block">
                                <canvas id="<%= ptzstreamname %>" class="ptzcanvas w-full"><%--<%= ptzstreamname %>--%>
                                </canvas>
                            </div>

                        <%--<div id="<%= ptzstreamname%>">
                        </div>--%>
                        <div class="">


                            <div class="px-thin">
                                <div id="dist_ass" class="heading"></div>
                                <div class="flex-row flex-wrap">
                                    <div class="col-12 md:col-4 col4">
                                        <p class="sub-heading word-break-all"><b>Vehicle No</b></p>
                                        <p id="Vehicle_No" class="data word-break-all"></p>
                                    </div>
                                    <div class="col-12 md:col-4 col4">
                                        <p class="sub-heading"><b>Driver Info</b></p>
                                        <p id="Driver"class="data"></p>
                                    </div>
                                    <div class="col-12 md:col-4 col4">
                                        <p class="sub-heading"><b>Camera Id</b></p>
                                        <div id="strnm" class="data word-break-all"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <script>
                            <%--//LoadPlayer('<%=ptzstreamname %>', '<%=servername %>', 'ptz', '', '', '');
                            var player = new NodePlayer();
                            player.setView(<%=ptzstreamname %>);
                            //player.setView('PNJB-000003-PBPTZ');

                            var customURL = "wss://" + <%=servername %> + ":443/live-record/" + <%=ptzstreamname %> + ".flv";
                            //var customURL = "wss://eletestnew.vmukti.com:443/live-record/PNJB-000003-PBPTZ.flv";
                            player.start(customURL);--%>
</script>
                        <%--<div class="playercontrol">
                            <img id="playerimg" class="img-responsive" style="position: relative; display: block"
                                src="images/player.jpg" alt="" />
                        </div>--%>
                        <div id="playercontrol">
                            <div align="left">
                                <button type="button" style="display: none" class="btn btn-bg btn-md btnfull" id="btntogglefullscreen">
                                    <i class="glyphicon glyphicon-resize-full"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3 lg:col-3">
                    <div class="heading"><%= ptzstreamname %> </div>
                    <div class="flex-row flex-wrap -mr-sm">
                        <div class="col-12 md:col-12 col3">
                            <asp:LinkButton ID="arrup" runat="server" ToolTip="Move Up" OnClick="btnup_Click">
                                        <img src="images/up.png" name="Image20" border="0" height="40" width="40"  class="ptzbtn"
                                            id="up" alt="up">
                                        <%--<span class="icon bg-primary f-color-white rounded-full">
                                            <span class="icon mr-xs flex-none f-color-white">
                                                <span class="">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-up"><polyline points="18 15 12 9 6 15"></polyline></svg>
                                                </span>
                                            </span>
                                        </span>--%>
                            </asp:LinkButton>
                            <asp:HiddenField ID="hf_up" runat="server" />
                        </div>      
                        <div class="col-12 md:col-6 col3">
                            <asp:LinkButton ID="arrleft" runat="server" ToolTip="Move Left" OnClick="btnleft_Click">
                                        <img src="images/left.png" name="Image22" border="0" height="40" width="40" class="ptzbtn"
                                            id="left" alt="left">
                                        <%-- <span class="icon bg-primary f-color-white rounded-full">
                                            <span class="icon mr-xs flex-none f-color-white">
                                                <span class="">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg>
                                                </span>
                                            </span>
                                        </span>--%>
                            </asp:LinkButton>
                            <asp:HiddenField ID="hf_left" runat="server" />
                        </div>
                        <div class="col-12 md:col-6 col3">
                            <asp:LinkButton ID="arrright" runat="server" ToolTip="Move Right" OnClick="btnright_Click">
                                        <img src="images/right.png" name="Image24" border="0" height="40" width="40"  class="ptzbtn"
                                            id="right" alt="right">
                                         <%--<span class="icon bg-primary f-color-white rounded-full">
                                            <span class="icon mr-xs flex-none f-color-white">
                                                <span class="">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                                                </span>
                                            </span>
                                        </span>--%>
                            </asp:LinkButton>
                            <asp:HiddenField ID="hf_right" runat="server" />
                        </div>
                        <div class="col-12 md:col-12 col3">
                            <asp:LinkButton ID="arrdown" runat="server" ToolTip="Move Down" OnClick="btndown_Click">
                                        <img src="images/down.png" name="Image26" border="0" height="40" width="40"  class="ptzbtn"
                                            id="down" alt="down">
                                         <%--<span class="icon bg-primary f-color-white rounded-full">
                                            <span class="icon mr-xs flex-none f-color-white">
                                                <span class="">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
                                                </span>
                                            </span>
                                        </span>--%>
                            </asp:LinkButton>
                            <asp:HiddenField ID="hf_down" runat="server" />
                        </div>
                    </div>
                    <div class="flex-row flex-wrap mt-sm">
                        <div class="col-12 md:col-3 col3">
                            </div>
                        <div class="col-12 md:col-3 col3">
                            <div>
                                <asp:LinkButton ID="arrzoomin" runat="server" ToolTip="Zoom In" OnClick="btnzoomin_Click">
                                    <div class="zin">
                                        <%--<span class="icon bg-primary f-color-white rounded-full" style="width: 40px;height:40px;">
                                            <span class="icon mr-xs flex-none f-color-white" style="margin:auto;">
                                                <span class="">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-zoom-in"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line><line x1="11" y1="8" x2="11" y2="14"></line><line x1="8" y1="11" x2="14" y2="11"></line></svg>

                                                </span>
                                            </span>
                                        </span>--%>
                                        <img id="img_zin" width="50" height="50" alt="zoomin" src="images/Zoomin.png" class="ptzbtn"/></div>
                                </asp:LinkButton>
                                <asp:HiddenField ID="hf_near" runat="server" />
                            </div>
                        </div>
                        <div class="col-12 md:col-3 col3">
                            <div>
                                <asp:LinkButton ID="arrzoomout" runat="server" ToolTip="Zoom Out" OnClick="btnzoomout_Click">
                                <%--<div class="zin">
                                    <span class="icon bg-primary f-color-white rounded-full" style="width: 40px; height: 40px;">
                                        <span class="icon mr-xs flex-none f-color-white" style="margin: auto;">
                                            <span class="">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-zoom-out"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line><line x1="8" y1="11" x2="14" y2="11"></line></svg>
                                            </span>
                                        </span>
                                    </span>
                                </div>--%>
                                    <img id="img_zout" alt="zoomout" class="zout ptzbtn" width="50" height="50" src="images/ZoomOut.png" />
                                </asp:LinkButton>
                                <asp:HiddenField ID="hf_far" runat="server" />
                            </div>
                        </div>
                        <div class="col-12 md:col-3 col3">
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <%--</ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged"/>
                <asp:AsyncPostBackTrigger ControlID="ddlbooth" EventName="SelectedIndexChanged"/>
                    <asp:AsyncPostBackTrigger ControlID="arrup" />
                    <asp:AsyncPostBackTrigger ControlID="arrdown" />
                    <asp:AsyncPostBackTrigger ControlID="arrleft" />
                    <asp:AsyncPostBackTrigger ControlID="arrright" />
                    <asp:AsyncPostBackTrigger ControlID="arrzoomin" />
                    <asp:AsyncPostBackTrigger ControlID="arrzoomout" />
                </Triggers>
            </asp:UpdatePanel>--%>
        <div class="col-2 lg:col-2 pb-sm flex-col">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <div class="form-group" style="padding-left: 18px;">
                        <div id="ipcam_ptz">
                            <div id="ipcam_ptz_dir">
                                <table width="auto" border="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <%--<asp:LinkButton ID="arrup" runat="server" OnClick="btnup_Click">--%>
                                                <%--  <img src="img/ptzimages/up.gif" name="Image20" border="0" height="38" width="38"
                                                            id="up" alt="up">--%>
                                                <%--            <span class="up"></span>
                                                </asp:LinkButton>
                                                <asp:HiddenField ID="hf_up" runat="server" />--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%--<asp:LinkButton ID="arrleft" runat="server" OnClick="btnleft_Click">--%>
                                                <%--<img src="img/ptzimages/left.gif" name="Image22" border="0" height="38" width="38"
                                                                id="left" alt="left">--%>
                                                <%--<span class="left"></span>
                                                </asp:LinkButton>
                                                <asp:HiddenField ID="hf_left" runat="server" />--%>
                                            </td>
                                            <td></td>
                                            <td>
                                                <%--<asp:linkbutton id="arrright" runat="server" onclick="btnright_click">--%>
                                                <%-- <img src="img/ptzimages/right.gif" name="Image24" border="0" height="38" width="38"
                                                                id="right" alt="right">--%>
                                                <%--<span class="right"></span>
                                                </asp:LinkButton>
                                                <asp:HiddenField ID="hf_right" runat="server" />--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <%--<asp:LinkButton ID="arrdown" runat="server" OnClick="btndown_Click">--%>
                                                <%-- <img src="img/ptzimages/down.gif" name="Image26" border="0" height="38" width="38"
                                                                id="down" alt="down">--%>
                                                <%--<span class="bottom"></span>
                                                </asp:LinkButton>
                                                <asp:HiddenField ID="hf_down" runat="server" />--%>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="padding-left: 18px;">
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="arrup" />
                    <asp:AsyncPostBackTrigger ControlID="arrdown" />
                    <asp:AsyncPostBackTrigger ControlID="arrleft" />
                    <asp:AsyncPostBackTrigger ControlID="arrright" />
                    <asp:AsyncPostBackTrigger ControlID="arrzoomin" />
                    <asp:AsyncPostBackTrigger ControlID="arrzoomout" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <script type="text/javascript">


        document.getElementById("btntogglefullscreen").onclick = function () {
            if (!screenfull.enabled) {
                return false;
            }
            screenfull.toggle(document.getElementById("mplayer"));
        };
        $(document).on(screenfull.raw.fullscreenchange, function screenfullChange() {
            if (!screenfull.isFullscreen) {
                $('#btntogglefullscreen').find('i').toggleClass('glyphicon-resize-small glyphicon-resize-full');

            } else {
                $('#btntogglefullscreen').find('i').toggleClass('glyphicon-resize-full glyphicon-resize-small');

            }

        });

        function hoverin(element) {
            element.setAttribute('src', 'img/ptzimages/zoomin_hover.png');
        }
        function unhoverin(element) {
            element.setAttribute('src', 'img/ptzimages/zoomin.png');
        }

        function hoverout(element) {
            element.setAttribute('src', 'img/ptzimages/zoomout_hover.png');
        }
        function unhoverout(element) {
            element.setAttribute('src', 'img/ptzimages/zoomout.png');
        }
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function () {
            var timer = 0, timerInterval, timeStartup, timeEndup, timeStartdown, timeEnddown, timeStartleft, timeEndleft, timeStartright, timeEndright, timeStartnear, timeEndnear, timeStartfar, timeEndfar;
            $('#<%=arrup.ClientID %>').mouseup(function () {
                timeEndup = new Date();
                $('#<%=hf_up.ClientID%>').val(Math.floor(((timeEndup - timeStartup) / 1000) * 100));
            });
            $('#<%=arrup.ClientID %>').mousedown(function () {

                timeStartup = new Date();
            });

            $('#<%=arrdown.ClientID %>').mouseup(function () {
                timeEnddown = new Date();

                $('#<%=hf_down.ClientID%>').val(Math.floor(((timeEnddown - timeStartdown) / 1000) * 100));
            });
            $('#<%=arrdown.ClientID %>').mousedown(function () {
                timeStartdown = new Date();
            });

            $('#<%=arrleft.ClientID %>').mouseup(function () {
                timeEndleft = new Date();

                $('#<%=hf_left.ClientID%>').val(Math.floor(((timeEndleft - timeStartleft) / 1000) * 100));
            });
            $('#<%=arrleft.ClientID %>').mousedown(function () {
                timeStartleft = new Date();
            });

            $('#<%=arrright.ClientID %>').mouseup(function () {
                timeEndright = new Date();

                $('#<%=hf_right.ClientID%>').val(Math.floor(((timeEndright - timeStartright) / 1000) * 100));
            });
            $('#<%=arrright.ClientID %>').mousedown(function () {
                timeStartright = new Date();
            });

            $('#<%=arrzoomin.ClientID %>').mouseup(function () {
                timeEndnear = new Date();

                $('#<%=hf_near.ClientID%>').val(Math.floor(((timeEndnear - timeStartnear) / 1000) * 100));
            });
            $('#<%=arrzoomin.ClientID %>').mousedown(function () {
                timeStartnear = new Date();
            });

            $('#<%=arrzoomout.ClientID %>').mouseup(function () {
                timeEndfar = new Date();

                $('#<%=hf_far.ClientID%>').val(Math.floor(((timeEndfar - timeStartfar) / 1000) * 100));
            });
            $('#<%=arrzoomout.ClientID %>').mousedown(function () {
                timeStartfar = new Date();
            });
        });

        function LoadNodePlayer(ptzstreamname, servername, DriverName, DriverContactNo, VehicleType, Vehicle_No, dist, assembly) {
            //LoadPlayer('<%=ptzstreamname %>', '<%=servername %>', 'ptz', '', '', '');
            console.log('===================>>>>>>>>>' + ptzstreamname)

            $(".ptzcanvas").attr("id", ptzstreamname);
            <%# Eval("servername") %>

            
            var Driver = document.getElementById("dist_ass");
            Driver.innerHTML = dist + ' / ' + assembly;

            var Driver = document.getElementById("Driver");
            Driver.innerHTML = DriverName + ' / ' + DriverContactNo;

            var vhno = document.getElementById("Vehicle_No");
            vhno.innerHTML = Vehicle_No;


            var stmnm = document.getElementById("strnm");
            stmnm.innerHTML = ptzstreamname;


            var divptz = document.getElementById('divptz');
            divptz.innerHTML = '';

           
            var canv = document.createElement('canvas');
            canv.style.width = "100%"
            canv.id = ptzstreamname;
            divptz.appendChild(canv);
            
            var player;
             NodePlayer.load(()=>{
                 player = new NodePlayer();
             });

            var interval = null;
            player.setView(ptzstreamname);
            //player.setView('PNJB-000003-PBPTZ');
            
            var customURL = "wss://" + servername + ":443/live-record/" + ptzstreamname + ".flv";
            //var customURL = "wss://eletestnew.vmukti.com:443/live-record/PNJB-000003-PBPTZ.flv";
            
            player.start(customURL);

            player.on("error", (e) => {
                //interval = setInterval(function () { player.start(customURL); }, 1000)
                console.log("Player Error");
            });

            player.on("start", () => {
                if (interval) { clearInterval(); console.log("Interval clear"); }
                console.log("Player Start");
            });

            
            player.on("stop", () => {
                console.log("Player Stopped");
                interval = setInterval(function () { player.start(customURL); }, 1000)
                console.log("Interval Set");
            });
            console.log("Stop Defined");

            player.on("stats", (stats) => {
                //console.log("player on stats=", stats);
            })


        }
    </script>
</asp:Content>
