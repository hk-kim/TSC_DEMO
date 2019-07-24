<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="ensof.*"%>
<%@ page import = "ensof.common.*" %>
<jsp:useBean id="sqlmgr" scope="application" class="ensof.common.OracleConnectionManager" />
<jsp:useBean id="handle" scope="page" class="ensof.BoardDbHandler" /> 
<jsp:useBean id = "fHandle" scope = "page" class = "ensof.FileHandler"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<ul>
	<!-- TITLE 생성 부분 시작 -->
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
	<!-- TITLE 생성 부분 종료 -->
</head>
<tr>
	<td>
		&nbsp;
	</td>
</tr>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String product = request.getParameter("product");
	String flag = request.getParameter("resFlag");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Dataset ds = null; 
	ds = handle.getArticle(sqlmgr, num);

	String articleNum = "";
	String articleCount = "";
	String articleREF = "";
	String articleName = "";
	String articleDate = "";
	String articleNotiType = "";
	String articleTitle = "";
	String company = "";
	String country = "";
	String articleContent = "";
	
	Date date = null;
	
	boolean shareCheck = false;
	boolean boardCheck = false;

	if(flag.equals("1")){
		if (ds.getRowsize() > 0) {
			articleNum = ds.get(0, "SEQ");
			articleCount = ds.get(0, "B_CNT");
			articleName = ds.get(0, "B_NAME");
			articleDate = ds.get(0, "B_DATE");
			articleNotiType = ds.get(0, "NOTICEFLAG");
			articleTitle = ds.get(0, "B_TITLE");
			company = ds.get(0, "COMPANY");
			country = ds.get(0, "COUNTRY");
			articleContent = ds.get(0, "B_CONTENT");
		}
		date = sdf.parse(articleDate);
		articleDate = sdf.format(date);
	} else {
		if (ds.getRowsize() > 0) {
			articleNum = ds.get(0, "SEQ");
			articleCount = ds.get(0, "B_CNT");
			articleName = "ensof_admin";
			articleDate = ds.get(0, "B_REF_DATE"); 
			company = ds.get(0, "COMPANY");
			country = ds.get(0, "COUNTRY");
			articleNotiType = ds.get(0, "NOTICEFLAG");
			articleTitle = ds.get(0, "B_TITLE");
			articleContent = ds.get(0, "B_REF_CONTENT");
		}
	}
	

	articleContent = DataUtil.toText(articleContent);
	
	if(articleNotiType.equals("4")){
		shareCheck = true;
	}
	else if(articleNotiType.equals("1")){
		boardCheck = true;
	}

%>

<script language = "JavaScript">
	function updateCompleteFormSubmit(articleNum, pageNum, product, flag){
		var title = updateWriteForm.title.value;
		var content= updateWriteForm.content.value;
		
		if(title.length < 1){
			alert("제목 입력");
			updateWriteForm.title.focus();
			return;
		}
		
		if(content.length < 1){
			alert("내용 입력");
			updateWriteForm.content.focus();
			return;
		}
		
		if(confirm("공지사항을 수정하시겠습니까?")){
			updateWriteForm.action = "updateAction.jsp?product="+product+"&num="+articleNum+"&pageNum="+pageNum+"&resFlag="+flag;
			updateWriteForm.submit();
		}
	}
	
	function contentMaxLength(){
		var str = updateWriteForm.content.value.length;
		var con = updateWriteForm.content.value;
		
		if (str >= 2000)
		{
			alert('최대 2000자 까지만 보낼 수 있습니다.');
			updateWriteForm.content.value = con.substring(0, 2000);
			updateWriteForm.content.focus();
		}
		
	}
	
	function updateListFormSubmit(pageNum, product){
		if(confirm("공지사항 수정을 취소하시겠습니까?")){
			if(product == "ALL")
				updateWriteForm.action = "adminBoard.jsp?pageNum="+pageNum;
			else
				updateWriteForm.action = "adminProductBoard.jsp?product="+product+"&pageNum="+pageNum;
			updateWriteForm.submit();
		}
	}
</script>

<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
	
	<form name="updateWriteForm" method=POST>
	<div class="tbl_type1">
		<table border="0" cellpadding="4" cellspacing="1" width="700" bgcolor="white">
			<tr>
				<th>번호</th>
				<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;<%=articleNum %></td>
				<th>조회수</th>
				<td bgcolor="#ffffff" align="left"><%=articleCount %></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
					<%=articleName %>
				</td>
				<th>등록일</th>
				<td bgcolor="#ffffff" align="left"><%=articleDate%></td>
			</tr>
			
			<tr>
				<th>company</th>
				<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
					<input name="company" type="text" value="<%=company %>" size="23" maxlength="20" style="ime-mode: disabled">
				</td>
				<th>country</th>
				<td bgcolor="#ffffff" align="left" colspan=3>&nbsp;&nbsp;
					<input name="countryFlag" type="text" value="<%=articleTitle %>" size="30" maxlength="100" style="ime-mode: disabled">
				</td>
			</tr>
			
			<tr>
				<th>제 목</th>
				<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
					<input name="title" type="text" value="<%=articleTitle %>" size="30" maxlength="100" style="ime-mode: disabled">
				</td>
				<td bgcolor="#ffffff"></td><td bgcolor="#ffffff"></td>
			</tr>
			
			<%
			if(articleREF.length() == 0){
				%>
				<tr align="right" bgcolor="#efefef">
					<th>비공개설정</th>
					<td colspan = "3" bgcolor="#ffffff" align="left">&nbsp;&nbsp;
						남긴 글을 자신만 읽을 수 있게 설정하시겠습니까? 
						<input type = "checkbox" name = "noShareFlag" value = "false" <%if(shareCheck == true){%>checked<%}%>/>
					</td>
				</tr>
				<%
			}
			%>
			
			<tr align="right" bgcolor="#efefef">
				<th>내 용</th>
				<td bgcolor="#ffffff" align="left" colspan=3>&nbsp; 
					<textarea name="content" cols="60" rows="7" style="ime-mode: disabled" onkeyup = "contentMaxLength();"><%=articleContent %></textarea>
				</td>
			</tr>
		</table>
		</div>
		<table style="MARGIN: 10px 0px 0px" cellSpacing=0 cellPadding=0 width=700 border=0>
			<tr>
				<td><input type="button" value="수정" onClick="updateCompleteFormSubmit('<%=articleNum%>', '<%=pageNum%>', '<%=product%>','<%=flag%>');"></td>
				<td><input type="button" value="목록" onClick="updateListFormSubmit('<%=pageNum%>', '<%=product%>');"></td> 
			</tr>
		</table>
	</form>
	</ul>
</body>
</html>