using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Usuario
    {
        //ATRIBUTOS
        [JsonProperty]
        private string nombre;
        [JsonProperty]
        private string pass;
        [JsonProperty]
        private DateTime fechaNac;
        [JsonProperty]
        private DateTime fechaRegistro;
        [JsonProperty]
        private int likes;
        [JsonProperty]
        private int posts;
        [JsonProperty]
        private int experiencia;

        //GETTERS & SETTERS
        public string getNombre()
        {
            return this.nombre;
        }

        public string getPass()
        {
            return this.pass;
        }

        public DateTime getFechaNac()
        {
            return this.fechaNac;
        }

        public int getLikes()
        {
            return this.likes;
        }

        public void setNombre(string nombre)
        {
            this.nombre = nombre;
        }

        public void setPass(string pass)
        {
            this.pass = pass;
        }

        public void setFechaNac(DateTime fechaNac)
        {
            this.fechaNac = fechaNac;
        }

        public void setFechaRegistro(DateTime fechaRegistro)
        {
            this.fechaRegistro = fechaRegistro;
        }

        public void setLikes(int likes)
        {
            this.likes = likes;
        }

        public void setPosts(int posts)
        {
            this.posts = posts;
        }

        public void setExperiencia(int experiencia)
        {
            this.experiencia = experiencia;
        }

    }
}