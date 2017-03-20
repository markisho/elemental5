using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace motor
{
    public static class PaginaMaestra
    {
        public static void Establecer(HttpRequest Request, Page Pagina)
        {
            HttpCookie cookie = Request.Cookies["SesionUsuario"];

            if (cookie == null) // si no existe la cookie
            {
                Pagina.Page.MasterPageFile = "~/MasterPage.master";
                return;
            }

            Pagina.Page.MasterPageFile = "~/MasterPageLogueado.master";
        }
    }
}