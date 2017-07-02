<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PROYECTOS/FAJAS/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Seguridad.aspx.cs" Inherits="BOP.Views.PROYECTOS.FAJAS.Aplicacion.Seguridad.Seguridad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHAFAJAS" runat="server">
    <asp:ObjectDataSource ID="odsUsuarios" runat="server" SelectMethod="spListarUsuarios" TypeName="BOP.BL.FAJAS.Seguridad.MantenimientoSeguridad"></asp:ObjectDataSource>
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Seguridad</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Seguridad</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="white-box">
                    <div class="table-responsive">
                        <asp:UpdatePanel ID="upUsuarios" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnAgregarUsuario" OnClick="btnAgregarUsuario_Click" runat="server" Text="Agregar Usuario" CssClass="btn btn-info btn-rounded pull-right m-l-20"
                                    data-toggle="modal" data-target="#ModalMantenimientoUsuario" UseSubmitBehavior="false" />
                                <br />
                                <br />
                                <asp:GridView ID="dgUsuarios" runat="server" CssClass="table table-striped color-table info-table" OnRowCommand="dgUsuarios_RowCommand" AutoGenerateColumns="False" DataSourceID="odsUsuarios">
                                    <Columns>
                                       
                                        <asp:BoundField DataField="Use_Name" HeaderText="NOMBRE" SortExpression="NOMBRE"></asp:BoundField>
                                         <asp:BoundField DataField="Use_Password" HeaderText="CONTRASEÑA" SortExpression="CONTRASEÑA"></asp:BoundField>
                                       
                                        <asp:TemplateField HeaderText="MANT." HeaderStyle-Width="30">
                                            <HeaderStyle Width="30" />
                                            <ItemTemplate>
                                                <asp:Button CommandArgument='<%# Eval("Use_PK") %>' runat="server"
                                                    CommandName="EditarUsuario"
                                                    class="btn btn-info btn-outline btn-default btn-rounded btn-sm" Text="Editar"
                                                    data-toggle="modal" data-target="#ModalMantenimientoUsuario" UseSubmitBehavior="false"></asp:Button>
                                                <asp:Button CommandArgument='<%# Eval("Use_PK") %>' runat="server"
                                                    CommandName="EliminarUsuario"
                                                    class="btn btn-danger btn-outline btn-default btn-rounded btn-sm" Text="Eliminar"
                                                    UseSubmitBehavior="false"></asp:Button>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="ModalMantenimientoUsuario" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Mantenimiento Usuario</h4>
                        </div>
                        <div class="modal-body">
                            <div class="white-box"> 
                                <asp:HiddenField runat="server" ID="txtID"></asp:HiddenField>
                                <div class="form-group form-material">
                                    <label for="txtUsuario" class="control-label">USUARIO</label>
                                    <asp:TextBox type="text" runat="server" class="form-control form-control-line" ID="txtUsuario"
                                        placeholder="Usuario" required="true" CausesValidation="true" ></asp:TextBox>
                                    
                                </div>
                                <div class="form-group">
                                    <label for="txtContra" class="control-label">CONTRASEÑA</label>
                                    <div class="row">
                                        <div class="form-group col-sm-6"> 
                                            <asp:TextBox type="password" runat="server" class="form-control form-control-line" ID="txtContra"
                                                placeholder="Contraseña" data-toggle="validator" required></asp:TextBox>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <input type="password" class="form-control form-control-line" id="inputPasswordConfirm2"
                                                data-match="#<%: txtContra.ClientID%>" data-match-error="Whoops, these don't match"
                                                placeholder="Confirm" required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group">
                                <asp:Button ID="btnRMUsuario" Text="Guardar" type="submit" CausesValidation="true" OnClick="btnRMUsuario_Click"
                                    runat="server" class="btn btn-success disabled" OnClientClick="return ValidateRMUsuario();"></asp:Button>
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
    <script type="text/javascript">
        function ValidateRMUsuario(button) {
            if ($('#' + '<%: btnRMUsuario.ClientID%>').hasClass('disabled'))
                return false;
            else
                return true;
        }

    </script>
    <script>

        $(document).ready(function () {
            $('#' + '<%: dgUsuarios.ClientID%>').DataTable();
         });
         function pageLoad() {
             $('#' + '<%: dgUsuarios.ClientID%>').DataTable();

        }
    </script>
</asp:Content>
