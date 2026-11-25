using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioPaciente
    {
        public DataTable getTabla()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.getTablaPacientes();
        }
        public DataTable buscarPacientes(string filtro)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.buscarPacientes(filtro);
        }

        public DataTable getTablaProvincias()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.getTablaProvincias();
        }

        public DataTable getTablaLocalidades(string idProvincia)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.getTablaLocalidades(idProvincia);
        }
    }
}
