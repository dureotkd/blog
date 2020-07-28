<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3b1f8c6d21.js" crossorigin="anonymous"></script>    
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.css" rel="stylesheet"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


 <style>

 ul li {
 	list-style:disc;
 }
 
 .section-1{
 	text-align:center;
 	font-size:2rem;
 	height:100%;
 }
 
 .section-2,.section-3,.section-4,.section-5{
 	text-align:center;
 	font-size:2rem;
 	height:100%;
 }
 .skil-image
 {
 
 	width:100px;
	height:100px;
}
.image-box {
	width:100%;
	display:flex;
	justify-content:space-around;
	align-items:center;
}
.text-box {
	width:100%;
	display:flex;
	justify-content:space-around;
	align-items:center;
	font-size:1rem;
}

.progress-box {
	display:flex;
	justify-contenet:spasce-around;
} 

 h2 {
 	margin-top:100px;
 }
 
 
.section > .section-5 >  i {
	font-size:2rem;
	transition:font-size.4s;
}

.section > .section-5 >  i :hover {
	font-size:3rem;
} 

.progress-box {
	display:flex;
	justify-content:space-around;
}

.section5-wrap {
	display:flex;
	margin-top:100px;
	margin-bottom:100px;
	width:100%;
}

.section5-left {
	width:50%;
	margin:0 auto;
}

.section5-right{
	width:50%;
}
.Email-wrap {
	display:flex;
	flex-direction:column;
	width:50%;
	margin:0 auto;
}

.email {
	height:50px;
}

.content {
	height:100px;
}

.submit {
	height:100px;
}

.email,.content,.submit {
	margin-bottom:40px;
	text-align:center;
	font-size:1.2rem;
}

.submit {
	background-color:#232323;
	border:1px solid #ccc;
	outline:none;
	font-size:1.2rem;
	cursor:pointer;
	margin:0 auto;
	height:50px;
	width:100%;
	color:white;
	
}

.s-5 {
	letter-spacing:5px;
	text-align:center;
	color:#232323;
	font-size:40px;
}

.point {
	font-size:2rem;
}
.box-wrap {
	display:flex;
	width:100%;
	height:100%;
	margin-top:100px;
	align-items:baseline;
	
}
.left-box {
	width:50%;
	height:700px;
	display:flex;
	align-items:center;	
	margin-left:50px;
}
.left-text-box {
	width:100%;
	margin:0 auto;
	font-size:3rem;
}

.right-box {
	width:50%;
	height:100%;
	display:flex;
	align-items:center;
	padding-left:100px;
}
.right-text-box {
	width:700px;
	height:700px;
	display:flex;
	justify-content:center;
	border-radius:50%;
	}

.head-1 {
	display:flex;
	text-align:left;
	padding-left:40px;
	flex-direction:column;
	padding-top:40px;
	color:#232323;
}
.body-1 {
	margin-top: -10%;
	color:#232323;
	padding-left:40px;
	text-align:left;
	font-size:1.4rem;
	font-family: 'Noto Serif KR', serif;
}
.column-box {
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	height:100%;
	width:100%;
}

.column-item {
	display:flex;
	width:70%;
	margin-bottom:30px;
}
.column-item > i {
	color:#232323;
	padding-bottom:50px;
	font-size:50px;
}
.row-item {
	width:40%;
	
}
strong {
	text-align:left;
	font-size:16px;
	color:#232323;
	margin-left:20px;
}
span {
	color:#232323;
}
.p-body {
	text-align:left;
	color:#232323;
}

.wrap {
	color:#232323;
}

.red {
	color:#c4001d;
	width:250px;
}


.hash {
	font-size:60px;
	font-weight:700;
	color:#232323;
}

.typing-wrap {
	display:flex;
	align-items:center;
	height:800px;
	justify-content:center;
}


.header-name {
	position:absolute;
	top:0px;	
	left:-0px;
	transform:rotate(-90deg);
	font-size:25px;
	font-weight:700;
	border-bottom:2px solid;
	padding:10px;
	letter-spacing:-2px;
	transition:all 0.5s ease;
	color:#232323;
}

.typewrite {
	font-weight:700;
	color:white;
	font-size:60px;
}




.about-box {
	display:flex;
	max-width:1200px;
	height:700px;
	margin:0 auto;
	flex-direction:column;
	
}

.about-head {
	font-size:2.5rem;
	letter-spacing:-1;
	margin-top:10%;
	display:flex;
	justify-content:center;
}

.about-item {
	width:100%;
	height:100%;
	text-align:left;
	font-size:25px;
	color:#666;
	opacity:1;
	transition:opacity.5s;
}

.about-item.active {
	opacity:0;
}

.about-item2 {
	opacity:0;
}

.about-item2.active {
	opacity:1;
}


.about-cate {
	display:flex;
	justify-content:space-around;
	color:white;
	padding:10px;
	font-size:23px;
	border-bottom:2px solid;
	cursor:pointer;
}
.btn-1,.btn-2 {
	width:50%;
	height:100%;
	transition:background-color.4s;
}

.btn-1:hover,.btn-2:hover {
	background-color:#4e4e4e;
	color:white;
}


.about-item2 {
	position:absolute;
	text-align:left;
	top:243px;
	font-size:25px;
	padding:40;
	transition:opacity.5s;
}

.foot {
	text-align:left;
	position:fixed;
	font-size:15px;
	left:65px;
	bottom:15px;
	color:#757575;
}

.my-btn {
	width:150px;
	height:50px;
	background-color:white;
	cursor:pointer;
}

.section5-right {
	display:flex;
	align-items:center;
}

.section5-right > img {
	height:600px;
}

.section4-wrap {
	display:flex;
	flex-direction:column;
	align-items:center;
	width:100%;
}
.section4-wrap > h2 {
	font-size:40px;
}

.section4-wrap > p {
	font-size:18px;
	color:#888888;
}

.img-item {
	width:600px;
	height:300px;
	overflow:hidden;
	border:2px solid #e0e0e0;
	padding:0px;
}

.img-item > a > img {
	width:600px;
	transition:all ease 1s;
}

.img-item > a > img:hover {
	transform:scale(1.1);
}






@media( max-width:800px ){
	.box-wrap{
		display:flex;
		flex-direction:column;
	}
	
	.header-name {
		transform:rotate(0deg);
		left:auto;
	}
	
	.left-text-box {
		font-size:30px;
		margin-bottom:150px;
	}
	
	.column-item {
		width:80%;
		padding:0;
	}
	
	.section4-wrap > p {
		font-size:11px;
	}
	
	.section5-left {
		width:100%;
	}
	
	.left-box , .right-box{
		width:100%;
		margin-left:0px;
		height:400px;
		padding-left:0;
	}
	.image-box {
		display:flex;
		flex-direction:column;
	}
}




 </style>
  

<head>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CodeMountain</title>

<script>



window.addEventListener('load',function(event){
	 AOS.init();
	  });



// 글자 타이핑 효과

var TxtType = function(el, toRotate, period) {
        this.toRotate = toRotate;
        this.el = el;
        this.loopNum = 0;
        this.period = parseInt(period, 10) || 2000;
        this.txt = '';
        this.tick();
        this.isDeleting = false;
    };

    TxtType.prototype.tick = function() {
        var i = this.loopNum % this.toRotate.length;
        var fullTxt = this.toRotate[i];

        if (this.isDeleting) {
        this.txt = fullTxt.substring(0, this.txt.length - 1);
        } else {
        this.txt = fullTxt.substring(0, this.txt.length + 1);
        }

        this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

        var that = this;
        var delta = 200 - Math.random() * 100;

        if (this.isDeleting) { delta /= 2; }

        if (!this.isDeleting && this.txt === fullTxt) {
        delta = this.period;
        this.isDeleting = true;
        } else if (this.isDeleting && this.txt === '') {
        this.isDeleting = false;
        this.loopNum++;
        delta = 500;
        }

        setTimeout(function() {
        that.tick();
        }, delta);
    };

    window.onload = function() {
        var elements = document.getElementsByClassName('typewrite');
        for (var i=0; i<elements.length; i++) {
            var toRotate = elements[i].getAttribute('data-type');
            var period = elements[i].getAttribute('data-period');
            if (toRotate) {
              new TxtType(elements[i], JSON.parse(toRotate), period);
            }
        }
        // INJECT CSS
        var css = document.createElement("style");
        css.type = "text/css";
        css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
        document.body.appendChild(css);

    };

</script>

</head>

<body>

		<nav class="back-img">
		<div class="typing-wrap">
		<h2 class="header-name" >Shin Sungmin.</h2>
		<div class="typing-con">
						<h3 class="typing-txt">
							<span class="hash">#</span> <span class="typewrite"
								data-period="2000"
								data-type='[ "Portfolio", "I Love", "Design.", "to Develop." ]'>
								<span class="wrap"></span>
							</span>
						</h3>
					</div>
					</div>
			<footer class="foot">ⓒ 2020 신성민. All right reserved.</footer>
			</nav>
      

	<div class="box-wrap">
		<div class="left-box" data-aos="fade-right" data-aos-duration="3000" >
		<div class="left-text-box">
		<h3 class="head-1">CodeMountain was Made <br> Simple <p class="red"> Design</p> </h3>
		<p class="body-1">열정과 호기심, 코드마운틴 제작이 궁금하세요?</p>
		</div>
		</div>
		<div class="right-box" data-aos="fade-left" data-aos-duration="3000">
		<div class="right-text-box">
		<div class="column-box">
		<ul class="column-item">
		<i class="fab fa-github"></i>
		<strong>WEB DESIGN <span>| HTML5 + CSS3 + JQuery</span>
		<p class="p-body">CodeMountain에서는 홈페이지의 목적과 콘텐츠에 맞는 안정적인 UI와 심플한 디자인을 제공합니다.</p>
		</strong>
		</ul>
		<ul class="column-item">
		<i class="fab fa-github"></i>
		<strong>WEB PUBLISHING <span>| Java + Mysql</span>
		<p class="p-body">자바와 Mysql로 제작하였으며 유저의 개인정보와 데이터를 안정적으로 저장하였습니다.</p>
		</strong>
		</ul>
		<ul class="column-item">
		<i class="fab fa-github"></i>
		<strong>WEB Repository <span>| GitHub</span>
			<p class="p-body">GitHub로 작업하였습니다.</p>
		</strong>
		</ul>
		</div>
		</div>
		</div>
		</div>

	
	<div class="section4-wrap"  
     data-aos="fade-down"
     data-aos-easing="linear"
     data-aos-duration="1500">
         <h2>PORTFOLIO_WEB</h2>
         <p>하루에 하나씩 연습삼아 만들고 있습니다.</p>
         
         <div class="image-box">
         <ul class="img-item">
         <a href="/blog/s/home/mywork"><img src="/blog/jsp/home/image-1.PNG" alt="S&S" class="item" /></a>
         </ul>
         <ul class="img-item">
         <a href="/blog/s/home/mywork2"><img src="/blog/jsp/home/image-2.PNG" alt="ANANTI" class="item" /></a>
         </ul>
    </div>
    
    <div class="image-box">
    <ul class="img-item">
    <a href="/blog/s/home/mywork3"><img src="/blog/jsp/home/image-3.JPG" alt="YOUTUBE=1" class="item" /></a>
    </ul>
    
    <ul class="img-item">
    <a href="/blog/s/home/mywork4"><img src="/blog/jsp/home/image-4.JPG" alt="YOUTUBE-2" class="item" /></a>
    </ul>
    </div>




	<div class="section5-wrap ">
	<div class="section5-left">
	 <h2 class="s-5">CONTACT</h2>
	 	  <form action="doEmail" method="post" class="Email-wrap" onsubmit="submitEmailForm(this); return false;" >
            <input type="email" name="fromEmail"  class="email" placeholder="Email"/>
              <input type="text" name="subject"  class="email" placeholder="subject"/>
             <textarea name="content" class="content" ></textarea>
             <input type="submit" value="SEND" class="submit"/>
        </form>
    </div>
 	</div>
    

</body>


		
</html>
