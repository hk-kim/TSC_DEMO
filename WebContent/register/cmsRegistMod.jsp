<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :cmsRegistMod.jsp                                  	*/
/*      내      용 :   enSof cms 계정 수정									*/
/*      작  성  일 : 	2012.07.19 한민우                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>
<%@ page language="java"  session="true"  contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, java.io.*, java.sql.*" %>
<%@ page import = "ensof.common.*" %> 

<% 
	String enId 		= DataUtil.nullToSpace(request.getParameter("resId"));
	String enPw	 		= "";
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<script language='javascript'>
	<!--
	
	function onSubmit() {
		
		var frm = document.frmPwd;
		
		var pw1 = frm.resPasswd.value;
		var id  = frm.resId.value;
			
   		var chk_num = pw1.search(/[0-9]/g);
   		var chk_eng = pw1.search(/[a-z]/ig);
   		var chk_spmun = pw1.search(/[!,@,#,$,%,^,&,*,?,_,~]/g);
   		
   		if (id == ""){
   			alert('아이디를 입력해 주시길 바랍니다');
   			frm.resId.focus();
   			return;
   		}
      		
		if (chk_num > 0 || chk_eng > 0) {
   			} else if (chk_num > 0 || chk_spmun > 0) {	
   			} else if (chk_eng > 0 || chk_spmun > 0) {
   			} else {
   		        alert('비밀번호는 특수문자와 숫자 영문중 2가지 이상 혼용해야 합니다');
   		 	    frm.resPasswd.value = "";
   				frm.resPasswd.focus();
   		    	return false;
   		}
   		
   		if(/[a-zA-Z]/.test(pw1) && /[0-9]/.test(pw1) && /[!,@,#,$,%,^,&,*,?,_,~]/.test(pw1)){
   			if(/[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{8,20}/.test(pw1)){
   			} else {
   				alert('비밀번호는 3가지 이상 조합시 8~20자이상 입력되야 합니다');
   				frm.resPasswd.value = "";
   				frm.resPasswd.focus();
   				 return false;
   			}
   		} else {
   			if(/[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{10,20}/.test(pw1)){	
   			} else {
   				 alert('비밀번호는 2가지 이상 조합시 10~20자이상 입력되야 합니다');
   				 frm.resPasswd.value = "";
   				 frm.resPasswd.focus();
   				 return false;
   			}
   		}	
   		frm.submit();
	}

	//-->
       </script>

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

        <h3 class="sub">계정 정보 수정 </h3>
        
		</div>
		
	</div>
	
</div>

	</table>

        <tr>
			<td>
				&nbsp;
			</td>
        </tr>
<!-- TITLE 생성 부분 종료 -->
</head>
<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
        <div class="tbl_type1">
<table border="0" cellspacing="0" cellpadding="0" width="550">
<form method="post" action="./cmsRegistModOk.jsp" name="frmPwd" >
<input type="hidden" name="resId" value="<%=enId%>">
  <tr> 
    <td width="400" align="center" colspan="2" valign="top">
    <table border="0" cellpadding="4" cellspacing="1" width="550" bgcolor="white">        
	<tr> 
		<th colspan="2"><div align="center" > ::: 계정 수정  ::: </div></th>
	</tr>
	<tr>  
		<th>아이디</th>
		<td width="300" align="left" valign="middle" bgcolor="#EFEFEF">
		&nbsp;<%=enId%>
		</td>
	</tr>  
	<tr> 
		<th>패스워드</th>
		<td width="300" align="left" valign="middle">
		&nbsp;<input type="password" name="resPasswd" maxlength="20" size="43" value="">
		</td>
	</tr>
	<tr> 
		<td height="40" align="right" valign="middle" colspan="2" bgcolor="white"> 
		<p><font size="2">
		<input type="button" name="IDOK" value="  수정  " width="108" height="41" onclick="onSubmit();"> 
		<input type="button" name="IDOK" value="  취소  " width="108" height="41" onclick="self.close();">
		</td>
	</tr>
	</table>
	</td>
</tr>
</form> 
</table>
</div>
</ul>
</body>
</html>
