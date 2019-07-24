<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :cmsRegisterList.jsp                                 	*/
/*      내      용 :   enSof cms 계정정보 리스트	     						*/
/*      작  성  일 : 	2012.07.19 한민우                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>
<%@ page language="java"  session="true"  contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, java.io.*, java.sql.*" %>
<%@ page import = "ensof.common.*" %> 
<jsp:useBean id="mysqlmgr" scope="application" class="ensof.common.OracleConnectionManager"/>
<jsp:useBean id="handle" scope="page" class="ensof.cms.AdminDbHandler"/>

<%  

	String enId = "";

	int count = 0; 

	Dataset ds = null; 
  
	count = handle.getAdminCount(mysqlmgr);
 
	if(count > 0)  
	{ 
		ds = handle.getAdminlist(mysqlmgr);
	}
 
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<script language='javascript'>
	<!--

	function del(id){

		document.frmPwd.action = "./cmsRegistDel.jsp?resId="+id;
		document.frmPwd.submit();
	}
	
	function mod(id){
		window.open("./cmsRegistMod.jsp?resId="+id ,"","width=650, height=350");
		document.frmPwd.submit();
	}
	
	//-->
       </script>
<!-- TITLE 생성 부분 시작 -->
<ul>
	<!-- TITLE 생성 부분 시작 -->
		<tr>
			<td>
				&nbsp;
			</td>
        </tr>
        <tr>
			<td>
				&nbsp;
			</td>
        </tr>
	<table border="0" width="150">

<div id="wrap"> 

    <div id="content"> 

      <div class="con-area">

        <h3 class="sub">관리자 계정 관리 </h3>
        
		</div>
		
	</div>
	
</div>

	</table>
	<!-- TITLE 생성 부분 종료 -->
        <tr>
			<td>
				&nbsp;
			</td>
        </tr>
</head>
<!-- TITLE 생성 부분 종료 -->

<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<div class="tbl_type1">
<table border="0" cellspacing="0" cellpadding="0" width="550">
<form method="post" name="frmPwd" > 
<td width="750" align="center" valign=top><table border="0" width="650" cellpadding="4" cellspacing="1" bgcolor="white" >	
        <tr align="left" bgcolor="white"> 
            <th colspan="2">
            	<div align="center"> 
            		- 계정 정보 관리 게시판 - 
            	</div>
            </th>	
        </tr>
        
        <tr> 
        	
        	<th>
        	
        			<div align="center"> 계정 </div>
        	
        	</th>
          	
          	<th>
          	
          			<div align="center"> 수정/삭제 </div>
          	
          	</th>

        </tr>
        
<%
    if(count <= 0) { 
%> 

        <tr> 
          <td  height="25" align="center" colspan=5 valign="middle" bgcolor="white"> 
            <p><font size="2" face="돋움">&nbsp;<br/>::: NO DATA!. :::<br/>&nbsp;</font></p>
          </td>
        </tr>
        
<%	
    } else {
    	
    	if(ds.getRowsize() > 0) {
       	 for(int i=0; i<ds.getRowsize(); i++) {	 
       		enId 		= ds.get(i, "ID");
%>
        <tr> 
                <td valign="middle" >계정 : <%=enId%>
                </td> 
                <td align="center" valign="middle" bgcolor="white">
                	<input type="button" onClick="mod('<%=enId%>');" value="수정">
                    <input type="button" onClick="del('<%=enId%>');" value="삭제"> 
                </td>
        </tr>
<% 
       	 	}
    	} 
    }
%>
	</table>
	</td>
</tr>
</form> 
</table>
</div>
</ul>
</body>
</html>
