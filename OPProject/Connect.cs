using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class clsDatabase : System.Web.UI.Page
{
    private SqlConnection objConn;
    private SqlCommand objCmd;
    private SqlTransaction Trans;
    private String strConnString;

    public clsDatabase()
    {
       // strConnString = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];
        strConnString = ConfigurationManager.ConnectionStrings["OPGarment"].ConnectionString;
    }

    public SqlDataReader QueryDataReader(String strSQL)
    {
        SqlDataReader dtReader;
        objConn = new SqlConnection();
        objConn.ConnectionString = strConnString;
        objConn.Open();

        objCmd = new SqlCommand(strSQL, objConn);
        dtReader = objCmd.ExecuteReader();
        return dtReader; //*** Return DataReader ***//
    }

    public DataSet QueryDataSet(String strSQL)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter dtAdapter = new SqlDataAdapter();
        objConn = new SqlConnection();
        objConn.ConnectionString = strConnString;
        objConn.Open();

        objCmd = new SqlCommand();
        objCmd.Connection = objConn;
        objCmd.CommandText = strSQL;
        objCmd.CommandType = CommandType.Text;

        dtAdapter.SelectCommand = objCmd;
        dtAdapter.Fill(ds);
        return ds;   //*** Return DataSet ***//
    }

    public DataTable QueryDataTable(String strSQL)
    {
        SqlDataAdapter dtAdapter;
        DataTable dt = new DataTable();
        objConn = new SqlConnection();
        objConn.ConnectionString = strConnString;
        objConn.Open();

        dtAdapter = new SqlDataAdapter(strSQL, objConn);
        dtAdapter.Fill(dt);
        return dt; //*** Return DataTable ***//
    }

    public Boolean QueryExecuteNonQuery(String strSQL)
    {
        objConn = new SqlConnection();
        objConn.ConnectionString = strConnString;
        objConn.Open();

        try
        {
            objCmd = new SqlCommand();
            objCmd.Connection = objConn;
            objCmd.CommandType = CommandType.Text;
            objCmd.CommandText = strSQL;

            objCmd.ExecuteNonQuery();
            return true; //*** Return True ***//
        }
        catch (Exception)
        {
            return false; //*** Return False ***//
        }
    }


    public DataTable QueryExecuteScalar(String strSQL)
    {
        SqlDataReader dr;
        DataTable dt;

        objConn = new SqlConnection();
        objConn.ConnectionString = strConnString;
        objConn.Open();

        try
        {
            objCmd = new SqlCommand();
            objCmd.Connection = objConn;
            objCmd.CommandType = CommandType.Text;
            objCmd.CommandText = strSQL;
            dr = objCmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(dr);
            return dt;
        }
        catch (Exception)
        {
            return null; //*** Return Nothing ***//
        }
    }

    public void TransStart()
    {
        objConn = new SqlConnection();
        objConn.ConnectionString = strConnString;
        objConn.Open();
        Trans = objConn.BeginTransaction(IsolationLevel.ReadCommitted);
    }


    public void TransExecute(String strSQL)
    {
        objCmd = new SqlCommand();
        objCmd.Connection = objConn;
        objCmd.Transaction = Trans;
        objCmd.CommandType = CommandType.Text;
        objCmd.CommandText = strSQL;
        objCmd.ExecuteNonQuery();
    }


    public void TransRollBack()
    {
        Trans.Rollback();
    }

    public void TransCommit()
    {
        Trans.Commit();
    }

    public void Close()
    {
        objConn.Close();
        objConn = null;
    }
}