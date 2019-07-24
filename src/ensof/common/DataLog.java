package ensof.common;

import java.io.IOException;
import java.util.Calendar;
import java.util.TimeZone;

public class DataLog
{
  private String enPath = "C:/test/log/err";
  
  private String getDate()
  {
    Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
    String strDate = Integer.toString(cal.get(1));
    if (cal.get(2) < 9) {
      strDate = strDate + "0" + Integer.toString(cal.get(2) + 1);
    } else {
      strDate = strDate + Integer.toString(cal.get(2) + 1);
    }
    if (cal.get(5) < 10) {
      strDate = strDate + "0" + Integer.toString(cal.get(5));
    } else {
      strDate = strDate + Integer.toString(cal.get(5));
    }
    return strDate.trim();
  }
  
  public String getHM()
  {
    Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
    String strHM = null;
    if (cal.get(11) < 10) {
      strHM = "0" + Integer.toString(cal.get(11));
    } else {
      strHM = Integer.toString(cal.get(11));
    }
    if (cal.get(12) < 10) {
      strHM = strHM + ":0" + Integer.toString(cal.get(12));
    } else {
      strHM = strHM + ":" + Integer.toString(cal.get(12));
    }
    return strHM.trim();
  }
  
  public String getHMD()
  {
    Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
    String strHMD = null;
    if (cal.get(11) < 10) {
      strHMD = "0" + Integer.toString(cal.get(11));
    } else {
      strHMD = Integer.toString(cal.get(11));
    }
    if (cal.get(12) < 10) {
      strHMD = strHMD + ":0" + Integer.toString(cal.get(12));
    } else {
      strHMD = strHMD + ":" + Integer.toString(cal.get(12));
    }
    if (cal.get(13) < 10) {
      strHMD = strHMD + ":0" + Integer.toString(cal.get(13));
    } else {
      strHMD = strHMD + ":" + Integer.toString(cal.get(13));
    }
    return strHMD.trim();
  }
  
  public String getLogFileName(int nType)
    throws IOException
  {
    String szTypeDir = "";
    if (nType == 1) {
      szTypeDir = this.enPath + "fullexception.txt";
    } else if (nType == 2) {
      szTypeDir = this.enPath + "Dataexception.txt";
    } else if (nType == 3) {
      szTypeDir = this.enPath + "exception.txt";
    } else if (nType == 4) {
      szTypeDir = this.enPath + "service.txt";
    }
    return szTypeDir;
  }
  
  /* Error */
  public void write_log(int nType, String szData, javax.servlet.http.HttpServletRequest request)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: new 98	java/io/PrintWriter
    //   6: dup
    //   7: new 100	java/io/FileWriter
    //   10: dup
    //   11: aload_0
    //   12: iload_1
    //   13: invokevirtual 102	ensof/common/DataLog:getLogFileName	(I)Ljava/lang/String;
    //   16: iconst_1
    //   17: invokespecial 104	java/io/FileWriter:<init>	(Ljava/lang/String;Z)V
    //   20: iconst_1
    //   21: invokespecial 107	java/io/PrintWriter:<init>	(Ljava/io/Writer;Z)V
    //   24: astore 4
    //   26: aload 4
    //   28: new 46	java/lang/StringBuilder
    //   31: dup
    //   32: aload_0
    //   33: invokespecial 110	ensof/common/DataLog:getDate	()Ljava/lang/String;
    //   36: invokestatic 48	java/lang/String:valueOf	(Ljava/lang/Object;)Ljava/lang/String;
    //   39: invokespecial 54	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   42: ldc 112
    //   44: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: aload_0
    //   48: invokevirtual 114	ensof/common/DataLog:getHM	()Ljava/lang/String;
    //   51: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: ldc 116
    //   56: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: aload_2
    //   60: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: ldc 118
    //   65: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   68: aload_3
    //   69: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   72: invokevirtual 63	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   75: invokevirtual 123	java/io/PrintWriter:println	(Ljava/lang/String;)V
    //   78: aload 4
    //   80: invokevirtual 126	java/io/PrintWriter:flush	()V
    //   83: goto +69 -> 152
    //   86: astore 5
    //   88: getstatic 129	java/lang/System:out	Ljava/io/PrintStream;
    //   91: new 46	java/lang/StringBuilder
    //   94: dup
    //   95: ldc -121
    //   97: invokespecial 54	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   100: aload 5
    //   102: invokevirtual 136	java/lang/Exception:toString	()Ljava/lang/String;
    //   105: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   108: invokevirtual 63	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   111: invokevirtual 139	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   114: aload 4
    //   116: ifnull +51 -> 167
    //   119: aload 4
    //   121: invokevirtual 142	java/io/PrintWriter:close	()V
    //   124: goto +43 -> 167
    //   127: astore 7
    //   129: goto +38 -> 167
    //   132: astore 6
    //   134: aload 4
    //   136: ifnull +13 -> 149
    //   139: aload 4
    //   141: invokevirtual 142	java/io/PrintWriter:close	()V
    //   144: goto +5 -> 149
    //   147: astore 7
    //   149: aload 6
    //   151: athrow
    //   152: aload 4
    //   154: ifnull +13 -> 167
    //   157: aload 4
    //   159: invokevirtual 142	java/io/PrintWriter:close	()V
    //   162: goto +5 -> 167
    //   165: astore 7
    //   167: return
    // Line number table:
    //   Java source line #120	-> byte code offset #0
    //   Java source line #122	-> byte code offset #3
    //   Java source line #124	-> byte code offset #26
    //   Java source line #126	-> byte code offset #78
    //   Java source line #127	-> byte code offset #86
    //   Java source line #128	-> byte code offset #88
    //   Java source line #130	-> byte code offset #114
    //   Java source line #129	-> byte code offset #132
    //   Java source line #130	-> byte code offset #134
    //   Java source line #131	-> byte code offset #149
    //   Java source line #130	-> byte code offset #152
    //   Java source line #132	-> byte code offset #167
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	168	0	this	DataLog
    //   0	168	1	nType	int
    //   0	168	2	szData	String
    //   0	168	3	request	javax.servlet.http.HttpServletRequest
    //   1	157	4	pWriter	java.io.PrintWriter
    //   86	15	5	e	Exception
    //   132	18	6	localObject	Object
    //   127	1	7	localException1	Exception
    //   147	1	7	localException2	Exception
    //   165	1	7	localException3	Exception
    // Exception table:
    //   from	to	target	type
    //   3	83	86	java/lang/Exception
    //   119	124	127	java/lang/Exception
    //   3	114	132	finally
    //   139	144	147	java/lang/Exception
    //   157	162	165	java/lang/Exception
  }
  
  /* Error */
  public void write_Log(int nType, String szData, String szResult)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: new 98	java/io/PrintWriter
    //   6: dup
    //   7: new 100	java/io/FileWriter
    //   10: dup
    //   11: aload_0
    //   12: iload_1
    //   13: invokevirtual 102	ensof/common/DataLog:getLogFileName	(I)Ljava/lang/String;
    //   16: iconst_1
    //   17: invokespecial 104	java/io/FileWriter:<init>	(Ljava/lang/String;Z)V
    //   20: iconst_1
    //   21: invokespecial 107	java/io/PrintWriter:<init>	(Ljava/io/Writer;Z)V
    //   24: astore 4
    //   26: aload 4
    //   28: new 46	java/lang/StringBuilder
    //   31: dup
    //   32: aload_0
    //   33: invokespecial 110	ensof/common/DataLog:getDate	()Ljava/lang/String;
    //   36: invokestatic 48	java/lang/String:valueOf	(Ljava/lang/Object;)Ljava/lang/String;
    //   39: invokespecial 54	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   42: ldc 112
    //   44: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: aload_0
    //   48: invokevirtual 114	ensof/common/DataLog:getHM	()Ljava/lang/String;
    //   51: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: ldc -102
    //   56: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: aload_2
    //   60: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: ldc -100
    //   65: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   68: aload_3
    //   69: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   72: invokevirtual 63	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   75: invokevirtual 123	java/io/PrintWriter:println	(Ljava/lang/String;)V
    //   78: aload 4
    //   80: invokevirtual 126	java/io/PrintWriter:flush	()V
    //   83: goto +69 -> 152
    //   86: astore 5
    //   88: getstatic 129	java/lang/System:out	Ljava/io/PrintStream;
    //   91: new 46	java/lang/StringBuilder
    //   94: dup
    //   95: ldc -121
    //   97: invokespecial 54	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   100: aload 5
    //   102: invokevirtual 136	java/lang/Exception:toString	()Ljava/lang/String;
    //   105: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   108: invokevirtual 63	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   111: invokevirtual 139	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   114: aload 4
    //   116: ifnull +51 -> 167
    //   119: aload 4
    //   121: invokevirtual 142	java/io/PrintWriter:close	()V
    //   124: goto +43 -> 167
    //   127: astore 7
    //   129: goto +38 -> 167
    //   132: astore 6
    //   134: aload 4
    //   136: ifnull +13 -> 149
    //   139: aload 4
    //   141: invokevirtual 142	java/io/PrintWriter:close	()V
    //   144: goto +5 -> 149
    //   147: astore 7
    //   149: aload 6
    //   151: athrow
    //   152: aload 4
    //   154: ifnull +13 -> 167
    //   157: aload 4
    //   159: invokevirtual 142	java/io/PrintWriter:close	()V
    //   162: goto +5 -> 167
    //   165: astore 7
    //   167: return
    // Line number table:
    //   Java source line #140	-> byte code offset #0
    //   Java source line #142	-> byte code offset #3
    //   Java source line #144	-> byte code offset #26
    //   Java source line #146	-> byte code offset #78
    //   Java source line #147	-> byte code offset #86
    //   Java source line #148	-> byte code offset #88
    //   Java source line #150	-> byte code offset #114
    //   Java source line #149	-> byte code offset #132
    //   Java source line #150	-> byte code offset #134
    //   Java source line #151	-> byte code offset #149
    //   Java source line #150	-> byte code offset #152
    //   Java source line #152	-> byte code offset #167
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	168	0	this	DataLog
    //   0	168	1	nType	int
    //   0	168	2	szData	String
    //   0	168	3	szResult	String
    //   1	157	4	pWriter	java.io.PrintWriter
    //   86	15	5	e	Exception
    //   132	18	6	localObject	Object
    //   127	1	7	localException1	Exception
    //   147	1	7	localException2	Exception
    //   165	1	7	localException3	Exception
    // Exception table:
    //   from	to	target	type
    //   3	83	86	java/lang/Exception
    //   119	124	127	java/lang/Exception
    //   3	114	132	finally
    //   139	144	147	java/lang/Exception
    //   157	162	165	java/lang/Exception
  }
  
  public String weblog()
    throws IOException
  {
    String path = getLogFileName(1);
    
    return path;
  }
  
  public String datalog()
    throws IOException
  {
    String path = getLogFileName(2);
    
    return path;
  }
  
  public String schedulerlog()
    throws IOException
  {
    String path = getLogFileName(3);
    
    return path;
  }
}
