using Datos;
using System.Data;

namespace Negocio
{
    public class NegocioEspecialidad
    {
        private DaoEspecialidad dao = new DaoEspecialidad();

        public DataTable getTabla()
        {
            return dao.getTablaEspecialidades();
        }
    }
}
