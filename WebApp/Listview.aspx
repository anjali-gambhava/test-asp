<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Listview.aspx.cs" Inherits="exam.Listview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate> 
                         
     <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    

    <!-- Main content -->
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
                   <asp:TextBox ID="strm_txtBox" runat="server" AutoPostBack="true" CssClass="form-control"
                                                   Width="150px">
                                                </asp:TextBox>
                          </div>
                    <div class="form-group">
                  <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-block btn-primary"
                                                OnClick="btnsearch_Click" />
                          </div> 
                    
                <%--<div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>--%>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="max-height: 500px; overflow:auto">
               <%-- <table class="table table-head-fixed text-nowrap">
                 
                </table>--%>
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
                                                <asp:TemplateField HeaderText="Status"  HeaderStyle-CssClass="fixheader">
                                                    <ItemTemplate>
                                                        <%#Eval("status").ToString() == "RUNNING" ? "🟢" : Eval("status").ToString() == "STOPPED" ? "🔴" : "" %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                             
                                                <asp:TemplateField  HeaderStyle-CssClass="fixheader" HeaderText="View"  >
                                                    <ItemTemplate>
                                                        <a href="javascript:void(0)" id="lnkplay" runat="server"></a>
                                                        <div align="center" style="vertical-align: top; display: inline">
                                                            <a href="#" data-backdrop="static" title="View" data-title=" <%#Eval("acname") %>" data-content=" <%#Eval("location") %>"
                                                                style="color: #1499d6" onclick="watchvideopopup('<%# Eval("streamname") %>','<%# Eval("servername") %>','<%#exam.Common.Encode(Eval("statusFlag").ToString())%>','<%#exam.Common.Encode(Eval("bkpstreamid") == DBNull.Value ? "0" : Eval("bkpstreamid").ToString())%>');return false">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye">
                                                                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle>
                                                                </svg>
                                                                <%--<img width="31" height="31" src="images/play.png" alt="Play" />--%>
                                                                <%--<span class="icon mr-xs flex-none f-color-primary" title="Play">
                                                                <span class=""><i data-feather="play-circle"></i></span>
                                                            </span>--%>
                                                            </a>
                                                           <%-- <a href="http://<%# Eval("servername") %>.vmukti.com:8080/recordings/<%# Eval("streamname") %>.flv"
                                                                style="color: #1499d6">--%>
                                                            </div>
                                                       <%-- <div style="display: none;" id="ifc<%# Eval("streamname") %>">
                                                        </div>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderStyle-CssClass="fixheader" >
                                                    <ItemTemplate>
                                                        <%if (Session["userType"].ToString().ToLower() == "master_admin" || Session["userType"].ToString().ToLower() == "vmukti_internal" || Session["userType"].ToString().ToLower() == "district_level")
                                                            {%>
                                                        <div align="center" style="vertical-align: top; display: inline">
                                                            <a href="camerasetting.aspx?did=<%# Eval("streamname") %>&prourl=<%# Eval("prourl") %>" data-backdrop="static" title="Camera Settings" target="_blank" data-title=" <%#Eval("acname") %>" data-content=" <%#Eval("location") %>"
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
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div> 
      </div><!-- /.container-fluid -->
        <%--<div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">

                <div class="card" style="background: #FFFFFF">
                    <div style="height: 20px; padding-right: 10px">
                        <span aria-hidden="true" class="close">&times;</span>
                    </div>
                    <br />
                    <div class="embed-responsive embed-responsive-16by9 mr-thin" style="border-radius: 0px; margin: 0">
                       
                    </div>
                </div>
            </div>

        </div>--%>
    </section> 
         <div class="modal  wow fadeInUp animated" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content bg-secondary">
            <div class="modal-header" style="padding:0px 10px"> 
              <button type="button" onclick="ClosePopupAdd()" class="btnclose close cursor-pointer" id="btncancel" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
            </div>
            <div class="modal-body">
            <iframe id="iframevideo" frameborder="0" scrolling="no" width="100%" style="height:250px"></iframe>
            </div>
           <%-- <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-outline-light">Save changes</button>
            </div>--%>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
          


    <!-- /.content -->
  </div>
                             </ContentTemplate> 
                    </asp:UpdatePanel>
  <!-- /.content-wrapper -->
        <%--<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script> 
       <script src="<%=ResolveUrl("~/js/jwp8/jwplayer.js") %>" type="text/javascript"></script>  
    <script type="text/javascript">
        jwplayer.key = 'UeOwyRhgpc5Og22j+4YM7uzrcbTwxTV9r+XadsoRGr8=';
    </script>--%>
    <script type="text/javascript" >   
             var $j = jQuery.noConflict();
             function OpenPopupAdd() {
                 $j("#myModal").show();
             }
             function ClosePopupAdd() {
                 $j("#myModal").hide();
        } 
        function loadplayer(streamname, servername, flag, bkupstreamid) {
            debugger
            var hlsurl = "https://" + servername + '/live-record/' + streamname + ".m3u8";
            var playerInstance = jwplayer(streamname);
                 playerInstance.setup({
                     file: hlsurl,
                     stretching: 'exactfit',
                     autostart: true,
                     mute: false,
                     preload: 'none',
                     hlshtml: true,
                     allowscriptaccess: 'always',
                     autostart: true,
                     width: 640,
                     height: 360,
                     logo: {
                         file: "images/vmukti-New-H-2021-final.png",
                         link: "http://www.vmukti.com/",
                         linktarget: "_blank",
                         position: "bottom-right"
                     }
                 });
            playerInstance.on("error", function (event) {
                pl_flag = 1;
                $(".playerimage").show();
                //$(".jw-error-msg").html("Please wait... Loading camera feed ... ")
                $(".jw-error-msg").hide();
                //  playerInstance.setControls(false);
                clearTimeout();
                setTimeout(function () { playerInstance.stop(); playerInstance.play(true); }, 3000);

            });
            playerInstance.on("idle", function (event) {
                playerInstance.play(true);
                pl_flag = 1;
            });
            playerInstance.on("play", function (event) {
                $(".playerimage").hide();
                // playerInstance.setControls(false);
                if (pl_flag == 0) {

                    pl_flag = 1;
                }
                clearTimeout();
                playerInstance.play(true);
            }); 
             }

    </script>
       <script type="text/javascript"> 
           $('#viewmenu').addClass('active');
           $('#listviewmenu').addClass('active');
       </script>
</asp:Content>
