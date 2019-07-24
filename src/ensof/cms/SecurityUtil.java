// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SecurityUtil.java

package ensof.cms;

import ensof.common.DataLog;
import java.security.MessageDigest;

public class SecurityUtil
{

    public SecurityUtil()
    {
    }

    public static String getStrByMd5Encode(String str)
    {
        String original = str;
        String temp = null;
        MessageDigest mdAlgorithm = null;
        StringBuffer sb = new StringBuffer();
        try
        {
            mdAlgorithm = MessageDigest.getInstance("MD5");
            byte originalBytes[] = original.getBytes();
            mdAlgorithm.update(originalBytes);
            byte digest[] = mdAlgorithm.digest();
            for(int i = 0; i < digest.length; i++)
            {
                temp = Integer.toHexString(0xff & digest[i]);
                if(temp.length() < 2)
                    temp = (new StringBuilder("0")).append(temp).toString();
                sb.append(temp);
            }

        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "CmsUserSession \uC624\uB958", (new StringBuilder("check getStrByMd5Encode==")).append(e.toString()).toString());
        }
        return sb.toString();
    }

    static DataLog dataLog = new DataLog();

}
