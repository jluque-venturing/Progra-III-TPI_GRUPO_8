using Entidades;
using Negocio;
using System;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_8_PR3
{
    public partial class Medicos : System.Web.UI.Page
    {
        private NegocioMedico negocio = new NegocioMedico();

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario u = (Usuario)Session["usuario"];
            lblUsuarioLogueado.Text = u.Nombre + " " + u.Apellido;
            if (!IsPostBack)
            {
                CargarMedicos("");
            }
        }

        private void CargarMedicos(string filtro)
        {
            if (string.IsNullOrWhiteSpace(filtro))
            {
                gvMedicos.DataSource = negocio.getTabla();
            }
            else
            {
                gvMedicos.DataSource = negocio.buscarMedicos(filtro);
            }

            gvMedicos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            gvMedicos.PageIndex = 0;
            CargarMedicos(txtBuscar.Text.Trim());
        }

        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex;
            CargarMedicos(txtBuscar.Text.Trim());
        }
    }
}