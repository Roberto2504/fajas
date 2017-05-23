using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BOP.BO;
using BOP.BL.FAJAS.Productos;

namespace BOP.Views.PROYECTOS.FAJAS.Aplicacion.Productos
{
    public partial class Productos : System.Web.UI.Page
    {
        public static List<BOP_FAJAS_spListarProductosResult> lProductos;

        MantenimientoProductos MP = new MantenimientoProductos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lProductos = MP.spListarProductos();
            }
        }
    }
}