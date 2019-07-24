<%
/************************************************************************/
/*                                                                      */
/*      프로그램명  :   customerListExcel.jsp       	    				*/
/*      내      용      : 	   고객 리스트 Excel 파일 출력						*/
/*      작  성  일    : 	  2012 . 7. 6                  					*/
/*      작  성  자    :   한      민     우                                                 			*/
/*                                                                      */
/************************************************************************/
%>
<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*, java.io.*, java.sql.*" %>  
<%@ page import = "ensof.common.*" %>   
<%@ page import = "java.util.Date" %> 
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.Timestamp" %> 
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
	String enFax			= "";
	Date					date;
	Date				 expdate;
	// License 정보 변수
	String enResel			= "";
	String enPurchaser		= "";
	String enAmount			= "";
	String enPurdate		= "";
	String enPub			= "";
	String enExpiration		= "";	
	
	Timestamp szData = new Timestamp(System.currentTimeMillis());
	
	response.setHeader("Content-Disposition", "attachment; filename="+sdf.format(szData)+"_customer.xls"); 
	response.setHeader("Content-Description", "JSP Generated Data"); 
	response.setContentType("application/vnd.ms-excel");


	int count = 0;

	Dataset ds = null; 
	
	count = handle.getArticleCount(mysqlmgr);
	
	if(count > 0)
	{ 
		ds = handle.getArticles(mysqlmgr);
	}
    	
    if(ds.getRowsize() > 0) {
       	for(int i=0; i<ds.getRowsize(); i++) { 
       		  
       	regdate 		= ds.get(i, "DATE_");
       	enName 			= ds.get(i, "E_NAME");
       	enEmail 		= ds.get(i, "E_MAIL");
       	enCompany		= ds.get(i, "COMPANY");
       	enCountry		= ds.get(i, "COUNTRY");

       	enResel			= ds.get(i, "RESEL_PL");
       	enAmount		= ds.get(i, "AMOUNT");
       	enPurdate		= ds.get(i, "REG_DATE");
       	enPub			= ds.get(i, "PUB_DATE");
 			 
 		date = sdf.parse(regdate);
 			 
 			if(enPub != "" || enPub == null){ 
 				
 				//1년 후 날짜 계산
 				enExpiration = enPub.substring(0,4) + "-" + enPub.substring(4,6) + "-" + enPub.substring(6,8);
 				 
 				Calendar cal = Calendar.getInstance();
 				cal.setTime(sdf.parse(enExpiration));
 				cal.add(cal.DATE,+364); 
 				String  thisDayMiner = cal.get(cal.YEAR)+"-"+(cal.get(cal.MONTH)+1)+"-"+cal.get(cal.DATE);

 				 expdate = sdf.parse(thisDayMiner);
 				 thisDayMiner = new java.text.SimpleDateFormat ("yyyy-MM-dd").format(date);

 				 enExpiration = sdf.format(expdate);
 				  
 			}
 				
 				if(date != null){
 					regdate = sdf.format(date);
 				}
 				
		if(i == 0){
%>

<table> 
<tr>
	<td>등록된 고객 수 : <%=count %></td>
	<td>본 자료는 최근에 등록된 고객 순으로 정렬 됩니다.</td>
</tr>
</table>
<table border="0" width="750" cellpadding="4" cellspacing="1" bgcolor="lightgrey" style="table-layout:fixed"> 
<tr height = "30" bgcolor="#efefef">
	<td align = "center" width = "3%">No</td>
	<td width = "10%" align="center">Updated Date</td> 
	<td align = "center" width = "11%">Company</td> 
	<td align = "center" width = "11%">Country</td>
	<td align = "center" width = "11%">URL</td>
	<td align = "center" width = "5%">Name</td>
	<td align = "center" width = "8%">Tel</td>
	<td align = "center" width = "8%">Fax</td>
	<td align = "center" width = "10%">Reseller/</br>Product Inquiry</td>
	<td align = "center" width = "3%">구매여부</td>
	<td align = "center" width = "10%">구매 일</td>
	<td align = "center" width = "10%">발행 일</td>
	<td align = "center" width = "10%">만료 일</td>
</tr>
</table>
<%} %>
<table border="0" width="750" cellpadding="4" cellspacing="1" bgcolor="lightgrey" style="table-layout:fixed"> 
<tr height = "30" bgcolor="white">
	<td align = "center" width = "3%"><%=i %></td>
	<td width = "10%" align="center"><%=regdate %></td> 
	<td align = "center" width = "11%"><%=enCompany %></td> 
	<td align = "center" width = "11%"><%=enCountry %></td>
	<td align = "center" width = "11%"><%=enUrl %></td>
	<td align = "center" width = "5%"><%=enName%></td>
	<td align = "center" width = "8%"><%=enTel%></td>
	<td align = "center" width = "8%"><%=enFax%></td>
	<td align = "center" width = "10%"><%=enResel%></td>
	<td align = "center" width = "3%">
	<%if(enPurdate == null || enPurdate.equals("")){%>
		X
	<%} else {%>
		O
	<%}%> 
	</td>
	<td align = "center" width = "10%"><%=enPurdate%></td>
	<td align = "center" width = "10%"><%=enPub%></td>
	<td align = "center" width = "10%"><%=enExpiration%></td>
</tr>
</table>
<%
       	 	
    	}
    }
%>
