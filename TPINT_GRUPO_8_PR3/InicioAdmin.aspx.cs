using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_8_PR3
{
    public partial class InicioAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario u = (Usuario)Session["usuario"];

            if (u == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (u.Tipo != 'A')
            {
                Response.Redirect("Login.aspx");
                return;
            }

            lblUsuario.Text = u.Nombre + " " + u.Apellido;
        }
    }
}
