<%@ page language="java"  session="true"  contentType="text/html; charset=euc-kr" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     
    <title>:::Tscan Test Page:::</title> 
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">     
	
	<link rel="stylesheet" type="text/css" href="./css/common.css">
	<link rel="stylesheet" type="text/css" href="./css/main.css">
  
  </head> 
  
  <body topmargin="0" leftmargin="0" >
	<TABLE width=100% cellSpacing="0" cellPadding="0" border="0" bgcolor="white" background="./img/bg.gif">
	  <TR> 
	    <TD height=69><IMG vspace="5" src="./img/TScanTestLogo.png"></TD>
	  </TR>
	</TABLE>
  </body>
</html>	