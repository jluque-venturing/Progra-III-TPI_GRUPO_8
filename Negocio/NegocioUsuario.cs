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
    }
}
