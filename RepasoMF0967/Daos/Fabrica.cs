using RepasoMF0967.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepasoMF0967.Daos
{
    public class Fabrica
    {
        private readonly string tipo;
        public Fabrica(string tipo)
        {
            this.tipo = tipo;
        }
        public IDaoMueble GetDaoMueble()
        {
            switch(tipo)
            {
                case "memoria": return DaoMueble.GetDaoMueble();
                case "sqlserver": return DaoMuebleSqlServer.GetDaoMueble();
                default: throw new Exception("No existe ese tipo de DAO");
            }
        }
    }
}