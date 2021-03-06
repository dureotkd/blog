<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<script src="https://kit.fontawesome.com/3b1f8c6d21.js"
	crossorigin="anonymous"></script>
<c:set var="pageTitle" value="비밀번호 확인"></c:set>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<head>
<meta charset="UTF-8" />
<title>CodeMountain</title>

<style>
* {
	padding: 0px;
	margin: 0px;
	text-decoration: none;
	color: inherit;
}

ul, li {
	list-style: none;
}

.total-wrap {
	display: flex;
}

.send-wrap {
	display: flex;
	flex-direction: column;
	margin: 0 auto;
	width: 50%;
	height: 500px;;
	margin-bottom: 100px;
	margin-top: 30px;
}

h1 {
	font-size: 2rem;
}

.left-wrap {
	height: 100vh;
	width: 300px;
	background: aliceblue;
}

.send-con {
	display: flex;
	flex-direction: column;
	width: 100%;
	align-items: center;
	justify-content: center;
}

label {
	margin-top: 15px;
	font-weight: 600;
	font-size: 1.3rem;
}

.body {
	height: 200px;
	margin-top: 20px;
	border: 1px solid #e1e1e1;
	text-indent: 10px;
	padding-top: 10px;
}

.submit {
	font-size: 15px;
	cursor: pointer;
	background: aliceblue;
}

.spam {
	font-size: 12px;
	color: #9e9e9e;
	margin-top: 15px;
}

.left-wrap {
	display: flex;
	flex-direction: column;
}

img {
	border-radius: 50%;
	width: 88px;
	height: 88px;
}

.img-box {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 100px;
}

.text-box {
	margin-top: 20px;
}

.nick {
	color: red;
}

.write {
	margin-top: 50px;
}

.list {
	margin-top: 50px;
}

.left-item {
	text-align: center;
}

.info-item {
	padding: 30px;
	display: flex;
	flex-direction: column;
	border: 1px solid #bdbdbd;
}

.info-item>p {
	font-size: 1.2rem;
	padding: 15px;
}

.password-form {
	display: flex;
	width: 70%;
}

.form-row {
	display: flex;
	flex-direction: column;
	width: 80%;
	height: 80%;
	margin: 0 auto;
	justify-content: center;
	max-width: 600px;
	min-width: 600px;
}

input {
	margin-top: 20px;
	border: 1px solid #e1e1e1;
	text-indent: 10px;
	height: 60px;
}

.label-sub {
	color: #9e9e9e;
	font-size: 13px;
	margin-top: 5px;
}

.profile {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}
</style>


<script>
	function submitLoginForm(form) {
		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			alert('로그인 비번을 입력해주세요.');
			form.loginPw.focus();
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		form.submit();
	}
</script>


</head>
<body>
	<nav class="total-wrap">
		<ul class="left-wrap">
			<div class="img-box">
				<img src="${loginedMember.image}" alt="프로필" class="profile" />
				<div class="text-box">
					<span class="nick">${loginedMember.nickname }</span> <span>님
						환영합니다</span>
				</div>
			</div>

			<a href="/blog/s/member/info" class="list">
				<li class="left-item"><i class="fas fa-user"></i><span>나의
						정보</span></li>
			</a>

			<a href="/blog/s/letter/send" class="list">
				<li class="left-item"><i class="far fa-paper-plane"></i><span>쪽지보내기</span></li>
			</a>
			<a href="/blog/s/letter/list" class="list">
				<li class="left-item"><i class="far fa-comment-dots"></i><span>쪽지내역</span>
			</li>
			</a>
			<a href="/blog/s/member/passwordForPrivate" class="list">
				<li class="left-item"><i class="fas fa-exchange-alt"></i><span>정보수정</span>
			</li>
			</a>

			<a href="/blog/s/letter/memberList" class="list">
				<li class="left-item"><i class="fas fa-users"></i><span>접속유저</span>
			</li>
			</a>
		</ul>
		<form action="doPasswordForPrivate" method="POST"
			class="password-form" onsubmit="submitLoginForm(this); return false;">
			<input type="hidden" name="loginPwReal" value=${loginedMember.id } />
			<div class="form-row">
				<label for="">비밀번호</label> <span class="label-sub">회원님의 개인정보를
					안전하게 지키기 위해 개인정보 수정시 비밀번호가 필요합니다.</span> <input name="loginPw"
					type="password" autofocus /> <input type="submit" value="확인"
					class="submit" />
			</div>

		</form>
	</nav>


</body>
</html>

