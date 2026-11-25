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
                CargarEspecialidades();
                CargarMedicos("");
            }
        }

        private void CargarEspecialidades()
        {
            NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
            ddlFiltrarEspecialidad.DataSource = negocioEspecialidad.getTabla();
            ddlFiltrarEspecialidad.DataTextField = "Nombre";
            ddlFiltrarEspecialidad.DataValueField = "IdEspecialidad";
            ddlFiltrarEspecialidad.DataBind();
        }

        private void CargarMedicos(string filtro)
        {
            string idEspecialidad = ddlFiltrarEspecialidad.SelectedValue;

            if (idEspecialidad != "")
            {
                gvMedicos.DataSource = negocio.filtrarPorEspecialidad(filtro, idEspecialidad);
            }
            else if (string.IsNullOrWhiteSpace(filtro))
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

        protected void btnFiltrar_Click(object sender, EventArgs e)
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