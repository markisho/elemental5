<%@ WebHandler Language="C#" Class="ComentarPublicacion" %>

using System;
using System.Web;
using dominio;
using datos;
using motor;

public class ComentarPublicacion : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        
        DAOComentario daoComentario = new DAOComentario();
        Comentario nuevoComentario = new Comentario();

        nuevoComentario.setUsuario(CookieUsuario.ConseguirValue(context.Request));
        nuevoComentario.setIdPost(context.Request.Params["idpost"]);
        nuevoComentario.setTexto(context.Request.Params["inputComentario"]);
        
        daoComentario.Agregar(nuevoComentario);

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}