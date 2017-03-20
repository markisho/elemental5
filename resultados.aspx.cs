using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using motor;
using dominio;
using datos;
using System.Web.UI.HtmlControls;

public partial class resultados_busqueda : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        PaginaMaestra.Establecer(Request, this);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DAOPublicacion daoPublicacion = new DAOPublicacion();
        ArrayList publicaciones = daoPublicacion.Buscar(Request.Params["buscar"]);

        infoRes.InnerText += "'" + Request.Params["buscar"] + "'";

        foreach (Publicacion publicacion in publicaciones)
        {

            TimeSpan hace = DateTime.Now - publicacion.getFecha();

            HtmlGenericControl ul = new HtmlGenericControl("ul");
            HtmlGenericControl a = new HtmlGenericControl("a");
            HtmlGenericControl li = new HtmlGenericControl("li");
            HtmlGenericControl img = new HtmlGenericControl("img");
            HtmlGenericControl div = new HtmlGenericControl("div");
            HtmlGenericControl h3 = new HtmlGenericControl("h3");

            h3.Attributes.Add("class", "media-heading text-capitalize");
            h3.InnerText = publicacion.getArtistaCancion() + " - " + publicacion.getTituloCancion();
            div.Attributes.Add("class", "media-body");
            div.InnerText = "Hace " + Convert.ToInt32(hace.TotalMinutes) + " minutos, por @" + publicacion.getUsuario();
            img.Attributes.Add("class", "media-object pull-left");
            img.Attributes.Add("src", "Imgs/inicio/cancion-null.png");
            img.Attributes.Add("width", "100px");
            li.Attributes.Add("class", "media post-reciente");
            a.Attributes.Add("href", "publicacion.aspx?id=" + publicacion.getId());
            ul.Attributes.Add("class", "media-list");

            div.Controls.Add(h3);
            li.Controls.Add(img);
            li.Controls.Add(div);
            a.Controls.Add(li);
            ul.Controls.Add(a);

            resultadosBusqueda.Controls.Add(ul);
        }
    }
}