﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PROYECTOS/FAJAS/FAJAS.master" 
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BOP.Views.PROYECTOS.FAJAS.Login.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHFAJAS" runat="server">
    <!DOCTYPE html>  
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16" href="../../plugins/images/favicon.png">
<title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
<!-- Bootstrap Core CSS -->
<link href="../bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- animation CSS -->
<link href="../css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="../css/colors/default.css" id="theme"  rel="stylesheet"> 
</head>
<body>
<!-- Preloader -->
<div class="preloader">
  <div class="cssload-speeding-wheel"></div>
</div>
<section id="wrapper" class="new-login-register">
      <div class="lg-info-panel">
              <div class="inner-panel">
                  <a href="javascript:void(0)" class="p-20 di"><img src="../../plugins/images/admin-logo.png"></a>
                  <div class="lg-content">
                      </div>
              </div>
      </div>
      <div class="new-login-box">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Iniciar Sesión</h3>
                    <small>Ingresa tus credenciales</small>
                  <form runat="server" class="form-horizontal new-lg-form" data-toggle="validator">
                    
                    <div class="form-group m-t-20">
                      <div class="col-xs-12">
                        <label>Usuario</label>
                        <asp:TextBox ID="txtUsu" runat="server" class="form-control form-control-line" type="text" 
                            required="" placeholder="Usuario"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-xs-12">
                        <label>Contraseña</label>
                        <asp:TextBox runat="server" ID="txtPass" class="form-control form-control-line" type="password" required="" placeholder="Contraseña"/>
                      </div>
                    </div> 
                    <div class="form-group text-center m-t-20">
                      <div class="col-xs-12">
                         
                           <asp:Button ID="btnRMUsuario" Text="Iniciar" type="submit" CausesValidation="true" OnClick="Iniciar_Click" 
                                    runat="server" class="btn btn-success " ></asp:Button>
                                
                      </div>
                    </div>  
                    </form>  
                  </div>
                  
                </div>
      </div>            
  
  
</section>
<!-- jQuery -->
<script src="../../plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="../../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>

<!--slimscroll JavaScript -->
<script src="../js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="../js/waves.js"></script>
    
        <script src="../js/validator.js"></script>
<!-- Custom Theme JavaScript -->
<script src="../js/custom.min.js"></script>
<!--Style Switcher -->
<script src="../../plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>

</asp:Content>
