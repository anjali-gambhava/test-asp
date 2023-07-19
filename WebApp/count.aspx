<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="count.aspx.cs" Inherits="exam.count" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <hr />
                <div class="table-responsive">
                    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="10000">
                    </asp:Timer>
                    <div class="col-md-4">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover">
                                    <Columns>
                                        <asp:TemplateField HeaderText="District">
                                            <ItemTemplate>
                                                <asp:Label ID="lblbooth" runat="server" Text='<%# Eval("district")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Booth">
                                            <ItemTemplate>
                                                <asp:Label ID="lblbooth" runat="server" Text='<%# Eval("totalbooth")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Actual Live">
                                            <ItemTemplate>
                                                <asp:Label ID="lblalive" runat="server" Text='<%# Eval("actuallive")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Once Connected">
                                            <ItemTemplate>
                                                <asp:Label ID="lblonceconn" runat="server" Text='<%# Eval("connectedonce")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div align="center">
                                            <h4>
                                                <label class="text-center text-danger">
                                                    No Data Available</label>
                                            </h4>
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="col-md-3">
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
                            </div>
                            <div class="col-md-5">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                                    OnRowCancelingEdit="GridViewbooth_RowCancelingEdit" OnRowEditing="GridViewbooth_RowEditing"
                                    OnRowUpdating="GridViewbooth_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Static Live count">
                                            <ItemTemplate>
                                                <asp:Label ID="lblslive" runat="server" Text='<%# Eval("staticcount")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtslive" runat="server" Text='<%# Eval("staticcount")%>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="District">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldistname" runat="server" Text='<%# Eval("dist_name")%>'></asp:Label>
                                            </ItemTemplate>
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
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div align="center">
                                            <h4>
                                                <label class="text-center text-danger">
                                                    No Data Available</label>
                                            </h4>
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
