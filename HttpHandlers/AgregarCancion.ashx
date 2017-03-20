<%@ WebHandler Language="C#" Class="AgregarCancion" %>

using System;
using System.Web;
using dominio;
using datos;
using motor;

public class AgregarCancion : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        DAOPublicacion daoCancion = new DAOPublicacion();
        Publicacion nuevaCancion = new Publicacion();

        nuevaCancion.setUsuario(CookieUsuario.ConseguirValue(context.Request));
        nuevaCancion.setArtistaCancion(context.Request.Params["inputArtista"]);
        nuevaCancion.setTituloCancion(context.Request.Params["inputTitulo"]);
        nuevaCancion.setLetraCancion(context.Request.Params["inputLetra"]);
        nuevaCancion.setInterpretacion(context.Request.Params["inputInterpretacion"]);
        if (context.Request.Params["inputVideoYoutube"] == "true")
            nuevaCancion.setIdVidYoutube(context.Request.Params["IdVideo"]);

        daoCancion.Agregar(nuevaCancion);

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}