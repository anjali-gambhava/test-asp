<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiGridView.aspx.cs" Inherits="exam.MultiGridView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="ucplayer" TagName="player" Src="~/Module/player.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%--  <link rel="icon" type="image/x-icon" href="<%=ResolveUrl("~/images/favicon.ico") %>" />--%>
    <%--<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />--%>
    <%--<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />--%>
    <%--<script type="text/javascript" src="<%=ResolveUrl("~/js/jquery.min.js") %>"></script>--%>
    <%--<script src="<%=ResolveUrl("~/js/bootstrap.min.js") %>" type="text/javascript"></script>--%>
    <%--<script src="<%=ResolveUrl("~/js/common.js") %>" type="text/javascript"></script>--%>
    <link rel="stylesheet" href="NewLayout/css/styles.css" />
    <script src="NewLayout/js/allScript.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/screenfull.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/jwp8/jwplayer.js") %>" type="text/javascript"></script>
  <%--  <script src="<%=ResolveUrl("~/js/jwplayer.8.24.0.js") %>" type="text/javascript"></script>--%>
    <script src="<%=ResolveUrl("~/js/rtmp.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        jwplayer.key = 'UeOwyRhgpc5Og22j+4YM7uzrcbTwxTV9r+XadsoRGr8=';
    </script>
    <style>
        .card {
          /*box-shadow: 0 4px 8px 0 rgba(0,0,0,1.0);
          transition: 0.3s;*/
          border: 0.1rem solid gray;
          width: 95%;
          border-radius: 0px;
        }
        .card:hover {
          background-color: cornsilk;
          box-shadow: 0 8px 16px 0 rgba(0,0,0,1.0);
        }
        .heading{
            font-size: 1.5rem;
            font-weight: 900;
            color:#0d6efd;
            letter-spacing:.025em;
            margin-bottom: 0.6rem;
            margin-top: 0.6rem;
            line-height :1.2;
        }

        .sub-heading{
            font-size: 1.45rem;
            color:#6c757d;
            line-height :1.2;
            margin-bottom: 0.3rem;
        }
        .data{
            font-size: 1.25rem;
            line-height :1.2;
            margin-bottom: 0.5rem;
        }
        .container {
          padding: 2px 16px;
        }
    </style>
    <%--<script src="js/clapper/clappr.min.js"></script>
    <script src="js/clapper/main.js"></script>
    <script src="js/clapper/ace.js"></script>--%>
</head>
<body style="margin: 0px;overflow:hidden">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <section class="flex-auto flex-col bg-white">
            <div>
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
                                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="datalist border pr-md pl-xs py-xs"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="pr-xs">
                                        <div class="select">
                                            <%-- <label>
                          <asp:Literal ID="Literal1" runat="server" Text="<%$appSettings:pcname%>" /></label>--%>
                                            <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="datalist border pr-md pl-xs py-xs"
                                                OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="pr-xs">
                                        <div class="select  d-hidden">
                                            <%-- <label>
                            <asp:Literal ID="Literal2" runat="server" Text="<%$appSettings:assemblyname%>" /></label>--%>
                                            <asp:DropDownList ID="ddlbooth" runat="server" CssClass="datalist border pr-md pl-xs py-xs d-hidden"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlbooth_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="pr-xs">
                                        <div class="select">
                                            <label class="black">
                                                Grid</label>
                                            <asp:DropDownList ID="ddlgrid" runat="server" CssClass="datalist border pr-md pl-xs py-xs" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlgrid_SelectedIndexChanged">
                                                <asp:ListItem Value="3x2">3x2</asp:ListItem>
                                                <asp:ListItem Value="4x2">4x2</asp:ListItem>
                                                <asp:ListItem Value="4x3">4x3</asp:ListItem>
                                                <asp:ListItem Value="4x8">4x8</asp:ListItem>
                                                <asp:ListItem Value="6x4">6x4</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="pr-xs">
                                        <button type="button" class="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" id="btntogglefullscreen">
                                            FullScreen
                                        </button>
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
                <%--<asp:Timer ID="Timer1" runat="server" Interval="15000" OnTick="Timer1_Tick" Enabled="false">
    </asp:Timer>--%>
                <div id="divdata">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div class="panel" style="margin: 10px 30px 40px 10px">
                                <div class="flex-row flex-wrap -mr-sm">
                                    <asp:ListView ID="listview1" runat="server">
                                        <ItemTemplate>
                                            <div class="col-12 md:col-<%=12/gridcolumns %> col4 pb-xs" align="center">

                                                <div class="card">

                                                  <ucplayer:player ID="playeritem" runat="server" playerURL='<%#Bind("servername") %>'
                                                    playerid='<%# string.Concat(Container.DataItemIndex.ToString(), "_", Eval("streamname"))%>'
                                                    flag='<%#Bind("sFlag") %>' sid='<%#Bind("strid") %>' />
                                                  
                                                  <div class="px-thin">
                                                      <div class="heading"> <%#Eval("streamname")%> </div>
                                                      <div class="flex-row flex-wrap -mr-sm">
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading"><b>District</b></p>
                                                              <p class="data" title="<%#Eval("district")%>"><%#(Eval("district").ToString().Length >12 ? Eval("district").ToString().Substring(0,9) + "...": Eval("district").ToString()) %></p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading"><b>Vehicle No</b></p>
                                                              <p class="data" title="<%#Eval("location")%>"><%#(Eval("location").ToString().Length >12 ? Eval("location").ToString().Substring(0,9) + "...": Eval("location").ToString()) %></p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading"><b>Driver/Contact NO</b></p>
                                                              <p class="data"><%#Eval("name1")%></p>
                                                          </div>
                                                      </div>
                                                  </div>
                                                </div>

                                                
                                                <h4>

                                                    <%--<a tabindex="0" class='f-size-sm cursor-pointer' role="button" data-toggle="popover"
                                                        data-trigger="focus hover" title=" <%#Eval("district")%>" data-placement="top"
                                                        data-html="true" data-content="<%#Eval("operator_name") %>-<%#Eval("operator_no") %>">
                                                        <%#Eval("district")%> <br /> <%#Eval("streamname")%> <br /> <%#Eval("location").ToString()%>--%>
                                                        <%--    | <%#eval("servername")%><%#eval("accode").tostring().contains("-") ? eval("accode").tostring().split('-')[0]: eval("accode").tostring()%>/
                                              <%#eval("location").ToString().Length > 18 ? Eval("location").ToString().PadRight(140).Substring(0, 18).TrimEnd() + "..." : Eval("location")%>/--%>
                                                    <%--</a>--%>
                                                </h4>
                                            </div>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            <div align="center">
                                                <h4>
                                                    <label class="text-center text-danger">
                                                        No Data Found</label>
                                                </h4>
                                            </div>
                                        </EmptyDataTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                            <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
                                <div class="mrfive">
                                    <div class="text-center">
                                        <div class="page py-xs">
                                            <asp:LinkButton ID="prev" runat="server" Text="« Prev" Visible="false" OnClick="prev_Click" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"></asp:LinkButton>
                                            <asp:Repeater ID="rptPages" runat="server" OnItemDataBound="rptPages_ItemDataBound">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btn_page_camera" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>'
                                                        Enabled='<%#Eval("Enabled") %>' OnClick="Page_Changed" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:LinkButton ID="next" runat="server" Text="Next »" Visible="false" OnClick="next_Click" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </ContentTemplate>
                        <Triggers>
                            <%--<asp:PostBackTrigger ControlID="Timer1" />--%>
                            <asp:PostBackTrigger ControlID="prev" />
                            <asp:PostBackTrigger ControlID="next" />
                            <asp:PostBackTrigger ControlID="rptPages" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <script>
                    var lastfocusedElementId = "";
                    function pageLoad() {
                        //$('[data-toggle="popover"]').popover();

                        $(document).click(function (e) {
                            //$('[data-toggle="popover"]').each(function () {
                            //    if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                            //        $(this).popover('hide');
                            //        lastfocusedElementId = "";
                            //    }
                            //});
                        });

                        $("#btntogglefullscreen").click(function () {

                            var el = parent.document.getElementById("fldiv");


                            if (document.fullscreenEnabled ||
                                document.webkitFullscreenEnabled ||
                                document.mozFullScreenEnabled ||
                                document.msFullscreenEnabled) {

                                if (el.requestFullScreen) {
                                    el.requestFullScreen();
                                } else if (el.mozRequestFullScreen) {
                                    el.mozRequestFullScreen();
                                } else if (el.webkitRequestFullScreen) {
                                    el.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
                                }
                                $('#btntogglefullscreen').find('i').toggleClass('glyphicon-resize-small glyphicon-resize-small');
                            } else {
                                if (document.cancelFullScreen) {
                                    document.cancelFullScreen();
                                } else if (document.mozCancelFullScreen) {
                                    document.mozCancelFullScreen();
                                } else if (document.webkitCancelFullScreen) {
                                    document.webkitCancelFullScreen();
                                }
                                $('#btntogglefullscreen').find('i').toggleClass('glyphicon-resize-full glyphicon-resize-full');
                            }
                        });
                    }
                </script>
            </div>
        </section>
    </form>
</body>
</html>
