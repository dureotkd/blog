<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/jsp/part/head.jspf" %>

<style>
.submit:hover {
	background-color:green;
}
.findPw-wrap {
	display:flex;
	height:100%;
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

.left-p {
	margin-bottom:150px;
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
	width:50%;
	margin:0 auto;
	justify-content:center;
}
.find-wrap {
	display:flex;
	height:100%;
	width:100%;
	align-items:center;
}


.input {
	padding:30px;
	width:100%;
	font-size:1.5rem;
	border:1px solid #e1e1e1;
	text-indent:5px;
	margin-bottom:20px;
}

.head-text {
	font-size:2rem;
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
 	<div class="findPw-wrap">
 			<div class="left-box visible-on-md-up">
	<h2 class="left-h">찾아볼게요</h2>
	<p class="left-p">가입하신 회원정보를 입력해주세요.</p>
	</div>
        <form action="doFindPw" method="post" class="find-wrap">
        <div class="find-box">
        		<p class="head-text">회원가입한 정보를 입력해주세요.</p>
            	<input type="text" name="name" class="input" placeholder="User name"/>
            	<input type="text" name="loginId"class="input"  placeholder="User ID" />
                <input type="text" name="toEmail"class="input"  placeholder="User Email" />
                <input type="submit" value="전송" class="submit"  placeholder=""/>
           </div>
        </form>
     </div>
    





<%@ include file="/jsp/part/foot.jspf" %> 

