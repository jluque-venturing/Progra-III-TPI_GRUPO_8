using Datos;
using System;
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

        public DataTable filtrarPorEspecialidad(string filtro, string idEspecialidad)
        {
            return dao.filtrarPorEspecialidad(filtro, idEspecialidad);
        }

        public string nombreDelDia(DateTime fecha)
        {
            // Escritos igual que en CK_MedicoHorarios_Dia (sin tildes).
            string[] dias = { "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" };
            return dias[(int)fecha.DayOfWeek];
        }

        public bool atiendeElDia(string legajo, DateTime fecha)
        {
            return dao.atiendeElDia(legajo, nombreDelDia(fecha));
        }
    }
}