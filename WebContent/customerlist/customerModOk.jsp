<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :customerModOk.jsp                                  	*/
/*      내      용 :   enSof 가입자 수정 처리								*/
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
<%    
	DataLog dataLog = new DataLog();

	String enEmail	 		= request.getParameter("resEmail");
	String enResel	 		= request.getParameter("resResel");
	String enAmount 		= request.getParameter("resA");
	String enRegist 		= request.getParameter("resPD");
	String enPub	 		= request.getParameter("resRD"); 

	boolean bl  = true;  
   
	bl  =	handle.updateArticle(mysqlamgr, enEmail, enResel, enAmount, enRegist, enPub); 
 
	if (bl){	
		out.println("<script language='javascript'>");
   		out.println("alert('고객정보가 수정되었습니다.');");
   	    out.println("opener.location.reload();");
   	    out.println("self.close();");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>"); 
   		out.println("alert('고객정보 수정에  실패 하였습니다.');");
   		out.println("location.href='./customerMod.jsp';");
    	out.println("</script>"); 
    	dataLog.write_log(1, "customerModOk.jsp 오류 ", request);
	}
%>


