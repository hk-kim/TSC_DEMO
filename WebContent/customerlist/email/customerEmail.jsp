<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� :customerEmail.jsp                                  	*/
/*      ��      �� :   enSof ���Ϲ߼� ��										*/
/*      ��  ��  �� : 	2012.07.06 �ѹο�                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%> 
<%@ page language="java" session="true" contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*, java.io.*, java.sql.*" %>
<%@ page import = "ensof.common.*" %>
 
<% 
	String enEmailAddress = request.getParameter("resEmail");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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

        <h3 class="sub"> ::: Email ::: </h3>
        
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
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="../../css/common.css" />
	<script language='javascript'>
	<!--
	
	function onEmail() {
		var fm = document.Myform;
		
	        if(fm.resFrom.value == "")
	        {
	        	alert("������ ����� �Է��� �ּ���");
	        	fm.resFrom.focus();
	        	return ;
	        }
	        
	        if(fm.resTo.value == "")
	        {
	        	alert("�޴� ����� �Է� �Ǿ�� �մϴ�");
	        	fm.resTo.focus();
	        	return ;
	        }
	        
	        if(fm.resSubject.value == "")
	        {
	        	alert("������ �Է��� �ּ���");
	        	fm.resSubject.focus();
	        	return ;
	        } 
	        
	        if(fm.resContent.value == "")
	        {
	        	alert("������ �Է��� �ּ���");
	        	fm.resContent.focus();
	        	return ;
	        }

	        fm.submit();
	} 
	
	//-->
       </script>
</head> 

<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<div class="tbl_type1">
<table border="0" cellspacing="0" cellpadding="0" width="700">
<form method="post" action="./customerEmailOk.jsp" name="Myform" >
  <tr> 
    <td width="700" align="center" colspan="2" valign="top">
    <table border="0" cellpadding="4" cellspacing="1" width="700" bgcolor="white">        
	<tr align="right" bgcolor="white"> 
		<th colspan="2"><div align="center">::: �̸��� �߼� :::</div></th>
	</tr>
	<tr>  
		<th>������ ���</th>
		<td width="500" align="left" valign="middle" bgcolor="#EFEFEF">
		&nbsp;<input type="text" name="resFrom" size="75" value="">
		</td>
	</tr>
	<tr>  
		<th>�޴� ���</th>
		<td width="500" align="left" valign="middle" bgcolor="#EFEFEF">
		&nbsp;<input type="text" name="resTo" size="75" value="<%=enEmailAddress%>">
		</td>
	</tr>
		<tr> 
		<th>�� ��</th>
		<td width="500" align="left" valign="middle" bgcolor="#EFEFEF">
		&nbsp;<input type="text" name="resSubject" size="75" value="">
		</td>
	</tr>
		<tr> 
		<th>�� ��</th>
		<td width="500" align="left" valign="middle" bgcolor="#EFEFEF">
		&nbsp;<textarea name="resContent" cols="74" rows="8"></textarea>
		</td>
	</tr> 
	<tr> 
		<td height="40" align="right" valign="middle" colspan="2" bgcolor="white"> 
		<p><font size="2">
		<input type="button" name="IDOK" value=" �߼� " width="108" height="41" onclick="onEmail();"> 
		</td>
	</tr>
	</table> 
	</td>
</tr>
<tr> 
	<td height="88" colspan="2">&nbsp;</td>
</tr>
</form> 
</table>
</div>

</body>
</html>
