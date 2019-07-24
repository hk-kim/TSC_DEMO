<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%><%@ page import="java.util.Date"%><%@ page import="java.text.SimpleDateFormat"%><%@ page import="ensof.*"%><%@ page import= "ensof.common.*" %><jsp:useBean id="sqlmgr" scope="application" class="ensof.common.OracleConnectionManager" /><jsp:useBean id="handle" scope="page" class="ensof.CopyOfBoardDbHandler" />
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"><meta http-equiv="Content-Script-Type" content="text/javascript"><meta http-equiv="Content-Style-Type" content="text/css">
<title></title>
<link rel="stylesheet" type="text/css" href="../css/common.css" />
</head><%	int num 		= Integer.parseInt(request.getParameter("num"));	int pageNum 	= Integer.parseInt(request.getParameter("pageNum"));	String product  = DataUtil.nullToSpace(request.getParameter("product"));	String enSearch = DataUtil.nullToSpace(request.getParameter("resSearch"));	String Flag 	= request.getParameter("resFlag");		if(product == null){		product = "ALL";	}		Dataset ds = null;	ds = handle.getArticle(sqlmgr, num);	String articleNum = "";	String articleName = ""; 	String articleDate = "";	String articleTitle = "";	String articleContent = "";	String articleAmount = "";	String productFlag = "";	String enFlag = "";	Date date = null;	if (ds.getRowsize() > 0) {		articleNum = ds.get(0, "SEQ");		articleName = ds.get(0, "E_NAME");		articleAmount = ds.get(0, "E_BALANCE");		articleDate = ds.get(0, "E_DATE");		articleTitle = ds.get(0, "E_TITLE");		articleContent = ds.get(0, "E_CONTENT");		productFlag =ds.get(0, "E_PRODUCT");		if(productFlag.equals(""))			productFlag = "ALL"; 	}	articleContent = DataUtil.toHtml(articleContent);%><script language = "JavaScript">var flag = 0;	function updateSubmit(articleNum, pageNum, product, search){		contentForm.action = "Q&A_update.jsp?product="+product+"&num="+articleNum+"&pageNum="+pageNum+"&resSearch="+search+"&resflagmenu=2";		contentForm.submit();	}		function deleteSubmit(articleNum, pageNum, product){			contentForm.action = "delete.jsp?product="+product+"&num="+articleNum+"&pageNum="+pageNum;			contentForm.submit();	}		function listSubmit(pageNum, product, search){		if(product == "ALL"){			if(search == undefined)				contentForm.action = "Q&A.jsp?pageNum="+pageNum+"&resflagmenu=2";			else				contentForm.action = "Q&A.jsp?pageNum="+pageNum+"&resSearch="+search+"&resflagmenu=2";		}		else{			if(search == undefined){				contentForm.action = "Q&A.jsp?product="+product+"&pageNum="+pageNum+"&resflagmenu=2";			}			else{				contentForm.action = "Q&A.jsp?product="+product+"&pageNum="+pageNum+"&resSearch="+search+"&resflagmenu=2";			}		}		contentForm.submit();	}		function locate(link){		 location.href = link ; 	}		function noEvent() {	    if (event.keyCode == 116) {	        event.keyCode= 2;	        return false;	    }	    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))	    {	        return false;	    }	}	document.onkeydown = noEvent;	</script>
<!-- UI Object --><body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<div id="wrap"> 
  <!-- container -->
  <div id="container"> 
    <!-- content -->
    <div id="content"> 
      <div class="con-area" >
        <!-- Q&A List -->		<form name = "contentForm" method = "post">
        <div class="tbl_type1 mgt-15">
            <table summary="" class="board_view">
              <colgroup>
              <col style="width:100px;">
              <col>
              <col style="width:100px;">
              <col style="width:15%;">
              </colgroup>
              <thead >
                <tr>
                  <th scope="row" style="width:100px">상품명</th>
                  <td colspan="3"><%=articleTitle %> // <%=productFlag %> //                                     <%			                if(productFlag.equals("S01")){			                %>			                	변액상품			                <% 			                } else if (productFlag.equals("S02")){			                %>			                	정기적금상품			                <% 				                } else if (productFlag.equals("S03")){			                %>			                	보험상품			                <% 				                } else if (productFlag.equals("S04")){			                %>			                	펀드상품			                <% 				                } else if (productFlag.equals("S05")){			                %>			                	묶음상품			                <% 				                } else {			                %>			                	미등록 상품			                <%			                }			                %>			                </td>
                </tr>
                <tr>
                  <th scope="row" class="line">가입일</th>
                  <td class="line" ><%=articleDate %></td>                                                      <th scope="row" class="line">가입금액</th>                  <td class="line" ><%=articleAmount %></td>
                  <th scope="row" class="line">가입자명</th>
                  <td class="line"><%=articleName.replace("^", "") %></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td colspan="4" class="puts_wrap"><p><%=articleContent %></p></td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>        </form>
        <div class="btns">				<td><a href = "javascript:updateSubmit('<%=articleNum%>', '<%=pageNum%>', '<%=product%>', '<%=enSearch%>');">				<img src="../images/btn/btn_modify.gif" width="67" height="24" alt="modify"></a><td>				<!-- 				<td><a href = "deleteSubmit('<%=articleNum%>', '<%=pageNum%>', '<%=product%>', <%=enSearch%>');">delete</a><td> -->				<td><a href = "javascript:listSubmit('<%=pageNum%>','<%=product%>','<%=enSearch%>');"><img src="../images/btn/btn_list.gif" width="67" height="24" alt="list"></a> <td>        </div>
      </div>
    </div>
    <!-- //content --> 
  </div>
  <!-- //container --> 
</div>
<!-- //UI Object -->
</body>
</html>
