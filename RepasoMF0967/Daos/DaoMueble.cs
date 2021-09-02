using RepasoMF0967.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace RepasoMF0967.Daos
{
    public class DaoMueble
    {
        #region Singleton
        private static readonly DaoMueble dao = new DaoMueble();

        private DaoMueble() { }

        public static DaoMueble GetDaoMueble()
        {
            return dao;
        }
        #endregion

        private readonly SortedDictionary<long, Mueble> muebles = new SortedDictionary<long, Mueble>(){
            {1L, new Mueble(1L, "Armario", 123.4m, 1, 2, 3, DateTime.Now) },
            {2L, new Mueble(2L, "Mesa", 12.4m, 2, 3, 4, DateTime.Now) }
        };
        public IEnumerable<Mueble> ObtenerTodos()
        {
            return muebles.Values;
        }

        public DataTable ObtenerTodosDataTable()
        {
            DataTable dt = new DataTable("Muebles");

            dt.Columns.Add("Id", typeof(long));
            dt.Columns.Add("Nombre", typeof(string));
            dt.Columns.Add("Precio", typeof(decimal));
            dt.Columns.Add("Largo", typeof(double));
            dt.Columns.Add("Ancho", typeof(double));
            dt.Columns.Add("Alto", typeof(double));
            dt.Columns.Add("FechaFabricacion", typeof(DateTime));

            foreach(Mueble mueble in muebles.Values)
            {
                dt.Rows.Add(mueble.Id, mueble.Nombre, mueble.Precio, mueble.Largo, mueble.Ancho, mueble.Alto, mueble.FechaFabricacion);
            }

            return dt;
        }

        public Mueble ObtenerPorId(long id)
        {
            if (muebles.ContainsKey(id))
            {
                return muebles[id];
            } else
            {
                return null;
            }
        }

        public void Insertar(Mueble mueble)
        {
            long id = muebles.Count > 0 ? muebles.Keys.Last() + 1L : 1L;
            mueble.Id = id;
            muebles.Add(id, mueble);
        }

        public void Modificar(Mueble mueble)
        {
            muebles[mueble.Id.Value] = mueble;
        }

        public void Borrar(long id)
        {
            muebles.Remove(id);
        }

        public void Borrar(Mueble mueble)
        {
            Borrar(mueble.Id.Value);
        }
    }
}