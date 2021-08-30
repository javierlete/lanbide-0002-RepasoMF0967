using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepasoMF0967.Models
{
    public class Mueble
    {
        public long? Id { get; set; }
        public string Nombre { get; set; }
        public decimal? Precio { get; set; }
        public double? Largo { get; set; }
        public double? Ancho { get; set; }
        public double? Alto { get; set; }
        public DateTime? FechaFabricacion { get; set; }

        public Mueble(long? id, string nombre, decimal? precio, double? largo, double? ancho, double? alto, DateTime? fechaFabricacion)
        {
            Id = id;
            Nombre = nombre;
            Precio = precio;
            Largo = largo;
            Ancho = ancho;
            Alto = alto;
            FechaFabricacion = fechaFabricacion;
        }

        public Mueble()
        {
        }

        public override string ToString()
        {
            return $"{Id}, {Nombre}: {Precio}€, {FechaFabricacion}, {Largo}x{Ancho}x{Alto}";
        }
    }
}