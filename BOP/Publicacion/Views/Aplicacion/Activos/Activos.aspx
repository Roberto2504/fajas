<%@ Page Title="Activos" Language="C#" MasterPageFile="~/Views/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Activos.aspx.cs" Inherits="HILJO.Views.Aplicacion.Activos.Activos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAplicacion" runat="server">
      <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Insumos</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                
                 <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Activos</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- .row -->
        <div class="row">
            <% foreach (HILJO.BO.HILJO_spListarActivosResult dato in HILJO.Views.Aplicacion.Activos.Activos.lActivos) { %>
            <!-- .col -->
            
            <div class="col-md-3 col-sm-3">
                <div class="white-box"><a href="MantenimientoActivo.aspx?Ac=<%:dato.INA_PK_INVACTIVO %>">
                    <div class="row"> 
                        <div class="col-md-12 col-sm-12">
                            <h3 class="box-title m-b-0"><%: dato.INA_MARCA %></h3>
                            <small><%: dato.INA_MODELO %></small>
                            <p> 
                                <address> 
                                    <% if (!dato.INA_CARACTERISTICAS.ToString().Equals("")){%>
                                    Caracteristicas:  <%: dato.INA_CARACTERISTICAS %><% }%> <br />
                                    <% if (!dato.INA_COSTO.ToString().Equals("")) {%>
                                    Costo:  <%: dato.INA_COSTO%><% }%> <br />
                                    <% if (!dato.INA_PLACA.ToString().Equals("")) {%>
                                    Placa:  <%: dato.INA_PLACA%><% }%> <br />
                                    <% if (!dato.INA_SERIE.ToString().Equals("")) {%>
                                    Serie:  <%: dato.INA_SERIE%><% }%> <br />
                                    <% if (!dato.INA_USO.ToString().Equals("")) {%>
                                    Placa:  <%: dato.INA_USO%><% }%> <br />
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
