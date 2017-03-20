<%@ WebHandler Language="C#" Class="DenegarLike" %>

using System;
using System.Web;
using Newtonsoft.Json;
using motor;
using datos;
using dominio;

public class DenegarLike : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        
        DAOLike daoLike = new DAOLike();
        string json;

        if (daoLike.ExisteLike(context.Request.Params["idpost"], CookieUsuario.ConseguirValue(context.Request)))
            json = JsonConvert.SerializeObject("existe");
        else
            json = JsonConvert.SerializeObject("noExiste");
        
        
        context.Response.ContentType = "application/json";
        context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}