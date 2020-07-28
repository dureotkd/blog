<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/3b1f8c6d21.js"
	crossorigin="anonymous"></script>
<script>
window.addEventListener('load',function(event){
	 AOS.init();
	  });

alert('h2');

</script>

<style>
* {
	padding:0;
	margin:0;
	text-decoration:none;
	color:inherit;
}


ul,li {
	list-style:none;
}

.top-bar {
	position:fixed;
	background:rgba(0,0,0,0.8);
	display:flex;
	justify-content:space-between;
	height:80px;
	width:100%;
	align-items:center;
	z-index:1000;
}


.menu {
	display:flex;
	align-items:center;
}

.right-menu > a > i {
	font-size:30px;
	color:white;
}

.menu > .menu-item > a {
	color:white;
}

.menu {
	display:flex;
	height:100%;
	width:100%;
}

.menu > .menu-item {
	display:flex;
}

.menu > .menu-item > a {
	color:white;
	width:100%;
	padding:0px 18px;
	margin-right:42px;
	display:flex;
	align-items:center;
	font-size:18px;
}

.left-logo > a {
	margin-left:30px;
}
.right-menu > a > i {
	margin-right:30px;
}

.background-img {
	background-image:url(https://www.seogaandcook.com/sns/data/banner/1);
	background-position:center;
	background-size:cover;
	height:100vh;
}

span {
	color:white;
}

.center-text {
	position:absolute;
	display:flex;
	flex-direction:column;
	text-align:center;
	top:35%;
	width:100%;
}


.center-item1 {
	font-size:70px;
}
.center-item2 {
	font-size:80px;
	font-weight:900;
}
.center-item3 {
	margin-top:30px;
	font-size:20px;
}

.img-box2 {
	width:700px;
}
.text-2-box {
	margin-top:auto;
	margin-bottom:auto;
	
}
.text-1 {
	margin-bottom:30px;
	font-size:2rem;
}
.text-2 {
	font-size:2rem;
}
.text-3 {
	display:flex;
	flex-direction:column;
	margin-top:30px;
	font-size:17px;
	line-height:30px;
	color:#888888;
}

.btn-1 {
	border:none;
	background-color:#333333;
	color:#fff;
	margin-top:30px;
	text-align:center;
	width:170px;
	height:50px;
}

.center-2-box {
	display:flex;
}

.img-box2 {
	padding:100px;
}

.p-top-box{
	display:flex;
	flex-direction:column;
	align-items:center;
}

.text-center-3 {
	text-transform:unppercase;
	letter-spacing:-1px;
	font-size:50px;
	color:#222222;
}


.p-center-box {

	display:flex;
	justify-content:space-around;
	margin:50px auto;
	width:50%;
	font-size:25px;
	color:darkslategray;
	
}

.p-center-3 {
	color:#888;
	font-size:18px;
	letter-spacing:-2px;
	margin-top:10px;
}

.chapter-2,.chapter-3 {
	margin-top:180px;
}

.c4-img-box{
	display:flex;
	width:100%;
	margin-bottom:300px;
}
.c4-left-img {
	background-image:url(https://www.seogaandcook.com/sns/img/main/main_story_v0301.png);
	height:600px;
	background-size:cover;
	width:1900px;
	color:white;
	display:flex;
	flex-direction:column;
	justify-content:center;
	margin-left:20px;
	align-items:center;
}


.c4-right-img {
	width:100%;
	display:flex;
	flex-direction:column;
}

.brand {
	font-size:35px;
	font-weight:300;
	margin-bottom:10px;
}
.brand-sub{
	font-size:20px;
}

.r-img-1 {
	background-image:url(https://www.seogaandcook.com/sns/img/main/main_story_v0302.png);
	background-repeat:no-repeat;
	height:300px;
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	color:white;
}
.r-img-2 {
	background-image:url(https://www.seogaandcook.com/sns/img/main/main_story_v0303.png);
	height:300px;
	background-repeat:no-repeat;
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	color:white;
}
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeMountain</title>
</head>
<body>

<header class="top-bar">
<div class="left-logo">
<a href="#"><img src="https://www.seogaandcook.com/sns/img/common/logo.png" alt="왼쪽로고" class="logo"/></a>
</div>
<div class="center-menu">
<ul class="menu">
	<li class="menu-item"><a href="#">ABOUT US</a></li>
	<li class="menu-item"><a href="#">WORK</a></li>
	<li class="menu-item"><a href="#">S&S STORY</a></li>
	<li class="menu-item"><a href="#">BRAND</a></li>
	<li class="menu-item"><a href="#">PEOPLE</a></li>
	<li class="menu-item"><a href="#">COMMUNITY</a></li>
</ul>
</div>
<div class="right-menu"><a href="/blog/s/home/main"><i class="fas fa-bars"></i></a></div>
</header>
<section class="background-img">
<div class="center-text"  data-aos="fade-down" data-aos-easing="linear" data-aos-duration="2000">
<span class="center-item1">
WHERE THE
</span>
<span class="center-item2">
TASTY STORY BEGINS
</span>
<span class="center-item3">
맛있는 이야기가 시작되는 곳
</span>
</div>
</section>


<section class="chapter-2">

<nav class="center-2-box"   data-aos="fade-up" data-aos-duration="2000" >
<img src="https://www.seogaandcook.com/sns/img/main/main_ourtime.png" alt="요리" class="img-box2" />
<div class="text-2-box">
<p class="text-1">S&S STORY</p>
<h3 class="text-2">
OUR TIME
IN THE SAME TIME</h3>
<p class="text-3">
우리는 그때 그곳에서처럼 당신을 기다립니다.
<br>
맛있는 음식, 다정하게 내 이름을 부르는 사람, 마주보며 웃는 당신이 있는 곳
<br>
이곳은 S&S입니다.</</p>
<button class="btn-1">VIEW MORE</button>
</div>

</nav>

</section>

<section class="chapter-3">

<nav class="center-3-box" data-aos="fade-up" data-aos-duration="2000" >
<div class="p-top-box">
<h1 class="text-center-3 ">CREATE A PERSON'S STORY</h1>
<p class="p-center-3">S&S는 사람과 공간이 함께 어울릴 수 있도록 더 풍요롭고 더 맛있는 기회와 가치를 제공합니다.</p>
</div>

<div class="p-center-box">
<h3 class="text-item">토끼정</h3>
<h3 class="text-item">SEOGA & COOK</h3>
<h3 class="text-item">소싯적</h3>
<h3 class="text-item">숨쉬는 순두부</h3>
</div>

<div class="c4-img-box">

<div class="c4-left-img"><h2 class="BRAND">BRAND</h2><p class="brand-sub">토끼정 당신과 나의 마음이 머무르는 곳</p></div>

<div class="c4-right-img">
<div class="r-img-1"><h2 class="BRAND">MENU</h2><p class="brand-sub">일식과 한식의 조화로 한국인의 입맛을 재해석 하다</p></div>
<div class="r-img-2"><h2 class="BRAND">CONCEPT</h2><p class="brand-sub">아름다운 분위기에 맛을 더하다</p></div>
</div>
</div>
</nav>

</section>


</body>
</html>