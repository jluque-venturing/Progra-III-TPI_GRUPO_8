using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace TPINT_GRUPO_8_PR3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            NegocioUsuario neg = new NegocioUsuario();
            Usuario u;
            int estado = neg.obtenerEstadoLogin(txtUsuario.Text.Trim(), txtContrasena.Text, out u);

            if (estado == 2)
            {
                lblMensaje.Text = "El usuario está dado de baja";
                return;
            }

            if (estado != 1 || u == null)
            {
                lblMensaje.Text = "Usuario o contraseña incorrectos";
                return;
            }

            Session["usuario"] = u;

            if (u.Tipo == 'A')
                Response.Redirect("InicioAdmin.aspx");
            else
                Response.Redirect("MisTurnos.aspx");
        }
    }
}
