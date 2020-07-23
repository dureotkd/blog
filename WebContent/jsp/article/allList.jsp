<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.ArticleReply" %>
<%@ include file="/jsp/part/head.jspf"%>
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");
List<ArticleReply> articleReplys = (List<ArticleReply>) request.getAttribute("articleReplys");
%>

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
		<h2><%=loginedMember.getNickname()%>의 댓글 목록입니다.</h2>
	<thead>
				<tr>
					<th>NO</th>
					<th>날짜</th>
					<th>내용</th>
				</tr>
			</thead>
<% for ( ArticleReply articleReply : articleReplys ) { %>
	<% if ( articleReply.getMemberId() == loginedMember.getId()){ %>
			
			<tbody>
				<tr>
					<td><%=articleReply.getId() %></td>
					<td><%=articleReply.getRegDate() %></td>
					<td><%=articleReply.getBody() %></td>
				</tr>
			</tbody>
		
		<%} %>
	<% } %>
		</table>
		
		
		
		<table border="1">	
		<h2><%=loginedMember.getNickname()%>의 게시글 목록입니다.</h2>
	<thead>
				<tr>
					<th>NO</th>
					<th>날짜</th>
					<th>내용</th>
				</tr>
			</thead>
<% for (Article article : articles) { %>
	<% if ( article.getMemberId() == loginedMember.getId()){ %>
			
			<tbody>
				<tr>
					<td><%=article.getId() %></td>
					<td><%=article.getRegDate() %></td>
					<td><%=article.getBody() %></td>
				</tr>
			</tbody>
			</table>
			</div>
		
		<%} %>
	<% } %>







		
<%@ include file="/jsp/part/foot.jspf" %>