<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="camerasetting.aspx.cs"
    Inherits="exam.camerasetting" Async="true" ViewStateEncryptionMode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=ResolveUrl("~/js/jquery.js") %>"></script>
    <script src="<%=ResolveUrl("~/js/bootstrap.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/js/common.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
            if (parent) {
                var oHead = document.getElementsByTagName("head")[0];
                var arrStyleSheets = parent.document.getElementsByTagName("style");
                for (var i = 0; i < arrStyleSheets.length; i++)
                    oHead.appendChild(arrStyleSheets[i].cloneNode(true));
            }
        }
              
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scriptmanager_1" runat="server" ScriptMode="Release">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepanelsetting" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <%-- <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick" Enabled="false">
            </asp:Timer>--%>
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="text-left modal-title" id="myTab">
                        <i class="fa fa-cog"></i>&nbsp;Settings
                    </h4>
                </div>
                <div class="modal-body settingscrollable " id="setting">
                    <div class="form-group bottomline">
                        <label>
                            Quality</label>
                        <label class="pull-right drpmtop">
                            <%--<select class="form-control" id="quality_level" runat="server">
                                <option value="High">High</option>
                                <option value="Medium">Medium</option>
                                <option value="Low">Low/2G</option>
                            </select>--%>
                            <select class="form-control" id="quality_level" runat="server">
                                <option value="Normal">Normal</option>
                                <option value="FHD">FHD</option>
                                <option value="HD">HD</option>
                                <option value="3G">3G</option>
                                <option value="2G">2G</option>
                            </select>
                        </label>
                    </div>
                    <div class="form-group bottomline">
                        <label>
                            Audio</label>
                        <label class="pull-right drpmtop">
                            <label id="lblaudio" runat="server"></label>
                        </label>
                    </div>
                    <div class="form-group bottomline">
                        <label>
                            Hue</label>
                        <div class="pull-right">
                            <asp:HiddenField ID="hf_imghue" runat="server" />
                            <label class="badge badge-round" id="imghue">
                                <%=hf_imghue.Value%></label>
                            <input id="Slider1" class="pull-right" type="range" min="0" max="100" value="<%=hf_imghue.Value %>" />
                        </div>
                    </div>
                    <div class="form-group bottomline">
                        <label>
                            Brightness</label>
                        <div class="pull-right">
                            <asp:HiddenField ID="hf_imgbright" runat="server" />
                            <label class="badge badge-primary" id="imgbright">
                                <%=hf_imgbright.Value%></label>
                            <input id="Slider2" class="pull-right" type="range" min="0" max="100" value="<%=hf_imgbright.Value %>" />
                        </div>
                    </div>
                    <div class="form-group bottomline">
                        <label>
                            Contrast</label>
                        <div class="pull-right">
                            <asp:HiddenField ID="hf_imgcontrast" runat="server" />
                            <label class="badge badge-primary" id="imgcontrast">
                                <%=hf_imgcontrast.Value%></label>
                            <input id="Slider3" class="pull-right" type="range" min="0" max="100" value="<%=hf_imgcontrast.Value %>" />
                        </div>
                    </div>
                    <div class="form-group bottomline">
                        <label>
                            Saturation</label>
                        <div class="pull-right">
                            <asp:HiddenField ID="hf_imgsaturation" runat="server" />
                            <label class="badge badge-primary" id="imgsaturation">
                                <%=hf_imgsaturation.Value%></label>
                            <input id="Slider4" class="pull-right" type="range" min="0" max="100" value="<%=hf_imgsaturation.Value %>" />
                        </div>
                    </div>
                    <div class="form-group bottomline">
                        <label>
                            WDR</label>
                        <label class="pull-right drpmtop">
                            <select class="form-control border-radius" id="wdr" runat="server">
                                <option id="wdroff" value="Off">Off</option>
                                <option id="wdrlow" value="Low">Low</option>
                                <option id="wdrmid" value="Mid">Mid</option>
                                <option id="wdrhigh" value="High">High</option>
                                <option id="wdrhigher" value="Higher">Higher</option>
                            </select>
                        </label>
                    </div>
                    <div class="form-group bottomline">
                        <label>
                            IRCut</label>
                        <label class="pull-right drpmtop">
                            <select class="form-control" id="ircut" runat="server">
                                <option id="ircutdaynight" value="Day&Night">Day&Night</option>
                                <option id="ircutcolor" value="Color">Color</option>
                                <option id="ircutblackwhite" value="Black&White">Black&White</option>
                            </select>
                        </label>
                    </div>
                    <div class="form-group bottomline">
                        <label>
                            Flip</label>
                        <label class="pull-right">
                            <div class="onoffswitch">
                                <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="flip_on_off"
                                    runat="server" />
                                <label class="onoffswitch-label" for="<%= flip_on_off.ClientID %>">
                                    <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </label>
                    </div>
                    <div class="form-group">
                        <label>
                            Mirror</label>
                        <label class="pull-right">
                            <div class="onoffswitch">
                                <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="mirror_on_off"
                                    runat="server" />
                                <label class="onoffswitch-label" for="<%= mirror_on_off.ClientID %>">
                                    <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnsaveconfig" runat="server" Text="Save" CssClass="button button-primary button-rounded button-small"
                        OnClick="btnsaveconfig_Click" />
                    <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="button button-rounded button-small"
                        OnClick="btnclose_Click" />
                    <%--<button type="button" id="btnclose" class="button button-rounded button-small" data-dismiss="modal">
                        Close
                    </button>--%>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnsaveconfig" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <script type="text/javascript">

        $("#btnclose").click(function (e) {

            window.parent.closeModal();
        });

        function pageLoad() {
        }
        function toggleChevron(e) {
            $(e.target)
            .prev('')
            .find("i")
            .toggleClass('fa fa-caret-down fa fa-caret-right');
        }

        $(function () {

            $('#Slider1').change(function () {
                $('#<%=hf_imghue.ClientID%>').val(this.value);
                $('#imghue').html(this.value);
            }); $('#Slider1').change();

            $('#Slider2').change(function () {
                $('#<%=hf_imgbright.ClientID%>').val(this.value);
                $('#imgbright').html(this.value);
            }); $('#Slider2').change();

            $('#Slider3').change(function () {
                $('#<%=hf_imgcontrast.ClientID%>').val(this.value);
                $('#imgcontrast').html(this.value);
            }); $('#Slider3').change();

            $('#Slider4').change(function () {
                $('#<%=hf_imgsaturation.ClientID%>').val(this.value);
                $('#imgsaturation').html(this.value);
            }); $('#Slider4').change();
        });

        function CloseWindow() {
            window.close();
        }
    </script>

    </form>
</body>
</html>
