<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PROYECTOS/FAJAS/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="MantenimientoProducto.aspx.cs" Inherits="BOP.Views.PROYECTOS.FAJAS.Aplicacion.Productos.MantenimientoProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAFAJAS" runat="server">
    <asp:ObjectDataSource ID="odsDetalles" runat="server" SelectMethod="spListarDetalleProductos" TypeName="BOP.BL.FAJAS.Productos.MantenimientoProductos">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Pr" Name="PK" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
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
                            <asp:UpdatePanel runat="server" ID="upInformacionProducto">
                            <ContentTemplate>
                            <div class="user-bg">  
                                <asp:ImageButton data-toggle="modal" ImageUrl="~/Views/PROYECTOS/plugins/images/error-bg.jpg" data-target="#ModalMantenimientoImagen"
                                    runat="server" ID="imgProducto" Width="100%" Height="100%" alt="user" />
                            </div>
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
                                    <asp:Button ID="btnEditarProducto"  runat="server" Text="Editar" 
                                        CssClass="btn btn-warning btn-rounded"
                                        data-toggle="modal" data-target="#ModalMantenimientoProducto" OnClick="btnEditarProducto_Click" UseSubmitBehavior="false" />

                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                    <asp:Button ID="btnEliminaProducto" runat="server" Text="Eliminar" 
                                        CssClass="btn btn-danger btn-rounded" OnClick="btnEliminaProducto_Click" />

                                </div>
                                
                            </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                            <div class="table-responsive">
                                <asp:UpdatePanel ID="upDetalles" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnAgregarDetalle" OnClick="btnAgregarDetalle_Click" runat="server" Text="Agregar Detalle" CssClass="btn btn-info btn-rounded pull-right m-l-20"
                                            data-toggle="modal" data-target="#ModalMantenimientoDetalle" UseSubmitBehavior="false" />
                                        <br />
                                        <br />
                                        <asp:GridView ID="dgDetalle" runat="server" CssClass="table table-striped color-table info-table" OnRowCommand="dgDetalle_RowCommand" AutoGenerateColumns="False" DataSourceID="odsDetalles">
                                            <Columns> 
                                                <asp:BoundField DataField="ProCol_Name" HeaderText="COLOR" SortExpression="ProCol_Name"></asp:BoundField>
                                                <asp:BoundField DataField="Siz_Name" HeaderText="TAMAÑO" SortExpression="Siz_Name"></asp:BoundField>
                                                <asp:BoundField DataField="ProDet_Quantity" HeaderText="CANTIDAD" SortExpression="ProDet_Quantity"></asp:BoundField>
                                                <asp:TemplateField HeaderText="MANT." HeaderStyle-Width="30">
                                                    <HeaderStyle Width="30" />
                                                    <ItemTemplate>
                                                        <asp:Button CommandArgument='<%# Eval("ProDet_PK") %>' runat="server"
                                                            CommandName="EditarDetalle"
                                                            class="btn btn-info btn-outline btn-default btn-rounded btn-sm" Text="Editar"
                                                            data-toggle="modal" data-target="#ModalMantenimientoDetalle" UseSubmitBehavior="false"></asp:Button>
                                                        <asp:Button CommandArgument='<%# Eval("ProDet_PK") %>' runat="server"
                                                            CommandName="EliminarDetalle"
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
     <div id="ModalMantenimientoProducto" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Mantenimiento Producto</h4>
                        </div>
                        <div class="modal-body">
                            <div class="white-box">
                                <asp:HiddenField runat="server" ID="txtIDDireccion" Value="" />
                                <div class="form-group form-material"> 
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label  for="txtNombre" class="control-label">Nombre</label>
                                            <asp:TextBox MaxLength="30" runat="server" type="text" class="form-control"
                                                ID="txtNombre" required="true" />
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="txtCodigo" class="control-label">Código</label>
                                            <asp:TextBox MaxLength="30" runat="server" type="text" class="form-control"
                                                ID="txtCodigo" required="true" />
                                        </div>
                                    </div>
                                    <div class="row"> 
                                        <div class="form-group col-sm-12">
                                            <label for="txtDescripcion" class="control-label">Descripción</label>
                                            <asp:TextBox MaxLength="100"  runat="server" type="multiline" class="form-control"
                                                ID="txtDescripcion" required="true" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label  for="txtPrecio" class="control-label">Precio</label>
                                            <asp:TextBox MaxLength="30" runat="server" type="number" class="form-control"
                                                ID="txtPrecio" required="true" />
                                        </div>
                                        <div class=" col-sm-6">
                                            <label class="control-label">Tipo Producto</label>
                                            <asp:DropDownList runat="server" ID="ddlTipoProducto" class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                            
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group">
                                <asp:Button ID="btnRMProducto" Text="Guardar" type="submit" CausesValidation="true" OnClick="GuardarMantenimientoProducto_Click"
                                    runat="server" class="btn btn-success disabled" OnClientClick="return ValidateRMProducto();"></asp:Button>
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
  <div id="ModalMantenimientoImagen" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Mantenimiento Imagen</h4>
                </div>
                <div class="modal-body">
                    <div class="white-box">
                        <asp:FileUpload type="file" class="btn-info" ID="SubidordeImagen" runat="server" />

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="form-group">
                        <asp:Button ID="Button1" Text="Guardar" OnClick="GuardarMantenimientoImagen_Click"
                            runat="server" class="btn btn-success"></asp:Button>
                        <asp:Button Text="Cerrar" data-dismiss="modal"
                            runat="server" class="btn btn-danger"></asp:Button>
                    </div>
                </div>
            </div>


            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
           
    <div id="ModalMantenimientoDetalle" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Mantenimiento Detalle Producto</h4>
                        </div>
                        <div class="modal-body">
                            <div class="white-box">
                                <asp:HiddenField runat="server" ID="txtIdDetalle" Value="" />
                                <div class="form-group form-material">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label for="txtNombre" class="control-label">COLOR</label>
                                            <asp:DropDownList runat="server" ID="ddlColor" class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-sm-6">
                                            <label class="control-label">TAMAÑO</label>
                                            <asp:DropDownList runat="server" ID="ddlTamaño" class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label for="txtCantidad" class="control-label">CANTIDAD</label>
                                            <asp:TextBox MaxLength="30" runat="server" type="number" class="form-control"
                                                ID="txtCantidad" required="true" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group">
                                <asp:Button ID="btnRMDetalle" Text="Guardar" type="submit" CausesValidation="true" OnClick="GuardarMantenimientoDetalle_Click"
                                    runat="server" class="btn btn-success disabled" OnClientClick="return ValidateRMDetalle();"></asp:Button>
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
               function ValidateRMProducto() {
            if ($('#' + '<%: btnRMProducto.ClientID%>').hasClass('disabled'))
                return false;
            else
                return true;
               }
        function ValidateRMDetalle() {
            if ($('#' + '<%: btnRMDetalle.ClientID%>').hasClass('disabled'))
                return false;
            else
                return true;
        }
           </script>
     <script>
        jQuery(document).ready(function () {
            $('.selectpicker').selectpicker();
            $('#' + '<%: dgDetalle.ClientID%>').DataTable();
        });
         
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        function pageLoad() {
            $('.selectpicker').selectpicker();
            if (getParameterByName('Pr') == '')
                $("#ModalMantenimientoProducto").modal(); 
             $('#' + '<%: dgDetalle.ClientID%>').DataTable();
        }
        
    </script> 
</asp:Content>
