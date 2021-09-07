using RepasoMF0967.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepasoMF0967.Daos
{
    public class Configuracion
    {
        public const string TIPO = "sqlserver";
        public static readonly IDaoMueble dao = new Fabrica(TIPO).GetDaoMueble(); 
    }
}