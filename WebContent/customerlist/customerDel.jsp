<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� :customerDel.jsp                                  	*/
/*      ��      �� :   enSof ������ ����										*/
/*      ��  ��  �� : 	2012.07.06 �ѹο�                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>
<%@ page contentType = "text/html; charset=euc-kr" %> 
<%@ page import = "java.text.SimpleDateFormat" %> 
<%@ page import="ensof.common.*"%>
<jsp:useBean id="mysqlamgr" scope="application" class="ensof.common.OracleConnectionManager"/>
<jsp:useBean id="handle" scope="page" class="ensof.RegisterDbHandler"/>
<% request.setCharacterEncoding("euc-kr");%>
<%  
	DataLog dataLog = new DataLog();

	String enEmail  = request.getParameter("resEmail");

	boolean bl  	= true; 
   
	bl  =	handle.deleteArticle(mysqlamgr, enEmail); 
  
	if (bl){	
		out.println("<script language='javascript'>");
   		out.println("alert('�������� �����Ǿ����ϴ�.');");
   		out.println("location.href='./customerList.jsp';");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>");
   		out.println("alert('������ ������  ���� �Ͽ����ϴ�.');");
   		out.println("location.href='./customerList.jsp';");
    	out.println("</script>"); 
    	dataLog.write_log(1, "customerDel.jsp ���� ", request);
	}
%>


