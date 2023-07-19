<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" 
    CodeBehind="GridView.aspx.cs" Inherits="exam.GridView" %>
<%@ Register TagPrefix="ucplayer" TagName="player" Src="~/Module/player.ascx" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <%--<script src="<%=ResolveUrl("~/js/flv.min.js") %>" type="text/javascript"></script> --%>
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
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script> 
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
                    <div class="form-group">
                  <asp:DropDownList ID="ddlgrid" runat="server" CssClass="form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlgrid_SelectedIndexChanged">
                                                <asp:ListItem Value="3x2">3x2</asp:ListItem> 
                                                <asp:ListItem Value="1x2">1x2</asp:ListItem>
                                                <asp:ListItem Value="2x1">2x1</asp:ListItem>
                                                <asp:ListItem Value="2x2">2x2</asp:ListItem>
                                                <asp:ListItem Value="3x3">3x3</asp:ListItem>
                                                <asp:ListItem Value="4x3">4x3</asp:ListItem>
                                                <asp:ListItem Value="4x4">4x4</asp:ListItem>
                                                <asp:ListItem Value="6x4">6x4</asp:ListItem>
                                          
                                            </asp:DropDownList>
                          </div>
                    <div class="form-group">
                  <asp:DropDownList ID="ddlTimer" runat="server" CssClass="form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlTimer_SelectedIndexChanged">
                                                <asp:ListItem Value="45000">45 Seconds</asp:ListItem> 
                                                <asp:ListItem Value="90000">90 Seconds</asp:ListItem>
                                                <asp:ListItem Value="120000">120 Seconds</asp:ListItem>
                                                <asp:ListItem Value="150000">150 Seconds</asp:ListItem>
                                                  <asp:ListItem Value="0">NONE</asp:ListItem>
                                                
                                            </asp:DropDownList>
                          </div>
                    
              </div>
                             </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="ddlDistrict" />
                                    <asp:PostBackTrigger ControlID="ddlAssembly" />
                                    <asp:PostBackTrigger ControlID="ddlgrid" />
                                    <asp:PostBackTrigger ControlID="ddlTimer" />
                                </Triggers>
                                </asp:UpdatePanel>
                 <asp:Timer ID="Timer1" runat="server" Interval="45000" OnTick="Timer1_Tick" Enabled="true">
    </asp:Timer>
                 
                  <div class="col-12 row" style="padding:0px">
            <asp:ListView ID="listview1" runat="server">
                                        <ItemTemplate> 
                                              <div class="col-<%=12/gridcolumns %> pb-xs" style="padding:2px">
                                                <div class="card" style="margin-bottom:1px" >
                                                   <ucplayer:player ID="playeritem" runat="server" playerURL='<%#Bind("servername") %>'
                                                    playerid='<%# string.Concat(Container.DataItemIndex.ToString(), "_", Eval("streamname"))%>'
                                                    flag='<%#Bind("statusFlag") %>' sid='<%#Bind("id") %>' streamnamebkp='<%#Bind("streamnamebkp") %>'
                                                     accode='<%#Bind("accode") %>' psnum='<%#Bind("PSNum") %>' kbps='<%#Bind("kbpsp") %>'
                                                      mobno='<%#Bind("OperatorNumber") %>' /> 
                                                       <div class="px-thin" style="position:relative;background:#000; font-size:12px">
                                                             <div class="col-12 md:col-12 col12">
                                                               <p class="data word-break-all" style="margin-bottom:0px">
                                        <span style="color: red;"><%#(Eval("district").ToString()) %>,</span> /
                                        <span style="color: #FFF;"><%#(Eval("acname").ToString()) %>,</span>
                                       <span style="color: #09f909;"><%#(Eval("PSNum").ToString()) %>,</span>
                                        (<span style="color: #09f909;" title='<%# Eval("location") %>'><%#(Eval("location").ToString().Length >15 ? Eval("location").ToString().Substring(0,10) + "...": Eval("location").ToString()) %></span>)
                                        -<span style="color: #07f5b3;"title='<%# Eval("streamname") %>'><%#(Eval("streamname").ToString().Length >18 ? Eval("streamname").ToString().Substring(0,17) + "...": Eval("streamname").ToString()) %></span>
                                        </p>
                                                      </div>  
                                                                    </div>
                                                      </div> 
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
     <script type="text/javascript"> 
         $('#viewmenu').addClass('active');
         $('#gridviewmenu').addClass('active');
     </script>
</asp:Content>