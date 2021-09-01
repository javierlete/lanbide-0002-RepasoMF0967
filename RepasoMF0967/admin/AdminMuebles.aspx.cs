using System;
using System.Collections.Generic;
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
            GridViewMuebles.HeaderRow.TableSection = TableRowSection.TableHeader;
            FormViewMueble.DefaultMode = FormViewMode.Edit;
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
    }
}