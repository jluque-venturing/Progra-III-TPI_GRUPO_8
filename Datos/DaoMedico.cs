using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoMedico
    {
        private AccesoDatos ds = new AccesoDatos();

        public DataTable buscarMedicos(string filtro)
        {
            string consulta = @"
        SELECT
            M.Legajo AS legajo,
            M.Dni AS dni,
            M.Nombre AS nombre,
            M.Apellido AS apellido,
            M.Sexo AS sexo,
            M.Nacionalidad AS nacionalidad,
            M.FechaNacimiento AS fechaNacimiento,
            M.Direccion AS direccion,
            M.Email AS email,
            M.Telefono AS telefono,
            ESP.Nombre AS especialidad,
            L.Nombre AS localidad,
            PR.Nombre AS provincia
        FROM Medicos M
        INNER JOIN Especialidades ESP
            ON M.IdEspecialidad = ESP.IdEspecialidad
        INNER JOIN Localidades L
            ON M.IdLocalidad = L.IdLocalidad
        INNER JOIN Provincias PR
            ON L.IdProvincia = PR.IdProvincia
        WHERE M.Activo = 1
        AND (
            M.Nombre LIKE '%" + filtro.Replace("'", "''") + @"%'
            OR M.Apellido LIKE '%" + filtro.Replace("'", "''") + @"%'
            OR M.Legajo LIKE '%" + filtro.Replace("'", "''") + @"%'
        )";

            return ds.ObtenerTabla("Medicos", consulta);
        }

        public DataTable getTablaMedicos()
        {
            string consulta = @"
                SELECT
                    M.Legajo AS legajo,
                    M.Dni AS dni,
                    M.Nombre AS nombre,
                    M.Apellido AS apellido,
                    M.Sexo AS sexo,
                    M.Nacionalidad AS nacionalidad,
                    M.FechaNacimiento AS fechaNacimiento,
                    M.Direccion AS direccion,
                    M.Email AS email,
                    M.Telefono AS telefono,
                    ESP.Nombre AS especialidad,
                    L.Nombre AS localidad,
                    PR.Nombre AS provincia
                FROM Medicos M
                INNER JOIN Especialidades ESP
                    ON M.IdEspecialidad = ESP.IdEspecialidad
                INNER JOIN Localidades L
                    ON M.IdLocalidad = L.IdLocalidad
                INNER JOIN Provincias PR
                    ON L.IdProvincia = PR.IdProvincia
                WHERE M.Activo = 1";

            return ds.ObtenerTabla("Medicos", consulta);
        }

        public DataTable filtrarPorEspecialidad(string filtro, string idEspecialidad)
        {
            string consulta = @"
                SELECT
                    M.Legajo AS legajo,
                    M.Dni AS dni,
                    M.Nombre AS nombre,
                    M.Apellido AS apellido,
                    M.Sexo AS sexo,
                    M.Nacionalidad AS nacionalidad,
                    M.FechaNacimiento AS fechaNacimiento,
                    M.Direccion AS direccion,
                    M.Email AS email,
                    M.Telefono AS telefono,
                    ESP.Nombre AS especialidad,
                    L.Nombre AS localidad,
                    PR.Nombre AS provincia
                FROM Medicos M
                INNER JOIN Especialidades ESP
                    ON M.IdEspecialidad = ESP.IdEspecialidad
                INNER JOIN Localidades L
                    ON M.IdLocalidad = L.IdLocalidad
                INNER JOIN Provincias PR
                    ON L.IdProvincia = PR.IdProvincia
                WHERE M.Activo = 1
                AND M.IdEspecialidad = '" + idEspecialidad.Replace("'", "''") + @"'
                AND (
                    M.Nombre LIKE '%" + filtro.Replace("'", "''") + @"%'
                    OR M.Apellido LIKE '%" + filtro.Replace("'", "''") + @"%'
                    OR M.Legajo LIKE '%" + filtro.Replace("'", "''") + @"%'
                )";

            return ds.ObtenerTabla("Medicos", consulta);
        }

        public bool atiendeElDia(string legajo, string dia)
        {
            string consulta = "SELECT Legajo FROM MedicoHorarios WHERE Legajo = '" + legajo.Replace("'", "''") + "' AND Dia = '" + dia + "'";

            return ds.existe(consulta);
        }
        public DataTable getHorarioDelDia(string legajo, string dia)
        {
            string consulta = "SELECT HoraDesde, HoraHasta FROM MedicoHorarios WHERE Legajo = '"
                + legajo.Replace("'", "''") + "' AND Dia = '" + dia + "'";
            return ds.ObtenerTabla("MedicoHorarios", consulta);
        }

        public bool existeLegajo(string legajo)
        {
            string consulta = "SELECT Legajo FROM Medicos WHERE Legajo = '" + legajo + "'";

            return ds.existe(consulta);
        }

        public bool existeDNI(string dni)
        {
            string consulta = "SELECT Dni FROM Medicos WHERE Dni = '" + dni + "'";

            return ds.existe(consulta);
        }
       
    }
}
