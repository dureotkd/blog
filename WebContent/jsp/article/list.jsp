
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.Dto"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
	
<%
int totalCount = (int) request.getAttribute("totalCount");
List<Article> articles = (List<Article>) request.getAttribute("articles");
int totalPage = (int) request.getAttribute("totalPage");
int paramPage = (int) request.getAttribute("page");
String cateItemName = (String)request.getAttribute("cateItemName");
%>
<link rel="stylesheet" href="/blog/resource/css/common.css" />
<link rel="stylesheet" href="/blog/resource/css/home/main.css" />
<style>
*{
	color:inherit;
}
.title{
	text-align:left;
	color:black;
}
.title > a{
	text-align:left;
	color:black;
	font-sizle : 1.3rem;
}

h2 {
	text-align:center;
}

.table-box {
	display:flex;
	justify-content:center;
	align-items:center;
	width:100%;
	margin-top:30px;
}

.top-bar {
	display:flex;
	justify-content:space-between;
}

.col {
	color:red;
}

table {
	border-collapse: collapse;
    line-height: 30px;
    border-left: none; 
   border-right: none;
   width:60%;
   
}

table .first-tr {
	border-top:2px solid #388e3c;
}

table td,th {
	border-bottom: 1px solid silver;
    border-collapse: collapse;
    text-align: center;
    padding: 7px;
}
.boardName {
  align-items:center;
  display:flex;
  flex: 1, 0 , 0;
  width:50%;
  justify-content:flex-end;
  font-size:2.5rem;
  font-weight:bold;
  color:white;
}

.board {
  display:flex;
  flex:1, 0, 0 ;
  width:40%;
  font-size:1.1rem;
  align-items:flex-end;
  margin-bottom:50px;
  color:white;
}

.con {
  display:flex;
  flex-direction:column;
}

.text-box{
  width:60%;
   justify-content:space-between;
  display:flex;
}

.text-box2{
	width:100px;
}

.paging {
	margin-bottom:100px;
	margin-top:10px;
	font-size:0;
}

.paging > .num {
	border: 1px solid #388e3c;
	border-radius: 2000px;
}


.paging > a {
	padding: 5px 10px;
    display: inline-block;
    margin-left: 10px;
    font-size: 12px;
    color:black;
}

.head2 {
	height:100px;
	background-color:black;
}

    .head3{
        background-image: url(https://images.pexels.com/photos/3182810/pexels-photo-3182810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);
        height:400px;
        background-size:cover;
    }

.bd{
	text-align:center;
	color:black;
}


.left-btn > .hide > .left-menu {
    display: flex;
    position: absolute;
    flex-direction: column;
    width: 150px;
    top: 100%;
    left:-15px;
    margin-top:10px;
    height: auto;
    
}

.left-menu > a {
    height: 100%;
    display: flex;
    justify-content: flex-start;
    align-items: center;
	color:black;
	padding:13px 4px;
	margin-left:10px;
}
    .text1 {
        font-size:2.5rem;
        font-weight:bold;
       display:flex;
        color: white;
       justify-content:flex-end;
        width:52%;
        align-items: center;
    }
.left-btn {
	position:absolute;
	left:2%;
	top:60%;
}
.left-btn i {
	position:relative;
}
.hide {
display:none;
position:relative;
}

.contentbtn:hover {
	color:#388e3c;
}

.flex {
	display:flex;
}

.pc-search-box{
	display:flex;
	justify-content:flex-end;
	margin-bottom:10px;
}

.page-box {
	margin-bottom:20px;
	margin-top:20px;
}
/* ================================= pc 화면  끝 ================================= */




.m-top-table {
	position:relative;
	display:flex;
	height:8%;
	border-bottom:1px solid silver;
}

.m-title {
	padding : 0px 15px;
	align-items:center;
	display:flex;
	height:100%;
	width:100%;
}

.article-table{
	height:80%
}
.article-post {
	flex-direction:column;
}

.m-article-title, .m-article-id {
	padding:11px 15px;
}

.m-article-title{
	border-bottom:1px solid green;
}

.m-table {
	border-collapse: collapse;
	line-height : 54px;
	border-left:none;
	border-rghit:none;
	width:100%;
	border-bottom:1px solid silver;
}


.m-tag-title:hover {
	color:red;
}

.m-board-change, .m-board-change2 {
	cursor :pointer;
}
.m-board-change.active {
	display:none;
}
.m-board-change2 {
	display:none;
}
.m-board-change2.active{
	display:block;
}

.m-board-menu {
	display:none;
}

.m-board-menu.active {
	position:absolute;
	top:101%;
	background-color:#f5f5f5;
	display:flex;
	left:0;
	flex-direction:column;
	width:100%;
	opacity:0.9;
}

.m-board-menu > .m-contentbtn {
	padding:30px;
	text-align:center;
}

.m-title-text {
	margin-right:5px;
}

.m-sub {
	margin-top:7px;
	font-size:0.7em;
	color:silver;
}
.m-page-box {
	display:flex;
	justify-content: center;
}

.m-page-box>ul>li {
	background-color:green;
	width:20px;
	border-radius:100px;
	text-align:center;
	margin: 10px;
}

.m-a {
	color:white;
}




/* 800px 이하면 안보이게 ( 모바일 버전 ) */

@media( max-width:799px ) {
    .visible-on-sm-up {
        display: none !important;
    }
}


.page-ul{
	margin: 0 auto;
}
.tag-title {
	font-size:2em;
	font-weight:900;
}
.tag-title:hover {
	color:#1976d2;
}
.tag-sub {
	font-size:0.8em;
}
.tag-Id {
	font-size:15.75px;
}
.list-box {
	float:left;
	display:flex;
	flex-direction:column;
	width:700px;
	border-bottom:2px solid green;
	margin-bottom:50px;
	}
.tag-Id , .tag-title , .tag-sub {
	margin-bottom:20px;
}

.page-btn {
	padding-left:15px;
	padding-right:15px;
}

.page-btn:hover {
	background-color:silver;
	opacity:0.8;
}









@media ( min-width: 480px){
	body {
		font-size:1.0vw;
	}
}

/* 800px 이하면 안보이게 ( 모바일 버전 ) */


/* 800px 이상이면 안보이게 ( pc 버전 ) */

@media( min-width:800px ) {
    .visible-on-sm-down {
        display: none !important;
    }
}



/* 800px 이상이면 안보이게 ( pc 버전 ) */
</style>
	<div class="head3 flex visible-on-md-up">
		<div class="text1">친구와 함께하는 생각, <br> 코드마운틴 </div>
	</div>
	
	
	<div class="con visible-on-sm-up table-box">	
			<%
				for (Article article : articles) {
			%>
			<div class="list-box">
			<span class="tag-Id">
			
			<%=article.getId()%>
			<%=cateItemName %>
			<%=article.getExtra().get("writer") %>
			</span>
			
			<a class="tag-title" href="./detail?cateItemId=${param.cateItemId}&id=<%=article.getId()%>"><%=article.getTitle() %></a>
			<span class="tag-sub">
			<%=article.getRegDateFormat1() %>
			&nbsp;&nbsp;&nbsp;<i class="far fa-eye"></i> : <%=article.getHit()%>
			</span>
			</div>
			<%
				}
			%>
					
		<div class="con page-box">
		<ul class="page-ul flex flex-jc-c">
		<%
			for (int i = 1; i <= totalPage; i++) {
		%>
		<li class="<%=i == paramPage ? "current" : ""%>"><a  class= "page-btn"
			href="?cateItemId=${param.cateItemId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}&page=<%=i%>" class="block"><%=i%></a></li>
		<%
			}
		%>
	</ul>
</div>
		</div>
		
 <!--   ================================= pc 화면  끝 ================================= -->
				
		
		<!-- 모바일 테이블부분  --> 
		<nav class="m-top-table visible-on-sm-down">
			<div class="m-title">
			<div class="m-title-text"><%= cateItemName %>(${totalCount})</div>
			<div class="m-icon-box">
			<i class="m-board-change fas fa-angle-down"></i>
			<i class="m-board-change2 fas fa-angle-up"></i>
			</div>
			<div class="m-board-menu">
			<% for(CateItem cateItem : cateItems) { %>
				<a class = "m-contentbtn" href="${pageContext.request.contextPath}/s/article/list?cateItemId=<%=cateItem.getId()%>"><%=cateItem.getName()%></a>
			<% } %>
			</div>
			 </div>
			
	</form>
		</nav>
		
		<section class="article-table visible-on-sm-down">
					<%
				
				for (Article article : articles) {
					%>
				<%=article.getExtra().get("writer") %>
				<div class = "m-article-title text-align-left">
				<a class="m-tag-title" href="./detail?cateItemId=${param.cateItemId}&id=<%= article.getId()%>"><%=article.getTitle() %></a>
				<div class="m-sub">
				<%=article.getId()%>	
				신성민
				조회 : 1
				</div>
				</div>
				<%
					}
				%>
				<div class="m-page-box">
		<ul class="m-page flex flex-jc-c">
		<%
			for (int i = 1; i <= totalPage; i++) {
		%>
		<li class="<%=i == paramPage ? "current" : ""%>"><a class = "m-a"
			href="?cateItemId=${param.cateItemId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}&page=<%=i%>" class="block"><%=i%></a></li>
		<%
			}
		%>
		</ul>
		</div>
		</section>
		<div class="con search-box flex flex-jc-c">
		</div>
		
		
		
		
<%@ include file="/jsp/part/foot.jspf" %>