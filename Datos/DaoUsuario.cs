using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoUsuario
    {
        private readonly string rutaBDClinica = @"Data Source=localhost\sqlexpress;Initial Catalog=clinica;Integrated Security=True";

        public Usuario GetUsuario(string usuario, string clave)
        {
            string sqlAdministradores = "SELECT Usuario, Clave, Nombre, Apellido FROM Administradores WHERE Usuario = @usuario AND Clave = @clave";

            using (SqlConnection cn = new SqlConnection(rutaBDClinica))
            using (SqlCommand cmd = new SqlCommand(sqlAdministradores, cn))
            {
                cmd.Parameters.AddWithValue("@usuario", usuario);
                cmd.Parameters.AddWithValue("@clave", clave);
                cn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return new Usuario
                        {
                            usuario = usuario,
                            Clave = clave,
                            Tipo = 'A',
                            Nombre = reader["Nombre"].ToString(),
                            Apellido = reader["Apellido"].ToString(),
                            Legajo = null
                        };
                    }
                }
            }

            string sqlMedicos = "SELECT Usuario, Clave, Nombre, Apellido, Legajo FROM Medicos WHERE Usuario = @usuario AND Clave = @clave AND Activo = 1";

            using (SqlConnection cn = new SqlConnection(rutaBDClinica))
            using (SqlCommand cmd = new SqlCommand(sqlMedicos, cn))
            {
                cmd.Parameters.AddWithValue("@usuario", usuario);
                cmd.Parameters.AddWithValue("@clave", clave);
                cn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return new Usuario
                        {
                            usuario = usuario,
                            Clave = clave,
                            Tipo = 'M',
                            Nombre = reader["Nombre"].ToString(),
                            Apellido = reader["Apellido"].ToString(),
                            Legajo = reader["Legajo"].ToString()
                        };
                    }
                }
            }

            return null;
        }
    }
}
