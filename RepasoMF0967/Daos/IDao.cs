using RepasoMF0967.Models;
using System.Collections.Generic;

namespace RepasoMF0967.Daos
{
    public interface IDao<T>
    {
        IEnumerable<T> ObtenerTodos();
        T ObtenerPorId(long id);
        void Insertar(T objeto);
        void Modificar(T objeto);
        void Borrar(T objeto);
        void Borrar(long id);
    }
}