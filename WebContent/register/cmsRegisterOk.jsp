<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� :cmsRegisterOk.jsp                                  	*/
/*      ��      �� :   enSof_cms ����ó��									*/
/*      ��  ��  �� : 	2012.07.06 �ѹο�                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "ensof.common.*" %>
<jsp:useBean id="mysqlmgr" scope="application" class="ensof.common.OracleConnectionManager"/>
<jsp:useBean id="handle" scope="page" class="ensof.cms.AdminDbHandler"/>
     
<%    
	DataLog dataLog 	= new DataLog();
	String enId 		= request.getParameter("resId");
	String enPw	 		= request.getParameter("resPasswd");

	int x = 0; 
	
	boolean bl  = true;   
   
	x   =   handle.machArticleCms(mysqlmgr, enId);
	
	if(x == 0) { 

		bl  =	handle.insertArticleCms(mysqlmgr, enId, enPw); 
 
		if (bl){	 
			out.println("<script language='javascript'>");
   			out.println("alert('���� ������ �߰� �Ǿ����ϴ�.');");
   			out.println("location.href='./cmsRegisterList.jsp';");
    		out.println("</script>");  
		}else{
			out.println("<script language='javascript'>"); 
   			out.println("alert('���� ���� �߰���  ���� �Ͽ����ϴ�.');");
   			out.println("location.href='./cmsRegister.jsp';");
    		out.println("</script>"); 
    		dataLog.write_log(1, "cmsRegisterOk.jsp ���� ", request); 
		}
	} else { 
		out.println("<script language='javascript'>"); 
		out.println("alert('������ ������ ���� �մϴ�.');");
		out.println("location.href='./cmsRegister.jsp';");
		out.println("</script>"); 
	}
%>


