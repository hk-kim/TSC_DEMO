<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :cmsRegistDel.jsp                                  	*/
/*      내      용 :   enSof 계정정보 삭제처리							*/
/*      작  성  일 : 	2012.07.19 한민우                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>  
<%@ page contentType = "text/html; charset=euc-kr" %> 
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "ensof.common.*" %>
<jsp:useBean id="mysqlmgr" scope="application" class="ensof.common.OracleConnectionManager"/>
<jsp:useBean id="handle" scope="page" class="ensof.cms.AdminDbHandler"/>
<% request.setCharacterEncoding("euc-kr");%>
  
<%  
	DataLog dataLog 	= new DataLog();
	String enId 		= DataUtil.nullToSpace(request.getParameter("resId"));

	boolean bl  = true;    
	
	bl  =	handle.deleteAdmin(mysqlmgr, enId); 
   
	if (bl){	
		out.println("<script language='javascript'>");
   		out.println("alert('계정정보가 삭제되었습니다.');");
   		out.println("location.href='./cmsRegisterList.jsp';");
    	out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>");
   		out.println("alert('계정정보 삭제에 실패 하였습니다.');");
   		out.println("location.href='./cmsRegisterList.jsp';");
    	out.println("</script>");
    	dataLog.write_log(1, "cmsRegistDel.jsp 오류 ", request); 
	}
%> 


