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

<%  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	DataLog dataLog = new DataLog(); 
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String product = request.getParameter("product");
	String content = request.getParameter("content"); 
	Timestamp szData = new Timestamp(System.currentTimeMillis());
	
	
	
	String date = sdf.format(szData);

	boolean flag = true; 
	
	flag = handle.insertReply(sqlmgr, num, content, date);
	 
	
	if(flag){
		if(product.endsWith("ALL")){
			out.println("<script language='javascript'>");
			out.println("alert('답글이 등록되었습니다.');");
			out.println("location.href='./adminBoard.jsp?pageNum="+pageNum+"';");
			out.println("</script>"); 
		}else{
			out.println("<script language='javascript'>");
			out.println("alert('답글이 등록되었습니다.');"); 
			out.println("location.href='./adminBoard.jsp?product=ALL&pageNum="+pageNum+"';");
			out.println("</script>"); 
		}
	}
	else{
		out.println("<script language='javascript'>");
		out.println("alert('답글 등록에  실패 하였습니다.');");
		out.println("location.href='./adminBoard.jsp';"); 
		out.println("</script>"); 
		dataLog.write_log(1, "admin답글 등록 실패", request);
	}
%>
</html>