using RepasoMF0967.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepasoMF0967.Daos
{
    public interface IDaoMueble : IDao<Mueble>
    {
        IEnumerable<Mueble> ObtenerTodos();
        Mueble ObtenerPorId(long id);
        void Insertar(Mueble objeto);
        void Modificar(Mueble objeto);
        void Borrar(Mueble objeto);
        void Borrar(long id);
    }
}