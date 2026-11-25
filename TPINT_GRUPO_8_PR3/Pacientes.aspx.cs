using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

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

        private void CargarProvincias()
        {
            ddlProvincia.DataSource = negocio.getTablaProvincias();
            ddlProvincia.DataTextField = "Nombre";
            ddlProvincia.DataValueField = "IdProvincia";
            ddlProvincia.DataBind();

            ddlProvincia.Items.Insert(0, new ListItem("Seleccione una provincia...", ""));
        }

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

            if (!IsPostBack)
            {
                CargarPacientes("");
                CargarProvincias();
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlLocalidad.Items.Clear();

            if (!string.IsNullOrEmpty(ddlProvincia.SelectedValue))
            {
                ddlLocalidad.DataSource = negocio.getTablaLocalidades(ddlProvincia.SelectedValue);
                ddlLocalidad.DataTextField = "Nombre";
                ddlLocalidad.DataValueField = "IdLocalidad";
                ddlLocalidad.DataBind();
            }

            ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una localidad...", ""));
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
