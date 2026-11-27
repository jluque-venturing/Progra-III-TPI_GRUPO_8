using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Negocio
{
    public class NegocioUsuario
    {
        DaoUsuario dao = new DaoUsuario();

        public Usuario login(string usuario, string contrasenia)
        {
            if (string.IsNullOrWhiteSpace(usuario) || string.IsNullOrWhiteSpace(contrasenia))
            {
                return null;
            }
            return dao.GetUsuario(usuario, contrasenia);
        }

        public int obtenerEstadoLogin(string usuario, string contrasenia, out Usuario usuarioLogueado)
        {
            usuarioLogueado = null;

            if (string.IsNullOrWhiteSpace(usuario) || string.IsNullOrWhiteSpace(contrasenia))
            {
                return 0;
            }

            Usuario u = dao.GetUsuario(usuario, contrasenia);
            if (u != null)
            {
                usuarioLogueado = u;
                return 1;
            }

            if (dao.GetEstadoMedico(usuario, contrasenia) == 2)
            {
                return 2;
            }

            return 0;
        }
    }
}
