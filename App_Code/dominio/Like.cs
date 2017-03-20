using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Like
    {
        //ATRIBUTOS
        private string id;
        private string idPost;
        private string usuario;
        private bool tipo;

        //GETTERS & SETTERS
        public string getId()
        {
            return this.id;
        }

        public string getIdPost()
        {
            return this.idPost;
        }

        public string getUsuario()
        {
            return this.usuario;
        }

        public void setId(string id) {
            this.id = id;
        }

        public void setIdPost(string idPost)
        {
            this.idPost = idPost;
        }

        public void setUsuario(string usuario)
        {
            this.usuario = usuario;
        }
    }
}