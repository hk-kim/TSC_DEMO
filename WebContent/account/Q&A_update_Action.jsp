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

	DataLog dataLog 	= new DataLog();

	int num 			= Integer.parseInt(request.getParameter("num"));
	int pcsNo 			= Integer.parseInt(request.getParameter("pcsNo"));
	String pageNum 		= request.getParameter("pageNum");
	String product 		= request.getParameter("productFlag");
	String company 		= request.getParameter("company");
	String firstName	= request.getParameter("firstName");
	int amount 			= Integer.parseInt(request.getParameter("amount")); 
	String country 		= request.getParameter("country");
	String title 		= request.getParameter("title");
	String searchFlag 	= "0";
	String content 		= request.getParameter("content");
	String enSearch		= request.getParameter("resSearch");
	
	boolean flag = true;

	content = DataUtil.toHtml(content);  
	flag = handle.updateArticle(sqlmgr, num, amount, company, firstName, pcsNo, title, product, content, country);
	  
	if(flag){
		if(product.endsWith("ALL")){
			if(enSearch.equals("")){
				out.println("<script language='javascript'>");
				out.println("alert('Your posts has been modified.');");
				out.println("location.href='./Q&A.jsp';");
				out.println("</script>");
			}else{
				out.println("<script language='javascript'>");
				out.println("alert('Your posts has been modified.');");
				out.println("location.href='./Q&A.jsp';");
				out.println("</script>");
			}
		}else{
			if(enSearch.equals("")){
				out.println("<script language='javascript'>");
				out.println("alert('Your posts has been modified.');");
				out.println("location.href='./Q&A.jsp';");
				out.println("</script>"); 
			}else{
				out.println("<script language='javascript'>");
				out.println("alert('Your posts has been modified.');");
				out.println("location.href='./Q&A.jsp';");
				out.println("</script>"); 
			}
		}
	}else{ 
		out.println("<script language='javascript'>");
		out.println("alert('Failed in modifying posts .');");
		out.println("location.href='./Q&A_view.jsp?num="+num+"&pageNum="+pageNum+"&product="+product+"&resSearch="+enSearch+"';");
		out.println("</script>"); 
		dataLog.write_log(1, "Q & A 수정 실패 : updateAction.jsp", request);
	}
%>
</html>