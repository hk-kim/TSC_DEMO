<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� :customerMod.jsp                                  	*/
/*      ��      �� :   enSof ������ ���� 									*/
/*      ��  ��  �� : 	2012.07.06 �ѹο�                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>
<%@ page language="java" session="true" contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*, java.io.*, java.sql.*" %>
<%@ page import = "ensof.common.*" %>   

<% 
	String enEmail	 		= request.getParameter("resEmail");
	String enResel	 		= "";
	String enAmount 		= "";
	String enRegist 		= "";
	String enPub	 		= "";
	
	int nWidthSize		= 600;
	int nHightSize		= 450;
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
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
        
<table border="0" width="200">
 
<div id="wrap"> 

    <div id="content"> 

      <div class="con-area">

        <h3 class="sub">������ ���� </h3>
        
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
<script language='javascript'>
	<!--
	
	function onSubmit() {
		var fm = document.frmPwd;
	        if(fm.resResel.value == "")
	        {
	        	alert("Reseller/Product Inquiry�� �Է��� �ּ���");
	        	fm.resResel.focus();
	        	return ;
	        }
	        
	        if(fm.resA.value == "")
	        {
	        	alert("Amount�� �Է��� �ּ���");
	        	fm.resA.focus();
	        	return ;
	        }
	        
	        if(fm.resPD.value == "")
	        {
	        	alert("�������� �Է��� �ּ���");
	        	fm.resPD.focus();
	        	return ;
	        } else if (fm.resPD.value.length < 8) {
	        	alert("8�ڸ��� �Է��� �ּ���");
	        	fm.resPD.focus();
	        	return ;
	        }
	        
	        if(fm.resRD.value == "")
	        {
	        	alert("�������� �Է��� �ּ���");
	        	fm.resRD.focus();
	        	return ;
	        } else if(fm.resRD.value.length < 8) {
	        	alert("8�ڸ��� �Է��� �ּ���");
	        	fm.resRD.focus();
	        	return ;
	        } else if (fm.resPD.value > fm.resRD.value) {
	        	alert("�����Ϻ��� ũ�ų� ���� ���� �Է��� �ּ���");
	        	fm.resRD.focus();
	        	return ;
	        }

	        fm.submit();
	}
	
	function onlyNumber() {
		  if ((event.keyCode < 48) || (57 < event.keyCode)) event.returnValue=false;
	}

	//-->
       </script>
</head>

<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<div class="tbl_type1">
<table border="0" cellspacing="0" cellpadding="0" width="550">
<form method="post" action="./customerModOk.jsp" name="frmPwd" >
<input type="hidden" name="resEmail" value="<%=enEmail%>">
  <tr> 
    <td width="400" align="center" colspan="2" valign="top">
    <table border="0" cellpadding="4" cellspacing="1" width="550" bgcolor="white">        
	<tr align="right" bgcolor="white"> 
		<th height="30" colspan="2" valign="middle">
		<div align="left">::: ��� �� ���� :::</br>
		<font color="red" size="1"># ���� ��, ���� �� �Է��� �Ʒ��� ���� �Է��Ͻñ� �ٶ��ϴ�</br>
		ex)20120405</font>
		</div></th>
	</tr>
	
	<tr>  
		<th>Reseller/Product Inquiry</font>
		</th>
		<td align="left" valign="middle">
		&nbsp;<input type="text" name="resResel" maxlength="30" size="40" value="" maxlength="30" style='IME-MODE: disabled'>
		</td>
	</tr>
	
	<tr> 
		<th>Amount</th>
		<td width="400" align="left" valign="middle">
		&nbsp;<input type="text" name="resA" maxlength="30" size="40" value="" maxlength="30" style='IME-MODE: disabled'>
		</td>
	</tr>
		<tr> 
		<th>���� ��</th>
		<td width="400" align="left" valign="middle">
		&nbsp;<input type="text" name="resPD" maxlength="8" size="40" value="" OnKeyPress="onlyNumber();" style='IME-MODE: disabled'>
		</td>
	</tr>
		<tr> 
		<th>���� ��</th>
		<td width="400" align="left" valign="middle">
		&nbsp;<input type="text" name="resRD" maxlength="8" size="40" value="" OnKeyPress="onlyNumber();" style='IME-MODE: disabled'>
		</td>
	</tr>
	<tr> 
		<td height="40" align="right" valign="middle" colspan="2" bgcolor="white"> 
		<p><font size="2">
		<input type="button" name="IDOK" value="  ��   ��  " width="108" height="41" onclick="onSubmit();"> 
		<input type="button" name="IDCANCEL" value="  ��   ��  " width="108" height="41" border="0" onClick="self.close();"></font></p>
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

<SCRIPT LANGUAGE="JavaScript">
<!--
if ((navigator.userAgent.indexOf("Windows NT 5.1")!=-1) && (navigator.userAgent.indexOf("SV1")!=-1)) { 
	window.resizeTo(<%=nWidthSize%>, <%=nHightSize%>+27);
} else { 
	window.resizeTo(<%=nWidthSize%>, <%=nHightSize%>);
}
//-->
</SCRIPT>

</body>
</html>
