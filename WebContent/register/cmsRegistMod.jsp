<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� :cmsRegistMod.jsp                                  	*/
/*      ��      �� :   enSof cms ���� ����									*/
/*      ��  ��  �� : 	2012.07.19 �ѹο�                     							*/
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
   			alert('���̵� �Է��� �ֽñ� �ٶ��ϴ�');
   			frm.resId.focus();
   			return;
   		}
      		
		if (chk_num > 0 || chk_eng > 0) {
   			} else if (chk_num > 0 || chk_spmun > 0) {	
   			} else if (chk_eng > 0 || chk_spmun > 0) {
   			} else {
   		        alert('��й�ȣ�� Ư�����ڿ� ���� ������ 2���� �̻� ȥ���ؾ� �մϴ�');
   		 	    frm.resPasswd.value = "";
   				frm.resPasswd.focus();
   		    	return false;
   		}
   		
   		if(/[a-zA-Z]/.test(pw1) && /[0-9]/.test(pw1) && /[!,@,#,$,%,^,&,*,?,_,~]/.test(pw1)){
   			if(/[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{8,20}/.test(pw1)){
   			} else {
   				alert('��й�ȣ�� 3���� �̻� ���ս� 8~20���̻� �ԷµǾ� �մϴ�');
   				frm.resPasswd.value = "";
   				frm.resPasswd.focus();
   				 return false;
   			}
   		} else {
   			if(/[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{10,20}/.test(pw1)){	
   			} else {
   				 alert('��й�ȣ�� 2���� �̻� ���ս� 10~20���̻� �ԷµǾ� �մϴ�');
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

        <h3 class="sub">���� ���� ���� </h3>
        
		</div>
		
	</div>
	
</div>

	</table>

        <tr>
			<td>
				&nbsp;
			</td>
        </tr>
<!-- TITLE ���� �κ� ���� -->
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
		<th colspan="2"><div align="center" > ::: ���� ����  ::: </div></th>
	</tr>
	<tr>  
		<th>���̵�</th>
		<td width="300" align="left" valign="middle" bgcolor="#EFEFEF">
		&nbsp;<%=enId%>
		</td>
	</tr>  
	<tr> 
		<th>�н�����</th>
		<td width="300" align="left" valign="middle">
		&nbsp;<input type="password" name="resPasswd" maxlength="20" size="43" value="">
		</td>
	</tr>
	<tr> 
		<td height="40" align="right" valign="middle" colspan="2" bgcolor="white"> 
		<p><font size="2">
		<input type="button" name="IDOK" value="  ����  " width="108" height="41" onclick="onSubmit();"> 
		<input type="button" name="IDOK" value="  ���  " width="108" height="41" onclick="self.close();">
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
