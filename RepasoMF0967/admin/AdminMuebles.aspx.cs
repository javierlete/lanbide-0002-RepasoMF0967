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
            e.ObjectInstance = Daos.DaoMueble.GetDaoMueble();
        }

        protected void RefrescarGrid(object sender, FormViewUpdatedEventArgs e)
        {
            GridViewMuebles.DataBind();
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            FormViewMueble.ChangeMode(FormViewMode.Insert);
        }

        protected void FormViewMueble_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridViewMuebles.DataBind();
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
            GridViewMuebles.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void FormViewMueble_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            VacioANulo(e.NewValues);
        }

        protected void EditarButton_Click(object sender, EventArgs e)
        {
            FormViewMueble.ChangeMode(FormViewMode.Edit);
        }
    }
}