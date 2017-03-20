using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using datos;
using dominio;
using motor;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class publicacion : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        PaginaMaestra.Establecer(Request, this);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //CAJA DE COMENTARIOS SEGUN SI ESTA LOGUEADO
        if(CookieUsuario.PermitirComentarios(Request))
        {
            HtmlGenericControl textarea = new HtmlGenericControl("textarea");
            textarea.Attributes.Add("rows", "3");
            textarea.Attributes.Add("id", "inputComentario");
            textarea.Attributes.Add("class", "form-control col-md-12");
            textarea.Attributes.Add("placeholder", "Hacé tu comentario");

            HtmlGenericControl button = new HtmlGenericControl("button");
            button.Attributes.Add("type", "button");
            button.Attributes.Add("class", "btn btn-success");
            button.Attributes.Add("id", "btnComentar");
            button.InnerText = "Comentar";

            contenedorPublicacion.Controls.Add(textarea);
            contenedorPublicacion.Controls.Add(button);
        }


        //CARGA DE POST
        try
        {
            DAOPublicacion daoPublicacion = new DAOPublicacion();
            Publicacion publicacion = new Publicacion();

            publicacion = daoPublicacion.Leer(Request.QueryString["id"]);

            cancion.InnerText += publicacion.getArtistaCancion() + " - \"" + publicacion.getTituloCancion() + "\"";
            usuario.InnerText += publicacion.getUsuario();
            fecha.InnerText = publicacion.getFecha().ToString("dd/MM/yyyy HH:mm");
            letra.InnerHtml = publicacion.getLetraCancion();
            video.Attributes.Add("src", "http://www.youtube.com/embed/" + publicacion.getIdVidYoutube());
            interpretacion.InnerHtml = publicacion.getInterpretacion();

            //CARGA DE COMENTARIOS
            DAOComentario daoComentario = new DAOComentario();
            ArrayList comentarios = daoComentario.LeerXPublicacion(Request.QueryString["id"]);

            if (comentarios.Count == 0)
            {
                controlComentarios.InnerText = "No hay comentarios.";
            }

            foreach(Comentario comentario in comentarios){
                HtmlGenericControl dt = new HtmlGenericControl("dt");
                HtmlGenericControl dd = new HtmlGenericControl("dd");
                HtmlGenericControl br = new HtmlGenericControl("br");


                dt.InnerText = comentario.getFecha().ToString("dd/MM/yyyy HH:mm") + " - @" + comentario.getUsuario();
                dd.InnerText = comentario.getTexto();

                controlComentarios.Controls.Add(dt);
                controlComentarios.Controls.Add(dd);
                controlComentarios.Controls.Add(br);
            }

            
        }
        catch (NullReferenceException)
        {
            Response.Redirect("inicio.aspx");
        }
    }
}