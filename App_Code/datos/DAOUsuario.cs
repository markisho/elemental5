using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;
using dominio;
using System.Collections;

namespace datos
{
    public class DAOUsuario
    {
        public void Agregar(Usuario nuevoUsuario)
        {
            Conexion conexion = new Conexion();
            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.insertUserElemental", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.BindByName = true;
            comando.Parameters.Add("WebUsername", OracleDbType.Varchar2, nuevoUsuario.getNombre(), ParameterDirection.Input);
            comando.Parameters.Add("WebUserPassword", OracleDbType.Varchar2, nuevoUsuario.getPass(), ParameterDirection.Input);
            comando.Parameters.Add("WebBirthdate", OracleDbType.Date, nuevoUsuario.getFechaNac(), ParameterDirection.Input);

            try
            {
                comando.ExecuteNonQuery();
            }
            catch (Oracle.ManagedDataAccess.Client.OracleException)
            {
                throw new UsuarioYaExiste();
            }
            finally
            {
                conexion.Cerrar();
            }

        }

        public bool Existe(string nombre, string pass)
        {
            Conexion conexion = new Conexion();
            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.UsuarioExiste", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.BindByName = true;
            comando.Parameters.Add("WebUsername", OracleDbType.Varchar2, nombre, ParameterDirection.Input);
            comando.Parameters.Add("WebUserPassword", OracleDbType.Varchar2, pass, ParameterDirection.Input);
            comando.Parameters.Add("resultado", OracleDbType.Int32, ParameterDirection.Output);

            OracleDataReader reader = comando.ExecuteReader();

            if (Convert.ToInt32(comando.Parameters["resultado"].Value.ToString()) == 1)
            {
                conexion.Cerrar();
                return true;
            }


            conexion.Cerrar();
            return false;
        }

        public Usuario LeerInfo(string nombre)
        {
            Usuario usuario = null;
            Conexion conexion = new Conexion();


            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.readUserInfo", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add("WebUserName", OracleDbType.Varchar2, nombre, ParameterDirection.Input);
            comando.Parameters.Add("WebUserInfo", OracleDbType.RefCursor, ParameterDirection.Output);

            OracleDataReader dr = comando.ExecuteReader();

            while (dr.Read())
            {
                usuario = new Usuario();

                usuario.setLikes(Convert.ToInt32(dr["LIKES"]));
                usuario.setFechaNac(Convert.ToDateTime(dr["BIRTHDATE"]));

            }


            conexion.Cerrar();

            return usuario;
        }

        public ArrayList LeerPublicaciones(string nombre)
        {
            ArrayList publicaciones = new ArrayList();
            Conexion conexion = new Conexion();

            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.readUserPosts", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add("WebUserName", OracleDbType.Varchar2, nombre, ParameterDirection.Input);
            comando.Parameters.Add("WebPosts", OracleDbType.RefCursor, ParameterDirection.Output);

            OracleDataReader dr = comando.ExecuteReader();

            while (dr.Read())
            {
                Publicacion publicacion = new Publicacion();

                publicacion.setId(dr["IDPOST"].ToString());
                publicacion.setArtistaCancion(dr["ARTIST"].ToString());
                publicacion.setTituloCancion(dr["TITLE"].ToString());
                publicacion.setFecha(Convert.ToDateTime(dr["CREATIONDATE"]));

                publicaciones.Add(publicacion);
            }

            conexion.Cerrar();

            return publicaciones;
        }

    }
}