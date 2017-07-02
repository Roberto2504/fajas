using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BOP.BL.FAJAS.Seguridad;
using BOP.BO;
namespace BOP.Views.PROYECTOS.FAJAS.Login
{
    public partial class Login : System.Web.UI.Page
    {
        MantenimientoSeguridad MS = new MantenimientoSeguridad();
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Iniciar_Click(object sender, EventArgs e)
        {
            if(MS.Login(txtUsu.Text,txtPass.Text))
            Response.Redirect("../Aplicacion/Productos/Productos.aspx");
        }
    }
}