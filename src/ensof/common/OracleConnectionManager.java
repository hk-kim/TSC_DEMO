package ensof.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class OracleConnectionManager
{
  Config conf = new Config();
  DataLog datalog = new DataLog();
  private Connection conn=null;
  DataSource ds = null;
  
  public Connection getConnection()
  {
	  /*
    try
    {
      Class.forName(this.conf.getString("DBCLASS"));
    }
    catch (ClassNotFoundException e1)
    {
      this.datalog.write_Log(2, "OracleConnectionManager : ", e1.toString());
    }
    String JDBCDriverType = this.conf.getString("DBDRIVER");
    String DBHost = this.conf.getString("DBHOST");
    String DBName = this.conf.getString("DBNAME");
    String url = JDBCDriverType + ":@" + DBHost + ":" + DBName;
    String userID = this.conf.getString("DBID");
    String password = this.conf.getString("DBPW");
    try
    {
      return this.conn = DriverManager.getConnection(url, userID, password);
    }
    catch (SQLException e)
    {
      this.datalog.write_Log(2, "OracleConnectionManager : ", e.toString());
    }
    
    */
	  try
	  {
	      Context init = new InitialContext();
	      ds = (DataSource) init.lookup("java:comp/env/jdbc/ORCL");
	      //ds = (DataSource) init.lookup("ORA_DB");
	      conn = ds.getConnection();
	      System.out.println("DB 연결 성공 : ");
	      return conn;
	  }
	  catch (Exception ex)
	  {
	      System.out.println("DB 연결 실패 : " + ex);
	      return null;
	  }
  }
  
  public void freeConnection(Connection conn)
  {
	  
  }
}
