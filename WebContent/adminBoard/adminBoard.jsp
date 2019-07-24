<%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR" session = "true"%>
<%@ page import = "java.util.Date" %> 
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "ensof.*" %>
<%@ page import = "ensof.common.*" %>
<jsp:useBean id = "sqlmgr" scope = "application" class = "ensof.common.OracleConnectionManager"/>
<jsp:useBean id = "handle" scope = "page" class = "ensof.BoardDbHandler"/>

<%
	int pageSize = 10;
	String pageNum  = request.getParameter("pageNum");// ������ ��ȣ ����
	String product  = DataUtil.nullToSpace(request.getParameter("product"));
	String enSearch = DataUtil.nullToSpace(request.getParameter("resSearch"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String articleNum 	= ""; //�Խù� ��ȣ
	String articleTitle = ""; //�Խù� ���� 
	String articleName 	= ""; //�Խù� �ۼ���
	String articleDate 	= ""; //�Խù� �ۼ� ����
	String articleCount = ""; // �Խù� Ŭ�� Ƚ��
	String articleRef 	= "";
	String articleFlag 	= "";
	String refContent 	= "";
	String refSeq 		= "";
	String refDate 		= "";
	String Product		= "";

	Date date = null;
	
	int count = 0; // �ϹݰԽù� ����
	int articleListCount = 0;
	int currentPage = 0;
	int total = 0;
	
	Dataset ds = null;
	
	if(pageNum == null)
	{
		pageNum = "1";  
	}
	
	if(product.equals("")){
		product = "ALL"; 
	} 
	
	currentPage = Integer.parseInt(pageNum);
	
	count = handle.getProductCount(sqlmgr, product, enSearch);
	if(count > 0){ 
		ds = handle.getProductArticle(sqlmgr, product, enSearch);
	} 
	
%> 

<script language = "JavaScript">
	function contentSubmit(num, pageNum, product, flag){
		qnaForm.action = "content.jsp?num="+num+"&pageNum="+pageNum+"&product="+product+"&resFlag="+flag;
		qnaForm.submit();
	}
	
	function writeButton(product){
		qnaForm.action = "writeForm.jsp?product="+product;
		qnaForm.submit();
	}
	 
	function productFlagButton(){
		var obj = document.getElementById("productFlag"); 
		var index = obj.options.selectedIndex;
		var product = obj.options[index].value;
		
		qnaForm.action = "adminBoard.jsp?product="+product;
		qnaForm.submit();
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<ul>
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
<tr>
	<td>
		&nbsp; 
	</td>
</tr>
<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
	<form name = "qnaForm" method = POST>
	<div class="tbl_type1">
		<table width = "200">
			<tr>
				<td>
				<select name="productFlag" id = "productFlag" onchange = "productFlagButton();">
					<option value="ALL" <%="ALL".equals(product) ? "selected" : "" %>>ALL</option>
					<option value="SMT" <%="SMT".equals(product) ? "selected" : "" %>>SMT</option>
					<option value="MC*Cube" <%="MC*Cube".equals(product) ? "selected" : "" %>>MC*Cube</option>
					<option value="OpenMCM" <%="OpenMCM".equals(product) ? "selected" : "" %>>OpenMCM</option>
					<option value="ECM" <%="ECM".equals(product) ? "selected" : "" %>>ECM</option>
					<option value="TSCAN" <%="TSCAN".equals(product) ? "selected" : "" %>>TSCAN</option>
				</select>
				</td>
				<td align = "right"><input type = "button" value = "�۾���" onclick = "writeButton('<%=product%>');"/></td>
			</tr>
		</table>
		
		<table border="0" width="1000" cellpadding="4" cellspacing="1" bgcolor="white" style="table-layout:fixed">
			<tr bgcolor=white>
				<th>��ȣ</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>���⿩��</th>
				<th>�ۼ���</th>
				<th>��ȸ</th>
			</tr>	
			<%
       if(count == 0){
%>
			<tr height = "30" bgcolor="white">
				<td align = "center" width = "10%" colspan = "6">������ �����ϴ�.</td>
			</tr>
<% 
		}else{
			if(count > 0){
				total = ds.getRowsize();
				for(int i = total - (currentPage-1)*pageSize-1 ; ; i--){
					if(articleListCount == 10 || i < 0)
						break;
						articleNum = ds.get(i, "SEQ"); //�Խù� ��ȣ
						articleTitle = ds.get(i, "B_TITLE"); //�Խù� ����
						articleName = ds.get(i, "B_NAME"); //�Խù� �ۼ���
						articleDate = ds.get(i, "B_DATE"); //�Խù� �ۼ� ����
						articleCount = ds.get(i, "B_CNT"); // �Խù� Ŭ�� Ƚ��
						articleFlag = ds.get(i, "NOTICEFLAG");
						refSeq		= ds.get(i, "B_REF"); 
						Product		= ds.get(i, "PRODUCT"); 
						refDate		= ds.get(i, "B_REF_DATE"); 
						refContent	= ds.get(i, "B_REF_CONTENT");
						String yes = "Yes";
						articleListCount++;
						
						if(articleFlag.equals("4")){
							yes = "No";
						} 
						if(Product.equals("")){
							Product = "ALL";
						}
					
						date = sdf.parse(articleDate);
						
						if(!refDate.equals("")){
							refDate = refDate.substring(0,4)+"-"+refDate.substring(4,6)+"-"+refDate.substring(6,8);
						}
						%> 
						 
						<tr bgcolor="white">
			                <td><%=i+1%></td>
			                <td class=" title"><a href="#" onclick = "contentSubmit('<%=articleNum%>', '<%=pageNum%>', '<%=product%>','1');" >[<%=Product%>] question : &nbsp;<%=articleTitle%></a>
			                <td><%=articleName%></td>
			                <td><%=yes %></td>
			                <td><%=sdf.format(date)%></td>
			                <td><%=articleCount%></td>
		               </tr>
		               
		               <%
		               if(!refDate.equals("")){
		            	%>
		               <tr bgcolor="white"> 
			                <td></td>
			                <td class=" title"><a href="#" onclick = "contentSubmit('<%=articleNum%>', '<%=pageNum%>','<%=product%>','2');">answer : &nbsp;<%=articleTitle%></a></td>
			                <td>ensof_admin</td>
			                <td><%=yes %></td>
			                <td><%=refDate%></td>
			                <td></td>
		               </tr>
		            	   <%
		               }
					} 
				}
			}
	
			%>
		</table>
	<%
		if(count > 0){
			int paging = 5;
			int totalPage = count / pageSize + (count % pageSize == 0?0:1);
			int start = 0;
			int end = 0;
			
			if((currentPage - 1) / 5 == 0)
				start = 1;
			else
				start = (((currentPage - 1) / 5) * 5) + 1;
			
			if(start + 4 > totalPage)
				end = totalPage;
			else 
				end = start + 4;
			%> 
			</div>
			
			<table>
			
			<tr align="center">

			<%
			if(totalPage > 10){
			%>
				<td align = "center"><a href="adminBoard.jsp?product=<%=product%>">ó������</a></td>
			<%
			}
			
			if(totalPage > 5){
			%>
				<td align = "center"><a href = "adminBoard.jsp?product=<%=product %>&pageNum=<%=start-5 < 0 ? 1 : start-5%>">����</a>
			<%
			}
			%>
				
				<%
				for(int i = start ; i <= end ; i++){
					if(i > totalPage)
						break;
					%> 
					  <td><a href="adminBoard.jsp?product=<%=product%>&pageNum=<%=i%>">
					  <%
					  if(i==currentPage){
						  %><font color="red"><strong>[<%=i%>]</strong></font><%
						  continue;
					  }
					  %><%= i %></a></td><%
				}	
				%>
				
			<%
			if(totalPage > 5){
			%>
				<td align = "center"><a href = "adminBoard.jsp?product=<%=product %>&pageNum=<%=start+5 > totalPage ? totalPage : start+5%>">����</a>
			<%
			}
			if(totalPage > 10){
			%>
				<td><a href="adminBoard.jsp?product=<%=product %>&pageNum=<%=totalPage%>">������</a></td>
			<%
			}
			%>

			</tr>
			
		</table>
			<%
		}
		%>
		
	</form></ul>
</body>
</html>