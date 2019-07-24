<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="ensof.common.*"%>
<%@ page import="ensof.*" %>

<jsp:useBean id = "sqlmgr" scope = "application" class = "ensof.common.OracleConnectionManager"/>
<jsp:useBean id = "handle" scope = "page" class = "ensof.BoardDbHandler"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
 
<%
	DataLog dataLog = new DataLog();
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String product = request.getParameter("product");
	boolean flag = true;
	
	flag = handle.deleteArticle(sqlmgr, num);
	
	if(flag){
		if(product.endsWith("ALL")){
			out.println("<script language='javascript'>");
			out.println("alert('문의 사항이 삭제되었습니다.');");
			out.println("location.href='./adminBoard.jsp?pageNum="+pageNum+"&product="+product+"';");
			out.println("</script>"); 
		}
		else{
			out.println("<script language='javascript'>");
			out.println("alert('문의 사항이 삭제되었습니다.');");
			out.println("location.href='./adminBoard.jsp?product="+product+"&pageNum="+pageNum+"';");
			out.println("</script>"); 
		}
	}
	else{
		out.println("<script language='javascript'>");
		out.println("alert('문의 사항 삭제에  실패 하였습니다.');");
		out.println("location.href='./adminBoard.jsp';");
		out.println("</script>"); 
		dataLog.write_log(1, "문의 사항 삭제 실패 : ", request);
	}
%>
