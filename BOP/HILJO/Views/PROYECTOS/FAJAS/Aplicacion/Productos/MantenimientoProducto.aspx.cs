using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BOP.BL.FAJAS.Productos;
using BOP.BO;

namespace BOP.Views.PROYECTOS.FAJAS.Aplicacion.Productos
{
    public partial class MantenimientoProducto : System.Web.UI.Page
    {
        MantenimientoProductos MP = new MantenimientoProductos();
        public static BOP_FAJAS_spListarProductoResult Producto;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count != 0)
            {
                string sPK = Request.QueryString["Pr"].ToString();
                if (!sPK.Equals(""))
                {
                    Producto = new BOP_FAJAS_spListarProductoResult();
                    Producto = MP.spListarProducto(Convert.ToInt32(sPK));
                    AsignarProducto(Producto);
                }
                if (sPK.Equals(""))
                {
                    Producto = null;
                    btnEditarProducto.Visible = false;
                    btnEliminaProducto.Visible = false;
                    btnAgregarDetalle.Visible = false;
                    CargarTipoProductos(ddlTipoProducto, 1);
                }
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (dgDetalle.Rows.Count > 0)
            {
                dgDetalle.UseAccessibleHeader = true;
                dgDetalle.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }
        protected void AsignarProducto(BOP_FAJAS_spListarProductoResult pProducto)
        {
            lblCodigo.Text = pProducto.Pro_Code;
            lblNombre.Text = pProducto.Pro_Name;
            lblPrecio.Text = "₡" + pProducto.Pro_SalePrice.ToString("N1");
            lblTipo.Text = pProducto.ProTyp_Name;
            lblDescripcion.Text = pProducto.Pro_Description;
            imgProducto.ImageUrl = pProducto.Pro_Photo;
        }
        protected void GuardarMantenimientoImagen_Click(object sender, EventArgs e)
        {
            bool archivoValido = false;
            String rutaCarpetaDestino = Server.MapPath("../img/");
            Console.WriteLine(rutaCarpetaDestino);
            System.Diagnostics.Debug.WriteLine(rutaCarpetaDestino);
            if (SubidordeImagen.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(SubidordeImagen.FileName).ToLower();
                String[] extensionesValidas = { ".gif", ".png", ".jpg" };
                for (int i = 0; i < extensionesValidas.Length; i++)
                {
                    if (fileExtension == extensionesValidas[i])
                    {
                        archivoValido = true;
                    }
                }
            }

            if (archivoValido)
            {
                try
                {
                    SubidordeImagen.PostedFile.SaveAs(rutaCarpetaDestino + SubidordeImagen.FileName);
                    MP.EditarProductoImagen(Producto.Pro_Pk, "../img/" + SubidordeImagen.FileName.ToString());

                }
                catch (Exception)
                {

                }
            }
            else
            {

            }
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#ModalMantenimientoImagen').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CloseModalMantenimientoImagenScript", sb.ToString(), false);
            Producto = MP.spListarProducto(Producto.Pro_Pk);
            AsignarProducto(Producto);

        }

        protected void GuardarMantenimientoProducto_Click(object sender, EventArgs e)
        {

            if (Producto != null)
            {
                MP.EditarProducto(Producto.Pro_Pk, txtNombre.Text, txtCodigo.Text, txtDescripcion.Text, Convert.ToDouble(txtPrecio.Text), Convert.ToInt32(ddlTipoProducto.SelectedValue));
                Producto = MP.spListarProducto(Convert.ToInt32(Producto.Pro_Pk));
                AsignarProducto(Producto);
            }
            if (Producto == null)
            {
                Response.Redirect("MantenimientoProducto.aspx?Pr="+ MP.RegistrarProducto( txtNombre.Text, txtCodigo.Text, txtDescripcion.Text, Convert.ToDouble(txtPrecio.Text), Convert.ToInt32(ddlTipoProducto.SelectedValue)).Pro_Pk);
            }


            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#ModalMantenimientoProducto').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CloseModalMantenimientoProductoScript", sb.ToString(), false);

        }
        protected void btnEditarProducto_Click(object sender, EventArgs e)
        {
            txtCodigo.Text = Producto.Pro_Code;
            txtNombre.Text = Producto.Pro_Name;
            txtPrecio.Text = Convert.ToDecimal(Producto.Pro_SalePrice).ToString(); 
            txtDescripcion.Text = Producto.Pro_Description;
            CargarTipoProductos(ddlTipoProducto, Producto.Pro_Fk_ProTyp);
            
        }
        protected void CargarTipoProductos(DropDownList ddl, int Tipo)
        {
            List<Product_Type> LC = MP.ListarTipoProductos();
            ddl.Items.Clear();
            foreach (Product_Type dato in LC)
            {
                ListItem LI = new ListItem();
                if (dato.ProTyp_Pk.Equals(Tipo))
                {
                    LI.Selected = true; 
                }
                LI.Value = dato.ProTyp_Pk.ToString();
                LI.Text = dato.ProTyp_Name;
                ddl.Items.Add(LI);
            }
        }
        protected void CargarTamaños(DropDownList ddl, int Tamaño)
        {
            List<Product_Size> LC = MP.ListarTamaños();
            ddl.Items.Clear();
            foreach (Product_Size dato in LC)
            {
                ListItem LI = new ListItem();
                if (dato.Siz_Pk.Equals(Tamaño))
                {
                    LI.Selected = true;
                }
                LI.Value = dato.Siz_Pk.ToString();
                LI.Text = dato.Siz_Name;
                ddl.Items.Add(LI);
            }
        }
        protected void CargarColor(DropDownList ddl, int Color)
        {
            List<Product_Color> LC = MP.ListarColores();
            ddl.Items.Clear();
            foreach (Product_Color dato in LC)
            {
                ListItem LI = new ListItem();
                if (dato.ProCol_PK.Equals(Color))
                {
                    LI.Selected = true;
                }
                LI.Value = dato.ProCol_PK.ToString();
                LI.Text = dato.ProCol_Name;
                ddl.Items.Add(LI);
            }
        }

        protected void btnEliminaProducto_Click(object sender, EventArgs e)
        {
            MP.EliminarProducto(Producto.Pro_Pk);
            Response.Redirect("Productos.aspx");
        } 
        protected void btnAgregarDetalle_Click(object sender, EventArgs e)
        {
            CargarColor(ddlColor, 0);
            CargarTamaños(ddlTamaño, 0);
            txtCantidad.Text = "";
            txtIdDetalle.Value = "";
        } 
        protected void dgDetalle_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("EditarDetalle"))
            {
                BOP_FAJAS_spListarDetalleProductosResult PC = MP.spListarDetalle(Producto.Pro_Pk,Convert.ToInt32(e.CommandArgument));
                txtIdDetalle.Value = PC.ProDet_PK.ToString();
                CargarColor(ddlColor, PC.ProCol_PK);
                CargarColor(ddlTamaño, PC.Siz_Pk);
                txtCantidad.Text = PC.ProDet_Quantity.ToString();
            }
            if (e.CommandName.Equals("EliminarDetalle"))
            {
                MP.EliminarDetalle(Convert.ToInt32(e.CommandArgument));
                dgDetalle.DataBind();
            }

            dgDetalle.UseAccessibleHeader = true;
            dgDetalle.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void GuardarMantenimientoDetalle_Click(object sender, EventArgs e)
        {
            if (!txtIdDetalle.Value.Equals(""))
            {
                MP.EditarDetalle(Convert.ToInt32(txtIdDetalle.Value),Producto.Pro_Pk, Convert.ToInt32(ddlColor.SelectedValue), Convert.ToInt32(ddlTamaño.SelectedValue), Convert.ToInt32(txtCantidad.Text));   
            }
            else
            {
                MP.RegistrarDetalle(Producto.Pro_Pk, Convert.ToInt32(ddlColor.SelectedValue), Convert.ToInt32(ddlTamaño.SelectedValue), Convert.ToInt32(txtCantidad.Text));
            } 
            dgDetalle.DataBind();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#ModalMantenimientoDetalle').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CloseModalMantenimientoDetalleScript", sb.ToString(), false);

        }
    }
}