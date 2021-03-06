using RepasoMF0967.Daos;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RepasoMF0967.admin
{
    public partial class AdminMuebles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormViewMueble.DefaultMode = FormViewMode.Edit;
            }
        }

        protected void ListadoDataSource_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = Configuracion.dao;
        }

        protected void RefrescarGrid(object sender, FormViewUpdatedEventArgs e)
        {
            GridViewMuebles.DataBind();
            FormViewMueble.Visible = false;
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            FormViewMueble.ChangeMode(FormViewMode.Insert);
            FormViewMueble.Visible = true;
        }

        protected void FormViewMueble_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridViewMuebles.DataBind();
            FormViewMueble.Visible = false;
        }

        protected void FormViewMueble_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            VacioANulo(e.Values);
        }

        private static void VacioANulo(IOrderedDictionary values)
        {
            if ((string)values["Largo"] == "")
            {
                values["Largo"] = null;
            }

            if ((string)values["Ancho"] == "")
            {
                values["Ancho"] = null;
            }

            if ((string)values["Alto"] == "")
            {
                values["Alto"] = null;
            }

            if ((string)values["FechaFabricacion"] == "")
            {
                values["FechaFabricacion"] = null;
            }
        }

        protected void GridViewMuebles_DataBound(object sender, EventArgs e)
        {
            if (GridViewMuebles.Rows.Count != 0)
            {
                GridViewMuebles.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void FormViewMueble_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            VacioANulo(e.NewValues);
        }

        protected void EditarButton_Click(object sender, EventArgs e)
        {
            FormViewMueble.ChangeMode(FormViewMode.Edit);
        }

        protected void GridViewMuebles_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormViewMueble.Visible = true;
        }
    }
}