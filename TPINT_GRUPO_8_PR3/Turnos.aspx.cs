using Entidades;
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
    public partial class Turnos : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                cargarGvTurnos();
                cargarEspecialidades();
            }
        }

        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            cargarGvTurnos();
        }

        private void cargarGvTurnos()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("IdTurno");
            dt.Columns.Add("Especialidad");
            dt.Columns.Add("Medico");
            dt.Columns.Add("Paciente");
            dt.Columns.Add("Fecha");
            dt.Columns.Add("Horario");

            gvTurnos.DataSource = dt;
            gvTurnos.DataBind();
        }

        private void cargarEspecialidades()
        {
            NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
            ddlEspecialidad.DataSource = negocioEspecialidad.getTabla();
            ddlEspecialidad.DataTextField = "Nombre";
            ddlEspecialidad.DataValueField = "IdEspecialidad";
            ddlEspecialidad.DataBind();
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlMedico.Items.Clear();
            ddlMedico.Items.Add(new ListItem("-- Seleccionar --", "0"));

            if (ddlEspecialidad.SelectedValue == "0") return;

            NegocioMedico negocioMedico = new NegocioMedico();
            DataTable medicos = negocioMedico.filtrarPorEspecialidad("", ddlEspecialidad.SelectedValue);

            foreach (DataRow fila in medicos.Rows)
            {
                string nombreCompleto = fila["apellido"] + ", " + fila["nombre"];
                ddlMedico.Items.Add(new ListItem(nombreCompleto, fila["legajo"].ToString()));
            }
        }

        protected void txtFecha_TextChanged(object sender, EventArgs e)
        {
            ddlHorario.Items.Clear();
            ddlHorario.Items.Add(new ListItem("-- Seleccionar --", "0"));

            if (!ValidarFecha()) return;

            NegocioMedico negocioMedico = new NegocioMedico();
            foreach (string hora in negocioMedico.horariosDisponibles(ddlMedico.SelectedValue, DateTime.Parse(txtFecha.Text)))
                ddlHorario.Items.Add(new ListItem(hora, hora));
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ViewState["IdPaciente"] = null;
            lblPaciente.ForeColor = System.Drawing.Color.Red;

            if (!Page.IsValid)
                return;

            NegocioPaciente negocioPaciente = new NegocioPaciente();
            Paciente p = negocioPaciente.buscarPorDni(txtDNI.Text.Trim());

            if (p == null)
            {
                lblPaciente.Text = "No existe un paciente con ese DNI";
                return;
            }

            if (!p.getActivo())
            {
                lblPaciente.Text = "El paciente está dado de baja";
                return;
            }

            ViewState["IdPaciente"] = p.getIdPaciente();
            lblPaciente.ForeColor = System.Drawing.Color.Black;
            lblPaciente.Text = p.getApellido() + ", " + p.getNombre();
        }

        private bool ValidarFecha()
        {
            lblMensajeFecha.Text = "";

            DateTime fecha;
            if (!DateTime.TryParse(txtFecha.Text, out fecha))
            {
                lblMensajeFecha.Text = "Seleccione una fecha";
                return false;
            }

            if (fecha.Date < DateTime.Today)
            {
                lblMensajeFecha.Text = "La fecha no puede ser anterior a hoy";
                return false;
            }

            if (ddlMedico.SelectedValue == "0")
            {
                lblMensajeFecha.Text = "Seleccione un médico";
                return false;
            }

            NegocioMedico negocioMedico = new NegocioMedico();
            if (!negocioMedico.atiendeElDia(ddlMedico.SelectedValue, fecha))
            {
                lblMensajeFecha.Text = "El médico no atiende los días " +negocioMedico.nombreDelDia(fecha);
                return false;
            }

            return true;
        }
    }
}