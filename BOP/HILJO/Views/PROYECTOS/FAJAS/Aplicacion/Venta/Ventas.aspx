<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PROYECTOS/FAJAS/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="BOP.Views.PROYECTOS.FAJAS.Aplicacion.Venta.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAFAJAS" runat="server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Ventas</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <asp:Button runat="server" ID="btnAgregarVenta" OnClick="btnAgregarVenta_Click" Text="Agregar Venta"
                    class="btn btn-danger pull-right m-l-20"></asp:Button>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Button runat="server" ID="btnReporte"  Text="Reporte"
                            class="btn btn-success  pull-right m-l-20" data-toggle="modal" data-target="#ModalReporte"></asp:Button>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <ol class="breadcrumb">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Ventas</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <div class="col-md-12 col-xs-12">
                <%int i = 0;
                    foreach (BOP.BO.Sale_Bill dato in BOP.Views.PROYECTOS.FAJAS.Aplicacion.Venta.Ventas.lSale_Bill)
                    {
                        if (dato.SalBil_Status == "A")
                        {
                             if (i == 0)
                    { %>
                <div class="row">
                    <%} i++;%>

                    <div class="col-md-4 col-sm-4">
                        <div class="white-box">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <a href="MantenimientoVenta.aspx?Ve=<%:dato.SalBil_Pk %>&Es=A">
                                        <h3 class="box-title m-b-0"><%: dato.SalBil_IdClient %> - <%: dato.SalBil_ClientName %></h3>
                                    </a>
                                    <small>Total: ₡<%: dato.SalBil_NetTotal.ToString("N1") %> </small>
                                    <br />
                                    <small>Fecha: <%: dato.SalBil_Date %> </small>

                                    <p>
                                        <address>
                                            <%
                                                foreach (BOP.BO.BOP_FAJAS_spListarDetalleVentasResult LDC in BOP.BL.FAJAS.Ventas.MantenimientoVentas.spListarDetalleVentas(dato.SalBil_Pk))
                                                { %>
                                   Cod:<%:LDC.Pro_Code %> Talla:<%:LDC.Siz_Name %>  Col:<%:LDC.ProCol_Name %> P:₡<%:LDC.Pro_SalePrice.ToString("N1") %> Cant:<%:LDC.DetSalBil_Quantity %>
                                            <%if (LDC.DetSalBil_Detail != 0)
                                                { %>
                                                        Des:<%:LDC.DetSalBil_Detail %>
                                            <%} %>
                                            <br />
                                            <%} %>
                                        </address>

                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% 
                        if (i == 3)
                        { %>
                </div>
                <%i = 0;
                    }  %>
                <!-- /.col -->
                <% }
                    } %>
            </div>
        </div>
    </div>
    <div id="ModalReporte" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Factura</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-sm-5">
                                    <label for="txtNombre" class="control-label">Fecha Inicio</label>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" type="text" class="form-control" ID="inicio" placeholder="mm/dd/yyyy"></asp:TextBox>
                                        <span class="input-group-addon"><i class="icon-calender"></i></span>
                                    </div>
                                </div>

                                <div class="form-group col-sm-5">
                                    <label for="txtCorreo" class="control-label">Fecha Final</label>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" type="text" class="form-control" ID="fin" placeholder="mm/dd/yyyy"></asp:TextBox>
                                        <span class="input-group-addon"><i class="icon-calender"></i></span>
                                    </div>

                                </div>
                                <div class="col-md-2 center">
                                    <strong></strong>
                                    <br />
                                    <asp:Button ID="btnBuscarReporte" runat="server" Text="Buscar"
                                        CssClass="btn btn-primary btn-rounded" OnClick="btnBuscarReporte_Click"
                                        type="submit" CausesValidation="true" />


                                </div>
                            </div>
                           

                            <%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms"
                                TagPrefix="rsweb" %>
                            <rsweb:ReportViewer ID="ReportViewer" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="100%"
                                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
                            </rsweb:ReportViewer>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group"> 
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
            jQuery('#' + '<%: inicio.ClientID%>').datepicker({
            autoclose: true
        });
            jQuery('#' + '<%: fin.ClientID%>').datepicker({
                autoclose: true
            });
        });
        function pageLoad() {
            jQuery('#' + '<%: inicio.ClientID%>').datepicker({
                autoclose: true
            });
            jQuery('#' + '<%: fin.ClientID%>').datepicker({
                autoclose: true
            });
        }
    </script>

</asp:Content>

