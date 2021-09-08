using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RepasoMF0967
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        public string MensajeAlerta { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            IIdentity identidad = HttpContext.Current.User.Identity;

            HyperLinkLogin.Visible = !identidad.IsAuthenticated;
            LinkButtonLogout.Visible = identidad.IsAuthenticated;

            SpanUsuario.InnerText = identidad.Name;
        }

        protected void LinkButtonLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}