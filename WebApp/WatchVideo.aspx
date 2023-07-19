<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WatchVideo.aspx.cs" Inherits="exam.WatchVideo" %>

<%@ Register TagPrefix="ucplayer" TagName="player" Src="~/Module/player.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv='cache-control' content='no-cache'>
    <meta http-equiv='expires' content='0'>
    <meta http-equiv='pragma' content='no-cache'>
    <title>Election Surveillance</title>

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/common.js") %>" type="text/javascript"></script>
	    <script src="<%=ResolveUrl("~/js/jwp8/jwplayer.js") %>" type="text/javascript"></script>
   <%-- <script src="<%=ResolveUrl("~/js/jwplayer.8.24.0.js") %>" type="text/javascript"></script>--%>
 <script src="<%=ResolveUrl("~/js/rtmp.js") %>" type="text/javascript"></script>
      <script type="text/javascript">
        jwplayer.key = 'UeOwyRhgpc5Og22j+4YM7uzrcbTwxTV9r+XadsoRGr8=';
      </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div style="margin-top: 5px">
            <ucplayer:player ID="playeritem" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
