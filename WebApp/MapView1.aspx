<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="MapView1.aspx.cs" Inherits="exam.MapView1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--    <script src="<%=ResolveUrl("~/js/jwp7/jwplayer.js") %>" type="text/javascript"></script>
<script type="text/javascript">
    jwplayer.key = '+Amzd6SXh2+L9OeORFc8SMH9bZZtyha7IZ/DPg==';
</script>--%>
    <%--<script src="<%=ResolveUrl("~/js/common.js") %>" type="text/javascript"></script>--%>
    <style>
        .wordwap1 {
            height: 100px;
            white-space: -moz-pre-wrap !important; /* Mozilla, since 1999 */
            white-space: -webkit-pre-wrap; /* Chrome & Safari */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            white-space: pre-wrap; /* CSS3 */
            word-wrap: break-word; /* Internet Explorer 5.5+ */
            word-break: break-all;
            white-space: normal;
        }

        .select:after {
            width: 0.7rem !important;
            height: 0.7rem !important;
        }

        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding: 0px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
        }

        /* Modal Content */
        .modal-content {
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,1.0);
            transition: 0.3s;
            width: 95%;
            border-radius: 0px;
        }

            .card:hover {
                background-color: cornsilk;
                box-shadow: 0 8px 16px 0 rgba(0,0,0,1.0);
            }

        .heading {
            font-size: 1.5rem;
            font-weight: 900;
            color: #0d6efd;
            letter-spacing: .025em;
            margin-bottom: 0.6rem;
            margin-top: 0.6rem;
            line-height: 1.2;
        }

        .sub-heading {
            font-size: 1.45rem;
            color: #6c757d;
            line-height: 1.2;
            margin-bottom: 0.3rem;
        }

        .data {
            font-size: 1.25rem;
            line-height: 1.2;
            margin-bottom: 0.5rem;
        }

        .container {
            padding: 2px 16px;
        }
    </style>
    <%--<script type="text/javascript" src="https://cdn.jwplayer.com/libraries/5Rcp82Km.js"></script>--%>
   <%-- <script src="/js/jwplayer.8.24.0.js" type="text/javascript"></script>--%>
     <script src="<%=ResolveUrl("~/js/jwp8/jwplayer.js") %>" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <section class="flex-auto flex-col">
        <div>
            <%-- class="container"--%>
            <div class="col-12 lg:col-12 pb-sm flex-col">
                <div class="bg-white shadow flex-stretch">
                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                                <%-- p-sm--%>
                                <div class="d-inline-block">
                                <table class="f-size-xxs">
                                    <tr>
                                        <td class="pr-xs">&nbsp;Search By</td>
                                        <td class="pr-xs">
                                            <div class="select">
                                                District
                                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="datalist border pr-md pl-xs py-xs" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Width="150px">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <div class="select">
                                                Assembly
                        <asp:DropDownList ID="ddlAssembly" runat="server" CssClass="datalist border pr-md pl-xs py-xs" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" Width="150px">
                        </asp:DropDownList>
                                            </div>
                                        </td>

                                    </tr>
                                </table>
                                    </div>
                                <div class="d-inline-block f-right mt-xs">
                                <table class="f-size-xxs">
                                    <tr>
                                        <td class="pr-xs">
                                            Total Configured: <span id="lblConfigured" style="color: darkblue;"></span>&nbsp;
                                            Online: <span id="lblOnline" style="color: green;"></span>&nbsp;
                                            Offline: <span id="lblOffline" style="color: red;"></span>&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                    </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="row-fluid">
                        <div class="panel panel-primary">
                            <%--  <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="10000" Enabled="false">
        </asp:Timer>--%>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="panel-body">
                                        <div class="embed-responsive embed-responsive-16by9">
                                            <div class="embed-responsive-item" id="MapArea" data-role="page">
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <%--  <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>--%>
                            </asp:UpdatePanel>
                        </div>
                        <div class='modal wow animated' tabindex='-1' style="visibility: visible;" id="modal_player">
                            <div class='modal-dialog modal-l'>
                                <div class='modal-content'>
                                    <div class='modal-header'>
                                        <button type='button' class='close1' data-dismiss='modal' aria-hidden='true'>
                                            &times;</button><h4 class='modal-title'>Location View
                                            </h4>
                                    </div>
                                    <div class='modal-body'>
                                        <div class='embed-responsive embed-responsive-16by9'>
                                            <div class='embed-responsive-item' id="playercontent">
                                                <div id="div_player">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">

            <div class="card" style="background: #FFFFFF">
                <div style="height: 20px; padding-right: 10px">
                    <span aria-hidden="true" class="close">&times;</span>
                </div>
                <br />
                <div class="embed-responsive embed-responsive-16by9 mr-thin" style="border-radius: 0px; margin: 0">
                    <div id="videoElement_6"></div>
                </div>
                <div class="container">
                    <div class="heading"></div>
                    <div class="flex-row flex-wrap -mr-sm">
                        <div class="col-12 md:col-4 col4">
                            <p class="sub-heading"><b>District</b></p>
                            <p class="data" id="modalDistrict"></p>
                        </div>
                        <div class="col-12 md:col-4 col4">
                            <p class="sub-heading"><b>Vehicle No</b></p>
                            <p class="data" id="modalVehicle"></p>
                        </div>
                        <div class="col-12 md:col-4 col4">
                            <p class="sub-heading"><b>Detail</b></p>
                            <p class="data" id="modalDetails">-</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="js/map_gps.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2CF3PlGBd0tQhusHwX3ngfPaad0pmJ_Q&callback=MapInit"></script>
    <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDet7e7zc2HH4WmSv8BhUaZVnqYmJugHxo&callback=MapInit"></script>--%>

    <script type="text/javascript">

        $('#modal_player').on('shown.bs.modal', function (e) {
            $("#playercontent").empty();
            $("<div id='div_player'></div>").appendTo($("#playercontent"));
        });
        $('#modal_player').on('hide.bs.modal', function (e) {
            $("#playercontent").empty();
        });
        //jwplayer("videoElement_6").setup({
        //    "playlist": [{
        //        "file": "https://media5.ambicam.com:443/live/SSAC-372098-BFCCD.m3u8"
        //    }],
        //    responsive: true,
        //    width: "100%",
        //    height: "150px",
        //});
    </script>
</asp:Content>
