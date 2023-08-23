<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Listview.aspx.cs" Inherits="exam.Listview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
     <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css" />
     
    <style>
        .content-wrapper>.content {
    padding: 5px;
}
        .fixheader{
            background-color: #000;
    border-bottom: 0;
    box-shadow: inset 0 1px 0 #dee2e6, inset 0 -1px 0 #dee2e6;
    position: -webkit-sticky;
    position: sticky;
    top: 0;
    z-index: 10; 
    color:#fff;
        }
        .p-td{
            padding:5px;
        }
        .form-group {
    margin-bottom: 0px;
    padding:2px 5px;
        }
        .card-body.p-0 .table tbody>tr>td:last-of-type, .card-body.p-0 .table tbody>tr>th:last-of-type, .card-body.p-0 .table tfoot>tr>td:last-of-type, .card-body.p-0 .table tfoot>tr>th:last-of-type, .card-body.p-0 .table thead>tr>td:last-of-type, .card-body.p-0 .table thead>tr>th:last-of-type {
     padding-right: 0; 
}
        .cardarchive{
             overflow:auto;
         }
        
    </style>
        <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
     <script src="<%=ResolveUrl("~/js/flv.min.js") %>" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flv.js/1.5.0/flv.min.js"></script>
    <style>
            #videoElementPopup {
                position: relative;
                overflow: auto;
            }

            .vjs-tech {
                position: absolute;
                transition: transform .2s;
                /* Animation */
            }

            .zoom-in-button::before,
            .zoom-out-button::before {
                line-height: 2;
                margin: 0 0.2em;
            }

            .zoom-in-button::before {
                content: "\f00e";
            }

            .zoom-out-button::before {
                content: "\f010";
            }
            .modal-content {
            display: inline-table!important;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate> 
 
     <div class="content-wrapper"> 
    <section class="content">
      <div class="container-fluid">
         <asp:Timer ID="Timer1" runat="server" Interval="60000" Enabled="true" OnTick="Timer1_Tick1">
                        </asp:Timer>
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header row"> 
                  <div class="form-group">
                                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" 
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Width="150px">
                                                </asp:DropDownList>
                        </div>
                    <div class="form-group">
                  <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" Width="150px" DataValueField="1">
                                                </asp:DropDownList>
                          </div>
                    <div class="form-group">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                    <asp:ListItem Text="Select Status" Value="" Selected="True" Width="100px" />
                                                    <asp:ListItem Text="Online" Value="RUNNING" />
                                                    <asp:ListItem Text="Offline" Value="STOPPED" />
                                                    <asp:ListItem Text="Both" Value="BOTH" />
                                                </asp:DropDownList>
                          </div>
                    <div class="form-group">
                    <asp:DropDownList ID="ddllocationType" runat="server" CssClass="form-control"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddllocationType_SelectedIndexChanged">
                                                        <asp:ListItem Text="ALL" Value="" Selected="True" Width="100px" />
                                                        <asp:ListItem Text="Indoor" Value="inside" />
                                                        <asp:ListItem Text="Outdoor" Value="outside" />
                                                   
                                                </asp:DropDownList>
                          </div>
                    <div class="form-group">
                   <asp:TextBox ID="strm_txtBox" runat="server" AutoPostBack="true" CssClass="form-control"
                                                   Width="150px">
                                                </asp:TextBox>
                          </div>
                    <div class="form-group">
                  <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-block btn-primary"
                                                OnClick="btnsearch_Click" />
                          </div>  
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="max-height: 500px; overflow:auto"> 
                   <div class="panel-body"> 
                                    <div id="scrollDiv" class="pd0" align="center" style="overflow-y: auto; height: calc(108vh - 250px);">
                                        <div align="right" style="width: 95%;color:#4198f5">
                                            <strong><i>You are viewing page
                                <%=PageNumber%>
                                of
                                <%=(int)Math.Ceiling((double)((decimal)totalDatacount / (decimal)pageitemcount))%>
                                            </i></strong>
                                        </div>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  CssClass="table table-head-fixed text-nowrap"
                                            OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" AlternatingRowStyle-CssClass="bg-light">
                                         
                                            <EmptyDataTemplate>
                                                <div align="center">
                                                    <h4>
                                                        <label class="text-center text-danger">
                                                            No Data Found</label>
                                                    </h4>
                                                </div>
                                            </EmptyDataTemplate>
                                            <Columns>
                                            <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="fixheader">
                                                <ItemTemplate >
                                                    <%# Container.DataItemIndex + 1 + (pageitemcount *(this.PageNumber-1))%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:BoundField DataField="district" HeaderText="District"  HeaderStyle-CssClass="fixheader"/>
                                                <asp:BoundField  DataField="acname" HeaderText="Assembly"  HeaderStyle-CssClass="fixheader"/>
                                                <asp:TemplateField HeaderText="Operator" HeaderStyle-CssClass="fixheader" >
                                                    <ItemTemplate>
                                                            <%#Eval("operatorName").ToString() + " / " + Eval("operatorNumber")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField  DataField="PSNum" HeaderText="PS No" HeaderStyle-CssClass="fixheader"/>
                                                <asp:TemplateField HeaderText="Location" HeaderStyle-CssClass="fixheader" >
                                                    <ItemTemplate>
                                                        <span title='<%# Eval("location") %>'>
                                                            <%#Eval("location").ToString().Length > 30 ? Eval("location").ToString().PadRight(140).Substring(0, 30).TrimEnd() + "..." : Eval("location")%>
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField  DataField="streamname" HeaderText="Camera ID"  HeaderStyle-CssClass="fixheader"/> 
                                                <asp:BoundField  DataField="kbpsp" HeaderText="Video Bitrate(kbps)"  HeaderStyle-CssClass="fixheader"/> 
                                                <asp:TemplateField HeaderText="Status"  HeaderStyle-CssClass="fixheader">
                                                    <ItemTemplate>
                                                        <%#Eval("status").ToString() == "RUNNING" ? "🟢" : Eval("status").ToString() == "STOPPED" ? "🔴" : "" %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                             
                                                <asp:TemplateField  HeaderStyle-CssClass="fixheader" HeaderText="View"  >
                                                    <ItemTemplate>
                                                        <a href="javascript:void(0)" id="lnkplay" runat="server"></a>
                                                        <div align="center" style="vertical-align: top; display: inline">
                                                            <a href="#" id="viewLink" data-backdrop="static" title="View" data-title=" <%#Eval("acname") %>" data-content=" <%#Eval("location") %>"
                                                                style="color: #1499d6" onclick="OpenPopupAdd(); loadplayer1('<%# Eval("streamname") %>','<%# Eval("servername") %>','<%#exam.Common.Encode(Eval("statusFlag").ToString())%>','<%#exam.Common.Encode(Eval("bkpstreamid") == DBNull.Value ? "0" : Eval("bkpstreamid").ToString())%>');return false">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye">
                                                                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle>
                                                                </svg> 
                                                            </a> 
                                                            </div>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderStyle-CssClass="fixheader" >
                                                    <ItemTemplate>
                                                        <%if (Session["userType"].ToString().ToLower() == "master_admin" || Session["userType"].ToString().ToLower() == "vmukti_internal" || Session["userType"].ToString().ToLower() == "district_level")
                                                            {%>
                                                        <div align="center" style="vertical-align: top; display: inline">
                                                            <a href="camerasetting.aspx?did=<%# Eval("streamname") %>&prourl=<%# Eval("prourl") %>"
                                                        title="Camera Settings"
                                                        target="_blank"
                                                         onclick="openCenteredWindow(this.href, 'CameraSettings', 1200, 760); return false;"
                                                        style="color: #1499d6">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
                                                            </a>
                                                        </div>
                                                        <%} %>
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
              </div> 
            </div> 
          </div>
        </div> 
      </div> 
    </section>  
          <asp:HiddenField ID="hdstreamname" runat="server" />
                <asp:HiddenField ID="hdservername" runat="server" /> 
  </div>
                             </ContentTemplate> 
                    </asp:UpdatePanel> 
    <div class="modal wow fadeInUp animated" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content bg-secondary">
            <div class="modal-header" style="padding:0px 10px">
               <button type="button" onclick="ClosePopupAdd();  refreshTimeline()" class="btnclose close cursor-pointer" id="btncancel" data-dismiss="modal" aria-hidden="true">
    &times;
</button>
            </div>
            <div class="modal-body cardarchive" id="videoContainer">
                <video id="videoElementPopup" class="video-js vjs-default-skin" muted autoplay preload="auto" controls style="height:100%; width:100%">
                </video>
                     <video id="videoElement" muted autoplay preload="auto" controls style="width:100%; padding:0px 0px 40px; display:none">
    </video> 
            </div>
            <div class="modal-footer">
          <asp:UpdatePanel runat="server">
        <ContentTemplate>

                 <div class="row" style="padding:0px 25px">
   
    <div class="col-md-3" style="display:none"> <!-- Adjust the column width as needed -->
        <div id='datepicker' class="row" data-date="" data-link-field="dtp_input2">
            <asp:TextBox ID="FromDt" runat="server" CssClass="form-control fromdate" size="16" autocomplete="off" Width="90%" Text='' />
        </div>
    </div> 
                      <div class="col-md-3"> <!-- Adjust the column width as needed -->
        <asp:Button runat="server" ID="btnloadarchive" OnClick="btnloadarchive_Click" Text="Load Archive" UseSubmitBehavior="false" CssClass="btn btn-block btn-primary" style="padding:5px"/>
                      </div>

                     <div class="col-md-9">
                           
                         <button style="font-size:13px" id="zoomInButton"><i class="material-icons">zoom_in</i></button> 
                         <button style="font-size:13px" id="ResetzoomButton"><i class="material-icons">center_focus_strong</i></button> 
                         <button style="font-size:13px" id="zoomOutButton"><i class="material-icons">zoom_out</i></button> 
                         <button style="font-size:13px" id="rewindBtn"><i class="material-icons">skip_previous</i></button>
                         <button style="font-size:24px" id="forwordBtn"><i class="material-icons">skip_next</i></button>
                         <button style="font-size:24px" id="downloadBtn"><i class="material-icons">file_download</i></button>
                          <button style="font-size:13px" id="ResetBtn"><i class="material-icons">podcasts</i></button>
                         
                </div> </div>
                      <div class="row" style="padding:0px 0px">
                     <div class="col-md-12">
                         
            <div class="cd-horizontal-timeline">
                    <div class="timeline">
                        <div class="events-wrapper">
                            <div class="events">

                                <ul>
                                    <% if (dsReport != null) { %>
                                        <% int leftPos = 0; %>
                                        <% for (int i = 0; i < dsReport.Rows.Count; i++) { %>
                                            <% string flvname = dsReport.Rows[i]["a_Text"].ToString(); %>
                                            <% string filename = flvname.Substring(11, flvname.Length - 15).Replace("-", ":"); %>
                                            <li><a href="#0" onclick="loadplayer2('<%= dsReport.Rows[i]["a_Text"].ToString() %>');" style="left:<%= leftPos %>px;"><%= filename %></a>

                                                <% leftPos += 100; %>
                                            </li>
                                        <% } %>
                                    <% } else { %>
                                        <li><a href="#0" data-date="01/01/2017" style="left:10px" class="norecordfound">No Record found</a></li>

                                    <% } %>
                                </ul> 
                                <span class="filling-line" aria-hidden="true"></span>
                            </div> <!-- .events -->
                        </div> <!-- .events-wrapper -->

                        <ul class="cd-timeline-navigation" style="display:none">
                            <li><a href="#0" class="prev inactive">Prev</a></li>
                            <li><a href="#0" class="next">Next</a></li>
                        </ul> <!-- .cd-timeline-navigation -->
                    </div> <!-- .timeline -->

                </div>
          
                         </div>
                          </div>
            </ContentTemplate>
    </asp:UpdatePanel> 
            </div>
        </div> 
    </div> 
</div> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
     <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <  <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>  
    <script type="text/javascript" >   
        var $j = jQuery.noConflict(); 
            var $j = jQuery.noConflict();
            $j(".fromdate, .todate").datepicker({
                dateFormat: 'yy-mm-dd',
            showOn: "both",
            buttonImage: "images/calender.png",
            //buttonImageOnly: true,
            buttonText: "Select date",
            minDate: "2023-04-01",
            //maxDate: "26/06/2022"
        });
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            var date = $(".fromdate").val();
            var newdate = date.split("/").join("-");
            $j(".fromdate, .todate").datepicker({
                dateFormat: 'yy-mm-dd',
            showOn: "both",
            buttonImage: "images/calender.png",
            //buttonImageOnly: true,
            buttonText: "Select date",
            minDate: "2023-04-01",
                //maxDate: "26/06/2022"
            });
        });
        var videojsPlayer = null;
        function OpenPopupAdd() {
            $j("#myModal").show();
            
        }
        function ClosePopupAdd() {
            $j("#myModal").hide();
            if (videojsPlayer) {
                videojsPlayer.dispose(); // Dispose the player to free up resources
                videojsPlayer = null;// Set to null to indicate that the player has been disposed
            }
        }

         
        function loadplayer(streamname, servername, flag, bkupstreamid) {

            document.getElementById('<%= hdstreamname.ClientID %>').value = streamname;
            document.getElementById('<%= hdservername.ClientID %>').value = servername;

            var videoContainer = document.getElementById('videoContainer');
            var existingVideoElement = document.getElementById('videoElementPopup'); 
            if (videojsPlayer) {
                videojsPlayer.dispose();
                videojsPlayer = null;
            }
             
            if (existingVideoElement) {
                videoContainer.removeChild(existingVideoElement);
            } 
            var videoElementPopup = document.createElement('video');
            videoElementPopup.id = 'videoElementPopup';
            videoElementPopup.className = 'video-js vjs-default-skin';
            videoElementPopup.muted = true;
            videoElementPopup.autoplay = true;
            videoElementPopup.preload = 'auto';
            videoElementPopup.controls = true;
            videoContainer.appendChild(videoElementPopup);

            // Set up the Video.js player
            var hlsurl = 'https://' + servername + '/live-record/' + streamname + '.m3u8';

            videojsPlayer = videojs('videoElementPopup', {
                techOrder: ['html5', 'flvjs'], // Use flv.js for playing HLS streams
                sources: [{ src: hlsurl, type: 'application/x-mpegURL' }],
                hlshtml: true,
                allowscriptaccess: 'always',
                width: 640,
                height: 360,
                logo: {
                    file: 'images/vmukti-New-H-2021-final.png',
                    link: 'http://www.vmukti.com/',
                    linktarget: '_blank',
                    position: 'bottom-right'
                }
            });

            //var zoomInButton = videojs.dom.createEl('button', { 
            //    className: '',
            //    innerHTML: '+',
            //    title: 'Zoom In'
            //});

            //var zoomOutButton = videojs.dom.createEl('button', {
            //    className: '',
            //    innerHTML: '-',
            //    title: 'Zoom Out'
            //});

            //zoomInButton.onclick = zoomIn;
            //zoomOutButton.onclick = zoomOut;

          //  videojsPlayer.controlBar.el().insertBefore(zoomInButton, videojsPlayer.controlBar.fullscreenToggle.el());
           // videojsPlayer.controlBar.el().insertBefore(zoomOutButton, videojsPlayer.controlBar.fullscreenToggle.el()); 
            //videojsPlayer.play(); 
            //var zoomLevel = 1; 
            //function zoomIn(event) {
            //    event.preventDefault();
            //    zoomLevel += 0.1;
            //    var videoElementPopup = document.querySelector('#videoElementPopup video');
            //    videoElementPopup.style.transform = `scale(${zoomLevel})`;
            //}

            //function zoomOut(event) {
            //    event.preventDefault();
            //    zoomLevel -= 0.1;
            //    if (zoomLevel < 1) zoomLevel = 1; // Prevent zooming out more than the original size
            //    var videoElementPopup = document.querySelector('#videoElementPopup video');
            //    videoElementPopup.style.transform = `scale(${zoomLevel})`;
            //}
        }

       
        function loadplayer1(streamname, servername, flag, bkupstreamid) {
            document.getElementById('<%= hdstreamname.ClientID %>').value = streamname;
            document.getElementById('<%= hdservername.ClientID %>').value = servername;
            if (flvjs.isSupported()) { 
                var videoElement = document.getElementById('videoElementPopup');
                var videoContainer = videoElement.parentElement;
                var logoImg = document.createElement('img');
                logoImg.src = 'images/Player-Logo1.png';
                logoImg.style.position = 'absolute';
                logoImg.style.bottom = '100px';
                logoImg.style.right = '30px';
                logoImg.style.width = '20%';
                videoContainer.appendChild(logoImg);
                var flvurl = 'wss://' + servername + '/live-record/' + streamname + '.flv';
                var flvPlayer = flvjs.createPlayer({
                    type: 'flv',
                    url: flvurl
                });
                flvPlayer.attachMediaElement(videoElement);
                flvPlayer.load();
                flvPlayer.play();
                flvPlayer.on(flvjs.Events.BUFFER_FULL, () => {
                    setTimeout(() => {
                        flvPlayer.currentTime = delayInSeconds;
                    }, delayInSeconds * 1000);
                });
                var ResetzoomButton = document.getElementById("ResetzoomButton");
                var zoomInButton = document.getElementById("zoomInButton");
                var zoomOutButton = document.getElementById("zoomOutButton");
                var videoElement = document.getElementById('videoElementPopup');
                var zoomLevel = 1;

                ResetzoomButton.addEventListener('click', function () {
                    event.preventDefault();
                    zoomLevel = 1;
                    applyZoom();
                });
                zoomInButton.addEventListener('click', function () {
                    event.preventDefault();
                    zoomLevel += 0.1;
                    applyZoom();
                });

                zoomOutButton.addEventListener('click', function () {
                    event.preventDefault();
                    if (zoomLevel > 0.1) {
                        if (zoomLevel != 1)
                            zoomLevel -= 0.1;
                        applyZoom();
                    }
                });
                function applyZoom() {
                    videoElement.style.transform = 'scale(' + zoomLevel + ')';
                }


            }
        }
        function loadplayer2(name) { 
            if (flvjs.isSupported()) {
                var videoElement = document.getElementById('videoElementPopup');
                var serverName = document.getElementById('<%= hdservername.ClientID %>').value;
                var cameraid = document.getElementById('<%= hdstreamname.ClientID %>').value;
                 var flvurl = 'https://' + serverName + '/live-record/' + cameraid + '/' + name;
                 var flvPlayer = flvjs.createPlayer({
                     type: 'flv',
                     // url: 'https://punjab106.vmukti.com/live-record/ANYK-803582-AAAAA/2023-03-07-13-07-03.flv'
                     url: flvurl
                     //url: 'https://goa3.vmukti.com/live-record/ANYK-800791-AAAAA/2023-04-01-20-51-23.flv'
                 });
                 flvPlayer.attachMediaElement(videoElement);
                 flvPlayer.load();
                flvPlayer.play();

                 videoElement.addEventListener('play', function () {
                     console.log('Video is playing');
                 });
                 videoElement.addEventListener('pause', function () {
                     console.log('Video is paused');
                 });
                 videoElement.addEventListener('timeupdate', function () {
                     console.log('Current time: ' + videoElement.currentTime);
                 });
                 var skipBackwardButton = document.getElementById("rewindBtn");
                 skipBackwardButton.addEventListener('click', function () {
                     event.preventDefault();
                     videoElement.currentTime -= 10;
                 });
                 var skipForwardButton = document.getElementById("forwordBtn");
                 skipForwardButton.addEventListener('click', function () {
                     event.preventDefault();
                     videoElement.currentTime += 10;
                 });
                 var downloadButton = document.getElementById("downloadBtn");
                 downloadButton.addEventListener('click', function () { 
                     var url = flvurl;
                     window.open(url);
                 });

                var ResetzoomButton = document.getElementById("ResetzoomButton");
                var zoomInButton = document.getElementById("zoomInButton");
                var zoomOutButton = document.getElementById("zoomOutButton");
                var videoElement = document.getElementById('videoElementPopup');
                var zoomLevel = 1;

                ResetzoomButton.addEventListener('click', function () {
                   event.preventDefault();
                    zoomLevel = 1;
                    applyZoom();
                });

                zoomInButton.addEventListener('click', function () {
                    event.preventDefault();
                    zoomLevel += 0.1;
                    applyZoom();
                });

                zoomOutButton.addEventListener('click', function () {
                    event.preventDefault();
                    if (zoomLevel > 0.1) {
                        if (zoomLevel != 1)
                            zoomLevel -= 0.1;
                        applyZoom();
                    }
                });

                function applyZoom() {
                    videoElement.style.transform = 'scale(' + zoomLevel + ')';
                }
                var ResetBtn = document.getElementById("ResetBtn");
                ResetBtn.addEventListener('click', function () {
                    event.preventDefault(); 
                    var serverName = document.getElementById('<%= hdservername.ClientID %>').value;
            var cameraid = document.getElementById('<%= hdstreamname.ClientID %>').value;
            loadplayer1(cameraid, serverName, "", "");
        });
             }
         }
    </script>
    <script type="text/javascript"> 
        function pageLoad(sender, args) {
            var ResetzoomButton = document.getElementById("ResetzoomButton");
            var zoomInButton = document.getElementById("zoomInButton");
            var zoomOutButton = document.getElementById("zoomOutButton");
            var videoElement = document.getElementById('videoElementPopup');
            var zoomLevel = 1;

            ResetzoomButton.addEventListener('click', function () {
                event.preventDefault();
                zoomLevel = 1;
                applyZoom();
            });

            zoomInButton.addEventListener('click', function () {
                event.preventDefault();
                zoomLevel += 0.1;
                applyZoom();
            });

            zoomOutButton.addEventListener('click', function () {
                event.preventDefault();
                if (zoomLevel > 0.1) {
                    if (zoomLevel != 1)
                        zoomLevel -= 0.1;
                    applyZoom();
                }
            });

            function applyZoom() {
                videoElement.style.transform = 'scale(' + zoomLevel + ')';
            }
            var ResetBtn = document.getElementById("ResetBtn");
            ResetBtn.addEventListener('click', function () {
                event.preventDefault();
                var serverName = document.getElementById('<%= hdservername.ClientID %>').value;
                    var cameraid = document.getElementById('<%= hdstreamname.ClientID %>').value;
                    loadplayer1(cameraid, serverName, "", "");
            });


            var skipBackwardButton = document.getElementById("rewindBtn");
            skipBackwardButton.addEventListener('click', function () {
                event.preventDefault();
                videoElement.currentTime -= 10;
            });
            var skipForwardButton = document.getElementById("forwordBtn");
            skipForwardButton.addEventListener('click', function () {
                event.preventDefault();
                videoElement.currentTime += 10;
            });
             
        }
    </script>
    <script type="text/javascript">
        function openCenteredWindow(url, title, width, height) {
            const left = (window.innerWidth - width) / 2;
            const top = (window.innerHeight - height) / 2;
            const options = `width=${width},height=${height},left=${left},top=${top}`;
            window.open(url, title, options);
        }
    </script>
    <script type="text/javascript">
        function refreshTimeline() { 
           location.reload();  
        }
    </script> 
     <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"  type="text/javascript"></script>
   <style>
     .norecordfound{
         left:0px!important;
     }
@import url('https://fonts.googleapis.com/css?family=Ubuntu');

*, *::after, *::before {
  box-sizing: border-box;
}

 
/* -------------------------------- 

Main Components 

-------------------------------- */
.modal-footer{
        display: block;
            margin: -0.95rem;
}
.timeline::before{
    background-color: #dc3545;
    left: 0px;
}
.cd-horizontal-timeline {
  opacity: 1;
  margin: 2em auto;
  -webkit-transition: opacity 0.2s;
  -moz-transition: opacity 0.2s;
  transition: opacity 0.2s;
}
.cd-horizontal-timeline::before {
  /* never visible - this is used in jQuery to check the current MQ */
  content: 'mobile';
  display: none;
}
.cd-horizontal-timeline.loaded {
  /* show the timeline after events position has been set (using JavaScript) */
  opacity: 1;
}
.cd-horizontal-timeline .timeline {
  position: absolute;
  height: 100px;
  width: 97%;
  max-width: 900px;
  margin: 0 auto;
  background-color:#6c757d!important;
}
.cd-horizontal-timeline .events-wrapper {
  position: relative;
  height: 100%;
  margin: 0 0px;
  overflow: hidden;
  overflow-x:auto
}
.cd-horizontal-timeline .events-wrapper::after, .cd-horizontal-timeline .events-wrapper::before {
  /* these are used to create a shadow effect at the sides of the timeline */
  content: '';
  position: absolute;
  z-index: 2;
  top: 0;
  height: 100%;
  width: 20px;
}
.cd-horizontal-timeline .events-wrapper::before {
  left: 0;
}
.cd-horizontal-timeline .events-wrapper::after {
  right: 0;
}
.cd-horizontal-timeline .events {
  /* this is the grey line/timeline */
  position: absolute;
  z-index: 1;
  left: 0;
  top: 60px;
  height: 2px;
  /* width will be set using JavaScript */
  background: #bf3232;
  -webkit-transition: -webkit-transform 0.4s;
  -moz-transition: -moz-transform 0.4s;
  transition: transform 0.4s;
}
.cd-horizontal-timeline .filling-line {
  /* this is used to create the green line filling the timeline */
  position: absolute;
  z-index: 1;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  background-color: #FF3D7F;
  -webkit-transform: scaleX(0);
  -moz-transform: scaleX(0);
  -ms-transform: scaleX(0);
  -o-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transform-origin: left center;
  -moz-transform-origin: left center;
  -ms-transform-origin: left center;
  -o-transform-origin: left center;
  transform-origin: left center;
  -webkit-transition: -webkit-transform 0.3s;
  -moz-transition: -moz-transform 0.3s;
  transition: transform 0.3s;
}
.cd-horizontal-timeline .events a {
  position: absolute;
  width:100px;
  bottom: 0;
  z-index: 2;
  text-align: center;
  font-size: 13px;
  padding-bottom: 15px;
  color: #383838;
  /* fix bug on Safari - text flickering while timeline translates */
  -webkit-transform: translateZ(0);
  -moz-transform: translateZ(0);
  -ms-transform: translateZ(0);
  -o-transform: translateZ(0);
  transform: translateZ(0);
  color:white;
  padding:2px;
  margin-bottom:20px;
}
/* custom*/
.cd-horizontal-timeline .events a::before {
  content: '';
  position: absolute;
  width:1px;
  height:20px;
  background: #e55858;
  bottom:-20px;
  left:50%;
}

.cd-horizontal-timeline .events a::after {
  /* this is used to create the event spot */
  content: '';
  position: absolute;
  left: 50%;
  right: auto;
  -webkit-transform: translateX(-50%);
  -moz-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
  -o-transform: translateX(-50%);
  transform: translateX(-50%);
  bottom: -25px;
  height: 12px;
  width: 12px;
  border-radius: 50%;
  border: 2px solid red;
  background-color: #fff;
  -webkit-transition: background-color 0.3s, border-color 0.3s;
  -moz-transition: background-color 0.3s, border-color 0.3s;
  transition: background-color 0.3s, border-color 0.3s;
}
.no-touch .cd-horizontal-timeline .events a:hover::after {
  background-color: #FF3D7F;
  border-color: #fff;
}
.cd-horizontal-timeline .events a.selected {
 /* pointer-events: none;*/
}
.cd-horizontal-timeline .events a.selected::after {
  background-color: #FF3D7F;
  border-color: #FF3D7F;
}
.cd-horizontal-timeline .events a.older-event::after {
  border-color: #FF3D7F;
}
.modal-body {
    padding: 0rem;
}
@media only screen and (min-width: 1100px) {
  .cd-horizontal-timeline {
   /* margin: 6em auto;*/
    margin: 0px 0px;
  }
  .cd-horizontal-timeline::before {
    /* never visible - this is used in jQuery to check the current MQ */
    content: 'desktop';
  }
}

.cd-timeline-navigation a {
  /* these are the left/right arrows to navigate the timeline */
  position: absolute;
  z-index: 1;
  top: 50%;
  bottom: auto;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  height: 30px;
  width: 30px;
  border-radius: 50%;
  border: 2px solid #fff;
  /* replace text with an icon */
  overflow: hidden;
  color: transparent;
  text-indent: 100%;
  white-space: nowrap;
  -webkit-transition: border-color 0.3s;
  -moz-transition: border-color 0.3s;
  transition: border-color 0.3s;
}
.cd-timeline-navigation a::after {
  /* arrow icon */
  content: '';
  position: absolute;
  height: 16px;
  width: 16px;
  left: 50%;
  top: 50%;
  bottom: auto;
  right: auto;
  -webkit-transform: translateX(-50%) translateY(-50%);
  -moz-transform: translateX(-50%) translateY(-50%);
  -ms-transform: translateX(-50%) translateY(-50%);
  -o-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
  background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRw%0D%0AOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjE2cHgiIGhl%0D%0AaWdodD0iMzJweCIgdmlld0JveD0iMCAwIDE2IDMyIj48ZyAgdHJhbnNmb3JtPSJ0cmFuc2xhdGUo%0D%0AMCwgMCkiPjxwb2x5Z29uIGZpbGw9IiM3YjlkNmYiIHBvaW50cz0iNiwxMy40IDQuNiwxMiA4LjYs%0D%0AOCA0LjYsNCA2LDIuNiAxMS40LDggIi8+PC9nPjxnICB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLCAx%0D%0ANikiPjxwb2x5Z29uIGZpbGw9IiNkZmRmZGYiIHBvaW50cz0iNiwxMy40IDQuNiwxMiA4LjYsOCA0%0D%0ALjYsNCA2LDIuNiAxMS40LDggIi8+PC9nPjwvc3ZnPg==) no-repeat 0 0;
}
.cd-timeline-navigation a.prev {
  left: 0;
  -webkit-transform: translateY(-50%) rotate(180deg);
  -moz-transform: translateY(-50%) rotate(180deg);
  -ms-transform: translateY(-50%) rotate(180deg);
  -o-transform: translateY(-50%) rotate(180deg);
  transform: translateY(-50%) rotate(180deg);
}
.cd-timeline-navigation a.next {
  right: 0;
  color: #fff;
}
.no-touch .cd-timeline-navigation a:hover {
  border-color: #FF3D7F;
}
.cd-timeline-navigation a.inactive {
  cursor: not-allowed;
}
.cd-timeline-navigation a.inactive::after {
  background-position: 0 -16px;
}
.no-touch .cd-timeline-navigation a.inactive:hover {
  border-color: #FF3D7F;
}

.cd-horizontal-timeline .events-content {
  position: relative;
  width: 100%;
  margin: 2em 0;
  overflow: hidden;
  -webkit-transition: height 0.4s;
  -moz-transition: height 0.4s;
  transition: height 0.4s;
}
.cd-horizontal-timeline .events-content li {
  position: absolute;
  z-index: 1;
  width: 100%;
  left: 0;
  top: 0;
  -webkit-transform: translateX(-100%);
  -moz-transform: translateX(-100%);
  -ms-transform: translateX(-100%);
  -o-transform: translateX(-100%);
  transform: translateX(-100%);
  padding: 0 5%;
  opacity: 0;
  -webkit-animation-duration: 0.4s;
  -moz-animation-duration: 0.4s;
  animation-duration: 0.4s;
  -webkit-animation-timing-function: ease-in-out;
  -moz-animation-timing-function: ease-in-out;
  animation-timing-function: ease-in-out;
}
.cd-horizontal-timeline .events-content li.selected {
  /* visible event content */
  position: relative;
  z-index: 2;
  opacity: 1;
  -webkit-transform: translateX(0);
  -moz-transform: translateX(0);
  -ms-transform: translateX(0);
  -o-transform: translateX(0);
  transform: translateX(0);
}
.cd-horizontal-timeline .events-content li.enter-right, .cd-horizontal-timeline .events-content li.leave-right {
  -webkit-animation-name: cd-enter-right;
  -moz-animation-name: cd-enter-right;
  animation-name: cd-enter-right;
}
.cd-horizontal-timeline .events-content li.enter-left, .cd-horizontal-timeline .events-content li.leave-left {
  -webkit-animation-name: cd-enter-left;
  -moz-animation-name: cd-enter-left;
  animation-name: cd-enter-left;
}
.cd-horizontal-timeline .events-content li.leave-right, .cd-horizontal-timeline .events-content li.leave-left {
  -webkit-animation-direction: reverse;
  -moz-animation-direction: reverse;
  animation-direction: reverse;
}
.cd-horizontal-timeline .events-content li > * {
  max-width: 800px;
  margin: 0 auto;
}
.cd-horizontal-timeline .events-content h2 {
  font-weight: bold;
  font-size: 3em !important;
  font-weight: 700;
  line-height: 1.2;
}
.cd-horizontal-timeline .events-content em {
  display: block;
  font-style: italic;
  margin: 10px auto;
}
.cd-horizontal-timeline .events-content em::before {
  content: '- ';
}
.cd-horizontal-timeline .events-content p {
  font-size: 1.5em !important;
  color: #fff;
}
.cd-horizontal-timeline .events-content em, .cd-horizontal-timeline .events-content p {
  line-height: 1.6;
}
@media only screen and (min-width: 768px) {
  .cd-horizontal-timeline .events-content h2 {
    font-size: 7rem;
  }
  .cd-horizontal-timeline .events-content em {
    font-size: 1.5em !important;
  }
  .cd-horizontal-timeline .events-content p {
    font-size: 1.8rem;
  }
}

@-webkit-keyframes cd-enter-right {
  0% {
    opacity: 0;
    -webkit-transform: translateX(100%);
  }
  100% {
    opacity: 1;
    -webkit-transform: translateX(0%);
  }
}
@-moz-keyframes cd-enter-right {
  0% {
    opacity: 0;
    -moz-transform: translateX(100%);
  }
  100% {
    opacity: 1;
    -moz-transform: translateX(0%);
  }
}
@keyframes cd-enter-right {
  0% {
    opacity: 0;
    -webkit-transform: translateX(100%);
    -moz-transform: translateX(100%);
    -ms-transform: translateX(100%);
    -o-transform: translateX(100%);
    transform: translateX(100%);
  }
  100% {
    opacity: 1;
    -webkit-transform: translateX(0%);
    -moz-transform: translateX(0%);
    -ms-transform: translateX(0%);
    -o-transform: translateX(0%);
    transform: translateX(0%);
  }
}
@-webkit-keyframes cd-enter-left {
  0% {
    opacity: 0;
    -webkit-transform: translateX(-100%);
  }
  100% {
    opacity: 1;
    -webkit-transform: translateX(0%);
  }
}
@-moz-keyframes cd-enter-left {
  0% {
    opacity: 0;
    -moz-transform: translateX(-100%);
  }
  100% {
    opacity: 1;
    -moz-transform: translateX(0%);
  }
}
@keyframes cd-enter-left {
  0% {
    opacity: 0;
    -webkit-transform: translateX(-100%);
    -moz-transform: translateX(-100%);
    -ms-transform: translateX(-100%);
    -o-transform: translateX(-100%);
    transform: translateX(-100%);
  }
  100% {
    opacity: 1;
    -webkit-transform: translateX(0%);
    -moz-transform: translateX(0%);
    -ms-transform: translateX(0%);
    -o-transform: translateX(0%);
    transform: translateX(0%);
  }
}
    </style>
	<script>
        jQuery(document).ready(function ($) {
            var timelines = $('.cd-horizontal-timeline'),
                eventsMinDistance = 500;

            (timelines.length > 0) && initTimeline(timelines);

            function initTimeline(timelines) {
                timelines.each(function () {
                    var timeline = $(this),
                        timelineComponents = {};
                    //cache timeline components 
                    timelineComponents['timelineWrapper'] = timeline.find('.events-wrapper');
                    timelineComponents['eventsWrapper'] = timelineComponents['timelineWrapper'].children('.events');
                    timelineComponents['fillingLine'] = timelineComponents['eventsWrapper'].children('.filling-line');
                    timelineComponents['timelineEvents'] = timelineComponents['eventsWrapper'].find('a');
                    timelineComponents['timelineDates'] = parseDate(timelineComponents['timelineEvents']);
                    timelineComponents['eventsMinLapse'] = minLapse(timelineComponents['timelineDates']);
                    timelineComponents['timelineNavigation'] = timeline.find('.cd-timeline-navigation');
                    timelineComponents['eventsContent'] = timeline.children('.events-content');

                    //assign a left postion to the single events along the timeline
                    setDatePosition(timelineComponents, eventsMinDistance);
                    //assign a width to the timeline
                    var timelineTotWidth = setTimelineWidth(timelineComponents, eventsMinDistance);
                    //the timeline has been initialize - show it
                    timeline.addClass('loaded');

                    //detect click on the next arrow
                    timelineComponents['timelineNavigation'].on('click', '.next', function (event) {
                        event.preventDefault();
                        updateSlide(timelineComponents, timelineTotWidth, 'next');
                    });
                    //detect click on the prev arrow
                    timelineComponents['timelineNavigation'].on('click', '.prev', function (event) {
                        event.preventDefault();
                        updateSlide(timelineComponents, timelineTotWidth, 'prev');
                    });
                    //detect click on the a single event - show new event content
                    timelineComponents['eventsWrapper'].on('click', 'a', function (event) {
                        event.preventDefault();
                        timelineComponents['timelineEvents'].removeClass('selected');
                        $(this).addClass('selected');
                        updateOlderEvents($(this));
                        updateFilling($(this), timelineComponents['fillingLine'], timelineTotWidth);
                        updateVisibleContent($(this), timelineComponents['eventsContent']);
                    });

                    //on swipe, show next/prev event content
                    timelineComponents['eventsContent'].on('swipeleft', function () {
                        var mq = checkMQ();
                        (mq == 'mobile') && showNewContent(timelineComponents, timelineTotWidth, 'next');
                    });
                    timelineComponents['eventsContent'].on('swiperight', function () {
                        var mq = checkMQ();
                        (mq == 'mobile') && showNewContent(timelineComponents, timelineTotWidth, 'prev');
                    });

                    //keyboard navigation
                    $(document).keyup(function (event) {
                        if (event.which == '37' && elementInViewport(timeline.get(0))) {
                            showNewContent(timelineComponents, timelineTotWidth, 'prev');
                        } else if (event.which == '39' && elementInViewport(timeline.get(0))) {
                            showNewContent(timelineComponents, timelineTotWidth, 'next');
                        }
                    });
                });
            }

            function updateSlide(timelineComponents, timelineTotWidth, string) {
                //retrieve translateX value of timelineComponents['eventsWrapper']
                var translateValue = getTranslateValue(timelineComponents['eventsWrapper']),
                    wrapperWidth = Number(timelineComponents['timelineWrapper'].css('width').replace('px', ''));
                //translate the timeline to the left('next')/right('prev') 
                (string == 'next')
                    ? translateTimeline(timelineComponents, translateValue - wrapperWidth + eventsMinDistance, wrapperWidth - timelineTotWidth)
                    : translateTimeline(timelineComponents, translateValue + wrapperWidth - eventsMinDistance);
            }

            function showNewContent(timelineComponents, timelineTotWidth, string) {
                //go from one event to the next/previous one
                var visibleContent = timelineComponents['eventsContent'].find('.selected'),
                    newContent = (string == 'next') ? visibleContent.next() : visibleContent.prev();

                if (newContent.length > 0) { //if there's a next/prev event - show it
                    var selectedDate = timelineComponents['eventsWrapper'].find('.selected'),
                        newEvent = (string == 'next') ? selectedDate.parent('li').next('li').children('a') : selectedDate.parent('li').prev('li').children('a');

                    updateFilling(newEvent, timelineComponents['fillingLine'], timelineTotWidth);
                    updateVisibleContent(newEvent, timelineComponents['eventsContent']);
                    newEvent.addClass('selected');
                    selectedDate.removeClass('selected');
                    updateOlderEvents(newEvent);
                    updateTimelinePosition(string, newEvent, timelineComponents, timelineTotWidth);
                }
            }

            function updateTimelinePosition(string, event, timelineComponents, timelineTotWidth) {
                //translate timeline to the left/right according to the position of the selected event
                var eventStyle = window.getComputedStyle(event.get(0), null),
                    eventLeft = Number(eventStyle.getPropertyValue("left").replace('px', '')),
                    timelineWidth = Number(timelineComponents['timelineWrapper'].css('width').replace('px', '')),
                    timelineTotWidth = Number(timelineComponents['eventsWrapper'].css('width').replace('px', ''));
                var timelineTranslate = getTranslateValue(timelineComponents['eventsWrapper']);

                if ((string == 'next' && eventLeft > timelineWidth - timelineTranslate) || (string == 'prev' && eventLeft < - timelineTranslate)) {
                    translateTimeline(timelineComponents, - eventLeft + timelineWidth / 2, timelineWidth - timelineTotWidth);
                }
            }

            function translateTimeline(timelineComponents, value, totWidth) {
                var eventsWrapper = timelineComponents['eventsWrapper'].get(0);
                value = (value > 0) ? 0 : value; //only negative translate value
                value = (!(typeof totWidth === 'undefined') && value < totWidth) ? totWidth : value; //do not translate more than timeline width
                setTransformValue(eventsWrapper, 'translateX', value + 'px');
                //update navigation arrows visibility
                (value == 0) ? timelineComponents['timelineNavigation'].find('.prev').addClass('inactive') : timelineComponents['timelineNavigation'].find('.prev').removeClass('inactive');
                (value == totWidth) ? timelineComponents['timelineNavigation'].find('.next').addClass('inactive') : timelineComponents['timelineNavigation'].find('.next').removeClass('inactive');
            }

            function updateFilling(selectedEvent, filling, totWidth) {
                //change .filling-line length according to the selected event
                var eventStyle = window.getComputedStyle(selectedEvent.get(0), null),
                    eventLeft = eventStyle.getPropertyValue("left"),
                    eventWidth = eventStyle.getPropertyValue("width");
                eventLeft = Number(eventLeft.replace('px', '')) + Number(eventWidth.replace('px', '')) / 2;
                var scaleValue = eventLeft / totWidth;
                setTransformValue(filling.get(0), 'scaleX', scaleValue);
            }

            function setDatePosition(timelineComponents, min) {
                for (i = 0; i < timelineComponents['timelineDates'].length; i++) {
                    var distance = daydiff(timelineComponents['timelineDates'][0], timelineComponents['timelineDates'][i]),
                        distanceNorm = Math.round(distance / timelineComponents['eventsMinLapse']) + 2;
                    timelineComponents['timelineEvents'].eq(i).css('left', distanceNorm * min + 'px');
                }
            }

            function setTimelineWidth(timelineComponents, width) {
                var timeSpan = daydiff(timelineComponents['timelineDates'][0], timelineComponents['timelineDates'][timelineComponents['timelineDates'].length - 1]),
                    timeSpanNorm = timeSpan / timelineComponents['eventsMinLapse'],
                    timeSpanNorm = Math.round(timeSpanNorm) + 15,
                    totalWidth = timeSpanNorm * width;
                timelineComponents['eventsWrapper'].css('width', totalWidth + 'px');
                updateFilling(timelineComponents['timelineEvents'].eq(0), timelineComponents['fillingLine'], totalWidth);

                return totalWidth;
            }

            function updateVisibleContent(event, eventsContent) {
                var eventDate = event.data('date'),
                    visibleContent = eventsContent.find('.selected'),
                    selectedContent = eventsContent.find('[data-date="' + eventDate + '"]'),
                    selectedContentHeight = selectedContent.height();

                if (selectedContent.index() > visibleContent.index()) {
                    var classEnetering = 'selected enter-right',
                        classLeaving = 'leave-left';
                } else {
                    var classEnetering = 'selected enter-left',
                        classLeaving = 'leave-right';
                }

                selectedContent.attr('class', classEnetering);
                visibleContent.attr('class', classLeaving).one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function () {
                    visibleContent.removeClass('leave-right leave-left');
                    selectedContent.removeClass('enter-left enter-right');
                });
                eventsContent.css('height', selectedContentHeight + 'px');
            }

            function updateOlderEvents(event) {
                event.parent('li').prevAll('li').children('a').addClass('older-event').end().end().nextAll('li').children('a').removeClass('older-event');
            }

            function getTranslateValue(timeline) {
                var timelineStyle = window.getComputedStyle(timeline.get(0), null),
                    timelineTranslate = timelineStyle.getPropertyValue("-webkit-transform") ||
                        timelineStyle.getPropertyValue("-moz-transform") ||
                        timelineStyle.getPropertyValue("-ms-transform") ||
                        timelineStyle.getPropertyValue("-o-transform") ||
                        timelineStyle.getPropertyValue("transform");

                if (timelineTranslate.indexOf('(') >= 0) {
                    var timelineTranslate = timelineTranslate.split('(')[1];
                    timelineTranslate = timelineTranslate.split(')')[0];
                    timelineTranslate = timelineTranslate.split(',');
                    var translateValue = timelineTranslate[4];
                } else {
                    var translateValue = 0;
                }

                return Number(translateValue);
            }

            function setTransformValue(element, property, value) {
                element.style["-webkit-transform"] = property + "(" + value + ")";
                element.style["-moz-transform"] = property + "(" + value + ")";
                element.style["-ms-transform"] = property + "(" + value + ")";
                element.style["-o-transform"] = property + "(" + value + ")";
                element.style["transform"] = property + "(" + value + ")";
            }

            //based on http://stackoverflow.com/questions/542938/how-do-i-get-the-number-of-days-between-two-dates-in-javascript
            function parseDate(events) {
                var dateArrays = [];
                events.each(function () {
                    var dateComp = $(this).data('date').split('/'),
                        newDate = new Date(dateComp[2], dateComp[1] - 1, dateComp[0]);
                    dateArrays.push(newDate);
                });
                return dateArrays;
            }

            function parseDate2(events) {
                var dateArrays = [];
                events.each(function () {
                    var singleDate = $(this),
                        dateComp = singleDate.data('date').split('T');
                    if (dateComp.length > 1) { //both DD/MM/YEAR and time are provided
                        var dayComp = dateComp[0].split('/'),
                            timeComp = dateComp[1].split(':');
                    } else if (dateComp[0].indexOf(':') >= 0) { //only time is provide
                        var dayComp = ["2000", "0", "0"],
                            timeComp = dateComp[0].split(':');
                    } else { //only DD/MM/YEAR
                        var dayComp = dateComp[0].split('/'),
                            timeComp = ["0", "0"];
                    }
                    var newDate = new Date(dayComp[2], dayComp[1] - 1, dayComp[0], timeComp[0], timeComp[1]);
                    dateArrays.push(newDate);
                });
                return dateArrays;
            }

            function daydiff(first, second) {
                return Math.round((second - first));
            }

            function minLapse(dates) {
                //determine the minimum distance among events
                var dateDistances = [];
                for (i = 1; i < dates.length; i++) {
                    var distance = daydiff(dates[i - 1], dates[i]);
                    dateDistances.push(distance);
                }
                return Math.min.apply(null, dateDistances);
            }

            /*
                How to tell if a DOM element is visible in the current viewport?
                http://stackoverflow.com/questions/123999/how-to-tell-if-a-dom-element-is-visible-in-the-current-viewport
            */
            function elementInViewport(el) {
                var top = el.offsetTop;
                var left = el.offsetLeft;
                var width = el.offsetWidth;
                var height = el.offsetHeight;

                while (el.offsetParent) {
                    el = el.offsetParent;
                    top += el.offsetTop;
                    left += el.offsetLeft;
                }

                return (
                    top < (window.pageYOffset + window.innerHeight) &&
                    left < (window.pageXOffset + window.innerWidth) &&
                    (top + height) > window.pageYOffset &&
                    (left + width) > window.pageXOffset
                );
            }

            function checkMQ() {
                //check if mobile or desktop device
                return window.getComputedStyle(document.querySelector('.cd-horizontal-timeline'), '::before').getPropertyValue('content').replace(/'/g, "").replace(/"/g, "");
            }
        });
    </script>
 
       <script type="text/javascript"> 
           $('#viewmenu').addClass('active');
           $('#listviewmenu').addClass('active');
       </script> 
</asp:Content> 