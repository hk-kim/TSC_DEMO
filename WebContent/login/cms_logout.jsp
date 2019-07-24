<%
/*                                                                      */
/*      프로그램명  : cms_logout.jsp		                               	*/
/*      내      용 	 : 로그아웃  - CMS                                   		*/
/*      작  성  일     : 2012. 07. 12 (한 민 우)                                 */
/*      수      정      :                                                      */
/*                                                                      */
/************************************************************************/
%>
<%@ page language="java"  session="true"  contentType="text/html; charset=euc-kr" %>
<% 
	session.invalidate();

    out.println("<script language='javascript'>");
	out.println("alert('로그아웃되었습니다.');");    
    out.println("location.href='./cms_login.jsp'");
    out.println("</script>");        
%> 
 

 