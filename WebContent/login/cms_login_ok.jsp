<%
/************************************************************************/
/*																		*/
/*      ���α׷���  : cms_login_ok.jsp	                               	*/
/*      ��      �� 	: �α׿�   - CMS											*/
/*      ��  ��  ��  : 2012.07.12 (�ѹο�)									*/
/*      ��      ��  : 														*/
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
