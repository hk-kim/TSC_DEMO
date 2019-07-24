<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "ensof.*" %>
<%@ page import = "ensof.common.*" %>
<jsp:useBean id = "handle" scope = "page" class = "ensof.FileHandler"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<ul>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
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
	String product = request.getParameter("product");

	ArrayList list = new ArrayList();
%>

<script language="JavaScript">
	function writeNoti(product){
		var company = write.company.value;
		var name = write.name.value;
		var email = write.email.value;
		var pcsNo = write.pcsNo.value;
		var product = write.productFlag.value;
		var title = write.title.value;
		var content = write.content.value;
		var country = write.countryFlag.value;
		
		write.name.focus();
		
		if(company.length < 1){
			alert("insert your compay");
			write.company.focus();
			return;
		}
		
		if(name.length < 1){
			alert("Please insert your name");
			write.name.focus();
			return;
		}
		
		if(email.length < 1){
			alert("Please insert your E-mail");
			write.email.focus();
			return;
		}
		
		if(!checkEmail(email)){
			alert("이메일 형식 틀림");
			write.email.focus();
			return;
		}
		
		if(pcsNo.length < 1){
			alert("Please insert your cell-phone number");
			write.pcsNo.focus();
			return;
		}
		
		if(!checkPhone(pcsNo)){
			alert("전화번호는 숫자만사용가능");
			write.pcsNo.focus();
			return;
		}
		
		if(product == "noSelect"){
			alert("select product");
			write.productFlag.focus();
			return;
		}
		
		if(title.length < 1){
			alert("Please insert your doument's title");
			write.title.focus();
			return;
		}
		
		if(country == "noSelect"){
			alert("select your country");
			write.countryFlag.focus();
			return;
		}
		
		if(content.length < 1){
			alert("Please insert your doument's content");
			write.content.focus();
			return;
		}
		
		
		if(confirm("공지사항을 등록하시겠습니까?")){
			write.action = "writeAction.jsp";
			write.submit();
		}
	}
	
	function goList(product){
		if(confirm("입력을 취소하시겠습니까?")){
			if(product == "ALL")
				write.action = "adminBoard.jsp";
			else
				write.action = "adminBoard.jsp?product="+product;
			write.submit();
		}
	}
	
	function contentMaxLength(){
		var chk = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_0123456789\~!@#$%^&*()_+| ";
		var con = write.content.value;
		var length = 0;
		
		con = con.replace(/\n/gi, "<br/>");
		
		for(var i = 0 ; i < con.length ; i++){
			var oneChar = con.charAt(i);
			if(chk.indexOf(oneChar) >= 0){
				length++;
			}
			else{
				length += 2;
			}
			
		}
		if(length > 2000){
			alert("2000자까지만 가능합니다");
			write.content.value = con.substring(0, 2000);
			write.content.value = replaceAll(write.content.value, "<br/>", "\n");
			write.content.focus();
		}
	}
		
	function contentMaxLength(){
		var str = write.content.value.length;
		var con = write.content.value;
		
		if (str >= 2000)
		{
			alert('최대 2000자 까지만 보낼 수 있습니다.');
			write.content.value = con.substring(0, 2000);
			write.content.focus();
		}
	}

	function checkPhone(num) {
		var str = num;
		for (i = 0; i <= str.length; i++) {
			var char = str.charCodeAt(i);
			if ((char < 48) ||(char > 57)) {
				return false;
			}
		}
		return true;
	}
	
	function checkEmail(email){
		var checkStr = /(\S+)@(\S+)\.(\S+)/;
		if(!checkStr.test(email)){
			return false;
		}
		return true;
	}
	
	function only_number() {
	   if (event.keyCode <= 47 || (event.keyCode > 57 &&  event.keyCode!=126)) 
		   event.returnValue = false;
	}

</script>

<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
	<ul>
		
		<form name="write" method="post">
		<div class="tbl_type1">
			<table border="0" cellpadding="4" cellspacing="1" width="700" bgcolor="white">
				<tr>
					<th>company</th>
					
					<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
						<input name=company type="text" size="20" maxlength="20" style="ime-mode: disabled">
					</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
						<input name=name type="text" size="20" maxlength="20" style="ime-mode: disabled">
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
						<input name=email type="text" size="20" maxlength="60" style="ime-mode: disabled">
					</td>
				</tr>
				
				<tr>
					<th>핸드폰</th>
					<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
						<input name=pcsNo type="text" size="20" maxlength="10" style="ime-mode: disabled" onkeypress = "only_number();">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
						<input name=password type="password" size="20" maxlength="10" style="ime-mode: disabled">
					</td>
				</tr>
				
				<tr>
					<th>제품종류</th>
					<td bgcolor="#ffffff" align="left" colspan=3>&nbsp;&nbsp;
						<select name="productFlag" id="productFlag">
							<option value="noSelect" selected="selected">-------------</option>
							<option value="ALL">ALL</option>
							<option value="SMT">SMT</option>
							<option value="MC*Cube">MC*Cube</option>
							<option value="OpenMCM">OpenMCM</option>
							<option value="ECM">ECM</option>
							<option value="TSCAN">TSCAN</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>나 라</th>
					<td bgcolor="#ffffff" align="left" colspan=3>&nbsp;&nbsp;
						<input name=countryFlag type="text" size="30" maxlength="100" style="ime-mode: disabled"/>&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				
				<tr>
					<th>제 목</th>
					<td bgcolor="#ffffff" align="left" colspan=3>&nbsp;&nbsp;
						<input name=title type="text" size="30" maxlength="100" style="ime-mode: disabled"/>&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				
				<tr>
					<th>비공개설정</th>
					<td bgcolor="#ffffff" align="left">&nbsp;&nbsp;
						남긴 글을 자신만 읽을 수 있게 설정하시겠습니까? 
						<input type = "checkbox" name = "noShareFlag" value = "false"/>
					</td>
				</tr>
				
				<tr>
					<th>내 용</th>
					<td bgcolor="#ffffff" align="left" colspan=3>&nbsp;&nbsp;
						<textarea name="content" cols="60" rows="8" style="ime-mode: disabled" onkeyup = "contentMaxLength();"></textarea>
					</td>
				</tr>
			</table>
			
			<table style="MARGIN: 10px 0px 0px" cellSpacing=0 cellPadding=0 width=700 border=0>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onClick="writeNoti('<%=product%>');">
						<input type="button" value="목록" onClick="goList('<%=product%>');">
					</td>
				</tr>
			</table>
			</div>
		</form>
	</ul>
</body>
</html>