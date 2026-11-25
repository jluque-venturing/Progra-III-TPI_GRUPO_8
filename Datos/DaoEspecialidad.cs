using System.Data;

namespace Datos
{
    public class DaoEspecialidad
    {
        private AccesoDatos ds = new AccesoDatos();

        public DataTable getTablaEspecialidades()
        {
            string consulta = "SELECT IdEspecialidad, Nombre FROM Especialidades ORDER BY Nombre";

            return ds.ObtenerTabla("Especialidades", consulta);
        }
    }
}
