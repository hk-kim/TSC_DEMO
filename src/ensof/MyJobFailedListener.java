// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MyJobFailedListener.java

package ensof;

import ensof.common.DataLog;
import java.io.*;
import javax.mail.MessagingException;
import org.quartz.*;

// Referenced classes of package ensof:
//            UploadHandler, EmailHandler

public class MyJobFailedListener extends UploadHandler
    implements JobListener
{

    public MyJobFailedListener()
    {
        dataLog = new DataLog();
    }

    public String getName()
    {
        return "Fail_Job";
    }

    public void jobExecutionVetoed(JobExecutionContext jobexecutioncontext)
    {
    }

    public void jobToBeExecuted(JobExecutionContext jobexecutioncontext)
    {
    }

    public void jobWasExecuted(JobExecutionContext context, JobExecutionException exception)
    {
        if(exception != null)
        {
            BufferedReader br = null;
            String szData = "";
            String tt = "";
            String arrData[] = new String[1];
            File file = new File(super.chargefile());
            int k = 0;
            try
            {
                if(file.exists())
                {
                    br = new BufferedReader(new FileReader(file));
                    while((szData = br.readLine()) != null) 
                    {
                        arrData = szData.split("\n");
                        tt = (new StringBuilder(String.valueOf(tt))).append(arrData[0].trim()).append(",").toString();
                    }
                    k = tt.length();
                    tt = tt.substring(0, k - 1);
                    br.close();
                }
                EmailHandler mt = new EmailHandler();
                mt.sendEmail("admin@ensof.co.kr", tt, "[\uC7A5\uC560\uBC1C\uC0DD]", (new StringBuilder("\uC2A4\uCF00\uC974\uB7EC\uC5D0 \uBB38\uC81C\uAC00 \uBC1C\uC0DD\uD588\uC2B5\uB2C8\uB2E4 \\n")).append(getName()).append(" cms\uC758 \uAD00\uB9AC\uC790 \uB85C\uADF8\uB97C \uD655\uC778\uD574 \uC8FC\uC2DC\uAE38 \uBC14\uB78D\uB2C8\uB2E4.").toString());
                dataLog.write_Log(3, "<font color=green>\uC2A4\uCF00\uC974\uB7EC \uC5D0\uB7EC \uBC1C\uC0DD \uB2F4\uB2F9\uC790 \uBA54\uC77C \uBC1C\uC1A1 \uC131\uACF5</font>", "check MyJobFailedListener");
            }
            catch(MessagingException me)
            {
                dataLog.write_Log(3, "<font color=green>\uC2A4\uCF00\uC974\uB7EC \uC5D0\uB7EC \uBC1C\uC0DD \uB2F4\uB2F9\uC790 \uBA54\uC77C \uBC1C\uC1A1 \uC2E4\uD328</font>", (new StringBuilder("check MyJobFailedListener==")).append(me.toString()).toString());
            }
            catch(Exception e)
            {
                dataLog.write_Log(3, "<font color=green>\uC2A4\uCF00\uC974\uB7EC \uC5D0\uB7EC \uBC1C\uC0DD \uB2F4\uB2F9\uC790 \uBA54\uC77C \uBC1C\uC1A1 \uC2E4\uD328</font>", (new StringBuilder("check MyJobFailedListener==")).append(e.toString()).toString());
            }
        }
    }

    DataLog dataLog;
}
