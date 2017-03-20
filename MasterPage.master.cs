using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using datos;

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Response.Cache.SetNoStore();
        this.Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
    }
}
