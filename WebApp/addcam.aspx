<%@ Page Title="" Language="C#" MasterPageFile="~/MainOld.Master" AutoEventWireup="true" CodeBehind="addcam.aspx.cs" Inherits="exam.addcam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <hr />
    <div class="row" style="background-color: White">
        <div class="col-md-12">
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
            <div class="col-md-4">
                <div class="form-group">
                    <label for="txtstreamname">
                        Enter Camera</label>
                    <div class="">
                        <asp:TextBox ID="txtstreamname" MaxLength="6" class="form-control" runat="server"
                            placeholder="Enter Camera" />
                    </div>
                </div>
                <asp:Button ID="btnaddevent" runat="server" Text="ADD" CssClass="btn-success btn-sm"
                    OnClick="btnaddevent_Click" />
            </div>
        </div>
    </div>
</asp:Content>
