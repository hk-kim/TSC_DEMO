// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SMTPAuthenticator.java

package ensof;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator
{

    public SMTPAuthenticator()
    {
    }

    protected PasswordAuthentication getPasswordAuthentication()
    {
        String username = "hyungkyung@ensof.co.kr";
        String password = "Digital6204!";
        return new PasswordAuthentication(username, password);
    }
}
