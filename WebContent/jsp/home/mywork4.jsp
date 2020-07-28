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

<style>
* {
	padding:0;
	margin:0;
	color:inherit;
	text-decoration:none;
}

ul,li {
	list-style:none;
}

.top-bar {
	height:60px;
	display:flex;
	width:100%;
	justify-content:space-between;
	align-items:center;
}

.left-item {
	display:flex;
	
}

.left-item  > i {
	padding:5px;
}

.logo > i {
	color:red;
	padding:5px;
}
.left-item {
	margin-left:5px;
}

.right-item  i{
	margin-right:25px;
}

.right-item {
	display:flex;
	align-items:center;
	margin-right:5px;
}

 img {
 	border-radius:50%;
 	padding:5px;
 	height:32px;
 	width:32px;
 }
 
 .video-wrap {
 	display:flex;
 	justify-content:center;
 	background:#140a00;
 }
 
 iframe {
 	width:100%;
 	max-width:1000px;
 	height:720px;
 }
 hash-tags {
 	margin-top:15px;
 }
 .hash-tags > span {
 	padding:10px;
 	color:#045fd4;
 	font-size:14px;
 	margin-top:10px;
 }
 
 .column-item {
 	display:flex;
 	flex-direction:column;
 	padding:10px;
 	align-items:center;
 }
 
 .views {
 	display:flex;
 	justify-content:space-around;
 	align-items:center;
 	margin-top:3px;
 	border-bottom:1px solid #ccc;
 	margin:10px;
 }
 
 
 .title > span {
 	font-size:18px;
 	margin-left:10px;
 }
 
.channel {
	display:flex;
	justify-content:space-between;
	margin:10px;
}

.channel > button {
	background:red;
	color:white;
	border-radius:2px;
	width:100px;
	height:42px;
	border:none;
	outline:none;
}

.channel-info {
	display:flex;
	flex-direction:column;
	margin-left:10px;
}

.channel-info > span {
	color:#909090;
	font-size:12px;
}

.meta {
	display:flex;
}

button {
	cursor:pointer;
}
 
@media( max-width:800px ){
	iframe {
		height:300px;
	}
}


</style>

<script>
window.addEventListener('load',function(event){
	 AOS.init();
	  });
</script>

</head>
<header class="top-bar">
<div class="left-item">
<i class="fas fa-bars"></i>
<div class="logo">
<i class="fab fa-youtube"></i>
<span>YOUTUBE</span>
</div>
</div>

<div class="right-item">
<i class="fas fa-search"></i>
<i class="fas fa-video"></i>
<i class="fas fa-ellipsis-v"></i>
<i class="fas fa-bell"></i>
<img src="https://yt3.ggpht.com/a-/AOh14GjOrFI0WOrVRHRcZ6aBsG-IPRfxA4KBxQcw5LqP=s88-c-k-c0xffffffff-no-rj-mo" alt="" />
</div>
</header>

<div class="video-wrap">
<iframe width="1280" height="720" src="https://www.youtube.com/embed/0yBnIUX0QAE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<div class="hash-tags">
<span>#Toploader</span>
<span>#DancingInTheMoonlight</span>
<span> #Vevo</span>
</div>

<div class="title">
<span>Toploader - Dancing in the Moonlight (Official Video)</span>
</div>

<div class="views">
<span>조회수 8481만 </span>
<div class="column-item">
<i class="fas fa-thumbs-up"></i>
<span>54만</span>
</div>

<div class="column-item">
<i class="fas fa-angry"></i>
<span>1.3만</span>
</div>

<div class="column-item">
<i class="fas fa-share"></i>
<span>공유</span>
</div>

<div class="column-item">
<i class="fas fa-download"></i>
<span>저장</span>
</div>
</div>

<div class="channel">

<div class="meta">
<img src="http://yt3.ggpht.com/a/AATXAJz9hdaVbrtHOuZWtB9SZTzYtDZ-ibF1xUxq7X7_=s48-c-k-c0xffffffff-no-nd-rj" alt="" />
<div class="channel-info">
<p>Toploaderofficial</p>
<span>구독자 7.23만명</span>
</div>
</div>

<button>구독</button>
</div>


<body>

</body>
</html>