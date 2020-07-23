
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	Article article = (Article) request.getAttribute("article");
	String cateItemName = (String) request.getAttribute("cateItemName");
%>

<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />



<style>
.tui-editor-contents :not(table){
	line-height:2.0em;
}
.head2 {
	background-image: url(http://www.awesomecorp.kr/img_new/portbg.jpg);
	height: 400px;
	background-repeat: no-repeat;
	background-size: cover;
}

.table-box {
	margin-bottom:150px;
	margin-top: 50px;
}

.title {
	margin-bottom:30px;
	text-align:center;
	font-weight: bold;
	font-size: 2em;
}

.flex {
	display: flex;
}

.head2 {
	background-color: silver;
	flex-direction: column;
}

.head2>.boardName {
	font-size: 40px;
	display: flex;
	flex: 1 0 0;
	color: white;
	font-weight: bold;
	justify-content: center;
	align-items: flex-end;
}

.head2>.slogun {
	display: flex;
	font-size: 20px;
	padding-top: 15px;
	flex: 1 0 0;
	color: #76FF7C;
	justify-content: center;
	align-items: flex-start;
}

.table-box {
	margin-left: 50px;
}

.head1 {
	height: 100px;
	background-color: white;
}

.line {
	background-color: #388E3C;
	height: 3px;
	margin: 0 auto;
	margin-top: 30px;
	width: 60%;
}

.subitem {
	text-align:center;
	margin-top: 3px;
	font-size: 18px;
	color: #888;
}

#viewer1 {
	font-size: 25px;
	color: black;
	margin-top: 3px;
	width: 60%;
	margin:0 auto;
}

.left-btn>.hide>.left-menu {
	display: flex;
	position: absolute;
	flex-direction: column;
	width: 500px;
	top: 100%;
	left: 0px;
	margin-top: 10px;
	height: auto;
	border-left: 1px solid #388e3c;
}

.left-menu>a {
	height: 100%;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	color: black;
	padding: 4px 4px;
	margin-left: 10px;
}

.text1 {
	font-size: 2.5rem;
	font-weight: bold;
	display: flex;
	color: white;
	justify-content: center;
	width: 60%;
	align-items: center;
}

.left-btn {
	position: absolute;
	right: 9%;
	top: 66%;
}

.left-btn i {
	position: relative;
}

.hide {
	position: relative;
}

.contentbtn:hover {
	color: #388e3c;
}

.flex {
	display: flex;
}

.body {
	font-size: 1.2rem;
}

.tui-editor-contents{
	font-size:0.8em;
}
/*============================= pc 화면 끝 ===================== */

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
	}
}

/* 800px 이상이면 안보이게 ( pc 버전 ) */

/*============================= mobile 화면 시작 ===================== */
.m-board-bar {
	z-index:200;
	height: 8%;
	border-bottom: 1px solid silver;
	position: relative;
}

.m-board-bar>.m-board-name {
	padding: 0px 15px;
	display: flex;
	align-items: center;
	height: 100%;
	width: 100%;
}

.m-table-box {
	margin-bottom:50px;
	padding: 8px 15px;
}


.m-subitem {
	font-size: 0.7rem;
	color: #888;
	padding: 12px 0px;
	justify-content: space-between;
}

.m-line {
	background-color: #388E3C;
	width: 100%;
	height: 2px;
}

.m-body {
	font-size: 14px;
}

.m-board-bar {
	display: flex;
}

.m-board-change, .m-board-change2 {
	cursor: pointer;
}

.m-board-change.active {
	display: none;
}

.m-board-change2 {
	display:none;
}

.m-board-change2.active {
	display:block;
}

.m-board-menu {
	display: none;
}

.m-board-menu.active {
	position: absolute;
	top: 101%;
	background-color: #f5f5f5;
	display: flex;
	left: 0;
	flex-direction: column;
	width: 100%;
	opacity: 0.9;
}

.m-board-menu>.m-contentbtn {
	padding: 30px;
	text-align: center;
}

#m-viewer1 {
	margin-top: 15px;
}

.toast-youtube-embed {
	background-color: red;
}

.toast-youtube-embed {
	position: relative;
}

.ratio-16-9::after {
	content: "";
	display: block;
	padding-top: 56.25%;
}

.ratio-1-1::after {
	content: "";
	display: block;
	padding-top: 100%;
}

.relative {
	position: relative;
}

.abs-full {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
.M-top-bar {
	z-index:300;
}
.m-icon-box{
	margin-left:5px;
}
.back-btn-con{
	margin-top:100px;
	display:flex;
	justify-content:center;
}
.list-back-btn {
	padding:20px;
	background-color:white;
	margin-left:50px;
	border: 2px solid #eee;
	cursor:pointer;
	margin-bottom:100px;
}

</style>


<body>

	<div class="left-btn visible-on-sm-up">
		<div class="hide">
			<i class="fas fa-bookmark"> Contents</i>
			<div class="left-menu">
				<%
					for (CateItem cateItem : cateItems) {
				%>
				<a class="contentbtn"
					href="${pageContext.request.contextPath}/s/article/list?cateItemId=<%=cateItem.getId()%>"><%=cateItem.getName()%></a>
				<%
					}
				%>
			</div>
		</div>
	</div>


	<div class="head2 flex visible-on-sm-up">
		<div class="boardName">
			<%=cateItemName%>
		</div>
		<div class="slogun">코드마운틴에서 소중한 일상을 공유하세요.</div>
	</div>

	<nav class="table-box visible-on-sm-up">
		<div class="table-1">
			<div class="title"><%=article.getTitle()%></div>
			<div class="subitem">
				<%=article.getRegDate()%>
				writer : 신성민 &nbsp;&nbsp;&nbsp; 조회수 : <%=article.getHit()%> 
				&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/s/article/modify?id=<%= article.getId()%>"><i class="fas fa-wrench"></i></a>
				&nbsp;
				<a href="${pageContext.request.contextPath}/s/article/doDelete?id=<%= article.getId()%>"><i class="far fa-trash-alt"></i></a>
			</div>
			<div class="line"></div>
			<div class="body-box">
			<script type="text/x-template" id="origin1" style="display: none;">
			<%="\n" + article.getBody().trim() + "\n"%>
			</script>
			</div>
			<div id="viewer1"></div>
		</div>
	</nav>
	
<!--  onclick="location='list' " 리스트로 돌아가기 버튼 링크  -->
	<div class="back-btn-con  visible-on-sm-up">
	<input class="list-back-btn" type="button" value="목록으로 돌아가기" onclick="location='list'"/>
	</div>
	




	<!--   ================================= pc 화면  끝 ================================= -->

	<!--   ================================= mobile 화면 시작 ================================= -->

	<div class="m-board-bar visible-on-sm-down">
		<a class="m-board-name"> <%=cateItemName%> 
		<div class="m-icon-box">
		<i class="m-board-change fas fa-angle-down"></i> 
		<i class="m-board-change2 fas fa-angle-up"></i>
		</div>
		</a>
		<div class="m-board-menu">
			<%
				for (CateItem cateItem : cateItems) {
			%>
			<a class="m-contentbtn"
				href="${pageContext.request.contextPath}/s/article/list?cateItemId=<%=cateItem.getId()%>"><%=cateItem.getName()%></a>
			<%
				}
			%>
		</div>
	</div>

	<nav class="m-table-box visible-on-sm-down">
		<div class="m-table-1">
			<div class="m-title"><%=article.getTitle()%></div>
			<div class="m-subitem flex">
				writer : 신성민 &nbsp;&nbsp; 조회수 : 1
				<div class="m-regDate"><%=article.getRegDate()%></div>
			</div>
			<div class="m-line"></div>
			<script type="text/x-template"  id="m-origin1" style="display: none;">
				<%="\n" + article.getBody().trim() + "\n"%>
			</script>
			<div id="m-viewer1"></div>
		</div>
	</nav>
	
	
	<script>
		var editor1__initialValue = $('#origin1').html();
		var editor1 = new toastui.Editor({
			el : document.querySelector("#viewer1"),
			viewer : true,
			initialValue : editor1__initialValue,
			plugins : [ toastui.Editor.plugin.codeSyntaxHighlight,
					youtubePlugin, replPlugin, codepenPlugin ]
		});
	</script>


	<script>
		var editor1__initialValue = $('#m-origin1').html();
		var editor1 = new toastui.Editor({
			el : document.querySelector("#m-viewer1"),
			viewer : true,
			initialValue : editor1__initialValue,
			plugins : [ toastui.Editor.plugin.codeSyntaxHighlight,
					youtubePlugin, replPlugin, codepenPlugin ]
		});
	</script>

	



	<%@ include file="/jsp/part/foot.jspf"%>