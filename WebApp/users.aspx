<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="users.aspx.cs" Inherits="exam.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="bg-info">
        <div class="col-md-1">
        </div>
        <div class="col-md-1">
            <h4 class="text-center">
                District</h4>
        </div>
        <div class="col-md-2">
            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" AutoPostBack="true"
                OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-md-1">
            <h4 class="text-center">
                AC No</h4>
        </div>
        <div class="col-md-2">
            <asp:DropDownList ID="ddlPC" runat="server" AutoPostBack="true" CssClass="form-control"
                OnSelectedIndexChanged="ddlPC_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-md-1">
            <h4 class="text-center">
                AC Name</h4>
        </div>
        <div class="col-md-2">
            <asp:DropDownList ID="ddlbooth" runat="server" CssClass="form-control" AutoPostBack="true"
                OnSelectedIndexChanged="ddlbooth_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-md-1">
        </div>
        <div class="col-md-2">
        </div>
        <div class="col-md-2">
        </div>
        <hr />
        <div class="col-md-12">
            <div class="panel-body">
                <div class="table-responsive">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                            <asp:GridView ID="GridViewuser" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                                OnRowCancelingEdit="GridViewuser_RowCancelingEdit" OnRowDataBound="GridViewuser_RowDataBound"
                                OnRowEditing="GridViewuser_RowEditing" OnRowUpdating="GridViewuser_RowUpdating"
                                OnRowCommand="GridViewuser_RowCommand" ShowFooter="true">
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <h4>
                                            <label class="text-center text-danger">
                                                No Data Found</label>
                                        </h4>
                                    </div>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="username">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%# Eval("username") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txteditusername" runat="server" Text='<%# Eval("username") %>' />
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtusername" runat="server" placeholder="Enter Username" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="password">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpassword" runat="server" Text='<%# Eval("password") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txteditpassword" runat="server" Text='<%# Eval("password") %>' />
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtpassword" runat="server" placeholder="Enter Password" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblidentifier" runat="server" Text='<%# Eval("identifier").ToString() == "1" ? "Normal" : "DM" %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lbleditidentifier" Visible="false" runat="server" Text='<%# Eval("identifier") %>' />
                                            <asp:DropDownList ID="ddledituser" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="DM" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddluser" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="Normal" Selected="True" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="DM" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Enable/Disable" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblisenable" runat="server" Text='<%# Eval("isenable")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="cbenable" Checked='<%# Eval("isenable")%>' runat="server" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="State ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstateid" runat="server" Text='<%# Eval("stateid")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txteditstateid" runat="server" Text='<%# Eval("stateid") %>' />
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtstateid" runat="server" placeholder="Enter State ID" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Change status" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblislogin" runat="server" Text='<%# Eval("islogin")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="cblogin" Checked='<%# Eval("islogin")%>' runat="server" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Check Login" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblchklogin" runat="server" Text='<%# Eval("chklogin")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="cbchklogin" Checked='<%# Eval("chklogin")%>' runat="server" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update">
                                        <ItemTemplate>
                                            <div align="center">
                                                <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit"
                                                    CssClass="btn btn-info" />
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div align="center">
                                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" ToolTip="Update"
                                                    CssClass="btn btn-success btn-sm" />
                                                &nbsp; | &nbsp;
                                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" ToolTip="Cancel"
                                                    CssClass="btn btn-default btn-sm" />
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="btn_add" runat="server" Text="ADD" ToolTip="Add" CssClass="btn btn-success btn-sm"
                                                CommandName="AddNew" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function pageLoad() {
            $("#aspnetForm").validate({
                onsubmit: false,
                errorPlacement: function (error, element) {
                    element.append(error);
                }
            });
        }
       
    </script>
</asp:Content>
