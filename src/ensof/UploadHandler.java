// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UploadHandler.java

package ensof;

import com.oreilly.servlet.MultipartRequest;
import ensof.common.Config;
import ensof.common.DataLog;
import ensof.common.DataUtil;
import ensof.common.OracleConnectionManager;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;

public class UploadHandler
{

    public UploadHandler()
    {
        dataLog = new DataLog();
        conf = new Config();
        fileUrl = (new StringBuilder(String.valueOf(conf.getString("FILE")))).append("text.txt").toString();
        list = (new StringBuilder(String.valueOf(conf.getString("FILE")))).append("text2.txt").toString();
        chargelist = (new StringBuilder(String.valueOf(conf.getString("FILE")))).append("text5.txt").toString();
    }

    public boolean insert(String file, String path, String flag)
    {
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        boolean b1set;
        fos = null;
        bos = null;
        pw = null;
        b1set = true;
        if(flag.equals("2"))
			try {
				fos = new FileOutputStream(list, true);
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				b1set = false;
			}
		else
			try {
				fos = new FileOutputStream(fileUrl, true);
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				b1set = false;
			}
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        try {
			pw.print((new StringBuilder(String.valueOf(DataUtil.makeKOR(file)))).append("^").toString());
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			b1set = false;
		}
        pw.println(path);

        return b1set;
    }

    public boolean insert(String email)
    {
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        boolean b1set;
        fos = null;
        bos = null;
        pw = null;
        b1set = true;
        try {
			fos = new FileOutputStream(chargelist, true);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			b1set = false;
		}
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        pw.println(email);

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
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check insert(1)==")).append(e.toString()).toString());
            b1set = false;
        }
        return b1set;
    }

    public int mach(String filename, String flag)
    {
        BufferedReader br;
        int b1set;
        br = null;
        String szData = "";
        String arrData[] = new String[1];
        b1set = 1;
        if(flag.equals("2"))
			try {
				br = new BufferedReader(new FileReader(list));
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				b1set = -1;
			}
		else
	        if(flag.equals("1"))
				try {
					br = new BufferedReader(new FileReader(fileUrl));
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					b1set = -1;
				}
			else
				try {
					br = new BufferedReader(new FileReader(chargelist));
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					b1set = -1;
				}

        try {
			for(; (szData = br.readLine()) != null; b1set = 1)
			{
			    if(flag.equals("2") || flag.equals("1"))
			        arrData = szData.split("\\^");
			    else
			        arrData = szData.split("\n");
			    if(!DataUtil.makeKOR(filename).equals(arrData[0]))
			        continue;
			    b1set = 2;
			    break;
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			b1set = -1;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			b1set = -1;
		}

        try
        {
            if(br != null)
                br.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check mach==")).append(e.toString()).toString());
            b1set = -1;
        }

        return b1set;
    }

    public boolean update(String enFile, String path, String flag)
    {
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        String enFF[];
        String enPA[];
        BufferedReader br;
        File file;
        boolean b1set;
        int i;
        fos = null;
        bos = null;
        pw = null;
        enFF = new String[30];
        enPA = new String[30];
        br = null;
        String szData = "";
        String arrData[] = new String[1];
        file = null;
        if(flag.equals("2"))
            file = new File(list);
        else
            file = new File(fileUrl);
        b1set = true;
        i = 0;
        try {
			br = new BufferedReader(new FileReader(file));
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			b1set = false;
		}
        
        try {
			while((szData = br.readLine()) != null) 
			{
				arrData = szData.split("\\^");
			    if(DataUtil.makeKOR(enFile).equals(arrData[0].trim()))
			    {
			        enFF[i] = DataUtil.makeKOR(enFile);
			        enPA[i] = path;
			    } else
			    {
			        enFF[i] = arrData[0];
			        enPA[i] = arrData[1];
			    }
			    i++;
			}
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			b1set = false;
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			b1set = false;
		}

        if(flag.equals("2"))
			try {
				fos = new FileOutputStream(list);
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				b1set = false;
			}
		else
			try {
				fos = new FileOutputStream(fileUrl);
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				b1set = false;
			}
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        for(int k = 0; k < i; k++)
        {
            pw.print((new StringBuilder(String.valueOf(enFF[k]))).append("^").toString());
            pw.println(enPA[k]);
        }


        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
            if(br != null)
                br.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check update(2)==")).append(e.toString()).toString());
			b1set = false;
        }

        return b1set;
    }

    public boolean update(String upEmail, String enEmail)
    {
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        String enFF[];
        BufferedReader br;
        File file;
        boolean b1set;
        int i;
        fos = null;
        bos = null;
        pw = null;
        enFF = new String[10];
        br = null;
        String szData = "";
        String arrData[] = new String[1];
        file = new File(chargelist);
        b1set = true;
        i = 0;
        try {
			br = new BufferedReader(new FileReader(file));
		} catch (FileNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
			b1set = false;
		}

        try {
			while((szData = br.readLine()) != null) 
			{
			    arrData = szData.split("\n");
			    if(upEmail.equals(arrData[0].trim()))
			        enFF[i] = enEmail;
			    else
			        enFF[i] = arrData[0];
			    i++;
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			b1set = false;
		}
        try {
			fos = new FileOutputStream(chargelist);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			b1set = false;
		}
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        for(int k = 0; k < i; k++)
            pw.println(enFF[k]);

        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
            if(br != null)
                br.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check update(1)==")).append(e.toString()).toString());
        }
        b1set = false;
        return b1set;
    }

    public boolean delete(String enFile, String path, String flag)
    {
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        String enFF[];
        String enPA[];
        BufferedReader br;
        File file;
        boolean b1set;
        int i;
        fos = null;
        bos = null;
        pw = null;
        enFF = new String[30];
        enPA = new String[30];
        br = null;
        String szData = "";
        String arrData[] = new String[1];
        file = null;
        if(flag.equals("2"))
            file = new File(list);
        else
            file = new File(fileUrl);
        b1set = true;
        i = 0;
        try {
			br = new BufferedReader(new FileReader(file));
		} catch (FileNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
	        b1set = false;
		}
        
        try {
			while((szData = br.readLine()) != null) 
			{
			    arrData = szData.split("\\^");
			    try {
					if(DataUtil.makeKOR(enFile).equals(arrData[0].trim()))
					{
					    i--;
					} else
					{
					    enFF[i] = arrData[0];
					    enPA[i] = arrData[1];
					}
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					b1set = false;
				}
			    i++;
			}
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
			b1set = false;
		}
        if(flag.equals("2"))
			try {
				fos = new FileOutputStream(list);
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				b1set = false;
			}
		else
			try {
				fos = new FileOutputStream(fileUrl);
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				b1set = false;
			}
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        for(int k = 0; k < i; k++)
        {
            pw.print((new StringBuilder(String.valueOf(enFF[k]))).append("^").toString());
            pw.println(enPA[k]);
        }

        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
            if(br != null)
                br.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check delete(2)==")).append(e.toString()).toString());
        }
        return b1set;
    }

    public boolean delete(String path)
    {
        FileOutputStream fos;
        BufferedOutputStream bos;
        PrintWriter pw;
        String enFF[];
        BufferedReader br;
        File file;
        boolean b1set;
        int i;
        fos = null;
        bos = null;
        pw = null;
        enFF = new String[30];
        br = null;
        String szData = "";
        String arrData[] = new String[1];
        file = new File(chargelist);
        b1set = true;
        i = 0;
        try {
			br = new BufferedReader(new FileReader(file));
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
	        b1set = false;
		}
        
        try {
			while((szData = br.readLine()) != null) 
			{
			    arrData = szData.split("\n");
			    if(path.equals(arrData[0].trim()))
			        i--;
			    else
			        enFF[i] = arrData[0];
			    i++;
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
	        b1set = false;
		}
        try {
			fos = new FileOutputStream(chargelist);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
	        b1set = false;
		}
        bos = new BufferedOutputStream(fos);
        pw = new PrintWriter(bos, true);
        for(int k = 0; k < i; k++)
            pw.println(enFF[k]);


        try
        {
            if(fos != null)
                fos.close();
            if(bos != null)
                bos.close();
            if(pw != null)
                pw.close();
            if(br != null)
                br.close();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check delete(1)==")).append(e.toString()).toString());
        }
        return b1set;
    }

    public boolean uploadArticle(HttpServletRequest request, String enFlag)
        throws Exception
    {
        String realPath = "";
        if(enFlag.equals("1"))
            realPath = conf.getString("IMGPATH");
        else
        if(enFlag.equals("2"))
            realPath = conf.getString("FILEPATH");
        else
            realPath = conf.getString("DOCPATH");
        String type = "euc-kr";
        int maxSize = 0x9600000;
        boolean bl = true;
        ArrayList saveFiles = new ArrayList();
        ArrayList origFiles = new ArrayList();
        try
        {
            MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, type);
            String name;
            for(Enumeration files = multi.getFileNames(); files.hasMoreElements(); origFiles.add(multi.getOriginalFileName(name)))
            {
                name = (String)files.nextElement();
                saveFiles.add(multi.getFilesystemName(name));
            }

        }
        catch(IOException ioe)
        {
            bl = false;
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check uploadArticle==")).append(ioe.toString()).toString());
        }
        catch(Exception ex)
        {
            bl = false;
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check uploadArticle==")).append(ex.toString()).toString());
        }
        return bl;
    }

    public boolean uploadArticleImage(HttpServletRequest request, OracleConnectionManager mysqlmgr, String corname, String productname, String filename, String Sername)
        throws Exception
    {
        String realPath;
        String type;
        int maxSize;
        boolean bl;
        int bI;
        ArrayList saveFiles;
        ArrayList origFiles;
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        realPath = conf.getString("IMGPATH");
        type = "euc-kr";
        maxSize = 0x9600000;
        bl = true;
        saveFiles = new ArrayList();
        origFiles = new ArrayList();
        conn = null;
        pstmt = null;
        rs = null;
        StringBuffer szQuery = new StringBuffer();
        MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, type);
        String name;
        for(Enumeration files = multi.getFileNames(); files.hasMoreElements(); origFiles.add(multi.getOriginalFileName(name)))
        {
            name = (String)files.nextElement();
            saveFiles.add(multi.getFilesystemName(name));
        }
        
        szQuery.append("INSERT INTO ENSOF_IMAGE_BOARD ");
        szQuery.append(" (CORNAME, TITLE, PATH, SERVICE) ");
        szQuery.append(" VALUES(?,?,?,?)");
        conn = mysqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, corname);
        pstmt.setString(2, productname);
        pstmt.setString(3, filename);
        pstmt.setString(4, Sername);
        bI=pstmt.executeUpdate();

        if(bI != 0){
        	bl = true;
        }
        else
        {
        	bl = false;
        }
        
        if(!bl)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check uploadArticleImage==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check uploadArticleImage==")).append(ex.toString()).toString());
            }

        return bl;
    }

    public boolean updateArticleImage(HttpServletRequest request, OracleConnectionManager mysqlmgr, String corname, String productname, String filename, String Sername)
        throws Exception
    {
        String realPath;
        String type;
        int maxSize;
        boolean bl;
        int bI;
        ArrayList saveFiles;
        ArrayList origFiles;
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        realPath = conf.getString("IMGPATH");
        type = "euc-kr";
        maxSize = 0x9600000;
        bl = true;
        saveFiles = new ArrayList();
        origFiles = new ArrayList();
        conn = null;
        pstmt = null;
        rs = null;
        StringBuffer szQuery = new StringBuffer();
        MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, type);
        String name;
        for(Enumeration files = multi.getFileNames(); files.hasMoreElements(); origFiles.add(multi.getOriginalFileName(name)))
        {
            name = (String)files.nextElement();
            saveFiles.add(multi.getFilesystemName(name));
        }

        szQuery.append("UPDATE ENSOF_IMAGE_BOARD SET CORNAME = ?, ");
        szQuery.append(" TITLE = ?, PATH = ?, SERVICE = ? ");
        szQuery.append(" WHERE CORNAME = ?");
        conn = mysqlmgr.getConnection();
        pstmt = conn.prepareStatement(szQuery.toString());
        pstmt.setString(1, corname);
        pstmt.setString(2, productname);
        pstmt.setString(3, filename);
        pstmt.setString(4, Sername);
        pstmt.setString(5, corname);
        bI = pstmt.executeUpdate();
        
        if(bI != 0){
        	bl = true;
        }
        else{
        	bl = false;
        }
        
        if(!bl)
            try
            {
                rs.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check updateArticleImage==")).append(ex.toString()).toString());
            }
        if(pstmt != null)
            try
            {
                pstmt.close();
            }
            catch(SQLException ex)
            {
                dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check updateArticleImage==")).append(ex.toString()).toString());
            }
        return bl;
    }

    public String[] fileList(HttpServletRequest request, String flag)
    {
        String filelist[] = (String[])null;
        String realPath = "";
        if(flag.equals("2"))
            realPath = conf.getString("FILEPATH");
        else
            realPath = conf.getString("DOCPATH");
        try
        {
            File file = new File(realPath);
            filelist = file.list();
        }
        catch(Exception e)
        {
            dataLog.write_Log(2, "UploadHandler \uC624\uB958", (new StringBuilder("check fileList==")).append(e.toString()).toString());
        }
        return filelist;
    }

    public String filepath()
    {
        return fileUrl;
    }

    public String chargefile()
    {
        return chargelist;
    }

    public String list()
    {
        return list;
    }

    DataLog dataLog;
    Config conf;
    private String fileUrl;
    private String list;
    private String chargelist;
}
