
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page import="com.sbs.java.blog.dto.ArticleReply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
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
.tui-editor-contents :not(table) {
	line-height: 2.0em;
}

.head2 {
	height: 300px;
	background-repeat: no-repeat;
	background-size: cover;
	background:linear-gradient(to right, #667db6, #0082c8, #0082c8, #667db6);
}
.image {
	width:70px;
	height:70px;
	border-radius:50%;
}
.reply-nick {
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-right:50px;
}



.table-box {
	margin-bottom: 200px;
	margin-top: 50px;
}

.title {
	font-weight: bold;
	font-size: 2em;
	color:white;
	display:flex;
	justify-content:center;
	align-items:center;
	width:100%;
}

.flex {
	display: flex;
}

.head2>.boardName {
	font-size: 40px;
	display: flex;
	flex: 1 0 0;
	color: white;
	justify-content: center;
	align-items: center;
}

.head1 {
	height: 100px;
	background-color: white;
}

.line {
	background-color: #eee;
	height: 1px;
	margin: 0 auto;
	margin-top: 25px;
}

.subitem {
	margin-top: 3px;
	font-size: 12px;
	color: #ccc;
}

#viewer1 {
	font-size: 20px;
	color: black;
	margin-top: 3px;
	margin: 0 auto;
	line-break:anywhere;
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

.flex {
	display: flex;
}

.body {
	font-size: 1.2rem;
}

.tui-editor-contents {
	font-size: 1.1rem;
}
/*============================= pc 화면 끝 ===================== */

/* 800px 이하면 안보이게 ( 모바일 버전 ) */
@media ( max-width :799px ) {
	.visible-on-sm-up {
		display: none !important;
	}
	.reply-box {
		width: 100%;
	}
}

/* 800px 이하면 안보이게 ( 모바일 버전 ) */

/* 800px 이상이면 안보이게 ( pc 버전 ) */
@media ( min-width :800px ) {
	.visible-on-sm-down {
		display: none !important;
	}
	.reply-box {
		width: 60%;
	}
}

/* 800px 이상이면 안보이게 ( pc 버전 ) */

/*============================= mobile 화면 시작 ===================== */
.m-board-bar {
	z-index: 200;
	height: 50px;
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
	margin-bottom: 50px;
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
	display: none;
}

.m-board-change2.active {
	display: block;
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
	z-index: 300;
}

.m-icon-box {
	margin-left: 5px;
}

.back-btn-con {
	margin-top: 100px;
	display: flex;
	justify-content: center;
}

.list-back-btn {
	padding: 20px;
	background-color: white;
	margin-left: 50px;
	border: 2px solid #eee;
	cursor: pointer;
	margin-bottom: 100px;
}

.reply-box {
	margin: 0 auto;
	border-top: 1px solid #ccc;
}

.reply-item {
	padding: 12px;
	display: flex;
	justify-content: center;
	flex-direction: column;
	text-align: start;
}

.reply-con {
	display: flex;
	justify-content: center;
}

.reply-body {
	width: 100%;
	border:1px solid #1565c0;
	outline:none;
}

.reply-form {
	margin-top: 100px;
}

.table-1 {
	width: 60%;
	margin: 0 auto;
}

.reply-boxi {
	display: flex;
	flex-direction: row;
	align-items:center;
}

.reply-writer {
	width: 114px;
	color: #1A4C89;
	font-weight: bold;
	text-align:center;
}

.pc-form {
	width: 100%;
}

.reply-subitem {
	margin-top: 100px;
	display: flex;
	font-size: 1.3rem;
}

.reply-regDate, .modify-item, .delete-item {
	color: #ccc;
	font-size: 6px;
}

.modify-item {
	display: inline-block;
}

.modiy-body-box {
	display: flex;
}

.modify-body-item {
	width: 100%;
}

.modify-item {
	cursor: pointer;
}

.pc-form {
	display: none;
}

.pc-form.active {
	width: 100%;
	display: block;
}

.Co {
	font-size: 1.4rem;
}

.reply-item:nth-child(odd) {
	background-color: #fafafa;
}

.delete-btn , .modify-btn {
	width:40px;
	height:40px;
	display:flex;
	align-items:center;
	justify-content:center;
	border:none;
	background:white;
	border-radius:50%;
	box-shadow:0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.55);
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: fixed;
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
.reply-bodyitem {
	border:1px solid #eee;
	padding:20px;
	overflow-wrap:anywhere;
}
.reply-subitem {
	display:none;
}
.title-wrap{
	display:flex;
	flex-direction:column;
	align-items:center;
	justify-content:center;
	width:100%;
}
.sub-box {
	display:flex;
	margin-top:30px;
}
.writer-item{
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top:50px;
}
.writer-image {
	width:100px;
	height:100px;
	box-shadow:0 16px 38px -12px rgba(0, 0, 0, 0.56), 0 4px 25px 0px rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(0, 0, 0, 0.2);
	border-radius:50%;
}
.writer-text {
	color:blue;
	margin-top:30px;
}
.submit {
	display:flex;
	border:none;
	justify-content:center;
	align-items:center;
	background:#1565c0;
	cursor:pointer;
	width:80px;
	padding:20px;
	color:white;
	margin-left:20px;
}
.regDate {
	color:white;
	margin-top:10px;
}
.delete-box{
	margin-left:20px;
}
</style>



<div class="head2 flex visible-on-sm-up">
<div class="title-wrap">
			<div class="title">${article.title}</div>
			<span class="regDate">${article.regDate}</span>
			<div class="sub-box">
			<c:if
				test="${loginedMemberId == article.memberId || loginedMemberId == 1  }">
				<div class="modify-box"></div>
				<a
					href="${pageContext.request.contextPath}/s/article/modify?id=${article.id}"
					class="modify-btn"><i class="fas fa-wrench sub-work" ></i></a>
			</c:if>
			<c:if
				test="${loginedMemberId == article.memberId || loginedMemberId == 1 }">
				<div class="delete-box">
				<a
					href="${pageContext.request.contextPath}/s/article/doDelete?id=${article.id}"
					class="delete-btn"><i class="far fa-trash-alt"></i></a>
					</div>
			</c:if>
			</div>
			</div>
</div>

<div class="writer-item">
	 <img src="${article.extra.image}" alt="" class="writer-image" />
	 <p class="writer-text">${article.extra.writer}</p>
</div>


<nav class="table-box visible-on-sm-up">
	<div class="table-1">
		<div class="body-box">
			<script type="text/x-template" id="origin1" style="display: none;">${article.bodyForXTemplate}</script>
		</div>
		<div id="viewer1"></div>
	</div>
</nav>


<!--  onclick="location='list' " 리스트로 돌아가기 버튼 링크  -->

<!--   ================================= pc 화면  끝 ================================= -->

<!--   ================================= mobile 화면 시작 ================================= -->

<div class="m-board-bar visible-on-sm-down">
	<a class="m-board-name">${cateItemName}
		<div class="m-icon-box">
			<i class="m-board-change fas fa-angle-down"></i> <i
				class="m-board-change2 fas fa-angle-up"></i>
		</div>
	</a>
	<div class="m-board-menu">
		<c:forEach items="${cateItems}" var="cateItem">
			<a class="m-contentbtn"
				href="${pageContext.request.contextPath}/s/article/list?cateItemId=${cateItem.id}">${cateItem.name}</a>
		</c:forEach>
	</div>
</div>

<nav class="m-table-box visible-on-sm-down">
	<div class="m-table-1">
		<div class="m-title">${article.title}</div>
		<div class="m-subitem flex">
			writer : ${article.extra.writer} &nbsp;&nbsp; 조회수 : ${article.hit}
			<div class="m-
">${article.regDate}</div>
		</div>
		<div class="m-line"></div>
		<script type="text/x-template" id="m-origin1" style="display: none;">
				  ${article.bodyForXTemplate}
			</script>
		<div id="m-viewer1"></div>
	</div>
</nav>

<c:if test="${article.id > articleFirstId.id }">
	<a class="prev visible-on-sm-up"
		href="${pageContext.request.contextPath}/s/article/detail?cateItemId=${param.cateItemId}&id=${article.id-1}">&#10094;</a>
</c:if>
<c:if test="${article.id < articleLastId.id }">
	<a class="next visible-on-sm-up"
		href="${pageContext.request.contextPath}/s/article/detail?cateItemId=${param.cateItemId}&id=${article.id+1}">&#10095;</a>
</c:if>



<div class="reply-box">
	<h2 class="Co">Comment (${totalCount})</h2>
	<c:forEach items="${articleReplys}" var="articleReply">
		<div class="reply-item">
			<div class="reply-boxi">
				<div class="reply-nick">
					<a href="#" onclick="window.open('/blog/s/member/userInfo?id=${articleReply.memberId}','유저정보','width=963, height=880'); return false" >
					<img src="${articleReply.extra.image}" alt="" class="image" /></a>
					<p class="reply-writer">${articleReply.extra.writer}</p>
				</div>
				<div class="reply-bodyitem">
					<p>${articleReply.body}</p>
					<div class="reply-regDate">${articleReply.regDate}
						<c:if test="${loginedMemberId == articleReply.memberId}">
							<a class="delete-item"
								href="${pageContext.request.contextPath}/s/article/replyDelete?id=${articleReply.id}">삭제</a>
							<p class="modify-item">수정</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<c:forEach items="${articleReplys}" var="articleReply">
		<c:if test="${loginedMemberId == articleReply.memberId}">
			<div class="reply-subitem">
				<form action="replyModify" class="pc-form" method="post">
					<input type="hidden" name="id" value="${articleReply.id}" />
					<div class="modiy-body-box">
						<textarea name="body" class="modify-body-item" cols="30" rows="4"
							placeholder="선정적, 극단적인 비속어는 통보없이 삭제 및 차단 될 수 있습니다"></textarea>
						<input class="submit" type="submit" value="수정"></input>
					</div>
				</form>
			</div>
		</c:if>
	</c:forEach>

	<c:if test="${loginedMemberId != -1 }">
		<form action="reply" class="reply-form">
			<div class="reply-con">
				<input type="hidden" name="id" value="${article.id}" /> <input
					type="hidden" name="memberId" value="${loginedMemberId}" />
				<textarea name="body" class="reply-body" cols="30" rows="4"
					placeholder="선정적, 극단적인 비속어는 통보없이 삭제 및 차단 될 수 있습니다"></textarea>
				<input class="submit" type="submit" value="작성"></input>
			</div>
		</form>
	</c:if>



	<c:if test="${loginedMemberId == -1 }">
		<form action="reply" class="reply-form">
			<div class="reply-con">
				<input type="hidden" name="id" value="${article.id}" /> <input
					type="hidden" name="memberId" value="${loginedMemberId}" />
				<textarea name="body" class="reply-body" cols="30" rows="4"
					placeholder="로그인 후 이용해주세요."></textarea>
				<input class="submit" type="submit" value="작성"></input>
			</div>
		</form>
	</c:if>

	<div class="back-btn-con ">
		<input class="list-back-btn" type="button" value="목록으로 돌아가기"
			onclick="location='list'" />
	</div>

</div>

<script>
		var editor1__initialValue = getBodyFromXTemplate('#origin1');
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
		function modifyBox__init() {
			var $btnToggleModifyBox = $('.modify-item');

			$btnToggleModifyBox.click(function() {
				if ($(this).hasClass('active')) {
					$(this).removeClass('active');
					$('.pc-form').removeClass('active');

				} else {
					$(this).addClass('active');
					$('.pc-form').addClass('active');
				}
			});
		}

		$(function() {
			modifyBox__init();
		});
		
	</script>





<%@ include file="/jsp/part/foot.jspf"%>