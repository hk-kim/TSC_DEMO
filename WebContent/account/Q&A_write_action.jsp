<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "ensof.*" %>
<%@ page import = "ensof.common.*" %>
<jsp:useBean id = "sqlmgr" scope = "application" class = "ensof.common.OracleConnectionManager"/>
<jsp:useBean id = "handle" scope = "page" class = "ensof.CopyOfBoardDbHandler"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%	
	DataLog dataLog = new DataLog();
	String company 	 = request.getParameter("company");
	String firstName = request.getParameter("firstName");
	String amount 	 = request.getParameter("amount");
	String pcsNo 	 = request.getParameter("pcsNo");
	String country 	 = request.getParameter("country");
	String product 	 = request.getParameter("productFlag");
	String title 	 = request.getParameter("title"); 
	Timestamp date   = new Timestamp(System.currentTimeMillis());
	String content 	 = request.getParameter("content");

	boolean flag = true;
	
	content = DataUtil.toHtml(content);

	flag = handle.insertArticle(sqlmgr, company,amount, firstName, pcsNo, title,  date, content, product, country);
	
	if (flag){	
		out.println("<script language='javascript'>");
   		out.println("alert('Your posts has been registered.');");
   		out.println("location.href='./Q&A.jsp?resflagmenu=2';");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>");
   		out.println("alert('Failed in registering posts.');");
   		out.println("location.href='./Q&A.jsp?resflagmenu=2';");
    	out.println("</script>"); 
    	dataLog.write_log(1, "Q & A Q&A_write_action.jsp :  쓰기 실패", request);
	}
%>
</html>