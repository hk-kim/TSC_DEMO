<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :main.jsp                                  			*/
/*      내      용 :   enSof_cms Main										*/
/*      작  성  일 : 	2012.07.12 한민우                     							*/ 
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>
<%@ page language="java"  session="true"  contentType="text/html; charset=euc-kr" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html> 
<head> 
<title>:::Tscan Test Page:::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>   
<%
String loginf	= request.getParameter("loginflag");

String DIRURL="";

if ( session.getAttribute("SessionID") != null) {

		DIRURL = "./customerlist/customerList.jsp";	
} else {
	if(loginf == null || loginf.equals("")){
		out.println("<script language='javascript'>");
		out.println("top.location.href = './login/cms_login.jsp';");
		out.println("</script>");
	    return;
	}else{
		DIRURL = "./customerlist/customerList.jsp";
	}

}
 %>
<frameset rows="68,*" frameborder="yes">
  <frame src="top.jsp" name="topFrame" scrolling="no" noresize >
  <frameset cols="185,*" frameborder="yes">
    <frame src="left.jsp" name="leftFrame" scrolling="no" noresize >			
	<frameset frameborder="NO" >
		<frame src="<%=DIRURL %>" name="mainFrame">
	</frameset> 
  </frameset>
</frameset>
<noframes>   
<body>
</body>
</noframes>

</html>