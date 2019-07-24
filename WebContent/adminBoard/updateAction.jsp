<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import = "ensof.*" %>
<%@ page import="ensof.common.*"%>

<jsp:useBean id="sqlmgr" scope="application" class="ensof.common.OracleConnectionManager" />
<jsp:useBean id="handle" scope="page" class="ensof.BoardDbHandler" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<%
	DataLog dataLog = new DataLog();
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String product = request.getParameter("product");
	String company = request.getParameter("company");
	String country = request.getParameter("countryFlag");
	String articleFlag = DataUtil.nullToSpace(request.getParameter("noShareFlag"));
	String searchFlag = request.getParameter("searchFlag");
	String flagcheck = request.getParameter("resFlag");
	
	
	boolean flag = true; 
	
	content = DataUtil.toHtml(content);
	if(articleFlag.equals("false")){
		articleFlag = "4";
	}
	else if(articleFlag.equals("")){
		articleFlag = "1";
	}
	
	if(flagcheck.equals("1")){
		flag = handle.updateArticle(sqlmgr, title, articleFlag, content, num, company, country);
	} else {
		flag = handle.updateArticle(sqlmgr, num, content);
	}
	
	if(flag){
		if(product.endsWith("ALL")){
			out.println("<script language='javascript'>");
			out.println("alert('문의사항이 수정되었습니다.');");
			out.println("location.href='./adminBoard.jsp?num="+num+"&pageNum="+pageNum+"';");
			out.println("</script>"); 
		}
		else{
			out.println("<script language='javascript'>");
			out.println("alert('문의사항이 수정되었습니다.');");
			out.println("location.href='./adminBoard.jsp?num="+num+"&pageNum="+pageNum+"&product="+product+"';");
			out.println("</script>"); 
		}
	} 
	else{
		out.println("<script language='javascript'>");
		out.println("alert('공지사항 수정에  실패 하였습니다.');");
		out.println("location.href='./adminBoard.jsp';");
		out.println("</script>"); 
		dataLog.write_log(1, "admin공지사항 수정 실패", request);
	}
%>
</html>