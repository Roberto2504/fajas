using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BOP.BO;

namespace BOP.BL.FAJAS.Seguridad
{
    public class MantenimientoSeguridad
    {
        public List<BOP_FAJAS_spListarUsuariosResult> spListarUsuarios()
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            return dc.BOP_FAJAS_spListarUsuarios().ToList();
        }
        public void RegistrarUsuario(string User, string Pass)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Usuarios Usuario = new Usuarios();
            Usuario.Use_Name = User;
            Usuario.Use_Password = Pass;
            dc.Usuarios.InsertOnSubmit(Usuario);
            dc.SubmitChanges();
        }
        public void EditarUsuario(int PK,string User, string Pass)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Usuarios Usuario = dc.Usuarios.First(c => c.Use_PK == PK);
            Usuario.Use_Name = User;
            Usuario.Use_Password = Pass; 
            dc.SubmitChanges();
        }
        public void EliminarUsuario(int pPk)
        {
            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Usuarios Usuario = dc.Usuarios.First(c => c.Use_PK == pPk);
            dc.Usuarios.DeleteOnSubmit(Usuario);
            dc.SubmitChanges();
        }
        public Usuarios ConsultarUsuario(int PK)
        {

            FAJA_MODELDataContext dc = new FAJA_MODELDataContext();
            Usuarios Usuario = new Usuarios();
            if (PK != 0)
            {
                Usuario = (from c in dc.Usuarios
                            where c.Use_PK == PK
                            select c).First();
            }
            return Usuario;

        }


    }
}
