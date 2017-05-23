<%@ Page Title="Configuraciones Generales" Language="C#" MasterPageFile="~/Views/Aplicacion/Aplicacion.master"
    AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" 
    Inherits="HILJO.Views.Aplicacion.Administrador.Administrador" %>

<asp:Content ID="Content"  ContentPlaceHolderID="CPHAplicacion" runat="server">
    <asp:ObjectDataSource ID="odsTipoPersonas" runat="server" SelectMethod="spListarTiposContactos" TypeName="HILJO.BL.Contactos.MantenimientoContactos"></asp:ObjectDataSource>
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Conf. Generales</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">

                    <li><a runat="server" href="~/Views/Aplicacion/Inicio/Inicio.aspx">Inicio</a></li>
                    <li class="active">Configuraciones Generales</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-md-12">
                <!-- Tabstyle start -->
                <div class="sttabs tabs-style-iconbox">
                    <nav>
                        <ul>
                            <li><a href="#section-iconbox-1" class="sticon ti-agenda"><span>Tipos de Contacto</span></a></li>
                            <li><a href="#section-iconbox-2" class="sticon ti-user"><span>Tipos de Personas</span></a></li>
                            <li><a href="#section-iconbox-3" class="sticon ti-lock"><span>Roles del Sistema</span></a></li>
                        </ul>
                    </nav>
                    <div class="content-wrap">
                        <section id="section-iconbox-1">
                            <div class="table-responsive">
                                <asp:UpdatePanel ID="upTiposContactos" runat="server">
                                    <ContentTemplate>

                                        <asp:Button ID="Button1" runat="server" Text="Agregar Tipo Contacto" CssClass="btn btn-info btn-rounded pull-right m-l-20"
                                            data-toggle="modal" data-target="#ModalMantenimientoTipoContacto" UseSubmitBehavior="false" />
                                        <br />
                                        <br />
                                        <asp:GridView ID="dgTipoContactos" runat="server" CssClass="table table-striped color-table info-table" OnRowCommand="dgTipoContactos_RowCommand" AutoGenerateColumns="False" DataSourceID="odsTipoPersonas">
                                            <Columns>
                                                <asp:BoundField DataField="TPC_PK_TIPOCONTACTO" HeaderText="ID" SortExpression="ID"></asp:BoundField>
                                                <asp:BoundField DataField="TPC_NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE"></asp:BoundField>
                                                <asp:BoundField DataField="TPC_DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION"></asp:BoundField>
                                                <asp:TemplateField HeaderText="MANT." HeaderStyle-Width="30">
                                                    <HeaderStyle Width="30" />
                                                    <ItemTemplate> 
                                                        <asp:Button CommandArgument='<%# Eval("TPC_PK_TIPOCONTACTO") %>' runat="server"
                                                            CommandName="EditarTipoContacto"
                                                            class="btn btn-info btn-outline btn-default btn-rounded btn-sm" Text="Editar"
                                                            data-toggle="modal" data-target="#ModalMantenimientoTipoContacto" UseSubmitBehavior="false"></asp:Button>
                                                        <asp:Button CommandArgument='<%# Eval("TPC_PK_TIPOCONTACTO") %>' runat="server"
                                                            CommandName="EliminarTipoContacto"
                                                            class="btn btn-danger btn-outline btn-default btn-rounded btn-sm " Visible='<%# Eval("USANDO").ToString() == "0" ? true :   false  %>' Text="Eliminar"
                                                            UseSubmitBehavior="false"></asp:Button>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>
                        </section>
                        <section id="section-iconbox-2">
                            <div class="">
                                <table class="tablesaw table table-striped color-table info-table" data-tablesaw-mode="swipe" data-tablesaw-sortable data-tablesaw-sortable-switch data-tablesaw-minimap>
                                    <thead>
                                        <tr>
                                            <th style="width: 40px;" scope="col" data-tablesaw-sortable-col data-tablesaw-sortable-default-col data-tablesaw-priority="2">
                                                <abbr title="Identificador del Tipo de Persona">ID</abbr>
                                            </th>
                                            <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="persist">DESCRIPCION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% foreach (HILJO.BO.HILJO_spListarTiposPersonasResult dato in HILJO.Views.Aplicacion.Administrador.Administrador.lTiposPersonas)
                                            { %>
                                        <tr>
                                            <td><%: dato.TPS_PK_TIPOPERSONA%></td>
                                            <td class="title"><a href="javascript:void(0)"><%: dato.TPS_DESCRIPCION %></a></td>

                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                        <section id="section-iconbox-3">
                            <div class="">
                                <table class="tablesaw table table-striped color-table info-table" data-tablesaw-mode="swipe" data-tablesaw-sortable data-tablesaw-sortable-switch data-tablesaw-minimap>
                                    <thead>
                                        <tr>

                                            <th scope="col" style="width: 100px;" data-tablesaw-sortable-col data-tablesaw-priority="persist">NOMBRE</th>
                                            <th scope="col" style="width: 200px;" data-tablesaw-sortable-col data-tablesaw-priority="0">DESCRIPCION</th>
                                            <th style="width: 40px;" scope="col" data-tablesaw-sortable-col data-tablesaw-sortable-default-col
                                                data-tablesaw-priority="2">
                                                <abbr title="Identificador del Tipo de Persona">ID</abbr>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% foreach (HILJO.BO.HILJO_spListarRolesResult dato in HILJO.Views.Aplicacion.Administrador.Administrador.lRoles)
                                            { %>
                                        <tr>
                                            <td class="title"><a href="javascript:void(0)"><%: dato.ROL_NOMBRE %></a></td>
                                            <td><%: dato.ROL_DECRIPCION%></td>
                                            <td><%: dato.ROL_PK_ROL%></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                    <!-- /content -->
                </div>
                <!-- /tabs -->
                <!-- Tabstyle start -->
                <hr>
            </div>
        </div>
    </div>
    <div  id="ModalMantenimientoTipoContacto" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myLargeModalLabel">Mantenimento Tipo Contacto</h4>
                        </div>
                        <div class="modal-body">
                            <div class="white-box">
                                <asp:HiddenField runat="server" ID="txtID"></asp:HiddenField>
                                <div class="form-group form-material">
                                    <label for="txtNombre" class="control-label">NOMBRE</label>
                                    <asp:TextBox type="text" runat="server" class="form-control form-control-line" ID="txtNombre"
                                        placeholder="Tipo Contacto" required="true" CausesValidation="true" ></asp:TextBox>
                                    
                                </div>
                                <div class="form-group form-material">
                                    <label for="txtDescripcion" class="control-label">DESCRIPCIÓN</label>
                                    <asp:TextBox type="text" runat="server" class="form-control form-control-line" ID="txtDescripcion"
                                        placeholder="Descripción" required="true" CausesValidation="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="form-group">
                                  <asp:Button ID="btnAMTipoContacto" Text="Guardar"  type="submit" CausesValidation="true" OnClick="GuardarTipoContacto_Click"
                                    runat="server" class="btn btn-success disabled" OnClientClick="return ValidateAMTipoContacto();" ></asp:Button>
                              <button class="btn btn-danger waves-effect text-left" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div> 
                       
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div> 


            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    

    <script src="../../../js/cbpFWTabs.js"></script>
    <script type="text/javascript">
        function ValidateAMTipoContacto(button) {
            if ($('#' + '<%: btnAMTipoContacto.ClientID%>').hasClass('disabled'))
                return false;
            else
                return true;
        }
        (function () {
            [].slice.call(document.querySelectorAll('.sttabs')).forEach(function (el) {
                new CBPFWTabs(el);
            });
        })();
    </script> 
   
    <script>
        $(document).ready(function () {
            $('#' + '<%: dgTipoContactos.ClientID%>').DataTable();
            
        });
        function pageLoad() {
            $('#' + '<%: dgTipoContactos.ClientID%>').DataTable();
            
        }
    </script>

</asp:Content>
