<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/3b1f8c6d21.js" crossorigin="anonymous"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeMountain</title>
</head>
<body>



<style>
* {
	margin:0;
	padding:0;
	text-decoration:none;
	color:inherit;
}
ul,li{
	list-style:none;
}

.top-bar {
	display:flex;
	justify-content:space-between;
	height:100px;
	align-items:center;
}

.left-menu {
	margin-left:30px;
}

.logo {
	margin-left:20%;
}
.right-menu {
	margin-right:30px;
}

.right-menu > a {
	padding: 0px 11px;
	font-size:12px;
	font-weight:300;
	line-height:34px;
}

.sub-bar {
	height:50px;
	padding:0 10px;
	font-size:18px;
	line-height:60px;
	display:flex;
	justify-content:center;
	align-items:center;
}

.sub-bar > a {
	padding:0px 32px;
	transition:color.3s;
	font-weight:400;
}

.sub-bar > a:hover {
	color:#a7a7a7;
}



/* Slideshow container */
.slideshow-container {
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
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
  .text {font-size: 11px}
}
.dot {
	display:none;
}

.text {
	position:absolute;
	bottom:200px;
	left:17%;
	z-index:10;
	color:white;
	text-align:left;
}

.text > h2 {
	font-size:45px;
	font-weight:700;
	line-height:55px;
	padding-bottom:30px;
}
.text > span {
	font-weight:300;
	font-size:17px;
	display:block;
	line-height:30px;
}

.text-center-2 > p {
	text-align:center;
	font-size:35px;
	font-weight:500;
	margin-top:100px;
	line-height:60px;
}

.text-center-3{
	display:flex;
	justify-content:center;
	font-size:15px;
	color:#888;
}
.text-center-3 > p {
	text-align:center;
	line-height:30px;
}

.video-wrap {
	display:flex;
	justify-content:center;
	margin-top:100px;
}

.text-center-4{
	display:flex;
	justify-content:center;
	font-size:15px;
	color:#888;
	margin-top:70px;
}

.text-center-4 > p {
	text-align:center;
	line-height:30px;
}

.text-center-5 {
	display:flex;
	justify-content:center;
	margin-top:100px;
}

.text-center-item1 {
	display:flex;
	margin-left:50px;
	flex-direction:column;
	justify-content:space-around;
}

.text-center-item1 > h2 {
	font-size:30px;
	font-weight:500;
	line-height:50px;
	text-align:center;
}

.text-center-item1 > p {
	text-align:center;
	line-height:30px;
	font-size:15px;
	color:#888;
}

.text-center-item1 > button {
	border:1px solid;
	height:50px;
	width:200px;
	background:white;
	color:black;
	margin: 0px auto;
}

button {
	cursor:pointer;
}

.left-menu-item {
	width:800px;
	left:-800px;
	height:80%;
	position:absolute;
	top:0;
	z-index:20;
	background-color:white;
}
.menu-item-box > a {
	padding:20px;
	font-size:30px;
	line-height:30px;
}

.left-menu-item > img {
	display:flex;
	margin:50px auto;
}

.menu-item-box {
	display:flex;
	justify-content:center;
	flex-direction:column;
	align-items:center;
}









</style>





<header class="top-bar">
<ul class="left-menu"><img src="https://www.ananti.kr/kr/img/common/hd_menu.gif" alt="" /></ul>
<ul class="logo"><a href="#"><img src="https://www.ananti.kr/kr/img/logo/logo_renew.png" alt="" /></a></ul>
<ul class="right-menu">
<a href="#">메뉴</a>
<a href="#">예약</a>
<a href="#">쿠폰예약</a>
<a href="#">회사소개</a>
<a href="#">고객센터</a>
<a href="#">로그인</a>
<a href="#">Korean</a>
</ul>
</header>

<div class="sub-bar">
<a href="#">아난티 코드</a>
<a href="#">아난티 코드</a>
<a href="#">아난티 남해</a>
<a href="#">아난티 청담</a>
<a href="#">빌라드 쥬 아난티</a>
<a href="#">힐튼 부산</a>
<a href="#">닥터 아난티</a>
<a href="#">아난티 회원권</a>	
</div>

<div class="left-menu-item">
<div class="left-top">
<img src="https://www.ananti.kr/kr/img/logo/logo_renew.png" alt="" />
<i class="fas fa-times"></i>
</div>
<div class="menu-item-box">
<a href="#" class="menu-item">아난티 코드</a>
<a href="#" class="menu-item">아난티 남해</a>
<a href="#" class="menu-item">아난티 청담</a>
<a href="#" class="menu-item">빌라쥬 드 아난티</a>
<a href="#" class="menu-item">아난티 부산</a>
<a href="#" class="menu-item">닥터 아난티</a>
<a href="#" class="menu-item">아난티 회원권</a>
</div>

</div>

<div class="text">
<h2>외국보다 더 좋은 아난티</h2>
<span>
원시림이 그대로 보존된 75만 평의 숲 속, 시야와 소음의 방해 없이 탁 트인 바다.
<br>
지금까지 누구의 손길도 거치지 않은 대자연,
<br>
누구나 가고 싶어 하는 가장 이상적인 장소에 바로 아난티가 있습니다.				
</span>
</div>

<div class="slideshow-container">

<div class="mySlides fade">
  <img src="https://www.ananti.kr/kr/img/main/landing_cove_main.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <img src="https://www.ananti.kr/kr/img/main/scent_20_7_wide.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <img src="https://www.ananti.kr/kr/img/main/landing_chord_main4.jpg" style="width:100%">
</div>

</div>
<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>


<div class="text-center-wrap">
<div class="text-center-2">
<p>
더 이상 외국의 바다를 찾을 필요가 없는 이유
<br>
아난티 코브
</p>
</div>

<div class="text-center-3">
<p>
아난티 코브는 지금까지와는 전혀 다른 호텔, '힐튼 부산'과 한국에서 가장 좋은 온천 '워터하우스',
<br>
다양한 미식과 라이프스타일을 만날 수 있는 '아난티 타운'
<br>
그리고 '아난티 펜트하우스'와 '프라이빗 레지던스'가 있는 하나의 마을입니다.
</p>
</div>
</div>

<div class="video-wrap">
<iframe width="1200" height="750" src="https://www.youtube.com/embed/h05yJwLzx7c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<div class="text-center-4">
<p>
파도 소리와 함께 해안선을 따라 산책로가 길게 이어지고,
<br>
이터널저니, 워터하우스, 아난티타운 등 부대 시설도 층층이 세우는 대신
<br>
바다를 향해 개방해 어디서든 자연을 가까이 만나게 됩니다.
<br>
온종일 건강한 액티비티를 즐기고 고요한 객실 안에서 취하는 온전한 휴식 시간.
<br>
더 이상 외국의 바다를 찾을 필요가 없는 이유는 바로 아난티 코브가 있기 때문입니다.
</p>
</div>

<div class="text-center-5">
<img src="https://www.ananti.kr/kr/img/main/infinity800_2.jpg" alt="" />

<div class="text-center-item1">
<h2>
한계를 모르는 바다와의 수평선,
<br>
오션 인피니티 풀
</h2>
<p>
외국의 유명 리조트처럼 바다와 맞닿은 오션 인피니티 풀을 경험하고 싶다면,
<br>
제대로 된 호텔 서비스를 누리며 여유로운 물놀이를 즐기고 싶다면, 힐튼 부산으로 떠날 때입니다.
<br>
하늘과 바다에 맞닿은 인피니티 풀에서 즐거운 여름을 여유롭게 즐겨 보세요.
</p>

<button>워터하우스 이용 안내</button>

</div>
</div>





<script>
window.addEventListener('load',function(event){
	 AOS.init();
	  });

var slideIndex = 0;
showSlides();


var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 6000); // Change image every 2 seconds
}


function LeftSideBar__init() {
	var $btnToggleLeftSideBar = $('.left-menu');

	$btnToggleLeftSideBar.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.left-menu-item').removeClass('active');
		} else {
			$(this).addClass('active');
			$('.left-menu-item').addClass('active');
		}	
	});
}
$(function() {
	LeftSideBar__init();
});


</script>


</body>
</html>