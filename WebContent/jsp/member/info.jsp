<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>


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
<a href="${pageContext.request.contextPath}/s/member/passwordForPrivate"">수정</a>
</div>
</div>

    
    
<%@ include file="/jsp/part/foot.jspf" %>