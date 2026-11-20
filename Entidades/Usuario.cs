using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public string usuario { get; set; }
        public string Clave { get; set; }

        // A = Administrador, M = Médico
        public char Tipo { get; set; }

        public string Nombre { get; set; }
        public string Apellido { get; set; }

        // Exclusivo para médicos
        public string Legajo { get; set; }
    }
}
