<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :cmsRegisterOk.jsp                                  	*/
/*      내      용 :   enSof_cms 계정처리									*/
/*      작  성  일 : 	2012.07.06 한민우                     							*/
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

	int x = 0; 
	
	boolean bl  = true;   
   
	x   =   handle.machArticleCms(mysqlmgr, enId);
	
	if(x == 0) { 

		bl  =	handle.insertArticleCms(mysqlmgr, enId, enPw); 
 
		if (bl){	 
			out.println("<script language='javascript'>");
   			out.println("alert('계정 정보가 추가 되었습니다.');");
   			out.println("location.href='./cmsRegisterList.jsp';");
    		out.println("</script>");  
		}else{
			out.println("<script language='javascript'>"); 
   			out.println("alert('계정 정보 추가에  실패 하였습니다.');");
   			out.println("location.href='./cmsRegister.jsp';");
    		out.println("</script>"); 
    		dataLog.write_log(1, "cmsRegisterOk.jsp 오류 ", request); 
		}
	} else { 
		out.println("<script language='javascript'>"); 
		out.println("alert('동일한 계정이 존재 합니다.');");
		out.println("location.href='./cmsRegister.jsp';");
		out.println("</script>"); 
	}
%>


