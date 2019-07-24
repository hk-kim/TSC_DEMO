<%
/************************************************************************/
/*																		*/
/*      프로그램명  : cms_login_ok.jsp	                               	*/
/*      내      용 	: 로그온   - CMS											*/
/*      작  성  일  : 2012.07.12 (한민우)									*/
/*      수      정  : 														*/
/*																		*/
/************************************************************************/
%> 
<%@ page language="java"  session="true"  contentType="text/html; charset=euc-kr" %>
<%@ page import = "ensof.common.*"%>
<jsp:useBean id="cmsSession" scope="page" class="ensof.cms.CmsUserSession"/>
<jsp:useBean id="mysqlmgr" scope="application" class="ensof.common.OracleConnectionManager"/>
<jsp:useBean id="handle" scope="page" class="ensof.cms.AdminDbHandler" />
<% 
	DataLog dataLog = new DataLog();

	String userid	= DataUtil.XSSconvStr(request.getParameter("resID"));
	String loginf	= DataUtil.XSSconvStr(request.getParameter("loginflag"));
	  
	int tmpCnt		= 0;
	boolean blRst	= true;
	
	if (userid == null) userid = "";
if(loginf.equals("1")){
	session.setAttribute("SessionID",userid);
	response.sendRedirect("../main.jsp?loginflag=1");
}else{
	response.sendRedirect("../main.jsp?loginflag=1");
}
%>
