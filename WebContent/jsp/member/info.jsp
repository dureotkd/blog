<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<script src="https://kit.fontawesome.com/3b1f8c6d21.js"
	crossorigin="anonymous"></script>
<head>
	<meta charset="UTF-8" />
	<title>CodeMountain</title>
	
	<style>
* {
	padding:0px;
	margin:0px;
	text-decoration:none;
	color:inherit;
}	

ul,li{
	list-style:none;
}
.total-wrap {
	display:flex;
	width:100%
}
	
.send-wrap {
	display:flex;
	flex-direction:column;
	margin:0 auto;
	width:50%;
	height:500px;;
	margin-bottom:100px;
	margin-top:30px;
}

h1 {
	font-size:2rem;
}

.left-wrap {
	height:100vh;
	width:30%;
	background:aliceblue;
}
.send-con {
	display:flex;
	flex-direction:column;
	width:70%;
	align-items:center;
	justify-content:center;
}

label {
	margin-top:15px;
	font-weight:600;
	font-size:1.3rem;
}
.body {
	height:200px;
	margin-top:20px;
	border:1px solid #e1e1e1;
	text-indent:10px;
	padding-top:10px;
}
.submit {
	background:pink;
	font-size:15px;
	cursor:pointer;
}

.spam {
	font-size:12px;
	color:#9e9e9e;
	margin-top:15px;
}

.left-wrap {
	display:flex;
	flex-direction:column;
}

img {
	border-radius:50%;
	width:88px;
	height:88px;
}

.img-box {
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top:100px;
}

.text-box {
	margin-top:20px;
}

.nick {
	color:red;
}

.write {
	margin-top:50px;
}
.list {
	margin-top:50px;
}
.left-item {
	text-align:center;
}
.info-item {
	padding:30px;
	display:flex;
	flex-direction:column;
	border:1px solid #bdbdbd;
}

.info-item > p{
	font-size:1.2rem;
	padding:15px;
}



</style>
</head>
<body>
<nav class="total-wrap">
<ul class="left-wrap">
	<div class="img-box">
	<img src="https://yt3.ggpht.com/a-/AOh14GjOrFI0WOrVRHRcZ6aBsG-IPRfxA4KBxQcw5LqP=s88-c-k-c0xffffffff-no-rj-mo" alt="" />
	<div class="text-box">
	<span class="nick">${loginedMember.nickname }</span>
	<span>님 환영합니다</span>
	</div>
	</div>
	
	<a href="/blog/s/member/info" class="list">
	<li class="left-item"><i class="fas fa-user"></i><span>나의 정보</span></li>
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
</ul>
<div class="send-con">
<div class="info-box">
<div class="info-item">
<p>가입날짜 : ${loginedMember.regDate}</p>    
<p>이름 : ${loginedMember.name}</p>
<p>이메일 : ${loginedMember.email}</p>
<p>닉네임 : ${loginedMember.nickname}</p>
<p>아이디 : ${loginedMember.loginId}</p>
<p class="pw">비밀번호 : ****</p>

<p>${logiendMember.mailStatus}</p>
<form action="infoEmail">
<input type="submit" value="이메일 인증"/>
<input type="hidden" value="${loginedMember.code}" name="code" />
</form>

</div>
</div>
</div>
</nav>

	
</body>
</html>

