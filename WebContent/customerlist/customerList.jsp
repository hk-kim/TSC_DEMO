<%
/************************************************************************/
/*                                                                      */
/*      프로그램명 :customerList.jsp                                  	*/
/*      내      용 :   enSof 고객관리 테이블									*/
/*      작  성  일 : 	2012.07.06 한민우                     							*/
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

	// 고객 일반정보 변수  
	String regdate			= "";
	String enCompany		= "";
	String enCountry		= ""; 
	String enId				= ""; 
	String enPwd			= "";
	String enUrl			= "";
	String enEmail			= "";
	String enName			= "";
	String enTel			= ""; 
	String enSsn			= "";
	String enAccount		= "";
	Date					date;
	Date				 expdate;
	// License 정보 변수
	String enResel			= "";
	String enPurchaser		= "";
	String enAmount			= "";
	String enPurdate		= "";
	String enPub			= "";
	String enExpiration		= "";	 

	int count = 0; 

	Dataset ds = null; 
	 
	count = handle.getArticleCount(mysqlmgr);
	System.out.println("count : " + count);
	
	if(count > 0)  
	{
		 System.out.println("before ds : " + ds);
		ds = handle.getArticles(mysqlmgr);
		System.out.println("ds : " + ds);
	}
	

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
          <th><strong>no</strong></th>
          <th><strong>Updated</br>date</strong></th>
          <th><strong>Check Box</br>
          <input type=checkbox value="" onClick="chkAll();" name="mailAll"> </strong></th>
          <th><strong>Company</strong></th>
          <th><strong>Country</strong></th>
          <th><strong>EMAIL</strong></th>
          <th><strong>NAME</strong></th>
          <th><strong>Tel</strong></th>
          <th><strong>SSN</strong></th>
          <th><strong>ACCOUNT</strong></th>
           
          <th><strong>Reseller</strong></th>
          <th><strong>구매여부</strong></th>
          <th><strong>Amount</strong></th>
          <th><strong>구매일</strong></th>
          <th><strong>발행일</strong></th>
          <th><strong>만료일</strong></th>
           
          <th><strong>수정/삭제</strong></th>

        </tr>
        
 

<%
    if(count <= 0) { 
%> 

        <tr bgcolor="#FFFFFF">
          <td  height="25" align="center" colspan=18 valign="middle" bgcolor="#FFFFFF">
            <p><font size="2" face="돋움" colspan="18">등록된 고객 정보가 없습니다.</font></p></td>
        </tr>
<%	
    } else {
    	int j=1;
    	if(ds.getRowsize() > 0) {
       	 for(int i=0; i<ds.getRowsize(); i++) {
       		
       		System.out.println("DATE_ : " + ds.get(i, "DATE_"));
       		regdate 		= ds.get(i, "DATE_");
       		enName 			= ds.get(i, "E_NAME");
       		enEmail 		= ds.get(i, "E_MAIL");
       		enCompany		= ds.get(i, "COMPANY");
       		enCountry		= ds.get(i, "COUNTRY");
       		System.out.println("PHONE" + ds.get(i, "PHONE"));
       		enTel			= ds.get(i, "PHONE");
       		enSsn			= ds.get(i, "SSN");
       		enAccount		= ds.get(i, "ACCOUNT");
			System.out.println("RESEL_PL" + ds.get(i, "RESEL_PL"));
       		enResel			= ds.get(i, "RESEL_PL");
       		enAmount		= ds.get(i, "AMOUNT");
       		enPurdate		= ds.get(i, "REG_DATE");
       		enPub			= ds.get(i, "PUB_DATE");
 			
 			System.out.println("date = sdf.parse(regdate);");
 			date = sdf.parse(regdate);
 			System.out.println("enPub = DataUtil.nullToSpace(enPub);");
 			enPub = DataUtil.nullToSpace(enPub);
			System.out.println("enPub : "+enPub);
 			if(!enPub.equals("")){ 
 				//1년 후 날짜 계산
 				enExpiration = enPub.substring(0,4) + "-" + enPub.substring(4,6) + "-" + enPub.substring(6,8);
 				 
 				Calendar cal = Calendar.getInstance();
 				cal.setTime(sdf.parse(enExpiration));
 				cal.add(cal.DATE,+364); 
 				String  thisDayMiner = cal.get(cal.YEAR)+"-"+(cal.get(cal.MONTH)+1)+"-"+cal.get(cal.DATE);

 				expdate = sdf.parse(thisDayMiner);
 				//thisDayMiner = new java.text.SimpleDateFormat ("yyyy-MM-dd").format(date);

 				enExpiration = sdf.format(expdate);
 			} else {
 				enExpiration = "";
 			}

 			
 			if(date != null){
 				regdate = sdf.format(date);
 			}
%>

<form method="post" action="./email/customerEmail.jsp" name="Myform2" >         
        <tr> 
          <td height="25" align="center" valign="middle" ><%=j%></td>
          <td height="25" align="center" valign="middle" ><%=regdate%></td>
          <td height="12" align="center" valign="middle" >
		  <input type="checkbox" name="mailCheck" value="<%=enEmail%>"></td>
          <td height="25" align="center" valign="middle" ><%=enCompany%></td>
          <td height="25" align="center" valign="middle" ><%=enCountry%></td>
          <td height="25" align="center" valign="middle" ><%=enEmail%></td>
          <td height="25" align="center" valign="middle" ><%=enName%></td>
          <td height="25" align="center" valign="middle" ><%=enTel%></td>
          <td height="25" align="center" valign="middle" ><%=enSsn%></td>
          <td height="25" align="center" valign="middle" ><%=enAccount%></td>
          <td height="25" align="center" valign="middle" ><%=enResel%></td>
          <td height="25" align="center" valign="middle" >
          <%if(enPurdate == null || enPurdate.equals("")){%>
				X
		  <%} else {%>
				O 
		  <%}%>        
          </td>
          <td height="25" align="center" valign="middle" ><%=enAmount%></td>
          <td height="25" align="center" valign="middle" ><%=enPurdate%></td>
          <td height="25" align="center" valign="middle" ><%=enPub%></td>
          <td height="25" align="center" valign="middle" ><%=enExpiration%></td>
          <td height="25" align="center" valign="middle" >
          	<input type="button" value="수정" onClick="onMod('<%=enEmail%>');">
          	<input type="button" value="삭제" onClick="onDelete('<%=enEmail%>');">
          </td>
        </tr>
</form>

<% 			j++;
	    	}
    	}
	}
%>
</table></td></tr> 
<tr align="right">
	<td></br>
		<input type="button" value="Excel 저장" onClick="excel();">
		<input type="button" value="메일발송" onClick="chkEmail();">
	</td>
</tr>

<form method="post" name="cusDel">
	<input type="hidden" name="resCompany" value="<%=enCompany %>">
</form>
<form method="post" name="Myform">
	<input type="hidden" name="count" value="<%=count %>">
</form>
</table>
</div>
</ul>
</body>
</html>
