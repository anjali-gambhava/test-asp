<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="GridPinkView.aspx.cs" Inherits="exam.GridPinkView" %>

<%@ Register TagPrefix="ucplayer" TagName="player" Src="~/Module/player.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            /*font-size: 1.45rem;*/
            font-size: 60%;
            color:#6c757d;
            line-height :1.2;
            margin-bottom: 0.3rem;
        }
        .data{
            /*font-size: 1.25rem;*/
            font-size: 60%;
            line-height :1.2;
            margin-bottom: 0.5rem;
        }
        .container {
          padding: 2px 16px;
        }
    </style>
    <script src="<%=ResolveUrl("~/js/screenfull.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/jwp8/jwplayer.js") %>" type="text/javascript"></script>
  <%--  <script src="<%=ResolveUrl("~/js/jwplayer.8.24.0.js") %>" type="text/javascript"></script>--%>
    <script src="<%=ResolveUrl("~/js/rtmp.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        jwplayer.key = 'UeOwyRhgpc5Og22j+4YM7uzrcbTwxTV9r+XadsoRGr8=';
    </script>
    <script type="text/javascript">
        var lastfocusedElementId = "";
        function pageLoad() {
            $('[data-toggle="popover"]').popover();

            $(document).click(function (e) {
                $('[data-toggle="popover"]').each(function () {
                    if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                        $(this).popover('hide');
                        lastfocusedElementId = "";
                    }
                });
            });
        }
    </script>
    <script type="application/javascript">

function resizeIFrameToFitContent( iFrame ) {
   
    iFrame.width  = iFrame.contentWindow.document.body.scrollWidth;
    iFrame.height = iFrame.contentWindow.document.body.scrollHeight;
}

window.addEventListener('DOMContentLoaded', function(e) {

    var iFrame = document.getElementById('iframe1');
    resizeIFrameToFitContent( iFrame );

    // or, to resize all iframes:
    //var iframes = document.querySelectorAll("iframe");
    //for( var i = 0; i < iframes.length; i++) {
    //    resizeIFrameToFitContent( iframes[i] );
    //}
} );

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div class="row">
        <div id="fldiv" class="bg-white"><%-- class="embed-responsive embed-responsive-16by9"--%>
            <%--<iframe id="iframe1" src="MultiGridView.aspx" class="embed-responsive-item" width="100%"
                height="100%"  scrolling="auto" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>--%>
            <section class="flex-auto flex-col bg-white">
            <div>
                <div class="col-12 lg:col-12 pb-xs flex-col">
                    <div class="bg-white shadow flex-stretch">
                        <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                            <%-- p-sm--%>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table class="f-size-xxs">
                                <tr>
                                    <td class="pr-xs">
                                        <div class="select">
                                            <%-- <label>
                            District</label>--%>
                                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="datalist border pr-md pl-xs py-xs"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Width="150px">
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="pr-xs">
                                        <div class="select">
                                            <%-- <label>
                          <asp:Literal ID="Literal1" runat="server" Text="<%$appSettings:pcname%>" /></label>--%>
                                            <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="datalist border pr-md pl-xs py-xs"
                                                OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" Width="150px">
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
                                                <%--<asp:ListItem Value="4x2">4x2</asp:ListItem>--%>
                                                <asp:ListItem Value="4x3">4x3</asp:ListItem>
                                                <%--<asp:ListItem Value="4x8">4x8</asp:ListItem>--%>
                                                <%--<asp:ListItem Value="6x4">6x4</asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="pr-xs">
                                        <div class="select">
                                            <label class="black">
                                                Timer</label>
                                            <asp:DropDownList ID="ddlTimer" runat="server" CssClass="datalist border pr-md pl-xs py-xs" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlTimer_SelectedIndexChanged">
                                                <%--<asp:ListItem Value="15000">15 Seconds</asp:ListItem>
                                                <asp:ListItem Value="30000">30 Seconds</asp:ListItem>
                                                <asp:ListItem Value="60000">60 Seconds</asp:ListItem>--%>
                                                <asp:ListItem Value="90000">90 Seconds</asp:ListItem>
                                                <asp:ListItem Value="120000">120 Seconds</asp:ListItem>
                                                <asp:ListItem Value="150000">150 Seconds</asp:ListItem>
                                                <asp:ListItem Value="0">NONE</asp:ListItem>
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
                            </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="ddlDistrict"/>
                                    <asp:PostBackTrigger ControlID="ddlAssembly"/>
                                    <asp:PostBackTrigger ControlID="ddlgrid" />
                                    <asp:PostBackTrigger ControlID="ddlTimer"/>
                                </Triggers>
                                </asp:UpdatePanel>
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
                <asp:Timer ID="Timer1" runat="server" Interval="15000" OnTick="Timer1_Tick" Enabled="true">
    </asp:Timer>
                <div id="divdata" class="bg-white">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div class="panel" style="margin: 10px 30px 10px 10px">
                                <div class="flex-row flex-wrap -mr-sm">
                                    <asp:ListView ID="listview1" runat="server">
                                        <ItemTemplate>
                                            <div class="col-12 md:col-<%=12/gridcolumns %> col4 pb-xs" align="center">

                                                <div class="card">

                                                  <ucplayer:player ID="playeritem" runat="server" playerURL='<%#Bind("servername") %>'
                                                    playerid='<%# string.Concat(Container.DataItemIndex.ToString(), "_", Eval("streamname"))%>'
                                                    flag='<%#Bind("statusFlag") %>' sid='<%#Bind("bkpstreamid") %>' />
                                                  
                                                  <div class="px-thin">
                                                      <p class="heading word-break-all" title="<%#Eval("district")%>"><%#(Eval("district").ToString()) %> / <%#(Eval("acname").ToString()) %></p>
                                                      <div class="flex-row flex-wrap">
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Location</b></p>
                                                              <p class="data word-break-all" title="<%#Eval("location")%>"><%#(Eval("location").ToString().Length >33 ? Eval("location").ToString().Substring(0,30) + "...": Eval("location").ToString()) %></p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading"><b>Operator Info</b></p>
                                                              <p class="data"><%#Eval("OperatorName")%>/ <%#Eval("OperatorNumber")%></p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Stream Name (Type)</b></p>
                                                              <div class="data word-break-all"> <%#Eval("streamname").ToString() + " (" + Eval("cameralocationtype").ToString() + ")"%> </div>
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
                                            <asp:LinkButton ID="prev" runat="server" Text="First" OnClick="prev_Click" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"></asp:LinkButton>
                                            <asp:Repeater ID="rptPages" runat="server" OnItemDataBound="rptPages_ItemDataBound">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btn_page_camera" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>'
                                                        Enabled='<%#Eval("Enabled") %>' OnClick="Page_Changed" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:LinkButton ID="next" runat="server" Text="Last" OnClick="next_Click" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </ContentTemplate>
                        <Triggers>
                            <%--<asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlgrid" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlTimer" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            <asp:AsyncPostBackTrigger ControlID="prev" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="next" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="rptPages" EventName="ItemDataBound" />--%>
                            <%--<asp:PostBackTrigger ControlID="ddlDistrict" />
                            <asp:PostBackTrigger ControlID="ddlAssembly" />
                            <asp:PostBackTrigger ControlID="ddlgrid" />
                            <asp:PostBackTrigger ControlID="ddlTimer" />--%>
                            <asp:PostBackTrigger ControlID="Timer1" />
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
        </div>
    </div>
    
</asp:Content>
