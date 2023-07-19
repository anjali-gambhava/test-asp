<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="UsersMaster.aspx.cs"
    Inherits="exam.UsersMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/assets/jstree/dist/themes/default/style.min.css" />
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>--%>
    <%--<script src="/assets/jstree/dist/jstree.min.js"></script>--%>
    <style>
        .select:after {
            width: 0.7rem !important;
            height: 0.7rem !important;
        }

        .Background {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .Popup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            /*padding-top: 10px;
            padding-left: 10px;*/
            width: 500px;
            
        }

        .lbl {
            font-size: 16px;
            font-style: italic;
            font-weight: bold;
        }

        .ui-dialog-title {
            font-size: 80% !important;
        }

        .ui-widget-header {
            background: #e8eef1;
        }

        .ui-corner-all {
            border-radius: 0 !important;
        }
        .page-header{
            font-size:25px;
            margin:10px;
        }
        .custom-button{
            border:1px solid black;
            padding:10px;
            font-size:20px;
            color:black;
            background-color: lightgray;
            /*margin-top:20px;*/
            display: flex;  
            justify-content: center;  
            align-items: center;  
        }
        .box{
            display: flex;  
            justify-content: center;  
            align-items: center;  
            text-align:center;
        }
        .page span{
            background: #19cbfe;
            font-size: 1rem;
            padding-left: 1rem;
            padding-right: 1rem;
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            color: #fff;
        }
        .page table{
            margin: auto;
            margin-top:2rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="pd0 f-size-xxs">
        <div class="text-center text-danger page-header">
            <div class="flex-row flex-wrap -mr-sm">
                <div class="col-12 md:col-12 col12">
                    User Master
                </div>
            </div>
        </div>
         <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>--%>
                            <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                                <table class="f-size-xxs">
                                    <tr>
                                        <td class="pr-xs">
                                            <asp:Button Text="Add User" ID="Add_User" runat="server" CssClass="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline" data-toggle="modal" data-backdrop="static"
                                                 OnClick="Adduser"/>

                                         <%--    <asp:Button ID="Add_User"
                        runat="server"
                        CssClass="custom-button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary"
                        OnClick="Adduser"
                        Text="Add User"></asp:Button>--%>



                                        </td>
                                        <td class="pr-xs">
                                            <a href="UserExcelFormat.xlsx" class="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline" target="_blank">Excel format</a>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUploadbooth" runat="server" CssClass="border p-thin" Style="width: 200px; padding: 0; font-size: 15px;" />
                                            <asp:Button ID="btnupload" runat="server" Text="Upload User Data" CssClass="cursor-pointer bg-primary f-color-white  f-weight-semibold hover:shadow-md transition-all px-2xs py-thin"
                                                 OnClientClick="javascript: return checkValidate();" OnClick="btnupload_Click"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                     <%--   </ContentTemplate>
                        <Triggers>
                              <asp:PostBackTrigger ControlID="btnupload" />
                            <asp:AsyncPostBackTrigger ControlID="Add_User" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
        <asp:GridView ID="userGrid"
            CssClass="stacked table-zebra w-full text-center capitalize border-t border-default"
            runat="server"
            AutoGenerateColumns="false"
            AllowPaging="true"
            OnPageIndexChanging="OnPageIndexChanging"
            OnRowCommand="userGrid_RowCommand"
            AlternatingRowStyle-CssClass="bg-light" PagerStyle-CssClass="page">
            <EmptyDataTemplate>
                <div align="center">
                    <h4>
                        <label class="text-center text-danger">
                            No Data Found</label>
                    </h4>
                </div>
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="No" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UserName" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs text-left f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Eval("username") %></ItemTemplate>
                </asp:TemplateField>
                 <%--<asp:TemplateField HeaderText="Password" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Eval("password") %></ItemTemplate>
                </asp:TemplateField>--%>
                 <asp:TemplateField HeaderText="User Role" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs text-left f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Eval("usercode").ToString().Replace("_"," ") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Identifier" ItemStyle-CssClass="d-hidden p-thin" HeaderStyle-CssClass="d-hidden f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Eval("Identifier")%></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Is Enable" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs text-left f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Convert.ToBoolean(Eval("isenable")) == true ? "Enabled" : "Disabled" %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State ID" ItemStyle-CssClass="d-hidden p-thin" HeaderStyle-CssClass="d-hidden f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Eval("stateid")%></ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs text-left f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate>
                        <asp:LinkButton ID="Deleteuser" runat="server"
                            ToolTip="Delete User"
                            CssClass="button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary"
                            CommandName="DeleteUser"
                            CommandArgument='<%# Eval("id")%>' 
                            >
                                    <img src="images/delete-24.png" alt="Edit" width="20" />
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditUser" runat="server"
                            ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs"
                            ToolTip="Edit User"
                            CssClass="button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary"
                            CommandName="EditUser"
                            CommandArgument='<%# Eval("id")%>'
                            >
                                    <img src="images/edit2.png" alt="Edit" width="20" />
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="flex-row flex-wrap -mr-sm">
            <div class="col-12 md:col-12 col12 mt-sm">
                <div>
                   <%-- <asp:Button ID="Add_User"
                        runat="server"
                        CssClass="custom-button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary"
                        OnClick="Adduser"
                        Text="Add User"></asp:Button>--%>
                </div>
                 <%--<div class="box">--%>
                <div class="d-hidden">
                    <asp:FileUpload ID="FileUploadData" runat="server" />
                    <asp:Button ID="btnUploadMasterData"
                        runat="server"
                        CssClass="custom-button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary"
                        OnClick="btnUploadMasterData_Click"
                        Text="Upload Master Data"></asp:Button>
                </div>
                
            </div>
        </div>

        <div align="center">
            <div id="Modal" class="modal fade in">
            <div class="Popup">
                <div class="bg-white shadow flex-stretch border-b border-default p-xs">
                    <div>
                        <h1 class="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center" id="headerText" runat="server"></h1>
                    </div>
                    <div id="AddUpdate" class="modal-body">
                        <table class="f-size-xxs" style="width: 100%">
                            <tbody>
                             
                                <tr>
                                    <td class="p-thin">
                                        <label for="userName">UserName</label>
                                        <input type="text" runat="server" id="userName" name="userName" class="border pl-xs py-xs" />
                                    </td>
                                    <td class="p-thin">
                                        <label for="userpassword">Password</label>
                                        <input type="text" runat="server" id="userpassword" name="userpassword" class="border pl-xs py-xs" />
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td colspan="2" >
                                        <label for="isenable">Is Enable</label>
                                       <asp:DropDownList ID="isenabled"
                                                    runat="server"
                                                    CssClass="datalist border pr-md pl-xs py-xs"
                                                    Width="100%"
                                                    >
                                                    <asp:ListItem Value="1">Enabled</asp:ListItem>
                                                    <asp:ListItem Value="0">Disabled</asp:ListItem>
                                                </asp:DropDownList>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="2" >
                                        <label for="isenable">Role</label>
                                       <asp:DropDownList ID="userRole"
                                                    runat="server"
                                                    CssClass="datalist border pr-md pl-xs py-xs"
                                                    Width="100%"
                                                    >
                                                    <asp:ListItem Value="Master_Admin">Master Admin</asp:ListItem>
                                                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                           <asp:ListItem Value="HelpDesk_Team">HelpDesk Team</asp:ListItem>
                                           <asp:ListItem Value="HelpDesk_Manager">HelpDesk Manager</asp:ListItem>
                                           <asp:ListItem Value="VMukti_Internal">VMukti Internal</asp:ListItem>
                                           <asp:ListItem Value="PIL">PIL</asp:ListItem>
                                           <asp:ListItem Value="CEO">CEO</asp:ListItem>
                                           <asp:ListItem Value="District_Level">District Level</asp:ListItem>
                                           <asp:ListItem Value="Assembly_Level">Assembly Level</asp:ListItem>
                                           <asp:ListItem Value="District_Managers-Vmukti">District Managers-Vmukti</asp:ListItem>
                                                </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr><td colspan="2" style="border-top:1px gray solid">
                        <b><label for="access">Select Access</label></b>
                        <input type="text" runat="server" id="Accessids" style="display:none" name="Accessids" class="Accessids border pl-xs py-xs" />

                        <div id="jstree_demo_div" style="text-align:left;height:150px;overflow-y: scroll;"></div></td></tr>
                            </tbody>
                        </table>
                        
                    </div>
                    <div id="Delete" class="modal-body">
                        Are You Sure... You Want to Delete User..?
                    </div>
                    <div>
                        <table class="f-size-xxs" style="width: 100%">
                            <thead>
                                <tr>
                                    <td class="p-thin">
                                        <div class="box">
                                            <asp:LinkButton ID="ChangeConfirm"
                                                runat="server"
                                                OnClientClick="return confirm('Are you sure you want to Save this record?')"
                                                OnClick="UserChange" Text=""
                                                CssClass="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline">
                                            </asp:LinkButton>
                                        </div>
                                    </td>
                                    <td class="p-thin">
                                        <div class="box">
                                            <button id="Cancel"
                                               Class="cursor-pointer bg-primary f-color-white f-weight-semibold hover:shadow-md transition-all px-2xs py-thin no-underline">
                                                Cancel
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    <script src="/assets/jstree/dist/jstree.min.js"></script>
    <script>
        var modal = document.getElementById('Modal');
        var addUpdate = document.getElementById('AddUpdate');
        var dlt = document.getElementById('Delete');

        window.onclick = function (event) {
            if (event.target == modal) {
                document.getElementById('Modal').style.display = 'none';
            }
        }

        $(window).on("load resize ", function () {
            var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
            $('.tbl-header').css({ 'padding-right': scrollWidth });
        }).resize();
    </script>


      
    <script>
     
        function createJSTree() {
            $('#jstree_demo_div').jstree({

                 "core": {
                     "themes": {
                         "theme": "default",
                         "dots": false,
                     },
                     'data': {
                         "type": "POST",
                         "url": "UsersMaster.aspx/GetDistrictList",
                         "contentType": "application/json; charset=utf-8",
                     }

                 },
                "checkbox": {
                    "keep_selected_style": false
                },
                "plugins": [ "checkbox"],

            });
        }
        createJSTree()
        //$('#jstree_demo_div').jstree({

        //    'core' : {
        //        'data' : {
        //            'url' : "UsersMaster.aspx/GetDistrictList",
        //            'data' : function (node) {
        //                return { 'id' : node.id };
        //            }
        //        }
        //    },

       //     "core": {
       //         "themes": {
       //             "variant": "large"
       //         },
       //         'data': [
       //{ "id": "ajson1", "parent": "#", "text": "Simple root node" },
       //{ "id": "ajson2", "parent": "#", "text": "PATHANKOT" },
       //{ "id": "ajson3", "parent": "ajson2", "text": "Sujanpur" },
       //{ "id": "ajson4", "parent": "ajson2", "text": "Bhoa(SC)" },
        //         ]

       //     },
        //    "checkbox": {
        //        "keep_selected_style": false
        //    },
        //    "plugins": ["wholerow", "checkbox"],
                
        //});
        
        $('#jstree_demo_div').on("loaded.jstree", function (e, data) {
            var strids = $(".Accessids").val();
            var array = strids.split(',');
            data.instance.select_node(array); //node ids that you want to check
        });
        $('#jstree_demo_div').on("changed.jstree", function (e, data) {
            $(".Accessids").val(data.selected)
        });

        function checkValidate() {
            $("#loaderdiv .loader").css({ "left": ($(window).width() / 2) });
            $("#loaderdiv .loader").css({ "top": ($(window).height() / 2) - 70 });
            $("#loaderdiv").show();
        };
      
    </script>
</asp:Content>
