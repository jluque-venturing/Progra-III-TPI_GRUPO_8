using Datos;
using System.Data;

namespace Negocio
{
    public class NegocioMedico
    {
        private DaoMedico dao = new DaoMedico();

        public DataTable getTabla()
        {
            return dao.getTablaMedicos();
        }

        public DataTable buscarMedicos(string filtro)
        {
            return dao.buscarMedicos(filtro);
        }
    }
}