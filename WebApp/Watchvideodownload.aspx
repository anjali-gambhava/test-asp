<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Watchvideodownload.aspx.cs"
    Inherits="exam.Watchvideodownload" %>

<%@ Register TagPrefix="ucplayer" TagName="player" Src="~/Module/player6.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VMukti Election | VMukti Surveillance</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/common.js") %>" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $('#divviddownload').show();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div style="margin-top: 5px; display: block">
            <ucplayer:player ID="playeritem" runat="server" />
        </div>
        <div id="divviddownload" align="center">
            <a id="dwn_<%=streamname %>" href="#" download onclick="javascript:downloadvideo('<%=servername %>','<%=streamname %>','<%=stateid %>','<%=currentstateid %>');"
                class="btn btn-info btn-lg"><span class="glyphicon glyphicon-download-alt"></span>
                Download Video </a>
        </div>
    </div>
    </form>
</body>
</html>
