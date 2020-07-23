<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/jsp/part/head.jspf"%>

<%
	Article article = (Article) request.getAttribute("article");
%>

<% if (loginedMemberId != article.getMemberId()) {  %>
  	
<script> 
alert(" 작성자 본인만 수정 가능합니다."); history.back();
</script>	
<% }%>
<form action="doDelete" class="pc-form" method="post" >
<input type="text" name="id" />
</form>
    
    

    
<%@ include file="/jsp/part/foot.jspf"%>