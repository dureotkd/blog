<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");
List<Article> articles2 = (List<Article>) request.getAttribute("articles2");
int totalPage = (int) request.getAttribute("totalPage");
int paramPage = (int) request.getAttribute("page");
String cateItemName = (String)request.getAttribute("cateItemName");
%>
 
<style>
h1 {
	color:black;
	font-size:2rem;
}

.contentbtn {
font-family: 'Noto Sans KR', sans-serif;
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
	padding:16px 48px;
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
	padding:16px 48px;
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
	padding:16px 48px;
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
	padding:16px 48px;
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
  margin:0 auto;
  border-radius : 5px;
}

.progress-container {
  transform: translateY(-50%);
  top: 25%;
  position: absolute;
  width: calc(100% - 200px);
  color: #FFF;
  text-align: center;
  width:50%;
}

.progress-container label {
  font-family: 'Black Han Sans', sans-serif;
  font-size: 3rem;
  opacity: 1;
  display:inline-block;
}
.button-box{
	width:100%;
	display:flex;
	justify-content:center;
}


@keyframes anim {
  0% {
    opacity: 0;
    transform: translateX(-300px);
  }
  33% {
    opacity: 1;
    transform: translateX(0px);
  }
  66% {
    opacity: 1;
    transform: translateX(0px);
  }
  100% {
    opacity: 0;
    transform: translateX(300px);
  }
}

@-webkit-keyframes anim {
  0% {
    opacity: 0;
    -webkit-transform: translateX(-300px);
  }
  33% {
    opacity: 1;
    -webkit-transform: translateX(0px);
  }
  66% {
    opacity: 1;
    -webkit-transform: translateX(0px);
  }
  100% {
    opacity: 0;
    -webkit-transform: translateX(300px);
  }
}

.list-con {
	width:50%;
	margin:0 auto;
}

.list-box {
	flex-wrap : wrap;
	display:flex;
	justify-content:space-between;
	width:100%;
	margin-bottom:30px;
}

.table-box {
	display:flex;
	flex-direction:row;
	width:50%;
	margin:0 auto;
}
.recent-con {
	width:50%;
}

.cate {
	margin-top:50px;
	text-align:center;
}
.fa-folder-open{
	color:brown;
}
.fa-clock{
	color:#0277bd;
}
.table-item {
	display:flex;
	flex-direction:column;
	margin-bottom:30px;
}
.recent-cont {
	width:50%;
}
.view-cont {
	width:50%;
}
.view-item {
	display:flex;
	flex-direction:column;
	margin-bottom:30px;
	padding-bottom:30px;
	border-bottom:1px solid #ccc;
}



.fa-hotjar {
	color:red;
}
/* 800px 이하면 안보이게 ( 모바일 버전 ) */
@media ( max-width :799px ) {
	.visible-on-sm-up {
		display: none !important;
	}
}

/* 800px 이하면 안보이게 ( 모바일 버전 ) */

/* 800px 이상이면 안보이게 ( pc 버전 ) */
@media ( min-width :800px ) {
	.visible-on-sm-down {
		display: none !important;
	}ol
}

@media ( min-width: 480px){
	*{
		font-size:0.8vw;
		font-size:1.5vmax;
		font-size:1.8vmin;
	}
}

.post-name {
	padding-bottom:30px;
	margin: 0px auto;
	margin-top:200px;
	width:60%;
	border-bottom:2px solid;
}

.inner-wrap{
	width:60%;
	margin:30px auto;
}




.tag-title {
	font-size:2rem;
	padding-bottom:10px;
	font-weight:bold;
}

.tag-body {
	width:100%;
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
	height:155px;	
	color:#666;
	font-size:1.5rem;
}

.tag-sub {
	color:#ccc;
	padding-bottom:30px;
}

.post-name {
	font-size:2rem;
}
.btn-1 {
	margin-top:30px;
	width:150px;
	height:50px;
	background-color:black;
	border-radius:5px;
	color:white;
	border:none;
	cursor:pointer;
}	

.link-wrap {
	width:60%;
	margin: 30px auto;
}

.links {
	font-size:2rem;
}

.img-2 {
	width:100%;
	border-radius:5px;
}

h2 {
	font-weight:bold;
	font-size:2rem;
}
.about-sub {
	width:60%;
	margin:100px auto;
}
.about-body {
	font-size:1.5rem;
	color:#212121;
	margin-bottom:30px;
}

* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  position: relative;
  margin: auto;
}
.slideshow-container > div:not(:first-child){
	display:none;
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
  background-color: rgba(0,0,0,0.8);
  color:white;
}

/* Caption text */
.text {
  color: black;
  font-size: 3rem;
  position: absolute;
  top:140px;
  left:20%;
  width: 100%;
  font-weight:bold;
}

.text-wrap {
	position:absolute;
	top:250px;
	left:20%;
	width:50%;
}

.text-wrap > .text-body {
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:no-wrap;
	height:125px;
	font-size:40px;
}


.text-btn {
	margin-top:30px;
	color:white;
	position:absolute;
	top:400px;
	left:20%;
	width:150px;
	height:50px;
	outline:none;
	border:none;
	border-radius:5px;
	background-color:black;
	cursor:pointer;
}



/* Number text (1/3 etc) */
.numbertext {
  color: black;
  font-size: 1.5rem;
  padding: 8px 12px;
  position: absolute;
  top: 30px;
  left: 30px;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active2, .dot:hover {
  background-color: darkgreen;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}


/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

.email-box {
	display:flex;
	align-items:center;
	justify-content:space-between;
	border:1px solid #ccc;
	padding:30px;
	border-radius:5px;
}
.email-box > i {
	font-size:2rem;
}
.fa-envelope{
	color:black;
	font-size:2rem;
	transition:font-size.4s;
}
.fa-envelope:hover {
	font-size:4rem;
}
.email-box > a{
	font-size:1.5rem;
	color:red;
}

.post-name {
	width:100%;
}


.ClickMe{
  background:black;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.ClickMe:hover{
  background:#fff;
  color:#1AAB8A;
}
.ClickMe:before,.ClickMe:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.ClickMe:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.ClickMe:hover:before,.ClickMe:hover:after{
  width:100%;
  transition:800ms ease all;
}





/* 800px 이상이면 안보이게 ( pc 버전 ) */
</style>
<!--  * ================================= pc 화면  ================================= */-->
		
		<div class="wrap">
		<div class="slideshow-container">
<% for ( Article article : articles ) {%>
<div class="mySlides fade">
	<div class="circles">
		<div class="circle-1"></div>
		<div class="circle-2"></div>
	</div>
  <div class="numbertext">No.<%=article.getId()%></div>
  <img src="https://i.pinimg.com/originals/7c/cb/01/7ccb010d8fddc4bcd84587ef3c34d100.jpg" style="width:100%; height:80%;">
  <div class="text"><%= article.getTitle() %></div>
  <div class="text-wrap">
  <div class="text-body"><%=article.getBody()%></div>
  </div>
  <button class="text-btn" onclick="location.href='${pageContext.request.contextPath}/s/article/detail?cateItemId=${param.cateItemId}&id=<%= article.getId()%>'">자세히 보기</button>
</div>
<% } %>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>

<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>
				</div>
			
		
		
		<div class="inner-wrap">
		<p class="post-name">POPULAR POSTS</p>
		<%
			for ( Article article2 : articles2){
			%>
			<div class="view-item">
			<p class="tag-title" ><%=article2.getTitle() %></p>
			<span class="tag-sub">
			<%=article2.getRegDate()%>
			&nbsp;&nbsp;&nbsp;조회수 : <%=article2.getHit()%>
			</span>
			<p class="tag-body"><%=article2.getBody()%></p>
			<button class="btn-1" onclick="location.href='${pageContext.request.contextPath}/s/article/detail?cateItemId=${param.cateItemId}&id=<%= article2.getId()%>'">
			자세히 보기
			</button>
			</div>
			<%
			}
			%>
		</div>
	
		
		<div class="about-sub">
		 <a href="#"><h2>ABOUT ME</h2></a>
		<button class="ClickMe" onclick="location.href='${pageContext.request.contextPath}/s/home/aboutMe'">Click Me</button>
		</div>
	

<%@ include file="/jsp/part/foot.jspf"%>
