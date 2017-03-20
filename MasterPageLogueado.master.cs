using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using motor;

public partial class MasterPageLogueado : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Response.Cache.SetNoStore();
        this.Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);

        lblNombreUsuario.Text = CookieUsuario.ConseguirValue(Request);
    }

    protected void btnPerfil_Click(object sender, EventArgs e)
    {
        Response.Redirect("perfil.aspx?usr=" + CookieUsuario.ConseguirValue(Request));
    }

    protected void btnCerrarSesion_Click(object sender, EventArgs e)
    {
        CookieUsuario.MatarSesion(Response);
    }

    
    protected void btnAgregarCancion_Click(object sender, EventArgs e)
    {
        Response.Redirect("nueva-cancion.aspx");
    }
}
