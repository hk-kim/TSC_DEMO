<%
/*                                                                      */
/*      ���α׷���  : cms_logout.jsp		                               	*/
/*      ��      �� 	 : �α׾ƿ�  - CMS                                   		*/
/*      ��  ��  ��     : 2012. 07. 12 (�� �� ��)                                 */
/*      ��      ��      :                                                      */
/*                                                                      */
/************************************************************************/
%>
<%@ page language="java"  session="true"  contentType="text/html; charset=euc-kr" %>
<% 
	session.invalidate();

    out.println("<script language='javascript'>");
	out.println("alert('�α׾ƿ��Ǿ����ϴ�.');");    
    out.println("location.href='./cms_login.jsp'");
    out.println("</script>");        
%> 
 

 