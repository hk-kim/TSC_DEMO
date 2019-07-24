<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date" %> 
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "ensof.*" %>
<%@ page import = "ensof.common.*" %>
<jsp:useBean id = "sqlmgr" scope = "application" class = "ensof.common.OracleConnectionManager"/>
<jsp:useBean id = "handle" scope = "page" class = "ensof.CopyOfBoardDbHandler"/>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<title></title>
<link rel="stylesheet" type="text/css" href="../css/common.css" />
</head>
 
<%
	String pageNum 	= request.getParameter("pageNum");
	String product 	= DataUtil.nullToSpace(request.getParameter("product"));
	String enSearch	= DataUtil.nullToSpace(request.getParameter("resSearch"));
	String flag 	= request.getParameter("resflagmenu");
	int pageSize 	= 10;
	 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String articleNum = ""; 
	String articleTitle = ""; 
	String articleName = ""; 
	String articleDate = ""; 
	String articleAmount = "";
	String articleCount = "";
	String articleRef = "";
	String articleProduct = "";
	String articlePhone = "";
	String articleFlag = "";
	String refDate = "";
	String refseq  = "";
	String refContent = "";
	Date date = null;
	Date date2 = null;
	
	int articleListCount = 0;
	int countP = 0;
	int currentPage = 0;
	
	Dataset dsP = null;
	 
	if(pageNum == null){
		pageNum = "1";  
	}
	if(product.equals("")){
		product = "ALL";
	}
	
	currentPage = Integer.parseInt(pageNum);
	
	countP = handle.getProductCount(sqlmgr, product, enSearch);

	if(countP > 0){ 
		dsP = handle.getProductArticle(sqlmgr, product, enSearch);
	}
 
%>

<script language = "JavaScript">

var flag = 0;

	function productContentSubmit(num, pageNum, articleFlag, product, flag, enSearch){
		
		if(articleFlag == "4"){
			var url = "checkForContent.jsp?product="+product+"&num="+num+"&pageNum="+pageNum+"&resFlag="+flag+"&resSearch="+enSearch;
			var name = "popup";
			
			window.open(url, name, "width = 420, height = 310");
		}else{
			productQnaForm.action = "Q&A_view.jsp?product="+product+"&num="+num+"&pageNum="+pageNum+"&resFlag="+flag+"&resSearch="+enSearch;
			productQnaForm.submit();
		} 
	}

	function productFlagButton(){	

		var obj = document.getElementById("productFlag"); 
		var index = obj.options.selectedIndex;
		var product = obj.options[index].value;
		
		var resSearch = document.getElementById("resSearch").value;

		productQnaForm.action = "Q&A.jsp?product="+product+"&resSearch="+resSearch;
		productQnaForm.submit();
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

<!-- UI Object -->

<div id="wrap"> 

  <!-- container -->

  <div id="container"> 

    <!-- content -->

    <div id="content"> 

      <form name = "productQnaForm" method = "post">
      
      <div class="con-area" >

        <!-- board-search -->

        <div class="board-search">

          <select name="productFlag" id = "productFlag">
			<option value="ALL" <%="ALL".equals(product) ? "selected" : "" %>>ALL</option>
			<option value="S01" <%="S01".equals(product) ? "selected" : "" %>>변액상품</option>
			<option value="S02" <%="S02".equals(product) ? "selected" : "" %>>정기적금상품</option>
			<option value="S03" <%="S03".equals(product) ? "selected" : "" %>>보험상품</option>
			<option value="S04" <%="S04".equals(product) ? "selected" : "" %>>펀드상품</option>
			<option value="S05" <%="S05".equals(product) ? "selected" : "" %>>묶음상품</option>
		  </select>
 
          <input type="text" name="resSearch" id = "resSearch" class="text" style="width:183px;" value="<%=enSearch%>">
          
          <input type="image" src="../images/btn/btn_search01.gif" alt="" onclick="productFlagButton();">

        </div>

        <!-- //board-search --> 

        <!-- Q&A List -->

        <div class="board_list">

          <table  summary="Q&A">

            <col width="65">

            <col>

            <col width="100">

            <col width="100">

            <col width="75">

            <thead>

              <tr>

                <th scope="col">No.</th>

                <th scope="col" >상품내용</th>
                
                <th scope="col" >전화번호</th>
                
                <th scope="col" >가입금액</th>

                <th scope="col">고객명</th>
                
                <th scope="col">가입일</th>

              </tr>

            </thead>

            <tbody>
<%
       if(countP == 0){
%>
			<tr height = "30" bgcolor="white">
				<td align = "center" width = "10%" colspan = "5">There is no list of questions</td>
			</tr>
<% 
		}else{
			if(countP > 0){
				int total = dsP.getRowsize();
					for(int i = total - (currentPage-1)*pageSize-1 ; ; i--){
						if(articleListCount == 10 || i < 0)
							break;
						articleNum = dsP.get(i, "SEQ"); 
						articleTitle = dsP.get(i, "E_TITLE"); 
						articleProduct = dsP.get(i, "E_PRODUCT"); 
						articleAmount = dsP.get(i, "E_BALANCE"); 
						articleName = dsP.get(i, "E_NAME");
						articleDate = dsP.get(i, "E_DATE"); 
						articlePhone= dsP.get(i, "E_PHONE"); 
						
						articleListCount++;
						
					
						date = sdf.parse(articleDate);
						
						if(!refDate.equals("")){
							refDate = refDate.substring(0,4)+"-"+refDate.substring(4,6)+"-"+refDate.substring(6,8);
						}
						%>
						 
						<tr>
			                <td><%=i+1%></td>
			                <td class=" title"><a href = "javascript:productContentSubmit('<%=articleNum%>', '<%=pageNum%>', '<%=articleFlag%>', '<%=product%>','1', '<%=enSearch%>');" >상품등록사항 : &nbsp;<%=articleTitle%> &nbsp; - 
			                <%=articleProduct%> / 
			                <%
			                if(articleProduct.equals("S01")){
			                %>
			                	변액상품
			                <% 
			                } else if (articleProduct.equals("S02")){
			                %>
			                	정기적금상품
			                <% 	
			                } else if (articleProduct.equals("S03")){
			                %>
			                	보험상품
			                <% 	
			                } else if (articleProduct.equals("S04")){
			                %>
			                	펀드상품
			                <% 	
			                } else if (articleProduct.equals("S05")){
			                %>
			                	묶음상품
			                <% 	
			                } else {
			                %>
			                	미등록상품
			                <%
			                }
			                %>
			                </a>
			                <td><%=articlePhone %></td>
			                <td><%=articleAmount %>원</td>
			                <td><%=articleName.replace("^","")%></td>
			                <td><%=sdf.format(date)%></td>
		               </tr>
<% 
					} 
				}
			}
	
%>
            </tbody>

          </table>

        </div>

        <div class="conBtm">

          <div style="float:right"><a href="javascript:locate('Q&A_write.jsp?resflagmenu=2')"><img src="../images/btn/btn_write.gif" alt="" /></a></div>

          <!-- paging -->
		<%
		if(countP > 0){
			int paging = 5;
			int totalPage = countP / pageSize + (countP % pageSize == 0?0:1);
			int start = 0;
			int end = 0;
			
			if((currentPage - 1) / 5 == 0)
				start = 1;
			else
				start = (((currentPage - 1) / 5) * 5) + 1;
			
			if(start + 4 > totalPage)
				end = totalPage;
			else 
				end = start + 4;
			%> 
          <div class="paging"> 
          
          <%
          if(totalPage > 10){
        	  %>
        	  <a href = "javascript:locate('Q&A.jsp?product=<%=product%>&resflagmenu=2')"><img src="../images/btn/page_01.gif" alt=""></a> 
        	  <%
          }
          if(totalPage > 5){          	
        	  %>
        	   <a href = "javascript:locate('Q&A.jsp?product=<%=product %>&pageNum=<%=start-5 < 0 ? 1 : start-5%>&resflagmenu=2')"><img src="../images/btn/page_02.gif" alt=""></a>
        	  <%
          }
          %>

            <p class="pageNum">
            <% 
	            for(int i = start ; i <= end ; i++){
					if(i > totalPage)
						break;
            		
					if(i==currentPage){
            			%><span class="on"><a href="javascript:locate('Q&A.jsp?product=<%=product%>&pageNum=<%=i%>&resflagmenu=2')"><%=i%></a></span><%
            			continue;
            		}
					else{
						%>
		            	<span><a href="javascript:locate('Q&A.jsp?product=<%=product%>&pageNum=<%=i%>&resflagmenu=2')"><%=i %></a></span> 
		            	<%
					}
	            }
            %>
            </p>
			<%
			if(totalPage > 5){
				%>
				<a href = "javascript:locate('Q&A.jsp?product=<%=product%>&pageNum=<%=start+5 > totalPage ? totalPage : start+5%>&resflagmenu=2')"><img src="../images/btn/page_03.gif" alt="" ></a> 
				<%
			}
			if(totalPage > 10){
				%>
				<a href = "javascript:locate('Q&A.jsp?product=<%=product%>&pageNum=<%=totalPage%>&resflagmenu=2')"><img src="../images/btn/page_04.gif" alt="" ></a> </div>
				<%
			}
		}
		
			%> 

          <!-- //paging --> 
       	 </div>
       	 <input type="hidden" name="product" />
        </form>
      </div>
    </div>
    <!-- //content --> 
  </div>
  <!-- //container --> 

</div>

<!-- //UI Object -->


</body>

</html>

