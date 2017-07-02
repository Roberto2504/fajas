using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BOP.Views.PROYECTOS.FAJAS.Aplicacion.Inicio
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int[] Numero = { 12, 32, 11, 1, 6, 2, 4, 3, 7, 10 };

            int[] Numero2 = new int[23];
            string Cadena = "";
            for (int i = 0; i <= Numero.Length - 1; i++)
            {
                Cadena = Cadena + "-" + Numero[i];
            } 

            lblNormal.Text = Cadena;
            Cadena = "";
            for (int i = 0; i <= 9; i++)
            {
                for (int j = i + 1; j <= 9; j++)
                {
                    if (Numero[i] > Numero[j])
                    {
                        int aux = Numero[i];
                        Numero[i] = Numero[j];
                        Numero[j] = aux;
                    }
                }
            }
            for (int i = 0; i <= Numero.Length - 1; i++)
            {
                Cadena = Cadena + "-" + Numero[i];
            }
            lblOrden.Text = Cadena;
        }
    }
}