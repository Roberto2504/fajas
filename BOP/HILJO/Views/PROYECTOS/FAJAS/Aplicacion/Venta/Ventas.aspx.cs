using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BOP.BO;
using BOP.BL.FAJAS.Ventas;

namespace BOP.Views.PROYECTOS.FAJAS.Aplicacion.Venta
{
    public partial class Ventas : System.Web.UI.Page
    {
        public static List<Sale_Bill> lSale_Bill;
        MantenimientoVentas MV = new MantenimientoVentas();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lSale_Bill = MV.ListarVentas();
            }
        }

        protected void btnAgregarVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoVenta.aspx?Ve=" + MV.RegistrarVenta().SalBil_Pk+"&Es=P" );
        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {

        }

        

        protected void btnBuscarReporte_Click(object sender, EventArgs e)
        {
            if (!inicio.Text.Equals("") && !fin.Text.Equals(""))
            {
                ReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
                ReportViewer.LocalReport.ReportPath = Server.MapPath("VentasPorFechas.rdlc");
                ReportViewer.LocalReport.DataSources.Clear();
                string[] f1 = inicio.Text.Split('/');
                string[] f2 = fin.Text.Split('/');
                ReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("Reporte",
                    MV.spReporteVenta(DateTime.Parse(f1[1] + "/" + f1[0] + "/" + f1[2]), DateTime.Parse(f2[1] + "/" + f2[0] + "/" + f2[2]))));

                ReportViewer.DataBind();
            }
        }
    }
}