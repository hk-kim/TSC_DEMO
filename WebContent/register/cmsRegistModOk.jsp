<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� :cmsRegistModOk.jsp                                  	*/
/*      ��      �� :   enSof_cms ��������ó��									*/
/*      ��  ��  �� : 	2012.07.19 �ѹο�                     							*/
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

	boolean bl  = true;    
   
	bl  =	handle.setUpdatetAdmin(mysqlmgr, enId, enPw); 

	if (bl){	 
		out.println("<script language='javascript'>");
  		out.println("alert('���� ������ ���� �Ǿ����ϴ�.');");
  	   	out.println("opener.location.reload();");
  	   	out.println("self.close();");
   		out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>"); 
  		out.println("alert('���� ���� ������  ���� �Ͽ����ϴ�.');");
  		out.println("location.href='./cmsRegisterMod.jsp?resId="+enId+"';");
   		out.println("</script>"); 
   		dataLog.write_log(1, "cmsRegistModOk.jsp ���� ", request); 
	}

%>


