﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="exam.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .dashboardcard{
            pointer-events:none;
            color:#fff;
            font-weight:600
        }
        .dashboardcardper{
            pointer-events:none;
            color:#fff;
            float:right
        }
        .content-header {
    padding: 4px 0px;
}
        .row{
            margin-left:-15px;
            margin-right:-15px;
        }
        .small-box
        {
            margin-bottom:10px;
        }
        .p-r0{
            padding-right:0px;
        }
        .card{
            margin-bottom:5px;
        }
        .card-block
        {
            text-align:-webkit-center;
        }

        #news_slide{
height:190px; 
overflow:hidden;
}
.voxNews li{
margin-top:0px;
float:left;
margin-left:5px;
padding:0px;
} 
* {
  margin: 0;
  padding: 0;
} 
.products-outer {
    width: 100%;
    margin: 0px auto 0;
    border: 0px solid #444;
    padding: 0px 20px;
    overflow: hidden;
} 
.products-inner {
/*   width: 1156px; */
  position: relative;
/*   left: 0px; */
/*   transition: all; */
}
.product {
  display: inline;
}
.products-list .product-img img {
    height: 50px;
    width: 90px;
}
.products-list .product-info { 
    text-align: center;
}
.products-list>.item {
    padding: 5px 0;
}
    </style>
    <style type="text/css">
.table {
  border-collapse: collapse;
  
}

.table td, .table th {
  border: 1px solid #ddd;
  padding: 5px;
  text-align: center;
}

.table th {
  background-color: #f2f2f2;
  color: black;
}
.table td {  
    font-size:18px;
    font-weight:600;
}
        @media (min-width: 992px) {
            .dashboarddiv {
                flex: 0 0 16.50%;
                max-width: 16.50%;
            }
        }
    </style>  
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js" ></script> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
      <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js" defer></script>
    <style>
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
            /*border: 1px solid #888;*/
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
 #divImage
{
    display: none;
    z-index: 1000;
    position: fixed;
    top: 0;
    left: 0;
    background-color: White;
    height: 550px;
    width: 600px;
    padding: 3px;
    border: solid 1px black;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager> 
     
    
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
     <%-- <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->--%>
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
          <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
          <asp:Timer ID="Timer1" runat="server" Interval="60000" Enabled="true" OnTick="Timer1_Tick">
                        </asp:Timer>
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-lg-2 col-6 p-r0 dashboarddiv ">
            <!-- small box -->
            <div class="small-box" style="background-color:#ffc107;color:#fff">
              <div class="inner">
                 <h4 style="text-align:center"><a id="TotalStreamBooth" href="#" tabindex="0" runat="server" class="dashboardcard"></a>
               <a class="dashboardcardper" id="A2" href="#" tabindex="0" runat="server"></a></h4>
                <p style="text-align:center">Total Camera</p>
              </div>
             <div class="icon">
                <i class="fas fa-person-booth"></i>
              </div>
             <%--  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>--%>
            </div>
          </div>
               <div class="col-lg-2 col-6 p-r0 dashboarddiv ">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
               <h4><a id="livecount" href="#" tabindex="0" runat="server" class="dashboardcard"></a>
                <a class="dashboardcardper" id="livecountper" href="#" tabindex="0" runat="server"></a></h4> 
                <p style="text-align:center">Streaming Live</p>
              </div>
              <div class="icon">
               <i class="fa fa-video-camera"></i>
              </div>
             <%-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>--%>
            </div>
          </div>
             <div class="col-lg-2 col-6 p-r0 dashboarddiv ">
            <!-- small box -->
            <div class="small-box" style="background-color:#1c3480">
              <div class="inner">
                <h4><a id="connectedonce" href="#" tabindex="0" runat="server" class="dashboardcard"></a>
                <a class="dashboardcardper" id="connectedonceper" href="#" tabindex="0" runat="server"></a></h4> 
                <p style="text-align:center; color:#fff;">Live-Once</p>
              </div>
           <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <%--   <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>--%>
            </div>
          </div>
          <div class="col-lg-2 col-6 p-r0 dashboarddiv ">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h4><a id="lastonehours" href="#" tabindex="0" runat="server" class="dashboardcard"></a>
                <a class="dashboardcardper" id="lastonehoursper" href="#" tabindex="0" runat="server"></a></h4> 
                <p style="text-align:center">Online Last 60 Minutes</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
             <%-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>--%>
            </div>
          </div>
          <!-- ./col -->
           <div class="col-lg-2 col-6 p-r0 dashboarddiv ">
            <!-- small box -->
            <div class="small-box" style="background-color:#8092cb">
              <div class="inner">
                <h4><a id="lasttwohours" href="#" tabindex="0" runat="server" class="dashboardcard"></a>
                <a class="dashboardcardper" id="lasttwohoursper" href="#" tabindex="0" runat="server"></a></h4> 
                <p style="text-align:center; color:#fff">Online Last 120 Minutes</p>
              </div>
           <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <%--   <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>--%>
            </div>
          </div>
          <!-- ./col -->
       
           
          <!-- ./col -->
         <div class="col-lg-2 col-6 p-r0 dashboarddiv ">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                 <h4><a id="offlinecount" href="#" tabindex="0" runat="server" class="dashboardcard"></a>
                <a class="dashboardcardper" id="offlinecountper" href="#" tabindex="0" runat="server"></a></h4> 
                <p style="text-align:center">Inactive Cameras</p>
              </div>
             <div class="icon">
                <i class="fas fa-video-slash"></i>
              </div>
             <%--  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>--%>
            </div>
          </div>
          <!-- ./col -->

        </div>
        <!-- /.row -->
        <!-- Main row -->
           
       </ContentTemplate> 
                    </asp:UpdatePanel>
        <div class="row">
            
           <!-- Left col -->
          <section class="col-lg-6 connectedSortable p-r0">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-chart-line mr-1"></i>
                 Online Offline Camera Line Chart
                </h3>
                <div class="card-tools"> 
                </div>
              </div><!-- /.card-header -->
              <div class="card-body" style="padding:0px">
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div class="chart tab-pane active" id="revenue-chart"
                       style="position: relative; height: 300px;">
                     <%-- <canvas id="revenue-chart-canvas" height="300" style="height: 300px;"></canvas>--%>
                      <canvas id="Chart1" ></canvas>
                   </div>
                 
                </div>
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </section>
          <!-- /.Left col -->
          <!-- right col (We are only adding the ID to make the widgets sortable)-->
          <section class="col-lg-6 connectedSortable p-r0">

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-chart-bar mr-1"></i>
                 District Wise BarChart Camera Online Offline
                </h3>
                <div class="card-tools">
                  
                </div>
              </div><!-- /.card-header -->
              <div class="card-body" style="padding:0px">
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div class="chart tab-pane active" id="revenue-chart1"
                       style="position: relative; height: 300px;"> 
                      <canvas id="BarChart" width="590" height="270"></canvas>
                   </div> 
                </div>
              </div><!-- /.card-body -->
            </div>

             
          </section>

          <!-- right col -->
        </div>
         <%if (Session["userType"].ToString().ToLower() == "master_admin"  || Session["userType"].ToString().ToLower() == "vmukti_internal"  )
                                { %>
           <div class="row">
               <section class="col-lg-6 connectedSortable p-r0">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-chart-line mr-1"></i>
               Footfall Count Minutewise 
                </h3>
                <div class="card-tools">
                </div>
              </div><!-- /.card-header -->
              <div class="card-body" style="padding:0px">
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div class="chart tab-pane active" id="revenue-chart_1"
                       style="position: relative; height: 300px;">
                     <%-- <canvas id="revenue-chart-canvas" height="300" style="height: 300px;"></canvas>--%>
                      <canvas id="ImgChart" ></canvas>
                   </div>
                  <%--<div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                    <canvas id="sales-chart-canvas" height="300" style="height: 300px;"></canvas>
                  </div>--%>
                </div>
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </section>
                <section class="col-lg-6 connectedSortable p-r0">
                <div class="card" style="height:345px;overflow:auto">
              <div class="card-header">
                <h3 class="card-title">Viloation Report (Two person in pooling Area)</h3> 
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <ul class="products-list product-list-in-card pl-2 pr-2"> 
                    <%  if (notification.Tables[0].Rows.Count>0) {%>
             <%   for(int i = 0; i < notification.Tables[0].Rows.Count; i++) { %>
                  <!-- /.item -->
                  <li class="item">
                    <div class="product-img">
                      <%--<img src="dist/img/default-150x150.png" alt="Product Image" class="img-size-50">--%>
                          <a href="#" onclick="LoadDiv('<%=notification.Tables[0].Rows[i]["imgurl"]%>'); return false;">
                          <img src="<%=notification.Tables[0].Rows[i]["imgurl"]%>" alt="Product Image" class="img-size-50">
                        </a>
                    </div>
                    <div class="product-info">
                      <a href="javascript:void(0)" class="product-title">
                       <%=notification.Tables[0].Rows[i]["district"]%> 
                          <span class="badge badge-danger float-right"><%=notification.Tables[0].Rows[i]["sendtime"]%></span>
                        <br /><span class="badge badge-info float-right"><%=notification.Tables[0].Rows[i]["deviceid"]%>
                      </span>
                      </a>
                      <span class="product-description">
                        <%=notification.Tables[0].Rows[i]["bootinfo"]%>
                      </span>
                    </div>
                  </li> 
                    <%}%>
           <% } %>
                </ul>
              </div> 
            </div>
                    </section>
               </div>
           <% } %>
            <%if (Session["userType"].ToString().ToLower() == "master_admin" || Session["userType"].ToString().ToLower() == "ceo"
                   || Session["userType"].ToString().ToLower() == "vmukti_internal" )
                                { %>
              <div class="row" style="display:none"> 
                   <section class="col-lg-12 p-r0">
                       <div id="news_slide" class="products-outer">
     <ul class="voxNews products-inner"> 
        <%  if (gaugechart.Tables[0].Rows.Count>0) {%>
             <%   for(int i = 0; i < gaugechart.Tables[0].Rows.Count; i++) { %>
         <li>
             <div class="card">
                 <img src="images/District/<%=gaugechart.Tables[0].Rows[i]["district"]%>.png" alt="" class="card-img-top">
                 <div class="card-block" style="font-size: 14px">
                     <div class="table">
                         <table>
                             <tr>
                                 <th>Total</th>
                                 <th>Online</th>
                                 <th>Offline</th>
                             </tr>
                             <tr>
                                 <td style="color: chocolate"><%=gaugechart.Tables[0].Rows[i]["Total"]%></td>
                                 <td style="color: forestgreen"><%=gaugechart.Tables[0].Rows[i]["Online"]%></td>
                                 <td style="color: red"><%=gaugechart.Tables[0].Rows[i]["Offline"]%></td>
                             </tr>
                         </table>
                     </div>
                 </div>
             </div>
         </li>
         <%}%>
           <% } %>
                 
                                 </ul> 
                        </div>
                      </section>
                  </div> 
         <% } %>
      </div> 
          <div id="divBackground" class="modal">
</div>
<div id="divImage">
<table style="height: 100%; width: 100%">
    <tr>
        <td valign="middle" align="center">
            <img id="imgLoader" alt="" src="images/loader.gif" />
            <img id="imgFull" alt="" src="" style="display: none; height: 500px; width: 590px" />
        </td>
    </tr>
    <tr>
        <td align="center" valign="bottom">
            <input id="btnClose" class="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" type="button" value="close" onclick="HideDiv()" />
        </td>
    </tr>
</table>
</div>
            </div>

        </div>
    </section>
    <!-- /.content -->

  </div>sss
                           
    <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js" type="text/javascript"></script>
    
    <script type="text/javascript"> 
        var $j = jQuery.noConflict();
        var vox_news = 0;

        $j('.voxNews li').each(function () {
            vox_news += $j(this).outerWidth(true);
        });

        $j('.voxNews').parent().append($j('.voxNews').clone());
        function setupNews(w) {
            function phase1() {
                var voxNews = $j('.voxNews').first(),
                    curMargin = voxNews.css('margin-left').replace("px", ""),
                    animSpeed = (w * 100) - (Math.abs(curMargin) * 100);

                voxNews.animate({ 'margin-left': '-' + w + 'px' }, animSpeed, 'linear', phase2);
            }
            function phase2() {
                $j('.voxNews').first().css({ 'margin-left': '0px' });
                phase1();
            }
            $j('.voxNews img').hover(function () {
                $j('.voxNews').stop();
            }, function () {
                phase1();
            });
            phase1();
        }
        setupNews(vox_news);
        
       /* });*/
    </script>
    <%
                    var distList = string.Empty;
                    var chart2num = string.Empty;
                    var chart3num = string.Empty;
                    var chart4num = string.Empty;
                    var chart5num = string.Empty; 
                    for(int i = 0; i < BarGraph.Tables[0].Rows.Count; i++)
                    {
                        var row = BarGraph.Tables[0].Rows[i]; 
                        chart2num += "'" + row["online"].ToString() + "',";
                        chart2num += "'',";
                        chart3num += "'" + row["offline"].ToString() + "',";
                        chart3num += "'',";
                        distList += "'" + row[0].ToString() + "','',";  
                    }
                %> 
  
    <script type="text/javascript">
       
        const barCtx = document.getElementById('BarChart').getContext('2d');
        const barLabels = [<%= distList.Length > 0 ? distList.Remove(distList.Length - 1) : "" %> ];
        const barData = {
            labels: barLabels,
            datasets: [
                {
                    label: 'Online Camera',
                    data: [<%= chart2num.Length > 0 ? chart2num.Remove(chart2num.Length - 1) : "" %>],
                                    backgroundColor: "Green",
                                    barThickness: 7
                                },
                                {
                                    label: 'Offline Camera',
                                    data: [<%= chart3num.Length > 0 ? chart3num.Remove(chart3num.Length - 1) : ""%>],
                    backgroundColor: "Red",
                    barThickness: 7
                }
            ]
        };
        const barChart = new Chart(barCtx, {
            type: 'bar',
            data: barData,
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: ''
                    },
                },
                responsive: true,
                scales: {
                    xAxes: [{
                        stacked: true,
                    }],
                    yAxes: [{
                        stacked: true
                    }]
                }
            }
        });
        setInterval(function () {
            window.location.reload();
        }, 60000)
    </script>  

    <script type="text/javascript">
        $j(document).ready(function () {
            getData();
            getImgData();
        });
        //$(function () { 
        //    getData(); 
        //    setInterval(getImgData, 1000);
        function getData() {
            $.ajax({
                type: "POST",
                url: "Home.aspx/GetChartData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    populateChart(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + thrownError);
                }
            });
        }
        function populateChart(data) {
            var ctx = document.getElementById('Chart1').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: data.map(d => d.x),
                    datasets: [{
                        label: 'Online',
                        data: data.map(d => d.y),
                        backgroundColor: 'rgba(60, 179, 113)',
                        borderColor: 'rgba(60, 179, 113)',
                        borderWidth: 0.5
                        //,fill: 'origin'
                    },
                    {
                        
                        label: 'Offline',
                        data: data.map(d => d.y1),
                        backgroundColor: 'rgba(255,0,0)',
                        borderColor: 'rgba(255,0,0)',
                        borderWidth: 1
                        //, fill: 'origin'
                        }
                        ,
                        {

                            label: 'Live-Once',
                            data: data.map(d => d.y2),
                            backgroundColor: 'rgba(28,52,128)',
                            borderColor: 'rgba(28,52,128)',
                            borderWidth: 1
                            //, fill: 'origin'
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                stacked: true,
                                beginAtZero: true
                            }
                        }],
                        xAxes: [{
                            type: 'time',
                            time: {
                                unit: 'hour',
                                displayFormats: {
                                    hour: 'HH:mm'
                                }
                            },
                            ticks: {
                                source: 'data',
                                callback: function (value, index, values) {
                                    // Convert the value to a Date object
                                    var date = new Date(value);
                                    // Return the hour value as a string
                                    return date.getHours().toString();
                                }
                            }
                        }]

                    }
                }

            });
        } 

        function getImgData() {
            $.ajax({
                type: "POST",
                url: "Home.aspx/GetImgChartData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    populateimgChart(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + thrownError);
                }
            });
        }

        function populateimgChart(data) {
            var ctx = document.getElementById('ImgChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: data.map(d => d.x),
                    datasets: [{
                        label: 'Rajasthan',
                        data: data.map(d => d.y),
                        backgroundColor: 'rgba(60, 179, 113)',
                        borderColor: 'rgba(60, 179, 113)',
                        borderWidth: 0.5
                        //,fill: 'origin'
                    },
                        {

                            label: 'Ahmedabad',
                            data: data.map(d => d.y1),
                            backgroundColor: 'rgba(28,52,128)',
                            borderColor: 'rgba(28,52,128)',
                            borderWidth: 1
                            //, fill: 'origin' 
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                stacked: true,
                                beginAtZero: true
                            }
                        }],
                        xAxes: [{
                            type: 'time',
                            time: {
                                unit: 'hour',
                                displayFormats: {
                                    hour: 'HH:mm'
                                }
                            },
                            ticks: {
                                source: 'data',
                                callback: function (value, index, values) {
                                    // Convert the value to a Date object
                                    var date = new Date(value);
                                    // Format the hour value as desired (e.g., '12:00')
                                    var hour = date.getHours().toString().padStart(2, '0');
                                    var minutes = date.getMinutes().toString().padStart(2, '0');
                                    return hour + ':' + minutes;
                                }
                            }
                        }]

                    }
                }

            });
        }

    </script>
    <script type="text/javascript">
        function LoadDiv(url) {
            var img = new Image();
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            var imgLoader = document.getElementById("imgLoader");
            imgLoader.style.display = "block";
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
                imgLoader.style.display = "none";
            };
            img.src = url;
            var width = document.body.clientWidth;
            if (document.body.clientHeight > document.body.scrollHeight) {
                bcgDiv.style.height = document.body.clientHeight + "px";
            }
            else {
                bcgDiv.style.height = document.body.scrollHeight + "px";
            }
            imgDiv.style.left = (width - 650) / 2 + "px";
            imgDiv.style.top = "20px";
            bcgDiv.style.width = "100%";

            bcgDiv.style.display = "block";
            imgDiv.style.display = "block";
            return false;
        }
        function HideDiv() {
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            if (bcgDiv != null) {
                bcgDiv.style.display = "none";
                imgDiv.style.display = "none";
                imgFull.style.display = "none";
            }
        }


    </script>
     <script type="text/javascript"> 
         $('#dashboardmenu').addClass('active');
     </script>
                          
    </asp:Content>