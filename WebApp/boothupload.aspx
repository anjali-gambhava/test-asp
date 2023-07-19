<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="boothupload.aspx.cs" Inherits="exam.boothupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .select:after {
            width: 0.7rem !important;
            height: 0.7rem !important;
        }

        .hide {
            display: none;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <div id="loaderdiv" class="table-responsive" align="center" style="height: calc(100vh - 230px);display:none;position: absolute;margin: -15em auto auto -8em;z-index: 1000;top: 50%;
left: 50%;width:30em;height:18em;">
                                                <asp:Image ID="ImgProgress1" runat="server" ImageUrl="images/loading.gif" ToolTip="loading..."
                                                    Width="20%" /><br />Please wait...
                                            </div>
    <section class="flex-auto flex-col">
        <div>
            <%-- class="container"--%>
            <div class="col-12 lg:col-12 pb-sm flex-col">
                <div class="bg-white shadow flex-stretch">
                    <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                        <%-- p-sm--%>
                        <table class="f-size-xxs">
                            <tr>
                                <td class="pr-xs">
                                    <div class="select">
                                        <%-- <asp:Literal ID="Literal4" runat="server" Text="<%$appSettings:district%>" />--%>
                                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="datalist border pr-md pl-xs py-xs ddlDistrict" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Width="170px">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                                <td class="pr-xs">
                                    <div class="select">
                                        <%-- <asp:Literal ID="Literal1" runat="server" Text="<%$appSettings:pcname%>" />--%>

                                        <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="ddlPC datalist border pr-md pl-xs py-xs"
                                            OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" Width="130px">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                                <td class="pr-xs">
                                    <div class="select d-hidden">
                                        <%--   <asp:Literal ID="Literal2" runat="server" Text="<%$appSettings:assemblyname%>" />--%>

                                        <asp:DropDownList ID="ddlbooth" runat="server" CssClass="datalist border pr-md pl-xs py-xs ddlbooth" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlbooth_SelectedIndexChanged" Width="180px">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                                <td class="pr-xs">
                                    <a href="BoothExcelFomat.xlsx" class="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline" target="_blank">
                                        <%--<span class="icon mr-xs flex-none f-color-primary">
                            <span class=""><i data-feather="download"></i></span>
                        </span>--%>Excel format</a>
                                </td>
                                <td class="pr-xs">
                                    <asp:FileUpload ID="FileUploadbooth" runat="server" CssClass="border p-thin" Style="width: 200px;" />
                                    <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                        OnClientClick="javascript: return checkValidate();" OnClick="btnupload_Click" />
                                </td>
                                <td class="pr-xs">
                                    <a href="#" id="btnaddbooth" class="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline" data-toggle="modal" data-backdrop="static" onclick="OpenPopup()">Add Booth</a>
                                </td>
                                <td class="pr-xs">
                                    <asp:TextBox ID="strm_txtBox" runat="server" AutoPostBack="true" CssClass="datalist border pr-md pl-xs py-xs"
                                        Width="150px">
                                    </asp:TextBox>
                                </td>
                                <td class="pr-xs">
                                    <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                        OnClick="btnsearch_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-inline">
                            <div class="form-group">
                                <asp:Label ID="lblcount" runat="server" Text="" CssClass="text-success"></asp:Label>
                                <asp:Label ID="lblsuccess" runat="server" Text="" CssClass="text-success"></asp:Label>
                                <asp:Label ID="lblerror" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                <asp:Label ID="lblerrnofile" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                <asp:Label ID="lblduplicate" runat="server" Text="" CssClass="text-warning"></asp:Label>
                                <asp:Label ID="lblduplicateps" runat="server" Text="" CssClass="text-warning"></asp:Label>
                                <asp:Label ID="lblnolist" runat="server" Text="" CssClass="text-warning"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="table-responsive">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="alert alert-block alert-danger text-center animated bounce " id="div_error"
                                runat="server" visible="false">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times font-small"></i>
                                </button>
                            </div>
                            <div class="alert alert-block alert-success text-center animated bounce " id="div_success"
                                runat="server" visible="false">
                                <button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times font-small"></i>
                                </button>
                            </div>
                            <!--  <asp:Button ID="btnGetSelected" runat="server" CssClass="btn btn-success btn-sm"
                        Text="Show Records for selected booth" OnClick="GetSelectedRecords" /> -->
                            <div class="pull-right d-hidden">
                                <div class="form-group">
                                    <%--<a href="#" id="btnaddbooth" class="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline" data-toggle="modal" data-backdrop="static">
                                ADD Booth</a>--%>
                                </div>
                            </div>
                            <div class="pd0 f-size-xxs"></div>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default"
                                OnRowCancelingEdit="GridViewbooth_RowCancelingEdit" OnRowEditing="GridViewbooth_RowEditing"
                                OnRowUpdating="GridViewbooth_RowUpdating" OnRowCommand="GridViewbooth_RowCommand"
                                OnRowDeleting="GridView1_RowDeleting" AlternatingRowStyle-CssClass="bg-light"
                                AllowPaging="true" PagerStyle-CssClass="GridPager page" OnPageIndexChanging="OnPageIndexChanging" PageSize="300">
                                <EmptyDataTemplate>
                                    <div align="center" class="py-xs">
                                        <h4>
                                            <label class="text-center text-danger">
                                                No Data Found</label>
                                        </h4>
                                    </div>
                                </EmptyDataTemplate>
                                <Columns>
                                    <%--  <asp:TemplateField HeaderText="Select">
                                <HeaderTemplate>
                                    Select all&nbsp;<%--<asp:CheckBox ID="chkSelectAll" CssClass="chkHeader" runat="server" />
                                    <asp:CheckBox ID="checkAll" OnCheckedChanged="check_CheckedChanged" AutoPostBack="true"
                                        runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="checkbox" CssClass="chkItem" Checked='<%# Eval("isdisplay").GetType() != typeof(DBNull) ? Convert.ToBoolean(Eval("isdisplay")) : false %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>  --%>
                                    <asp:TemplateField HeaderText="BoothID" Visible="false" ItemStyle-Width="5%" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-CssClass="f-size-xxs p-thin  text-left" ItemStyle-Width="5%" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$appSettings:district%>" ItemStyle-Width="7%" Visible="true" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldistrict" runat="server" Text='<%# Eval("district")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--  <asp:TemplateField HeaderText="<%$appSettings:pcname%>" ItemStyle-Width="7%" Visible="true" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lblpc" runat="server" Text='<%# Eval("accode")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="<%$appSettings:assemblyname%>" ItemStyle-Width="12%" Visible="True" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblschoolname" runat="server" Text='<%# Eval("acname")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$appSettings:psnum%>" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblps" runat="server" Text='<%# Eval("psnum")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$appSettings:location%>" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllocation" runat="server" Text='<%# Eval("location")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="editlocation" runat="server" CssClass="border p-thin" Text='<%# Eval("location")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Operator name" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldisp" runat="server" Text='<%# Eval("operatorname")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="editdisp" runat="server" CssClass="border p-thin" Text='<%# Eval("operatorname")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Operator no." ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldispmob" runat="server" Text='<%# Eval("operatornumber")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="editdispmob" runat="server" CssClass="border p-thin" Text='<%# Eval("operatornumber")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldispDesignation" runat="server" Text='<%# Eval("Designation")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="editdispDesignation" runat="server" CssClass="border p-thin" Text='<%# Eval("Designation")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Camera No" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstreamnames" runat="server" Text='<%# Eval("streamname")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="hd_stream" runat="server" Text='<%# Eval("streamname")%>' Visible="false" />
                                            <asp:TextBox ID="editstreamnames" runat="server" CssClass="border p-thin" Text='<%# Eval("streamname")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Is Pink" Visible="false" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblispink" runat="server" Text='<%# Eval("ispink")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="drpispink" runat="server">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0" Selected>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Is Outside Booth" Visible="false" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIsOutsideBooth" runat="server" Text='<%# Eval("IsOutsideBooth")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="drpisoutside" runat="server">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0" Selected>No</asp:ListItem>
                                            </asp:DropDownList>
                                             <%--<asp:TextBox ID="drpisoutside" runat="server" CssClass="border p-thin" Text='<%# Eval("IsOutsideBooth")%>'></asp:TextBox>--%>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Is ARO" Visible="false" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblisaro" runat="server" Text='<%# Eval("isaro")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="drpisaro" runat="server">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0" Selected>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Camera Location Type" Visible="false" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcamloctype" runat="server" Text='<%# Eval("CameraLocationType")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="editCamType" runat="server" CssClass="border p-thin" Text='<%# Eval("CameraLocationType")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update | Delete" ItemStyle-Width="18%" HeaderStyle-Width="170" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <div align="center" style="width: 130px;">
                                                <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit"
                                                    CssClass="cursor-pointer bg-primary-light f-color-white f-size-xxs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                                <asp:Button ID="btn_delete" runat="server" Text="Del" CommandName="Delete" ToolTip="Delete"
                                                    CssClass="cursor-pointer bg-warning f-color-white f-size-xxs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" OnClientClick="return confirm('Are you sure you want to Delete this Camera?');" />
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div align="center" style="width: 150px;">
                                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" ToolTip="Update"
                                                    CssClass="cursor-pointer bg-primary-light f-color-white f-size-xxs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" ToolTip="Cancel"
                                                    CssClass="cursor-pointer bg-warning f-color-white f-size-xxs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" />
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                            <div class="modal fade in" id="conflictdata" tabindex="-1" role="dialog" aria-labelledby="conflictdata"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">Already assigned Streamname...
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Original Data</h4>
                                    </div>
                                    <div class="panel-body">
                                        District :
                                        <%=oldst %>
                                        <br />
                                        AC Name:
                                        <%=olac %><br />
                                        PS Name:
                                        <%=olps %><br />
                                        Operator Details:
                                        <%=oloperatordetail%><br />
                                        TAB STREAM:
                                        <%=olstrm %>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Conflict Data</h4>
                                    </div>
                                    <div class="panel-body">
                                        District:
                                        <%=nwdst %>
                                        <br />
                                        AC Name:
                                        <%=nwac %><br />
                                        PS Name:
                                        <%=nwps %><br />
                                        Operator Details:
                                        <%=nwoperatordetail %><br />
                                        TAB STREAM:
                                        <%=nwstrm %>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btn_save" runat="server" Text="Update" Visible="true" CssClass="btn btn-primary"
                                    OnClick="btn_save_Click" />
                                <button type="close" class="btn" data-dismiss="modal">
                                    Close
                                </button>
                            </div>
                        </div>
                        <%--   <
                    </ContentTemplate>
                </asp:UpdatePanel>--%>
                    </div>
                </div>
                        </ContentTemplate>
                        <Triggers>
                            <%--<asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdating" />
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCancelingEdit" />--%>
                               <asp:AsyncPostBackTrigger ControlID="btnupload" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                
                <div class="modal wow fadeInUp animated" id="addevent" tabindex="-1" data-wow-animation-name="fadeInUp"
                    style="visibility: visible; animation-name: fadeInUp; -webkit-animation-name: fadeInUp;">
                    <div class="modal-dialog">
                        <%-- <asp:UpdatePanel ID="upModal" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="d-inline-block" style="width: 90%;">
                                    <h4 class="modal-title" id="H1">Add Booth (According to selected District & Assembly)
                                    </h4>
                                </div>
                                <div class="d-inline-block text-right f-right pr-sm" style="width: 10%;">
                                    <button type="button" onclick="ClosePopup()" class="btnclose close cursor-pointer" id="btncancel" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                </div>
                            </div>
                            <div class="modal-body">
                                <table cellspacing="5" cellpadding="5">
                                    <tr>
                                        <td colspan="2">
                                            <label class="error" id="lbl_error_addbooth" runat="server">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="txtps">
                                                PS No.</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtps" CssClass="border p-thin f-size-xs required" runat="server" placeholder="Enter PS No." />
                                        </td>
                                        <td>
                                            <label for="txtps">
                                                Part No.</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtpart" CssClass="border p-thin f-size-xs required" runat="server" placeholder="Enter Part No." />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <label for="txtstreamname">
                                                Streamname</label>
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtstreamname" class="border p-thin f-size-xs" runat="server" placeholder="Enter Stream name" Style="width: 60%" />
                                        </td>

                                    </tr>

                                    <tr>
                                        <td style="vertical-align: top">
                                            <label for="txtlocation">
                                                Enter Location</label>
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtlocation" class="border p-thin f-size-xs" runat="server" placeholder="Enter location" Style="width: 100%" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <label for="txtopname">
                                                Operator name</label>
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtopname" class="border p-thin f-size-xs" runat="server" placeholder="Enter Operator name" Style="width: 100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="txtopno">
                                                Operator no.</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtopno" minlength="10" MaxLength="10" class="border p-thin f-size-xs number"
                                                runat="server" placeholder="Enter Operator no." />
                                        </td>
                                        <td>
                                            <label for="txtopDesig">
                                                Designation</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtopDesig" class="border p-thin "
                                                runat="server" placeholder="Enter designation." />
                                        </td>
                                    </tr>

                                    <tr class="hide">
                                        <td>Is Pink
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpIsPink" runat="server" Style="-webkit-appearance: auto" CssClass="datalist border pr-md pl-xs py-xs ddlDistrict">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0" Selected>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>Is ARO
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpIsARO" runat="server" Style="-webkit-appearance: auto" CssClass="datalist border pr-md pl-xs py-xs ddlDistrict">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0" Selected>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        </tr>
                                  
                                    <tr class="hide">
                                        <td>Is OutSide
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpIsOutside" runat="server" Style="-webkit-appearance: auto" CssClass="datalist border pr-md pl-xs py-xs ddlDistrict">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0" Selected>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnaddevent" runat="server" Text="ADD" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                    OnClick="btnaddevent_Click" />
                                <button type="button" onclick="ClosePopup()" class="btnclose cursor-pointer bg-gray f-color-default f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" id="btnclose" data-dismiss="modal" aria-hidden="true">Cancel</button>
                            </div>
                        </div>
                        <!-- /.modal-content  -->
                        <%--  </ContentTemplate>
                </asp:UpdatePanel>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        //$(document).ready(function () {
        //    $("#btnaddbooth").click(function () {
        //        if ($(".ddlDistrict").val() != "0" && $(".ddlbooth").val() != "0" && $(".ddlPC").val() != "0")
        //            $("#addevent").show();
        //        else
        //            alert("Please select values.")

        //    });
        //    $(".btnclose").on("click", function () {
        //        $("#addevent").hide();
        //    });
        //});
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
            $j("#loaderdiv").css("display","block")
        });
        function OpenPopup() {
            if ($(".ddlDistrict").val() != "0" && $(".ddlbooth").val() != "0" && $(".ddlPC").val() != "0")
                $("#addevent").show();
            else
                alert("Please select values.")
        }
        function ClosePopup() {
            $("#addevent").hide();
        }

        function pageLoad() {
            //$("#aspnetForm").validate({
            //    onsubmit: false,
            //    errorPlacement: function (error, element) {
            //        element.append(error);
            //    }
            //});
        }
        function AddValidate() {

            if ($("#<%=txtps.ClientID%>").valid()) {
                return true;
            }
            return false;
        }
        function checkValidate() {
            debugger;
            $("#loaderdiv").css("display", "block");
            if ($(".ddlDistrict").val() == "0" || $(".ddlPC").val() == "0" ||
                $(".ddlDistrict").val() == "" || $(".ddlPC").val() == "") {
                alert("Please select District/Assembly.")
                return false;
            }
            if ($("#<%= FileUploadbooth.ClientID %>").valid()) {
                var file = $('input[type="file"]').val();
                var exts = ['xls', 'xlsx'];
                var get_ext = file.split('.');
                get_ext = get_ext.reverse();
                if ($.inArray(get_ext[0].toLowerCase(), exts) > -1) {
                    if (confirm('Are you sure to upload Data?')) {
                        return true;
                    }
                }
                else {
                    alert("Please select file with Valid extention (i.e. .xls, .xlsx)");
                }
                return false;
            }
            else {
                return false;
            }
        };
        //        $(document).ready(function () {

        //            var headerChk = $(".chkHeader input");
        //            var itemChk = $(".chkItem input");

        //            headerChk.click(function () {
        //                itemChk.each(function () {
        //                    this.checked = headerChk[0].checked;
        //                })
        //            });

        //            itemChk.each(function () {
        //                $(this).click(function () {
        //                    if (this.checked == false) { headerChk[0].checked = false; }
        //                })
        //            });

        //        });



    </script>
    <script type="text/javascript">
        //$("#conflictdata").modal({
        //    backdrop: 'static',
        //    keyboard: false
        //});
    </script>
</asp:Content>
