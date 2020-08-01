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
	margin-top:100px;
}

.left-wrap {
	height:100vh;
	width:300px;
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

input {
		margin-top:20px;
		border:1px solid #e1e1e1;
		height:60px;
		text-indent:10px;
}

.body {
	height:200px;
	margin-top:20px;
	border:1px solid #e1e1e1;
	text-indent:10px;
	padding-top:10px;
}
.submit {
	background:aliceblue;
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

table {
	border-collapse:collapse;
}
td {
	border:1px solid #999;
	padding:5px;
}
.letter-list{
	width:600px;
}
.list-box {
	margin-top:50px;
}
.head-text {
	display:flex;
	flex-direction:column;
	align-items:center;
	width:100%;
	height:100%;
}
.profile {
	width:100px;
	height:100px;
	border-radius:50%;
}


</style>
</head>
<body>
<nav class="total-wrap">
<ul class="left-wrap">
	<div class="img-box">
	<img src="${loginedMember.image}" alt="프로필" class="profile"/>
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
<div class="head-text">
<h1>CodeMountain 쪽지</h1>
<span class="spam">홍보, 도배, 비방 등의 쪽지는 동의 없이 임의 삭제될 수 있습니다.</span>
<div class="list-box">
<table class="letter-list">
	<thead>
		<tr>
			<th>보낸사람</th>
			<th>날짜</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${letters}" var="letter">
		<c:if test="${loginedMember.nickname == letter.sendNickname }">
			<tr>
			<td>${letter.extra.writer}</td>
			<td>${letter.regDate}</td>
			<td>${letter.title}</td>
			<td>${letter.body}</td>
		</c:if>
		</c:forEach>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>
</nav>

	
</body>
</html>

