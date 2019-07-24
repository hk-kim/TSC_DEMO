// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   BoardDbHandler.java

package ensof;

import ensof.common.DataLog;
import ensof.common.Dataset;
import ensof.common.OracleConnectionManager;
import java.sql.*;

public class BoardDbHandler
{

    public BoardDbHandler()
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
            szSql.append("SELECT COUNT(SEQ) FROM ENSOF_BOARD");
            if(!search.equals("") || search != null)
                szSql.append((new StringBuilder(" WHERE B_TITLE LIKE '%")).append(search).append("%' ").toString());
            pstmt = conn.prepareStatement(szSql.toString());
        } else
        {
            szSql.append("SELECT COUNT(SEQ) FROM ENSOF_BOARD");
            szSql.append(" WHERE PRODUCT = ?");
            if(!search.equals("") || search != null)
                szSql.append((new StringBuilder(" AND B_TITLE LIKE '%")).append(search).append("%' ").toString());
            pstmt = conn.prepareStatement(szSql.toString());
            pstmt.setString(1, product);
        }
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
            szQuery.append("SELECT SEQ, B_TITLE, B_NAME, B_DATE, B_CNT, NOTICEFLAG, B_REF, B_REF_CONTENT, B_REF_DATE ");
            szQuery.append(" FROM ENSOF_BOARD");
            if(!serchValue.equals("") || serchValue != null)
                szQuery.append((new StringBuilder(" WHERE B_TITLE LIKE '%")).append(serchValue).append("%' ").toString());
            pstmt = conn.prepareStatement(szQuery.toString());
        } else
        {
            szQuery.append("SELECT SEQ, B_CNT, B_NAME, B_DATE, NOTICEFLAG, B_TITLE, B_CONTENT, PRODUCT, B_REF, B_REF_CONTENT, B_REF_DATE ");
            szQuery.append(" FROM ENSOF_BOARD WHERE PRODUCT = ?");
            if(!serchValue.equals("") || serchValue != null)
                szQuery.append((new StringBuilder(" AND B_TITLE LIKE '%")).append(serchValue).append("%' ").toString());
            pstmt = conn.prepareStatement(szQuery.toString());
            pstmt.setString(1, product);
        }
        rs = pstmt.executeQuery();
        ds = new Dataset(rs);

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
        StringBuffer szQuery1;
        StringBuffer szQuery2;
        conn = null;
        pstmt = null;
        rs = null;
        ds = null;
        szQuery1 = new StringBuffer();
        szQuery2 = new StringBuffer();
        szQuery1.append("UPDATE ENSOF_BOARD SET B_CNT = B_CNT+1 WHERE SEQ = ?");
        szQuery2.append("SELECT SEQ, B_CNT, B_REF, COMPANY, B_NAME, B_DATE, NOTICEFLAG, B_REF, B_REF_DATE, B_REF_CONTENT,");
        szQuery2.append(" B_TITLE, B_EMAIL, B_CONTENT, PRODUCT, COUNTRY, PCS_NO ");
        szQuery2.append(" FROM ENSOF_BOARD WHERE SEQ = ?");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery1.toString());
        pstmt.setInt(1, seq);
        pstmt.executeUpdate();
        pstmt = conn.prepareStatement(szQuery2.toString());
        pstmt.setInt(1, seq);
        rs = pstmt.executeQuery();
        ds = new Dataset(rs);

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
        
        return ds;
    }

    public boolean insertArticle(OracleConnectionManager sqlmgr, String company, String szName, String email, String pcsNo, String password, String szTitle, 
            String szNoti, Timestamp szDate, String szContent, String product, String country)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        boolean bl;
        int bI;
        conn = null;
        pstmt = null;
        rs = null;
        StringBuffer szQuery = new StringBuffer();
        bl = true;
        szQuery.append("INSERT INTO ENSOF_BOARD");
        szQuery.append("(SEQ, B_NAME, B_EMAIL, PCS_NO, PASSWD, B_TITLE, NOTICEFLAG, B_DATE, B_CONTENT, PRODUCT, COMPANY, COUNTRY)");
        szQuery.append(" VALUES(ENSOF_BOARD_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, szName);
        pstmt.setString(2, email);
        pstmt.setString(3, pcsNo);
        pstmt.setString(4, password);
        pstmt.setString(5, szTitle);
        pstmt.setString(6, szNoti);
        pstmt.setTimestamp(7, szDate);
        pstmt.setString(8, szContent);
        pstmt.setString(9, product);
        pstmt.setString(10, company);
        pstmt.setString(11, country);
        bI = pstmt.executeUpdate();

        if(bI != 0){
        	bl = true;
        }
        else{
        	bl = false;
        }
        
        if(!bl)
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
        return bl;
    }

    public boolean insertReply(OracleConnectionManager sqlmgr, int num, String szContent, String Date)
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        boolean bl;
        int bI;
        conn = null;
        pstmt = null;
        rs = null;
        StringBuffer szQuery = new StringBuffer();
        bl = true;

        szQuery.append("UPDATE ENSOF_BOARD SET B_REF = ?, B_REF_CONTENT = ?, B_REF_DATE = ?");
        szQuery.append(" WHERE SEQ = ?");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setInt(1, num);
        pstmt.setString(2, szContent);
        pstmt.setString(3, Date);
        pstmt.setInt(4, num);
        bI = pstmt.executeUpdate();

        if(bI != 0){        	
        	bl = true;
        }
        else{
        	bl = false;
        }
        if(!bl)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertReply \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("insertReply \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        return bl;
    }

    public Dataset getPassWord(OracleConnectionManager sqlmgr, int seq)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        Dataset ds;
        StringBuffer szSql;
        conn = null;
        pstmt = null;
        rs = null;
        ds = null;
        szSql = new StringBuffer();
        conn = sqlmgr.getConnection();
        szSql.append("SELECT PASSWD FROM ENSOF_BOARD WHERE SEQ = ?");
        pstmt = conn.prepareStatement(szSql.toString());
        pstmt.setInt(1, seq);
        rs = pstmt.executeQuery();
        ds = new Dataset(rs);
        break MISSING_BLOCK_LABEL_450;
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_549;
        Exception e;
        e;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_549;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(ex.toString()).toString());
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
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("getPassWord \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        return ds;
    }

    public boolean updateArticle(OracleConnectionManager sqlmgr, int num, String company, String name, String email, int pcsno, String passwd, 
            String title, String flag, String content, String product, String country)
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
        szQuery.append("UPDATE ENSOF_BOARD SET");
        szQuery.append(" B_TITLE = ?, NOTICEFLAG = ?, B_CONTENT = ?, COMPANY = ?, COUNTRY = ?,");
        szQuery.append(" B_NAME = ?, B_EMAIL = ?, PRODUCT = ?, PCS_NO = ?  ");
        szQuery.append(" WHERE SEQ = ?");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, title);
        pstmt.setString(2, flag);
        pstmt.setString(3, content);
        pstmt.setString(4, company);
        pstmt.setString(5, country);
        pstmt.setString(6, name);
        pstmt.setString(7, email);
        pstmt.setString(8, product);
        pstmt.setInt(9, pcsno);
        pstmt.setInt(10, num);
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_568;
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
        break MISSING_BLOCK_LABEL_668;
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
        break MISSING_BLOCK_LABEL_668;
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

    public boolean updateArticle(OracleConnectionManager sqlmgr, String title, String articleFlag, String content, int num, String company, String country)
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
        szQuery.append("UPDATE ENSOF_BOARD SET");
        szQuery.append(" B_TITLE = ?, NOTICEFLAG = ?, B_CONTENT = ?, COMPANY = ?, COUNTRY = ?");
        szQuery.append(" WHERE SEQ = ?");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, title);
        pstmt.setString(2, articleFlag);
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

    public boolean updateArticle(OracleConnectionManager sqlmgr, int num, String refContent)
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
        szQuery.append("UPDATE ENSOF_BOARD SET");
        szQuery.append(" B_REF_CONTENT = ? ");
        szQuery.append(" WHERE SEQ = ?");
        conn = sqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, refContent);
        pstmt.setInt(2, num);
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_475;
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
        break MISSING_BLOCK_LABEL_575;
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
        break MISSING_BLOCK_LABEL_575;
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

    public boolean deleteArticle(OracleConnectionManager sqlmgr, int seq)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        StringBuffer szSql;
        boolean b1;
        conn = null;
        pstmt = null;
        szSql = new StringBuffer();
        b1 = true;
        conn = sqlmgr.getConnection();
        szSql.append("DELETE FROM ENSOF_BOARD WHERE SEQ=?");
        pstmt = conn.prepareStatement(szSql.toString());
        pstmt.setInt(1, seq);
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_300;
        SQLException sqle;
        sqle;
        b1 = false;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("deleteArticle \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("deleteArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_352;
        Exception e;
        e;
        b1 = false;
        dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("deleteArticle \uC624\uB958 == ")).append(e.toString()).toString());
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("deleteArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_352;
        Exception exception;
        exception;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("deleteArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        throw exception;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "BoardDbHandler \uC624\uB958", (new StringBuilder("deleteArticle \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        sqlmgr.freeConnection(conn);
        return b1;
    }

    DataLog dataLog;
}
