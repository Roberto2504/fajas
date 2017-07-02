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
        public BOP_FAJAS_spListarDetalleProductosResult spListarDetalle(int PK, int det)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            BOP_FAJAS_spListarDetalleProductosResult respuesta = new BOP_FAJAS_spListarDetalleProductosResult();
            List<BOP_FAJAS_spListarDetalleProductosResult> Detalles = spListarDetalleProductos(PK);
            foreach (BOP_FAJAS_spListarDetalleProductosResult d in Detalles)
            {
                if (d.ProDet_PK.Equals(det))
                {
                    respuesta = d;
                    break;
                }
            }
            return respuesta;
        }
        public BOP_FAJAS_spListarProductoResult spListarProducto(int PK)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spListarProducto(PK).FirstOrDefault();
        }
        public List<Product_Type> ListarTipoProductos()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return  dc.Product_Type.ToList();

        }
        public int IdentificadorDetalle()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            List<Product_Detail> Tamaño = dc.Product_Detail.ToList();
            return Tamaño.Count+1;
        }
        public List<Product_Size> ListarTamaños()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.Product_Size.ToList();

        }
        public List<Product_Color> ListarColores()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.Product_Color.ToList();

        }
        public void EditarProducto(int pk,string pNombre, string pCodigo, string pDescripcion, double pPrecio,
           int pTipo)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Product Producto = dc.Product.First(c => c.Pro_Pk == pk);
            Producto.Pro_Name = pNombre;
            Producto.Pro_Code = pCodigo;
            Producto.Pro_Description = pDescripcion;
            Producto.Pro_SalePrice = pPrecio;
            Producto.Pro_Fk_ProTyp = pTipo;
            dc.SubmitChanges();
        }
        public void EditarProductoImagen(int pk, string Imagen)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Product Producto = dc.Product.First(c => c.Pro_Pk == pk);
            Producto.Pro_Photo = Imagen;
            dc.SubmitChanges();
        }
        public void EliminarProducto(int pk)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Product Producto = dc.Product.First(c => c.Pro_Pk == pk);
            Producto.Pro_Status = "I";
            dc.SubmitChanges();
        }
        public Product RegistrarProducto(string pNombre, string pCodigo, string pDescripcion, double pPrecio,
           int pTipo)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Product Producto = new Product();
            Producto.Pro_Name = pNombre;
            Producto.Pro_Code = pCodigo;
            Producto.Pro_Description = pDescripcion;
            Producto.Pro_SalePrice = pPrecio;
            Producto.Pro_Fk_ProTyp = pTipo;
            Producto.Pro_Photo = "../img/error-bg.jpg";
            Producto.Pro_Status = "A";
            dc.Product.InsertOnSubmit(Producto);
            dc.SubmitChanges();
            return Producto;
        }
        public void RegistrarDetalle(int pro, int col, int siz, int qua)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Product_Detail Producto = new Product_Detail();
            Producto.ProDet_PK = IdentificadorDetalle();
            Producto.ProDet_FKk_Pro = pro;
            Producto.ProDet_FK_ProCol = col;
            Producto.ProDet_FK_ProSiz = siz;
            Producto.ProDet_Quantity = qua;
            Producto.ProDet_Status = "A";
            dc.Product_Detail.InsertOnSubmit(Producto);
            dc.SubmitChanges(); 
        }
        public void EditarDetalle(int det,int pro, int col, int siz, int qua)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Product_Detail Producto = dc.Product_Detail.First(c => c.ProDet_PK == det);
            Producto.ProDet_FKk_Pro = pro;
            Producto.ProDet_FK_ProCol = col;
            Producto.ProDet_FK_ProSiz = siz;
            Producto.ProDet_Quantity = qua;
            dc.SubmitChanges();
        }
        public void EliminarDetalle(int det)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Product_Detail Producto = dc.Product_Detail.First(c => c.ProDet_PK == det);
            Producto.ProDet_Status = "I"; 
            dc.SubmitChanges();
        }
    }
}
