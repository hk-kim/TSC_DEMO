package ensof.common;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionResource
{
  private static final String datasource = "jdbc/oracle";
  private static DataSource ds = null;
  private Connection conn = null;
  
  public ConnectionResource()
    throws Exception
  {
    synchronized (ConnectionResource.class)
    {
      if (ds == null)
      {
        Context env = (Context)new InitialContext().lookup("java:comp/env");
        ds = (DataSource)env.lookup("jdbc/oracle");
      }
    }
    this.conn = ds.getConnection();
  }
  
  public Connection getConnection()
    throws SQLException
  {
    if (this.conn == null) {
      throw new SQLException("Connection is NOT avaiable !!");
    }
    return this.conn;
  }
  
  public void freeConnection()
  {
    if (this.conn != null) {
      try
      {
        this.conn.close();
      }
      catch (SQLException localSQLException) {}
    }
    this.conn = null;
  }
}
