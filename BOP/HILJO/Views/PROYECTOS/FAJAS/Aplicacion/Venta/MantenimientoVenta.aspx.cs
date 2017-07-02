using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net ;
using BOP.BL.FAJAS.Ventas;
using BOP.BL.FAJAS.Compras;
using BOP.BL.FAJAS.Productos;
using BOP.BO;
namespace BOP.Views.PROYECTOS.FAJAS.Aplicacion.Venta
{
    public partial class MantenimientoVenta : System.Web.UI.Page
    { 

        MantenimientoProductos MP = new MantenimientoProductos();
        MantenimientoVentas MV = new MantenimientoVentas();
        MantenimientoCompras MC = new MantenimientoCompras();
        static Double Subtotal = 0;
        
        Sale_Bill Venta = new Sale_Bill();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            if (Request.QueryString.Count != 0)
            {
                string sPK = Request.QueryString["Ve"].ToString(); 
                string sES = Request.QueryString["Es"].ToString();
                if (!sPK.Equals(""))
                {
                    Venta = MV.ConsultarVenta(Convert.ToInt32(Request.QueryString["Ve"].ToString()));
                    if (sES.Equals("A"))
                    {
                        btnAgregarVenta.Text = "Eliminar";
                        formulario.Visible = false;
                            btnVerFactura.Visible = true;    
                    }
                    AsigarVenta(Venta);
                }
                if (sPK.Equals(""))
                {
                    Response.Redirect("Ventas.aspx");
                }
            }
        }
        protected void AsigarVenta(Sale_Bill bill)
        {
            txtDescripcion.Text = bill.SalBil_Description;
            txtCedula.Text = bill.SalBil_IdClient;
            txtCorreo.Text = bill.SalBil_ClientEmail;
            txtNombre.Text = bill.SalBil_ClientName;
            txtTelefono.Text = bill.SalBil_PhoneClient;
            txtDescuento.Text = bill.SalBil_Discount.ToString();
            lblSubTotal.Text = "SubTotal: ₡" + bill.SalBil_GrossTotal.ToString();
            lblDescuento.Text = "Descuento: ₡"+bill.SalBil_Discount.ToString();
            lblImpuesto.Text = "13% IVI: ₡" + bill.SalBil_Tax.ToString();
            lblNeto.Text = "TOTAL: ₡" + bill.SalBil_NetTotal.ToString();
            
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (dgDetalle.Rows.Count > 0)
            {
                dgDetalle.UseAccessibleHeader = true;
                dgDetalle.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }
        protected void BuscarProductos(DropDownList ddl, int color, int size)
        {
            List<BOP_FAJAS_spBuscarProductosResult> LC = MC.spBuscarProductos(color, size);
            ddl.Items.Clear();
            foreach (BOP_FAJAS_spBuscarProductosResult dato in LC)
            {
                ListItem LI = new ListItem();

                LI.Value = dato.ProDet_PK.ToString();
                LI.Text = dato.Pro_Code + "-" + dato.ProTyp_Name;
                ddl.Items.Add(LI);
            }
        }
        protected void CargarTamaños(DropDownList ddl)
        {
            List<Product_Size> LC = MP.ListarTamaños();
            ddl.Items.Clear();
            foreach (Product_Size dato in LC)
            {
                ListItem LI = new ListItem();
                LI.Value = dato.Siz_Pk.ToString();
                LI.Text = dato.Siz_Name;
                ddl.Items.Add(LI);
            }
        }
        protected void CargarColor(DropDownList ddl)
        {
            List<Product_Color> LC = MP.ListarColores();
            ddl.Items.Clear();
            foreach (Product_Color dato in LC)
            {
                ListItem LI = new ListItem();
                LI.Value = dato.ProCol_PK.ToString();
                LI.Text = dato.ProCol_Name;
                ddl.Items.Add(LI);
            }
        }
        protected void btnBuscarProducto_Click(object sender, EventArgs e)
        {
            CargarColor(ddlColor);
            CargarTamaños(ddlTamaño);
            BuscarProductos(ddlProductos, Convert.ToInt32(ddlColor.SelectedValue), Convert.ToInt32(ddlTamaño.SelectedValue));
        }

        protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
        {
            BuscarProductos(ddlProductos, Convert.ToInt32(ddlColor.SelectedValue), Convert.ToInt32(ddlTamaño.SelectedValue));
        }

        protected void ddlTamaño_SelectedIndexChanged(object sender, EventArgs e)
        {
            BuscarProductos(ddlProductos, Convert.ToInt32(ddlColor.SelectedValue), Convert.ToInt32(ddlTamaño.SelectedValue));
        }

        protected void btnEncontrado_Click(object sender, EventArgs e)
        {
            txtProducto.Text = ddlProductos.SelectedItem.Text;
            

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#ModalBuscarProducto').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CloseModalBuscarProducto", sb.ToString(), false);

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (!txtProducto.Text.Equals("") && !txtCantidad.Text.Equals("") && !txtPrecio.Text.Equals(""))
            {
                Venta = MV.ConsultarVenta(Convert.ToInt32(Request.QueryString["Ve"].ToString()));
                Subtotal = Subtotal + MV.RegistrarDetalleVenta(Venta.SalBil_Pk, Convert.ToInt32(ddlProductos.SelectedValue), Convert.ToDouble(txtPrecio.Text), Convert.ToInt32(txtCantidad.Text));
                dgDetalle.DataBind(); 

            }
            Totales();
        }
        protected void dgDetalle_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("EliminarDetalle"))
            {
                Subtotal = Subtotal - MV.EliminarDetalleVenta(Convert.ToInt32(e.CommandArgument));
                dgDetalle.DataBind();
            }
            Totales();
            dgDetalle.UseAccessibleHeader = true;
            dgDetalle.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnCancelarVenta_Click(object sender, EventArgs e)
        {
            Venta = MV.ConsultarVenta(Convert.ToInt32(Request.QueryString["Ve"].ToString()));
            if (Venta.SalBil_Status.Equals("P"))
            {
                MV.EliminarVenta(Venta.SalBil_Pk);
            }
            Response.Redirect("Ventas.aspx");
        }

        protected void btnAgregarVenta_Click(object sender, EventArgs e)
        {
            if (((Button)sender).Text.Equals("Guardar"))
            {
                Venta = MV.ConsultarVenta(Convert.ToInt32(Request.QueryString["Ve"].ToString()));
                MV.EditarVenta(Venta.SalBil_Pk, txtDescripcion.Text,txtCedula.Text,txtNombre.Text,txtCorreo.Text,txtTelefono.Text,Convert.ToDouble(txtDescuento.Text));
                Response.Redirect("MantenimientoVenta.aspx?Ve="+Venta.SalBil_Pk+"&Es=A");
            }
            if (((Button)sender).Text.Equals("Eliminar"))
            {
                Venta = MV.ConsultarVenta(Convert.ToInt32(Request.QueryString["Ve"].ToString()));
                MV.EliminarVenta(Venta.SalBil_Pk);
                Response.Redirect("Ventas.aspx");
            }
        }

        protected void txtDescuento_TextChanged(object sender, EventArgs e)
        {
            if (!txtDescuento.Text.Equals(""))
            {
                Totales();
            }

        }
        protected void Totales()
        {

            lblSubTotal.Text = "SubTotal: ₡" + Subtotal.ToString("N1");
            lblDescuento.Text = "Descuento: ₡" + Convert.ToDouble(txtDescuento.Text).ToString("N1");
            lblImpuesto.Text = "13% IVI: ₡" + (Subtotal * 0.13).ToString("N1");
            lblNeto.Text = "TOTAL: ₡" + ((Subtotal + Subtotal * 0.13 - Convert.ToDouble(txtDescuento.Text))).ToString("N1");
        }

        protected void btnVerFactura_Click(object sender, EventArgs e)
        { 
            
            ReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
            ReportViewer.LocalReport.ReportPath = Server.MapPath("FacturaVenta.rdlc");
            ReportViewer.LocalReport.DataSources.Clear();

            ReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("Encabezado", MV.spEncabezado(Convert.ToInt32(Request.QueryString["Ve"].ToString()))));
            ReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("Cuerpo", MV.spCuerpo(Convert.ToInt32(Request.QueryString["Ve"].ToString()))));

            ReportViewer.DataBind();
        }

        protected void btnCorreo_Click(object sender, EventArgs e)
        {
            
            DateTime date = DateTime.Parse(DateTime.Now.ToString());
            string Fecha = date.ToString("yyyyMMddHHmmss");

            using (MailMessage mm = new MailMessage("eduardovcpz@gmail.com", txtCorreo.Text))
            {
                mm.Subject = "Factura de Venta";
                mm.Body = txtDescripcion.Text;
                mm.Attachments.Add(new Attachment(ExportReportToPDF(Server.MapPath("../Facturas/"), "Factua"+ Fecha + ".pdf")));
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                NetworkCredential credential = new NetworkCredential();
                credential.UserName = "eduardovcpz@gmail.com";
                credential.Password = "XXXX";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = credential;
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(mm);
            }

        }
        private string ExportReportToPDF(string path, string reportName)
        {
            Microsoft.Reporting.WebForms.Warning[] warnings;
            string[] streamids;
            string mimeType;
            string encoding;
            string filenameExtension;
            byte[] bytes = ReportViewer.LocalReport.Render("PDF", null, out mimeType, 
                out encoding, out filenameExtension, out streamids, out warnings);
            string filename = path + reportName;
            using (var fs = new System.IO.FileStream(filename, System.IO.FileMode.Create))
            {
                fs.Write(bytes, 0, bytes.Length);
                fs.Close();
            }

            return filename;
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerFactura_Click1(object sender, EventArgs e)
        {

        }
    }
}