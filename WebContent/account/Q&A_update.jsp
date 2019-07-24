<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="ensof.*"%>
<%@ page import = "ensof.common.*" %> 
<jsp:useBean id="sqlmgr" scope="application" class="ensof.common.OracleConnectionManager" />
<jsp:useBean id="handle" scope="page" class="ensof.CopyOfBoardDbHandler" />

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<meta http-equiv="Content-Script-Type" content="text/javascript">

<meta http-equiv="Content-Style-Type" content="text/css">

<title></title>

<link rel="stylesheet" type="text/css" href="../css/common.css" />

</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String product = request.getParameter("product");
	String enSearch= DataUtil.nullToSpace(request.getParameter("resSearch"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Dataset ds = null;
	ds = handle.getArticle(sqlmgr, num);

	Date date = null;
	String articleNum = "";
	String articleCompany = "";
	String articleName = "";
	String articleAmount = "";
	String articlePcsNo = "";
	String articleCountry = "";
	String articleProduct = "";
	String articleTitle = "";
	String articleContent = "";
	
	boolean shareCheck = false;

	if (ds.getRowsize() > 0) {
		articleNum = ds.get(0, "SEQ");//
		articleCompany = ds.get(0, "E_COMPANY");//
		articleName = ds.get(0, "E_NAME");// 
		articleAmount = ds.get(0, "E_BALANCE");// 
		articlePcsNo = ds.get(0, "E_PHONE");
		articleCountry = ds.get(0, "E_COUNTRY");//
		articleProduct = ds.get(0, "E_PRODUCT");//
		articleTitle = ds.get(0, "E_TITLE");//
		articleContent = ds.get(0, "E_CONTENT");//
	}

	articleContent = DataUtil.toText(articleContent);
	
	
%>

<script language="JavaScript">
var flag = 0;
	function writeNoti(product, articleNum, pageNum, search){
		var company = update.company.value;
		var firstName = update.firstName.value;
		var country = update.country.value;
		var pcsNo = update.pcsNo.value;
		var amount = update.amount.value;
		var title = update.title.value;
		var content = update.content.value;
		
		update.company.focus();
		
		if(company.length < 1){
			alert("회사명을 입력하세요");
			update.company.focus();
			return;
		}
	
		if(firstName.length < 1){
			alert("이름을 입력하세요");
			write.firstName.focus();
			return;
		}
	
		if(pcsNo.length < 1){
			alert("전화번호를 입력하세요");
			update.pcsNo.focus();
			return;
		}
		
		if(amount.length < 1){
			alert("가입금액을 입력하세요");
			update.amount.focus();
			return;
		}
		
		if(country.length < 1){
			alert("주소를 입력하세요");
			update.country.focus();
			return;
		}
	
		if(title.length < 1){
			alert("상품등록사항을 입력하세요 ");
			write.title.focus();
			return;
		}
		
		if(content.length < 1){
			alert("추가 입력사항을 입력하세요");
			update.content.focus();
			return;
		}

		update.action = "Q&A_update_Action.jsp?product="+product+"&num="+articleNum+"&pageNum="+pageNum+"&resSearch="+search;
		update.submit();

	}
	
	function goList(product,pageNum){
		if(confirm("Would you cancel edit this posts?")){
			if(product == "ALL"){
					update.action = "Q&A.jsp?pageNum="+pageNum+"&resflagmenu=2";
			}else{
					update.action = "Q&A.jsp?product="+product+"&pageNum="+pageNum+"&resflagmenu=2";
			}
			update.submit();
		}
	}
	
	function only_number() {
		   if (event.keyCode <= 47 || (event.keyCode > 57 &&  event.keyCode!=126)) 
			   event.returnValue = false;
	}
	
	function locate(link){
		 location.href = link ; 
	}
	
	function noEvent() {
	    if (event.keyCode == 116) {
	        event.keyCode= 2;
	        return false;
	    }
	    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
	    {
	        return false;
	    }
	}
	document.onkeydown = noEvent;
	
</script>

<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<form name = "update" method = "post">

<!-- UI Object -->

<div id="wrap"> 

  <!-- container -->

  <div id="container"> 

    <!-- content -->

    <div id="content"> 

        <!-- Q&A List -->

        <h3 class="mgt-25">고객 정보</h3>

        <div class="tbl_type1">

          <table summary="Q&amp;A">

            <col width="150" />

            <col />

            <tr>

              <th>회사명</th>

              <td><input name = "company" type="text"  title="name" class="input_txt" maxlength="20" value = "<%=articleCompany%>" /></td>

            </tr>

            <tr>

              <th>이름</th>

              <td><input name = "firstName" type="text"  title="name" class="input_txt" maxlength="20" value = "<%=articleName%>" /></td>

            </tr>

            <tr>

              <th><ul>

                  <li>전화번호</li>

                </ul></th>

              <td><input type="text"   class="input_txt" name = "pcsNo" maxlength="10" value = "<%=articlePcsNo %>"  onkeypress = "only_number();"/></td>
            </tr>

            <tr>

              <th>주소</th>

              <td><input type="text" name="country"  class="input_txt" style="width:300px" maxlength = "20" value = "<%=articleCountry %>" /></td>

            </tr>
            
            <tr>

              <th>가입금액</th>

              <td><input type="text" name="amount"  class="input_txt" style="width:300px" maxlength = "20" value = "<%=articleAmount %>" /></td>

            </tr>

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

                <input name = "productFlag" value="S01" type="radio"  <%=articleProduct.equals("S01") ? "checked" : "" %>/>

                <label >변액상품</label>

                </span> 
                <span class="radioSpan">

                <input name = "productFlag" value="S02" type="radio" <%=articleProduct.equals("S02") ? "checked" : "" %>/>

                <label >정기적금상품</label>

                </span> 
                <span class="radioSpan">

                <input name = "productFlag" value="S03" type="radio" <%=articleProduct.equals("S03") ? "checked" : "" %>/>

                <label >보험상품</label>

                </span> 
                <span class="radioSpan">

                <input name = "productFlag" value="S04" type="radio" <%=articleProduct.equals("S04") ? "checked" : "" %>/>

                <label >펀드상품</label>

                </span> 
                <span class="radioSpan">

                <input name = "productFlag" value="S05" type="radio" <%=articleProduct.equals("S05") ? "checked" : "" %>/>

                <label >묶음상품</label>

                </span></td>

            </tr>

            <tr>

              <th>상품등록사항/(선택된 상품과 매핑되는 정보) </th>

              <td><input type="text" name="title" class="input_txt" style="width:98%;" value = "<%=articleTitle%>" maxlength = "20" /></td>

            </tr>

            <tr>

              <th>추가입력 사항</th>

              <td><textarea name="content"  cols="50" rows="10"class="textarea"  style="width:100%;height:192px;" title="input_txt" onkeyup = "contentMaxLength();"><%=articleContent %></textarea></td>

            </tr>

          </table>

        </div>
        </form>

        <div class="btns"> 
	        <a href = "javascript:writeNoti('<%=product%>', '<%=num%>', '<%=pageNum%>', '<%=enSearch%>');"><img src="../images/btn/btn_send.gif" width="67" height="24" alt="Send"></a> 
	        <a href = "javascript:goList('<%=product%>', '<%=pageNum%>');"><img src="../images/btn/btn_cancel.gif" width="77" height="24" alt="Cancel"></a> 
        </div>

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

