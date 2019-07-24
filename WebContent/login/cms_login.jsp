<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">

	<script language="javascript"> 
	<!--  
	function submit_chk(fm,flag) {
		
		fm.loginflag.value = flag;
		
		if(flag == 1){
		    if(fm.resID.value=="") {
		    	alert("ID를 입력해주세요");
		    	fm.resID.focus(); 
		    	return; 
		    } 
		}
	
	    document.Myform.submit();
	}
	
	
	//-->
	</script>

<head>
<meta http-equiv="Content-Type" content="text/html;charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>TScan - Private Information Access Monitoring & Analysis Solution</title>
<link rel="stylesheet" type="text/css" href="style.css" />

<!-- jqwidgets jqxgrid -->
</head>
<form method='post' name='Myform' action='./cms_login_ok.jsp'>
<body>
<div id="login_wrap">
  <div class="loginBox">
  <h1>TScan Test Page</h1>
    <div class="login_cont">
    
      <ul class="login"> 
        <li>
          <label for="resID" class="idTxt">아이디</label>
          <input id="resID" name="resID" title="아이디입력" class="text" type="text" value=""/>
        </li>
      </ul>
			<button class="loginBtn1" tabindex="4" title="로그인" onclick="submit_chk(document.Myform,1)">로그인</button>
      		<button class="loginBtn2" tabindex="4" title="비로그인" onclick="submit_chk(document.Myform,2)">비로그인</button>           
    </div>
    <!-- // login_cont --> 
  </div>
  <!-- // loginBox --> 
  <!-- footer -->
  <div id="login_footer">
    <div class="copyright">Copyrights ⓒ 2012  ENSOF Technology  All Rights Reserved.</div>
  </div>
  <!-- // footer --> 
  
</div>
<input type="hidden" name="loginflag">
</body>
</form>
</html>
