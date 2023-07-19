<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AIView.aspx.cs" Inherits="exam.AIView2" %>
<%@ Register TagPrefix="ucplayer" TagName="player" Src="~/Module/player.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
     <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script> 
    <script type="text/javascript" >
        //$(document).ready(function () { 
        //    $('#sidebarmini1').prop('checked', false);
        //    if ($('body').hasClass('sidebar-mini')) {
        //        $('body').removeClass('sidebar-mini')
        //    }
        //    else {
        //        $('body').addClass('sidebar-mini')
        //    } 
        //});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
    <div class="content-wrapper" style="background-color:#454d55">
        <section class="content">
      <div class="container-fluid">
        
        <div class="row" style="margin-right:-22px">
          <div class="col-12" style="padding:2px">
            <div class="card" style="background-color:#454d55">  
                <div class="row" style="padding:10px">
                                            <div class="col-6"> 
                                                <div class="card"> 
                                                 <div id="divptz1" class="card d-inline-block" style="margin-bottom:0px">
                                                    <canvas id="cam1" class="ptzcanvas w-full"><%--<%= ptzstreamname %>--%>
                                                    </canvas>
                                                </div>
                                                   <div class="px-thin" style="position:relative;background:#000; font-size:12px">
                                                             <div class="col-12 md:col-12 col12">
                                                               <p class="data word-break-all" style="margin-bottom:0px">
                                        <span style="color: red;">district,</span> /
                                        <span style="color: #FFF;">acname,</span>
                                       <span style="color: #09f909;">PSNum,</span>
                                        (<span style="color: #09f909;">Location</span>)
                                        -<span style="color: #07f5b3;">streamname</span>
                                        </p>
                                                      </div>  
                                                                    </div>
                                                </div> 
                                            </div>
                                  <div class="col-6">  
                                                <div class="card"> 
                                                 <div id="divptz2" class="card d-inline-block" style="margin-bottom:0px">
                                                    <canvas id="cam2" class="ptzcanvas w-full"><%--<%= ptzstreamname %>--%>
                                                    </canvas>
                                                </div>
                                                   <div class="px-thin" style="position:relative;background:#000; font-size:12px">
                                                             <div class="col-12 md:col-12 col12">
                                                               <p class="data word-break-all" style="margin-bottom:0px">
                                        <span style="color: red;">district,</span> /
                                        <span style="color: #FFF;">acname,</span>
                                       <span style="color: #09f909;">PSNum,</span>
                                        (<span style="color: #09f909;">Location</span>)
                                        -<span style="color: #07f5b3;">streamname</span>
                                        </p>
                                                      </div>  
                                                                    </div>
                                                </div> 
                                            </div>
                                    
                                  <%--<div class="col-6"> 

                                                <div class="card">

                                                 <div id="divptz3" class="card d-inline-block" style="margin-bottom:0px">
                                                    <canvas id="cam3" class="ptzcanvas w-full">
                                                    </canvas>
                                                </div>
                                                  <div class="px-thin" style="position:relative;background:#000; font-size:12px">
                                                             <div class="col-12 md:col-12 col12">
                                                               <p class="data word-break-all" style="margin-bottom:0px">
                                        <span style="color: red;">district,</span> /
                                        <span style="color: #FFF;">acname,</span>
                                       <span style="color: #09f909;">PSNum,</span>
                                        (<span style="color: #09f909;">Location</span>)
                                        -<span style="color: #07f5b3;">streamname</span>
                                        </p>
                                                      </div>  
                                                                    </div>
                                                </div>
                                            </div>--%> 
                   </div>
                </div>
              </div> 
        </div>
        </div>
            </section>
        </div>
          </ContentTemplate>
         </asp:UpdatePanel>
      <script src="<%=ResolveUrl("~/js/nodeplayer/NodePlayer.min.js") %>"></script>
                <script>
                    var lastfocusedElementId = "";
                    function pageLoad() { 
                        $(document).click(function (e) { 
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
                <script type="text/javascript"> 
                    $('#viewmenu').addClass('active');
                    $('#AIviewmenu').addClass('active');
                </script>
</asp:Content>
