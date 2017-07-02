using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BOP.BO;

namespace BOP.BL.FAJAS.Compras
{
   public class MantenimientoCompras
    {
        public List<Buy_Bill> ListarCompras()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.Buy_Bill.ToList();
        }
        public List<BOP_FAJAS_spReporteCompraRangoFechasResult> spReporteCompra(DateTime d1, DateTime d2)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spReporteCompraRangoFechas(d1, d2).ToList();
        }
        public static List<BOP_FAJAS_spListarDetalleComprasResult> spListarDetalleCompras(int bill, String Estado)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spListarDetalleCompras(bill, Estado).ToList();
        }
        public  List<BOP_FAJAS_spBuscarProductosResult> spBuscarProductos(int color, int size)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spBuscarProductos(color,size).ToList();
        }
        public Buy_Bill RegistrarCompra()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Buy_Bill Compra = new Buy_Bill();
            Compra.BuyBil_Date = DateTime.Now;
            Compra.BuyBil_Description = "";
            Compra.BuyBil_Status = "P";
            Compra.BuyBil_Total = 0; 
            dc.Buy_Bill.InsertOnSubmit(Compra);
            dc.SubmitChanges();
            return Compra;
        }
        public void EditarCompra(int id, string Des, Double venta)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Buy_Bill Compra =  dc.Buy_Bill.First(c => c.BuyBil_PK == id);
            double total = 0;
            foreach (Detail_Buy_Bill DBB in dc.Detail_Buy_Bill.Where(c => c.DetBuyBil_FK_BuyBil == id && c.DetBuyBil_Status=="P"))
            {
                EditarDetalleCompra(DBB.DetBuyBil_PK);
                total +=Convert.ToDouble(DBB.DetBuyBil_BuyPrice);
            }
            Compra.BuyBil_Description = Des;
            Compra.BuyBil_Total = total* venta;
            Compra.BuyBil_Status = "A";
            dc.SubmitChanges(); 
        }
        public Buy_Bill ConsultarCompra(int id)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.Buy_Bill.First(c => c.BuyBil_PK == id);
        }
        public void EliminarCompra(int id)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Buy_Bill Compra = dc.Buy_Bill.First(c => c.BuyBil_PK == id);
            Compra.BuyBil_Status = "I";
            dc.SubmitChanges();

            foreach (Detail_Buy_Bill DBB in dc.Detail_Buy_Bill.Where(c => c.DetBuyBil_FK_BuyBil == id))
            {
                EliminarDetalleCompra(DBB.DetBuyBil_PK);
            } 
        }

        public void EliminarDetalleCompra(int id)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Detail_Buy_Bill Compra = dc.Detail_Buy_Bill.First(c => c.DetBuyBil_PK == id);
            if (Compra.DetBuyBil_Status.Equals("A"))
            {
                Product_Detail Producto = dc.Product_Detail.First(c => c.ProDet_PK == Compra.DetBuyBil_FK_DetPro);
                Producto.ProDet_Quantity = Producto.ProDet_Quantity - Compra.DetBuyBil_Quantity;
                dc.SubmitChanges();
            }
            Compra.DetBuyBil_Status = "I";
            dc.SubmitChanges();
             
        }
        public void RegistrarDetalleCompra(int idCompra,int detpro,double precio, int cantidad)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Detail_Buy_Bill Compra = new Detail_Buy_Bill();
            Compra.DetBuyBil_FK_DetPro = detpro;
            Compra.DetBuyBil_BuyPrice = precio;
            Compra.DetBuyBil_FK_BuyBil = idCompra;
            Compra.DetBuyBil_Quantity = cantidad;
            Compra.DetBuyBil_Status = "P"; 
            dc.Detail_Buy_Bill.InsertOnSubmit(Compra);
            dc.SubmitChanges(); 
        }
        public void EditarDetalleCompra(int id)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Detail_Buy_Bill Compra = dc.Detail_Buy_Bill.First(c => c.DetBuyBil_PK == id);
            Compra.DetBuyBil_Status = "A";
            dc.SubmitChanges();

            Product_Detail Producto = dc.Product_Detail.First(c => c.ProDet_PK == Compra.DetBuyBil_FK_DetPro);
            Producto.ProDet_Quantity = Producto.ProDet_Quantity + Compra.DetBuyBil_Quantity;
            dc.SubmitChanges();   
        }

    }
}
