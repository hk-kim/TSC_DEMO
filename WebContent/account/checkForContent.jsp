<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date" %> 
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "ensof.*" %>
<%@ page import = "ensof.common.*" %>
<jsp:useBean id = "sqlmgr" scope = "application" class = "ensof.common.OracleConnectionManager"/>
<jsp:useBean id = "handle" scope = "page" class = "ensof.CopyOfBoardDbHandler"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/popup.css">
<title>Untitled Document</title>
</head>

<% 
	int nWidthSize		= 420;
	int nHightSize		= 370;	

	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String product = request.getParameter("product");
	String flag = request.getParameter("resFlag");
	String enSearch= DataUtil.nullToSpace(request.getParameter("resSearch"));
	
	Dataset ds = null;
	String passWord = "";
	String email = "";
	
	ds = handle.getPassWord(sqlmgr, num);
	
	if(ds.getRowsize() > 0){
		passWord = ds.get(0, "PASSWD");
		email = ds.get(0, "B_EMAIL");
	}
%>

<script language = "JavaScript">
	function checkSubmit(passWord, num, pageNum, product, flag, enSearch){
		var str = document.checkForm.pass.value;
		if(str.length < 1){
			alert("input your password"); 
			checkForm.pass.focus();
			return;
		}
		if(str == passWord){
			opener.location.href = "Q&A_view.jsp?product="+product+"&num="+num+"&pageNum="+pageNum+"&resSearch="+enSearch+"&resFlag="+flag;
			window.close();
		}
		else{
			alert("incorrect password.");
			checkForm.pass.focus();
			return;
		}
	}
	
	function locate(link){
		 location.href = link ; 
	}
	
	function noEvent() {
	    if (event.keyCode == 116) {
	        event.keyCode= 2;
	        return false;
	    }
	    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
	    {
	        return false;
	    }
	}
	document.onkeydown = noEvent;
	
</script>
<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<form name = "checkForm" method = "post">
		<!-- popup size : 420px * 310px --> 
		<!--  Popup Contents -->
		<div id="popup_wrap" >
		  <div class="head">
		    <h1 class="title"><img src="../images/popup/title01.gif"  /></h1>
		    <span class="logo"></span> </div>
		  <div class="body">
		    <div class="cont "> 
		      <!--cont -->
		      <p  class="bul-st1"> <strong>Please input your password. </strong><br/>And then, you can modify or delete your post. If you forget your password or have any question, please feel free to contact us. </p>
		      <div class="box2">
		        <dl>
		          <dt>
		            <label>Passwd</label>
		          </dt>
		          <dd>
		            <input type="password"  name = "pass" maxlength="12" class="input_text" />
		          </dd>
		        </dl>
		      </div> 
		              <div class="btn" style="margin:0; border:0">
		              <a href = "javascript:checkSubmit('<%=passWord%>', '<%=num%>', '<%=pageNum%>', '<%=product%>', '<%=flag%>', '<%=enSearch%>');"><img src="../images/btn/btn_confirm.gif" alt="Confirm" /></a> 
		             <td><a href = "javascript:self.close();"><img src="../images/btn/btn_cancel.gif" alt="Cancel" /></a></div>
		      <!-- //cont --> 
		    </div>
		    <!-- // body --> 
		  </div>
		</form>
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