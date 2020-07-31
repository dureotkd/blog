<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>



<style>

.login-form-con{
	display:flex;
	height:100%;
}
.left-box {
	color:white;
	background-color:#18306d;
	width:30%;
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	font-size:1.5rem;
}

.left-p,.left-p2 {
	color:#8a96b2;
	font-size:1.3rem;
}

.left-h {
	font-weight:300;
	letter-spacing:4px;
}

.left-p2{
	margin-bottom:150px;
}

.left-p {
	margin-bottom:-10px;
}

.login-box {
	display:flex;
	flex-direction:column;
	height:430px;
	width:50%;
}

.user-pw{
	margin-top:20px;
}

.login-Id,.login-Pw{
	margin-top:20px;
	height:60px;
	border:1px solid #e1e1e1;
	text-indent:10px;
}

.login-form {
	display:flex;
	align-items:center;
	justify-content:center;
	flex-direction:column;
	width:100%;
}

label {
	font-weight:600;
	font-size:1.4rem;
}

.submit,button{
	cursor:pointer;
}

.login-btn {
	width:100%;
}
.submit {
	width:100%;
	text-align:center;
	border:none;
	color:white;
	background-color:#18306d;
	font-size:1.2rem;
	padding:15px;
	margin-top:30px;
	transition:background-color.4s;
}
.submit:hover {
	background-color:green;
}
.box-sub {
	display:flex;
	justify-content:space-between;
	margin-top:10px;
}

/*pc �깙諛� 醫낅즺*/
@media ( max-width :799px ) {
	.visible-on-md-up {
		display: none !important;
	}
	
	.login-box{
		width:80%;
		margin-top:100px;
	}
}

/*모바일 탑바 전체 부분  */
@media ( min-width :800px ) {
	.visible-on-sm-down {
		display: none !important;
	}
}

</style>
<script>
	var loginFormSubmitted = false;
	
	function submitLoginForm(form) {
		if (loginFormSubmitted) {
			alert('처리 중입니다.');
			return;
		}
		form.loginId.value = form.loginId.value.trim();
		form.loginPw.value = form.loginPw.value.trim();

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '' ;
		form.submit();
		loginFormSubmitted = true;
	}
</script>
<nav class="login-form-con">
	<div class="left-box visible-on-md-up">
	<h2 class="left-h">환영합니다</h2>
	<p class="left-p">가입된 계정을 입력해주세요</p>
	<p class="left-p2">회원가입도 간편합니다</p>
	</div>

	<form action="doLogin" class="login-form" method="post"  onsubmit="submitLoginForm(this); return false;">
		<input type="hidden" name="loginPwReal" />
		<div class="login-box">
			<label for="user-id">계정 아이디</label>
			<input type="text"  name="loginId" class="login-Id" placeholder="admin" autofocus/> 
			<label for="user-pw" class="user-pw">비밀번호</label>
			<input type="password" name="loginPw" class="login-Pw" placeholder="*****" />
			<div class="box-sub">
			<a href="/blog/s/member/findId">아이디를 잊으셨나요?</a>
			<a href="/blog/s/member/join" class="join-box">회원가입</a>
			</div>
		<div class="login-btn">
			<input class="submit" type="submit" value="로그인"
				onclick="location.href='../home/main'"></input>
		</div>
		</div>
	</form>
	
</nav>
	


<%@ include file="/jsp/part/foot.jspf"%>