using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BOP.BO;

namespace BOP.BL.FAJAS.Ventas
{
    public class MantenimientoVentas
    {
        public List<Sale_Bill> ListarVentas()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.Sale_Bill.ToList();
        }
        public static List<BOP_FAJAS_spListarDetalleVentasResult> spListarDetalleVentas(int bill)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spListarDetalleVentas(bill).ToList();
        }
        public  List<BOP_FAJAS_spEncabezadoVentaResult> spEncabezado(int bill)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spEncabezadoVenta(bill).ToList();
        }
        public List<BOP_FAJAS_spReporteVentaRangoFechasResult> spReporteVenta(DateTime d1, DateTime d2)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spReporteVentaRangoFechas(d1,d2).ToList();
        }
        public  List<BOP_FAJAS_spCuerpoVentaResult> spCuerpo(int bill)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spCuerpoVenta(bill).ToList();
        }
        public Sale_Bill RegistrarVenta()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Sale_Bill Venta = new Sale_Bill();
            Venta.SalBil_Date = DateTime.Now;
            Venta.SalBil_Description = "";

            Venta.SalBil_IdClient = "";
            Venta.SalBil_ClientName = "";
            Venta.SalBil_ClientEmail = "";
            Venta.SalBil_PhoneClient = "";
            

            Venta.SalBil_Discount = 0;
            Venta.SalBil_GrossTotal = 0;
            Venta.SalBil_NetTotal = 0;
            Venta.SalBil_Tax = 0;

            Venta.SalBil_FK_Com = 1;
            Venta.SalBil_Status = "P";
            dc.Sale_Bill.InsertOnSubmit(Venta);
            dc.SubmitChanges();
            return Venta;
        }
        public void EditarVenta(int pk, String des, String idClient, String name, String email, String phone,
            double dis)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Sale_Bill Venta = dc.Sale_Bill.First(c => c.SalBil_Pk == pk);

            Venta.SalBil_Description = des;

            Venta.SalBil_IdClient = idClient;
            Venta.SalBil_ClientName = name;
            Venta.SalBil_ClientEmail = email;
            Venta.SalBil_PhoneClient = phone;


            double cGross = 0;
            foreach (BOP_FAJAS_spListarDetalleVentasResult DBB in spListarDetalleVentas(pk))
            {
                cGross += Convert.ToDouble(DBB.Pro_SalePrice * DBB.DetSalBil_Quantity - DBB.DetSalBil_Detail);
                Product_Detail Producto = dc.Product_Detail.FirstOrDefault(c => c.ProDet_PK == DBB.DetBil_FK_ProDet);
                Producto.ProDet_Quantity -= (int)DBB.DetSalBil_Quantity;
                dc.SubmitChanges();
            }
            Venta.SalBil_GrossTotal = cGross;
            Venta.SalBil_Tax = cGross * 0.13;
            Venta.SalBil_Discount = dis;

            Venta.SalBil_NetTotal = cGross - dis + cGross * 0.13;

            Venta.SalBil_Status = "A";
            dc.SubmitChanges();
        }
        public void EliminarVenta(int pk )
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Sale_Bill Venta = dc.Sale_Bill.First(c => c.SalBil_Pk == pk);
  
            if(Venta.SalBil_Status.Equals("A"))
            foreach (BOP_FAJAS_spListarDetalleVentasResult DBB in spListarDetalleVentas(pk))
            {
                 Product_Detail Producto = dc.Product_Detail.FirstOrDefault(c => c.ProDet_PK == DBB.DetBil_FK_ProDet);
                Producto.ProDet_Quantity += (int)DBB.DetSalBil_Quantity;
                dc.SubmitChanges();
            }
             
            Venta.SalBil_Status = "I";
            dc.SubmitChanges();
        }

        public Sale_Bill ConsultarVenta(int pk)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.Sale_Bill.First(c => c.SalBil_Pk == pk);
             
        }
        public double EliminarDetalleVenta(int pk)
        {
            double resultado=0;
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Detail_Sale_Bill DetalleVenta = dc.Detail_Sale_Bill.First(c => c.DetBil_PK == pk);
            Product_Detail Detalle = dc.Product_Detail.First(c => c.ProDet_PK == DetalleVenta.DetBil_FK_ProDet);
            Product Producto = dc.Product.First(c => c.Pro_Pk == Detalle.ProDet_FKk_Pro);
            resultado = Convert.ToDouble( Producto.Pro_SalePrice*DetalleVenta.DetSalBil_Quantity - DetalleVenta.DetSalBil_Detail);
            dc.Detail_Sale_Bill.DeleteOnSubmit(DetalleVenta);
            dc.SubmitChanges();
            return resultado;
        }
        public double RegistrarDetalleVenta(int idVenta, int detpro, double descuento, int cantidad)
        {
             
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Detail_Sale_Bill Venta = new Detail_Sale_Bill();
            Venta.DetBil_FK_ProDet = detpro;
            Venta.DetBil_FK_BuyBil = idVenta;
            Venta.DetSalBil_Detail = descuento;
            Venta.DetSalBil_Quantity = cantidad;
            dc.Detail_Sale_Bill.InsertOnSubmit(Venta);
            dc.SubmitChanges();
            Product_Detail Detalle = dc.Product_Detail.First(c => c.ProDet_PK == detpro);
            Product Producto = dc.Product.First(c => c.Pro_Pk == Detalle.ProDet_FKk_Pro);

            return Producto.Pro_SalePrice*cantidad - descuento;
        }

    }
}
