<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date" %> 
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ page import = "ensof.*" %>
<%@ page import = "ensof.common.*" %>

<jsp:useBean id = "sqlmgr" scope = "application" class = "ensof.common.OracleConnectionManager"/>
<jsp:useBean id = "handle" scope = "page" class = "ensof.BoardDbHandler"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>QnA 게시판</title>
</head>
  
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String product = request.getParameter("product");
	
	Dataset ds = null;
	String passWord = "";
	String email = "";
	
	ds = handle.getPassWord(sqlmgr, num);
	
	if(ds.getRowsize() > 0){
		passWord = ds.get(0, "PASSWD");
	}
%>

<script language = "JavaScript">
	function checkSubmit(passWord, num, pageNum, product){
		var str = document.checkForm.pass.value;
		if(str.length < 1){
			alert("비밀번호를 입력하세요");
			checkForm.pass.focus();
			return;
		}
		if(str == passWord){
			alert("비밀번호 일치");
			opener.location.href = "delete.jsp?product="+product+"&num="+num+"&pageNum="+pageNum;
			window.close();
		}
		else{
			alert("비밀번호가 일치하지 않습니다.");
			checkForm.pass.focus();
		}
	}
	
	function cancleDelete(product, num, pageNum){
		if(confirm("게시물 삭제를 취소하시겠습니까?")){
			if(product == "ALL")
				opener.location.href = "content.jsp?num="+num+"&pageNum="+pageNum;
			else
				opener.location.href = "content.jsp?product="+product+"&num="+num+"&pageNum="+pageNum;
		}
		window.close();
	}
</script>

<body>
	<form name="checkForm" method = POST>
		<table cellpadding = 0 cellspacing = 0 border = 0 align = "center">
			<tr>
				<td>password:</td>
				<td><input type = "password" name = "pass" size = 8 maxlength = 12 style="ime-mode: disabled"/></td>
			</tr>
			<tr>
				<td><a href = "#" onclick = "checkSubmit('<%=passWord%>', '<%=num%>', '<%=pageNum%>', '<%=product%>');">확인</a></td>
				<td><a href = "#" onclick = "cancleDelete('<%=product%>', '<%=num%>', '<%=pageNum%>');">취소</a></td>
			</tr>
		</table>
	</form>
</body>
</html>