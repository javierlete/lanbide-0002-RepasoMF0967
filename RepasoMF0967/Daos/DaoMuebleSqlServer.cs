using RepasoMF0967.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RepasoMF0967.Daos
{
    public class DaoMuebleSqlServer : IDaoMueble
    {
        private const string CADENA_CONEXION = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=mf0966;Integrated Security=True";
        private const string SQL_SELECT = @"SELECT * FROM Muebles";
        private const string SQL_SELECT_ID = @"SELECT * FROM Muebles WHERE Id = @Id";
        private const string SQL_INSERT = @"INSERT INTO Muebles (Nombre, Precio, Largo, Ancho, Alto, FechaFabricacion) VALUES (@Nombre, @Precio, @Largo, @Ancho, @Alto, @FechaFabricacion)";
        private const string SQL_UPDATE = @"UPDATE Muebles SET Nombre=@Nombre,Precio=@Precio,Largo=@Largo,Ancho=@Ancho,Alto=@Alto,FechaFabricacion=@FechaFabricacion WHERE Id = @Id";
        private const string SQL_DELETE = @"DELETE FROM Muebles WHERE Id = @Id";

        #region Singleton
        private static readonly DaoMuebleSqlServer dao = new DaoMuebleSqlServer();

        private DaoMuebleSqlServer() { }

        public static DaoMuebleSqlServer GetDaoMueble()
        {
            return dao;
        }
        #endregion

        public IEnumerable<Mueble> ObtenerTodos()
        {
            using (IDbConnection con = new SqlConnection(CADENA_CONEXION))
            {
                con.Open();

                IDbCommand com = con.CreateCommand();
                com.CommandText = SQL_SELECT;

                List<Mueble> muebles = new List<Mueble>();
                
                using (IDataReader dr = com.ExecuteReader())
                {

                    while (dr.Read())
                    {
                        muebles.Add(new Mueble(dr["Id"] as long?, dr["Nombre"] as string, dr["Precio"] as decimal?, dr["Largo"] as double?, dr["Ancho"] as double?, dr["Alto"] as double?, dr["FechaFabricacion"] as DateTime?));
                    }
                }
                
                return muebles;
            }
        }

        //public DataTable ObtenerTodosDataTable()
        //{
        //    DataTable dt = new DataTable("Muebles");

        //    dt.Columns.Add("Id", typeof(long));
        //    dt.Columns.Add("Nombre", typeof(string));
        //    dt.Columns.Add("Precio", typeof(decimal));
        //    dt.Columns.Add("Largo", typeof(double));
        //    dt.Columns.Add("Ancho", typeof(double));
        //    dt.Columns.Add("Alto", typeof(double));
        //    dt.Columns.Add("FechaFabricacion", typeof(DateTime));

        //    foreach (Mueble mueble in muebles.Values)
        //    {
        //        dt.Rows.Add(mueble.Id, mueble.Nombre, mueble.Precio, mueble.Largo, mueble.Ancho, mueble.Alto, mueble.FechaFabricacion);
        //    }

        //    return dt;
        //}

        public Mueble ObtenerPorId(long id)
        {
            using (IDbConnection con = new SqlConnection(CADENA_CONEXION))
            {
                con.Open();

                IDbCommand com = con.CreateCommand();
                com.CommandText = SQL_SELECT_ID;

                IDbDataParameter parId = com.CreateParameter();
                
                parId.DbType = DbType.Int64;
                parId.ParameterName = "Id";
                parId.Value = id;
                
                com.Parameters.Add(parId);

                Mueble mueble = null;

                using (IDataReader dr = com.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        mueble = new Mueble(dr["Id"] as long?, dr["Nombre"] as string, dr["Precio"] as decimal?, dr["Largo"] as double?, dr["Ancho"] as double?, dr["Alto"] as double?, dr["FechaFabricacion"] as DateTime?);
                    }
                }

                return mueble;
            }
        }

        public void Insertar(Mueble mueble)
        {
            using (IDbConnection con = new SqlConnection(CADENA_CONEXION))
            {
                con.Open();

                IDbCommand com = con.CreateCommand();
                com.CommandText = SQL_INSERT;

                IDbDataParameter parNombre = com.CreateParameter();

                parNombre.DbType = DbType.String;
                parNombre.ParameterName = "Nombre";
                parNombre.Value = mueble.Nombre;

                com.Parameters.Add(parNombre);

                IDbDataParameter parLargo = com.CreateParameter();

                parLargo.DbType = DbType.Double;
                parLargo.ParameterName = "Largo";
                parLargo.Value = Opcional(mueble.Largo);

                com.Parameters.Add(parLargo);

                IDbDataParameter parAncho = com.CreateParameter();

                parAncho.DbType = DbType.Double;
                parAncho.ParameterName = "Ancho";
                parAncho.Value = Opcional(mueble.Ancho);

                com.Parameters.Add(parAncho);

                IDbDataParameter parAlto = com.CreateParameter();

                parAlto.DbType = DbType.Double;
                parAlto.ParameterName = "Alto";
                parAlto.Value = Opcional(mueble.Alto);

                com.Parameters.Add(parAlto);

                IDbDataParameter parFechaFabricacion = com.CreateParameter();

                parFechaFabricacion.DbType = DbType.Date;
                parFechaFabricacion.ParameterName = "FechaFabricacion";
                parFechaFabricacion.Value = Opcional(mueble.FechaFabricacion);

                com.Parameters.Add(parFechaFabricacion);

                IDbDataParameter parPrecio = com.CreateParameter();

                parPrecio.DbType = DbType.Decimal;
                parPrecio.ParameterName = "Precio";
                parPrecio.Value = mueble.Precio;

                com.Parameters.Add(parPrecio);

                com.ExecuteNonQuery();
            }
        }

        public void Modificar(Mueble mueble)
        {
            using (IDbConnection con = new SqlConnection(CADENA_CONEXION))
            {
                con.Open();

                IDbCommand com = con.CreateCommand();
                com.CommandText = SQL_UPDATE;

                IDbDataParameter parId = com.CreateParameter();

                parId.DbType = DbType.Int64;
                parId.ParameterName = "Id";
                parId.Value = mueble.Id;

                com.Parameters.Add(parId);

                IDbDataParameter parNombre = com.CreateParameter();

                parNombre.DbType = DbType.String;
                parNombre.ParameterName = "Nombre";
                parNombre.Value = mueble.Nombre;

                com.Parameters.Add(parNombre);

                IDbDataParameter parLargo = com.CreateParameter();

                parLargo.DbType = DbType.Double;
                parLargo.ParameterName = "Largo";
                parLargo.Value = Opcional(mueble.Largo);

                com.Parameters.Add(parLargo);

                IDbDataParameter parAncho = com.CreateParameter();

                parAncho.DbType = DbType.Double;
                parAncho.ParameterName = "Ancho";
                parAncho.Value = Opcional(mueble.Ancho);

                com.Parameters.Add(parAncho);

                IDbDataParameter parAlto = com.CreateParameter();

                parAlto.DbType = DbType.Double;
                parAlto.ParameterName = "Alto";
                parAlto.Value = Opcional(mueble.Alto);

                com.Parameters.Add(parAlto);

                IDbDataParameter parFechaFabricacion = com.CreateParameter();

                parFechaFabricacion.DbType = DbType.Date;
                parFechaFabricacion.ParameterName = "FechaFabricacion";
                parFechaFabricacion.Value = Opcional(mueble.FechaFabricacion);

                com.Parameters.Add(parFechaFabricacion);

                IDbDataParameter parPrecio = com.CreateParameter();

                parPrecio.DbType = DbType.Decimal;
                parPrecio.ParameterName = "Precio";
                parPrecio.Value = mueble.Precio;

                com.Parameters.Add(parPrecio);

                com.ExecuteNonQuery();
            }
        }

        public void Borrar(long id)
        {
            using (IDbConnection con = new SqlConnection(CADENA_CONEXION))
            {
                con.Open();

                IDbCommand com = con.CreateCommand();
                com.CommandText = SQL_DELETE;

                IDbDataParameter parId = com.CreateParameter();

                parId.DbType = DbType.Int64;
                parId.ParameterName = "Id";
                parId.Value = id;

                com.Parameters.Add(parId);

                com.ExecuteNonQuery();
            }
        }

        public void Borrar(Mueble mueble)
        {
            Borrar(mueble.Id.Value);
        }

        private static object Opcional(object valor)
        {
            return valor ?? DBNull.Value;
        }
    }
}