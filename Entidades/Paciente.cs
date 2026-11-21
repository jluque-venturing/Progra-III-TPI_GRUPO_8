using System;

namespace Entidades
{
    public class Paciente
    {
        private string idPaciente;
        private string dni;
        private string nombre;
        private string apellido;
        private string sexo;
        private string nacionalidad;
        private DateTime fechaNacimiento;
        private string direccion;
        private string idLocalidad;
        private string idProvincia;
        private string email;
        private string telefono;
        private bool activo;

        public Paciente()
        {
        }

        public string getIdPaciente() { return idPaciente; }
        public void setIdPaciente(string idPaciente) { this.idPaciente = idPaciente; }

        public string getDni() { return dni; }
        public void setDni(string dni) { this.dni = dni; }

        public string getNombre() { return nombre; }
        public void setNombre(string nombre) { this.nombre = nombre; }

        public string getApellido() { return apellido; }
        public void setApellido(string apellido) { this.apellido = apellido; }

        public string getSexo() { return sexo; }
        public void setSexo(string sexo) { this.sexo = sexo; }

        public string getNacionalidad() { return nacionalidad; }
        public void setNacionalidad(string nacionalidad) { this.nacionalidad = nacionalidad; }

        public DateTime getFechaNacimiento() { return fechaNacimiento; }
        public void setFechaNacimiento(DateTime fechaNacimiento) { this.fechaNacimiento = fechaNacimiento; }

        public string getDireccion() { return direccion; }
        public void setDireccion(string direccion) { this.direccion = direccion; }

        public string getIdLocalidad() { return idLocalidad; }
        public void setIdLocalidad(string idLocalidad) { this.idLocalidad = idLocalidad; }

        public string getIdProvincia() { return idProvincia; }
        public void setIdProvincia(string idProvincia) { this.idProvincia = idProvincia; }

        public string getEmail() { return email; }
        public void setEmail(string email) { this.email = email; }

        public string getTelefono() { return telefono; }
        public void setTelefono(string telefono) { this.telefono = telefono; }

        public bool getActivo() { return activo; }
        public void setActivo(bool activo) { this.activo = activo; }
    }
}
