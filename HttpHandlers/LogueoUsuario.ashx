<%@ WebHandler Language="C#" Class="LogueoUsuario" %>

using System;
using System.Web;
using datos;

public class LogueoUsuario : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        DAOUsuario daoUsuario = new DAOUsuario();

        string nombre = context.Request.Params["inputUsuarioLogin"];
        string pass = context.Request.Params["inputPassLogin"];

        if (daoUsuario.Existe(nombre, pass))
        {
            HttpCookie cookie = context.Response.Cookies["SesionUsuario"];
            cookie.Value = nombre; //pongo el nombre del usuario en el value de la cookie
            cookie.Expires = DateTime.Now.AddMinutes(30);

            context.Response.Redirect("../inicio.aspx");

        }

        else
        {
            context.Response.Redirect("../inicio.aspx");
        }
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}