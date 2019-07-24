<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :customerMod.jsp                                  	*/
/*      내      용 :   enSof 고객정보 수정 									*/
/*      작  성  일 : 	2012.07.06 한민우                     							*/
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
        
<table border="0" width="200">
 
<div id="wrap"> 

    <div id="content"> 

      <div class="con-area">

        <h3 class="sub">고객정보 수정 </h3>
        
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
<script language='javascript'>
	<!--
	
	function onSubmit() {
		var fm = document.frmPwd;
	        if(fm.resResel.value == "")
	        {
	        	alert("Reseller/Product Inquiry를 입력해 주세요");
	        	fm.resResel.focus();
	        	return ;
	        }
	        
	        if(fm.resA.value == "")
	        {
	        	alert("Amount을 입력해 주세요");
	        	fm.resA.focus();
	        	return ;
	        }
	        
	        if(fm.resPD.value == "")
	        {
	        	alert("구매일을 입력해 주세요");
	        	fm.resPD.focus();
	        	return ;
	        } else if (fm.resPD.value.length < 8) {
	        	alert("8자리를 입력해 주세요");
	        	fm.resPD.focus();
	        	return ;
	        }
	        
	        if(fm.resRD.value == "")
	        {
	        	alert("발행일을 입력해 주세요");
	        	fm.resRD.focus();
	        	return ;
	        } else if(fm.resRD.value.length < 8) {
	        	alert("8자리를 입력해 주세요");
	        	fm.resRD.focus();
	        	return ;
	        } else if (fm.resPD.value > fm.resRD.value) {
	        	alert("구매일보다 크거나 같은 값을 입력해 주세요");
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
		<div align="left">::: 등록 및 수정 :::</br>
		<font color="red" size="1"># 구매 일, 발행 일 입력은 아래와 같이 입력하시길 바랍니다</br>
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
		<th>구매 일</th>
		<td width="400" align="left" valign="middle">
		&nbsp;<input type="text" name="resPD" maxlength="8" size="40" value="" OnKeyPress="onlyNumber();" style='IME-MODE: disabled'>
		</td>
	</tr>
		<tr> 
		<th>발행 일</th>
		<td width="400" align="left" valign="middle">
		&nbsp;<input type="text" name="resRD" maxlength="8" size="40" value="" OnKeyPress="onlyNumber();" style='IME-MODE: disabled'>
		</td>
	</tr>
	<tr> 
		<td height="40" align="right" valign="middle" colspan="2" bgcolor="white"> 
		<p><font size="2">
		<input type="button" name="IDOK" value="  수   정  " width="108" height="41" onclick="onSubmit();"> 
		<input type="button" name="IDCANCEL" value="  취   소  " width="108" height="41" border="0" onClick="self.close();"></font></p>
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
