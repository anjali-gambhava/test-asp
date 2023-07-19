<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="exam.excelreport.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Excel Report</title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="navbar navbar-default label-warning">
                <h2 class="text-center control-label pull-left">
                    Excel Report</h2>
            </div>
            <div class="col-md-4 bg-white">
                
            </div>
             <div class="col-md-4 bg-white">
                <asp:Button ID="btnreportdst" runat="server" Text="Download ALL Booth Report" CssClass="btn btn-primary btnwidthexcel "
                    OnClick="btnreportdst_Click" />
            </div>
             <div class="col-md-4 bg-white">
              
            </div>
        </div>
    </div>
    </form>
</body>
</html>
