<%@ Page Title="proveedores" Language="C#" MasterPageFile="~/Views/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="HILJO.Views.Aplicacion.Proveedores.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAplicacion" runat="server">
      <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Proveedores</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                
                 <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Proveedores</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- .row -->
        <div class="row">
            <% foreach (HILJO.BO.HILJO_spListarProveedoresResult dato in HILJO.Views.Aplicacion.Proveedores.Proveedores.lProveedores) { %>
            <!-- .col -->
            
            <div class="col-md-6 col-sm-6">
                <div class="white-box"> 
                    <div class="row"> 
                        <div class="col-md-4 col-sm-4 text-center">
                                    <a href="MantenimientoProveedor.aspx?Pr=<%:dato.PRS_PK_CEDULA %>"><img src="../../../plugins/images/users/user.png" alt="user" class="img-circle img-responsive"></a>
                                </div>
                        <div class="col-md-8 col-sm-8">
                            <h3 class="box-title m-b-0"><%: dato.PRO_EMPRESA %></h3>
                            <small><%: dato.TIPOPERSONA %></small>
                            <p> 
                                <address> 
                                    Contacto: <%: dato.NOMBRE %><br />
                                    Servicios: <%: dato.PRO_SERVICIOS %> <br />
                                    <abbr title="Cedula Juridica">ID: </abbr> <%: dato.PRS_PK_CEDULA %> <br/>
                                    <abbr title="Direccion">D: </abbr> <%: dato.DIRECCION %> <br/>
                                    <abbr title="Telefono o Celular">T/C: </abbr> <%: dato.TELEFONO %> <br/>
                                    <abbr title="Correo">C: </abbr> <%: dato.CORREO %> <br/>
                                       
                                </address>
                            </p>
                        </div> 
                    </div> 
                </div>
            </div>
            <!-- /.col -->   
             <% } %>

            
        </div>
        <!-- /.row --> 
        </div>
     
</asp:Content>
