using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOP.BO;
using BOP.BL.FAJAS.Compras;

namespace BOP.Views.PROYECTOS.FAJAS.Aplicacion.Compra
{
    public partial class Compras : System.Web.UI.Page
    {
        public static List<Buy_Bill> lBuy_Bill;

        MantenimientoCompras MC = new MantenimientoCompras();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lBuy_Bill = MC.ListarCompras();
            }
        }

        protected void btnAgregarCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoCompra.aspx?Co="+MC.RegistrarCompra().BuyBil_PK+"&Es=P");
        }
        protected void btnBuscarReporte_Click(object sender, EventArgs e)
        {
            if (!inicio.Text.Equals("") && !fin.Text.Equals(""))
            {
                ReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
                ReportViewer.LocalReport.ReportPath = Server.MapPath("ComprasPorFecha.rdlc");
                ReportViewer.LocalReport.DataSources.Clear();
                string[] f1 = inicio.Text.Split('/');
                string[] f2 = fin.Text.Split('/');
                ReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("Reporte",
                    MC.spReporteCompra(DateTime.Parse(f1[1] + "/" + f1[0] + "/" + f1[2]), DateTime.Parse(f2[1] + "/" + f2[0] + "/" + f2[2]))));

                ReportViewer.DataBind();
            }
        }
    }
}