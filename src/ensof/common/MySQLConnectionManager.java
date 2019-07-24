package ensof.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnectionManager
{
  Config conf = new Config();
  DataLog datalog = new DataLog();
  private Connection conn;
  
  public Connection getConnection()
  {
    try
    {
      Class.forName(this.conf.getString("DBCLASS"));
    }
    catch (ClassNotFoundException e1)
    {
      this.datalog.write_Log(2, "MySQLConnectionManager : ", e1.toString());
    }
    String JDBCDriverType = this.conf.getString("DBDRIVER");
    String DBHost = this.conf.getString("DBHOST");
    String DBName = this.conf.getString("DBNAME");
    String url = JDBCDriverType + "://" + DBHost + "/" + DBName;
    String userID = this.conf.getString("DBID");
    String password = this.conf.getString("DBPW");
    try
    {
      return this.conn = DriverManager.getConnection(url, userID, password);
    }
    catch (SQLException e)
    {
      this.datalog.write_Log(2, "MySQLConnectionManager : ", e.toString());
    }
    return this.conn;
  }
  
  /* Error */
  public void freeConnection(Connection conn)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +99 -> 100
    //   4: aload_1
    //   5: invokeinterface 109 1 0
    //   10: aconst_null
    //   11: astore_1
    //   12: goto +88 -> 100
    //   15: astore_2
    //   16: aload_0
    //   17: getfield 24	ensof/common/MySQLConnectionManager:datalog	Lensof/common/DataLog;
    //   20: iconst_2
    //   21: ldc 114
    //   23: aload_2
    //   24: invokevirtual 93	java/sql/SQLException:toString	()Ljava/lang/String;
    //   27: invokevirtual 52	ensof/common/DataLog:write_Log	(ILjava/lang/String;Ljava/lang/String;)V
    //   30: aload_1
    //   31: ifnull +101 -> 132
    //   34: aload_1
    //   35: invokeinterface 109 1 0
    //   40: aconst_null
    //   41: astore_1
    //   42: goto +90 -> 132
    //   45: astore 4
    //   47: aload_0
    //   48: getfield 24	ensof/common/MySQLConnectionManager:datalog	Lensof/common/DataLog;
    //   51: iconst_2
    //   52: ldc 114
    //   54: aload 4
    //   56: invokevirtual 93	java/sql/SQLException:toString	()Ljava/lang/String;
    //   59: invokevirtual 52	ensof/common/DataLog:write_Log	(ILjava/lang/String;Ljava/lang/String;)V
    //   62: goto +70 -> 132
    //   65: astore_3
    //   66: aload_1
    //   67: ifnull +31 -> 98
    //   70: aload_1
    //   71: invokeinterface 109 1 0
    //   76: aconst_null
    //   77: astore_1
    //   78: goto +20 -> 98
    //   81: astore 4
    //   83: aload_0
    //   84: getfield 24	ensof/common/MySQLConnectionManager:datalog	Lensof/common/DataLog;
    //   87: iconst_2
    //   88: ldc 114
    //   90: aload 4
    //   92: invokevirtual 93	java/sql/SQLException:toString	()Ljava/lang/String;
    //   95: invokevirtual 52	ensof/common/DataLog:write_Log	(ILjava/lang/String;Ljava/lang/String;)V
    //   98: aload_3
    //   99: athrow
    //   100: aload_1
    //   101: ifnull +31 -> 132
    //   104: aload_1
    //   105: invokeinterface 109 1 0
    //   110: aconst_null
    //   111: astore_1
    //   112: goto +20 -> 132
    //   115: astore 4
    //   117: aload_0
    //   118: getfield 24	ensof/common/MySQLConnectionManager:datalog	Lensof/common/DataLog;
    //   121: iconst_2
    //   122: ldc 114
    //   124: aload 4
    //   126: invokevirtual 93	java/sql/SQLException:toString	()Ljava/lang/String;
    //   129: invokevirtual 52	ensof/common/DataLog:write_Log	(ILjava/lang/String;Ljava/lang/String;)V
    //   132: return
    // Line number table:
    //   Java source line #49	-> byte code offset #0
    //   Java source line #50	-> byte code offset #4
    //   Java source line #51	-> byte code offset #10
    //   Java source line #53	-> byte code offset #15
    //   Java source line #55	-> byte code offset #30
    //   Java source line #57	-> byte code offset #34
    //   Java source line #58	-> byte code offset #40
    //   Java source line #59	-> byte code offset #45
    //   Java source line #60	-> byte code offset #47
    //   Java source line #54	-> byte code offset #65
    //   Java source line #55	-> byte code offset #66
    //   Java source line #57	-> byte code offset #70
    //   Java source line #58	-> byte code offset #76
    //   Java source line #59	-> byte code offset #81
    //   Java source line #60	-> byte code offset #83
    //   Java source line #63	-> byte code offset #98
    //   Java source line #55	-> byte code offset #100
    //   Java source line #57	-> byte code offset #104
    //   Java source line #58	-> byte code offset #110
    //   Java source line #59	-> byte code offset #115
    //   Java source line #60	-> byte code offset #117
    //   Java source line #64	-> byte code offset #132
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	133	0	this	MySQLConnectionManager
    //   0	133	1	conn	Connection
    //   15	9	2	e	SQLException
    //   65	34	3	localObject	Object
    //   45	10	4	e	SQLException
    //   81	10	4	e	SQLException
    //   115	10	4	e	SQLException
    // Exception table:
    //   from	to	target	type
    //   0	12	15	java/sql/SQLException
    //   34	42	45	java/sql/SQLException
    //   0	30	65	finally
    //   70	78	81	java/sql/SQLException
    //   104	112	115	java/sql/SQLException
  }
}
