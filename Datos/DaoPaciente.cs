using System.Data;

namespace Datos
{
    internal class DaoPaciente
    {
        private AccesoDatos ds = new AccesoDatos();

        public DataTable getTablaPacientes()
        {
            string consulta = @"
                SELECT
                    P.IdPaciente AS idPaciente,
                    P.Dni AS dni,
                    P.Nombre AS nombre,
                    P.Apellido AS apellido,
                    P.Sexo AS sexo,
                    P.Nacionalidad AS nacionalidad,
                    P.FechaNacimiento AS fechaNacimiento,
                    P.Direccion AS direccion,
                    P.Email AS email,
                    P.Telefono AS telefono,
                    L.Nombre AS localidad,
                    PR.Nombre AS provincia
                FROM Pacientes P
                INNER JOIN Localidades L
                    ON P.IdLocalidad = L.IdLocalidad
                INNER JOIN Provincias PR
                    ON L.IdProvincia = PR.IdProvincia
                WHERE P.Activo = 1";

            return ds.ObtenerTabla("Pacientes", consulta);
        }

        public bool existePaciente(string dni)
        {
            string consulta = "SELECT Dni FROM Pacientes WHERE Dni = '" + dni + "'";

            return ds.existe(consulta);
        }
    }
}