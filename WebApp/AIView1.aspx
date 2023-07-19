<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="AIView1.aspx.cs" Inherits="exam.AIView" %>

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
   <%-- <script src="<%=ResolveUrl("~/js/jwplayer.8.24.0.js") %>" type="text/javascript"></script>--%>
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
            <%--<iframe id="iframe1" src="AIViewView.aspx" class="embed-responsive-item" width="100%"
                height="100%"  scrolling="auto" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>--%>
            <section class="flex-auto flex-col bg-white">
            <div>
                <div id="divdata" class="bg-white">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div class="panel" style="margin: 10px 30px 10px 10px">
                                <div class="flex-row flex-wrap -mr-sm">
                                    
                                            <div class="col-12 md:col-4 col4 pb-xs" align="center">

                                                <div class="card">

                                                 <div id="divptz1" class="card d-inline-block">
                                                    <canvas id="cam1" class="ptzcanvas w-full"><%--<%= ptzstreamname %>--%>
                                                    </canvas>
                                                </div>
                                                  <div class="px-thin">
                                                      <p class="heading word-break-all" title="Camera1">22-BARNALA / 103-BARNALA</p>
                                                      <div class="flex-row flex-wrap">
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Vehicle No</b></p>
                                                              <p class="data word-break-all" title="Location">PB30R6124</p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading"><b>Driver Info</b></p>
                                                              <p class="data">SATVINDER SINGH / 9653134133</p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Stream Name</b></p>
                                                              <div class="data word-break-all"> PNJB-000173-PBPTZ </div>
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
                                    <div class="col-12 md:col-4 col4 pb-xs" align="center">

                                                <div class="card">

                                                 <div id="divptz2" class="card d-inline-block">
                                                    <canvas id="cam2" class="ptzcanvas w-full"><%--<%= ptzstreamname %>--%>
                                                    </canvas>
                                                </div>
                                                  <div class="px-thin">
                                                      <p class="heading word-break-all" title="Camera1">21-MALERKOTLA / 105-MALERKOTLA</p>
                                                      <div class="flex-row flex-wrap">
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Vehicle No</b></p>
                                                              <p class="data word-break-all" title="Location">DL03CAJ4465</p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading"><b>Driver Info</b></p>
                                                              <p class="data">GURPREET SINGH / 9877158695</p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Stream Name</b></p>
                                                              <div class="data word-break-all"> PNJB-000221-PBPTZ </div>
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
                                    <%--<div class="col-12 md:col-4 col4 pb-xs" align="center">

                                                <div class="card">

                                                 <div id="divptz3" class="card d-inline-block">
                                                    <canvas id="cam3" class="ptzcanvas w-full">
                                                    </canvas>
                                                </div>
                                                  <div class="px-thin">
                                                      <p class="heading word-break-all" title="Camera1">20-SANGRUR / 107-DHURI</p>
                                                      <div class="flex-row flex-wrap">
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Vehicle No</b></p>
                                                              <p class="data word-break-all" title="Location">CH046381</p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading"><b>Driver Info</b></p>
                                                              <p class="data">DHARM SINGH / 9463063342</p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Stream Name</b></p>
                                                              <div class="data word-break-all"> PNJB-000126-PBPTZ </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                                </div>
                                            </div>--%>
                                    <div class="col-12 md:col-4 col4 pb-xs" align="center">

                                                <div class="card">

                                                 <div id="divptz3" class="card d-inline-block">
                                                    <canvas id="cam3" class="ptzcanvas w-full">
                                                    </canvas>
                                                </div>
                                                  <div class="px-thin">
                                                      <p class="heading word-break-all" title="Camera1">20-SANGRUR / 100-DIRBA</p>
                                                      <div class="flex-row flex-wrap">
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Vehicle No</b></p>
                                                              <p class="data word-break-all" title="Location">PB13AW8328</p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading"><b>Driver Info</b></p>
                                                              <p class="data">GAGANDEEP SINGH / 9876968419</p>
                                                          </div>
                                                          <div class="col-12 md:col-4 col4">
                                                              <p class="sub-heading word-break-all"><b>Stream Name</b></p>
                                                              <div class="data word-break-all"> PNJB-000036-PBPTZ </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                                </div>
                                            </div>
                                </div>
                            </div>
                            <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
                                <div class="mrfive">
                                    <div class="text-center">
                                        <div class="page py-xs">
                                            <asp:LinkButton ID="prev" runat="server" Text="« Prev" Visible="false" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"></asp:LinkButton>
                                            <asp:Repeater ID="rptPages" runat="server">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btn_page_camera" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>'
                                                        Enabled='<%#Eval("Enabled") %>' CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:LinkButton ID="next" runat="server" Text="Next »" Visible="false" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
    <script src="<%=ResolveUrl("~/js/nodeplayer/NodePlayer.min.js") %>"></script>
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

                    function LoadNodePlayer(ptzid, ptzstreamname, servername, DriverName, DriverContactNo, VehicleType, Vehicle_No, dist, assembly, divptzid) {
            console.log('===================>>>>>>>>>' + ptzstreamname)

                        $("#" + ptzid).attr("id", ptzstreamname); 
                        var divptz = document.getElementById(divptzid);
                        divptz.innerHTML = ''; 
                        var canv = document.createElement('canvas');
                        canv.style.width = "100%"
                        canv.id = ptzstreamname;
                        divptz.appendChild(canv);

                        var player;
                        NodePlayer.load(() => {
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
                    $(document).ready(function () {
                        LoadNodePlayer("cam1", "PNJB-000173-PBPTZ-AI", "ptz1.vmukti.com", "Test Driver", "1234567890", "", "12345", "District", "Assembly", "divptz1");
                        LoadNodePlayer("cam2", "PNJB-000221-PBPTZ-AI", "ptz1.vmukti.com", "Test Driver", "1234567890", "", "12345", "District", "Assembly", "divptz2");
                        LoadNodePlayer("cam3", "PNJB-000036-PBPTZ-AI", "ptz1.vmukti.com", "Test Driver", "1234567890", "", "12345", "District", "Assembly", "divptz3");
                    })
                </script>
            </div>
        </section>
        </div>
    </div>
    
</asp:Content>
