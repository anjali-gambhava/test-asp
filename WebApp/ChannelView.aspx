<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ChannelView.aspx.cs" Inherits="exam.ChannelView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      .text-white {
            color: white
        }

        .mycard {
            /*box-shadow: 0 4px 8px 0 rgba(0,0,0,1.0);
            transition: 0.3s;*/
            border: 0.1rem solid gray;
            margin: 0rem;
            max-width: 100%;
        }

            .mycard:hover {
                /*background-color: cornsilk;*/
                box-shadow: 0 8px 16px 0 rgba(0,0,0,1.0);
            }

        .heading {
            font-size: 2rem;
            font-weight: 800;
            color: #0d6efd;
            letter-spacing: .025em;
            margin-bottom: 0.6rem;
            margin-top: 0.6rem;
            line-height: 1.2;
        }

        .sub-heading {
            font-size: 1.7rem;
            color: #6c757d;
            line-height: 1.2;
            margin-bottom: 0.3rem;
        }

        .data {
            font-size: 1.7rem;
            line-height: 1.2;
            margin-bottom: 0.5rem;
        }

        .mycontainer {
            padding: 2px 16px;
        }

        h4 {
            font-size: 55px;
            font-weight: 900;
        }

        .display-4 {
            font-size: 3rem !important;
            font-weight: bold !important;
        }

        .card-title {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-header {
            padding: .3rem 1rem
        }

        h1 {
            font-size: 2.5rem
        }

        h4 {
            font-size: 2.5rem !important
        }
    </style> 
	 <script src="<%=ResolveUrl("~/js/jwp8/jwplayer.js") %>" type="text/javascript">
	    </script>
    <script type="text/javascript">
        jwplayer.key = 'UeOwyRhgpc5Og22j+4YM7uzrcbTwxTV9r+XadsoRGr8=';
       
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script> 
    <script type="text/javascript" >
        $(document).ready(function () {
            $('#sidebarmini1').prop('checked', false);
            if ($('body').hasClass('sidebar-mini')) {
                $('body').removeClass('sidebar-mini')
            }
            else {
                $('body').addClass('sidebar-mini')
            }

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper" style="background-color:#454d55">
        <section class="content">
      <div class="container-fluid">
        
        <div class="row" style="margin-right:-22px">
          <div class="col-12" style="padding:2px">
            <div class="card" style="background-color:#454d55"> 
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
                            <asp:DropDownList ID="ddlTimer" runat="server" ClientIDMode="Static" Width="150px" CssClass="form-control" onchange="ChangeTimer()">
                                <%--<asp:ListItem Value="15000" Text="15 Seconds"></asp:ListItem>--%>
                                <asp:ListItem Value="30000" Text="30 Seconds"></asp:ListItem>
                                <asp:ListItem Value="60000" Text="60 Seconds"></asp:ListItem>
                                <asp:ListItem Value="90000" Text="90 Seconds"></asp:ListItem>
                                <asp:ListItem Value="120000" Text="120 Seconds"></asp:ListItem>
                                <asp:ListItem Value="150000" Text="150 Seconds"></asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12 col-md-2 col-lg-2 col-xl-2 col-xxl-2 d-flex align-content-center flex-column justify-content-start">
                <div class="row">


                    <div class="col-12">
                        <div class="card mycard text-dark bg-warning" style="min-width: 30%; min-height: 16vh;">
                            <div class="card-header">
                                <h1 class="text-center text-white">STATE</h1>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center" style="height: 75px">
                                <h1 class="card-title text-center display-4 bg-light" style="font-size: 2rem!important">PUNJAB</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card mycard text-dark bg-info" style="max-width: 100%; min-height: 10vh;">

                            <div class="card-header">
                                <h1 class="text-center text-white">INSTALLED</h1>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title text-center bg-light f-size-1xl"><%= StateTotle %></h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card mycard text-dark bg-success" style="max-width: 100%; min-height: 10vh;">
                            <div class="card-header">
                                <h1 class="text-center text-white">ONLINE</h1>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title text-center bg-light f-size-1xl"><%= StateOnlineTotle %></h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card mycard text-dark bg-danger" style="max-width: 100%; min-height: 10vh;">
                            <div class="card-header">
                                <h1 class="text-center text-white">OFFLINE</h1>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title text-center bg-light f-size-1xl"><%= StateOfflineTotle %></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 pt-2xs" style="">
                        <canvas id="State" class="f-size-xl" width="220" height="170" style="display:none;"></canvas>
                        <img src="images/ECI-Logo.jpg" alt="CEO Punjab" height="200px" width="200px" />
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8 col-xxl-8  d-flex align-content-center flex-column justify-content-start"><%--style="margin: auto"--%>
                <div class="row d-flex align-content-center justify-content-center">
                    <%--<div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6">--%>
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12 align-content-center flex-column justify-content-start">
                        <div class="mycard" id="card_1">
                            <div id="videoElement_1_parent" style="border-radius: 0px; margin: 0; background-color: black; margin: auto; width: 100%;">
                                <div id="videoElement_1" style=""></div>
                            </div>
                            <div class="mycontainer">
                                <h6 class="heading text-center"><span id="card_1_dist"></span>/ <span id="card_1_ass"></span></h6>
                                <div class="row">
                                    <div class="col-3 row">
                                        <h5 class="sub-heading text-center">VehicleNo</h5>
                                        <h6 class="data text-center" id="card_1_vehicleNo"></h6>
                                    </div>
                                    <div class="col-5 row">
                                        <h5 class="sub-heading text-center">Driver ContactNo</h5>
                                        <h6 class="data text-center" id="card_1_staffMobileNo"></h6>
                                    </div>
                                    <div class="col-4 row">
                                        <h5 class="sub-heading text-center">Camera Id</h5>
                                        <h6 class="data text-center" id="card_1_camaraID">AMWF-001804-JGVPB</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6 align-content-center flex-column justify-content-start">
                        <div class="mycard" id="card_2">
                            <div style="border-radius: 0px; margin: 0; background-color: black; margin: auto; width: 100%;">
                                <div id="videoElement_2" style=""></div>
                            </div>
                            <div class="mycontainer">
                                <h6 class="heading text-center"><span id="card_2_dist"></span>/ <span id="card_2_ass"></span></h6>
                                <div class="row">
                                    <div class="col-3">
                                        <h5 class="sub-heading text-center">Vehicle No</h5>
                                        <h6 class="data text-center" id="card_2_vehicleNo">GJ01D54896 </h6>
                                    </div>
                                    <div class="col-5">
                                        <h5 class="sub-heading text-center">Mobile No</h5>
                                        <h6 class="data text-center" id="card_2_staffMobileNo">7874804852 </h6>
                                    </div>
                                    <div class="col-4">
                                        <h5 class="sub-heading text-center">Camera Id</h5>
                                        <h6 class="data text-center" id="card_2_camaraID">AMWF-001804-JGVPB</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-2 col-lg-2 col-xl-2 col-xxl-2 align-content-center flex-column justify-content-start">
                <div class="row">
                    <div class="col-12">
                        <div class="card mycard text-dark bg-warning" style="max-width: 100%; min-height: 10vh;">
                            <div class="card-header">
                                <h1 class="text-center text-white">DISTRICT</h1>
                            </div>
                            <div class="card-body" style="height: 75px">
                                <h1 class="card-title text-center bg-light" id="districtName" style="font-size: 2rem"></h1>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card mycard text-dark bg-info" style="max-width: 100%; min-height: 10vh;">
                            <div class="card-header">
                                <h1 class="text-center text-white">INSTALLED</h1>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title text-center bg-light f-size-1xl" id="districtInstalled">0</h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card mycard text-dark bg-success" style="max-width: 100%; min-height: 10vh;">
                            <div class="card-header">
                                <h1 class="text-center text-white">ONLINE</h1>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title text-center bg-light f-size-1xl" id="districtOnline">0</h4>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card mycard text-dark bg-danger " style="max-width: 100%; min-height: 10vh;">
                            <div class="card-header">
                                <h1 class="text-center text-white">OFFLINE</h1>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title text-center bg-light f-size-1xl" id="districtOffline">0</h4>
                            </div>
                        </div>
                    </div>
                 <div class="col-12 pt-2xs" style="">
                        <canvas id="District" class="f-size-xl" width="220" height="170" style="display:none;"></canvas>
                        <img src="images/ECI-Logo.jpg" alt="Punjab Votes 2022" height="200px" width="200px" />
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6 d-flex align-items-stretch">
                    <div class="card mycard text-dark bg-warning" style="min-width: 100%;">
                        <div class="card-header">
                            <h1 class="text-center text-white">Assembly</h1>
                        </div>
                        <div class="card-body d-flex align-items-center justify-content-center">
                            <h1 class="card-title text-center bg-light" id="assembly"></h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-2 col-xl-2 col-xxl-2">
                    <div class="card mycard text-dark bg-info" style="max-width: 100%;">
                        <div class="card-header">
                            <h1 class="text-center text-white">Installed</h1>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title text-center bg-light f-size-1xl" id="assemblyInstalled">0</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-2 col-xl-2 col-xxl-2">
                    <div class="card mycard text-dark bg-success" style="max-width: 100%;">
                        <div class="card-header">
                            <h1 class="text-center text-white">Online</h1>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title text-center bg-light f-size-1xl" id="assemblyOnline">0</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-2 col-xl-2 col-xxl-2">
                    <div class="card mycard text-dark bg-danger" style="max-width: 100%;">
                        <div class="card-header">
                            <h1 class="text-center text-white">Offline</h1>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title text-center bg-light f-size-1xl" id="assemblyOffline">0</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                </section>
        </div>
</asp:Content>
