using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BOP.BO;
using BOP.BL.FAJAS.Seguridad;

namespace BOP.Views.PROYECTOS.FAJAS.Aplicacion.Seguridad
{
    public partial class Seguridad : System.Web.UI.Page
    {
        MantenimientoSeguridad MS = new MantenimientoSeguridad();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (dgUsuarios.Rows.Count > 0)
            {
                dgUsuarios.UseAccessibleHeader = true;
                dgUsuarios.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }

        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            txtID.Value = "";
            txtUsuario.Text = "";
            txtContra.Text = "";
        }

        protected void dgUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("EditarUsuario"))
            {
                Usuarios PC = MS.ConsultarUsuario(Convert.ToInt32(e.CommandArgument));
                txtID.Value = PC.Use_PK.ToString();
                txtUsuario.Text = PC.Use_Name;
                txtContra.Text = PC.Use_Password;  
            }
            if (e.CommandName.Equals("EliminarUsuario"))
            {
                MS.EliminarUsuario(Convert.ToInt32(e.CommandArgument));
                dgUsuarios.DataBind(); 
            }

            dgUsuarios.UseAccessibleHeader = true;
            dgUsuarios.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnRMUsuario_Click(object sender, EventArgs e)
        {
            if (txtID.Value.Equals(""))
            {
                MS.RegistrarUsuario(txtUsuario.Text.ToString(), txtContra.Text.ToString());
            }
            if (!txtID.Value.Equals(""))
            {
                MS.EditarUsuario(Convert.ToInt32(txtID.Value),txtUsuario.Text.ToString(), txtContra.Text.ToString());
            }
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#ModalMantenimientoUsuario').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CloseModalMantenimientoUsuarioScript", sb.ToString(), false);
            dgUsuarios.DataBind();
        }
    }
}