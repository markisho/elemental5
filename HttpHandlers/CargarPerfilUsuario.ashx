<%@ WebHandler Language="C#" Class="CargarPerfilUsuario" %>

using System;
using System.Web;

public class CargarPerfilUsuario : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}