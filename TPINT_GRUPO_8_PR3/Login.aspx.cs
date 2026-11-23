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
            Usuario u = neg.login(txtUsuario.Text, txtContrasena.Text); 

            if (u == null)
            {
                lblMensaje.Text = "Usuario o contraseña incorrectos";
                return;
            }

            Session["usuario"] = u;
        }
    }
}