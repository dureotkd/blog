<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<style>
h1 {
	color: black;
	font-size: 2rem;
}

.top-box {
	height: 100px;
	background-color: white;
}

.page-box1 {
	height: 300px;
	background-color: white;
	display: flex;
	border-bottom: solid 2px #43a047;
}

.page-box1>.page-box1-text {
	width: 100%;
	align-items: center;
	justify-content: center;
	display: flex;
	font-size: 2rem;
	font-weight: bold;
	color: black;
}

.button-4 {
	width: 140px;
	height: 50px;
	border: 2px solid black;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 0 0 40px 50px;
}

.button-4 a {
	padding: 16px 48px;
	font-family: arial;
	font-size: 16px;
	color: black;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}

.eff-4 {
	width: 140px;
	height: 50px;
	left: -140px;
	background: #43a047;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
}

.button-4:hover .eff-4 {
	left: 0;
}

.button-4:hover a {
	color: #fff;
}

.button-5 {
	width: 140px;
	height: 50px;
	border: 2px solid black;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 0 0 40px 50px;
}

.button-5 a {
	padding: 16px 48px;
	font-family: arial;
	font-size: 16px;
	color: black;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}

.eff-5 {
	width: 140px;
	height: 50px;
	left: -140px;
	background: #43a047;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
}

.button-5:hover .eff-5 {
	left: 0;
}

.button-5:hover a {
	color: #fff;
}

.page-con {
	padding: 0px 200px;
}

.flex {
	display: flex;
}

.ai-c {
	align-items: center;
}
/* =================================pc 화면 끝 ===================================*/

/* ================================= mobile 화면 시작 ===================================*/
.m-title {
	font-size: 1.3rem;
	font-weight: bold;
}

.m-button-4 {
	width: 140px;
	height: 50px;
	border: 2px solid black;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 0 auto;
}

.m-button-4 a {
	padding: 16px 48px;
	font-family: arial;
	font-size: 16px;
	color: black;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}

.m-eff-4 {
	width: 140px;
	height: 50px;
	left: -140px;
	background: #43a047;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
}

.m-button-4:hover .m-eff-4 {
	left: 0;
}

.m-button-4:hover a {
	color: #fff;
}

.m-button-5 {
	width: 140px;
	height: 50px;
	border: 2px solid black;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 0 auto;
}

.m-button-5 a {
	padding: 16px 48px;
	font-family: arial;
	font-size: 16px;
	color: black;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}

.m-eff-5 {
	width: 140px;
	height: 50px;
	left: -140px;
	background: #43a047;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
}

.m-button-5:hover .m-eff-5 {
	left: 0;
}

.m-button-5:hover a {
	color: #fff;
}

.m-top-box {
	height: 55px;
}

.m-page-1 {
	flex-direction: column;
}

.m-title {
	display: flex;
	padding: 30px 0px;
	justify-content: center;
}

.m-button-box {
	display: flex;
}

.m-eff-btn2 {
	padding: 15px 50px;
}

.progress {
	top: 0;
	left: 0;
	height: 30%;
	width: 50%;
	margin: 0 auto;
	border-radius: 5px;
}

.progress-container {
	transform: translateY(-50%);
	top: 25%;
	position: absolute;
	width: calc(100% - 200px);
	color: #FFF;
	text-align: center;
	width: 50%;
}

.progress-container label {
	font-family: 'Black Han Sans', sans-serif;
	font-size: 3rem;
	opacity: 1;
	display: inline-block;
}

.button-box {
	width: 100%;
	display: flex;
	justify-content: center;
}

@
keyframes anim { 0% {
	opacity: 0;
	transform: translateX(-300px);
}

33
%
{
opacity
:
1;
transform
:
translateX(
0px
);
}
66
%
{
opacity
:
1;
transform
:
translateX(
0px
);
}
100
%
{
opacity
:
0;
transform
:
translateX(
300px
);
}
}
@
-webkit-keyframes anim { 0% {
	opacity: 0;
	-webkit-transform: translateX(-300px);
}

33
%
{
opacity
:
1;
-webkit-transform
:
translateX(
0px
);
}
66
%
{
opacity
:
1;
-webkit-transform
:
translateX(
0px
);
}
100
%
{
opacity
:
0;
-webkit-transform
:
translateX(
300px
);
}
}
.list-con {
	width: 50%;
	margin: 0 auto;
}

.list-box {
	flex-wrap: wrap;
	display: flex;
	justify-content: space-between;
	width: 100%;
	margin-bottom: 30px;
}

.table-box {
	display: flex;
	flex-direction: row;
	width: 50%;
	margin: 0 auto;
}

.recent-con {
	width: 50%;
}

.cate {
	margin-top: 50px;
	text-align: center;
}

.fa-folder-open {
	color: brown;
}

.fa-clock {
	color: #0277bd;
}

.table-item {
	display: flex;
	flex-direction: column;
	margin-bottom: 30px;
}

.recent-cont {
	width: 50%;
}

.view-cont {
	width: 50%;
}

.view-item {
	display: flex;
	flex-direction: row;
	align-items: baseline;
	justify-content: space-between;
	transition:all.5s;
}

.view-item:hover {
	background:#eee;
}

.fa-hotjar {
	color: red;
}
/* 800px 이하면 안보이게 ( 모바일 버전 ) */
@media ( max-width :799px ) {
	.visible-on-sm-up {
		display: none !important;
	}
	.view-item {
		display: flex;
		flex-direction: column;
	}
}

/* 800px 이하면 안보이게 ( 모바일 버전 ) */

/* 800px 이상이면 안보이게 ( pc 버전 ) */
@media ( min-width :800px ) {
	.visible-on-sm-down {
		display: none !important;
	}
}

.post-name {
	padding: 10px;
	margin: 0px auto;
	margin-top: 200px;
	width: 100%;
	background:#aea8ff;
	color:white;
	font-size:20px;
	border-radius:2px;
}

.post-name2 {
	padding: 10px;
	margin: 0px auto;
	margin-top: 200px;
	width: 100%;
	background:#7ce0d7;
	color:white;
	font-size:20px;
	border-radius:2px;
}

.inner-wrap {
	width: 40%;
}
.inner-wrap2 {
	width: 40%;
	margin-left:30px;
}

.tag-title {
	font-size: 13px;
	width: 100%;
	padding-left:10px;
}

.tag-body {
	width: 50%;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	height: 50px;
	color: #666;
	font-size: 15px;
}

.tag-sub {
	color: #ccc;
	font-size: 13px;
}



.btn-1 {
	margin-top: 30px;
	width: 150px;
	height: 50px;
	background-color: #18306d;
	border-radius: 5px;
	color: white;
	border: none;
	cursor: pointer;
}

.link-wrap {
	width: 60%;
	margin: 30px auto;
}

.links {
	font-size: 2rem;
}

.img-2 {
	width: 100%;
	border-radius: 5px;
}

h2 {
	font-weight: bold;
	font-size: 2rem;
}

.about-sub {
	width: 100%;
	margin: 100px auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.about-body {
	font-size: 1.5rem;
	color: #212121;
	margin-bottom: 30px;
}

* {
	box-sizing: border-box
}

body {
	font-family: Verdana, sans-serif;
	margin: 0
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	position: relative;
	margin: auto;
}

.slideshow-container>div:not(:first-child) {
	display: none;
}
/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: black;
	font-weight: bold;
	font-size: 30px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
	color: white;
}

/* Caption text */
.text {
	color: black;
	font-size: 2rem;
	position: absolute;
	top: 140px;
	left: 20%;
	width: 100%;
	font-weight: bold;
}

.text-wrap {
	position: absolute;
	top: 250px;
	left: 20%;
	width: 50%;
}

.text-wrap>.text-body {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: no-wrap;
	height: 125px;
	font-size: 19px;
	line-height: 3;
	color: #666;
}

.text-btn {
	margin-top: 30px;
	color: white;
	position: absolute;
	top: 400px;
	left: 20%;
	width: 150px;
	height: 50px;
	outline: none;
	border: none;
	border-radius: 5px;
	background-color: #18306d;
	cursor: pointer;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #424242;
	font-size: 20px;
	padding: 8px 12px;
	position: absolute;
	top: 30px;
	width:100%;
	text-align:center;
	font-weight:bold;
	margin-top:50px;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 10px;
	width: 10px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active2, .dot:hover {
	background-color:blue;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}

.email-box {
	display: flex;
	align-items: center;
	justify-content: space-between;
	border: 1px solid #ccc;
	padding: 30px;
	border-radius: 5px;
}

.email-box>i {
	font-size: 2rem;
}

.fa-envelope {
	color: black;
	font-size: 2rem;
	transition: font-size.4s;
}

.fa-envelope:hover {
	font-size: 4rem;
}

.email-box>a {
	font-size: 1.5rem;
	color: red;
}



.ClickMe {
	background: black;
	color: #fff;
	border: none;
	position: relative;
	height: 50px;
	width: 150px;
	border-radius: 5px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.ClickMe:hover {
	background: #fff;
	color: #1AAB8A;
}

.ClickMe:before, .ClickMe:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.ClickMe:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.ClickMe:hover:before, .ClickMe:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.about-img-box {
	display: flex;
	width: 350px;
	height: 500px;
	flex-direction: column;
	border: 1px solid #ccc;
	padding: 15px;
}

.about-img-box>.about-img-con>img {
	height: 400px;
	transition: all ease 1s;
	width: 100%;
}

.about-img-box>p {
	font-size: 20px;
}

.about-img-box>span {
	font-size: 15px;
	color: #9e9e9e;
	padding: 5px 0px;
}

.about-img-con {
	width: 100%;
	overflow: hidden;
	display: flex;
	justify-content: center;
}

.about-img-box:hover  img {
	transform: scale(1.1);
	opacity: 0.7;
}

.admin {
	color: #c62828;
}

.main-slide-box {
	text-align:center;
	position:absolute;
	width:90%;
	height:70%;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	margin-top:50px;
	display:flex;
}

.article-image {
	height:100%;
	width:400px;
	transition: all ease 1s;
}
.image-box {
	border:1px solid #1565c0;
	overflow:hidden;
	width:50%;
}
.article-image:hover {
	transform:scale(1.1);
	opacity:0.7;
}
.text-box {
	display:flex;
	flex-direction:column;
	width:50%;
}
.text-box > p {
	font-size:2rem;
	color:#525252;
}

.inner-con {
	display:flex;
	justify-content:center;
}

.center-box {
	width:100%;
	height:300px;
	background:linear-gradient(to right, #667db6, #0082c8, #0082c8, #667db6);
	display:flex;
	justify-content:center;
	align-items:center;
}
.center-box:hover .meet-logo {
	color:#ff4b5c;
}
.meet-box {
	display:flex;
	flex-direction:column;
	align-items:center;
}
.article-con {
	display:flex;
	max-width:840px;
	margin:0 auto;
	flex-direction:column;
}
.article-txt-box{
	display:flex;
	flex-direction:column;
}
.article-sub-box {
	display:flex;
	align-items:center;
}
.article-img-box {
	overflow:hidden;
	width:170px;
	height:120px;
}

.article-img {
	width:100%;
	height:100%;
	object-fit:cover;
}
.article-item {
	display:flex;
	width:100%;
	justify-content:space-between;
	align-items:center;
}
.silver {
	color:#666;
}
.rem5 {
	font-size:1.5rem;
}
.article-sub-box > p {
	color:#bdbdbd;
	font-size:14px;
	margin-right:10px;
}




/* 800px 이상이면 안보이게 ( pc 버전 ) */
</style>
<!--  * ================================= pc 화면  ================================= */-->

<a href="https://service1.n31.mihere.kr/meet/member/login" class="meet-link" target="_blank" title="SNS서비스">
<div class="center-box">
<div class="meet-box">
<span class="meet-logo">Meet In here</span>
<span class="white">SNS 사진,동영상 서비스</span>
</div>
</div>
</a>


<nav class="article-con">
<c:forEach items="${articles2}" var="article">
<a href="${pageContext.request.contextPath}/s/article/detail?cateItemId=${param.cateItemId}&id=${article.id}">
<div class="article-item">
<div class="article-txt-box">
<p class="rem5">${article.title}</p>
<p class="silver">comming soon ... 두등 등장</p>
<div class="article-sub-box">
<p>${article.regDateFormat2}</p>
<p>조회수 : ${article.hit}</p>
</div>
</div>

<div class="article-img-box">
<c:if test="${article.imgTagFormat != null }">
<img src=" ${article.imgTagFormat}" alt="" class="article-img" />
</c:if>
<c:if test="${article.imgTagFormat == null }">
<img src="https://web.yonsei.ac.kr/_ezaid/board/_skin/albumRecent/3/no_image.gif" alt="" class="article-img" />
</c:if>
</div>
</div>
</a>
</c:forEach>
</nav>


<!--   <nav class="inner-con">
<div class="inner-wrap">
	<p class="post-name">인기게시글</p>
	<c:forEach items="${articles2}" var="article2">
	<a href="${pageContext.request.contextPath}/s/article/detail?cateItemId=${param.cateItemId}&id=${article2.id}">
		<div class="view-item">
			<p class="tag-title">${article2.title}</p>
			</div>
			</a>
	</c:forEach>
</div>

</nav>




<div class="about-sub">
	<h2>ABOUT ME</h2>
	<br> <a href="${pageContext.request.contextPath}/s/home/aboutMe">
		<div class="about-img-box">
			<div class="about-img-con">
				<img
					src="https://img3.yna.co.kr/etc/inner/KR/2020/04/27/AKR20200427066051005_01_i_P2.jpg"
					alt="" />
			</div>
			<p>신성민</p>
			<span class="admin">CodeMountain Admin</span> <span>생년월일
				95.05.18</span> <span>SBS컴퓨터 아카데미 학생</span>
		</div>
	</a>
</div>

-->

<%@ include file="/jsp/part/foot.jspf"%>

