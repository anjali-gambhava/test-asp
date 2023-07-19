<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deviceNotificationPopup.aspx.cs" Inherits="exam.deviceNotification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

          <link href="/css/multiselect.css" rel="stylesheet">
      <script src="/js/multiselect.min.js"></script>
             <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

   

    <style>
        .card {
          box-shadow: 0 4px 8px 0 rgba(0,0,0,1.0);
          transition: 0.3s;
          width: 95%;
          border-radius: 0px;
          padding:10px;
          margin-top:20px
        }
        .card:hover {
          background-color: cornsilk;
          box-shadow: 0 8px 16px 0 rgba(0,0,0,1.0);
        }
        .card1 {
          box-shadow: 0 4px 8px 0 rgba(0,0,0,1.0);
          transition: 0.3s;
          width: 95%;
          border-radius: 0px;
          padding:10px;
          margin-top:20px
        }
        .card1:hover {
          background-color:lavender;
          box-shadow: 0 8px 16px 0 rgba(0,0,0,1.0);
        }
        .heading{
            font-size: 1.5rem;
            font-weight: 900;
            color:#0d6efd;
            letter-spacing:.025em;
            margin-bottom: 0.6rem;
            margin-top: 0.6rem;
            line-height :1.2;
        }
        .data-bold {
            font-weight:bold
        }

        .sub-heading{
            font-size: 1.45rem;
            color:#6c757d;
            line-height :1.2;
            margin-bottom: 0.3rem;
        }
        .data{
            font-size: 1.25rem;
            line-height :1.2;
            margin-bottom: 0.5rem;
        }
        .container {
          padding: 2px 16px;
        }
       body{
    padding-bottom: 60px; 
  }
        .btn {
            background-color: #19cbfe;
            display: inline-block;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            border-top-color: transparent;
            border-right-color: transparent;
            border-bottom-color: transparent;
            border-left-color: transparent;
            padding: .375rem .75rem;
           font-weight: 600;
           color:white !important;
            line-height: 1.5;
            border-radius: .25rem;
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            font-family: Verdana,Arial,sans-serif;
            font-size: 1em; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div  id="divdata" class="divdata" style="display:block">
            
        </div>
    </form>
    <script>
        $(document).on('click', '.btnSave', function () {
            //save reason
            var nm = $(this).attr("data-digname");
            var vehicle = $(this).attr("data-vehicle");
            var duration = $(this).attr("data-duration");
            var id = $(this).attr("data-id");

            var selectedrsn = $('#resOpt' + id).val();
            if (selectedrsn == "")
                alert("Please select reason.")
            else {
                var result = confirm("Want to save '" + selectedrsn + "' for " + vehicle + " at " + duration + "?");

                if (result) {
                    // alert("saving")    
                    $.ajax({
                        type: "POST",
                        url: "DeviceNotifications.aspx/SaveReasons",
                        data: JSON.stringify({ "selectedReasons": selectedrsn.join(","), "strid": id }),
                        contentType: "application/json",
                        dataType: "json",
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                        },
                        success: function (result) {
                            //alert("closing==" + $(this).attr("dt-digname"))
                            // alert("We returned: " + result.d);
                            window.close();
                            //$("#" + nm).dialog("close");
                        }
                    });

                }
            }

            return false;

        });


        $(document).on('click', '.btnSaveCamera', function () {
            //save reason
            //save reason
            var nm = $(this).attr("data-digname");
            var vehicle = $(this).attr("data-vehicle");
            var duration = $(this).attr("data-duration");
            var id = $(this).attr("data-id");

            var selectedrsn = $('#resOpt' + id).val();
            if (selectedrsn == "")
                alert("Please select reason.")
            else {
                var result = confirm("Want to save '" + selectedrsn + "' for " + vehicle + " at " + duration + "?");

                if (result) {
                    // alert("saving")    
                    $.ajax({
                        type: "POST",
                        url: "OfflineCameraNotification.aspx/SaveReasons",
                        data: JSON.stringify({ "selectedReasons": selectedrsn.join(","), "id": id }),
                        contentType: "application/json",
                        dataType: "json",
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                        },
                        success: function (result) {
                            //alert("closing==" + $(this).attr("dt-digname"))
                            // alert("We returned: " + result.d);
                            window.close();
                            //$("#" + nm).dialog("close");
                        }
                    });

                }
            }

            return false;

        });
    </script>


</body>
</html>
