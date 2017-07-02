<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PROYECTOS/FAJAS/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="MantenimientoCompra.aspx.cs" Inherits="BOP.Views.PROYECTOS.FAJAS.Aplicacion.Compra.MantenimientoCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAFAJAS" runat="server">
    <asp:ObjectDataSource ID="odsCompra" runat="server" SelectMethod="spListarDetalleCompras" TypeName="BOP.BL.FAJAS.Compras.MantenimientoCompras">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Co" Name="bill" Type="Int32"></asp:QueryStringParameter>
            <asp:QueryStringParameter QueryStringField="Es" Name="Estado" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Detalle Compra</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                 <asp:Label runat="server" ID="lblCompra"  Text="Compra"
                    class="btn btn-danger pull-right m-l-20"></asp:Label>
                 <asp:label runat="server" ID="lblVenta" Text="Venta"
                            class="btn btn-success  pull-right m-l-20"></asp:label>
                     
                <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                    <li><a href="Compras.aspx">Compras</a></li>
                    <li class="active">Detalle Compra</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- row -->
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-xs-12">
                <div class="white-box">
                    <asp:UpdatePanel runat="server" ID="upCompra">
                        <ContentTemplate>
                            <div class="user-btm-box">
                                <!-- .row -->
                                <div id="formulario" data-toggle="validator" runat="server" class="row text-center m-t-10">
                                    <div class="col-md-5 col-xs-12 b-r">
                                        <strong>Producto</strong>
                                        <div class="input-group m-b-30">

                                            <asp:TextBox ID="txtProducto" runat="server" required="" class="form-control" placeholder="Buscar producto..."> </asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button runat="server" data-toggle="modal" ID="btnBuscarProducto" OnClick="btnBuscarProducto_Click" data-target="#ModalBuscarProducto"
                                                    UseSubmitBehavior="false" class="btn btn-info" type="button" Text="Buscar"></asp:Button>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-xs-6 b-r">
                                        <strong>Cantidad:</strong>
                                        <div class="input-group m-b-30">
                                            <asp:TextBox runat="server" ID="txtCantidad" required="" type="number" 
                                                class="form-control"></asp:TextBox>
                                            <span class="input-group-addon">Uns</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-xs-6 b-r">
                                        <strong>Precio:</strong>
                                        <div class="input-group m-b-30">
                                            <span class="input-group-addon">$</span>
                                             <asp:TextBox runat="server" ID="txtPrecio" required="" type="number" class="form-control" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-1 col-xs-12 center">
                                        <strong></strong>
                                        <br />
                                        <asp:Button ID="btnAgregar" runat="server" Text="+"
                                            CssClass="btn btn-primary btn-rounded"
                                            type="submit" CausesValidation="true" 
                                            OnClick="btnAgregar_Click"/>


                                    </div>
                                </div>
                                <!-- /.row -->
                                <hr>
                                <!-- .row -->
                                <div class="row text-center m-t-10">
                                    <div class="white-box">
                                        <div class="table-responsive">
                                            <asp:UpdatePanel ID="upDetalles" runat="server">
                                                <ContentTemplate>
                                                    <asp:GridView ID="dgDetalle" runat="server" CssClass="table table-striped color-table info-table" OnRowCommand="dgDetalle_RowCommand" AutoGenerateColumns="False" DataSourceID="odsCompra">
                                                        <Columns>
                                                            <asp:BoundField DataField="Pro_Name" HeaderText="PRODUCTO" SortExpression="Pro_Name"></asp:BoundField>
                                                            <asp:BoundField DataField="Pro_Code" HeaderText="CODIGO" SortExpression="Pro_Code"></asp:BoundField>
                                                            <asp:BoundField DataField="Siz_Name" HeaderText="TAMAÑO" SortExpression="Siz_Name"></asp:BoundField>
                                                            <asp:BoundField DataField="ProCol_Name" HeaderText="COLOR" SortExpression="ProCol_Name"></asp:BoundField>
                                                            <asp:BoundField DataField="DetBuyBil_Quantity" HeaderText="CANTIDAD" SortExpression="DetBuyBil_Quantity"></asp:BoundField>
                                                            <asp:BoundField DataField="DetBuyBil_BuyPrice" HeaderText="PRECIO" SortExpression="DetBuyBil_BuyPrice"></asp:BoundField>

                                                            <asp:TemplateField HeaderText="ELIMINAR" HeaderStyle-Width="30">
                                                                <HeaderStyle Width="30" />
                                                                <ItemTemplate>
                                                                    <asp:Button CommandArgument='<%# Eval("DetBuyBil_PK") %>' runat="server"
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
                                <!-- /.row -->
                                <hr>
                                <div class="row text-center m-t-10">
                                    <div class="col-md-12">
                                        <strong>DESCRIPCIÓN</strong>
                                        <p>
                                            <asp:TextBox type="text" class="form-control" TextMode="MultiLine" runat="server" Text="" ID="txtDescripcion"></asp:TextBox>
                                        </p>

                                    </div>
                                </div>
                                <hr />
                                 <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                    <asp:Button ID="btnCancelarCompra" OnClick="btnCancelarCompra_Click" runat="server" Text="Cancelar"
                                        CssClass="btn btn-danger btn-rounded btn-block"  UseSubmitBehavior="false" />

                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                    <asp:Button ID="btnAgregarCompra" OnClick="btnAgregarCompra_Click" runat="server" Text="Guardar"
                                        CssClass="btn btn-warning btn-rounded btn-block"  UseSubmitBehavior="false" />

                                </div>
                               

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

    </div>
    <div id="ModalBuscarProducto" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Buscar Producto</h4>
                        </div>
                        <div class="modal-body">
                            <div class="white-box">
                                <asp:HiddenField runat="server" ID="txtIdDetalle" Value="" />
                                <div class="form-group form-material">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label for="txtNombre" class="control-label">COLOR</label>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged" ID="ddlColor" class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-sm-6">
                                            <label class="control-label">TAMAÑO</label>
                                            <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlTamaño" OnSelectedIndexChanged="ddlTamaño_SelectedIndexChanged" class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label for="txtCantidad" class="control-label">PRODUCTOS</label>
                                            <asp:DropDownList runat="server" ID="ddlProductos" class="selectpicker m-b-20 m-r-10" data-style="btn-primary btn-outline">
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group">
                                <asp:Button ID="btnEncontrado" Text="Guardar" type="submit" CausesValidation="true" 
                                    OnClick="btnEncontrado_Click"
                                    runat="server" class="btn btn-success disabled"></asp:Button>
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
    <script>
        jQuery(document).ready(function () {
            $('.selectpicker').selectpicker();
            $('#' + '<%: dgDetalle.ClientID%>').DataTable();

        });
        function pageLoad() {
            $('.selectpicker').selectpicker();
            $('#' + '<%: dgDetalle.ClientID%>').DataTable();
        }
    </script>

</asp:Content>
