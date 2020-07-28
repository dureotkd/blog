<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<script>
var modifyFormSubmitted = false;

function submitModifyFrom(form){
	if (modifyFormSubmitted){
		alert('처리 중입니다.');
		return;
	}

	if (form.loginPw.value.length == 0 ){
		alert('비밀번호를 입력해주세요.');
		form.loginPw.focus();		
		return;
	}

	form.submit();
	modfiyFormSubmitted = true;	
}

$(document).ready(function(){
	$(".modify-btn").click(function(){
		if (confirm("수정하시겠습니까?")){
				document.form1.action = "/blog/s/member/doModifyMember"
				document.form1.submit();	
			}
	});
});


</script>


<style>
h2{
	text-align:center;
	margin-top:100px;
	
}
.info-box {
	display:flex;
	justify-content:center;
}
.info-item {
	display:flex;
	flex-direction:column;
	margin-bottom:150px;
}

</style>
    
<h2>회원정보</h2>

<div class="info-box">
<div class="info-item">
<p>가입날짜 : ${loginedMember.regDate}</p>    
<p>이름 : ${loginedMember.name}</p>
<p>이메일 : ${loginedMember.email}</p>
<p>닉네임 : ${loginedMember.nickname}</p>
<p>아이디 : ${loginedMember.loginId}</p>
<p class="pw">비밀번호 : ****</p>
<form action="doModifyMember" method="post" onsubmit="submitModifyFrom(this); return false;">
<input type="hidden" name="id" value="${loginedMember.id}" />
<input type="text" name="loginPw"placeholder="loginPw"/>
<input type="submit" class="modify-btn"/>
</form>
</div>
</div>

    
    
<%@ include file="/jsp/part/foot.jspf" %>