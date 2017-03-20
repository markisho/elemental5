using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using motor;

public partial class registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CookieUsuario.DenegarAccesoConSesion(Request, Response);
    }
}