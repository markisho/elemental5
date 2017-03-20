using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Comentario
    {
        //ATRIBUTOS
        private string id;
        private string usuario;
        private string idPost;
        private string texto;
        DateTime fecha;

        //GETTERS & SETTERS
        public string getId()
        {
            return this.id;
        }

        public string getUsuario()
        {
            return this.usuario;
        }

        public string getIdPost()
        {
            return this.idPost;
        }

        public string getTexto()
        {
            return this.texto;
        }

        public DateTime getFecha()
        {
            return this.fecha;
        }


        public void setUsuario(string usuario)
        {
            this.usuario = usuario;
        }

        public void setIdPost(string idPost)
        {
            this.idPost = idPost;
        }

        public void setTexto(string texto)
        {
            this.texto = texto;
        }

        public void setFecha(DateTime fecha)
        {
            this.fecha = fecha;
        }

    }
}