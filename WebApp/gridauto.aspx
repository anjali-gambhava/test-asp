<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="gridauto.aspx.cs" Inherits="exam.gridauto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="js/clapper/clappr.min.js"></script>
    <script src="js/clapper/main.js"></script>
    <script src="js/clapper/ace.js"></script>--%>
    <script type="text/javascript">
        var lastfocusedElementId = "";
        function pageLoad() {
            $('[data-toggle="popover"]').popover();

            $(document).click(function (e) {
                $('[data-toggle="popover"]').each(function () {
                    if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                        $(this).popover('hide');
                        lastfocusedElementId = "";
                    }
                });
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
  
        <div class="embed-responsive embed-responsive-16by9" id="fldiv">
            <iframe id="iframe1" src="iframegrid.aspx" class="embed-responsive-item" width="100%"
                height="100%" scrolling="auto" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
        </div>
    </div>
    
</asp:Content>
