// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DaySync.java

package ensof;

import ensof.common.DataLog;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

// Referenced classes of package ensof:
//            LicenseMail

class TestEngine
{

    public TestEngine(int nSec)
    {
        dataLog = new DataLog();
        sec = nSec;
    }

    public void runOneValueJobRepeat()
        throws JobExecutionException, SchedulerException
    {
        SchedulerFactory sf = new StdSchedulerFactory();
        Scheduler sValue = sf.getScheduler();
        JobDetail valueJob = new JobDetail("valueJob", "jobGroup", ensof/LicenseMail);
        Trigger trigger = TriggerUtils.makeHourlyTrigger(sec);
        trigger.setName("jobTrigger");
        sValue.scheduleJob(valueJob, trigger);
        sValue.start();
        try
        {
            Thread.sleep((long)duration * 1000L);
        }
        catch(Exception exSleep)
        {
            dataLog.write_Log(3, "<font color=red>\uC2A4\uCF00\uC974\uB7EC \uC2DC\uC791\uB300\uAE30 \uC624\uB958</font>", (new StringBuilder("check runOneValueJobRepeat==")).append(exSleep.toString()).toString());
        }
    }

    public void runOneValueDestroy()
        throws JobExecutionException, SchedulerException
    {
        SchedulerFactory sf = new StdSchedulerFactory();
        Scheduler sValue = sf.getScheduler();
        sValue.shutdown();
    }

    DataLog dataLog;
    private int sec;
    private int duration;
}
