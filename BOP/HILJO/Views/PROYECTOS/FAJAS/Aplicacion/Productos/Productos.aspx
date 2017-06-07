<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PROYECTOS/FAJAS/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="BOP.Views.PROYECTOS.FAJAS.Aplicacion.Productos.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAFAJAS" runat="server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Productos</h4>
                  
                                      
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <a href="MantenimientoProducto.aspx?Pr=" class="right-side-toggle waves-effect waves-light btn-info btn-circle pull-right m-l-20"><i class="ti-plus text-white"></i></a>
                <ol class="breadcrumb">  
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Productos</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        
        <div class="row">
            <div class="col-md-12 col-xs-12"> 
                    <% foreach (BOP.BO.BOP_FAJAS_spListarProductosResult dato in BOP.Views.PROYECTOS.FAJAS.Aplicacion.Productos.Productos.lProductos) { %>
            <!-- .col -->
            
            <div class="col-md-4 col-sm-4">
                <div class="white-box"> 
                    <div class="row"> 
                        <div class="col-md-4 col-sm-4 text-center">
                                    <a href="MantenimientoProducto.aspx?Pr=<%:dato.Pro_Pk %>"><img src="../../../plugins/images/20170224_161556.jpg" alt="user" class="img-circle img-responsive"></a>
                                </div>
                        <div class="col-md-8 col-sm-8">
                            <h3 class="box-title m-b-0"><%: dato.Pro_Name %></h3>
                            <small><%: dato.ProTyp_Name %> </small>
                            <p> 
                                <address>
                                    Descripción: <%:dato.Pro_Description %> <br />
                                    <abbr title="Identificador del Producto">CÓDIGO: </abbr> <%: dato.Pro_Code %> <br/>
                                    <abbr title="Precio">₡: </abbr> <%: dato.Pro_SalePrice %> <br/>
                                         
                                </address>
                            </p>
                        </div> 
                    </div> 
                </div>
            </div>
            <!-- /.col -->   
             <% } %>
                 
            </div>
        </div>
       </div>
</asp:Content>
