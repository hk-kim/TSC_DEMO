<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :cmsRegistModOk.jsp                                  	*/
/*      내      용 :   enSof_cms 계정수정처리									*/
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
      
<%    
	DataLog dataLog 	= new DataLog(); 
	String enId 		= request.getParameter("resId");
	String enPw	 		= request.getParameter("resPasswd");

	boolean bl  = true;    
   
	bl  =	handle.setUpdatetAdmin(mysqlmgr, enId, enPw); 

	if (bl){	 
		out.println("<script language='javascript'>");
  		out.println("alert('계정 정보가 수정 되었습니다.');");
  	   	out.println("opener.location.reload();");
  	   	out.println("self.close();");
   		out.println("</script>"); 
	}else{
		out.println("<script language='javascript'>"); 
  		out.println("alert('계정 정보 수정에  실패 하였습니다.');");
  		out.println("location.href='./cmsRegisterMod.jsp?resId="+enId+"';");
   		out.println("</script>"); 
   		dataLog.write_log(1, "cmsRegistModOk.jsp 오류 ", request); 
	}

%>


