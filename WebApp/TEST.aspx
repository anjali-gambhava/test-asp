<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="exam.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chart.piecelabel.js/0.14.1/Chart.PieceLabel.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
    <script src="js/jwp8/jwplayer.js" type="text/javascript"></script>
    <style>
        .bg-primary{
           background-color: #dc7c3c;
    color: #fff;
    border: 0 solid transparent;
    font-weight: 800;
    border-radius: 5px;
    padding: 9px;
        }
        .txtbox
        {
            padding: 7px 0px;
    border-radius: 4px;
    border: 1px solid gray;
    font-size: 16px;
 text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <section class="flex-auto flex-col">
        <div class="col-12 col-12 col-12 lg:col-12" style="text-align:center;padding:10px" >
            <div class="row">
                 <asp:TextBox ID="txtserverName" runat="server" style="display:none"/>
            <asp:TextBox ID="strm_txtBox" runat="server" CssClass="txtbox"/>
                <asp:Button ID="btnsearch" runat="server" Text="SEARCH" CssClass="cursor-pointer bg-primary "
                  OnClick="btnsearch_Click" OnClientClick="loadplayer()"  />
                 <asp:Button ID="btnReset" runat="server" Text="RESET" CssClass="cursor-pointer bg-primary "
                   OnClick="btnReset_Click" />
                </div></div>
        <div runat="server" id="divmsg" class="row-fluid col-12 col-12 lg:col-12" style="text-align:center" visible="false" >
           <asp:Label runat="server" ID="lblmsg" style="padding:5px; color:red"
                Text="Please Check Power and INTERNET Connection"></asp:Label></div>
             <div id="divPlayer" class="row-fluid col-12 col-12 lg:col-12 border" runat="server" visible="false" style="vertical-align: top; padding:2px">
                 <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                     <ContentTemplate>
                         <div>
                             <div class="playerimage1" id="RTMPplayer_1"></div>
                         </div>
                     </ContentTemplate>
                 </asp:UpdatePanel>
            </div>
      
    </section>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <link media="screen" rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.3.8/sweetalert2.min.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/sweetalert2/6.3.8/sweetalert2.min.js"> </script>
    <script src="js/carousel.js"></script>
    <script type="text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function () {
            loadplayer();
        });

        jwplayer.key = 'UeOwyRhgpc5Og22j+4YM7uzrcbTwxTV9r+XadsoRGr8=';
        function loadplayer() {
            
            var servername = document.getElementById('<%= txtserverName.ClientID %>').value;//$j("#txtserverName").text;
            var DID = document.getElementById('<%= strm_txtBox.ClientID %>').value;// $j("#strm_txtBox").text;
            var pl_flag = 0;
            var hlsurl = "https://" + servername + ":443/live-record/" + DID + ".m3u8";
            playerInstance = jwplayer("RTMPplayer_1");
            playerInstance.setup({
                file: hlsurl,
                width: "100%",
                height: "350px",
                controls: true,
                stretching: "exactfit",
                loadAndParseHlsMetadata: true,
                defaultBandwidthEstimate: 1,
                preload: "auto",
                liveTimeout: 0,
                liveSyncDuration: 30,
                androidhls: "true",
                autostart: "true",
                logo: {
                    file: "images/vmukti-New-H-2021-final.png",
                    link: "http://www.vmukti.com/",
                    linktarget: "_blank",
                    position: "bottom-right"
                }

            });

            playerInstance.on("error", function (event) {
               //    pl_flag = 1;
               // $(".playerimage").show();
               // playerInstance.setControls(false);
               // clearTimeout();
               //setTimeout(function () { playerInstance.stop(); playerInstance.play(true); }, 1000);

                swal("Error!", "Please Check POWER and INTERNET Connection", "success").then(function () {
                    var DID = document.getElementById('<%= strm_txtBox.ClientID %>').value;// $j("#strm_txtBox").text;
                    clearTimeout();
                    setTimeout(function () { playerInstance.stop(); playerInstance.play(true); }, 1000);
                   // window.location.href = "Test.aspx?DID=" + DID;
                    
                });
               // pl_flag = 1;
               // $(".playerimage").show();
               // playerInstance.setControls(false);
               // clearTimeout();
               //setTimeout(function () { playerInstance.stop(); playerInstance.play(true); }, 1000);
            });
            playerInstance.on("idle", function (event) {
                playerInstance.play(true);
                pl_flag = 1;
            });
            playerInstance.on("play", function (event) {
                $(".playerimage").hide();
                //playerInstance.setControls(false);
                if (pl_flag == 0) {

                    pl_flag = 1;
                }
                clearTimeout();
                playerInstance.play(true);
            });
        }
       
    </script>
         
    </form>
</body>
</html>
