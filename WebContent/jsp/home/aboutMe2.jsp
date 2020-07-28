<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.css" rel="stylesheet"> 
<!DOCTYPE html>
<html>

<script>
$(document).ready(function(){
  
  // fullpage customization
  $('#fullpage').fullpage({
    sectionSelector: '.section',
    navigation: true,
    slidesNavigation: true,
    css3: true,
    controlArrows: true   
  }); 
});

var typingBool = false; 
var typingIdx=0; 
var liIndex = 0;
var liLength = $(".typing-txt>ul>li").length;
var del = -1;
var repeatInt= null;
var tyInt = null;
</script>


<head>
<meta charset="UTF-8">
<title>CodeMountain</title>
</head>





<body>


<div id="full-page">

<div class="section">
	<div class="section-1"></div>
</div>
<div class="section">
	<div class="section-2"></div>
</div>
<div class="section">
	<div class="section-3"></div>
</div>
<div class="section">
	<div class="section-4"></div>
</div>
<div class="section">
	<div class="section-5"></div>
</div>
</div>




</body>

</html>