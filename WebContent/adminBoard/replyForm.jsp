<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="ensof.*"%>
<%@ page import = "ensof.common.*" %>

<jsp:useBean id="sqlmgr" scope="application" class="ensof.common.OracleConnectionManager" />
<jsp:useBean id="handle" scope="page" class="ensof.BoardDbHandler" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
	<!-- TITLE ���� �κ� ���� -->
		<tr>
			<td>
				&nbsp;
			</td>
        </tr>
        <tr>
			<td>
				&nbsp;
			</td>
        </tr>
	<table border="0" width="150">

<div id="wrap"> 

    <div id="content"> 

      <div class="con-area">

        <h3 class="sub">Customer List </h3>
        
		</div>
		
	</div>
	
</div>

	</table>
	<!-- TITLE ���� �κ� ���� -->
</head>
</head>
<tr>
	<td>
		&nbsp;
	</td>
</tr>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum =Integer.parseInt(request.getParameter("pageNum"));
	
	String product = "";
	String title = "";
	String flag  = "";
%>

<script language = "JavaScript">
	function replySubmit(num, pageNum, product, flag){ 
		var title = replyForm.title.value;
		var content = replyForm.content.value;
		
		if(title < 1){
			alert("���� �Է�");
			return;
		}
		
		if(content < 1){
			alert("���� �Է�");
			return;
		}
		
		if(confirm("����� ����Ͻðڽ��ϱ�?")){
			replyForm.action = "replyAction.jsp?product="+product+"&num="+num+"&pageNum="+pageNum+"&flag="+flag;
			replyForm.submit();
		}
	}
	
	function contentMaxLength(){
		var str = replyForm.content.value.length;
		var con = replyForm.content.value;
		
		if (str >= 2000)
		{
			alert('�ִ� 2000�� ������ ���� �� �ֽ��ϴ�.');
			replyForm.content.value = con.substring(0, 2000);
			replyForm.content.focus();
		}
	}
	
	function goListSubmit(pageNum, product){
		if(confirm("��� ����� ����Ͻðڽ��ϱ�?")){
			if(product == "ALL")
				replyForm.action = "adminBoard.jsp?pageNum="+pageNum;
			else
				replyForm.action = "adminProductBoard.jsp?product="+product+"&pageNum="+pageNum;
			replyForm.submit();
		}
	}
</script>


<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
	<form name = "replyForm" method = POST>
	 <div class="tbl_type1">
		<table>
			<%
				Dataset ds = handle.getArticle(sqlmgr, num);
				
				if(ds.getRowsize() > 0){
					title = ds.get(0, "B_TITLE");
					flag  = ds.get(0, "NOTICEFLAG");
					product = ds.get(0, "PRODUCT");
					%>
					<tr>
						<td><input type = "text" class='input_txt' name = "title" value = "answer : <%=title.replace("question : ","")%>" style="ime-mode: disabled"/></td>
					</tr>
					<tr>
						<td><textarea name = "content" cols="60" rows="8" style="ime-mode: disabled" onkeyup = "contentMaxLength();"></textarea></td>
					</tr>
					<tr>
						<td><input type="button" value="���ϱ�" onClick="replySubmit('<%=num%>', '<%=pageNum%>', '<%=product%>','<%=flag%>' );"></td>
						<td><input type="button" value="��Ϻ���" onClick="goListSubmit('<%=pageNum %>', '<%=product %>');"></td>
					</tr>
					<% 
				}
			%>
		</table>
		</div>
	</form>

</body>
</html>