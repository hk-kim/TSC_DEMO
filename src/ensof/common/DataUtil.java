package ensof.common;

import java.io.UnsupportedEncodingException;

public class DataUtil
{
  public static String makeKOR(String str)
    throws UnsupportedEncodingException
  {
    String kor = "";
    if (str == null) {
      kor = null;
    } else {
      kor = new String(str.getBytes("ISO-8859-1"), "EUC-KR");
    }
    return kor;
  }
  
  public static String makeOver(String str1, String str2)
  {
    int len = Integer.parseInt(str2);
    if (str1.length() > len) {
      str1 = str1.substring(0, len) + "...";
    }
    return str1;
  }
  
  public static String XSSconvStr(String szSrc)
  {
    if (szSrc != null)
    {
      szSrc = strReplace(szSrc, "&", "&amp;");
      szSrc = strReplace(szSrc, ">", "&gt;");
      szSrc = strReplace(szSrc, "<", "&lt;");
      szSrc = strReplace(szSrc, "'", "&apos;");
      szSrc = strReplace(szSrc, "\"", "&quot;");
      szSrc = strReplace(szSrc, "$", "$$");
      szSrc = szSrc.replaceAll("script", "xxaaa");
      szSrc = szSrc.replaceAll("alert", "xxbbb");
      szSrc = szSrc.replaceAll("http", "xxccc");
      szSrc = szSrc.replaceAll("img src", "xxddd");
      szSrc = szSrc.replaceAll("window.open", "xxeee");
      szSrc = szSrc.replaceAll("foobar", "xxfff");
    }
    return szSrc;
  }
  
  public static String strReplace(String szOrg, String szSrc, String szDes)
  {
    int i = szOrg.indexOf(szSrc);
    String szRst = "";
    while (i > -1)
    {
      szRst = szRst + szOrg.substring(0, i) + szDes;
      szOrg = szOrg.substring(i + 1);
      i = szOrg.indexOf(szSrc);
    }
    szRst = szRst + szOrg;
    
    return szRst;
  }
  
  public static String toBr(String szSrc)
  {
    szSrc = nullToSpace(szSrc);
    
    szSrc = strReplace(szSrc, "\n", "<br/>");
    
    return szSrc.trim();
  }
  
  public static String nullToSpace(String str)
  {
    if ((str == null) || (str.trim().equals("")) || (str.equals("null"))) {
      return "";
    }
    return getSqlData(str.trim());
  }
  
  public static String getSqlData(String temp)
  {
    StringBuffer result = new StringBuffer();
    for (int i = 0; i < temp.length(); i++)
    {
      String kk = temp.substring(i, i + 1);
      char[] ca = temp.toCharArray();
      if ((ca[i] != '"') && (ca[i] != '\'')) {
        result.append(kk);
      }
    }
    return result.toString();
  }
  
  public static String toHtml(String str)
  {
    str = str.replaceAll("\r\n", "<br>");
    str = str.replaceAll("\r", "<br>");
    str = str.replaceAll("\n", "<br>");
    
    return str;
  }
  
  public static String toText(String str)
  {
    str = str.replaceAll("<br>", "\r\n");
    return str;
  }
}
