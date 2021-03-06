<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/3b1f8c6d21.js"
	crossorigin="anonymous"></script>

	<meta charset="UTF-8" />
	<title>THINK NOTE</title>

	<style>
@import url("https://fonts.googleapis.com/css?family=DM+Sans:400,500,700|Source+Sans+Pro:300,400,600,700&display=swap");
* {
  outline: none;
  box-sizing: border-box;
  text-decoration:none;
  color:inherit;
}

html {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
}

body {
  font-family: "Source Sans Pro", sans-serif;
  background-color: #373e57;
  color: #ccc8db;
}

.container {
  background-color: #151728;
  display: flex;
  max-width: 1600px;
  height: 100vh;
  overflow: hidden;
  margin: 0 auto;
}

.left-side {
  width: 260px;
  border-right: 1px solid #272a3a;
  display: flex;
  flex-direction: column;
  transition: 0.3s;
  background-color: #151728;
  overflow: auto;
  flex-shrink: 0;
}
@media screen and (max-width: 930px) {
  .left-side.active {
    z-index: 4;
  }
  .left-side.active > *:not(.logo) {
    opacity: 1;
    transition: 0.3s 0.2s;
  }
  .left-side.active .left-side-button svg:first-child {
    opacity: 0;
  }
  .left-side.active .left-side-button svg:last-child {
    transform: translate(-50%, -50%);
    opacity: 1;
  }
  .left-side:not(.active) {
    width: 56px;
    overflow: hidden;
  }
  .left-side:not(.active) > *:not(.logo):not(.left-side-button) {
    opacity: 0;
  }
  .left-side:not(.active) .logo {
    writing-mode: vertical-lr;
    transform: rotate(180deg);
    transform-origin: bottom;
    display: flex;
    align-items: center;
    margin-top: -10px;
  }
}

.main {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  background-color: #181d2f;
}

.logo {
  font-family: "DM Sans", sans-serif;
  font-size: 15px;
  color: #fff;
  font-weight: 600;
  text-align: center;
  height: 68px;
  line-height: 68px;
  letter-spacing: 4px;
  position: sticky;
  top: 0;
  background: linear-gradient(to bottom, #151728 0%, #151728 76%, rgba(21, 23, 40, 0) 100%);
}

.side-title {
  font-family: "DM Sans", sans-serif;
  color: #5c5e6e;
  font-size: 15px;
  font-weight: 600;
  margin-bottom: 20px;
}

.side-wrapper {
  padding: 30px;
}

.side-menu {
  display: flex;
  flex-direction: column;
  font-size: 15px;
  white-space: nowrap;
}
.side-menu svg {
  margin-right: 16px;
  width: 16px;
}
.side-menu i {
  margin-right: 16px;
  width: 16px;	
}
.side-menu a {
  text-decoration: none;
  color: #9c9cab;
  display: flex;
  align-items: center;
}
.side-menu a:hover {
  color: #fff;
}
.side-menu a:not(:last-child) {
  margin-bottom: 20px;
}

.follow-me {
  text-decoration: none;
  font-size: 14px;
  display: flex;
  align-items: center;
  margin-top: auto;
  overflow: hidden;
  color: #9c9cab;
  padding: 0 20px;
  height: 52px;
  flex-shrink: 0;
  border-top: 1px solid #272a3a;
  position: relative;
}
.follow-me i {
  width: 16px;
  height: 16px;
  margin-right: 8px;
}

.follow-text {
  display: flex;
  align-items: center;
  transition: 0.3s;
}

@media (min-width:800px){
	.profile-name {
		 right:-100%;
	}
}

.follow-me:hover .follow-text {
  transform: translateY(100%);
}
.follow-me:hover .developer {
  top: 0;
}

.developer {
  position: absolute;
  color: #fff;
  left: 0;
  top: -100%;
  display: flex;
  transition: 0.3s;
  padding: 0 20px;
  align-items: center;
  background-color: #272a3a;
  width: 100%;
  height: 100%;
}

.developer img {
  border-radius: 50%;
  width: 26px;
  height: 26px;
  object-fit: cover;
  margin-right: 10px;
}

.search-bar {
  height: 60px;
  background-color: #151728;
  z-index: 3;
  position: relative;
}
.search-bar input {
  height: 100%;
  width: 100%;
  display: block;
  background-color: transparent;
  border: none;
  padding: 0 54px;
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='512' height='512'%3e%3cpath d='M508.9 478.7L360 330a201.6 201.6 0 0045.2-127.3C405.3 90.9 314.4 0 202.7 0S0 91 0 202.7s91 202.6 202.7 202.6c48.2 0 92.4-17 127.3-45.2L478.7 509c4.2 4.1 11 4.1 15 0l15.2-15.1c4.1-4.2 4.1-11 0-15zm-306.2-116c-88.3 0-160-71.8-160-160s71.7-160 160-160 160 71.7 160 160-71.8 160-160 160z' data-original='%23000000' class='active-path' data-old_color='%23000000' fill='%235C5D71'/%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-size: 16px;
  background-position: 25px 50%;
  color: #fff;
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 600;
}
.search-bar input::placeholder {
  color: #5c5d71;
}

.main-container {
  padding: 20px;
  flex-grow: 1;
  overflow: auto;
  background-color: #24273b;
}



.timeline {
  display: flex;
  padding-top: 20px;
  position: relative;
  z-index: 2;
}
.timeline-left {
  width: 310px;
  flex-shrink: 0;
}
.timeline-right {
  flex-grow: 1;
  padding-left: 20px;
}
@media screen and (max-width: 768px) {
  .timeline {
    flex-wrap: wrap;
    flex-direction: column-reverse;
  }
  .timeline-right {
    padding-left: 0;
    margin-bottom: 20px;
  }
  .timeline-left {
    width: 100%;
  }
}

.box {
  background-color: #151728;
  border-radius: 4px;
}

.intro {
  padding: 20px;
}
.intro-title {
  font-family: "DM Sans", sans-serif;
  color: #5c5e6e;
  font-weight: 600;
  font-size: 18px;
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}
.intro-menu {
  background-color: #8f98a9;
  box-shadow: -8px 0 0 0 #8f98a9, 8px 0 0 0 #8f98a9;
  width: 5px;
  height: 5px;
  border: 0;
  padding: 0;
  border-radius: 50%;
  margin-left: auto;
  margin-right: 8px;
}

.info {
  font-size: 15px;
}
.info-item {
  display: flex;
  color: #c3c5d5;
}
.info-item + .info-item {
  margin-top: 14px;
}
.info-item a {
  margin-left: 6px;
  color: #1771d6;
  text-decoration: none;
}
.info-item i {
	width: 16px;
  margin-right: 10px;
}
.info-item svg {
  width: 16px;
  margin-right: 10px;
}

.event {
  position: relative;
  margin-top: 20px;
  padding: 10px;
}

.event-wrapper {
  position: relative;
}

.event-img {
  max-width: 100%;
  display: block;
  padding-bottom: 12px;
}

.event-date {
  position: absolute;
  left: 20px;
  top: 15px;
}

.event-month {
  background-color: #1687fa;
  padding: 7px 20px;
  font-weight: 600;
  font-family: "DM Sans", sans-serif;
  color: #fff;
  text-align: center;
  border-radius: 4px 4px 0 0;
}

.event-day {
  width: 100%;
  backdrop-filter: blur(4px);
  color: #fff;
  font-size: 22px;
  font-weight: 600;
  font-family: "DM Sans", sans-serif;
  background-color: rgba(0, 0, 0, 0.4);
  padding: 6px 0;
  text-align: center;
}

.event-title {
  color: #c3c5d5;
  margin-bottom: 5px;
  font-family: "DM Sans", sans-serif;
  font-weight: 600;
  padding: 0 14px;
}

.event-subtitle {
  color: #5c5e6e;
  font-family: "DM Sans", sans-serif;
  font-size: 13px;
  font-weight: 500;
  padding: 0 14px;
}

.pages {
  margin-top: 20px;
  padding: 20px;
}

.user {
  display: flex;
  align-items: center;
  cursor: pointer;
}

.user + .user {
  margin-top: 18px;
}

.user-img {
  border-radius: 50%;
  width: 45px;
  height: 45px;
  margin-right: 15px;
  object-fit: cover;
  object-position: center;
}

.username {
  font-size: 15px;
  font-family: "DM Sans", sans-serif;
}

.status-menu {
  padding: 20px;
  display: flex;
  align-items: center;
}
.status-menu-item {
  text-decoration: none;
  color: #ccc8db;
  padding: 10px 14px;
  line-height: 0.7;
  font-family: "DM Sans", sans-serif;
  font-weight: 500;
  border-radius: 20px;
}
.status-menu-item.active, .status-menu-item:hover {
  background-color: #2e2e40;
  color: #fff;
}
.status-menu-item + .status-menu-item {
  margin-left: 10px;
}
@media screen and (max-width: 500px) {
  .status-menu {
    font-size: 14px;
  }
  .status-menu-item + .status-menu-item {
    margin-left: 0;
  }
}

.status-img {
  width: 50px;
  height: 50px;
  object-fit: cover;
  border-radius: 50%;
  margin-right: 20px;
}

.status-main {
  padding: 0 20px;
  display: flex;
  align-items: center;
  border-bottom: 1px solid #272a3a;
  padding-bottom: 20px;
  flex-wrap: wrap;
}

.status-textarea {
  flex-grow: 1;
  background-color: transparent;
  border: none;
  resize: none;
  margin-top: 15px;
  color: #fff;
  max-width: calc(100% - 70px);
}
.status-textarea::placeholder {
  color: #5c5d71;
}

.status-actions {
  display: flex;
  padding: 10px 20px;
}

.status-action {
  text-decoration: none;
  color: #ccc8db;
  margin-right: 20px;
  display: flex;
  align-items: center;
}
.status-action svg {
  width: 16px;
  flex-shrink: 0;
  margin-right: 8px;
}
@media screen and (max-width: 1320px) {
  .status-action {
    width: 16px;
    overflow: hidden;
    color: transparent;
    white-space: nowrap;
  }
}

.status-share {
  background-color: #1b86f9;
  border: none;
  color: #fff;
  border-radius: 4px;
  padding: 10px 20px;
  margin-left: auto;
  cursor: pointer;
  <!-- box-shadow: 0 0 20px #1b86f9; -->
  
  
}

.album {
  padding-top: 20px;
  margin-top: 20px;
  height:300px;
}
.album .status-main {
  border: none;
  display: flex;
}
.album .intro-menu {	
  margin-bottom: auto;
  margin-top: 5px;
}

.album-detail {
  width: calc(100% - 110px);
}

.album-title span {
  color: #1771d6;
  cursor: pointer;
}
.album-title > strong {
	font-size:14px;
}

.album-date {
  font-size: 12px;
  color: #595c6c;
  margin-top: 4px;
}

.album-content {
  padding: 0 20px 20px;
}

.album-photo {
  width: 100%;
  object-fit: cover;
  object-position: center;
  border-radius: 4px;
  margin-top: 10px;
}

.album-photos {
  display: flex;
  margin-top: 20px;
  max-height: 30vh;
}

.album-photos > .album-photo {
  width: 50%;
}

.album-right {
  width: 50%;
  margin-left: 10px;
  line-height: 0;
  display: flex;
  flex-direction: column;
}
.album-right .album-photo {
  height: calc(50% - 10px);
}
.account-button {
  border: 0;
  background: 0;
  color: #64677a;
  padding: 0;
  cursor: pointer;
  position: relative;
}

.account-button svg {
  width: 20px;
}

.account-button:not(.right-side-button) + .account-button:before {
  position: absolute;
  right: 0px;
  top: -2px;
  background-color: #1b86f8;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  content: "";
  border: 2px solid #151728;
}

.account-profile {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  margin: 0 10px;
}

.account-user {
  display: inline-flex;
  align-items: center;
  color: #64677a;
  font-weight: 600;
}
.account-user span {
  font-size: 10px;
  font-weight: normal;
}

.account {
  height: 60px;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  position: sticky;
  top: 0;
  background-color: #151728;
  z-index: 3;
  flex-shrink: 0;
}

.stories {
  border-bottom: 1px solid #272a3a;
}

.stories .user-img {
  border: 2px solid #e2b96c;
}

.stories .album-date {
  font-family: "Source Sans Pro", sans-serif;
}

.user-status {
  background-color: #7fd222;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  margin-left: auto;
}
.user-status.offline {
  background-color: #606a8d;
}
.user-status.idle {
  background-color: #dd1c20;
}

.contacts .username {
  display: flex;
  flex: 1;
  align-items: center;
}

.right-search svg {
  width: 16px;
  height: 16px;
}

.right-search {
  padding-right: 10px;
  display: flex;
  align-items: center;
  border-top: 1px solid #272a3a;
  position: sticky;
  bottom: 0;
  margin-top: auto;
}

.right-search input {
  padding-right: 10px;
}

.search-bar-svgs {
  color: #656679;
  display: flex;
}

.search-bar-svgs svg {
  margin-right: 16px;
}

.article-image-box {
	width:300px;
	height:200px;
	overflow:hidden;
	border-radius:10px;
}
.article-image-tag {
	object-fit:cover;
	width:100%;
	height:100%;
}

.article-con {
	display:flex;
	justify-content:space-between;
	width:100%;
}
.text-con {
	display:flex;
	flex-direction:column
}
.text-title {
	font-size:2rem;
}

.overlay {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background-color: rgba(36, 39, 59, 0.8);
  opacity: 0;
  visibility: hidden;
  pointer-events: none;
  transition: 0.3s;
}
@media screen and (max-width: 1210px) {
  .overlay.active {
    z-index: 3;
    opacity: 1;
    visibility: visible;
    pointer-events: all;
  }
}

@media screen and (max-width: 1210px) {
  .right-side-button {
    display: block;
  }
}

.left-side-button {
  display: none;
}
@media screen and (max-width: 930px) {
  .left-side-button {
    display: flex;
    flex-shrink: 0;
    align-items: center;
    justify-content: center;
    position: relative;
    cursor: pointer;
    height: 60px;
    background-color: rgba(39, 42, 58, 0.5);
    border: 0;
    padding: 0;
    line-height: 0;
    color: #fff;
    border-bottom: 1px solid #272a3a;
  }
  .left-side-button svg {
    transition: 0.2s;
    width: 24px;
  }
  .left-side-button svg:last-child {
    position: absolute;
    left: 50%;
    transform: translate(100%, -50%);
    top: 50%;
    opacity: 0;
  }
}

@media screen and (max-width: 700px) {
		.visible-none {
		display:none;
	}
}
@media screen and (max-width: 480px) {

}
::-webkit-scrollbar {
  width: 10px;
  border-radius: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: rgba(255, 255, 255, 0.01);
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: rgba(255, 255, 255, 0.11);
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: rgba(255, 255, 255, 0.1);
}
	</style>
</head>
<body>
	<div class="container" x-data="{ rightSide: false, leftSide: false }">
  <div class="left-side" :class="{'active' : leftSide}">
    <div class="left-side-button" @click="leftSide = !leftSide">
      <svg viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
      <svg stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
  <path d="M19 12H5M12 19l-7-7 7-7"/>
</svg>
    </div>
    <a href="../home/main?id=${loginedMemberId}"><div class="logo">THINK NOTE</div></a>
    <div class="side-wrapper">
      <div class="side-title">MENU</div>
      <div class="side-menu">
        <c:forEach items="${cateItems}" var="cateItem">
			<a class="contentbtn" href="${pageContext.request.contextPath}/s/article/list?cateItemId=${cateItem.id}">
	      <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
            <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z" />
            <path d="M14 2v6h6M16 13H8M16 17H8M10 9H8" />
          </svg>
          ${cateItem.name}
        </a>
       	</c:forEach>
       	<c:if test="${loginedMember.id == 1 }">
        <a href="../article/write">
          <i class="far fa-edit"></i>
          Write
        </a>
        </c:if>
        <c:if test="${isLogined}">
        <a href="../member/logOut">
         <i class="far fa-user"></i>
          Logout
        </a>
        </c:if>
        <c:if test="${isLogined == false }">
        <a href="../member/login">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
            <path d="M16 2v4M8 2v4M3 10h18" />
          </svg>
          Login
        </a>
        </c:if>
      </div>
    </div>
    <div class="side-wrapper">
      <div class="side-title">YOUR PRIVATE NOTE</div>
      <div class="side-menu">
        <a href="../home/main?id=${loginedMemberId}">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 472.11 472.11">
            <path d="M260.07 216.11a63.94 63.94 0 00-28.26-53.1 55.95 55.95 0 00-43.74-90.9c-.8 0-1.6.1-2.4.12a56 56 0 10-107.2 0c-.8 0-1.6-.12-2.4-.12a55.95 55.95 0 00-43.75 90.9 64 64 0 000 106.2 55.95 55.95 0 0043.75 90.9h112a55.95 55.95 0 0043.74-90.9 63.94 63.94 0 0028.26-53.1z" fill="#6a9923" />
            <path d="M193.8 178.51a8 8 0 00-11.32-.16l-42.41 41.03V104.1a8 8 0 00-16 0v56.7l-36.35-36.35a8 8 0 00-11.31 11.3l47.66 47.67V292.8l-34.35-34.34a8 8 0 00-11.31 11.3l45.66 45.67V464.1a8 8 0 0016 0V241.63l53.6-51.78a8 8 0 00.12-11.34z" fill="#618c20" />
            <path d="M468.07 216.11a63.94 63.94 0 00-28.26-53.1 55.95 55.95 0 00-43.74-90.9c-.8 0-1.6.1-2.4.12a56 56 0 10-107.2 0c-.8 0-1.6-.12-2.4-.12a55.95 55.95 0 00-43.75 90.9 64 64 0 000 106.2 55.95 55.95 0 0043.75 90.9h112a55.95 55.95 0 0043.74-90.9 63.94 63.94 0 0028.26-53.1z" fill="#6a9923" />
            <path d="M401.72 178.46a8 8 0 00-11.31 0l-42.34 42.34V104.11a8 8 0 00-16 0v56.7l-36.35-36.35a8 8 0 00-11.31 11.3l47.66 47.67V292.8l-34.35-34.34a8 8 0 00-11.31 11.3l45.66 45.67V464.1a8 8 0 0016 0V242.87c.6-.3 1.15-.66 1.65-1.1l52-52a8 8 0 000-11.31z" fill="#618c20" />
            <path d="M364.07 216.11a63.94 63.94 0 00-28.26-53.1 55.95 55.95 0 00-43.74-90.9c-.8 0-1.6.1-2.4.12a56 56 0 10-107.2 0c-.8 0-1.6-.12-2.4-.12a55.95 55.95 0 00-43.75 90.9 64 64 0 000 106.2 55.95 55.95 0 0043.75 90.9h112a55.95 55.95 0 0043.74-90.9 63.94 63.94 0 0028.26-53.1z" fill="#88b337" />
            <path d="M297.72 178.46a8 8 0 00-11.31 0l-42.34 42.34V104.11a8 8 0 00-16 0v56.7l-36.35-36.35a8 8 0 00-11.31 11.3l47.66 47.67V292.8l-34.35-34.34a8 8 0 00-11.31 11.3l45.66 45.67V464.1a8 8 0 0016 0V242.87c.6-.3 1.15-.66 1.65-1.1l52-52a8 8 0 000-11.31z" fill="#6a9923" />
            <path d="M372.07 472.11h-272a8 8 0 010-16h272a8 8 0 010 16z" fill="#595959" /></svg>
          Timeline
        </a>
      </div>
    </div>
    <a href="https://github.com/dureotkd" class="follow-me" target="_blank">
      <span class="follow-text">
      <i class="fab fa-github"></i>
       MY GITHUB
     </span>
      <span class="developer">
       SHIN SUNG MIN
      </span>
    </a>
  </div>
  <div class="main">
    <div class="search-bar">
      <input type="text" placeholder="Search" />
    </div>
    <div class="main-container">
        <div class="timeline-right">
          <c:forEach items="${articles}" var="article">
          <a href="./detail?cateItemId=${param.cateItemId}&id=${article.id}">
          <div class="album box">
            <div class="status-main">
              <img class="status-img" src="${article.extra.writer}">
              <div class="album-detail">
                <div class="album-title"><strong>${article.extra.text}</strong></div>
                <div class="album-date">${article.regDateFormat2}</div>
              </div>
           <div class="article-con">
           <div class="text-con">
           <p class="text-title">${article.title}</p>
           <p>Comming soon 테스트 버전입니다.</p>
           </div>
          <div class="article-image-box visible-none">
				<c:if test="${article.imgTagFormat != null }">
				<img src=" ${article.imgTagFormat}" alt="" class="article-image-tag" />
				</c:if>
				<c:if test="${article.imgTagFormat == null }">
				<img src="https://web.yonsei.ac.kr/_ezaid/board/_skin/albumRecent/3/no_image.gif" alt="" class="article-image-tag" />
				</c:if>
				</div>
            </div>
           </div>
             </div>
         	</a>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
  <div class="overlay" @click="rightSide = false; leftSide = false" :class="{ 'active': rightSide || leftSide }"></div>
</div>
</body>
</html>