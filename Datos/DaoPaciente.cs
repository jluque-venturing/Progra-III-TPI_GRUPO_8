using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DaoPaciente
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

        public DataTable buscarPacientes(string filtro)
        {
            string texto = filtro.Replace("'", "''");

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
                WHERE P.Activo = 1
                  AND (P.Nombre LIKE '%" + texto + @"%'
                    OR P.Apellido LIKE '%" + texto + @"%'
                    OR P.Dni LIKE '%" + texto + @"%')";

            return ds.ObtenerTabla("Pacientes", consulta);
        }

        public bool existePaciente(string dni)
        {
            string consulta = "SELECT Dni FROM Pacientes WHERE Dni = '" + dni + "'";

            return ds.existe(consulta);
        }

        public string generarIdPaciente()
        {
            string consulta = @"
                SELECT 'PAC' + RIGHT('00000' + CAST(ISNULL(MAX(CAST(SUBSTRING(IdPaciente, 4, 5) AS INT)), 0) + 1 AS VARCHAR(5)), 5) AS Id
                FROM Pacientes";

            return ds.ObtenerTabla("IdPaciente", consulta).Rows[0]["Id"].ToString();
        }

        public int agregarPaciente(Paciente p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosAgregar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spAgregarPaciente");
        }

        private void armarParametrosAgregar(ref SqlCommand comando, Paciente p)
        {
            comando.Parameters.Add("@IdPaciente", SqlDbType.Char, 8).Value = p.getIdPaciente();
            comando.Parameters.Add("@Dni", SqlDbType.Char, 15).Value = p.getDni();
            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50).Value = p.getNombre();
            comando.Parameters.Add("@Apellido", SqlDbType.VarChar, 50).Value = p.getApellido();
            comando.Parameters.Add("@Sexo", SqlDbType.Char, 1).Value = p.getSexo();
            comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 50).Value = p.getNacionalidad();
            comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date).Value = p.getFechaNacimiento();
            comando.Parameters.Add("@Direccion", SqlDbType.VarChar, 100).Value = p.getDireccion();
            comando.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = p.getEmail();
            comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20).Value = p.getTelefono();
            comando.Parameters.Add("@IdLocalidad", SqlDbType.Char, 8).Value = p.getIdLocalidad();
        }

        public DataTable getTablaProvincias()
        {
            string consulta = @"
        SELECT IdProvincia, Nombre
        FROM Provincias
        ORDER BY Nombre";

            return ds.ObtenerTabla("Provincias", consulta);
        }

        public DataTable getTablaLocalidades(string idProvincia)
        {
            string consulta = @"
        SELECT IdLocalidad, Nombre
        FROM Localidades
        WHERE IdProvincia = '" + idProvincia + @"'
        ORDER BY Nombre";

            return ds.ObtenerTabla("Localidades", consulta);
        }
    }
}