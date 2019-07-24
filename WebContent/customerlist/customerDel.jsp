<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :customerDel.jsp                                  	*/
/*      내      용 :   enSof 가입자 삭제										*/
/*      작  성  일 : 	2012.07.06 한민우                     							*/
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
   		out.println("alert('고객정보가 삭제되었습니다.');");
   		out.println("location.href='./customerList.jsp';");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>");
   		out.println("alert('고객정보 삭제에  실패 하였습니다.');");
   		out.println("location.href='./customerList.jsp';");
    	out.println("</script>"); 
    	dataLog.write_log(1, "customerDel.jsp 오류 ", request);
	}
%>


