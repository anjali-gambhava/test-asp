<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="exam.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link href="plugins/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" rel="stylesheet" /> 
  <link rel="stylesheet" href="dist/css/adminlte.min.css"  rel="stylesheet" />
      <script src="plugins/jquery/jquery.min.js"></script>  
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="dist/js/adminlte.min.js"></script>
 <%--   <style>
        button, input, optgroup, select, textarea {
            font: inherit;
            font-size: 100%;
            line-height: 1.15;
            border-radius: 0;
            background: 0 0;
            -webkit-appearance: none;
        }
    </style>--%>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 <%--   <div class="class="hold-transition login-page"">
        <div class="row">
            <div class="card col-md-4 col-md-push-4" style="margin-top: 10; background-color: white;border-radius:15px; border: 4px solid #345672;">
                <h3 class="text-left">
                    User Login</h3>
                <div align="center">
                    
                <br />
               

             
                
            </div>
        </div>
        <br />
    </div>--%>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
        .card {
    background-color: #F7F7F7!important;
    padding: 0px!important;
    /* margin: 0 auto 25px; */
    margin-top: 50px!important;
    -moz-border-radius: 2px;
    /* -webkit-border-radius: 2px; */
    border-radius: 15px!important;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3)!important;
    /* -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3); */
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3)!important;
        border: 1px solid #000c0edb;
}
        .card-body {
    flex: 1 1 auto!important;
    padding: 30px 10px!important;
}
     
          .card-outline {
    border-top: 3px solid #007bff!important; 
}
            .form-control {
                font-size: 18px;
                font-weight: 400;
                line-height: 1.5;
                color: #212529;
                background-color: #fff;
                background-clip: padding-box;
                border-radius: 9px;
            }
            .input-group-text {
                font-size: 18px;
                display: block;
            }
            .btn {
                padding: 0px 10px;
                font-size: 18px;
                border-radius: 7px;
            }
            .mb-3 {
    margin-bottom: 2rem !important;
}
             @media (min-width: 768px) 
            { 
            .login-page{
                 padding:0px 38%!important;
            }
            
            }
             
           #toast-container>div {
    position: fixed!important;
    top:55%;
    right:40%;
}
           .toast-message
           {
               font-size:14px!important;
           }
    </style>


     <div class="hold-transition login-page">
    <div class="login-box">
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-header text-center">
  <a href="#" class="h1"><b>Sign in</b></a> 
    </div>
    <div class="card-body">
      <%--<p class="login-box-msg">Sign in to start your session</p>--%>
         
        <div class="input-group mb-3">
          <%--<input type="email" class="form-control" placeholder="Email">--%>
             <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control required" placeholder="Enter Username"></asp:TextBox> 
                
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user-alt"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
         <%-- <input type="password" class="form-control" placeholder="Password">--%>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control required" TextMode="Password"
                    placeholder="Enter Password"></asp:TextBox> 
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8"> 
          </div>
          <!-- /.col -->
          <div class="col-4">
            <%--<button type="submit" class="btn btn-primary btn-block">Sign In</button>--%>
              <asp:Button ID="btn_Login" runat="server" class="btn btn-primary btn-block toastrDefaultError"
                    Text="Login" OnClientClick="javascript: return checkValidate();" OnClick="btn_Login_Click" />
          </div>
          <!-- /.col -->
        </div>
         <div class="social-auth-links text-center mt-2 mb-3">
       <asp:Label ID="lblMsg" CssClass="btn btn-block btn-primary"  
                        runat="server"></asp:Label>
         
      </div> 
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card --> 
        </div>
         </div>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">

  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
    <script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="plugins/toastr/toastr.min.js"></script>
    <script type="text/javascript">
        function checkValidate() {
            if ($("#<%= txtUsername.ClientID %>").valid() && $("#<%= txtPassword.ClientID %>").valid()) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
    <script>
        //$(function () {
        //    $('.toastrDefaultError').click(function () {
        //        toastr.error('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
        //    });
        //});
    </script>
</asp:Content>
