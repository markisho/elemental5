using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Collections;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using dominio;

namespace datos
{
    public class DAOPublicacion
    {
        public void Agregar(Publicacion nuevaCancion)
        {
            Conexion conexion = new Conexion();
            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.insertPost", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.BindByName = true;
            comando.Parameters.Add("WebUsername", OracleDbType.Varchar2, nuevaCancion.getUsuario(), ParameterDirection.Input);
            comando.Parameters.Add("WebArtist", OracleDbType.Varchar2, nuevaCancion.getArtistaCancion(), ParameterDirection.Input);
            comando.Parameters.Add("WebTitle", OracleDbType.Varchar2, nuevaCancion.getTituloCancion(), ParameterDirection.Input);
            comando.Parameters.Add("WebLyrics", OracleDbType.Varchar2, nuevaCancion.getLetraCancion(), ParameterDirection.Input);
            comando.Parameters.Add("WebInterpretation", OracleDbType.Varchar2, nuevaCancion.getInterpretacion(), ParameterDirection.Input);

            if (nuevaCancion.getIdVidYoutube() == null)
                nuevaCancion.setIdVidYoutube("");

            comando.Parameters.Add("WebIdYoutubeVideo", OracleDbType.Varchar2, nuevaCancion.getIdVidYoutube(), ParameterDirection.Input);

            comando.ExecuteNonQuery();

            conexion.Cerrar();
        }


        public Publicacion Leer(string id)
        {
            Publicacion publicacion = null;
            Conexion conexion = new Conexion();
            

            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.readPost", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add("WebIdPost", OracleDbType.Varchar2, id, ParameterDirection.Input);
            comando.Parameters.Add("WebPosts", OracleDbType.RefCursor, ParameterDirection.Output);

            OracleDataReader dr = comando.ExecuteReader();

            while (dr.Read())
            {
                publicacion = new Publicacion();

                publicacion.setUsuario(dr["USERNAME"].ToString());
                publicacion.setArtistaCancion(dr["ARTIST"].ToString());
                publicacion.setTituloCancion(dr["TITLE"].ToString());
                publicacion.setLetraCancion(dr["LYRICS"].ToString());
                publicacion.setInterpretacion(dr["INTERPRETATION"].ToString());
                
                if (dr["IDYOUTUBEVIDEO"].ToString() != "")
                    publicacion.setIdVidYoutube(dr["IDYOUTUBEVIDEO"].ToString());

                publicacion.setFecha(Convert.ToDateTime(dr["CREATIONDATE"]));
            }


            conexion.Cerrar();

            return publicacion;
        }


        public ArrayList LeerRecientes(){

            ArrayList publicaciones = new ArrayList();
            Conexion conexion = new Conexion();

            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.readRecentPosts", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add("WebPosts", OracleDbType.RefCursor, ParameterDirection.Output);

            OracleDataReader dr = comando.ExecuteReader();

            while (dr.Read())
            {
                Publicacion publicacion = new Publicacion();

                publicacion.setId(dr["IDPOST"].ToString());
                publicacion.setArtistaCancion(dr["ARTIST"].ToString());
                publicacion.setUsuario(dr["USERNAME"].ToString());
                publicacion.setTituloCancion(dr["TITLE"].ToString());
                publicacion.setFecha(Convert.ToDateTime(dr["CREATIONDATE"]));

                publicaciones.Add(publicacion);
            }

            conexion.Cerrar();

            return publicaciones;
        }


        public ArrayList Buscar(string consulta)
        {

            System.Diagnostics.Debug.Write(consulta);

            ArrayList publicaciones = new ArrayList();
            Conexion conexion = new Conexion();

            conexion.Abrir();

            OracleCommand comando = new OracleCommand("DBAE5.principalPackage.searchPosts", conexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.Add("WebConsulta", OracleDbType.Varchar2, consulta.Replace(" ", "|"), ParameterDirection.Input);
            comando.Parameters.Add("WebPosts", OracleDbType.RefCursor, ParameterDirection.Output);

            OracleDataReader dr = comando.ExecuteReader();

            while (dr.Read())
            {
                Publicacion publicacion = new Publicacion();

                publicacion.setId(dr["IDPOST"].ToString());
                publicacion.setArtistaCancion(dr["ARTIST"].ToString());
                publicacion.setUsuario(dr["USERNAME"].ToString());
                publicacion.setTituloCancion(dr["TITLE"].ToString());
                publicacion.setFecha(Convert.ToDateTime(dr["CREATIONDATE"]));

                publicaciones.Add(publicacion);
            }

            conexion.Cerrar();

            return publicaciones;
        }


    }
}