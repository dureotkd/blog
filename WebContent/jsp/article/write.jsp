<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/jsp/part/head.jspf"%>

<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />



	<form action="doWrite" class="pc-form" method="post" onsubmit="submitWriteForm(this); return false;" >
	<div class="m-write ">글쓰기</div>
	
	<div class="cateItem-area">
	<select name="cateItemId" class="cateId">
		<% for ( CateItem cateItem : cateItems ) { %>
		<option value="<%=cateItem.getId()%>"><%=cateItem.getName()%></option>	
		<% } %>
	</select>
	</div>
	<!--  여기다가 loginedMemberId값을 넣어줘야겟네?-->
	<input type="hidden" name="memberId" value="<%=loginedMemberId%>" />
	
	<div class="m-write-con ">
		<input type="text" maxlength="50" id="subject" class="form-control"
			placeholder="제목을 입력하세요" style="margin: 10px; height: 35px;"
			name="title" value="">
		<input type="hidden" name="body">
		<div id="editor1"></div>
		
	</div>
				
	

	<div class="m-button-con">
		<input class="submit" type="submit" value="작성" ></input>
		<button class="back" type="button" value="취소" onclick="history.back();">취소</button>
	</div>
</form>




<script>
console.clear();
	var writeFormSubmitted = false;

	function submitWriteForm(form) {
		if (wirteFormSubmitted) {
			alert('처리 중입니다.');
			return;
		}

		if (form.title.value.length == 0) {
			alert('제목을 입력해주세요.');
			form.title.focus();
			return;
		}

		if (form.body.value.length == 0) {
			alert('내용을 입력해주세요.');
			form.body.focus();
			return;
		}

		form.submit();
		writeFormSubmitted = true;
	}
	console.clear();
	var editor1 = new toastui.Editor({
		  el: document.querySelector('#editor1'),
		  height: '600px',
		  initialEditType: 'wysiwyg',
		  previewStyle: 'vertical',
		  plugins: [toastui.Editor.plugin.codeSyntaxHighlight]
		});

	alert(document.getElementById('body').innerHTML);

	function submitWriteForm(form){
		var source = editor1.getMarkdown().trim();
		if ( source.length == 0){
			alert('내용을 입력해주세요 .');
			editor1.focus();
			return;
			}
		form.body.value = source;
		form.submit();
		}

	
	</script>

<style>
.m-write {
	font-size:1.5rem;
	text-align: left;
	padding: 15px 0px 15px 0px;
	border-bottom: 3px solid green;
}

.cateId {
	height:30px;
}

.m-write-title {
	margin: 20px 0px 20px 0px;
	text-align: center;
}

.m-write-body {
	text-align: center;
}

.m-button-con {
	padding: 15px 0px 15px 0px;
}

button {
	cursor:pointer;
	background-color: white;
	width: 100px;
	height: 30px;
}

.m-write-con {
	display: flex;
	flex-direction: column;
	margin-left:-10px;
}

.cateItem-area {
	padding:20px 0px 20px 0px;
}

.submit{
	cursor:pointer;
	background-color:white;
	width:100px;
	height:30px;
	margin-right:20px;
}
.m-button-con{
	margin-bottom:150px;
}
#editor1 {
	padding : 20px 0px 20px 0px;
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
	}
	 .pc-form {
    	width:50%;
    	margin: 0 auto;
    	margin-top:100px;
    }
}

/* 800px 이상이면 안보이게 ( pc 버전 ) */
</style>




<%@ include file="/jsp/part/foot.jspf"%>