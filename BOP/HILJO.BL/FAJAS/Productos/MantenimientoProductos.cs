using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BOP.BO;

namespace BOP.BL.FAJAS.Productos
{
    public class MantenimientoProductos
    {
        public List<BOP_FAJAS_spListarProductosResult> spListarProductos()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spListarProductos().ToList();
        }
        public List<BOP_FAJAS_spListarDetalleProductosResult> spListarDetalleProductos(int PK)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spListarDetalleProductos(PK).ToList();
        }
        public BOP_FAJAS_spListarProductoResult spListarProducto(int PK)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spListarProducto(PK).FirstOrDefault();
        }
    }
}
