<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BoothMaster.aspx.cs" Inherits="exam.BoothMaster" MasterPageFile="~/Main.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .select:after {
            width: 0.7rem !important;
            height: 0.7rem !important;
        }

        .py-xs {
            padding-top: 6px !important;
            padding-bottom: 6px !important;
        }

        .hide {
            display: none;
        }

        .modal-dialog {
            width: 59% !important;
        }

        .ui-menu-item-wrapper {
            font-size: 14px !important;
            font-weight: 100 !important;
            padding: 3px 1em 3px 0.4em !important;
        }

        .ui-state-active {
            font-size: 14px;
            font-weight: 100;
            background: #bcbec2 !important;
            border: none !important;
            margin: 0 !important;
            padding: 3px 1em 3px 0.4em !important;
            width: 100%;
        }

        label.required::after {
            content: '*';
            margin-right: 4px;
            color: red;
        }
        .ui-autocomplete{
            height: 150px;
            overflow-y : scroll;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <section class="flex-auto flex-col">
        <div>
            <div class="col-12 lg:col-12 pb-sm flex-col">
                <div class="bg-white shadow flex-stretch">
                    <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                        <input type="hidden" value="" id="hiddenField" runat="server" />
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <%-- p-sm--%>
                                <table class="f-size-xxs">
                                    <tr>
                                        <td class="pr-xs">
                                            <div class="select">
                                                <%-- <asp:Literal ID="Literal4" runat="server" Text="<%$appSettings:district%>" />--%>
                                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="datalist border pr-md pl-xs py-xs ddlDistrict" AutoPostBack="true"
                                                    Width="170px" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" />

                                            </div>
                                        </td>

                                        <td class="pr-xs">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlAssembly" runat="server" AutoPostBack="true" CssClass="ddlPC datalist border pr-md pl-xs py-xs"
                                                    Width="170px" OnSelectedIndexChanged="ddlAssembly_SelectedIndexChanged" />

                                            </div>
                                        </td>
                                        <td class="pr-xs d-hidden">
                                            <div class="select">
                                                <asp:DropDownList ID="ddlCameraType" runat="server" CssClass="datalist border pr-md pl-xs py-xs ddlbooth" AutoPostBack="true"
                                                    Width="180px" OnSelectedIndexChanged="ddlCameraType_SelectedIndexChanged">
                                                    <asp:ListItem Text="Select Camera Type" Value="" />
                                                    <asp:ListItem Text="InDoor" Value="Inside" />
                                                    <asp:ListItem Text="OutDoor" Value="Outside" />
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="pr-xs">
                                            <asp:TextBox ID="strm_txtBox" runat="server" CssClass="datalist border pr-md pl-xs py-xs" Width="250px" />
                                        </td>
                                        <td class="pr-xs">
                                            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="cursor-pointer bg-primary f-color-white  f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                OnClick="btnsearch_Click" />
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="pr-xs pt-2xs" colspan="7">
                                            <table>
                                                <tr>
                                                    <td class="pr-xs">
                                                        <asp:Button Text="Add Booth" id="btnaddbooth" runat="server" CssClass="cursor-pointer bg-primary f-color-white  f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline" data-toggle="modal" data-backdrop="static" OnClientClick="OpenPopupAdd()" OnClick="btnaddbooth_Click" />
                                                        <%--<a href="#" id="btnaddbooth" class="cursor-pointer bg-primary f-color-white  f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline" data-toggle="modal" data-backdrop="static" onclick="OpenPopupAdd(1)">Add Booth</a>--%>
                                                    </td>
                                                    <td class="pr-xs">
                                                        <a href="BoothExcelFomat.xlsx" class="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline" target="_blank">
                                                            <%--<span class="icon mr-xs flex-none f-color-primary">
                                                <span class=""><i data-feather="download"></i></span>
                                                </span>--%>Excel format</a>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUploadbooth" runat="server" CssClass="border p-thin" Style="width: 200px; padding: 0; font-size: 15px;" />
                                                        <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="cursor-pointer bg-primary f-color-white  f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                            OnClientClick="javascript: return checkValidate();" OnClick="btnupload_Click" />
                                                    </td>
                                                    <td class="pr-xs"></td>
                                                    <td class="pr-xs" colspan="6">
                                                        <asp:Button ID="btnBulkRemove" runat="server" Text="Assembly Remove" CssClass="cursor-pointer bg-primary f-color-white  f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                            OnClientClick="bulkdelete()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ddlCameraType" EventName="SelectedIndexChanged" />
                                <%--<asp:AsyncPostBackTrigger ControlID="btnupload" EventName="Click" />--%>
                                <%--<asp:AsyncPostBackTrigger ControlID="btnupload" EventName="Click"/>--%>
                                <asp:PostBackTrigger ControlID="btnupload" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div class="table-responsive">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default"
                        AlternatingRowStyle-CssClass="bg-light" PagerStyle-CssClass="GridPager page" OnPageIndexChanging="GridView1_PageIndexChanging"
                        AllowPaging="true" OnRowCommand="GridView1_RowCommand">
                        <EmptyDataTemplate>
                            <div align="center" class="py-xs">
                                <h4>
                                    <label class="text-center text-danger">
                                        No Data Found</label>
                                </h4>
                            </div>
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField HeaderText="BoothID" ItemStyle-Width="5%" ItemStyle-CssClass="d-hidden f-size-xxs p-thin  text-left" HeaderStyle-CssClass="d-hidden f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <%--<asp:HiddenField ID="lblid" runat="server" Value='<%# Eval("id")%>' />--%>
                                    <asp:Label Text='<%# Eval("id")%>' ID="lblid" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BoothStreamID" Visible="false" ItemStyle-Width="5%" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lblStreamId" runat="server" Text='<%# Eval("streamid")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BoothoperatorID" Visible="false" ItemStyle-Width="5%" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lblOperatorId" runat="server" Text='<%# Eval("operatorid")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BoothoperatorID" Visible="false" ItemStyle-Width="5%" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lblaccode" runat="server" Text='<%# Eval("accode")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sr.No." ItemStyle-CssClass="f-size-xxs p-thin  text-left" ItemStyle-Width="5%" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
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
                            <asp:TemplateField HeaderText="<%$appSettings:assemblyname%>"  Visible="True" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
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
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Operator name" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lbldisp" runat="server" Text='<%# Eval("operatorname")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Operator no." ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lbldispmob" runat="server" Text='<%# Eval("operatornumber")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Designation" Visible="false" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lbldispDesignation" runat="server" Text='<%# Eval("Designation")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Camera No" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lblstreamnames" runat="server" Text='<%# Eval("streamname")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Camera Location Type" Visible="false" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Label ID="lblcamloctype" runat="server" Text='<%# Eval("CameraLocationType")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" Visible="True" ItemStyle-CssClass="f-size-xxs p-thin  text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                       <%#Eval("status").ToString() == "RUNNING" ? "Online" : Eval("status").ToString() == "STOPPED" ? "Offline" : "" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate>
                                    <asp:Button runat="server" CssClass="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                        Style="padding: 6px 12px; font-size: 15px" Text="Edit" ID="btnMapping" CommandName="Submit" OnClientClick="OpenPopupAdd()" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <%-- <ItemTemplate>
                                    <asp:Button runat="server" CssClass="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                        Style="padding: 6px 2px; font-size: 15px" Text="Delete" ID="btnDelete" CommandName="Delete" OnClientClick="return swal('Are you sure you want to delete this Booth?', {buttons: {cancel: true,confirm: true,},});" />
                                </ItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdID" Value='<%# Eval("id") %>' runat="server" />
                                    <asp:Button ID="btnSweetAlert" runat="server" Text="Delete" OnClientClick='<%# "deletebyID(" + Eval("id").ToString() + ")" %>' CssClass="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" Style="padding: 6px 12px; font-size: 15px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnsearch" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="ddlAssembly" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="ddlCameraType" EventName="SelectedIndexChanged" />
                    <%--<asp:AsyncPostBackTrigger ControlID="btnupload" EventName="Click"/>--%>
                    <%--<asp:PostBackTrigger ControlID="btnupload" />--%>
                </Triggers>
            </asp:UpdatePanel>

            <div class="modal wow fadeInUp animated" id="PopupAddCamera" tabindex="-1" data-wow-animation-name="fadeInUp"
                style="visibility: visible; animation-name: fadeInUp; -webkit-animation-name: fadeInUp;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="d-inline-block">
                                <asp:Label ID="lblTitle" runat="server" Text="Add Booth" class="modal-title" ClientIDMode="Static"></asp:Label>
                            </div>
                            <div class="d-inline-block text-right f-right pr-sm" style="width: 10%;">
                                <button type="button" onclick="ClosePopupAdd()" class="btnclose close cursor-pointer" id="btncancel" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                            </div>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div style="text-align: center">
                                        <asp:Label ID="lblmsg" runat="server" ClientIDMode="Static" Style="color: #dc7c3c;">
                                        </asp:Label>
                                        <%--  <asp:TextBox runat="server" ID="lblboothid" Text="0" ClientIDMode="Static" Visible="false">
                                        </asp:TextBox>--%>
                                        <%--<asp:TextBox runat="server" ID="lblboothid" ClientIDMode="Static"
                                            Style="font-size: 15px; border: 1px solid #ccc; padding: 3px" Width="100%">
                                        </asp:TextBox>--%>
                                        <%--<asp:Label ID="lblboothid" runat="server" Text="0"></asp:Label>--%>
                                        <asp:HiddenField ID="lblboothid" runat="server" Value="0" />
                                        <asp:Label ID="lblStreamId" runat="server" Visible="false">
                                        </asp:Label>
                                        <asp:Label ID="lblaccode" runat="server" Visible="false">
                                        </asp:Label>
                                    </div>
                                    <table cellspacing="5" cellpadding="5">
                                        <tr>
                                            <td style="width: 170px;">
                                                <label style="padding: 4px; font-size: 15px;" class="required" id="lbldistrict">District</label>
                                            </td>
                                            <td>
                                                <div class="select">
                                                    <asp:DropDownList ID="drpAddDistrict" runat="server" CssClass=" datalist border pr-md pl-xs py-xs ddlDistrict" AutoPostBack="true"
                                                        OnSelectedIndexChanged="drpAddDistrict_SelectedIndexChanged" Style="padding: 4px; font-size: 15px; width: 100%"
                                                        ClientIDMode="Static" ValidationGroup="GrpSave">
                                                    </asp:DropDownList>

                                                </div>
                                                <asp:RequiredFieldValidator ID="District" runat="server" ControlToValidate="drpAddDistrict"
                                                    ErrorMessage="Select District!" ForeColor="Red" Style="font-size: 12px;" ValidationGroup="GrpSave" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 150px;">
                                                <label style="padding: 4px; font-size: 15px;">Assembly</label>
                                            </td>
                                            <td>
                                                <div class="select">
                                                    <asp:DropDownList ID="drpAddAcname" runat="server" AutoPostBack="true" CssClass="ddlPC datalist border pr-md pl-xs py-xs"
                                                        Style="padding: 4px; font-size: 15px; width: 100%" ClientIDMode="Static"
                                                        OnSelectedIndexChanged="drpAddAcname_SelectedIndexChanged" ValidationGroup="GrpSave">
                                                    </asp:DropDownList>

                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drpAddAcname"
                                                    ErrorMessage="Select Assembly!" ForeColor="Red" Style="font-size: 12px;" ValidationGroup="GrpSave" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label style="padding: 4px; font-size: 15px;" class="required">PS No</label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtAddPSNum" ClientIDMode="Static"
                                                    Style="font-size: 15px; border: 1px solid #ccc; padding: 3px" ValidationGroup="GrpSave" Width="100%">
                                                </asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddPSNum"
                                                    ErrorMessage="Enter PS No!" ForeColor="Red" Style="font-size: 12px;" ValidationGroup="GrpSave" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddPSNum"   
                                                ErrorMessage="Enter PSNum" ForeColor="Red" Style="font-size: 12px;" ></asp:RequiredFieldValidator> --%>
                                                <asp:Label runat="server" ID="Label5" Visible="false"></asp:Label>
                                            </td>
                                            <td>
                                                <label style="padding: 4px; font-size: 15px;" class="required">Location</label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtAddLocation" ClientIDMode="Static"
                                                    Style="font-size: 15px; border: 1px solid #ccc; padding: 3px" ValidationGroup="GrpSave" Width="100%">
                                                </asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddLocation"
                                                    ErrorMessage="Enter Location!" ForeColor="Red" Style="font-size: 12px;" ValidationGroup="GrpSave" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddLocation"   
                                                ErrorMessage="Enter Location" ForeColor="Red" Style="font-size: 12px;" ></asp:RequiredFieldValidator>--%>
                                                <asp:Label runat="server" ID="Label2" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label style="padding: 4px; font-size: 15px;" class="required">Camera ID</label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtAddCameraId" ClientIDMode="Static" Width="100%"
                                                    Style="font-size: 15px; border: 1px solid #ccc; padding: 3px" onkeyup="autocompletecameradid()" ValidationGroup="GrpSave">
                                                </asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddCameraId"
                                                    ErrorMessage="Enter a valid CameraID!" ForeColor="Red" Style="font-size: 12px;" ValidationGroup="GrpSave" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddCameraId"   
                                                ErrorMessage="Enter CameraId" ForeColor="Red" Style="font-size: 12px;" ></asp:RequiredFieldValidator> --%>
                                                <%--<asp:Label runat="server" ID="Label3" Visible="false"></asp:Label>--%>
                                            </td>
                                            <td>
                                                <label style="padding: 4px; font-size: 15px;" class="required">Type</label>
                                            </td>
                                            <td>
                                                <div class="select">
                                                    <asp:DropDownList ID="drpaddLocationType" runat="server" AutoPostBack="true" CssClass="datalist border pr-md pl-xs py-xs"
                                                        Style="padding: 4px; font-size: 15px; width: 100%" ClientIDMode="Static"
                                                        OnSelectedIndexChanged="drpaddLocationType_SelectedIndexChanged">
                                                        <asp:ListItem Value="Inside" Text="Indoor"></asp:ListItem>
                                                        <asp:ListItem Value="Outside" Text="Outdoor"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drpaddLocationType"   
                                                ErrorMessage="Please Select Camera Location Type" ForeColor="Red" Style="font-size: 12px;" ></asp:RequiredFieldValidator> --%>
                                            </td>
                                        </tr>
                                        <tr class="">
                                            <td>
                                                <label style="padding: 4px; font-size: 15px;">Operator Name</label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtAddOperatorName" ClientIDMode="Static"
                                                    Style="font-size: 15px; border: 1px solid #ccc; padding: 3px" ValidationGroup="GrpSave" Width="100%">
                                                </asp:TextBox>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddOperatorName"   
                                                ErrorMessage="Enter Operator Name!" ForeColor="Red" Style="font-size: 12px;" ValidationGroup="GrpSave" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                <asp:Label runat="server" ID="Label4" Visible="false"></asp:Label>
                                            </td>
                                            <td>
                                                <label style="padding: 4px; font-size: 15px;">Operator Number</label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtAddMobileNumber" ClientIDMode="Static"
                                                    Style="font-size: 15px; border: 1px solid #ccc; padding: 3px" ValidationGroup="GrpSave" Width="100%">
                                                </asp:TextBox>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddMobileNumber"   
                                                ErrorMessage="Enter Operator Number!" ForeColor="Red" Style="font-size: 12px;" ValidationGroup="GrpSave" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                    ControlToValidate="txtAddMobileNumber" ErrorMessage="Enter Valid Mobile No" ForeColor="Red" Style="font-size: 12px;"
                                                    ValidationExpression="[0-9]{10}" ValidationGroup="GrpSave"></asp:RegularExpressionValidator>
                                                <asp:Label runat="server" ID="Label8" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label style="padding: 4px; font-size: 15px;">Operator Designation</label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtoperatordesignation" ClientIDMode="Static"
                                                    Style="font-size: 15px; border: 1px solid #ccc; padding: 3px" ValidationGroup="GrpSave" Width="100%">
                                                </asp:TextBox>
                                                <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtoperatordesignation"   
                                                ErrorMessage="Enter Designation!" ForeColor="Red" Style="font-size: 12px;" ValidationGroup="GrpSave" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                <asp:Label runat="server" ID="Label6" Visible="false"></asp:Label>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr class="d-hidden">
                                            <td>
                                                <label style="padding: 4px; font-size: 15px;">IsActive</label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chlIsActive" runat="server" Checked="true" />
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                    </table>
                                </div>

                                <div class="modal-footer" style="text-align: center">
                                    <asp:Button ID="btnAdd" runat="server" Text="Save" CssClass="cursor-pointer bg-primary f-color-white f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" OnClick="btnAdd_Click" ValidationGroup="GrpSave" />
                                    <asp:Button ID="btnCloseAdd" Text="Cancel" runat="server" OnClientClick="ClosePopupAdd()" class="btnclose cursor-pointer bg-gray f-color-default f-size-2xs f-weight-semibold hover:shadow-md transition-all px-2xs py-thin" data-dismiss="modal" aria-hidden="true" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
            </div>
        </div>

    </section>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <link media="screen" rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.3.8/sweetalert2.min.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/sweetalert2/6.3.8/sweetalert2.min.js"> </script>
    <script>
        var $j = jQuery.noConflict();

        function OpenconfirmPopup() {
            $j("#dialog").show();
        }
        function OpenPopupAdd() {
            //if (t == 1) {
            //    $j("#lblTitle").text('ADD BOOTH');
            //    $j("#txtAddCameraId").val('');
            //    $j("#txtAddPSNum").val('');
            //    $j("#txtAddLocation").val('');
            //    $j("#txtAddOperatorName").val('');
            //    $j("#txtAddMobileNumber").val('');
            //    $j("#txtoperatordesignation").val('');
            //    $j("#chlIsActive").val('');
            //    $j("#lblboothid").val('0');
            //    //$j("#lblboothid").text('0');
            //    $j("#drpAddDistrict").val("");
            //    $j("#drpAddAcname").val("");
            //    $j("#lblmsg").val("");
            //}
            //else {
            //    $j("#lblTitle").text('EDIT BOOTH');
            //}
            $j("#PopupAddCamera").show();
        }
        function ClosePopupAdd() {
            $j("#txtAddCameraId").val('');
            $j("#txtAddPSNum").val('');
            $j("#txtAddLocation").val('');
            $j("#txtAddOperatorName").val('');
            $j("#txtAddMobileNumber").val('');
            $j("#txtoperatordesignation").val('');
            $j("#chlIsActive").val('');
            $j("#lblboothid").val('0');
            //$j("#lblboothid").text('0');
            $j("#drpAddDistrict").val("");
            $j("#drpAddAcname").val("");
            $j("#lblmsg").val("");
            $j("#PopupAddCamera").hide();
            return false;
        }

        function deletebyID(id) {
            swal({
                title: 'Confirm!',
                text: "Are you sure you want to delete this record?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then(function (result) {
                if (result) {
                    $.ajax({
                        type: "POST",
                        url: "BoothMaster.aspx/DeleteClick",
                        data: "{id:" + id + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            if (r.d == "Deleted") {
                                swal("Success!", "Record deleted successfully.", "success").then(function () {
                                    window.location.href = "BoothMaster.aspx";
                                    //var obj = $("#GridView1").ejGrid("instance");
                                    //obj.model.dataSource.push(data);
                                    //obj.refreshContent();
                                });
                            }
                            else {
                                swal("Error!", "Error occured while deleting record.", "success");
                            }
                        }
                    });
                }
            },
                function (dismiss) {
                    if (dismiss == 'cancel') {
                        swal('Cancelled', 'No record Deleted', 'error');
                    }
                });
            return false;
        }

        function bulkdelete() {
            var district_Name = $j("#<%=ddlDistrict.ClientID %> :selected").text();
            var Ac_name = $j("#<%=ddlAssembly.ClientID %> :selected").text();
            if (Ac_name == "ALL Assembly" || $j("#<%=ddlAssembly.ClientID %>").val() == "") {
                swal("Error!", "Please select Assembly!!", "error");
            }
            else {

                swal({
                    title: 'Confirm!',
                    text: "Are you sure you want to delete all Booth?",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonClass: 'btn btn-success',
                    cancelButtonClass: 'btn btn-danger',
                    buttonsStyling: false
                }).then(function (result) {
                    if (result) {
                        $.ajax({
                            type: "POST",
                            url: "BoothMaster.aspx/BulkDelete",
                            data: "{ 'district':'" + district_Name + "','acname':'" + Ac_name + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                if (r.d == "Deleted") {
                                    swal("Success!", "District: " + district_Name + "| Acname:" + Ac_name + "  booth deleted successfully.", "success").then(function () {
                                        window.location.href = "BoothMaster.aspx";
                                    });
                                }
                                else {
                                    swal("Error!", "Error occured while deleting record.", "error");
                                }
                            }
                        });
                    }
                },
                    function (dismiss) {
                        if (dismiss == 'cancel') {
                            swal('Cancelled', 'No record Deleted', 'error');
                        }
                    });
                return false;
            }
        }

        function Confirm(msg,ID,ID1) {
            swal({
                title: 'Confirm!',
                text: "" + msg + "",
                type: 'warning',
                showCancelButton: true,
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then(function (result) {
                if (result) {
                    $.ajax({
                        type: "POST",
                        url: "BoothMaster.aspx/swapCamera",
                        data: "{id1:" + ID + ",id2:" + ID1 + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            if (r.d == "Swap") {
                                swal("Success!", "Swap successfully.", "success").then(function () {
                                    window.location.href = "BoothMaster.aspx";
                                });
                            }
                            else {
                                swal("Error!", "Error occured while deleting record.", "error");
                            }
                        }
                    });
                }
            },
                function (dismiss) {
                    if (dismiss == 'cancel') {
                        swal('Cancelled', 'No change', 'error');
                    }
                });
            return false;
        }

        function autocompletecameradid() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "eledata.asmx/GETStreamName",
                data: '{"did":"' + $j("#txtAddCameraId").val() + '"}',
                dataType: "json",
                success: function (data) {
                    $j("#txtAddCameraId").autocomplete({
                        source: data.d,
                        select: function (event, ui) {
                            $j("#txtAddCameraId").val(ui.item.value);
                        }
                    });
                },
                error: (error) => {
                    console.log(JSON.stringify(error));
                }
            });

        }

        function checkValidate() {
            debugger;
            var district_Name = $j("#<%=ddlDistrict.ClientID %> :selected").text();
            var Ac_name = $j("#<%=ddlAssembly.ClientID %> :selected").text();
            if (Ac_name == "ALL Assembly" || $j("#<%=ddlAssembly.ClientID %>").val() == "") {
                swal("Error!", "Please select Assembly!!", "error");
                return false;
            }
            $("#loaderdiv .loader").css({ "left": ($(window).width() / 2) });
            $("#loaderdiv .loader").css({ "top": ($(window).height() / 2) - 70 });
            $("#loaderdiv").show();
            
        };
    </script>
    <script type="text/javascript">

</script>
 
</asp:Content>
