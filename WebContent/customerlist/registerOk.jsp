<%
/************************************************************************/
/*                                                                      */
/*      ���α׷��� : registerOk.jsp                                 		*/
/*      ��      �� :   �� ���� ���� ( ��Ű ���� )							*/
/*      ��  ��  �� : 	2012.01.20 �ѹο�                     							*/
/*      ��      �� :                               							*/
/*                                                                      */
/************************************************************************/
%>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.text.SimpleDateFormat" %> 
<%@ page import = "ensof.common.*" %>
<jsp:useBean id="mysql" scope="application" class="ensof.common.OracleConnectionManager"/>
<jsp:useBean id="handle" scope="page" class="ensof.RegisterDbHandler"/>
<jsp:useBean id="handler" scope="page" class="ensof.EmailHandler"/>
<% request.setCharacterEncoding("euc-kr");%>
<%  
	DataLog dataLog  = new DataLog();

	String enFirst 	 = DataUtil.XSSconvStr(request.getParameter("resfirst"));
	String enLast 	 = DataUtil.XSSconvStr(request.getParameter("reslast"));
	String enCompany = DataUtil.XSSconvStr(request.getParameter("rescompany"));
	String enEmail	 = DataUtil.XSSconvStr(request.getParameter("resemail"));
	String enCountry = DataUtil.XSSconvStr(request.getParameter("rescountry"));
	String enResMail = DataUtil.XSSconvStr(request.getParameter("resMail"));
	String enResPos  = DataUtil.XSSconvStr(request.getParameter("resposition"));
	String enProduct = DataUtil.XSSconvStr(request.getParameter("resProduct"));
	String enSsn 	 = DataUtil.XSSconvStr(request.getParameter("resssn"));
	String enPhone 	 = DataUtil.XSSconvStr(request.getParameter("resphone"));
	String enAccount = DataUtil.XSSconvStr(request.getParameter("resaccount"));
	String enflag 	 = DataUtil.nullToSpace(request.getParameter("resflagmenu"));
	
	////////////////////�ڵ� ���� ó��////////////////////////////
	String remember = request.getParameter("remember");
	
	if(remember != null && remember.equals("on")){ //Email ����
		//��Ű ���� �Ѵ�.   
		Cookie cookie = new Cookie("rememberEmail", enEmail); 
		cookie.setMaxAge(((60*60*1)*24) * (365*2)); //((60*60*1)*24) * (365*2) // 2�� ���� //
   		cookie.setPath("/");      //��Ű ���� ��� ����              
  		response.addCookie(cookie); 
 
    	cookie = new Cookie("rememberCompany", enCompany);
    	cookie.setMaxAge(((60*60*1)*24) * (365*2)); 
  		cookie.setPath("/");      
  		response.addCookie(cookie); 
  		
    	cookie = new Cookie("rememberFirst", enFirst);
    	cookie.setMaxAge(((60*60*1)*24) * (365*2)); 
  		cookie.setPath("/");      
  		response.addCookie(cookie); 
  		
    	cookie = new Cookie("rememberLast", enLast);
    	cookie.setMaxAge(((60*60*1)*24) * (365*2)); 
  		cookie.setPath("/");     
  		response.addCookie(cookie); 
  		
    	cookie = new Cookie("rememberCountry", enCountry);
    	cookie.setMaxAge(((60*60*1)*24) * (365*2)); 
  		cookie.setPath("/");      
  		response.addCookie(cookie); 
  		
    	cookie = new Cookie("rememberPosition", enResPos);
    	cookie.setMaxAge(((60*60*1)*24) * (365*2)); 
   		cookie.setPath("/");      
  		response.addCookie(cookie); 
  		
   	} else { 
   		dataLog.write_log(4, "registerOk.jsp ==", request);
   	}
	//////////////////////////////////////////////////////////////////
	
	boolean bl  = true; 
	boolean bx  = true;   
    
	String enname = enFirst+enLast;
	
	/////////////// ��Ű �� ///////////////
	Cookie[] cookies = request.getCookies();
	
	String email = "";
	
	if(cookies != null){
    	for(int i = 0; i < cookies.length; i++){
    		if(cookies[i].getName().equals("rememberEmail")){ //��Ű��
    			email   = cookies[i].getValue();
    		}
    	}
	}
	System.out.println("request.getRemoteAddr() : "+request.getRemoteAddr());
	
	System.out.println("mysql : "+mysql);
	System.out.println("enname : "+enname);
	System.out.println("enEmail : "+enEmail);
	System.out.println("enCompany : "+enCompany);
	System.out.println("enCountry : "+enCountry);
	System.out.println("enResPos : "+enResPos);
	System.out.println("enResPos : "+enResPos);
	System.out.println("enPhone : "+enPhone);
	System.out.println("enSsn : "+enSsn);
	System.out.println("enAccount : "+enAccount);
	
	handle.insertArticle(mysql, enname, enEmail, enCompany, enCountry, enResPos, enPhone, enSsn, enAccount, request.getRemoteAddr()); 
	
	//////////////////////////////////////
	out.println("<script language='javascript'>");
  	//out.println("alert('Your product inquiry has been successfully registered.');");
  	out.println("location.href='./smt_down.jsp?resOn=2&resflagmenu="+enflag+"';");	
   	out.println("</script>"); 

%>


