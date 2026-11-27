using System;
using System.Data;

namespace Datos
{
    public class DaoTurno
    {
        private AccesoDatos ds = new AccesoDatos();

        public DaoTurno()
        {
        }
        public DataTable getTurnosMedico(string legajo)
        {
            string consulta = @"
                SELECT
                    T.IdTurno AS idTurno,
                    T.Fecha AS fecha,
                    T.Hora AS hora,
                    T.Estado AS estado,
                    P.Dni AS dni,
                    P.Nombre AS nombre,
                    P.Apellido AS apellido
                FROM Turnos T
                INNER JOIN Pacientes P
                    ON T.IdPaciente = P.IdPaciente
                WHERE T.Activo = 1
                AND T.Legajo = '" + legajo + @"'";

            return ds.ObtenerTabla("Turnos", consulta);
        }

        public DataTable getHorasOcupadas(string legajo, DateTime fecha)
        {
            string consulta = "SELECT Hora FROM Turnos WHERE Activo = 1 AND Legajo = '"
                + legajo.Replace("'", "''") + "' AND Fecha = '" + fecha.ToString("yyyy-MM-dd") + "'";
            return ds.ObtenerTabla("Turnos", consulta);
        }
    }
}