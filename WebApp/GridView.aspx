<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" 
    CodeBehind="GridView.aspx.cs" Inherits="exam.GridView" %>
<%--<%@ Register TagPrefix="ucplayer" TagName="player" Src="~/Module/player.ascx" %> --%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    <style>
        .form-group {
    margin-bottom: 0px;
    padding:2px 5px;
        }
       .form-control
       {
           color: #fff;
    background-color: #000;
       }
       .card-header
       {
           padding:5px;
       }
       .btn-default {
    background-color: #3d3e3e;
    border-color: #746e6e;
    color: #f1eaea;
    padding:1px 10px;
}
       .navbar{
           padding:0px;
       }
       .loader {
    display: none;
}
    </style>

   <%-- <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>  
     <script src="<%=ResolveUrl("~/js/nodeplayer/NodePlayer.min.js") %>" type="text/javascript"></script> 
    <link href="video-js-8.5.2/video-js.min.css" rel="stylesheet" />--%>
    <script type="text/javascript" >
        $(document).ready(function () {

            //$('#sidebarcollapse').prop('checked', true);
            //if ($('#sidebarcollapse').is(':checked')) {
            //    $('body').addClass('sidebar-collapse')
            //    $(window).trigger('resize') 
            //}
            $('#sidebarmini1').prop('checked', false);
            if ($('body').hasClass('sidebar-mini')) {
                $('body').removeClass('sidebar-mini')
            }
            else {
                $('body').addClass('sidebar-mini')
            }

            //$('#sidebarmini').prop('checked', false);
            //if ($('body').hasClass('sidebar-mini-md')) {
            //    $('body').removeClass('sidebar-mini-md')
            //}
            //else {
            //    $('body').addClass('sidebar-mini-md')
            //}
        });
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
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                <div class="card-header row"> 
                  <div class="form-group">
                                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Width="150px">
                                            </asp:DropDownList>
                        </div>
                    <div class="form-group">
                    <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="form-control"
                                                OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" Width="150px">
                                            </asp:DropDownList>
                          </div>
                     <%if (Session["username"].ToString().ToLower() == "jigul@vmukti.com" ||
                            Session["username"].ToString().ToLower() == "madhya_pradesheci"  )
                         { %>
                    <div class="form-group">
                  <asp:DropDownList ID="ddlgrid" runat="server" CssClass="form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlgrid_SelectedIndexChanged">
                                                <asp:ListItem Value="3x2">3x2</asp:ListItem> 
                                               <%-- <asp:ListItem Value="1x2">1x2</asp:ListItem>--%>
                                               <%-- <asp:ListItem Value="2x1">2x1</asp:ListItem>--%>
                                               <%-- <asp:ListItem Value="2x2">2x2</asp:ListItem>
                                                <asp:ListItem Value="3x3">3x3</asp:ListItem>--%>
                                                <asp:ListItem Value="4x3">4x3</asp:ListItem>
                                               <%-- <asp:ListItem Value="4x4">4x4</asp:ListItem>--%>
                                                <asp:ListItem Value="6x4">6x4</asp:ListItem> 
                                            </asp:DropDownList>
                          </div>
                    <%} %>
                   <div class="form-group">
                  <asp:DropDownList ID="ddlTimer" runat="server" CssClass="form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlTimer_SelectedIndexChanged">
                                                 <asp:ListItem Value="0">NONE</asp:ListItem>
                                                <asp:ListItem Value="45000">45 Seconds</asp:ListItem> 
                                                <asp:ListItem Value="90000">90 Seconds</asp:ListItem>
                                                <asp:ListItem Value="120000">120 Seconds</asp:ListItem>
                                                <asp:ListItem Value="150000">150 Seconds</asp:ListItem>
                                                 
                                                
                                            </asp:DropDownList>
                          </div>
                       <div class="form-group">
                   <asp:TextBox ID="strm_txtBox" runat="server"  CssClass="form-control"
                                                   Width="150px">
                                                </asp:TextBox>
                          </div>
                     <div class="form-group">
                  <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-block btn-primary"
                                                OnClick="btnsearch_Click" />
                          </div>
                    
              </div>
                             </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="ddlDistrict" />
                                    <asp:PostBackTrigger ControlID="ddlAssembly" />
                                    <asp:PostBackTrigger ControlID="ddlgrid" />
                                    <asp:PostBackTrigger ControlID="ddlTimer" />
                                      <asp:PostBackTrigger ControlID="btnsearch" />
                                </Triggers>
                                </asp:UpdatePanel>
                 <asp:Timer ID="Timer1" runat="server" Interval="45000" OnTick="Timer1_Tick" Enabled="true">
    </asp:Timer>
                 
                  <div class="col-12 row" style="padding:0px">
           <asp:ListView ID="listview1" runat="server">
    <ItemTemplate>
        <div class="col-<%=12/gridcolumns %> pb-xs" style="padding:2px">
            <div class="card" style="margin-bottom:1px">
                 <div id='<%# "div_" + Eval("streamname") + "_" + Container.DataItemIndex %>' class="ptzcard" data-servername='<%# Eval("servername") %>'>
                  <video id='<%# "canvas_" + Eval("streamname") + "_" + Container.DataItemIndex %>' class="video-canvas" muted controls style="width:100%"></video>
 
                </div>                                  
                <div class="px-thin " style="position: relative; background: #0d6c99; font-size: 12px">
                     <div class="col-12 md:col-12 col12 row" style="padding:0px;">
                     
                    <div class="col-11 md:col-11 col11" style="padding:0px;">   
                    <p class="data word-break-all" style="margin-bottom: 0px; text-align: center;">
                            <span style="color: #FFF;"><%#(Eval("district").ToString()) %>/</span>
                            <span style="color: #FFF;"><%#(Eval("acname").ToString()) %>/</span>
                            <span style="color: #FFF;"><%#(Eval("psnum").ToString()) %>/</span>
                            <span style="color: #FFF;"><%#(Eval("location").ToString()) %></span><br />
                            <span style="color: #FFF;" title='<%# Eval("streamname") %>'><%#(Eval("streamname").ToString().Length > 18 ? Eval("streamname").ToString().Substring(0, 17) + "..." : Eval("streamname").ToString()) %></span>
                            <span style="color: #FFF;"><%# Eval("OperatorName").ToString() + " / " + Eval("OperatorNumber").ToString() %></span>
                        </p>
                    </div>
                         <div class="col-1 md:col-1 col1" style="padding:5px 0px; text-align:right">   
                         <a href="cameraset.aspx?did=<%# Eval("streamname") %>&prourl=<%# Eval("prourl") %>"
                                title="Camera Settings" target="_blank" 
                                onclick="openCenteredWindow(this.href, 'CameraSet', 600, 450); return false;"
                                style="color: #FFF">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg></a>
                    </div>
                     </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
    <EmptyDataTemplate>
        <div align="center">
            <h4>
                <label class="text-center text-danger">
                    No Data Found
                </label>
            </h4>
        </div>
    </EmptyDataTemplate>
</asp:ListView>

                      

            </div>
             <%-- </div>--%>
                <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
                                <div class="mrfive">
                                    <div class="text-center">
                                        <div class="page py-xs">
                                            <asp:LinkButton ID="prev" runat="server" Text="First" OnClick="prev_Click" CssClass="btn btn-default btncustom"></asp:LinkButton>
                                            <asp:Repeater ID="rptPages" runat="server" OnItemDataBound="rptPages_ItemDataBound">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btn_page_camera" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>'
                                                        Enabled='<%#Eval("Enabled") %>' OnClick="Page_Changed"  CssClass="btn btn-default btncustom" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:LinkButton ID="next" runat="server" Text="Last" OnClick="next_Click"  CssClass="btn btn-default btncustom"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                </div>
              </div>
            </div>
          </div>
            </section>
        </div>
      </ContentTemplate>
        <Triggers>      
            <asp:PostBackTrigger ControlID="Timer1" />
                            <asp:PostBackTrigger ControlID="prev" />
                            <asp:PostBackTrigger ControlID="next" />
                            <asp:PostBackTrigger ControlID="rptPages" />
                                </Triggers>
                    </asp:UpdatePanel>
   
        <script src="video-js-8.5.2/flv.min.js"></script>
         <script type="text/javascript">
             // Loop through the video elements
             var videoElements = document.querySelectorAll('.video-canvas');
             videoElements.forEach(function (video, index) {
                 var streamname = video.id.split("_")[1];
                 var servername = $(video).closest('.ptzcard').data('servername'); 

                 // Load and play the video
                 LoadNodePlayer(streamname, servername, video);
             });

             function LoadNodePlayer(streamname, servername, video) {
                 const customURL = "wss://" + servername + ":443/live-record/" + streamname + ".flv";
                 var flvPlayer = flvjs.createPlayer({
                     type: 'flv',
                     isLive: true,
                     url: customURL,
                     hasAudio: true,
                     hasVideo: true,
                     enableWorker: true,
                     lazyLoadMaxDuration: 1,
                     lazyLoadMaxBW: 500,
                     lazyLoadRecoverDuration: 1,
                     autoplay: true,
                      
                 });

                 flvPlayer.attachMediaElement(video);
                 flvPlayer.load();
                 flvPlayer.play();

             }
         </script>
         <script>
             function openCenteredWindow(url, title, width, height) {
                 const left = (window.innerWidth - width) / 2;
                 const top = (window.innerHeight - height) / 2;
                 const options = `width=${width},height=${height},left=${left},top=${top}`;
                 window.open(url, title, options);
             }
         </script>
          <script type="text/javascript"> 
              $('#viewmenu').addClass('active');
              $('#gridviewmenu').addClass('active');
          </script>  

</asp:Content>