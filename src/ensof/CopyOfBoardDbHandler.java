// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CopyOfBoardDbHandler.java

package ensof;

import ensof.common.DataLog;
import ensof.common.Dataset;
import ensof.common.OracleConnectionManager;
import java.sql.*;

public class CopyOfBoardDbHandler
{

    public CopyOfBoardDbHandler()
    {
        dataLog = new DataLog();
    }

    public int getProductCount(OracleConnectionManager sqlmgr, String product, String search)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        StringBuffer szSql;
        int x;
        conn = null;
        pstmt = null;
        rs = null;
        szSql = new StringBuffer();
        x = 0;
        conn = sqlmgr.getConnection();
        if(product.equals("ALL"))
        {
            szSql.append("SELECT COUNT(SEQ) FROM ENSOF_ACCOUNT");
            if(!search.equals("") || search != null)
                szSql.append((new StringBuilder(" WHERE E_TITLE LIKE '%")).append(search).append("%' ").toString());
            pstmt = conn.prepareStatement(szSql.toString());
        } else
        {
            szSql.append("SELECT COUNT(SEQ) FROM ENSOF_ACCOUNT");
            szSql.append(" WHERE E_PRODUCT = ?");
            if(!search.equals("") || search != null)
                szSql.append((new StringBuilder(" AND E_TITLE LIKE '%")).append(search).append("%' ").toString());
            pstmt = conn.prepareStatement(szSql.toString());
            pstmt.setString(1, product);
        }
        rs = pstmt.executeQuery();
        if(rs.next())
            x = rs.getInt(1);
        break MISSING_BLOCK_LABEL_587;
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_687;
        Exception e;
        e;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_687;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductCount \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        return x;
    }

    public Dataset getProductArticle(OracleConnectionManager sqlmgr, String product, String serchValue)
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
        conn = sqlmgr.getConnection();
        if(product.equals("ALL"))
        {
            szQuery.append("SELECT SEQ, E_TITLE,E_PRODUCT, E_NAME, E_BALANCE, E_DATE, E_PHONE ");
            szQuery.append(" FROM ENSOF_ACCOUNT");
            if(!serchValue.equals("") || serchValue != null)
                szQuery.append((new StringBuilder(" WHERE E_TITLE LIKE '%")).append(serchValue).append("%' ").toString());
            pstmt = conn.prepareStatement(szQuery.toString());
        } else
        {
            szQuery.append("SELECT SEQ, E_NAME,E_BALANCE, E_DATE, E_TITLE, E_CONTENT, E_PRODUCT ");
            szQuery.append(" FROM ENSOF_ACCOUNT WHERE E_PRODUCT = ?");
            if(!serchValue.equals("") || serchValue != null)
                szQuery.append((new StringBuilder(" AND E_TITLE LIKE '%")).append(serchValue).append("%' ").toString());
            pstmt = conn.prepareStatement(szQuery.toString());
            pstmt.setString(1, product);
        }
        rs = pstmt.executeQuery();
        ds = new Dataset(rs);
        break MISSING_BLOCK_LABEL_586;
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_686;
        Exception e;
        e;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_686;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getProductArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        return ds;
    }

    public Dataset getArticle(OracleConnectionManager sqlmgr, int seq)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        Dataset ds;
        StringBuffer szQuery2;
        conn = null;
        pstmt = null;
        rs = null;
        ds = null;
        szQuery2 = new StringBuffer();
        szQuery2.append("SELECT SEQ, E_COMPANY, E_NAME, E_DATE, ");
        szQuery2.append(" E_TITLE, E_BALANCE, E_CONTENT, E_PRODUCT, E_COUNTRY, E_PHONE ");
        szQuery2.append(" FROM ENSOF_ACCOUNT WHERE SEQ = ?");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery2.toString());
        pstmt.setInt(1, seq);
        rs = pstmt.executeQuery();
        ds = new Dataset(rs);
        break MISSING_BLOCK_LABEL_466;
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 = ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_565;
        Exception e;
        e;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 = ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_565;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        return ds;
    }

    public boolean insertArticle(OracleConnectionManager sqlmgr, String company, String balance, String szName, String pcsNo, String szTitle, Timestamp szDate, 
            String szContent, String product, String country)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        boolean bl;
        conn = null;
        pstmt = null;
        rs = null;
        StringBuffer szQuery = new StringBuffer();
        bl = true;
        StringBuffer szQuery = new StringBuffer();
        szQuery.append("INSERT INTO ENSOF_ACCOUNT");
        szQuery.append("(SEQ, E_NAME, E_BALANCE, E_PHONE, E_TITLE,  E_DATE, E_CONTENT, E_PRODUCT, E_COMPANY, E_COUNTRY)");
        szQuery.append(" VALUES(EN_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, szName);
        pstmt.setString(2, balance);
        pstmt.setString(3, pcsNo);
        pstmt.setString(4, szTitle);
        pstmt.setTimestamp(5, szDate);
        pstmt.setString(6, szContent);
        pstmt.setString(7, product);
        pstmt.setString(8, company);
        pstmt.setString(9, country);
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_558;
        SQLException sqle;
        sqle;
        bl = false;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_658;
        Exception e;
        e;
        bl = false;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_658;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        return bl;
    }

    public boolean updateArticle(OracleConnectionManager sqlmgr, int num, int balance, String company, String name, int pcsno, String title, 
            String product, String content, String country)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        StringBuffer szQuery;
        boolean b1;
        conn = null;
        pstmt = null;
        rs = null;
        szQuery = new StringBuffer();
        b1 = true;
        szQuery.append("UPDATE ENSOF_ACCOUNT SET");
        szQuery.append(" E_TITLE = ?, E_BALANCE = ?, E_CONTENT = ?, E_COMPANY = ?, E_COUNTRY = ?,");
        szQuery.append(" E_NAME = ?, E_PRODUCT = ?, E_PHONE = ?  ");
        szQuery.append(" WHERE SEQ = ?");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, title);
        pstmt.setInt(2, balance);
        pstmt.setString(3, content);
        pstmt.setString(4, company);
        pstmt.setString(5, country);
        pstmt.setString(6, name);
        pstmt.setString(7, product);
        pstmt.setInt(8, pcsno);
        pstmt.setInt(9, num);
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_557;
        SQLException sqle;
        sqle;
        b1 = false;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_657;
        Exception e;
        e;
        b1 = false;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_657;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        return b1;
    }

    public boolean updateArticle(OracleConnectionManager sqlmgr, String title, String balance, String content, int num, String company, String country)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        StringBuffer szQuery;
        boolean b1;
        conn = null;
        pstmt = null;
        rs = null;
        szQuery = new StringBuffer();
        b1 = true;
        szQuery.append("UPDATE ENSOF_ACCOUNT SET");
        szQuery.append(" E_TITLE = ?, E_BALANCE = ?, E_CONTENT = ?, E_COMPANY = ?, E_COUNTRY = ?");
        szQuery.append(" WHERE SEQ = ?");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, title);
        pstmt.setString(2, balance);
        pstmt.setString(3, content);
        pstmt.setString(4, company);
        pstmt.setString(5, country);
        pstmt.setInt(6, num);
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_516;
        SQLException sqle;
        sqle;
        b1 = false;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_616;
        Exception e;
        e;
        b1 = false;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_616;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("updateArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        return b1;
    }

    DataLog dataLog;
}
