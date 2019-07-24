// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   RegisterDbHandler.java

package ensof;

import ensof.common.DataLog;
import ensof.common.Dataset;
import ensof.common.OracleConnectionManager;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegisterDbHandler
{

    public RegisterDbHandler()
    {
        dataLog = new DataLog();
    }

    public Dataset getArticles(OracleConnectionManager mysqlmgr)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        Dataset ds;
        StringBuffer szQuery;
        conn = null;
        pstmt = null;
        rs = null;
        ds = null;
        szQuery = new StringBuffer();
        szQuery.append("SELECT E_NAME,E_MAIL,COMPANY,COUNTRY, DATE_, ");
        szQuery.append("RESEL_PL,AMOUNT,REG_DATE,PUB_DATE, PHONE, SSN, ACCOUNT ");
        szQuery.append("FROM ENSOF_REG ");
        szQuery.append("ORDER BY DATE_ DESC ");
        
        conn = mysqlmgr.getConnection();
        
        pstmt = conn.prepareStatement(szQuery.toString());
        rs = pstmt.executeQuery();
        System.out.println("ttt ds : " + ds);
        ds = new Dataset(rs);
        
        
        if(rs != null)
        {
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticles==")).append(ex.toString()).toString());
            }
        }
        
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticles==")).append(ex.toString()).toString());
            }
        }
       
        return ds;
    }

    public int getArticleCount(OracleConnectionManager mysqlmgr)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        int x;
        conn = null;
        pstmt = null;
        rs = null;
        x = 0;
        String szSql = "";
        conn = mysqlmgr.getConnection();
        
        szSql = "SELECT COUNT(COMPANY) FROM ENSOF_REG";
        
        pstmt = conn.prepareStatement(szSql);
        rs = pstmt.executeQuery();
        
        if(rs.next())
        {
            x = rs.getInt(1);
        }
        
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticleCount==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticleCount==")).append(ex.toString()).toString());
            }
        return x;
    }

    public boolean insertArticle(OracleConnectionManager mysqlmgr, String enIp, String enName, String enEmail, String enContent, String enCountry, String enResPos, String enPhone, 
            String enSsn, String enAccount)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        StringBuffer szQuery;
        boolean bl;
        int bI;
        conn = null;
        pstmt = null;
        rs = null;
        szQuery = new StringBuffer();
        bl = true;
        szQuery.append("INSERT INTO ENSOF_REG(E_NAME, ");
        szQuery.append(" E_MAIL,COMPANY,COUNTRY,TITLE, PHONE, SSN, ACCOUNT, E_HOST, DATE_, REG_DATE, PUB_DATE)");
        szQuery.append(" VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
        conn = mysqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, enName);
        pstmt.setString(2, enEmail);
        pstmt.setString(3, enContent);
        pstmt.setString(4, enCountry);
        pstmt.setString(5, enResPos);
        pstmt.setString(6, enPhone);
        pstmt.setString(7, enSsn);
        pstmt.setString(8, enAccount);
        pstmt.setString(9, enIp);
        SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd");
        Date currentTime = new Date();
        String mTime = mSimpleDateFormat.format ( currentTime );
        pstmt.setString(10, mTime);
        pstmt.setString(11, mTime);
        pstmt.setString(12, mTime);
        bI = pstmt.executeUpdate();

        if(bI == 0)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check insertArticle==")).append(ex.toString()).toString());
            }
        }
        
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check insertArticle==")).append(ex.toString()).toString());
            }
        }
        
        if(bI!=0)
        {
        	bl = true;
        }
        else
        {
        	bl = false;
        }
        
        return bl;
    }

    public boolean deleteArticle(OracleConnectionManager mysqlmgr, String enEmail)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        boolean b1;
        int bI;
        conn = null;
        pstmt = null;
        b1 = true;
        String szSql = "";
        conn = mysqlmgr.getConnection();
        szSql = "DELETE FROM ENSOF_REG WHERE E_MAIL=?";
        pstmt = conn.prepareStatement(szSql);
        pstmt.setString(1, enEmail);
        bI = pstmt.executeUpdate();
        
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check deleteArticle==")).append(ex.toString()).toString());
            }
        }
        
        if(bI!=0)
        {
        	b1 = true;
        }
        else
        {
        	b1 = false;
        }
        return b1;
    }

    public boolean updateArticle(OracleConnectionManager mysqlmgr, String enEmail, String enResel, String enAmount, String enRegist, String enPub)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        StringBuffer szQuery;
        boolean b1;
        int bI;
        conn = null;
        pstmt = null;
        rs = null;
        szQuery = new StringBuffer();
        b1 = true;
        szQuery.append(" UPDATE ENSOF_REG SET RESEL_PL = ?,");
        szQuery.append(" AMOUNT = ? , REG_DATE = ? , PUB_DATE = ? WHERE E_MAIL = ?");
        conn = mysqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, enResel);
        pstmt.setString(2, enAmount);
        pstmt.setString(3, enRegist);
        pstmt.setString(4, enPub);
        pstmt.setString(5, enEmail);
        bI = pstmt.executeUpdate();

        if(bI!=0)
        {
        	b1 = true;
        }
        else
        {
        	b1 = false;
        }

        
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check updateArticle==")).append(ex.toString()).toString());
            }
        }
        return b1;
    }

    public Dataset getArticlesCor(OracleConnectionManager mysqlmgr)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        Dataset ds;
        StringBuffer szQuery;
        conn = null;
        pstmt = null;
        rs = null;
        ds = null;
        szQuery = new StringBuffer();
        szQuery.append("SELECT CORNAME, TITLE, PATH, SERVICE ");
        szQuery.append("FROM ENSOF_IMAGE_BOARD ");
        conn = mysqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        rs = pstmt.executeQuery();
        ds = new Dataset(rs);

        if(rs != null)
        {
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticlesCor==")).append(ex.toString()).toString());
            }
        }
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticlesCor==")).append(ex.toString()).toString());
            }
        }
        return ds;
    }

    public int getArticleCorCount(OracleConnectionManager mysqlmgr)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        int x;
        conn = null;
        pstmt = null;
        rs = null;
        x = 0;
        String szSql = "";
        conn = mysqlmgr.getConnection();
        szSql = "SELECT COUNT(CORNAME) FROM ENSOF_IMAGE_BOARD";
        pstmt = conn.prepareStatement(szSql);
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            x = rs.getInt(1);
        }
        
        if(rs != null)
        {
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticleCorCount==")).append(ex.toString()).toString());
            }
        }
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticleCorCount==")).append(ex.toString()).toString());
            }
        }
        return x;
    }

    public boolean deleteArticleCor(OracleConnectionManager mysqlmgr, String enCompany)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        boolean b1;
        StringBuffer szQuery;
        conn = null;
        pstmt = null;
        b1 = true;
        szQuery = new StringBuffer();
        conn = mysqlmgr.getConnection();
        szQuery.append("DELETE FROM ENSOF_IMAGE_BOARD ");
        szQuery.append("WHERE CORNAME=?");
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, enCompany);
        pstmt.executeUpdate();

        b1 = false;

        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check deleteArticleCor==")).append(ex.toString()).toString());
            }

        return b1;
    }

    public int getArticleMach(OracleConnectionManager mysqlmgr, String Corname)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        int x;
        conn = null;
        pstmt = null;
        rs = null;
        x = 0;
        String szSql = "";
        conn = mysqlmgr.getConnection();
        szSql = "SELECT COUNT(CORNAME) FROM ENSOF_IMAGE_BOARD WHERE CORNAME=?";
        pstmt = conn.prepareStatement(szSql);
        pstmt.setString(1, Corname);
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            x = rs.getInt(1);
        }

        if(rs != null)
        {
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticleMach==")).append(ex.toString()).toString());
            }
        }
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticleMach==")).append(ex.toString()).toString());
            }
        }
        return x;
    }

    public int getMachCount(OracleConnectionManager mysqlmgr, String enEmail)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        int x;
        conn = null;
        pstmt = null;
        rs = null;
        x = 0;
        String szSql = "";
        conn = mysqlmgr.getConnection();
        szSql = "SELECT COUNT(E_MAIL) FROM ENSOF_REG WHERE E_MAIL = ?";
        pstmt = conn.prepareStatement(szSql);
        pstmt.setString(1, enEmail);
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            x = rs.getInt(1);
        }
        
        if(rs != null)
        {
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticleCount==")).append(ex.toString()).toString());
            }
        }
        if(pstmt != null)
        {
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticleCount==")).append(ex.toString()).toString());
            }
        }
        return x;
    }
    
    public Dataset getAddr(OracleConnectionManager mysqlmgr)
            throws Exception
        {
            Connection conn;
            PreparedStatement pstmt;
            ResultSet rs;
            Dataset ds;
            StringBuffer szQuery;
            conn = null;
            pstmt = null;
            rs = null;
            ds = null;
            szQuery = new StringBuffer();
			szQuery.append("SELECT ");
            szQuery.append(" zipcode");
            szQuery.append(", sido");
            szQuery.append(", sigungu");
            szQuery.append(", eubmuen");
            szQuery.append(", dorocd");
            szQuery.append(", doronm");
            szQuery.append(", b_yn");
            szQuery.append(", belino1");
            szQuery.append(", belino2");
            szQuery.append(", belimgrno");
            szQuery.append(", belinm");
			szQuery.append(" from zipcode");
			//szQuery.append(" where rownum < 20");
            
            conn = mysqlmgr.getConnection();
            
            pstmt = conn.prepareStatement(szQuery.toString());
            rs = pstmt.executeQuery();
            System.out.println("ttt ds : " + ds);
            ds = new Dataset(rs);
            
            
            if(rs != null)
            {
                try
                {
                    rs.close();
                }
                catch(SQLException ex)
                {
                    dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticles==")).append(ex.toString()).toString());
                }
            }
            
            if(pstmt != null)
            {
                try
                {
                    pstmt.close();
                }
                catch(SQLException ex)
                {
                    dataLog.write_Log(2, "RegisterDbHandler \uC624\uB958", (new StringBuilder("check getArticles==")).append(ex.toString()).toString());
                }
            }
           
            return ds;
        }

    DataLog dataLog;
}
