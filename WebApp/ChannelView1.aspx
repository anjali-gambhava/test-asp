<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ChannelView1.aspx.cs" Inherits="exam.ChannelView1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="NewLayout/css/styles.css" rel="stylesheet" />    <style>
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
    <%--<script type="text/javascript" src="https://cdn.jwplayer.com/libraries/5Rcp82Km.js"></script>--%>
	 <script src="<%=ResolveUrl("~/js/jwp8/jwplayer.js") %>" type="text/javascript">
	    </script>
    <script type="text/javascript">
        jwplayer.key = 'UeOwyRhgpc5Og22j+4YM7uzrcbTwxTV9r+XadsoRGr8=';
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="left">
        <div class="bg-light shadow flex-stretch border-b border-default p-xs">
            <table class="f-size-xxs">
                <tr>
                    <td class="pr-xs heading">
                        Search: 
                    </td>
                    <td class="pr-xs">
                        <div class="select">
                            <asp:DropDownList ID="ddlDistrict" runat="server"
                                AutoPostBack="True" Width="150px"
                                OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" CssClass="datalist border pr-md pl-xs py-xs">
                            </asp:DropDownList>
                        </div>
                    </td>
                    <td class="pr-xs">
                        <div class="select">
                            <asp:DropDownList ID="ddlAssembly" runat="server"
                                AutoPostBack="True" Width="150px"
                                OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" CssClass="datalist border pr-md pl-xs py-xs">
                            </asp:DropDownList>
                        </div>
                    </td>
                    <td class="pr-xs">
                        <div class="select">
                            <asp:DropDownList ID="ddlTimer" runat="server" ClientIDMode="Static" Width="150px" CssClass="datalist border pr-md pl-xs py-xs" onchange="ChangeTimer()">
                                <%--<asp:ListItem Value="15000" Text="15 Seconds"></asp:ListItem>--%>
                                <asp:ListItem Value="30000" Text="30 Seconds"></asp:ListItem>
                                <asp:ListItem Value="60000" Text="60 Seconds"></asp:ListItem>
                                <asp:ListItem Value="90000" Text="90 Seconds"></asp:ListItem>
                                <asp:ListItem Value="120000" Text="120 Seconds"></asp:ListItem>
                                <asp:ListItem Value="150000" Text="150 Seconds"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="container-fluid !direction !spacing">
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
                        <img src="images/logo_pv2022.png" alt="Punjab Votes 2022" height="200px" width="200px" />
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
    </div>
    <%--<script src="/js/jwplayer.8.24.0.js" type="text/javascript"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script type="text/JavaScript">
        var card1 = document.getElementById('card_1');
        var card2 = document.getElementById('card_2');
        var videoElement_1parent = document.getElementById('videoElement_1_parent');
        var videoElement_2parent = document.getElementById('videoElement_2_parent');
        var VehicleInfoList = <%=VehicleInfoList%>;

        $(card2).parent("div").hide();
        //$(card1).parent("div").attr("class", "col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12");
        //$(videoElement_1parent).width("85%")
        //$(videoElement_2parent).width("85%")

        //(function myLoop(i) {
        //    setTimeout(function() {

        //        console.log(i);
        //        console.log(VehicleInfoList[i].HlsUrl);

        //        jwplayer("videoElement_1").setup({ 
        //            "playlist": [{
        //                "file": VehicleInfoList[i].HlsUrl
        //            }],
        //            responsive: true,
        //            width: "100%",
        //        });
        //        document.getElementById("districtName").innerHTML = VehicleInfoList[i].District;
        //        document.getElementById("districtInstalled").innerHTML = VehicleInfoList[i].DistrictInstalled;
        //        document.getElementById("districtOnline").innerHTML = VehicleInfoList[i].DistrictOnline;
        //        document.getElementById("districtOffline").innerHTML = VehicleInfoList[i].DistrictOffline;

        //        document.getElementById("assembly").innerHTML = VehicleInfoList[i].Assembly;
        //        document.getElementById("assemblyInstalled").innerHTML = VehicleInfoList[i].AssemblyInstalled;
        //        document.getElementById("assemblyOnline").innerHTML = VehicleInfoList[i].AssemblyOnline;
        //        document.getElementById("assemblyOffline").innerHTML = VehicleInfoList[i].AssemblyOffline;

        //        document.getElementById("card_1_camaraID").innerHTML = VehicleInfoList[i].CamaraID;
        //        document.getElementById("card_1_staffMobileNo").innerHTML = VehicleInfoList[i].StaffMobileNo;
        //        document.getElementById("card_1_vehicleNo").innerHTML = VehicleInfoList[i].VehicleNo;
        //        document.getElementById("card_1_dist").innerHTML = VehicleInfoList[i].District;
        //        document.getElementById("card_1_ass").innerHTML = VehicleInfoList[i].Assembly;

        //        i++;

        //        if(i < VehicleInfoList.length && VehicleInfoList[i].DistrictId == VehicleInfoList[i-1].DistrictId) {
        //            console.log(i);
        //            console.log(VehicleInfoList[i].HlsUrl);
        //            card2.style.display = "block"                    
        //            jwplayer("videoElement_2").setup({ 
        //                "playlist": [{
        //                    "file": VehicleInfoList[i].HlsUrl
        //                }],
        //                responsive: true,
        //                    width: "100%",
        //            });

        //            document.getElementById("card_2_camaraID").innerHTML = VehicleInfoList[i].CamaraID;
        //            document.getElementById("card_2_staffMobileNo").innerHTML = VehicleInfoList[i].StaffMobileNo;
        //            document.getElementById("card_2_vehicleNo").innerHTML = VehicleInfoList[i].VehicleNo;
        //            document.getElementById("card_2_dist").innerHTML = VehicleInfoList[i].District;
        //            document.getElementById("card_2_ass").innerHTML = VehicleInfoList[i].Assembly;

        //            i++;
        //        }
        //        else{
        //            card2.style.display = "none"
        //        }
        //        console.log('here->>>>>>>>>>>>>>>' + i)
        //        if ((i + 1) == VehicleInfoList.length) { console.log(i); i = 0; myLoop(i); }
        //        if (i < VehicleInfoList.length) myLoop(i);


        //  }, 10000)
        //})(0);
        var i = 0;
        //console.log('First Line');
        //console.log(i);
        //console.log(VehicleInfoList[i].HlsUrl);

        jwplayer("videoElement_1").setup({
            "playlist": [{
                "file": VehicleInfoList[i].HlsUrl
            }],
            responsive: true,
            width: "100%",
            height: 500,
            logo: {
                file: "images/vmukti-New-H-2021-final.png",
                link: "http://www.vmukti.com/",
                linktarget: "_blank",
                position: "bottom-right"
            },
			autostart: true
        });
        document.getElementById("districtName").innerHTML = VehicleInfoList[i].District.length > 12 ? VehicleInfoList[i].District.substring(0, 9) + '...' : VehicleInfoList[i].District;
        document.getElementById("districtInstalled").innerHTML = VehicleInfoList[i].DistrictInstalled;
        document.getElementById("districtOnline").innerHTML = VehicleInfoList[i].DistrictOnline;
        document.getElementById("districtOffline").innerHTML = VehicleInfoList[i].DistrictOffline;

        document.getElementById("assembly").innerHTML = VehicleInfoList[i].Assembly.length > 27 ? VehicleInfoList[i].Assembly.substring(0, 24) + '...' : VehicleInfoList[i].Assembly;
        document.getElementById("assemblyInstalled").innerHTML = VehicleInfoList[i].AssemblyInstalled;
        document.getElementById("assemblyOnline").innerHTML = VehicleInfoList[i].AssemblyOnline;
        document.getElementById("assemblyOffline").innerHTML = VehicleInfoList[i].AssemblyOffline;

        document.getElementById("card_1_camaraID").innerHTML = VehicleInfoList[i].CamaraID;
        document.getElementById("card_1_staffMobileNo").innerHTML = VehicleInfoList[i].StaffName + " / " + VehicleInfoList[i].StaffMobileNo;
        document.getElementById("card_1_vehicleNo").innerHTML = VehicleInfoList[i].VehicleNo;
        document.getElementById("card_1_dist").innerHTML = VehicleInfoList[i].District.length > 12 ? VehicleInfoList[i].District.substring(0, 9) + '...' : VehicleInfoList[i].District;
        document.getElementById("card_1_ass").innerHTML = VehicleInfoList[i].Assembly.length > 12 ? VehicleInfoList[i].Assembly.substring(0, 9) + '...' : VehicleInfoList[i].Assembly;



        //if (i < VehicleInfoList.length && VehicleInfoList[i].DistrictId == VehicleInfoList[i - 1].DistrictId) {
        //    console.log(i);
        //    console.log(VehicleInfoList[i].HlsUrl);
        //    //card2.style.display = "block"
        //    $(card2).parent("div").show();
        //    //$(videoElement_1parent).width("85%")
        //    //$(videoElement_2parent).width("85%")
        //    //$(card1).parent("div").attr("class", "col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6");
        //    $(document.getElementById("card_1_dist")).attr("class", "data text-center");
        //    $(document.getElementById("card_1_disthead")).attr("class", "sub-heading text-center");
        //    $(document.getElementById("card_1_ass")).attr("class", "data text-center");
        //    $(document.getElementById("card_1_asshead")).attr("class", "sub-heading text-center");
        //    $(document.getElementById("card_1_staffMobileNo")).attr("class", "data text-center");
        //    $(document.getElementById("card_1_staffMobileNohead")).attr("class", "sub-heading text-center");
        //    $(document.getElementById("card_1_vehicleNo")).attr("class", "data text-center");
        //    $(document.getElementById("card_1_vehicleNohead")).attr("class", "sub-heading text-center");

        //    jwplayer("videoElement_2").setup({
        //        "playlist": [{
        //            "file": VehicleInfoList[i].HlsUrl
        //        }],
        //        responsive: true,
        //        width: "100%",
        //        logo: {
        //            file: "images/vmukti-New-H-2021-final.png",
        //            link: "http://www.vmukti.com/",
        //            linktarget: "_blank",
        //            position: "bottom-right"
        //        }
        //    });

        //    document.getElementById("card_2_camaraID").innerHTML = VehicleInfoList[i].CamaraID;
        //    document.getElementById("card_2_staffMobileNo").innerHTML = VehicleInfoList[i].StaffName + " / " + VehicleInfoList[i].StaffMobileNo;
        //    document.getElementById("card_2_vehicleNo").innerHTML = VehicleInfoList[i].VehicleNo;
        //    document.getElementById("card_2_dist").innerHTML = VehicleInfoList[i].District.length > 12 ? VehicleInfoList[i].District.substring(0, 9) + '...' : VehicleInfoList[i].District;
        //    document.getElementById("card_2_ass").innerHTML = VehicleInfoList[i].Assembly.length > 12 ? VehicleInfoList[i].Assembly.substring(0, 9) + '...' : VehicleInfoList[i].Assembly;

        //    i++;
        //}
        //else {
        //    //card2.style.display = "none"
        //    $(card2).parent("div").hide();
        //    //$(videoElement_1parent).width("85%")
        //    //$(videoElement_2parent).width("85%")
        //    //$(card1).parent("div").attr("class", "col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12");

        //    $(document.getElementById("card_1_dist")).attr("class", "data ");
        //    $(document.getElementById("card_1_disthead")).attr("class", "sub-heading col-4");
        //    $(document.getElementById("card_1_ass")).attr("class", "data");
        //    $(document.getElementById("card_1_asshead")).attr("class", "sub-heading col-4");
        //    $(document.getElementById("card_1_staffMobileNo")).attr("class", "data");
        //    $(document.getElementById("card_1_staffMobileNohead")).attr("class", "sub-heading col-4");
        //    $(document.getElementById("card_1_vehicleNo")).attr("class", "data");
        //    $(document.getElementById("card_1_vehicleNohead")).attr("class", "sub-heading col-4");
        //}
        new Chart("District", {
            type: "pie",
            data: {
                labels: ["Online", "Offline"],
                datasets: [{
                    backgroundColor: ["#188351", "#d53343"],
                    data: [VehicleInfoList[i].DistrictOnline, VehicleInfoList[i].DistrictOffline]
                }]
            },
            options: {
                responsive: false,
                scaleFontColor: "#FFFFFF",
                title: {
                    display: true,
                    text: VehicleInfoList[i].District
                }, legend: {
                    display: true
                }
            },

        });
        new Chart("State", {
            type: "pie",
            data: {
                labels: ["Online", "Offline"],
                datasets: [{
                    backgroundColor: ["#188351", "#d53343"],
                    data: [<%= StateOnlineTotle %>, <%= StateOfflineTotle %>]
                }]
            },
            options: {
                responsive: false,
                scaleFontColor: "#FFFFFF",
                title: {
                    display: true,
                    text: "PUNJAB"
                }, legend: {
                    display: true
                }
            }
        });

        i++;
        var interval;
        function ChangeTimer() {
            clearInterval(interval);
            interval = setInterval(function () {
                ListTrigger();
            }, $("#ddlTimer").val() == null || $("#ddlTimer").val() == undefined ? 15000 : $("#ddlTimer").val());
        }
        function ListTrigger() {
            //var timerval = $("#ddlTimer").val() == null || $("#ddlTimer").val() == undefined ? 15000 : $("#ddlTimer").val();
            if (i == VehicleInfoList.length) { document.location.reload(true) };
            //start_position: while (true) {
            //console.log('First Line');
            //console.log(i);
            //console.log(VehicleInfoList[i].HlsUrl);
            //if (i == VehicleInfoList.length) { i = 0; window.location.reload(); }

            jwplayer("videoElement_1").setup({
                "playlist": [{
                    "file": VehicleInfoList[i].HlsUrl
                }],
                responsive: true,
                width: "100%",
                height: 500,
                logo: {
                    file: "images/vmukti-New-H-2021-final.png",
                    link: "http://www.vmukti.com/",
                    linktarget: "_blank",
                    position: "bottom-right"
                },
				autostart: true
            });
            document.getElementById("districtName").innerHTML = VehicleInfoList[i].District.length > 12 ? VehicleInfoList[i].District.substring(0, 9) + '...' : VehicleInfoList[i].District;
            document.getElementById("districtInstalled").innerHTML = VehicleInfoList[i].DistrictInstalled;
            document.getElementById("districtOnline").innerHTML = VehicleInfoList[i].DistrictOnline;
            document.getElementById("districtOffline").innerHTML = VehicleInfoList[i].DistrictOffline;

            document.getElementById("assembly").innerHTML = VehicleInfoList[i].Assembly.length > 27 ? VehicleInfoList[i].Assembly.substring(0, 24) + '...' : VehicleInfoList[i].Assembly;
            document.getElementById("assemblyInstalled").innerHTML = VehicleInfoList[i].AssemblyInstalled;
            document.getElementById("assemblyOnline").innerHTML = VehicleInfoList[i].AssemblyOnline;
            document.getElementById("assemblyOffline").innerHTML = VehicleInfoList[i].AssemblyOffline;

            document.getElementById("card_1_camaraID").innerHTML = VehicleInfoList[i].CamaraID;
            document.getElementById("card_1_staffMobileNo").innerHTML = VehicleInfoList[i].StaffName + " / " + VehicleInfoList[i].StaffMobileNo;
            document.getElementById("card_1_vehicleNo").innerHTML = VehicleInfoList[i].VehicleNo;
            document.getElementById("card_1_dist").innerHTML = VehicleInfoList[i].District.length > 12 ? VehicleInfoList[i].District.substring(0, 9) + '...' : VehicleInfoList[i].District;
            document.getElementById("card_1_ass").innerHTML = VehicleInfoList[i].Assembly.length > 12 ? VehicleInfoList[i].Assembly.substring(0, 9) + '...' : VehicleInfoList[i].Assembly;

            //if (i < VehicleInfoList.length && VehicleInfoList[i].DistrictId == VehicleInfoList[i - 1].DistrictId) {//
            //    //console.log(i);
            //    //console.log(VehicleInfoList[i].HlsUrl);
            //    //card2.style.display = "block"
            //    $(card2).parent("div").show();
            //    //$(videoElement_1parent).width("85%")
            //    //$(videoElement_2parent).width("85%")
            //    //$(card1).parent("div").attr("class", "col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6");
            //    $(document.getElementById("card_1_dist")).attr("class", "data text-center");
            //    $(document.getElementById("card_1_disthead")).attr("class", "sub-heading text-center");
            //    $(document.getElementById("card_1_ass")).attr("class", "data text-center");
            //    $(document.getElementById("card_1_asshead")).attr("class", "sub-heading text-center");
            //    $(document.getElementById("card_1_staffMobileNo")).attr("class", "data text-center");
            //    $(document.getElementById("card_1_staffMobileNohead")).attr("class", "sub-heading text-center");
            //    $(document.getElementById("card_1_vehicleNo")).attr("class", "data text-center");
            //    $(document.getElementById("card_1_vehicleNohead")).attr("class", "sub-heading text-center");
            //    jwplayer("videoElement_2").setup({
            //        "playlist": [{
            //            "file": VehicleInfoList[i].HlsUrl
            //        }],
            //        responsive: true,
            //        width: "100%",
            //        logo: {
            //            file: "images/vmukti-New-H-2021-final.png",
            //            link: "http://www.vmukti.com/",
            //            linktarget: "_blank",
            //            position: "bottom-right"
            //        }
            //    });

            //    document.getElementById("card_2_camaraID").innerHTML = VehicleInfoList[i].CamaraID;
            //    document.getElementById("card_2_staffMobileNo").innerHTML = VehicleInfoList[i].StaffName + " / " + VehicleInfoList[i].StaffMobileNo;
            //    document.getElementById("card_2_vehicleNo").innerHTML = VehicleInfoList[i].VehicleNo;
            //    document.getElementById("card_2_dist").innerHTML = VehicleInfoList[i].District.length > 12 ? VehicleInfoList[i].District.substring(0, 9) + '...' : VehicleInfoList[i].District;
            //    document.getElementById("card_2_ass").innerHTML = VehicleInfoList[i].Assembly.length > 12 ? VehicleInfoList[i].Assembly.substring(0, 9) + '...' : VehicleInfoList[i].Assembly;
            //    i++;
            //}
            //else {
            //    //card2.style.display = "none"
            //    $(card2).parent("div").hide();
            //    //$(videoElement_1parent).width("85%")
            //    //$(videoElement_2parent).width("85%")
            //    //$(card1).parent("div").attr("class", "col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12");

            //    $(document.getElementById("card_1_dist")).attr("class", "data ");
            //    $(document.getElementById("card_1_disthead")).attr("class", "sub-heading col-4");
            //    $(document.getElementById("card_1_ass")).attr("class", "data ");
            //    $(document.getElementById("card_1_asshead")).attr("class", "sub-heading col-4");
            //    $(document.getElementById("card_1_staffMobileNo")).attr("class", "data ");
            //    $(document.getElementById("card_1_staffMobileNohead")).attr("class", "sub-heading");
            //    $(document.getElementById("card_1_vehicleNo")).attr("class", "data ");
            //    $(document.getElementById("card_1_vehicleNohead")).attr("class", "sub-heading ");
            //}



            //console.log(i);
            //console.log(VehicleInfoList.length);
            //console.log(i == VehicleInfoList.length + " " + "line 378");
            //if (i == VehicleInfoList.length) { i = 0; continue start_position;  }


            //break;
            //}
            //console.log("Last Line")
            new Chart("District", {
                type: "pie",
                data: {
                    labels: ["Online", "Offline"],
                    datasets: [{
                        backgroundColor: ["#188351", "#d53343"],
                        data: [VehicleInfoList[i].DistrictOnline, VehicleInfoList[i].DistrictOffline]
                    }]
                },
                options: {
                    responsive: false,
                    scaleFontColor: "#FFFFFF",
                    title: {
                        display: true,
                        text: VehicleInfoList[i].District
                    }, legend: {
                        display: true
                    }
                }
            });
            new Chart("State", {
                type: "pie",
                data: {
                    labels: ["Online", "Offline"],
                    datasets: [{
                        backgroundColor: ["#188351", "#d53343"],
                        data: [<%= StateOnlineTotle %>, <%= StateOfflineTotle %>]
                    }]
                },
                options: {
                    responsive: false,
                    scaleFontColor: "#FFFFFF",
                    title: {
                        display: true,
                        text: "PUNJAB"
                    }, legend: {
                        display: true
                    }
                }
            });
            i++;
        }
        interval = setInterval(function () {
            ListTrigger();
        }, $("#ddlTimer").val() == null || $("#ddlTimer").val() == undefined ? 15000 : $("#ddlTimer").val())

    </script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</asp:Content>
