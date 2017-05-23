<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Views/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="HILJO.Views.Aplicacion.Productos.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAplicacion" runat="server">
      <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Productos</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                
                 <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Productos</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- .row -->
        <div class="row">
            <% foreach (HILJO.BO.HILJO_spListarProductosResult dato in HILJO.Views.Aplicacion.Productos.Productos.lProductos) { %>
            <!-- .col -->
            
            <div class="col-md-4 col-sm-4">
                <div class="white-box"> 
                    <div class="row"> 
                        <div class="col-md-4 col-sm-4 text-center">
                                    <a href="MantenimientoProducto.aspx?Pr=<%:dato.PRD_PK_PRODUCTO %>"><img src="../../../plugins/images/20170224_161556.jpg" alt="user" class="img-circle img-responsive"></a>
                                </div>
                        <div class="col-md-8 col-sm-8">
                            <h3 class="box-title m-b-0"><%: dato.PRO_NOMBRE %></h3>
                            <!--<small></small>-->
                            <p> 
                                <address>
                                    Descripción: <%:dato.PRO_DESCRIPCION %> <br />
                                    <abbr title="Identificador del Producto">ID: </abbr> <%: dato.PRD_PK_PRODUCTO %> <br/>
                                    <abbr title="Precio">₡: </abbr> <%: dato.PRO_PRECIO %> <br/>
                                          
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
