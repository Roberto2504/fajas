<%@ Page Title="Insumos" Language="C#" MasterPageFile="~/Views/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Insumos.aspx.cs" Inherits="HILJO.Views.Aplicacion.Insumos.Insumos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAplicacion" runat="server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Insumos</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                
                 <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Insumos</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- .row -->
        <div class="row">
            <% foreach (HILJO.BO.HILJO_spListarInsumosResult dato in HILJO.Views.Aplicacion.Insumos.Insumos.lInsumos) { %>
            <!-- .col -->
            
            <div class="col-md-3 col-sm-3">
                <div class="white-box"><a href="MantenimientoInsumo.aspx?In=<%:dato.INI_PK_INVINSUMO %>">
                    <div class="row"> 
                        <div class="col-md-12 col-sm-12">
                            <h3 class="box-title m-b-0"><%: dato.INI_NOMBRE %></h3>
                            <small><%: dato.PRO_EMPRESA %></small>
                            <p> 
                                <address> 
                                    <abbr title="Cantidad Minima">CM:</abbr>
                                    <%: dato.INI_MINIMO %> <br />
                                    <abbr title="Cantidad Actual">CA:</abbr>
                                    <%: dato.INI_CANTIDADACT %> <br />
                                </address>
                            </p>
                        </div> 
                    </div></a>
                </div>
            </div>
            <!-- /.col -->   
             <% } %>
            
        </div>
        <!-- /.row --> 
        </div>
           
</asp:Content>
