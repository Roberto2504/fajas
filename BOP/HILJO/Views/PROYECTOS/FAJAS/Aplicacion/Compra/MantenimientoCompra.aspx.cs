using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Win32;
using System.IO;
using BOP.BL.FAJAS.Compras;
using BOP.BL.FAJAS.Productos;
using BOP.BO;

namespace BOP.Views.PROYECTOS.FAJAS.Aplicacion.Compra
{
    public partial class MantenimientoCompra : System.Web.UI.Page
    {
        MantenimientoProductos MP = new MantenimientoProductos();
        MantenimientoCompras MC = new MantenimientoCompras();
        Buy_Bill Compra = new Buy_Bill();
        static Double gventa = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString.Count != 0)
            {
                string sPK = Request.QueryString["Co"].ToString();
                string sES = Request.QueryString["Es"].ToString();
                if (!sPK.Equals(""))
                {
                    Compra = MC.ConsultarCompra(Convert.ToInt32(Request.QueryString["Co"].ToString()));
                    AsigarCompra(Compra);
                    if (sES.Equals("A"))
                    {
                        btnAgregarCompra.Text = "Eliminar";
                        formulario.Visible = false;
                    }
                    if (!IsPostBack)
                        SincronizarTipoCambio();
                }
                if (sPK.Equals(""))
                {
                    Response.Redirect("Compras.aspx");
                }
            }
        }
        private void SincronizarTipoCambio()
        {
            
            string compra = "";
            string venta = "";
            System.Net.WebClient client = new System.Net.WebClient();
            Stream d;
            StreamReader r;
            string line;
            try
            {
                d = client.OpenRead("https://www.bncr.fi.cr/BNCR/TipoCambio.aspx"); // Accede a la pagina que quieres buscar
                r = new StreamReader(d); // lee la informacion o contenido de la web
                line = r.ReadLine(); // recorre linea x linea la web
                int para = 0;
                int leido = 0;
                bool leer = false;
                while (line != null && leido != 2) // mientras exista contenido
                {
                    // aca realizas tu codigo de verificacion o obtener informacion

                    line = r.ReadLine(); // para seguir leyendo las otras lineas de la pagina
                    if (para != 0)
                    {
                        try
                        {
                            for (int i = 0; i < line.Length; i++)
                            {
                                try
                                {
                                    if (line[i] == '>' && line[i + 1] == '5')
                                    {
                                        i++; leer = true;
                                    }
                                }
                                catch { }
                                if (line[i] == '<' && leer == true) { leer = false; leido++; }
                                if (leer == true)
                                {
                                    if (leido == 0)
                                    {
                                        compra += line[i];
                                    }
                                    else
                                    {
                                        venta += line[i];
                                    }
                                }
                            }
                        }
                        catch { }
                    }
                    para++;
                }
                string[] sventa = venta.Split('.');
                gventa = Convert.ToDouble(sventa[0]+","+sventa[1]);
                lblVenta.Text = "Venta: ₡" + venta.ToString();
                lblCompra.Text = "Compra: ₡ " + compra.ToString();
                d.Close();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("No hay conexión a internet");
            }


        }

        protected void AsigarCompra(Buy_Bill bill)
        {
            txtDescripcion.Text = bill.BuyBil_Description;
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
            List<BOP_FAJAS_spBuscarProductosResult> LC = MC.spBuscarProductos(color,size);
            ddl.Items.Clear();
            foreach (BOP_FAJAS_spBuscarProductosResult dato in LC)
            {
                ListItem LI = new ListItem();
                 
                LI.Value = dato.ProDet_PK.ToString();
                LI.Text = dato.Pro_Code+"-"+dato.ProTyp_Name;
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

        protected void dgDetalle_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("EliminarDetalle"))
            {
                MC.EliminarDetalleCompra(Convert.ToInt32(e.CommandArgument));
                dgDetalle.DataBind();
            } 
            dgDetalle.UseAccessibleHeader = true;
            dgDetalle.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if(!txtProducto.Text.Equals("")&& !txtCantidad.Text.Equals("")&& !txtPrecio.Text.Equals(""))
            {
                MC.RegistrarDetalleCompra(Compra.BuyBil_PK, Convert.ToInt32(ddlProductos.SelectedValue), Convert.ToDouble(txtPrecio.Text), Convert.ToInt32(txtCantidad.Text));
                dgDetalle.DataBind();
            }
            
        }

        protected void btnCancelarCompra_Click(object sender, EventArgs e)
        {
            if (Compra.BuyBil_Status.Equals("P"))
            {
                MC.EliminarCompra(Compra.BuyBil_PK);
            }
            Response.Redirect("Compras.aspx");
        } 

        protected void btnAgregarCompra_Click(object sender, EventArgs e)
        {
            if(((Button)sender).Text.Equals("Guardar"))
            { 
                Compra.BuyBil_Description = txtDescripcion.Text;
                MC.EditarCompra(Compra.BuyBil_PK, Compra.BuyBil_Description, gventa);
                Response.Redirect("Compras.aspx");
            }
            if (((Button)sender).Text.Equals("Eliminar"))
            {
                Compra.BuyBil_Description = txtDescripcion.Text;
                MC.EliminarCompra(Compra.BuyBil_PK);
                Response.Redirect("Compras.aspx");
            }
        }
    }
}