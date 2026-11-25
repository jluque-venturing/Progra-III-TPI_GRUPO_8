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
    public partial class Turnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario u = (Usuario)Session["usuario"];
            lblUsuario.Text = u.Nombre + " " + u.Apellido;
            if (!IsPostBack)
            {
                cargarGvTurnos();
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
    }
}