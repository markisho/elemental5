using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.ManagedDataAccess.Client;

public class Conexion
{
    private string strBD = "Data Source=localhost;User ID=APPE5;Password=elemental5;";
    private OracleConnection conn;

    public Conexion()
    {
        conn = new OracleConnection(strBD);
    }

    public void Abrir()
    {
        conn.Open();
    }

    public void Cerrar()
    {
        conn.Close();
    }

    public OracleConnection getConexion()
    {
        return conn;
    }

    public string getEstado()
    {
        return conn.State.ToString();
    }
}