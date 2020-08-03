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
	min-width: 400px;
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
	width: 70%;
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
	background: pink;
	font-size: 15px;
	cursor: pointer;
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

.info-box {
	display: flex;
	justify-content: center;
	width: 100%;
}

.infoEmail {
	display: flex;
	justify-content: center;
}

.submit {
	width: 100px;
	height: 50px;
	background: aliceblue;
	border: 1px solid #bdbdbd;
}

.profile {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}
.article-wrap {
	width:50%;
	line-break:anywhere;
	border:1px solid #ccc;
	padding:20px;
	margin-top:10px;
}
.articleReply-wrap {
	width:50%;
	display:flex;
	line-break:anywhere;
	border:1px solid #ccc;
	padding:20px;
	flex-direction:column;
	margin-top:10px;
}
</style>
</head>
<body>
	<nav class="total-wrap">
		<ul class="left-wrap">
			<div class="img-box">
				<img src="${member.image}" alt="프로필" class="profile" />
				<div class="text-box">
					<span class="nick">${member.nickname }</span>
				</div>
			</div>

			<a href="/blog/s/article/userAllList?id=${member.id}" class="list">
				<li class="left-item"><i class="far fa-paper-plane"></i><span>활동내역</span></li>
			</a>
			<a href="/blog/s/guestBook/list?id=${member.id}" class="list">
				<li class="left-item"><i class="far fa-sticky-note"></i><span>방명록</span>
			</li>
			</a>
			<a href="/blog/s/privatePhoto/list?id=${member.id}" class="list">
				<li class="left-item"><i class="far fa-image"></i><span>사진첩</span>
			</li>
			</a>

		</ul>
		<div class="send-con">
			<h2>게시글</h2>
			<div class="article-wrap">
				<c:forEach items="${articles}" var="article">
					<div class="article-box">
						${article.id} <a href="#">${article.title}</a>
					</div>
				</c:forEach>
			</div>
			<h2>댓글</h2>
			<div class="articleReply-wrap">
				<c:forEach items="${articleReplys}" var="articleReply">
					<div class="articleReply-box">
						${articleReply.id} <a href="#">${articleReply.body}</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</nav>


</body>
</html>

