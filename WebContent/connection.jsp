<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 데이터베이스 연결을 테스트하는 테스트페이지입니다. -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>데이터베이스 연결 테스트 페이지</title>
	</head>
	<body>
	<%
		try
		{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/ORCL");
			//DataSource ds = (DataSource) init.lookup("DBTEST");
			
			Connection con = ds.getConnection();
			out.println("데이터베이스 연결에 성공하였습니다.");
			
		}
		catch(Exception e)
		{
			out.println("데이터베이스 연결에 실패하였습니다.");
			out.println("============> " + e.getMessage());
			out.println("==> " + e.getStackTrace());
		}
	%>
	</body>
</html>