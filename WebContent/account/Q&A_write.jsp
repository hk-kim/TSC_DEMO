<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%><%@ page import = "java.util.*" %><%@ page import = "ensof.*" %><%@ page import = "ensof.common.*" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<title></title> 
<link rel="stylesheet" type="text/css" href="../css/common.css" />
</head><%	String product = request.getParameter("product");	String flag    	 = "";	String enFirst 	 = "";	String enLast  	 = "";	String enCompany = "";	String enCountry = "";	String enAmount  = "";	String enEmail   = "";	ArrayList list = new ArrayList();	%><script language="JavaScript">var flag = 0;	function writeNoti(product){		var company = write.company.value;		var firstName = write.firstName.value;		var country = write.country.value;		var amount = write.amount.value;		var pcsNo = write.pcsNo.value;		var title = write.title.value;		var content = write.content.value;				write.company.focus();		if(company.length < 1){			alert("ȸ����� �Է��ϼ���");			write.company.focus();			return;		}			if(firstName.length < 1){			alert("�̸��� �Է��ϼ���");			write.firstName.focus();			return;		}				if(pcsNo.length < 1){			alert("��ȭ��ȣ�� �Է��ϼ���");			write.pcsNo.focus();			return;		}			if(amount.length < 1){			alert("���Աݾ��� �Է��ϼ���");			write.amount.focus();			return;		}			if(country.length < 1){			alert("�ּҸ� �Է��ϼ���");			write.country.focus();			return;		}			if(title.length < 1){			alert("��ǰ��ϻ����� �Է��ϼ���");			write.title.focus();			return;		}			if(content.length < 1){			alert("�߰� �Է»����� �Է��ϼ���");			write.content.focus();			return;		}			write.action = "Q&A_write_action.jsp";		write.submit();	}			function only_number() {		   if (event.keyCode <= 47 || (event.keyCode > 57 &&  event.keyCode!=126)) 			   event.returnValue = false;	} 		function locate(link){		 location.href = link ; 	}		function noEvent() {	    if (event.keyCode == 116) {	        event.keyCode= 2;	        return false;	    }	    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))	    {	        return false;	    }	}	document.onkeydown = noEvent;</script>
<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'><form name = "write" method = "post">
<!-- UI Object -->
<div id="wrap"> 
  <!-- container -->
  <div id="container"> 
    <!-- content -->
    <div id="content">     
        <!-- Q&A List -->
        <h3 class="mgt-25">�� ���� �Է�</h3>
        <div class="tbl_type1">
          <table summary="Q&amp;A">
            <col width="150" />
            <col />
            <tr>
              <th>ȸ���</th>
              <td><input name = "company" type="text" value="<%=enCompany %>"  title="name" class="input_txt" maxlength="20" /></td>
            </tr>
            <tr>
              <th>�̸�</th>
              <td><input name = "firstName" type="text" value="<%=enFirst %>"  title="name" class="input_txt" maxlength="20" /></td>
            </tr>
            <tr>
              <th><ul>
                  <li>��ȭ��ȣ</li>
                </ul></th>
              <td><input type="text"   class="input_txt" name = "pcsNo" maxlength="10"  onkeypress = "only_number();"/></td>
            </tr>
            <tr>
              <th>�ּ�</th>
              <td><input type="text" name="country" value="<%=enCountry %>" class="input_txt" style="width:300px" maxlength = "20" /></td>
            </tr>                        <tr>              <th>���Աݾ�</th>              <td><input type="text" name="amount" value="<%=enAmount %>" class="input_txt" style="width:300px" maxlength = "20" /></td>            </tr>
          </table>
        </div>
        <h3  class="mgt-25">��ǰ���� </h3>
        <div class="tbl_type1">
          <table summary="Q&A">
            <col width="150">
            <col>
            <tr>
              <th class="bg2">��ǰ����</th>
              <td><span class="radioSpan">
                <input name = "productFlag" value="S01" type="radio"  checked="checked"/>
                <label >���׻�ǰ</label>
                </span> <span class="radioSpan">
                <input name = "productFlag" value="S02" type="radio" />
                <label >�������ݻ�ǰ</label>
                </span> <span class="radioSpan">
                <input name = "productFlag" value="S03" type="radio" />
                <label >�����ǰ</label>
                </span> <span class="radioSpan">
                <input name = "productFlag" value="S04" type="radio" />
                <label >�ݵ��ǰ</label>
                </span> <span class="radioSpan">
                <input name = "productFlag" value="S05" type="radio" />
                <label >������ǰ</label>
                </span>
            </tr>
            <tr>
              <th>��ǰ��ϻ���/(���õ� ��ǰ�� ���εǴ� ����) </th>
              <td><input type="text" name="title" class="input_txt" style="width:98%;" maxlength = "20" /></td>
            </tr>
            <tr>
              <th>�߰��Է� ����</th>
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
