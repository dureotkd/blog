<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf" %>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.css" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.min.js"></script>
  
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
	align-items:center;
}

.section5-left {
	width:50%;
}

.section5-right{
	width:50%;
}

img {
	border-radius:3px;
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
	color:white;
	background-color:black;
	border:1px solid #ccc;
	outline:none;
	font-size:1.2rem;
	cursor:pointer;
	margin:0 auto;
	height:50px;
	width:100%;
	
}

.s-5 {
	letter-spacing:5px;
}

.intro-box {
	display:flex;
	width:60%;
	flex-direction:column;
	align-items:baseline;
	margin: 0 auto;
}

.text-1 {
	text-align:start;
	font-size:1.5rem;
}
.intro-sub {
	width:50%;
	margin: 0 auto;
	text-align:start;
}
.intro {
	text-align:start;
	padding-bottom:10px;
	border-bottom:3px solid;
	width:100%;
}
.intro-item {
	display:flex;
	width:100%;
}
.text-1 {
	display:flex;
	flex-direction:column;
	width:100%;
	margin-left:50px;

}

.fa-quote-left {
	color:#6db33f;
	font-size:3rem;
}

.intro1-box{
	display:flex;
}

.tag-box {
	display:flex;
	justify-content:space-around;
}

.tag {
	padding:20px;
	text-align:center;
	width:150px;
	border-radius:10px;
	background-color:#6db33f;
	color:white;
}

.tag-box2 {
	display:flex;
	justify-content:space-around;
	margin-top:84px;
}
.point {
	font-size:2rem;
}
.box-wrap {
	display:flex;
	width:100%;
	height:100%;
	
}
.left-box {
	width:50%;
}
.left-text-box {
	width:100%;
	height:500px;
	margin:0 auto;
	font-size:3rem;
}

.right-box {
	width:50%;
	height:100%;
	background-color:#292929;
}
.right-text-box {
	width:100%;
	height:18%;
	display:flex;
	justify-content:center;
	}

.head-1 {
	display:flex;
	text-align:left;
	padding-left:40px;
	flex-direction:column;
	padding-top:40px;
}
.body-1 {
	color:#555;
	padding-left:40px;
	text-align:left;
	font-size:1.2rem;
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
	color:#0ac;
	padding-bottom:50px;
	font-size:50px;
}
.row-item {
	width:40%;
	
}
strong {
	text-align:left;
	font-size:0.9vw;
	color:white;
	margin-left:20px;
}
span {
	color:#ddd;
}
.p-body {
	text-align:left;
	color:#ddd;
}

.red {
	color:red;
	border-bottom:2px solid #555;
	width:140px;
	padding-bottom:30px;
}
 </style>
  
<script>
$(document).ready(function(){
  
  // fullpage customization
  $('#fullpage').fullpage({
    sectionSelector: '.section',
    navigation: true,
    slidesNavigation: true,
    css3: true,
    controlArrows: false    
  }); 
});
</script>

<div id="fullpage">
<div class="section">
		<div class="section-1">
	<div class="intro-box">
	 <h2 class="intro">Admin</h2>
	 <div class="intro-item">
	 <img src="https://t1.daumcdn.net/news/201712/28/akn/20171228104215336fydf.jpg" alt="" />
            <div class="text-1">
            <div class="text-head">
            <i class="fas fa-quote-left"></i>
            <p class="point">안녕하세요 테스트하겟습니다</p>
            </div>
            <div class="intro1-box">
  	<p class="text-head">이름</p>
  	<p>: 신성민</p>
  	</div>
  	  <div class="intro1-box">
  	<p class="text-head">생일</p>
  	<p>: 1995.05.18</p>
  	</div>
  	
  	  <div class="intro1-box">
  	<p class="text-head">이메일</p>
  	<p>: dureotkd123@naver.com</p>
  	</div>
  	
  	  <div class="intro1-box">
  	<p class="text-head">성격</p>
  	<p>: Lorem oloribus deserunt vitae tempore voluptate quam nam.</p>
  	</div>
  	
  	<div class="tag-box">
  	<div class="tag">#끈기</div>
  	<div class="tag">#인내</div>
  	</div>
  	
  	<div class="tag-box2">
  	 <div class="tag">#잠없음</div>
  	<div class="tag">#야근가능</div>
  	</div>
  	
  	</div>
            </div>
    </div>
        </div>
        </div>
<div class="section">
	<div class="section-2">
		<div class="box-wrap">
		<div class="left-box">
		<div class="left-text-box">
		<h3 class="head-1">CodeMountain was Made <br> Simple <p class="red"> Design</p> </h3>
		<p class="body-1">열정과 호기심, 코드마운틴 제작이 궁금하세요?</p>
		</div>
		</div>
		<div class="right-box">
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
	</div>
</div>        
      
<div class="section">
	<div class="section-3">
	 <h2>1.처음으로 개인 프로젝트를 하며 느낀점 [백엔드]</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis odio perferendis at et velit aspernatur voluptate perspiciatis ipsa omnis a expedita atque quia ut accusantium minus nesciunt dignissimos molestiae commodi?</p>
        </div>
        </div>
<div class="section">
	<div class="section-4">
	 <h2>2.처음으로 개인 프로젝트를 하며 느낀점 [프론트엔드]</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis odio perferendis at et velit aspernatur voluptate perspiciatis ipsa omnis a expedita atque quia ut accusantium minus nesciunt dignissimos molestiae commodi?</p>
	</div>
</div>



<div class="section">
	<div class="section-5">
	<div class="section5-wrap">
	<div class="section5-left">
	 <h2 class="s-5">CONTACT</h2>
	 	  <form action="doEmail" method="post" class="Email-wrap" >
            <input type="email" name="fromEmail"  class="email" placeholder="User Email"/>
              <input type="text" name="fromUsername"  class="email" placeholder="User Name"/>
              <input type="text" name="subject"  class="email" placeholder="subject"/>
             <textarea name="content" class="content" placeholder="message"></textarea>
             <input type="submit" value="전송" class="submit"/>
        </form>
    </div>
    <div class="section5-right">
    <img src="/blog/resource/css/home/note.jpg" alt="" />
    </div>
 	</div>
        </div>
        </div>
</div>
		
		
<%@ include file="/jsp/part/foot.jspf" %> 

