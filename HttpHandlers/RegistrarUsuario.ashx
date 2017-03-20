<%@ WebHandler Language="C#" Class="RegistrarUsuario" %>

using System;
using System.Web;
using Newtonsoft.Json;
using dominio;
using datos;

public class RegistrarUsuario : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        try
        {
            DAOUsuario daoUsuario = new DAOUsuario();

            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNombre(context.Request.Params["inputUsuario"]);
            nuevoUsuario.setPass(context.Request.Params["inputPass"]);
            nuevoUsuario.setFechaNac(Convert.ToDateTime(context.Request.Params["inputFechaNacimiento"]));

            daoUsuario.Agregar(nuevoUsuario);
            
            string json = JsonConvert.SerializeObject("OK");

            context.Response.ContentType = "application/json";
            context.Response.Write(json);
        }
        catch (FormatException)
        {
            context.Response.Write("FechaNacimientoInvalida");
        }
        catch (UsuarioYaExiste)
        {
            context.Response.Write("UsuarioYaExiste");
        }

        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}