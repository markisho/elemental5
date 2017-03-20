using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Publicacion
    {
        //ATRIBUTOS
        private string id;
        private string usuario;
        private string artistaCancion;
        private string tituloCancion;
        private string letraCancion;
        private string interpretacion;
        private string idVidYoutube;
        private DateTime fecha;

        //GETTERS & SETTERS
        public string getId()
        {
            return this.id;
        }

        public string getUsuario()
        {
            return this.usuario;
        }

        public string getArtistaCancion(){
            return this.artistaCancion;
        }

        public string getTituloCancion()
        {
            return this.tituloCancion;
        }

        public string getLetraCancion()
        {
            return this.letraCancion;
        }

        public string getInterpretacion()
        {
            return this.interpretacion;
        }

        public string getIdVidYoutube()
        {
            return this.idVidYoutube;
        }

        public DateTime getFecha()
        {
            return this.fecha;
        }

        public void setId(string id)
        {
            this.id = id;
        }

        public void setUsuario(string usuario)
        {
            this.usuario = usuario;
        }

        public void setArtistaCancion(string artistaCancion)
        {
            this.artistaCancion = artistaCancion;
        }

        public void setTituloCancion(string tituloCancion)
        {
            this.tituloCancion = tituloCancion;
        }

        public void setLetraCancion(string letraCancion)
        {
            this.letraCancion = letraCancion;
        }

        public void setInterpretacion(string interpretacion)
        {
            this.interpretacion = interpretacion;
        }

        public void setIdVidYoutube(string idVidYoutube)
        {
            this.idVidYoutube = idVidYoutube;
        }

        public void setFecha(DateTime fecha)
        {
            this.fecha = fecha;
        }
    }
}