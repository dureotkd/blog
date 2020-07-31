<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf" %>


<style>
.submit:hover {
	background-color:green;
}
.findId-wrap {
	display:flex;
	height:100%;
}
.find-wrap {
	display:flex;
	flex-direction:column;
	justify-content:center;
	width:100%;
}

.head-text , .only {
	font-size:2rem;
}

.input {
	padding:30px;
	width:100%;
	font-size:1.5rem;
	border:1px solid #e1e1e1;
	text-indent:5px;
}

.submit {
	margin-top:20px;
	padding:10px;
	font-size:1.3rem;
	width:100%;
	background-color:#18306d;
	border:none;
	font-size:1.2rem;
	padding:15px;
	color:white;
	margin-bottom:30%;
	cursor:pointer;
	transition:background-color.4s;
}


.left-p,.left-p2 {
	color:#8a96b2;
	font-size:1.3rem;
}

.left-h {
	font-weight:300;
	letter-spacing:4px;
}

.left-p2{
	margin-bottom:150px;
}

.left-p {
	margin-bottom:-10px;
}
.left-box {
	color:white;
	background-color:#18306d;
	width:30%;
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	font-size:1.5rem;
}
.find-box {
	display:flex;
	flex-direction:column;
	height:430px;
	width:50%;
	margin:0 auto;
}

.asd {
	margin-top:10px;
}

@media ( max-width :799px ) {
	.visible-on-md-up {
		display: none !important;
	}
	
	.find-box{
		width:80%;
		margin-top:100px;
	}
}


</style>
	


  <div class="findId-wrap">
  		  	<div class="left-box visible-on-md-up">
	<h2 class="left-h">찾아볼게요</h2>
	<p class="left-p">가입하신 이메일을 입력해주세요.</p>
	<p class="left-p2">비밀번호 찾기도 간편합니다</p>
	</div>
        <form action="doFindId" method="post" class="find-wrap" onsubmit="submitFindIdForm(this); return false;">   
        <div class="find-box">
            	<p class="head-text">회원가입한 이메일을 입력해주세요.</p>
            	<input type="email" name="toEmail" class="input" placeholder="admin@gmail.com"  autofocus/>
            	<a href="/blog/s/member/findPw" class="asd">비밀번호를 잊으셨나요?</a>
                <input type="submit" value="전송" class="submit"/>
           </div>
        </form>
    </div>
    
    
    
    
 <script>
console.clear();
 var findIdFormSubmitted = false;

 	function submitFindIdForm(form){
		if (findIdFormSubmitted){
				alert('처리 중입니다.');
				return;
			}
	if ( form.toEmail.value.length == 0 ){
			alert('이메일을 입력해주세요.');
			fom.toEmail.focus();
			return;
		}
	form.submit();
	findIdFormSubmitted = true;
 	}

</script>

 




<%@ include file="/jsp/part/foot.jspf" %> 

