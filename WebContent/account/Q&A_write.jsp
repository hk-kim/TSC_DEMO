<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%><%@ page import = "java.util.*" %><%@ page import = "ensof.*" %><%@ page import = "ensof.common.*" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<title></title> 
<link rel="stylesheet" type="text/css" href="../css/common.css" />
</head><%	String product = request.getParameter("product");	String flag    	 = "";	String enFirst 	 = "";	String enLast  	 = "";	String enCompany = "";	String enCountry = "";	String enAmount  = "";	String enEmail   = "";	ArrayList list = new ArrayList();	%><script language="JavaScript">var flag = 0;	function writeNoti(product){		var company = write.company.value;		var firstName = write.firstName.value;		var country = write.country.value;		var amount = write.amount.value;		var pcsNo = write.pcsNo.value;		var title = write.title.value;		var content = write.content.value;				write.company.focus();		if(company.length < 1){			alert("회사명을 입력하세요");			write.company.focus();			return;		}			if(firstName.length < 1){			alert("이름을 입력하세요");			write.firstName.focus();			return;		}				if(pcsNo.length < 1){			alert("전화번호를 입력하세요");			write.pcsNo.focus();			return;		}			if(amount.length < 1){			alert("가입금액을 입력하세요");			write.amount.focus();			return;		}			if(country.length < 1){			alert("주소를 입력하세요");			write.country.focus();			return;		}			if(title.length < 1){			alert("상품등록사항을 입력하세요");			write.title.focus();			return;		}			if(content.length < 1){			alert("추가 입력사항을 입력하세요");			write.content.focus();			return;		}			write.action = "Q&A_write_action.jsp";		write.submit();	}			function only_number() {		   if (event.keyCode <= 47 || (event.keyCode > 57 &&  event.keyCode!=126)) 			   event.returnValue = false;	} 		function locate(link){		 location.href = link ; 	}		function noEvent() {	    if (event.keyCode == 116) {	        event.keyCode= 2;	        return false;	    }	    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))	    {	        return false;	    }	}	document.onkeydown = noEvent;</script>
<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'><form name = "write" method = "post">
<!-- UI Object -->
<div id="wrap"> 
  <!-- container -->
  <div id="container"> 
    <!-- content -->
    <div id="content">     
        <!-- Q&A List -->
        <h3 class="mgt-25">고객 정보 입력</h3>
        <div class="tbl_type1">
          <table summary="Q&amp;A">
            <col width="150" />
            <col />
            <tr>
              <th>회사명</th>
              <td><input name = "company" type="text" value="<%=enCompany %>"  title="name" class="input_txt" maxlength="20" /></td>
            </tr>
            <tr>
              <th>이름</th>
              <td><input name = "firstName" type="text" value="<%=enFirst %>"  title="name" class="input_txt" maxlength="20" /></td>
            </tr>
            <tr>
              <th><ul>
                  <li>전화번호</li>
                </ul></th>
              <td><input type="text"   class="input_txt" name = "pcsNo" maxlength="10"  onkeypress = "only_number();"/></td>
            </tr>
            <tr>
              <th>주소</th>
              <td><input type="text" name="country" value="<%=enCountry %>" class="input_txt" style="width:300px" maxlength = "20" /></td>
            </tr>                        <tr>              <th>가입금액</th>              <td><input type="text" name="amount" value="<%=enAmount %>" class="input_txt" style="width:300px" maxlength = "20" /></td>            </tr>
          </table>
        </div>
        <h3  class="mgt-25">상품정보 </h3>
        <div class="tbl_type1">
          <table summary="Q&A">
            <col width="150">
            <col>
            <tr>
              <th class="bg2">상품선택</th>
              <td><span class="radioSpan">
                <input name = "productFlag" value="S01" type="radio"  checked="checked"/>
                <label >변액상품</label>
                </span> <span class="radioSpan">
                <input name = "productFlag" value="S02" type="radio" />
                <label >정기적금상품</label>
                </span> <span class="radioSpan">
                <input name = "productFlag" value="S03" type="radio" />
                <label >보험상품</label>
                </span> <span class="radioSpan">
                <input name = "productFlag" value="S04" type="radio" />
                <label >펀드상품</label>
                </span> <span class="radioSpan">
                <input name = "productFlag" value="S05" type="radio" />
                <label >묶음상품</label>
                </span>
            </tr>
            <tr>
              <th>상품등록사항/(선택된 상품과 매핑되는 정보) </th>
              <td><input type="text" name="title" class="input_txt" style="width:98%;" maxlength = "20" /></td>
            </tr>
            <tr>
              <th>추가입력 사항</th>
              <td><textarea name="content"  cols="50" rows="10"class="textarea"  style="width:100%;height:192px;" title="input_txt" ></textarea></td>
            </tr>
          </table>
        </div>
        <div class="btns"> 	        <a href = "javascript:writeNoti('<%=product%>');"><img src="../images/btn/btn_send.gif" width="67" height="24" alt="Send"></a> 	        <a href="javascript:locate('./Q&A.jsp?resflagmenu=2')"><img src="../images/btn/btn_cancel.gif" width="77" height="24" alt="Cancel"></a>         </div>
      </div>
    </div>
    <!-- //content --> 
  </div>
  <!-- //container --> 
</div>
<!-- //UI Object -->
</form>
</body>
</html>
