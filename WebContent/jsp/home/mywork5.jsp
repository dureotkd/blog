<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link
	href="https://fonts.googleapis.com/css2?family=Archivo:wght@500&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	padding:0;
	margin:0;
	text-decoration:none;
	color:inherit;
}

ul,li{
	list-style:none;
}

.top-bar {
	display:flex;
	height:90px;
	justify-content:space-around;
	align-items:center;
    position:fixed;
    z-index: 1000;
    width:100%;
    top: 0;
    background:white;
}

.left-item {
	display:flex;
}

.left-item > ul {
	display:flex;
	align-items:center;
}

.left-item > ul  > li  {
	margin-right:10px;
	font-size:1.2rem;	
}

.left-item > a > img {
	margin-right:130px;
}

.right-item {
	display:flex;
	align-items:center;
}

.content {
	position:relative;
	width:100%;
	background-position:50% 50%;
	background-size:cover;
	background-image:url(https://static.line-scdn.net/linecorpweb-uit/1738f6810c3/images/im_top_mv.jpg);
	overflow:hidden;
	background-repeat:no-repeat;
	height:610px;
    margin-top: 90px;
}

iframe {
	display:block;
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%, -50%);
	overflow:hidden;
}

.mv-box {
	display:flex;
	flex-direction:column;
	height:100%;
	position:absolute;
	left:0;
	right:0;
	top:0;
	align-items:center;
	justify-content:center;
}

.mv-box > span {
	font-size:50px;
	color:white;
	font-weight:700;
}

.mv-box > a {
	padding: 10px;
	border:solid 1px rgba(255,255,255,0.7);
	border-radius:22px;
	background-color:none;	
	color:white;
	font-size:17px;
	margin-top:20px;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 200px;
    height:15px;
}

    .content01 {
        margin: 0 auto;
        max-width: 1120px;
    }
	.content01 > h2 {
		font-weight:400;
		padding-top:69px;
		padding-bottom:39px;
	}
	.new-item-wrap{
		display:flex;
		margin-bottom:25px;
	}
	
	.news-item {
		width:50%;
	}
	
	.news-item > span {
		color:#00b900;
	}
	
	.news-item > p {
		font-size:1.125rem;
		line-height:1.2;
		margin-bottom:14px;
	}
	
	.content02 {
		width:100%;
		background:#f9f9f9;
		
	}
	.content02 ul {
		max-width:1120px;
		padding:52px 0 44px;
		display:flex;
		margin:0 auto;
	}
	
	.item > span {
		font-size:.9375rem;
		line-height:23px;
		color:#adadad;
	}
	
	.item > p {
		color:#191919;
		font-size:1.25rem;
		font-weight:300;
		margin-bottom:20px;
	}
	
	
	
	
	
	
	
	





</style>

<script>

</script>

</head>
<body>

<header class="top-bar">
<div class="left-item">
<a href="#"><img src="https://static.line-scdn.net/linecorpweb-uit/1738f6810c3/images/logo_h1_v2.png" alt="" /></a>
<ul class="menu">
	<li>회사소개</li>
	<li>사업</li>
	<li>홍보</li>
	<li>채용</li>
</ul>
</div>
<div class="right-item">
<a href="#">SITEMAP</a>
<ul class="language">
<li>한국어</li>
<li><i class="fas fa-angle-down"></i></li>
</ul>
</div>
</header>

<div class="content">
<iframe id="mvclip" class="mvclip" frameborder="0" allowfullscreen="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" title="YouTube video player" width="640" height="360" src="https://www.youtube.com/embed/JPpiKm8dKR8?playlist=JPpiKm8dKR8&amp;autoplay=1&amp;loop=1&amp;controls=0&amp;showinfo=0&amp;modestbranding=1&amp;fs=0&amp;rel=0&amp;wmode=transparent&amp;enablejsapi=1&amp;origin=https%3A%2F%2Flinepluscorp.com&amp;widgetid=1" style="width: 1920px; height: 1080px;"></iframe>
<div class="mv-box">
<span>CLOSING THE DISTANCE</span>
<a href="#">LINE's Philosophy</a>
</div>
</div>

<div class="content01">
    <h2>NEWS ROOM</h2>
    <div class="new-item-wrap">
    <a class="news-item">
       <p>라인, 글로벌 무대를 함께 할 경력 개발자 공개채용 진행</p>
       <span>2020.07.06 ALL</span> 
    </a>
    <a class="news-item">
       <p>라인, 글로벌 무대를 함께 할 경력 개발자 공개채용 진행</p>
       <span>2020.07.06 ALL</span> 
    </a>
    </div>
    
    <div class="new-item-wrap">
    <a class="news-item">
       <p>라인과 국제백신연구소(IVI), 전 세계 예방접종 및 백신 개발 촉진 위한 BT21 기부 스티커 출시</p>
       <span>2020.06.30 ALL</span> 
    </a>
    <a class="news-item">
       <p>라인스튜디오, 카카오게임즈와 ‘HELLO BT21’ 사전 등록 시작</p>
       <span>2020.06.23 ALL</span> 
    </a>
    </div>
    
    <div class="new-item-wrap">
    <a class="news-item">
       <p>라인스튜디오, 카카오게임즈와 ‘HELLO BT21’ 국내 공동 퍼블리싱 계약 체결</p>
       <span>2020.05.27 ALL</span> 
    </a>
    <a class="news-item">
       <p>라인과 국제백신연구소(IVI), 백신접종의 중요성 알리기 위해 파트너십 체결</p>
       <span>2020.04.23 ALL</span> 
    </a>
    </div>
    
     <div class="new-item-wrap">
    <a class="news-item">
       <p>라인, ‘Google 어시스턴트’ 지원한다</p>
       <span>2020.04.19 ALL</span> 
    </a>
    <a class="news-item">
       <p>전세계 퍼즐 버블슈팅 게임 끝판왕, 라인스튜디오 대표게임 [라인 버블2] 서비스 5주년 맞아 이벤트 개최</p>
       <span>2020.04.16 ALL</span> 
    </a>
    </div>
</div>

<div class="content02">
	<ul>
		<li class="item">
		<p>비즈니스 제휴 문의</p>
		<span>LINE은 사용자들의 커뮤니케이션을 더욱 즐겁게 만들어줄 파트너 기업을 모집합니다.</span>
		</li>
		<li class="item">
		<p>기술정보</p>
		<span>LINE의 개발자들은 다양한 서비스를 개발하며, 기술적 도전을 매일 경험하고있습니다.</span>
		</li>
		<li class="item">
		<p>채용공고</p>
		<span>전 세계 인재들과 함께 내 커리어를 level up 하고 싶다면 지금 LINE에 조인하세요!</span>
		</li>
		<li class="item">
		<p>캐릭터 사업</p>
		<span>메신저 속 LINE FRIENDS의 다양한 제품들은 물론, 특별한 경험도 선사합니다.</span>
		</li>
	</ul>
</div>
</body>
</html>