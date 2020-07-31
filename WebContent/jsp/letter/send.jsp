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
	min-width:400px;
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
<h1>CodeMountain 쪽지</h1>
<span class="spam">홍보, 도배, 비방 등의 쪽지는 동의 없이 임의 삭제될 수 있습니다.</span>
<form action="doSend" class="send-wrap">
<label for="#">받는 사람</label>
<input type="text" name="sendNickname" placeholder="상대방 닉네임을 입력해주세요." class="sendNickname" autofocus/>
<input type="hidden" name="fromNickname" value=" ${loginedMember.nickname}"  />
<label for="#">제목</label>
<input type="text" name="title"/>
<label for="#">내용</label>
<textarea name="body" id="" cols="30" rows="10" class="body"></textarea>
<input type="submit" value="전송" class="submit"/>
</form>
</div>
</nav>

	
</body>
</html>

