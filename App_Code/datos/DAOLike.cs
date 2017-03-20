using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using dominio;

namespace datos
{
    public class DAOLike
    {
        public void Agregar(Like nuevoLike)
        {
            Conexion conexion = new Conexion();
            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.insertLike", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.BindByName = true;
            comando.Parameters.Add("WebIdPost", OracleDbType.Varchar2, nuevoLike.getIdPost(), ParameterDirection.Input);
            comando.Parameters.Add("WebUserName", OracleDbType.Varchar2, nuevoLike.getUsuario(), ParameterDirection.Input);

            comando.ExecuteNonQuery();

            conexion.Cerrar();
        }

        public bool ExisteLike(string idPost, string usuario)
        {
            Conexion conexion = new Conexion();
            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.LikeExiste", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.BindByName = true;
            comando.Parameters.Add("WebIdPost", OracleDbType.Varchar2, idPost, ParameterDirection.Input);
            comando.Parameters.Add("WebUserName", OracleDbType.Varchar2, usuario, ParameterDirection.Input);

            comando.Parameters.Add("resultado", OracleDbType.Int32, ParameterDirection.Output);

            OracleDataReader reader = comando.ExecuteReader();

            if (Convert.ToInt32(comando.Parameters["resultado"].Value.ToString()) == 1)
            {
                conexion.Cerrar();
                return true; //ya likeo
            }

            conexion.Cerrar();
            return false; //todavia no likeo
         }

    }
}