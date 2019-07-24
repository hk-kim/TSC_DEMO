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
<ul> 
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

        <h3 class="sub">�Խù� �׽�Ʈ </h3>
        
		</div>
		
	</div>
	
</div>

	</table>
	<!-- TITLE ���� �κ� ���� -->
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
	
	if(product == null){
		product = "ALL";
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Dataset ds = null;
	ds = handle.getArticle(sqlmgr, num);

	String articleNum = "";
	String articleCount = "";
	String articleName = "";
	String articleDate = "";
	String articleNotiType = "";
	String articleTitle = "";
	String articleEmail = "";
	String articleContent = "";
	String productFlag = "";
	String company= "";
	String country = "";
	Date date = null;
	
	if(flag.equals("1")){
		if (ds.getRowsize() > 0) {
			articleNum = ds.get(0, "SEQ");
			articleCount = ds.get(0, "B_CNT");
			articleName = ds.get(0, "B_NAME");
			articleDate = ds.get(0, "B_DATE");
			articleNotiType = ds.get(0, "NOTICEFLAG");
			articleTitle = ds.get(0, "B_TITLE");
			articleEmail = ds.get(0, "B_EMAIL");
			articleContent = ds.get(0, "B_CONTENT");
			company = ds.get(0, "COMPANY");
			country= ds.get(0, "COUNTRY");
			productFlag =ds.get(0, "PRODUCT");
			if(productFlag.equals(""))
				productFlag = "ALL";
		}
		date = sdf.parse(articleDate);
		articleDate = sdf.format(date);
	} else {
		if (ds.getRowsize() > 0) {
			articleNum = ds.get(0, "SEQ");
			articleCount = ds.get(0, "B_CNT");
			articleName = "ensof_admin";
			articleDate = ds.get(0, "B_REF_DATE");
			articleNotiType = ds.get(0, "NOTICEFLAG");
			articleTitle = ds.get(0, "B_TITLE");
			company = ds.get(0, "COMPANY");
			country= ds.get(0, "COUNTRY");
			articleEmail = ds.get(0, "B_EMAIL");
			articleContent = ds.get(0, "B_REF_CONTENT");
			productFlag = ds.get(0, "PRODUCT");
		}
	}

	
	articleContent = DataUtil.toHtml(articleContent);

%>

<script language = "JavaScript">
	function updateSubmit(articleNum, pageNum, product,flag){
		if(confirm("�Խù��� ���� �Ͻðڽ��ϱ�?")){
			contentForm.action = "updateForm.jsp?product="+product+"&num="+articleNum+"&pageNum="+pageNum+"&resFlag="+flag;
		}
		contentForm.submit();
	}
	
	function deleteSubmit(articleNum, pageNum, product,flag){
		if(confirm("�Խù��� ���� �Ͻðڽ��ϱ�?")){
			contentForm.action = "delete.jsp?product="+product+"&num="+articleNum+"&pageNum="+pageNum+"&resFlag="+flag;
		}
		contentForm.submit();
	}
	
	function commentSubmit(articleNum, pageNum, product){
		contentForm.action = "replyForm.jsp?product="+product+"&num="+articleNum+"&pageNum="+pageNum;
		contentForm.submit();
	}
	
	function listSubmit(pageNum, product){
		if(product == "ALL")
			contentForm.action = "adminBoard.jsp?pageNum="+pageNum;
		else
			contentForm.action = "adminProductBoard.jsp?product="+product+"&pageNum="+pageNum;
		contentForm.submit();
	}
</script>

<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
	<form name = "contentForm" method = "post">
	<div class="tbl_type1">
		<table border="0" cellpadding="5" cellspacing="1" width="700" bgcolor="white">
			<tr>
				<th>��ȣ</th>
				<td bgcolor="#ffffff" align="left"><%=articleNum%></td>
				
				<th>��ȸ��</th>
				<td bgcolor="#ffffff" align="left"><%=articleCount%></td>
			</tr>
			
			<tr>
				<th>�ۼ���</th>
				<td bgcolor="#ffffff" align="left" colspan=3>
					<strong> 
						<font color="blue" size="2"><%=articleName%>s</font>
					</strong>
				</td>
			</tr>
			
			<tr>
				<th>company</th>
				<td bgcolor="#ffffff" align="left" colspan=3>
					<strong> 
						<font color="blue" size="2" ><%=company%></font>
					</strong>
				</td>
			</tr>
			
			<tr>
				<th>country</th>
				<td bgcolor="#ffffff" align="left" colspan=3>
					<strong> 
						<font color="blue" size="2" ><%=country%></font>
					</strong>
				</td>
			</tr>
			
			<tr>
				<th>�����</th>
				<td bgcolor="#ffffff" align="left" colspan=3><%=articleDate%></td>

			</tr>
			
			<tr>
				<th>�� ��</th>
				<td bgcolor="#ffffff" align="left" colspan=3><%=articleTitle%></td>
			</tr>
			
			<tr>
				<th>EMAIL</th>
				<td bgcolor="#ffffff" align="left" colspan=3><%=articleEmail%></td>
			
			<tr>
				<th>��ǰ ����</th>
				<td bgcolor="#ffffff" align="left" colspan=3><%=productFlag%></td>
			</tr>
			
			<tr>
				<th>�� ��</th>
				<td bgcolor="#ffffff" align="left" colspan=3><%=articleContent%></td>
			</tr>
			 
			<tr>
				<td bgcolor=white colspan=4>
					<input type="button" value="����" onClick="updateSubmit('<%=articleNum%>', '<%=pageNum%>', '<%=product%>','<%=flag%>');">
					<input type="button" value="����" onClick="deleteSubmit('<%=articleNum%>', '<%=pageNum%>', '<%=product%>','<%=flag%>');">
				<%
				if(flag.equals("1")){
				%>
					<input type="button" value="�亯" onClick="commentSubmit('<%=articleNum%>', '<%=pageNum%>', '<%=product%>');">
				<%
				}
				%>
					<input type="button" value="��Ϻ���" onClick="listSubmit('<%=pageNum%>', '<%=product%>');">
				</td>
			</tr>
		</table>
</div>
	</form>
	</ul>
</body>
</html>