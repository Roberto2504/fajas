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
                }
            }
        }
        protected void AsignarProducto(BOP_FAJAS_spListarProductoResult pProducto)
        {
            lblCodigo.Text = pProducto.Pro_Code;
            lblNombre.Text = pProducto.Pro_Name;
            lblPrecio.Text = "₡" + pProducto.Pro_SalePrice;
            lblTipo.Text = pProducto.ProTyp_Name;
            lblDescripcion.Text = pProducto.Pro_Description;
        }

    }
}