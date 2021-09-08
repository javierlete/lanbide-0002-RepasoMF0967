using RepasoMF0967.Daos;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RepasoMF0967
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MueblesDataSource_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = Configuracion.dao;
        }

        protected void MueblesDataTableDataSource_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                Principal maestra = (Principal)Page.Master;
                Panel p = (Panel)maestra.FindControl("panelAlerta");
                p.Visible = true;
                maestra.MensajeAlerta = "No se han encontrado los registros";
                
                Debug.Print(e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }
    }
}