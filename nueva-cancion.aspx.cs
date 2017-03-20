using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using motor;

public partial class nueva_cancion : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        PaginaMaestra.Establecer(Request, this);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        CookieUsuario.DenegarAccesoSinSesion(Request, Response);
    }
}