package ensof.common;

import java.io.LineNumberReader;
import java.io.Reader;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Dataset
{
  ArrayList<HashMap<String, String>> dataList = null;
  ArrayList<String> headerList = null;
  int nErr = 0;
  String szAlzzaErr = "0000";
  
  private Dataset()
  {
    this.dataList = new ArrayList();
    this.headerList = new ArrayList();
  }
  
  public Dataset(ResultSet rs)
    throws SQLException
  {
    this();
    ResultSetMetaData rsmd = rs.getMetaData();
    while (rs.next())
    {
      HashMap<String, String> colMap = new HashMap();
      for (int i = 1; i <= rsmd.getColumnCount(); i++)
      {
        String colName = rsmd.getColumnName(i);
        int col_type = rsmd.getColumnType(i);
        if (this.dataList.size() == 0) {
          this.headerList.add(colName);
        }
        if (col_type == 2005) {
          try
          {
            colMap.put(colName, dumpClob(rs, colName));
          }
          catch (Exception e)
          {
            colMap.put(colName, "");
          }
        } else {
          colMap.put(colName, rs.getString(colName));
        }
      }
      this.dataList.add(colMap);
    }
  }
  
  public String get(int row, int col)
  {
    return get(row, ((String)this.headerList.get(col)).toString());
  }
  
  public String get(int row, String colName)
  {
    Object v = ((HashMap)this.dataList.get(row)).get(colName);
    if (v == null) {
      return "";
    }
    return v.toString();
  }
  
  public int getRowsize()
  {
    return this.dataList.size();
  }
  
  public int getColSize()
  {
    return this.headerList.size();
  }
  
  public ArrayList<HashMap<String, String>> getDataList()
  {
    return this.dataList;
  }
  
  public ArrayList<String> getHeaderList()
  {
    return this.headerList;
  }
  
  protected String dumpClob(ResultSet rs, String columnName)
    throws Exception
  {
    Clob clob = rs.getClob(columnName);
    if (clob != null)
    {
      Reader in = clob.getCharacterStream();
      LineNumberReader br = new LineNumberReader(in);
      String line = "";
      StringBuffer buf = new StringBuffer();
      while ((line = br.readLine()) != null) {
        buf.append(line);
      }
      return buf.toString();
    }
    return "";
  }
}
