<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.Timestamp" %>

<%@ page import = "ensof.*" %>
<%@ page import = "ensof.common.*" %>

<jsp:useBean id = "sqlmgr" scope = "application" class = "ensof.common.OracleConnectionManager"/>
<jsp:useBean id = "handle" scope = "page" class = "ensof.BoardDbHandler"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	DataLog dagaLog = new DataLog();
	String company     = request.getParameter("company");
	String name        = request.getParameter("name");
	String email       = request.getParameter("email");
	String pcsNo       = request.getParameter("pcsNo");
	String password    = request.getParameter("password");
	String title       = request.getParameter("title");
	String searchFlag  = request.getParameter("searchFlag");
	Timestamp date     = new Timestamp(System.currentTimeMillis());
	String content     = request.getParameter("content");
	String productFlag = request.getParameter("productFlag");
	String countryFlag = request.getParameter("countryFlag");
	String noShareFlag = request.getParameter("noShareFlag");
	
	boolean flag = true;
	
	if(noShareFlag == null){
		noShareFlag = "true";
	}
	
	if(noShareFlag.equals("false")){
		searchFlag = "4";
	}
	
	
	content = DataUtil.toHtml(content);
	
	flag = handle.insertArticle(sqlmgr, company, name, email, pcsNo, password, title, searchFlag, date, content, productFlag, countryFlag);
	 
	if (flag){	
		out.println("<script language='javascript'>");
   		out.println("alert('공지 사항이 등록되었습니다.');");
   		out.println("location.href='./adminBoard.jsp';");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>");
   		out.println("alert('공지 등록에  실패 하였습니다.');");
   		out.println("location.href='./adminBoard.jsp';"); 
    	out.println("</script>"); 
    	dagaLog.write_log(1, "admin공지사항 등록 실패", request);
	}
%>
</html>