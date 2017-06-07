<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PROYECTOS/FAJAS/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="MantenimientoProducto.aspx.cs" Inherits="BOP.Views.PROYECTOS.FAJAS.Aplicacion.Productos.MantenimientoProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAFAJAS" runat="server">
     <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Detalle Producto</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">  
                        <ol class="breadcrumb">
                            <li><a href="#">Inicio</a></li>
                            <li><a href="Productos.aspx">Productos</a></li>
                            <li class="active">Detalle Producto</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-md-4 col-xs-12">
                        <div class="white-box">
                            <div class="user-bg"> <img width="100%" alt="user" src="../../../plugins/images/large/img1.jpg"> </div>
                            <div class="user-btm-box">
                                <!-- .row -->
                                <div class="row text-center m-t-10">
                                    <div class="col-md-6 b-r"><strong>NOMBRE</strong>
                                        <p>
                                            <asp:Label runat="server" ID="lblNombre"></asp:Label>
                                        </p>
                                    </div>
                                    <div class="col-md-6"><strong>CÓDIGO</strong>
                                        <p>
                                            <asp:Label runat="server" ID="lblCodigo"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <!-- /.row -->
                                <hr>
                                <!-- .row -->
                                <div class="row text-center m-t-10">
                                    <div class="col-md-6 b-r"><strong>Tipo</strong>
                                        <p>
                                            <asp:Label runat="server" ID="lblTipo"></asp:Label>
                                        </p>
                                    </div>
                                    <div class="col-md-6"><strong>Precio</strong>
                                        <p>
                                            <asp:Label runat="server" ID="lblPrecio"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <!-- /.row -->
                                <hr>
                                 <div class="row text-center m-t-10">
                                    <div class="col-md-12">
                                        <strong>DESCRIPCIÓN</strong>
                                        <p>
                                            <asp:Label runat="server" Text="" ID="lblDescripcion"></asp:Label></p>

                                    </div>
                                </div>
                                <hr />
                                <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                    <asp:Button ID="btnEditarProducto" runat="server" Text="Editar" 
                                        CssClass="btn btn-warning btn-rounded"/>

                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                    <asp:Button ID="btnEliminaProducto" runat="server" Text="Eliminar" 
                                        CssClass="btn btn-danger btn-rounded" />

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-xs-12">
                        <div class="white-box"> 
                        </div>
                    </div>
                </div>
             
            </div>
           
</asp:Content>
