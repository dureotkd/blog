<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.ArticleReply" %>
<%@ include file="/jsp/part/head.jspf"%>

<style>
.table-con {
	width:50%;
	height:100%;
	display:flex;
	flex-direction:column;
	justify-content:center;
}
</style>




	<div class="table-con">
	<table border="1">	
		<h2>${loginedMember.nickname}의 댓글 목록입니다.</h2>
	<thead>
				<tr>
					<th>NO</th>
					<th>날짜</th>
					<th>내용</th>
				</tr>
			</thead>
			<c:forEach items="${articleReplys}" var="articleReply">
				<c:if test="${articleReply.memberId} == ${loginedMember.id }"> 	
			<tbody>
				<tr>
					<td>${articleReply.id}</td>
					<td>${articleReply.regDate}</td>
					<td>${articleReply.body}</td>
				</tr>
			</tbody>
		</c:if>
	</c:forEach>
		</table>
		
		
		
		<table border="1">	
		<h2>${loginedMember.nickname}의 게시글 목록입니다.</h2>
	<thead>
				<tr>
					<th>NO</th>
					<th>날짜</th>
					<th>내용</th>
				</tr>
			</thead>
<c:forEach items="${articles}" var="article">
	<c:if test="${article.memberId} == ${loginedMember.id }">
			
			<tbody>	
				<tr>
					<td>${article.id}</td>
					<td>${article.regDate}</td>
					<td>${article.body}</td>
				</tr>
			</tbody>
			</table>
			</div>
		
		</c:if>
	</c:forEach>







		
<%@ include file="/jsp/part/foot.jspf" %>