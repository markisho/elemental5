<%@ WebHandler Language="C#" Class="LikearPublicacion" %>

using System;
using System.Web;
using motor;
using datos;
using dominio;

public class LikearPublicacion : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        DAOLike daoLike = new DAOLike();
        Like nuevoLike = new Like();

        nuevoLike.setIdPost(context.Request.Params["idpost"]);
        nuevoLike.setUsuario(CookieUsuario.ConseguirValue(context.Request));
        
        daoLike.Agregar(nuevoLike);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}