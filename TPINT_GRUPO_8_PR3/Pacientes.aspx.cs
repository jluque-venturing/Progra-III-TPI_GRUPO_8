using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_8_PR3
{
    public partial class Pacientes : System.Web.UI.Page
    {
        private NegocioPaciente negocio = new NegocioPaciente();

        private void CargarPacientes(string filtro)
        {
            if (string.IsNullOrWhiteSpace(filtro))
            {
                gvPacientes.DataSource = negocio.getTabla();
            }
            else
            {
                gvPacientes.DataSource = negocio.buscarPacientes(filtro);
            }

            gvPacientes.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPacientes("");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            gvPacientes.PageIndex = 0;
            CargarPacientes(txtBuscar.Text.Trim());
        }

        protected void gvPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPacientes.PageIndex = e.NewPageIndex;
            CargarPacientes(txtBuscar.Text.Trim());
        }
    }
}
