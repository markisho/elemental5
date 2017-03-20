using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using System.Collections;
using dominio;

namespace datos
{
    public class DAOComentario
    {
        public void Agregar(Comentario nuevoComentario)
        {
            Conexion conexion = new Conexion();
            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.insertComment", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.BindByName = true;
            comando.Parameters.Add("WebUsername", OracleDbType.Varchar2, nuevoComentario.getUsuario(), ParameterDirection.Input);
            comando.Parameters.Add("WebIdPost", OracleDbType.Varchar2, nuevoComentario.getIdPost(), ParameterDirection.Input);
            comando.Parameters.Add("WebText", OracleDbType.Varchar2, nuevoComentario.getTexto(), ParameterDirection.Input);

            comando.ExecuteNonQuery();

            conexion.Cerrar();
        }

        public ArrayList LeerXPublicacion(string idPost)
        {
            ArrayList comentarios = new ArrayList();
            Conexion conexion = new Conexion();

            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.readComments", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add("WebIDPost", OracleDbType.Varchar2, idPost, ParameterDirection.Input);
            comando.Parameters.Add("WebComments", OracleDbType.RefCursor, ParameterDirection.Output);

            OracleDataReader dr = comando.ExecuteReader();

            while (dr.Read())
            {
                Comentario comentario = new Comentario();

                comentario.setUsuario(dr["USERNAME"].ToString());
                comentario.setTexto(dr["TEXT"].ToString());
                comentario.setFecha(Convert.ToDateTime(dr["CREATIONDATE"]));

                comentarios.Add(comentario);
            }

            conexion.Cerrar();

            return comentarios;
        }

    }
}