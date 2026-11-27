using Datos;
using System;
using System.Collections.Generic;
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
        public List<string> horariosDisponibles(string legajo, DateTime fecha)
        {
            List<string> libres = new List<string>();
            DataTable horario = dao.getHorarioDelDia(legajo, nombreDelDia(fecha));
            if (horario.Rows.Count == 0) return libres;

            List<TimeSpan> ocupadas = new List<TimeSpan>();
            foreach (DataRow f in new DaoTurno().getHorasOcupadas(legajo, fecha).Rows)
                ocupadas.Add((TimeSpan)f["Hora"]);

            TimeSpan desde = (TimeSpan)horario.Rows[0]["HoraDesde"];
            TimeSpan hasta = (TimeSpan)horario.Rows[0]["HoraHasta"];

            for (TimeSpan h = desde; h < hasta; h = h.Add(TimeSpan.FromHours(1)))
                if (!ocupadas.Contains(h))
                    libres.Add(h.ToString(@"hh\:mm"));

            return libres;
        }
    }
}