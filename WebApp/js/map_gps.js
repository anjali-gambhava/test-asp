var mapOptions;
var map;
var markerStore = {};

var map_type;
var tm_str;
var array_path = {};
var infoWindow;
var c_code;
function pageLoad() {


}
function MapInit() {
    markerStore = {};

    mapOptions = {
        zoom: 7,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("MapArea"), mapOptions);
    infoWindow = new google.maps.InfoWindow();
}
function zoomToObject(obj) {

    var bounds = new google.maps.LatLngBounds();
    var points = obj.getPath().getArray();
    for (var n = 0; n < points.length; n++) {
        bounds.extend(points[n]);
    }
    map.fitBounds(bounds);
}
function myStopFunction() {
    clearTimeout(tm_str);
}
function formatDate(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear() + " " + strTime;
}
function LoadLocation(location, flag) {
    c_code = location;
    if (flag == 0) {
        myStopFunction();
        markerStore = {};

        array_path = {};
        MapInit();


    }
    $.ajax({
        type: "POST",
        url: "MapView.aspx/LoadMap",
        data: '{d: "' + c_code + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            debugger
            var j = jQuery.parseJSON(r.d);
            var markers = j.Table;
            var status = j.Table1;
            if (status == undefined || status.length == 0) {
                $("#lblConfigured").html("0");
                $("#lblOnline").html("0");
                $("#lblOffline").html("0");
            }
            if (status != undefined) {
                if (status.length > 0) {
                    $("#lblConfigured").html(status[0].Configured);
                    $("#lblOnline").html(status[0].Online);
                    $("#lblOffline").html(status[0].Offline);
                }
            }
            console.log(r)
            console.log(j)

            if (markers == undefined || markers.length == 0) {
                var myLatlng = new google.maps.LatLng(25.6767, 76.6941);
                map.set("center", myLatlng);
            }
            if (markers != undefined) {
                for (var i = 0; i < markers.length; i++) {
                    debugger
                    var data = markers[i];
                    //if (data.latitude != 0 && data.longitude != 0) {
                     var latitude = parseFloat(data.latitude) + (i * 0.000001); // Add a small variation to latitude
                      var longitude = parseFloat(data.longitude) + (i * 0.000001); // Add a small variation to longitude

                    if (markerStore.hasOwnProperty(data.id)) {
                        markerStore[data.id].setPosition(new google.maps.LatLng(data.latitude, data.longitude));
                        var markerimage = data.status == "RUNNING" ? 'images/MapImages/car-green.png' : 'images/MapImages/car-red.png';
                        markerStore[data.id].setIcon(markerimage);
                    }
                    else {
                        debugger
                        console.log("latitude " + data.latitude)
                        console.log("longitude " + data.longitude)
                       // var myLatlng2 = new google.maps.LatLng(data.latitude, data.longitude);
                        var myLatlng2 = new google.maps.LatLng(latitude, longitude);
                        var markerimage = data.status == "RUNNING" ? 'images/MapImages/car-green.png' : 'images/MapImages/car-red.png';
                        var marker2 = new google.maps.Marker({
                            position: myLatlng2,
                            map: map,
                            info: data,
                            title: data.PSNum + ',' + data.location,
                            icon: markerimage
                        });
                        //marker2.addListener("click", () => {
                        //   // LoadPlayer(data);
                        //});
                        //if (data.latitude != 0 && data.longitude != 0)
                        //{
                        //    map.set("center", new google.maps.LatLng(30.4010, 77.2573));
                        //}
                        //else {
                        if (i == 0 && flag == 0) {
                            map.set("center", myLatlng2);
                        }
                        //}

                        var _d = new Date();
                        if (typeof data.UpdateDatetime === "undefined") {

                        }
                        else {
                            _d = new Date(data.UpdateDatetime);
                        }
                        _d = formatDate(_d);


                        (function (marker2, data) {
                            var infocontent = "<div class='panel panel-primary'><div class='panel-heading'>" + data.ACNum + "/" + data.PSNum + "</div> <div class='panel-body'>" + data.displayname + "<br/>" + data.displayMobile + "<br/>Last Updated :" + _d + "</div></div>";
                            google.maps.event.addListener(marker2, "click", function (e) {
                                if (marker2.icon == 'images/red.png') {
                                    infoWindow.setContent(infocontent);
                                    infoWindow.open(map, marker2);
                                } else {
                                    debugger
                                    //  infocontent = "<div class='panel panel-primary'><div class='panel-heading'>" + marker2.info.ACNum + "/" + data.PSNum + "</div> <div class='panel-body'><div class='embed-responsive embed-responsive-16by9'><div class='embed-responsive-item' id='div_player'><div id='mplayer'></div></div></div>";
                                    // infoWindow.setContent(infocontent);
                                    //infoWindow.open(map, marker2);
                                    /*$('#modal_player').modal('show');*/
                                    //LoadlivePlayer7_Map(marker2.info.videoname, marker2.info.cdnsvc, "div_player");
                                    LoadPlayer(marker2.info);
                                }
                            });
                        })(marker2, data);
                        //  marker2.setMap(map);
                        markerStore[data.id] = marker2;

                    }
                    //}
                    if (flag == 0) {

                        flag = 1;
                    }
                }
            }
        }, error: function (err) {
            console.log(err.responseText);
        }

    });

    function LoadPlayer(data) {
        //  var modal = document.getElementById("myModal");
        $("#myModal").show();
        //var span = document.getElementsByClassName("close")[0];
        if (flvjs.isSupported()) {
            var videoElement = document.getElementById('videoElement_6');
            var flvurl = 'wss://' + data.cdnsvc + '/live-record/' + data.videoname + '.flv';
            var flvPlayer = flvjs.createPlayer({
                type: 'flv',
                url: flvurl
            });
            flvPlayer.attachMediaElement(videoElement);
            flvPlayer.load();
            flvPlayer.play();
            var zoomLevel = 1;
            videoElement.addEventListener('wheel', function (event) {
                if (event.deltaY < 0) {
                    zoomLevel += 0.1;
                } else if (event.deltaY > 0) {
                    if (zoomLevel != 1)
                        zoomLevel -= 0.1;
                }
                videoElement.style.transform = 'scale(' + zoomLevel + ')';
            });
        }
        document.getElementById("modalacname").innerHTML = data.acname;
        document.getElementById("modalpsnum").innerHTML = data.PSNum;
        document.getElementById("modalvideoname").innerHTML = data.videoname;
        modal.style.display = "block";
        span.onclick = function () {
            modal.style.display = "none";
            // jwplayer('videoElement_6').remove();
        }

        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
                // jwplayer('videoElement_6').remove();
            }
        }
    }
    tm_str = setTimeout(function () { LoadLocation(location, 1) }, 30000000);
    
}
