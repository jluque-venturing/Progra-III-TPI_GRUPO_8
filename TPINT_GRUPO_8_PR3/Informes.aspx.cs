using System;
using System.Data;
using System.Web.UI;

namespace TPINT_GRUPO_8_PR3
{
    public partial class Informes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Deja visibles los GridView sin inventar registros.
                gvPresentes.DataSource = new DataTable();
                gvPresentes.DataBind();

                gvAusentes.DataSource = new DataTable();
                gvAusentes.DataBind();
            }
        }

        protected void btnGenerarInformes_Click(object sender, EventArgs e)
        {
            if (txtFechaDesde.Text == "" || txtFechaHasta.Text == "")
            {
                lblMensaje.Text = "Seleccione ambas fechas para solicitar los informes.";
                return;
            }

            DateTime fechaDesde;
            DateTime fechaHasta;

            if (!DateTime.TryParse(txtFechaDesde.Text, out fechaDesde) ||
                !DateTime.TryParse(txtFechaHasta.Text, out fechaHasta))
            {
                lblMensaje.Text = "Ingrese fechas válidas.";
                return;
            }

            if (fechaDesde > fechaHasta)
            {
                lblMensaje.Text = "La fecha desde no puede ser posterior a la fecha hasta.";
                return;
            }

            lblMensaje.Text = "Período seleccionado. Falta conectar los informes con los datos de la clínica.";
        }
    }
}
