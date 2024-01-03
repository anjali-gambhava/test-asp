<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cameraset.aspx.cs"
    Inherits="exam.cameraset" Async="true" ViewStateEncryptionMode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title> 
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link href="plugins/bootstrap-slider/css/bootstrap-slider.min.css" rel="stylesheet" />
    <link href="dist/css/adminlte.min.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=ResolveUrl("~/js/jquery.js") %>"></script>
    <script src="<%=ResolveUrl("~/js/bootstrap.min.js") %>" type="text/javascript"></script> 
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
            <div class="modal-content"> 
                <div class="modal-body " id="setting" style="padding:0px 2rem"> 
                  <div class="col-md-12 row">  
                      <div class="card card-primary card-outline" style="padding:0px;margin: 5px 2px;">
                       <div class="card-header" style="padding:5px">
                <h3 class="card-title">
                  <i class="fas fa-bullhorn"></i>
                   Settings
                </h3>
              </div>
                  </div>
                  </div>
                    <div class="col-md-12 row"> 
                        <div class="col-md-6">
             <div class="card card-default" style="margin:0px;padding: 0px;">
               
              <!-- /.card-header -->
              <div class="card-body"> 
                <div class="callout callout-success">
                    <div class="row">
        <div class="col-sm-6">
            <h5 style="margin-top: 8px;">IRCut</h5>
        </div>
        <div class="col-sm-6">
              <label class="pull-right drpmtop">
                            <select class="form-control" id="ircut" runat="server">
                                <option id="ircutdaynight" value="Day&Night">Day&Night</option>
                                <option id="ircutcolor" value="Color">Color</option>
                                <option id="ircutblackwhite" value="Black&White">Black&White</option>
                            </select>
                        </label>
        </div>
                </div>
                </div>
                  <div class="callout callout-success">
                    <div class="row">
        <div class="col-sm-6">
            <h5 style="margin-top: 8px;">Flip</h5>
        </div>
        <div class="col-sm-6">
               <label class="pull-right">
                            <div class="onoffswitch">
                                <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="flip_on_off"
                                    runat="server" />
                                <label class="onoffswitch-label" for="<%= flip_on_off.ClientID %>"  style="margin-bottom:0px"> 
                                    <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </label>
        </div>
                </div>
                </div>
                  <div class="callout callout-warning">
                    <div class="row">
        <div class="col-sm-6">
            <h5 style="margin-top: 8px;">Mirror</h5>
        </div>
        <div class="col-sm-6">
             <label class="pull-right" >
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
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div> 
                    </div> 
                    <div class="col-md-12 row">  
                        <div class="card card-default" style="margin-top:0px;padding: 0px;">
                       <div class="card-header" style="text-align:right;padding: 5px 15px;">
                 <asp:Button ID="btnsaveconfig" runat="server" Text="Save" CssClass="button button-primary button-rounded button-small"
                        OnClick="btnsaveconfig_Click"  OnClientClick="closeWindow();" />
                    <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="button button-rounded button-small"
                        OnClick="btnclose_Click" style="display:none"/>
              </div>
                  </div>
                  </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
        <!-- END ALERTS AND CALLOUTS -->
 
                </div>
                <div class="modal-footer"> 
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnsaveconfig" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
         <script> 
             function closeWindow() {
                 window.close();
             }
         </script>
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

        function CloseWindow() {
            window.close();
        }
    </script>
        
    </form>
   
</body>
</html>
