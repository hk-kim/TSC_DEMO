// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AdminDbHandler.java

package ensof.cms;

import ensof.common.*;
import java.sql.*;

// Referenced classes of package ensof.cms:
//            SecurityUtil

public class AdminDbHandler
{

    public AdminDbHandler()
    {
        dataLog = new DataLog();
    }

    public boolean setLoginCnt(OracleConnectionManager mysqlmgr, String szID, int nCnt)
    {
        Connection conn;
        PreparedStatement pstmt;
        StringBuffer szQuery;
        boolean blRst;
        conn = null;
        pstmt = null;
        szQuery = new StringBuffer();
        blRst = true;
        conn = mysqlmgr.getConnection();
        szQuery.append("\n   UPDATE ENSOF_ADMIN ");
        szQuery.append("\n   SET LOGIN_CNT = ? ");
        szQuery.append("\n   WHERE ID = ? ");
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, Integer.toString(nCnt));
        pstmt.setString(2, szID);
        pstmt.executeUpdate();
        
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setLoginCnt==")).append(sqle.toString()).toString());
        blRst = false;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setLoginCnt==")).append(se.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_387;
        Exception e;
        e;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setLoginCnt==")).append(e.toString()).toString());
        blRst = false;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setLoginCnt==")).append(se.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_387;
        Exception exception;
        exception;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setLoginCnt==")).append(se.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        throw exception;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setLoginCnt==")).append(se.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        return blRst;
    }

    public boolean insertArticleCms(OracleConnectionManager mysqlmgr, String enId, String enPasswd)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        StringBuffer szQuery;
        boolean bl;
        conn = null;
        pstmt = null;
        rs = null;
        szQuery = new StringBuffer();
        bl = true;
        szQuery.append("INSERT INTO ENSOF_ADMIN (ID,PASSWD) ");
        szQuery.append(" VALUES(?,?) ");
        conn = mysqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, enId);
        pstmt.setString(2, SecurityUtil.getStrByMd5Encode(enPasswd));
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_470;
        SQLException sqle;
        sqle;
        bl = false;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_570;
        Exception e;
        e;
        bl = false;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_570;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check insertArticleCms==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        return bl;
    }

    public int machArticleCms(OracleConnectionManager mysqlmgr, String enId)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        int x;
        StringBuffer szQuery;
        conn = null;
        pstmt = null;
        rs = null;
        x = 0;
        szQuery = new StringBuffer();
        conn = mysqlmgr.getConnection();
        szQuery.append(" SELECT COUNT(ID) FROM ENSOF_ADMIN ");
        szQuery.append(" WHERE ID=? ");
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, enId);
        rs = pstmt.executeQuery();
        if(rs.next())
            x = rs.getInt(1);
        break MISSING_BLOCK_LABEL_473;
        SQLException sqle;
        sqle;
        x = 0;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_572;
        Exception e;
        e;
        x = 0;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_572;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check machArticleCms==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        return x;
    }

    public Dataset getAdminlist(OracleConnectionManager mysqlmgr)
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
        szQuery.append("SELECT ID ");
        szQuery.append("FROM ENSOF_ADMIN ");
        conn = mysqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        rs = pstmt.executeQuery();
        ds = new Dataset(rs);
        break MISSING_BLOCK_LABEL_440;
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_537;
        Exception e;
        e;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_537;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminlist==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        return ds;
    }

    public int getAdminCount(OracleConnectionManager mysqlmgr)
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
        String szSql = "SELECT COUNT(ID) FROM ENSOF_ADMIN";
        pstmt = conn.prepareStatement(szSql);
        rs = pstmt.executeQuery();
        if(rs.next())
            x = rs.getInt(1);
        break MISSING_BLOCK_LABEL_429;
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_526;
        Exception e;
        e;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_526;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check getAdminCount==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        return x;
    }

    public boolean setUpdatetAdmin(OracleConnectionManager mysqlmgr, String enID, String enPw)
    {
        Connection conn;
        PreparedStatement pstmt;
        StringBuffer szQuery;
        boolean blRst;
        conn = null;
        pstmt = null;
        szQuery = new StringBuffer();
        blRst = true;
        conn = mysqlmgr.getConnection();
        szQuery.append("\n   UPDATE ENSOF_ADMIN ");
        szQuery.append("\n   SET PASSWD = ? ");
        szQuery.append("\n   WHERE ID = ? ");
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, SecurityUtil.getStrByMd5Encode(enPw));
        pstmt.setString(2, enID);
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_334;
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setUpdatetAdmin==")).append(sqle.toString()).toString());
        blRst = false;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setUpdatetAdmin==")).append(se.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_387;
        Exception e;
        e;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setUpdatetAdmin==")).append(e.toString()).toString());
        blRst = false;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setUpdatetAdmin==")).append(se.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_387;
        Exception exception;
        exception;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setUpdatetAdmin==")).append(se.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        throw exception;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check setUpdatetAdmin==")).append(se.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        return blRst;
    }

    public boolean deleteAdmin(OracleConnectionManager mysqlmgr, String enId)
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
        szQuery.append("DELETE FROM ENSOF_ADMIN ");
        szQuery.append("WHERE ID=?");
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, enId);
        pstmt.executeUpdate();
        break MISSING_BLOCK_LABEL_308;
        SQLException sqle;
        sqle;
        b1 = false;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check deleteAdmin==")).append(sqle.toString()).toString());
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check deleteAdmin==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_360;
        Exception e;
        e;
        b1 = false;
        dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check deleteAdmin==")).append(e.toString()).toString());
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check deleteAdmin==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_360;
        Exception exception;
        exception;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check deleteAdmin==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        throw exception;
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "AdminDbHandler \uC624\uB958", (new StringBuilder("check deleteAdmin==")).append(ex.toString()).toString());
            }
        mysqlmgr.freeConnection(conn);
        return b1;
    }

    DataLog dataLog;
}
