<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� :cmsRegistDel.jsp                                  	*/
/*      ��      �� :   enSof �������� ����ó��							*/
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
<% request.setCharacterEncoding("euc-kr");%>
  
<%  
	DataLog dataLog 	= new DataLog();
	String enId 		= DataUtil.nullToSpace(request.getParameter("resId"));

	boolean bl  = true;    
	
	bl  =	handle.deleteAdmin(mysqlmgr, enId); 
   
	if (bl){	
		out.println("<script language='javascript'>");
   		out.println("alert('���������� �����Ǿ����ϴ�.');");
   		out.println("location.href='./cmsRegisterList.jsp';");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>");
   		out.println("alert('�������� ������ ���� �Ͽ����ϴ�.');");
   		out.println("location.href='./cmsRegisterList.jsp';");
    	out.println("</script>");
    	dataLog.write_log(1, "cmsRegistDel.jsp ���� ", request); 
	}
%> 


