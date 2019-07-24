// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DaySync.java

package ensof;

import ensof.common.DataLog;
import org.quartz.JobExecutionException;
import org.quartz.SchedulerException;

// Referenced classes of package ensof:
//            TestEngine

public class DaySync
{

    public DaySync()
    {
        dataLog = new DataLog();
    }

    public boolean schedulerOff()
    {
        boolean bl = true;
        int nSec = 0;
        TestEngine t = new TestEngine(nSec);
        try
        {
            t.runOneValueDestroy();
        }
        catch(JobExecutionException eJob)
        {
            bl = false;
            dataLog.write_Log(3, "<font color=red>\uC2A4\uCF00\uC974\uB7EC \uC885\uB8CC \uC624\uB958</font>", (new StringBuilder("check schedulerOff")).append(eJob.toString()).toString());
        }
        catch(SchedulerException eSch)
        {
            dataLog.write_Log(3, "<font color=red>\uC2A4\uCF00\uC974\uB7EC \uC885\uB8CC \uC624\uB958</font>", (new StringBuilder("check schedulerOff")).append(eSch.toString()).toString());
            bl = false;
        }
        return bl;
    }

    public boolean schedulerOn()
    {
        boolean bl = true;
        int nSec = 0;
        try
        {
            nSec = Integer.parseInt("1");
        }
        catch(NumberFormatException ex)
        {
            nSec = 24;
            bl = false;
        }
        TestEngine t = new TestEngine(nSec);
        try
        {
            t.runOneValueJobRepeat();
        }
        catch(JobExecutionException eJob)
        {
            bl = false;
            dataLog.write_Log(3, "<font color=red>\uC2A4\uCF00\uC974\uB7EC \uC2DC\uC791 \uC624\uB958</font>", (new StringBuilder("check schedulerOn")).append(eJob.toString()).toString());
        }
        catch(SchedulerException eSch)
        {
            dataLog.write_Log(3, "<font color=red>\uC2A4\uCF00\uC974\uB7EC \uC2DC\uC791 \uC624\uB958</font>", (new StringBuilder("check schedulerOn")).append(eSch.toString()).toString());
            bl = false;
        }
        return bl;
    }

    DataLog dataLog;
}
