<%@ page language="java" contentType="text/html;charset=euc-kr" %><%@ page import="java.util.*" %> <%@ page import="java.io.*" %> <%@ page import="ensof.common.*" %> <jsp:useBean id="handle" scope="page" class="ensof.UploadHandler"/><jsp:useBean id="handler" scope="page" class="ensof.RegisterDbHandler"/><jsp:useBean id="mysqlmgr" scope="application" class="ensof.common.OracleConnectionManager"/><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><%	String flag 	= DataUtil.nullToSpace(request.getParameter("flag"));	String enOn		= DataUtil.nullToSpace(request.getParameter("resOn"));	String position = "";	String first 	= "";	String last 	= "";	String company 	= "";	String email 	= "";	String country 	= "";	String ssn 	= "";	String phone 	= "";	String account 	= "";	String Product 	= DataUtil.nullToSpace(request.getParameter("resProduct"));%><script type="text/javascript">function regist(){	var frm = document.eform;	if(frm.resfirst.value == ""){		alert("please! input first name");		frm.resfirst.focus();		return;   	}	if(frm.reslast.value == ""){		alert("please! input last name");		return;   	}	if(frm.rescompany.value == ""){		alert("please! input Company");		return;   	}	if(frm.resemail.value == ""){		alert("please! input Email");		return;   	}	if(frm.rescountry.value == ""){		alert("please! input country");		return;   	}		flag = 1;	eform.action = "registerOk.jsp";	eform.submit();}</script> 
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<title></title>
<link rel="stylesheet" type="text/css" href="../css/common.css" />
</head>
<body>
<!-- UI Object -->	<tr>			<td>				&nbsp;			</td>        </tr>        <tr>			<td>				&nbsp;			</td>        </tr>
<div id="wrap"> 
    <div id="content"> 
      <div class="con-area">
        <h3 class="sub">Customer Information </h3>
        <div class="tbl_type1">
<form method=post name = "eform"><input type="hidden" name="resMail"><input type="hidden" name="resProduct"><input type="hidden" name="remember" value="on"><input type="hidden" name="remember2" value="on"><input type="hidden" name="remember3" value="on"><input type="hidden" name="remember4" value="on"><input type="hidden" name="remember5" value="on">
            <table >
              <col width="140" />
              <col />
              <tr>
                <th>First name</th>
                <td>  <input type=text name='resfirst' value='<%=first %>' class='input_txt' size=20 maxlength="20"></td>
              </tr>
              <tr>
                <th>Last name</th>
                <td><input type=text name='reslast' value='<%=last %>' class='input_txt' size=20 maxlength="20"></td>
              </tr>
              <tr>
                <th>Company  name</th>
                <td><input type=text name='rescompany' value='<%=company %>' class='input_txt' size=20 ></td>
              </tr>
              <tr>
                <th>Title/position</th>
                <td><input type=text name='resposition' value='<%=position %>' class="input_txt" size=20 maxlength="30"></td>
              </tr>
              <tr>
                <th>이메일</th>
                 <td><input type=text name='resemail' value='<%=email %>' class="input_txt"  size=20 maxlength="30"></td>
              </tr>
              <tr>
                <th>지역</th>
                 <td><input type=text name='rescountry' value='<%=country %>' title="Occupation" class="input_txt" size=20 maxlength="20"></td>
              </tr>                            <tr>                <th>주민번호</th>                 <td><input type=text name='resssn' value='<%=ssn %>' title="Occupation" class="input_txt" size=20 maxlength="20"></td>              </tr>                            <tr>                <th>전화번호</th>                 <td><input type=text name='resphone' value='<%=phone %>' title="Occupation" class="input_txt" size=20 maxlength="20"></td>              </tr>                             <tr>                <th>계좌번호</th>                 <td><input type=text name='resaccount' value='<%=account %>' title="Occupation" class="input_txt" size=20 maxlength="20"></td>              </tr>              
            </table>
          </form>
          <div class="btn_submit"> <a href="javascript:regist();"><img src="../img/btn_submit.gif" ></a> </div>
        </div>

      </div>
    </div>
  </div>
  <!-- //content --> 
<!-- //UI Object -->
</body>
</html>
