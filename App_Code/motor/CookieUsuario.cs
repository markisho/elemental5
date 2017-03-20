using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace motor
{
    public static class CookieUsuario
    {
        private static HttpCookie cookie = null;


        public static void DenegarAccesoSinSesion(HttpRequest Request, HttpResponse Response)
        {
            cookie = Request.Cookies["SesionUsuario"];

            if (cookie == null)
            {
                Response.Redirect("inicio.aspx");
                return;
            }
            
        }

        public static void DenegarAccesoConSesion(HttpRequest Request, HttpResponse Response)
        {
            cookie = Request.Cookies["SesionUsuario"];

            if (cookie != null)
            {
                Response.Redirect("inicio.aspx");
                return;
            }

        }

        public static string ConseguirValue(HttpRequest Request){

            cookie = Request.Cookies["SesionUsuario"];
            return cookie.Value;
            
        }

        public static void MatarSesion(HttpResponse Response){

            cookie = Response.Cookies["SesionUsuario"];
            cookie.Expires = DateTime.Now.AddDays(-1d);

            Response.Redirect("inicio.aspx"); //redirije a menu de administracion
        }

        public static bool PermitirComentarios(HttpRequest Request)
        {
            cookie = Request.Cookies["SesionUsuario"];

            if (cookie != null)
            {
                return true;
            }

            return false;
        }

    }
}