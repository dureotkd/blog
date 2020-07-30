<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<style>
.send-wrap {
	display:flex;
	flex-direction:column;
	margin:0 auto;
	width:400px;
	height:200px;
	margin-bottom:100px;
}
</style>
<h1>letter-send</h1>


<form action="doSend" class="send-wrap">
<label for="#">받는 사람</label>
<input type="text" name="sendNickname"/>
<input type="hidden" name="fromNickname" value=" ${loginedMember.nickname}"  />
<label for="#">제목</label>
<input type="text" name="title"/>
<label for="#">내용</label>
<input type="text" name="body" />
<input type="submit" value="전송"/>
</form>


<%@ include file="/jsp/part/foot.jspf" %>