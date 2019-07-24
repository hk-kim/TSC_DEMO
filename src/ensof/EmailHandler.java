// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   EmailHandler.java

package ensof;

import ensof.common.DataLog;
import java.io.*;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

// Referenced classes of package ensof:
//            UploadHandler, SMTPAuthenticator

public class EmailHandler extends UploadHandler
{

    public EmailHandler()
    {
        dataLog = new DataLog();
    }

    public void sendEmail(String from, String to, String subject, String content)
        throws Exception
    {
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", "ezsmtp.bizmeka.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        Authenticator auth = new SMTPAuthenticator();
        Session mailSession = Session.getInstance(props, auth);
        Message msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(to, false));
        msg.setSubject(subject);
        msg.setText(content);
        msg.setSentDate(new Date());
        Transport.send(msg);
    }

    public boolean MailArticle(String from, String to, String subject, String content)
        throws Exception
    {
        boolean bl = true;
        try
        {
            EmailHandler mt = new EmailHandler();
            mt.sendEmail(from, to, subject, content);
        }
        catch(MessagingException me)
        {
            dataLog.write_Log(2, "Mail Handler \uC624\uB958", (new StringBuilder("check MailArticle==")).append(me.toString()).toString());
            bl = false;
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "Mail Handler \uC624\uB958", (new StringBuilder("check MailArticle==")).append(e.toString()).toString());
            bl = false;
        }
        return bl;
    }

    public boolean MailArticleInquiry(String to, String enProduct)
        throws Exception
    {
        BufferedReader br = null;
        String szData = "";
        String tt = "";
        String enMach = "";
        String arrData[] = new String[1];
        File file = new File(super.chargefile());
        boolean bl = true;
        int k = 0;
        int j = 0;
        try
        {
            if(file.exists())
            {
                br = new BufferedReader(new FileReader(file));
                while((szData = br.readLine()) != null) 
                {
                    arrData = szData.split("\n");
                    j = arrData[0].indexOf("_");
                    enMach = arrData[0].substring(0, j);
                    j++;
                    if(enMach.equals("CR"))
                        tt = (new StringBuilder(String.valueOf(tt))).append(arrData[0].trim().substring(3, arrData[0].length())).append(",").toString();
                }
                k = tt.length();
                tt = tt.substring(0, k - 1);
                br.close();
            }
            EmailHandler mt = new EmailHandler();
            mt.sendEmail("hyungkyung@ensof.co.kr", tt, "(\uD544\uB3C5)\uB77C\uC774\uC13C\uC2A4 \uBB38\uC758", (new StringBuilder("\uC0AC\uC6A9\uC790\uAC00 \uB77C\uC774\uC120\uC2A4\uC5D0 \uB300\uD574 \uBB38\uC758\uB97C \uC694\uCCAD \uD558\uC600\uC2B5\uB2C8\uB2E4 \n\uBB38\uC758\uC790 \uC774\uBA54\uC77C : ")).append(to).append("\n\uD574\uB2F9 \uC81C\uD488 : ").append(enProduct).toString());
        }
        catch(MessagingException me)
        {
            dataLog.write_Log(2, "EmailHandler \uC624\uB958", (new StringBuilder("check MailArticleInquiry==")).append(me.toString()).toString());
            bl = false;
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "EmailHandler \uC624\uB958", (new StringBuilder("check MailArticleInquiry==")).append(e.toString()).toString());
            bl = false;
        }
        return bl;
    }
   
    DataLog dataLog;
}
