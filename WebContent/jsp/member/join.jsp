<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.19/lodash.min.js"></script>
<link rel="stylesheet" href="/blog/resource/css/common.css" />
<link rel="stylesheet" href="/blog/resource/css/home/main.css" />
<style>

.join-form-con{
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

.join-box {
	display:flex;
	flex-direction:column;
	height:600px;
	width:50%;
}


.join-name,.join-Pw,.join-PwConfirm,.join-id,.join-email,.join-nickname,.join-profile{
	margin-top:20px;
	height:60px;
	border:1px solid #e1e1e1;
	text-indent:10px;
}

.join-form {
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


@media ( max-width :799px ) {
	.visible-on-md-up {
		display: none !important;
	}
	
	.join-box{
		width:80%;
		margin-top:100px;
	}
}


</style>

<script>
	var joinFormSubmitted = false;	

	function submitJoinForm(form) {
		if (joinFormSubmitted) {
			alert('처리 중입니다.');
			return;
		}

		form.name.value = form.name.value.trim();
		form.nickname.value = form.nickname.value.trim();
		form.loginId.value = form.loginId.value.trim();
		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return;
		}
		if (form.nickname.value.length == 0) {
			alert('닉네임을 입력해주세요.');
			form.nickname.focus();
			return;
		}
		if (form.loginId.value.indexOf(' ') != -1) {
			alert('아이디를 영문소문자와 숫자의 조합으로 입력해주세요.')
			form.loginId.focus();
			return;
		}

		if (form.loginPw.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return;
		}
		if (form.loginPw.value != form.loginPwConfirm.value) {
			alert('비밀번호와 비밀번호 확인이 다릅니다.');
			form.loginPwConfirm.focus();
			return;
		}
		joinFormSubmitted = true;
		
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '' ;
		form.loginPwConfirm.value= '';
		form.submit();
	}
	
	

	function JoinForm__checkLoginIdDup(input) {
		var form = input.form;

		form.loginId.value = form.loginId.value.trim();

		if (form.loginId.value.length == 0) {
			return;
		}

		$.get('getLoginIdDup', {
			loginId : form.loginId.value
		}, function(data) {
			var $message = $(form.loginId).next();

			if (data.resultCode.substr(0, 2) == 'S-') {
				$message.empty().append(
						'<div style="color:green;">' + data.msg + '</div>');
				JoinForm__validLoginId = data.loginId;
			} else {
				$message.empty().append(
						'<div style="color:red;">' + data.msg + '</div>');
				JoinForm__validLoginId = '';
			}
		}, 'json');
	}
	function JoinForm__checkEmailDup(input) {
		
		var form = input.form;
		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			return;
		}

		

		$.get('getEmailDup', {
			email : form.email.value
		}, function(data) {
			var $message = $(form.email).next();

			if (data.resultCode.substr(0, 2) == 'S-') {
				$message.empty().append(
						'<div style="color:green;">' + data.msg + '</div>');
				JoinForm__validEmail = data.email;
			} else {
				$message.empty().append(
						'<div style="color:red;">' + data.msg + '</div>');
				JoinForm__validEmail = '';
			}
		}, 'json');
	}
function JoinForm__checkNicknameDup(input) {

		var form = input.form;
		
		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			return;
		}
		$.get('getNicknameDup', {
			nickname : form.nickname.value
		}, function(data) {
			var $message = $(form.nickname).next();

			if (data.resultCode.substr(0, 2) == 'S-') {
				$message.empty().append(
						'<div style="color:green;">' + data.msg + '</div>');
				JoinForm__validNickname = data.nickname;
			} else {
				$message.empty().append(
						'<div style="color:red;">' + data.msg + '</div>');
				JoinForm__validNickname = '';
			}
		}, 'json');
	}
	var JoinForm__checkLoginIdDup__debounce = _.debounce(JoinForm__checkLoginIdDup, 1000);
	var JoinForm__checkNicknameDup__debounce = _.debounce(JoinForm__checkNicknameDup, 1000);
	var JoinForm__checkEmailDup__debounce = _.debounce(JoinForm__checkEmailDup, 1000);
</script>

<nav class="join-form-con ">
	<div class="left-box visible-on-md-up">
	<h2 class="left-h">처음뵙겠습니다</h2>
	<p class="left-p">가입할 계정을 입력해주세요</p>
	<p class="left-p2">로그인도 간편해요</p>
	</div>
	

	<form action="doJoin" class="join-form" method="post" onsubmit="submitJoinForm(this); return false;">
	 <input type="hidden" name="loginPwReal" />
		<div class="join-box">
			<input type="input" name="image" placeholder="User Profile [ image URL ] " class="join-profile"/>
			<input type="text" name="name" class="join-name" placeholder="User name" autofocus /> 
			<input onkeyup="JoinForm__checkNicknameDup__debounce(this);" type="text" name="nickname" class="join-nickname" placeholder="User nickname" />
			<div class="message-msg"></div>
			<input onkeyup="JoinForm__checkEmailDup__debounce(this);" type="email" name="email" class="join-email" placeholder="User Email"/>
			<div class="message-msg"></div>
			<input onkeyup="JoinForm__checkLoginIdDup__debounce(this);"  type="text" name="loginId" class="join-id" placeholder="User Id" />
			<div class="message-msg"></div>
			<input type="password" name="loginPw" class="join-pw" placeholder="Password" /> 
			<input type="password" name="loginPwConfirm" class="join-Pwconfirm" placeholder="Password 확인" />
			<input  class="submit" type="submit" value="회원가입">
		</div>
	</form>
</nav>

<%@ include file="/jsp/part/foot.jspf"%>