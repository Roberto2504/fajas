<%@ Page Title="Informacion " Language="C#" MasterPageFile="~/Views/Aplicacion/Aplicacion.master" 
    AutoEventWireup="true" CodeBehind="MantenimientoCliente.aspx.cs" 
    Inherits="HILJO.Views.Aplicacion.Clientes.MantenimientoCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAplicacion" runat="server">
       <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Información</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                
                 <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                     <li><a runat="server" href="Clientes.aspx">Clientes</a></li>
                    <li class="active">Información</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- .row -->
           <div class="row">
               <div class="col-md-4 col-xs-12">
                   <div class="white-box">
                       <div class="user-btm-box">
                           <asp:UpdatePanel runat="server" ID="upInformacionPersona"><ContentTemplate>
                           <!-- .row -->
                           <div class="row text-center m-t-10">
                               <div class="col-md-6 b-r">
                                   <strong>Razón Social</strong>  
                                   <p><asp:Label runat="server" Text="" ID="lblRazonSocial"></asp:Label></p>
                               </div>
                               <div class="col-md-6">
                                   <strong>Cédula / Cédula Juridica</strong>  
                                   <p><asp:Label runat="server" Text="" ID="lblCedula"></asp:Label></p>
                               </div>
                           </div>
                           <!-- /.row -->
                           <hr>
                           <div class="row text-center m-t-10">
                               <div class="col-md-12">
                                   <strong>Contacto</strong>  
                                   <p><asp:Label runat="server" Text="" ID="lblNombre"></asp:Label></p>
                               </div>
                           </div>
                           <hr />
                           <!-- .row -->
                           <div class="row text-center m-t-10">
                               <div class="col-md-6 b-r">
                                   <strong>Correo</strong>
                                    <p><asp:Label runat="server" Text="" ID="lblCorreo"></asp:Label></p>
                               </div>
                               <div class="col-md-6">
                                   <strong>Telefono</strong>
                                   <p><asp:Label runat="server" Text="" ID="lblTelefono"></asp:Label></p>
                               </div>
                           </div>
                           <!-- /.row -->
                           <hr>
                           <!-- .row -->
                           <div class="row text-center m-t-10">
                               <div class="col-md-12">
                                   <strong>Dirección</strong> 
                                       <p><asp:Label runat="server" Text="" ID="lblDireccion"></asp:Label></p>
                                    
                               </div>
                           </div>
                           <hr>
                           <!-- /.row -->
                           <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                               <p class="text-purple">Facturas Contado</p>
                               <h1><asp:Label runat="server" Text="" ID="lblFacContado"></asp:Label></h1>
                           </div>
                           <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                               <p class="text-blue">Facturas Credito</p>
                               <h1><asp:Label runat="server" Text="" ID="lblFacCredito"></asp:Label></h1>
                           </div>
                           <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                               <p class="text-danger">Facturas Pendientes</p>
                               <h1><asp:Label runat="server" Text="" ID="lblFacPendientes"></asp:Label></h1>
                           </div>
                           <hr><hr>
                           <div class="col-md-6 col-sm-6 col-xs-6 text-center"> 
                               <asp:Button ID="btnEditarPersona" runat="server" Text="Editar" CssClass="btn btn-warning btn-rounded"
                                            data-toggle="modal" data-target="#ModalMantenimientoPersona" OnClick="btnEditarPersona_Click" UseSubmitBehavior="false" />
                                       
                           </div>
                           <div class="col-md-6 col-sm-6 col-xs-6 text-center"> 
                               <asp:Button ID="btnEliminarPersona" runat="server" Text="Eliminar" CssClass="btn btn-danger btn-rounded"
                                             />
                                       
                           </div>
                        </ContentTemplate>  </asp:UpdatePanel>
                       </div>
                   </div>
               </div>
               <div class="col-md-8 col-xs-12">
                   <div class="white-box">
                       <!-- .tabs -->
                       <ul class="nav nav-tabs tabs customtab">
                           <li class="active tab">
                               <a href="#facContado" data-toggle="tab">
                                   <span class="visible-xs"><i class="fa fa-home"></i></span>
                                   <span class="hidden-xs">Fac. Contado</span> </a>
                           </li>
                           <li class="tab">
                               <a href="#facCredito" data-toggle="tab">
                                   <span class="visible-xs"><i class="fa fa-user"></i></span>
                                   <span class="hidden-xs">Fac. Credito</span> </a>
                           </li>
                           <li class="tab">
                               <a href="#facPendientes" data-toggle="tab">
                                   <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                   <span class="hidden-xs">Fac. Pendientes</span> </a>
                           </li>
                           <li class="tab">
                               <a href="#contactos" data-toggle="tab">
                                   <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                   <span class="hidden-xs">Contactos</span> </a>
                           </li>
                           <li class="tab">
                               <a href="#direcciones" data-toggle="tab">
                                   <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                   <span class="hidden-xs">Direcciones</span> </a>
                           </li>
                       </ul>
                       <!-- /.tabs -->
                       <div class="tab-content"> 
                           <div class="tab-pane active" id="facContado"> 
                           </div> 
                           <div class="tab-pane" id="facCredito">
                           </div> 
                           <div class="tab-pane" id="facPendientes">
                           </div> 
                           <div class="tab-pane" id="contactos">
                           </div> 
                           <div class="tab-pane" id="direcciones">
                           </div> 
                       </div>
                   </div>
               </div>
           </div>
             
        <!-- /.row --> 
        </div>
    
    <div  id="ModalMantenimientoPersona" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myLargeModalLabel">Información Cliente</h4>
                        </div>
                        <div class="modal-body">
                            <div class="white-box">
                                <div class="form-group form-material">
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="txtCedula" class="control-label">Cédula/Cédula Juridica</label>
                                            <% if (HILJO.Views.Aplicacion.Clientes.MantenimientoCliente.Cliente == null){ %>
                                            <asp:TextBox MaxLength="30" runat="server" type="text" class="form-control" 
                                            id="txtCedula"  placeholder="0-0000-000" required="true"/>  
                                            <%} else { %>
                                            <br />
                                            <asp:Label runat="server" ID="lbltxtCedula" class="control-label"></asp:Label>      
                                            <%} %>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="txtRazonSocial" class="control-label">Razón Social</label>
                                            <asp:TextBox MaxLength="50" runat="server" type="text" class="form-control" 
                                            id="txtRazonSocial"  required="true"/>  

                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group form-material">
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="txtPNombre" class="control-label">Primer Nombre</label>
                                            <asp:TextBox MaxLength="25" runat="server" type="text" class="form-control" 
                                            id="txtPNombre" required="true"/>        
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="txtSNombre" class="control-label">Segudo Nombre</label>
                                            <asp:TextBox MaxLength="25" runat="server" type="text" class="form-control" 
                                            id="txtSNombre"/>  

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group form-material">
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="txtPApellido" class="control-label">Primer Apellido</label>
                                            <asp:TextBox MaxLength="25" runat="server" type="text" class="form-control" 
                                            id="txtPApellido" required="true"/>        
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="txtSApellido" class="control-label">Segudo Apellido</label>
                                            <asp:TextBox MaxLength="25" runat="server" type="text" class="form-control" 
                                            id="txtSApellido"/>  

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group form-material">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class="control-label">Genero</label> 
                                            <asp:DropDownList runat="server" ID="ddlGenero"  class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                                <asp:ListItem Value="H" Text="Hombre"></asp:ListItem>
                                                <asp:ListItem Value="M" Text="Mujer"></asp:ListItem>
                                            </asp:DropDownList>    
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="slcEstadoCivil" class="control-label">Estado Civil</label>
                                            <asp:DropDownList runat="server" ID="ddlEstadoCivil"  class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                                <asp:ListItem Value="S" Text="Soltero"></asp:ListItem>
                                                <asp:ListItem Value="C" Text="Casado"></asp:ListItem>
                                                <asp:ListItem Value="D" Text="Divorciado"></asp:ListItem>
                                                <asp:ListItem Value="V" Text="Viudo"></asp:ListItem>
                                                <asp:ListItem Value="U" Text="Unión Libre"></asp:ListItem>
                                            </asp:DropDownList>     

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group form-material">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class="control-label">Prioridad del Cliente</label> 
                                            <asp:DropDownList runat="server" ID="ddlTipoPersona"  class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                                <asp:ListItem Value="1" Text="Prioridad Alta"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="Prioridad Media"></asp:ListItem>
                                                <asp:ListItem Value="3" Text="Prioridad Baja"></asp:ListItem>
                                            </asp:DropDownList>    
                                        </div>  
                                    </div>
                                </div>
                                 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="form-group">
                                  <asp:Button ID="btnGMPersona" Text="Guardar"  type="submit" CausesValidation="true" OnClick="GuardarMantenimientoPersona_Click"
                                    runat="server" class="btn btn-success disabled" OnClientClick="return ValidateRMPersona();" ></asp:Button>
                               <asp:Button Text="Cerrar" type="button" OnClick="CancelarMantenimientoPersona_Click"
                                    runat="server" class="btn btn-danger"  ></asp:Button>
                            </div>
                        </div> 
                       
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div> 


            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <script type="text/javascript">
        function ValidateRMPersona(button) {
            if ($('#' + '<%: btnGMPersona.ClientID%>').hasClass('disabled'))
                return false;
            else
                return true;
        }
       
    </script> 
        
    <script>
            jQuery(document).ready(function () { 
                $('.selectpicker').selectpicker();
            });
            function getParameterByName(name) {
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }
            function pageLoad() {   
                $('.selectpicker').selectpicker();
                if (getParameterByName('Cl')=='')
                $("#ModalMantenimientoPersona").modal();
            
        }
        </script>
       
</asp:Content>
