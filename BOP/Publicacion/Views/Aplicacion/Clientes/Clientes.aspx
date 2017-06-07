<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Views/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="HILJO.Views.Aplicacion.Clientes.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAplicacion" runat="server">
       <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Clientes</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                
                 <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Clientes</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- .row -->
        <div class="row">
            <% foreach (HILJO.BO.HILJO_spListarClientesResult dato in HILJO.Views.Aplicacion.Clientes.Clientes.lClientes) { %>
            <!-- .col -->
            
            <div class="col-md-4 col-sm-4">
                <div class="white-box">
                    
                    <div class="row">  
                        <div class="col-md-12 col-sm-12">
                            <a href="MantenimientoCliente.aspx?Cl=<%:dato.PRS_PK_CEDULA %>"> 
                            <h3 class="box-title m-b-0"><%: dato.PRS_RAZONSOCIAL %></h3>
                            <small><%: dato.TIPOPERSONA %></small></a>
                            <p> 
                                <address> 
                                    Contacto: <%: dato.NOMBRE %><br />
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
