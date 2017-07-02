<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PROYECTOS/FAJAS/Aplicacion/Aplicacion.master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="BOP.Views.PROYECTOS.FAJAS.Aplicacion.Inicio.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHAFAJAS" runat="server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Inicio</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb"> 
                    <li class="active">Inicio</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <asp:Label runat="server" ID="lblNormal"></asp:Label>
        <asp:Label runat="server" ID="lblOrden"></asp:Label>
       </div>
</asp:Content>
