// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FileHandler.java

package ensof;

import ensof.common.Config;
import ensof.common.DataLog;
import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

public class FileHandler
{

    public FileHandler()
    {
        dataLog = new DataLog();
        conf = new Config();
        fileUrl = (new StringBuilder(String.valueOf(conf.getString("FILE")))).append("text3.txt").toString();
    }

    public boolean insertFAQ(String title, String content, String date)
    {
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        boolean b1set;
        fos = null;
        bos = null;
        pw = null;
        b1set = true;
        fos = new FileOutputStream(fileUrl, true);
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        pw.print((new StringBuilder(String.valueOf(title))).append("^").toString());
        pw.print((new StringBuilder(String.valueOf(content))).append("^").toString());
        pw.println(date);
        break MISSING_BLOCK_LABEL_382;
        IOException ioe;
        ioe;
        b1set = false;
        dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("insertFAQ \uC624\uB958 == ")).append(ioe.toString()).toString());
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("insertFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        break MISSING_BLOCK_LABEL_447;
        Exception e;
        e;
        b1set = false;
        dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("insertFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("insertFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        break MISSING_BLOCK_LABEL_447;
        Exception exception;
        exception;
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("insertFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        throw exception;
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("insertFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        return b1set;
    }

    public int countFAQ()
    {
        ArrayList list = new ArrayList();
        Scanner scanner = null;
        try
        {
            for(scanner = new Scanner(new FileReader(fileUrl)); scanner.hasNext(); list.add(scanner.nextLine()));
        }
        catch(FileNotFoundException e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("countFAQ \uC624\uB958 == ")).append(e.toString()).toString());
            System.out.println((new StringBuilder(String.valueOf(fileUrl))).append("\uC744 \uCC3E\uC744 \uC218 \uC5C6\uC2B5\uB2C8\uB2E4").toString());
        }
        return list.size();
    }

    public ArrayList getFAQs()
    {
        ArrayList list = new ArrayList();
        Scanner scanner = null;
        try
        {
            for(scanner = new Scanner(new FileReader(fileUrl)); scanner.hasNext(); list.add(scanner.nextLine()));
        }
        catch(FileNotFoundException e)
        {
            System.out.println((new StringBuilder(String.valueOf(fileUrl))).append("\uC744 \uCC3E\uC744 \uC218 \uC5C6\uC2B5\uB2C8\uB2E4").toString());
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("getFAQs \uC624\uB958 == ")).append(e.toString()).toString());
        }
        return list;
    }

    public boolean updateFAQ(String title, String content, String date, int contentNum)
    {
        String listArr[];
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        boolean b1set;
        ArrayList list = new ArrayList();
        Scanner scanner = null;
        try
        {
            for(scanner = new Scanner(new FileReader(fileUrl)); scanner.hasNext(); list.add(scanner.nextLine()));
        }
        catch(FileNotFoundException e)
        {
            System.out.println((new StringBuilder(String.valueOf(fileUrl))).append("\uC774 \uC874\uC7AC\uD558\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4").toString());
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("updateFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        listArr = (String[])list.toArray(new String[list.size()]);
        listArr[contentNum] = (new StringBuilder(String.valueOf(title))).append("^").append(content).append("^").append(date).toString();
        fos = null;
        bos = null;
        pw = null;
        b1set = true;
        fos = new FileOutputStream(fileUrl, false);
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        for(int i = 0; i < listArr.length; i++)
            pw.println(listArr[i]);

        break MISSING_BLOCK_LABEL_527;
        IOException ioe;
        ioe;
        b1set = false;
        dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("updateFAQ \uC624\uB958 == ")).append(ioe.toString()).toString());
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("updateFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        break MISSING_BLOCK_LABEL_592;
        Exception e;
        e;
        b1set = false;
        dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("updateFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("updateFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        break MISSING_BLOCK_LABEL_592;
        Exception exception;
        exception;
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("updateFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        throw exception;
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("updateFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        return b1set;
    }

    public boolean deleteFAQ(int contentNum)
    {
        String listArr[];
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        boolean b1set;
        ArrayList list = new ArrayList();
        Scanner scanner = null;
        try
        {
            for(scanner = new Scanner(new FileReader(fileUrl)); scanner.hasNext(); list.add(scanner.nextLine()));
        }
        catch(FileNotFoundException e)
        {
            System.out.println((new StringBuilder(String.valueOf(fileUrl))).append("\uC774 \uC874\uC7AC\uD558\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4").toString());
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("deleteFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        listArr = (String[])list.toArray(new String[list.size()]);
        fos = null;
        bos = null;
        pw = null;
        b1set = true;
        fos = new FileOutputStream(fileUrl, false);
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        for(int i = 0; i < listArr.length; i++)
            if(i != contentNum)
                pw.println(listArr[i]);

        break MISSING_BLOCK_LABEL_491;
        IOException ioe;
        ioe;
        b1set = false;
        dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("deleteFAQ \uC624\uB958 == ")).append(ioe.toString()).toString());
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("deleteFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        break MISSING_BLOCK_LABEL_556;
        Exception e;
        e;
        b1set = false;
        dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("deleteFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("deleteFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        break MISSING_BLOCK_LABEL_556;
        Exception exception;
        exception;
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("deleteFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        throw exception;
        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "FileHandler \uC624\uB958", (new StringBuilder("deleteFAQ \uC624\uB958 == ")).append(e.toString()).toString());
        }
        return b1set;
    }

    public String[] splitStr(String str)
    {
        String splitStr[] = str.split("\\^");
        return splitStr;
    }

    DataLog dataLog;
    Config conf;
    private String fileUrl;
}
