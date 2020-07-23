function MobileSideBar__init() {
	var $btnToggleMobileSideBar = $('.btn-toggle-mobile-side-bar');

	$btnToggleMobileSideBar.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.m-side-bar').removeClass('active');
		} else {
			$(this).addClass('active');
			$('.m-side-bar').addClass('active');
		}	
	});
}
$(function() {
	MobileSideBar__init();
});

function MobileBoardBar__init() {
	var $btnToggleMobileBoardBar = $('.m-board-change');
	var $btnToggleMobileBoardBar2 = $('.m-board-change2');

	$btnToggleMobileBoardBar.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.m-board-change2').removeClass('active');
			$('.m-board-menu').removeClass('active');
		} else {
			$(this).addClass('active');
			$('.m-board-change2').addClass('active');
			$('.m-board-menu').addClass('active');
		}
	});

	$btnToggleMobileBoardBar2.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.m-board-change').removeClass('active');
			$('.m-board-menu').removeClass('active');
		} else {
			$(this).addClass('active');
			$('.m-board-change').addClass('active');
			$('.m-board-menu').addClass('active');
		}
	});

}
$(function() {
	MobileBoardBar__init();
});

function MobileSearchBar__init() {
	var $btnToggleSearchBar = $('.M-search-con');

	$btnToggleSearchBar.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.m-search-box').removeClass('active');
		} else {
			$(this).addClass('active');
			$('.m-search-box').addClass('active');
		}
	});
}
$(function() {
	MobileSearchBar__init();
});

function youtubePlugin() {
	toastui.Editor.codeBlockManager.setReplacer("youtube", function(youtubeId) {
		// Indentify multiple code blocks
		const wrapperId = "yt" + Math.random().toString(36).substr(2, 10);

		// Avoid sanitizing iframe tag
		setTimeout(renderYoutube.bind(null, wrapperId, youtubeId), 0);

		return '<div id="' + wrapperId + '"></div>';
	});
}

function renderYoutube(wrapperId, youtubeId) {
	const el = document.querySelector('#' + wrapperId);

	var urlParams = getUrlParams(youtubeId);

	var width = '100%';
	var height = '100%';

	if (urlParams.width) {
		width = urlParams.width;
	}

	if (urlParams.height) {
		height = urlParams.height;
	}

	var maxWidth = 500;

	if (urlParams['max-width']) {
		maxWidth = urlParams['max-width'];
	}

	var ratio = '16-9';

	if (urlParams['ratio']) {
		ratio = urlParams['ratio'];
	}

	var marginLeft = 'auto';

	if (urlParams['margin-left']) {
		marginLeft = urlParams['margin-left'];
	}

	var marginRight = 'auto';

	if (urlParams['margin-right']) {
		marginRight = urlParams['margin-right'];
	}

	if (youtubeId.indexOf('?') !== -1) {
		var pos = youtubeId.indexOf('?');
		youtubeId = youtubeId.substr(0, pos);
	}

	el.innerHTML = '<div style="max-width:'
			+ maxWidth
			+ 'px; margin-left:'
			+ marginLeft
			+ '; margin-right:'
			+ marginRight
			+ ';" class="ratio-'
			+ ratio
			+ ' relative"><iframe class="abs-full" width="'
			+ width
			+ '" height="'
			+ height
			+ '" src="https://www.youtube.com/embed/'
			+ youtubeId
			+ '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>';
}
// 유튜브 플러그인 끝

function youtubePlugin() {
	toastui.Editor.codeBlockManager.setReplacer("youtube", function(youtubeId) {
		// Indentify multiple code blocks
		const wrapperId = "yt" + Math.random().toString(36).substr(2, 10);

		// Avoid sanitizing iframe tag
		setTimeout(renderYoutube.bind(null, wrapperId, youtubeId), 0);

		return '<div id="' + wrapperId + '"></div>';
	});
}

function renderYoutube(wrapperId, youtubeId) {
	const el = document.querySelector('#' + wrapperId);

	var urlParams = getUrlParams(youtubeId);

	var width = '100%';
	var height = '100%';

	if (urlParams.width) {
		width = urlParams.width;
	}

	if (urlParams.height) {
		height = urlParams.height;
	}

	var maxWidth = 500;

	if (urlParams['max-width']) {
		maxWidth = urlParams['max-width'];
	}

	var ratio = '16-9';

	if (urlParams['ratio']) {
		ratio = urlParams['ratio'];
	}

	var marginLeft = 'auto';

	if (urlParams['margin-left']) {
		marginLeft = urlParams['margin-left'];
	}

	var marginRight = 'auto';

	if (urlParams['margin-right']) {
		marginRight = urlParams['margin-right'];
	}

	if (youtubeId.indexOf('?') !== -1) {
		var pos = youtubeId.indexOf('?');
		youtubeId = youtubeId.substr(0, pos);
	}

	el.innerHTML = '<div style="max-width:'
			+ maxWidth
			+ 'px; margin-left:'
			+ marginLeft
			+ '; margin-right:'
			+ marginRight
			+ ';" class="ratio-'
			+ ratio
			+ ' relative"><iframe class="abs-full" width="'
			+ width
			+ '" height="'
			+ height
			+ '" src="https://www.youtube.com/embed/'
			+ youtubeId
			+ '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>';
}
// 유튜브 플러그인 끝

// repl 플러그인 시작
function replPlugin() {
	toastui.Editor.codeBlockManager.setReplacer("repl", function(replUrl) {
		var postSharp = "";
		if (replUrl.indexOf('#') !== -1) {
			var pos = replUrl.indexOf('#');
			postSharp = replUrl.substr(pos);
			replUrl = replUrl.substr(0, pos);
		}

		if (replUrl.indexOf('?') === -1) {
			replUrl += "?dummy=1";
		}

		replUrl += "&lite=true";
		replUrl += postSharp;

		// Indentify multiple code blocks
		const wrapperId = `yt${Math.random().toString(36).substr(2, 10)}`;

		// Avoid sanitizing iframe tag
		setTimeout(renderRepl.bind(null, wrapperId, replUrl), 0);

		return "<div id=\"" + wrapperId + "\"></div>";
	});
}

function renderRepl(wrapperId, replUrl) {
	const el = document.querySelector(`#${wrapperId}`);

	var urlParams = getUrlParams(replUrl);

	var height = 400;

	if (urlParams.height) {
		height = urlParams.height;
	}

	el.innerHTML = '<iframe height="'
			+ height
			+ 'px" width="100%" src="'
			+ replUrl
			+ '" scrolling="no" frameborder="no" allowtransparency="true" allowfullscreen="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-same-origin allow-scripts allow-modals"></iframe>';
}
// repl 플러그인 끝

// codepen 플러그인 시작
function codepenPlugin() {
	toastui.Editor.codeBlockManager
			.setReplacer(
					"codepen",
					function(codepenUrl) {
						// Indentify multiple code blocks
						const wrapperId = `yt${Math.random().toString(36).substr(2, 10)}`;

						// Avoid sanitizing iframe tag
						setTimeout(renderCodepen.bind(null, wrapperId,
								codepenUrl), 0);

						return '<div id="' + wrapperId + '"></div>';
					});
}

function renderCodepen(wrapperId, codepenUrl) {
	const el = document.querySelector(`#${wrapperId}`);

	var urlParams = getUrlParams(codepenUrl);

	var height = 400;

	if (urlParams.height) {
		height = urlParams.height;
	}

	var width = '100%';

	if (urlParams.width) {
		width = urlParams.width;
	}

	if (!isNaN(width)) {
		width += 'px';
	}

	if (codepenUrl.indexOf('#') !== -1) {
		var pos = codepenUrl.indexOf('#');
		codepenUrl = codepenUrl.substr(0, pos);
	}

	el.innerHTML = '<iframe height="'
			+ height
			+ '" style="width: '
			+ width
			+ ';" scrolling="no" title="" src="'
			+ codepenUrl
			+ '" frameborder="no" allowtransparency="true" allowfullscreen="true"></iframe>';
}
// repl 플러그인 끝

// lib 시작
String.prototype.replaceAll = function(org, dest) {
	return this.split(org).join(dest);
}

function getUrlParams(url) {
	url = url.trim();
	url = url.replaceAll('&amp;', '&');
	if (url.indexOf('#') !== -1) {
		var pos = url.indexOf('#');
		url = url.substr(0, pos);
	}

	var params = {};

	url.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) {
		params[key] = value;
	});
	return params;
}

function getBodyFromXTemplate(selector) {
	return $(selector).html().trim().replace(/<!--REPLACE:script-->/gi, 'script');
}

$(document).ready(function() {
    var inputs = $(".progress-container").find($("label") );
    
    for(var i =0 ; i< inputs.length; i ++)
    { 
         var index = i +2;
         var time = ((inputs.length)-i ) * 100;
        $(".progress-container label:nth-child("+index+")").css( "-webkit-animation", "anim 6s "+time+"ms  ease-in-out" );
        $(".progress-container label:nth-child("+index+")").css( "-animation", "anim 6s "+time+"ms  ease-in-out" );
    }

})



function LeftSideBar__init() {
	var $btnToggleLeftSideBar = $('.btn-toggle-pc-side-bar');
	$btnToggleLeftSideBar.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.left-item').removeClass('active');
			$('.world-wrap').removeClass('active');
		} else {
			$(this).addClass('active');
			$('.left-item').addClass('active');
			$('.world-wrap').addClass('active');		
		}	
	});
	
	
}
$(function() {
	LeftSideBar__init();
});


	
$(function(){
    $('#back-to-top').on('click',function(e){
            e.preventDefault();
            $('html,body').animate({scrollTop:0},600);
  });
  
  $(window).scroll(function() {
    if ($(document).scrollTop() > 100) {
      $('#back-to-top').addClass('show');
    } else {
      $('#back-to-top').removeClass('show');
    }
  });
});

function SearchBox_init() {
	var $btnSearch = $('.fa-search');
	$btnSearch.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.m-search-box').removeClass('active');
		} else {
				$(this).addClass('active');
				$('.m-search-box').addClass('active'); 
		}
	});
}

$(function() {
	SearchBox_init();
});









var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active2", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active2";
}








