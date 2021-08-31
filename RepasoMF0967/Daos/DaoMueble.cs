using RepasoMF0967.Models;
using System;
using System.Collections.Generic;
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

        private readonly Dictionary<long, Mueble> muebles = new Dictionary<long, Mueble>(){
            {1L, new Mueble(1L, "Armario", 123.4m, 1, 2, 3, DateTime.Now) },
            {2L, new Mueble(2L, "Mesa", 12.4m, 2, 3, 4, DateTime.Now) }
        };
        public IEnumerable<Mueble> ObtenerTodos()
        {
            return muebles.Values;
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