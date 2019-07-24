// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LicenseMail.java

package ensof;

import ensof.common.DataLog;
import ensof.common.Dataset;
import ensof.common.OracleConnectionManager;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.mail.MessagingException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

// Referenced classes of package ensof:
//            EmailHandler

public class LicenseMail extends OracleConnectionManager
    implements Job
{

    public LicenseMail()
    {
        datalog = new DataLog();
    }

    public void execute(JobExecutionContext context)
    {
        SimpleDateFormat sdf;
        int count;
        Dataset ds;
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        sdf = new SimpleDateFormat("yyyy-MM-dd");
        String enEmail = "";
        String enPub = "";
        String enExpiration = "";
        String enNow = "";
        String szSql = "";
        count = 0;
        ds = null;
        conn = null;
        pstmt = null;
        rs = null;
        conn = super.getConnection();
        String szSql = "SELECT COUNT(COMPANY) FROM ENSOF_REG";
        pstmt = conn.prepareStatement(szSql);
        rs = pstmt.executeQuery();
        if(rs.next())
            count = rs.getInt(1);
        break MISSING_BLOCK_LABEL_472;
        SQLException sqle;
        sqle;
        datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute  \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        freeConnection(conn);
        break MISSING_BLOCK_LABEL_572;
        Exception e;
        e;
        datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        freeConnection(conn);
        break MISSING_BLOCK_LABEL_572;
        SQLException sqle;
        sqle;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        freeConnection(conn);
        throw sqle;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        freeConnection(conn);
        StringBuffer szQuery;
        if(count <= 0)
            break MISSING_BLOCK_LABEL_1128;
        szQuery = new StringBuffer();
        szQuery.append("SELECT E_MAIL, ");
        szQuery.append("PUB_DATE ");
        szQuery.append("FROM ENSOF_REG ");
        conn = super.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        rs = pstmt.executeQuery();
        ds = new Dataset(rs);
        break MISSING_BLOCK_LABEL_1028;
        sqle;
        datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute  \uC624\uB958 == ")).append(sqle.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        freeConnection(conn);
        break MISSING_BLOCK_LABEL_1128;
        Exception e;
        e;
        datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(e.toString()).toString());
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        freeConnection(conn);
        break MISSING_BLOCK_LABEL_1128;
        Exception exception;
        exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        freeConnection(conn);
        throw exception;
        if(rs != null)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                datalog.write_Log(2, "LicenseMail \uC624\uB958", (new StringBuilder("execute \uC624\uB958 == ")).append(ex.toString()).toString());
            }
        freeConnection(conn);
        if(ds.getRowsize() > 0)
        {
            for(int i = 0; i < ds.getRowsize(); i++)
            {
                String enEmail = ds.get(i, "E_MAIL");
                String enPub = ds.get(i, "PUB_DATE");
                if(enPub != "" || enPub == null)
                {
                    String enExpiration = (new StringBuilder(String.valueOf(enPub.substring(0, 4)))).append("-").append(enPub.substring(4, 6)).append("-").append(enPub.substring(6, 8)).toString();
                    Calendar cal1 = Calendar.getInstance();
                    cal1.setTime(sdf.parse(enExpiration));
                    cal1.add(5, 364);
                    String thisDayMiner = (new StringBuilder(String.valueOf(cal1.get(1)))).append("-").append(cal1.get(2) + 1).append("-").append(cal1.get(5) - 30).toString();
                    String expDay = (new StringBuilder(String.valueOf(cal1.get(1)))).append("-").append(cal1.get(2) + 1).append("-").append(cal1.get(5)).toString();
                    Timestamp szData = new Timestamp(System.currentTimeMillis());
                    java.util.Date expdate = sdf.parse(thisDayMiner);
                    enExpiration = sdf.format(expdate);
                    String enNow = sdf.format(szData);
                    if(enExpiration.equals(enNow))
                    {
                        String from = "admin@ensof.co.kr";
                        String to = enEmail;
                        String subject = "License key will be expired within 30days!";
                        String content = "This is warning message that your license key will be expired within 30days. \nTo renew your license key, please contact us or leave message here. \nThanks.";
                        try
                        {
                            EmailHandler mt = new EmailHandler();
                            mt.sendEmail(from, to, subject, content);
                            datalog.write_Log(3, (new StringBuilder("<font color=green>\uB77C\uC774\uC13C\uC2A4 \uC2A4\uCF00\uC974\uB7EC E_Mail \uC815\uC0C1 \uBC1C\uC1A1</font>")).append(enEmail).append(" | \uB9CC\uB8CC\uC77C : ").append(expDay).toString(), "<font color=green>SUCESS</font>");
                        }
                        catch(MessagingException me)
                        {
                            datalog.write_Log(3, (new StringBuilder("<font color=red>\uB77C\uC774\uC13C\uC2A4 \uC2A4\uCF00\uC974\uB7EC \uBA54\uC77C\uBC1C\uC1A1 \uC624\uB958 </font>")).append(enEmail).toString(), (new StringBuilder("<font color=red>FAIL</font> | ")).append(me.toString()).toString());
                        }
                        catch(Exception e)
                        {
                            datalog.write_Log(3, (new StringBuilder("<font color=red>\uB77C\uC774\uC13C\uC2A4 \uC2A4\uCF00\uC974\uB7EC \uBA54\uC77C\uBC1C\uC1A1 \uC624\uB958 </font>")).append(enEmail).toString(), (new StringBuilder("<font color=red>FAIL</font> | ")).append(e.toString()).toString());
                        }
                    }
                }
            }

        }
        datalog.write_Log(3, "<font color=green>\uB77C\uC774\uC13C\uC2A4 \uC2A4\uCF00\uC974\uB7EC \uC815\uC0C1 \uB3D9\uC791</font>", "<font color=green>SUCESS</font>");
        break MISSING_BLOCK_LABEL_1635;
        Exception e1;
        e1;
        datalog.write_Log(3, "<font color=red>\uB77C\uC774\uC13C\uC2A4 \uC2A4\uCF00\uC974\uB7EC \uC5D0\uB7EC\uBC1C\uC0DD</font>", (new StringBuilder("<font color=red>FAIL</font> | execute ")).append(e1.toString()).toString());
    }

    DataLog datalog;
}
