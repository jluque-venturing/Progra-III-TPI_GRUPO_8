using System;

namespace Entidades
{
    public class Turno
    {
        private int idTurno;
        private string legajo;
        private string dniPaciente;
        private DateTime fecha;
        private int hora;
        private string asistencia;
        private string observacion;

        public Turno()
        {
        }

        public int getIdTurno()
        {
            return idTurno;
        }

        public void setIdTurno(int idTurno)
        {
            this.idTurno = idTurno;
        }

        public string getLegajo()
        {
            return legajo;
        }

        public void setLegajo(string legajo)
        {
            this.legajo = legajo;
        }

        public string getDNIPaciente()
        {
            return dniPaciente;
        }

        public void setDNIPaciente(string dniPaciente)
        {
            this.dniPaciente = dniPaciente;
        }

        public DateTime getFecha()
        {
            return fecha;
        }

        public void setFecha(DateTime fecha)
        {
            this.fecha = fecha;
        }

        public int getHora()
        {
            return hora;
        }

        public void setHora(int hora)
        {
            this.hora = hora;
        }

        public string getAsistencia()
        {
            return asistencia;
        }

        public void setAsistencia(string asistencia)
        {
            this.asistencia = asistencia;
        }

        public string getObservacion()
        {
            return observacion;
        }

        public void setObservacion(string observacion)
        {
            this.observacion = observacion;
        }
    }
}