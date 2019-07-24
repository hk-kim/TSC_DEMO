// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PostTest.java

package ensof;

import java.io.PrintStream;
import javax.mail.MessagingException;

// Referenced classes of package ensof:
//            EmailHandler

public class PostTest
{

    public PostTest()
    {
    }

    public static void main(String args[])
    {
        String from = "gksalsdn28@gmail.com";
        String to = "gksalsdn24@naver.com,questjung@daum.net,gksalsdn28@gmail.com";
        String subject = "\uB77C\uC774\uC120\uC2A4 \uAE30\uAC04\uC774 30\uC77C \uB0A8\uC558\uC2B5\uB2C8\uB2E4. ";
        String content = "\uD14C\uC2A4\uD2B8 \uC6D0\uCE04";
        if(from.trim().equals(""))
            System.out.println("\uBCF4\uB0B4\uB294 \uC0AC\uB78C\uC744 \uC785\uB825\uD558\uC2DC\uC624");
        else
        if(to.trim().equals(""))
            System.out.println("\uBC1B\uB294 \uC0AC\uB78C\uC744 \uC785\uB825\uD558\uC2DC\uC624");
        else
            try
            {
                EmailHandler mt = new EmailHandler();
                mt.sendEmail(from, to, subject, content);
                System.out.println("\uBA54\uC77C \uC804\uC1A1 \uC131\uACF5");
            }
            catch(MessagingException me)
            {
                System.out.println("\uBA54\uC77C \uC804\uC1A1 \uC2E4\uD328");
                System.out.println((new StringBuilder()).append(me.getMessage()).toString());
            }
            catch(Exception e)
            {
                System.out.println("\uBA54\uC77C \uC804\uC1A1 \uC2E4\uD328");
                System.out.println((new StringBuilder()).append(e.getMessage()).toString());
            }
    }
}
