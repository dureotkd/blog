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
<title>Insert title here</title>

<style>

* {
	padding:0;
	margin:0;
	color:inherit;
	text-decoration:none;
	box-sizing:border-box;
}

ul,li {
	list-style:none;
}


.top-bar {
	display:flex;
	justify-content:space-between;
	height:48px;
	background:#111;
	align-items:center;
}

.logo > a  {
	padding:12px;
	color:white;
}

.logo > a > .fab{
	color:red;
	margin-right:5px;
}

.top-bar >  .link {
	padding:12px;
	color:white;
}

.fa-search {
	margin-right:30px;
}
.fa-ellipsis-v {
	margin-right:5px;
}

.video-wrap {
	display:flex;
	align-items:center;
	justify-content:center;
	background-color:#140a00;
}

iframe {
	width:100%;
	max-width:1000px;
	height:100%;
}

.title {
	padding:8px 12px;
	display:flex; 
	justify-content:space-between;
}

.hash-tags {
	color:#045fd4;
	display:flex;
	font-size:12px;
	padding:8px 12px;
	
}

.hash-tags > .item {
	margin-right:8px;
}

.title > i {
	font-size:9px;
}

.sub {
	font-size:10px;
	color:#909090;
	padding:8px 12px;
}

.icons {
	display:flex;
	justify-content:space-around;
	margin:10px 0;
	color:#888888;
}

button {
	margin-top:6px;
	display:flex;
	align-items:center;
	flex-direction:column;
	background-color:white;
	border:none;
	outline:none;
}

button > i {
	margin-bottom:6px;
}

.info-box {
	display:flex;
	justify-content:space-between;
	align-items:center;
	padding:8px 12px;
}


.info-box2 {
	display:flex;
	flex-direction:column;
}

.info-box2 > span {
	color:#909090;
	font-size:12px;
}

 img {
	border-radius:50%;
	margin-right:40px;
}

.scribe {
	color:red;
}

.metadata {
	display:flex;
}







</style>


<script>


</script>


</head>

<body>

<header class="top-bar">
<div class="logo"><a href="#"><i class="fab fa-youtube"></i><span>YOUTUBE</span></a></div>

<div class="link">
<i class="fas fa-search"></i>
<i class="fas fa-ellipsis-v"></i>
</div>
</header>

<div class="video-wrap">
<iframe width="1280" height="720" src="https://www.youtube.com/embed/QZng89VxKWg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>

<ul class="hash-tags">
	<li class="item">#Music</li>
	<li class="item">#Sezilas</li>
	<li class="item">#BillbordCharts</li>
</ul>

<div class="title"><span>Seazaril - It's You </span><i class="fas fa-angle-down"></i></div>
<span class="sub">1M views 1 month ago </span>

<ul class="icons">
	<li><button><i class="fas fa-thumbs-up"></i><span>1K</span></button></li>
	<li><button><i class="fas fa-thumbs-down"></i><span>0</span></button></li>
	<li><button><i class="fas fa-undo-alt"></i><span>Share</span></button></li>
	<li><button><i class="fas fa-plus"></i><span>Save</span></button></li>
	<li><button><i class="fas fa-flag"></i><span>Report</span></button></li>
</ul>

<ul class="info-box">
<div class="metadata">
<img src="http://yt3.ggpht.com/a/AATXAJyvI5Ts8bwp5zQ2u8m1vIhj-reW8zFKp5lcQ5Q5Ng=s48-c-k-c0xffffffff-no-nd-rj" alt="" />
<li class="info-box2">
<p>Seazaril</p>
<span>1M subcribers</span>
</li>
</div>


<li class="scribe">SUBSCRIBE</li>
</ul>

</body>



</html>