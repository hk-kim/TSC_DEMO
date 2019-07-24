<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :customerList.jsp                                  	*/
/*      내      용 :   enSof 주소 정보 로드								*/
/*      작  성  일 : 	2019.02.18 한민우                     							*/
/*                                   									*/
/*                                                                      */
/************************************************************************/
%>
<%@ page language="java" session="true" contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, java.io.*, java.sql.*" %> 
<%@ page import = "ensof.common.*" %>    
<%@ page import = "java.util.Date" %>   
<%@ page import = "java.text.SimpleDateFormat" %>
<jsp:useBean id="mysqlmgr" scope="application" class="ensof.common.OracleConnectionManager"/>
<jsp:useBean id="handle" scope="page" class="ensof.RegisterDbHandler"/>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
<% 

	String zipcode  		= "";
	String sido     		= "";
	String sigungu  		= ""; 
	String eubmuen			= ""; 
	String dorocd			= "";
	String doronm			= "";
	String b_yn				= "";
	String belino1			= "";
	String belino2			= ""; 
	String belimgrno		= "";
	String belinm			= "";
 
	int count = 1;
	
	Dataset ds = null; 
	 

		ds = handle.getAddr(mysqlmgr);


%>

<script language="Javascript">
<!--
 
	function onMod(mod){
	
		var url = "./customerMod.jsp?resEmail=" + mod;

		window.open(url,'Mod','width=600,height=450');
	}
	
	function onDelete(del){
		document.cusDel.action = "./customerDel.jsp?resEmail=" + del;
		document.cusDel.submit();
		
	} 
	
	function excel(){
		var frm = document.Myform; 
		if( frm.count.value	<=	0)
        {
        	alert("저장할 리스트가 없습니다");
        	return ;
        }
		var act = frm.action;
	    frm.action = "./customerListExcel.jsp"; 
	    frm.submit(); 
	    frm.action = act;
	}
	
	function chkEmail(){
		var Ytrue = "";
		var Ntrue = "";
		obj = document.getElementsByName("mailCheck");
	    
		for(var i=0; i<obj.length;i++){
			if(obj[i].checked == true){
				Ytrue += obj[i].value+",";
			} else {
				Ntrue += obj[i].value+",";
			}
		}
		
		if(Ytrue == ""){
			alert("체크된 정보가 없습니다");
			return;
		}
		
		if (Ytrue.length > 0){
			Ytrue = Ytrue.substring(0, Ytrue.length-1);
		}

		var url = "./email/customerEmail.jsp?resEmail="+Ytrue;

		window.open(url,'email','width=720,height=490');
	}
	
	var checkflag = "false";
	
	function chkAll() {

		obj = document.getElementsByName("mailCheck");
		
			if(checkflag == "false"){
				for(var i=0; i<obj.length;i++){
					obj[i].checked = true; 
				}
				checkflag = "true";
				return;
			} else {
				for(var i=0; i<obj.length;i++){
					obj[i].checked = false; 
				}
				checkflag = "false";
				return;
			}
		
	}


	//////////////////////// 2차 개발시 적용////////////////////////////////////////////
	/*function onPasswd(flag, code, id) {
		var url = "";
		var title = "";
	 	url = "./UserPasswd.jsp?resFlag=" + flag + "&resCode=" + code + "&resID=" + id;
	
	 	if(flag == "1")
	 		title = "비밀번호수정";
	 	else
	 		title = "비밀번호등록";
	 	
	 	window.open(url,title,'width=420,height=195');
	}
	
	function pwdEncript(){
		if(confirm("비밀번호를 암호화 하시겠습니까?")){
			var url = "";
	       	url = "./PassEnc.jsp?";
	       	window.open(url,'PassEnc','width=420,height=180');
		}
	}*/
	//////////////////////////////////////////////////////////////////////////////////

//-->
</script>

<%

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
</head>
<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
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

        <h3 class="sub">Customer List </h3>
        
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
        <div class="tbl_type1">
<table  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><table width="800" border="0" cellpadding="4" cellspacing="1" bgcolor="white"> 
   
        <tr>
			<th><strong>zipcode</strong></th>
			<th><strong>sido</strong></th>
			<th><strong>sigungu</strong></th>
			<th><strong>eubmuen</strong></th>
			<th><strong>dorocd</strong></th>
			<th><strong>doronm</strong></th>
			<th><strong>b_yn</strong></th>
			<th><strong>belino1</strong></th>
			<th><strong>belino2</strong></th>
			<th><strong>belimgrno</strong></th>
			<th><strong>belinm</strong></th>
        </tr>
        
 

<%
    if(count <= 0) { 
%> 

        <tr bgcolor="#FFFFFF">
          <td  height="25" align="center" colspan=18 valign="middle" bgcolor="#FFFFFF">
            <p><font size="2" face="돋움" colspan="18">등록된 주소 정보가 없습니다.</font></p></td>
        </tr>
<%	
    } else {
    	int j=1;
    	if(ds.getRowsize() > 0) {
       	 for(int i=0; i<ds.getRowsize(); i++) {
       		zipcode  		= ds.get(i, "ZIPCODE");
       		sido     		= ds.get(i, "SIDO");
       		sigungu  		= ds.get(i, "SIGUNGU");
       		eubmuen			= ds.get(i, "EUBMUEN");
       		dorocd			= ds.get(i, "DOROCD");
       		doronm			= ds.get(i, "DORONM");
       		b_yn			= ds.get(i, "B_YN");
       		belino1			= ds.get(i, "BELINO1");
       		belino2			= ds.get(i, "BELINO2");
       		belimgrno		= ds.get(i, "BELIMGRNO");
       		belinm			= ds.get(i, "BELINM");       		
%>     
        <tr> 
			<td height="25" align="center" valign="middle" ><%=zipcode%></td>			
			<td height="25" align="center" valign="middle" ><%=sido%></td>
			<td height="25" align="center" valign="middle" ><%=sigungu%></td>
			<td height="25" align="center" valign="middle" ><%=eubmuen%></td>
			<td height="25" align="center" valign="middle" ><%=dorocd%></td>
			<td height="25" align="center" valign="middle" ><%=doronm%></td>
			<td height="25" align="center" valign="middle" ><%=b_yn%></td>
			<td height="25" align="center" valign="middle" ><%=belino1%></td>
			<td height="25" align="center" valign="middle" ><%=belino2%></td>
			<td height="25" align="center" valign="middle" ><%=belimgrno%></td>
			<td height="25" align="center" valign="middle" ><%=belinm%></td>
       </tr>

<%
	    	}
    	}
	}
%>
</table></td></tr> 

</table>
</div>
</ul>
</body>
</html>
