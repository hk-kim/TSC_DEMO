<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� :customerEmailOk.jsp                                 	*/
/*      ��      �� :   enSof Email�߼� ó��									*/
/*      ��  ��  �� : 	2012.07.09 �ѹο�                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "ensof.common.*" %> 
<jsp:useBean id="handle" scope="page" class="ensof.EmailHandler"/>
<% request.setCharacterEncoding("euc-kr"); %>   
<%  
	DataLog dataLog = new DataLog();

	String enFrom	 		= request.getParameter("resFrom");
	String enTo		 		= request.getParameter("resTo");
	String enSubject 		= request.getParameter("resSubject");
	String enContent 		= request.getParameter("resContent");

	boolean bl  = true;   
     
	bl  =	handle.MailArticle(enFrom, enTo, enSubject, enContent); 
 
	if (bl){	
		out.println("<script language='javascript'>");
   		out.println("alert('������ ���������� �߼� �Ͽ����ϴ�.');");
   	    out.println("opener.location.reload();");
   	    out.println("self.close();");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>"); 
   		out.println("alert('���� �߼ۿ�  ���� �Ͽ����ϴ�.');");
   		out.println("location.href='./customerEmail.jsp';");
    	out.println("</script>"); 
    	dataLog.write_log(1, "customerEmailOk.jsp ���� ", request);
	}
%>


