package ensof;

public class Snippet {
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
}

