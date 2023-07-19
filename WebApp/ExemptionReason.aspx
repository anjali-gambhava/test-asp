<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ExemptionReason.aspx.cs" Inherits="exam.ExemptionReason" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            margin-top:20px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="pd0 f-size-xxs">
        <div class="text-center text-danger page-header">
            <div class="flex-row flex-wrap -mr-sm">
                <div class="col-12 md:col-12 col12">
                     Exemption Reasons
                </div>
            </div>
        </div>
        <asp:GridView ID="ReasonGrid"
            CssClass="stacked table-zebra w-full text-center capitalize border-t border-default"
            runat="server"
            AutoGenerateColumns="false"
            AllowPaging="true"
            OnPageIndexChanging="OnPageIndexChanging"
            OnRowCommand="ReasonGrid_RowCommand"
            AlternatingRowStyle-CssClass="bg-light">
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

                <asp:TemplateField HeaderText="Name" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs text-left f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Eval("name") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs text-left f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Eval("desc")%></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Active" ItemStyle-CssClass="p-thin text-left" HeaderStyle-CssClass="f-size-xxs text-left f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate><%# Eval("active")%></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="p-thin text-center" ItemStyle-Width="20px" HeaderStyle-Width="20px" HeaderStyle-CssClass="f-size-xxs text-center f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate>
                        <asp:LinkButton ID="DeleteReason" runat="server"
                            ToolTip="Delete Reason"
                            CssClass="button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary"
                            CommandName="DeleteReason"
                            CommandArgument='<%# Eval("id")%>'>                      
                                    <img src="images/delete-24.png" alt="Edit" width="20" />
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="p-thin text-center" ItemStyle-Width="20px" HeaderStyle-Width="20px" HeaderStyle-CssClass="f-size-xxs text-center f-color-secondary border-default border-b sr-header p-xs">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditReason" runat="server"
                            ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs"
                            ToolTip="Edit Reason"
                            CssClass="button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary"
                            CommandName="EditReason"
                            CommandArgument='<%# Eval("id")%>'>
                                    <img src="images/edit2.png" alt="Edit" width="20" />
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="flex-row flex-wrap -mr-sm">
            <div class="col-12 md:col-12 col12">
                <div class="box">
                    <asp:Button ID="Add_Reason"
                        runat="server"
                        CssClass="custom-button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary"
                        OnClick="AddReason"
                        Text="Add Reason"></asp:Button>
                </div>
            </div>
        </div>

        <!-- Modal Start -->
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
                                        <label for="name">Reason </label><br />
                                        <input type="text" runat="server" id="name" name="name" maxlength="50" class="border pr-md pl-xs py-xs">
                                    </td>
                                    <td class="p-thin">
                                        <label for="desc">Description</label>
                                        <input type="text" runat="server" id="desc" name="desc" class="border pr-md pl-xs py-xs">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p-thin" colspan="2">
                                        <div class="select">
                                                <label for="activeCBox">Active</label>
                                                <asp:DropDownList ID="activeCBox"
                                                    runat="server"
                                                    CssClass="datalist border pr-md pl-xs py-xs"
                                                    Width="100%"
                                                    >
                                                    <asp:ListItem Value="1">Enabled</asp:ListItem>
                                                    <asp:ListItem Value="0">Disabled</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="Delete" class="modal-body">
                        Are You Sure... You Want to Delete Updatation..?
                    </div>
                    <div>
                        <table class="f-size-xxs" style="width: 100%">
                            <thead>
                                <tr>
                                    <td class="p-thin">
                                        <div class="box">
                                            <asp:LinkButton ID="ReasonChangeConfirm"
                                                runat="server"
                                                OnClientClick="return confirm('Are you sure you want to Save this record?')"
                                                OnClick="ReasonChange"
                                                CssClass="no-underline custom-button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary">
                                            </asp:LinkButton>
                                        </div>
                                    </td>
                                    <td class="p-thin">
                                        <div class="box">
                                            <button id="Cancel"
                                                class="custom-button f-color-primary opacity-50 hover:opacity-100 hover:f-color-secondary">
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
</asp:Content>
