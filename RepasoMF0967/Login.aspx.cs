using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RepasoMF0967
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAceptar_Click(object sender, EventArgs e)
        {
            if (TextBoxNombre.Text == "administrador" && TextBoxPassword.Text == "contra")
            {
                FormsAuthentication.RedirectFromLoginPage("Administrador", false);
            }
        }
    }
}