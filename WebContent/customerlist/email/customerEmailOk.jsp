<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :customerEmailOk.jsp                                 	*/
/*      내      용 :   enSof Email발송 처리									*/
/*      작  성  일 : 	2012.07.09 한민우                     							*/
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
   		out.println("alert('메일을 성공적으로 발송 하였습니다.');");
   	    out.println("opener.location.reload();");
   	    out.println("self.close();");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>"); 
   		out.println("alert('메일 발송에  실패 하였습니다.');");
   		out.println("location.href='./customerEmail.jsp';");
    	out.println("</script>"); 
    	dataLog.write_log(1, "customerEmailOk.jsp 오류 ", request);
	}
%>


