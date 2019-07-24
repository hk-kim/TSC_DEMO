// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CmsUserSession.java

package ensof.cms;

import ensof.common.DataLog;
import ensof.common.OracleConnectionManager;
import java.io.PrintStream;
import java.sql.*;
import javax.servlet.http.*;

// Referenced classes of package ensof.cms:
//            SecurityUtil

public class CmsUserSession
{

    public CmsUserSession()
    {
        dataLog = new DataLog();
    }

    public int getAuthority(OracleConnectionManager dbmgr, HttpServletRequest req, HttpServletResponse res, String szID, String szPasswd)
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        conn = null;
        pstmt = null;
        rs = null;
        String dbPasswd = "";
        String dbLoginCnt = "";
        System.out.println((new StringBuilder("pw=============")).append(SecurityUtil.getStrByMd5Encode(szPasswd)).toString());
        int flag;
        conn = dbmgr.getConnection();
        String szQuery = "SELECT ID, PASSWD, LOGIN_CNT FROM ENSOF_ADMIN WHERE ID=? ";
        pstmt = conn.prepareStatement(szQuery);
        pstmt.setString(1, szID);
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            String dbPasswd = rs.getString("PASSWD");
            String dbLoginCnt = rs.getString("LOGIN_CNT");
            HttpSession session = req.getSession(false);
            if(session != null)
            {
                session.setAttribute("SessionID", szID);
                session.setAttribute("SessionLoginCnt", dbLoginCnt);
                if(dbPasswd.equals(SecurityUtil.getStrByMd5Encode(szPasswd)))
                    flag = 1;
                else
                    flag = -2;
            } else
            {
                flag = -4;
            }
        } else
        {
            flag = -1;
        }
        break MISSING_BLOCK_LABEL_573;
        SQLException sqle;
        sqle;
        dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(sqle.toString()).toString());
        flag = -3;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(se.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(se.toString()).toString());
            }
        dbmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_673;
        Exception e;
        e;
        dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(e.toString()).toString());
        flag = -3;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(se.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(se.toString()).toString());
            }
        dbmgr.freeConnection(conn);
        break MISSING_BLOCK_LABEL_673;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(se.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(se.toString()).toString());
            }
        dbmgr.freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(se.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(Exception se)
            {
                dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getAuthority==")).append(se.toString()).toString());
            }
        dbmgr.freeConnection(conn);
        return flag;
    }

    DataLog dataLog;
}
