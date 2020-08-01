package com.sbs.java.blog.controller;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.ArticleReply;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.Util;

public class ArticleController extends Controller {
	
	public String getControllerName() {
		return "article";
	}

	public ArticleController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	public void beforeAction() {
		super.beforeAction();
		// 이 메서드는 게시물 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		// 필요없다면 지워도 된다.
	}
	
	// write 는 받은 파라미터 정보들을 ->  write.jsp로 리턴해주는 역할
	// doWrite -> 파라미터로 dbutil에게 보내주고 팝업창 띄우는 역할 
	public String doAction() {
		switch (actionMethodName) {
		case "list":
			return doActionList(req, resp);
		case "detail":
			return doActionDetail(req, resp);
		case "write":
			return doActionWrite(req, resp);
		case "doWrite":
			return doActionDoWrite(req, resp);
		case "modify":
			return doActionModify(req,resp);
		case "doModify":
			return doActionDoModify(req,resp);
		case "doDelete":
			return doActionDoDelete(req,resp);
		case "reply":
			return doActionReply(req,resp);
		case "replyDelete":
			return doActionReplyDelete(req,resp);
		case "replyModify":
			return doActionReplyModify(req,resp);
		case "allList":
			return doActionAllList(req,resp);
			}
		
		return "";
	}



	private String doActionAllList(HttpServletRequest req, HttpServletResponse resp) {
		List<Article> articles = articleService.getForPrintAllArticle();
		List<ArticleReply> articleReplys = articleService.getForPrintAllReply();
		
		
		req.setAttribute("articles", articles);
		req.setAttribute("articleReplys",articleReplys);
		return "article/allList.jsp";
	}

	private String doActionReplyModify(HttpServletRequest req, HttpServletResponse resp) {
		int id = Util.getInt(req, "id");
		String body = req.getParameter("body").trim();
		int replyModify = articleService.doActionReplyModify(id,body);
		return "html:<script> alert('댓글이 수정되었습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}



	private String doActionReplyDelete(HttpServletRequest req, HttpServletResponse resp) {
		int id = Util.getInt(req, "id");
		
		int replyDelete = articleService.doActionDoReplydelete(id);
		
		return "html:<script> alert('댓글이 삭제되었습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}

	private String doActionReply(HttpServletRequest req, HttpServletResponse resp) {
		int id = Util.getInt(req, "id");
		int memberId = Util.getInt(req, "memberId");
		String body = req.getParameter("body").trim();
		
		
		if ( body.length() == 0 ) {
			return "html:<script> alert('내용을 입력해주세요.' );   history.go(-1);  </script>";
		}
		
		int rp = articleService.doActionReply(id,memberId,body);
		return "html:<script> alert('댓글이 등록되었습니다.' );   location.href = document.referrer;" +"</script>";
	}

	private String doActionDoDelete(HttpServletRequest req, HttpServletResponse resp) {
		int id = Util.getInt(req, "id");
		int rv = articleService.doActionDoDelete(id);
		return "html:<script> alert(' 게시물이 삭제되었습니다.'); location.replace('list'); </script>";
	}


	private String doActionDoModify(HttpServletRequest req, HttpServletResponse resp) {
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int id = Util.getInt(req, "id");
		
		int rm = articleService.doActionDoModify(title,body,id);
		return "html:<script> alert(' 게시물이 수정되었습니다.'); location.replace('list'); </script>";
	}
	
	private String doActionModify(HttpServletRequest req, HttpServletResponse resp) {
		
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int cateItemId = 0;
		String cateItemName = "전체 게시글";

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		if (cateItemId != 0) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();
		}

		int id = Util.getInt(req, "id");
		
		articleService.increaseHit(id);
		
		Article article = articleService.getForPrintArticle(id);

		req.setAttribute("cateItemName", cateItemName);
		req.setAttribute("article", article);

		return "article/modify.jsp";
	}

	private String doActionWrite(HttpServletRequest req, HttpServletResponse resp) {
		return "article/write.jsp";
	}

	private String doActionDoWrite(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		// 근데 여기서 이 memberId가 1인지 2인지 어케앎..? 로그인 할때마다 바뀌는건데 일단 실험 numberForMat -> 일단 널 
		
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int cateItemId = Util.getInt(req, "cateItemId");
		int memberId = Util.getInt(req, "memberId");
		
				// 지금 현재 상태로는 널이라는거지.
		if ( title.isEmpty()) {
			return "html:<script> alert('제목을 입력해주세요.'); location.replace('write'); </script>";
		}
		
		if ( body.isEmpty()) {
			return "html:<script> alert('내용을 입력해주세요.'); location.replace('write'); </script>";
		}

		int rs = articleService.doActionDoWrite(title,body,cateItemId,memberId);
		return "html:<script> alert(' " + rs + "번 게시물이 등록되었습니다.'); location.replace('list'); </script>";
	}

	private String doActionDetail(HttpServletRequest req, HttpServletResponse resp) {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int cateItemId = 0;
		String cateItemName = "전체";

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		if (cateItemId != 0) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();
		}

		int id = Util.getInt(req, "id");
		
		
		Article articleLastId = articleService.getArticleLastId();
		Article articleFirstId = articleService.getArticleFirstId();
		articleService.increaseHit(id);
		Article article = articleService.getForPrintArticle(id);
		List<ArticleReply> articleReplys = articleService.getForPrintArticleReplys(id);
		int totalCount = articleService.getTotalCount(id);
		req.setAttribute("articleLastId", articleLastId);
		req.setAttribute("articleFirstId", articleFirstId);
		req.setAttribute("totalCount",totalCount);
		req.setAttribute("cateItemName", cateItemName);
		req.setAttribute("article", article);
		req.setAttribute("articleReplys",articleReplys);
		
		return "article/detail.jsp";
	}

	private String doActionList(HttpServletRequest req, HttpServletResponse resp) {
		

		int page = 1;

		if (!Util.empty(req, "page") && Util.isNum(req, "page")) {
			page = Util.getInt(req, "page");
		}

		int cateItemId = 0;

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		String cateItemName = "전체";

		if (cateItemId != 0) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();
		}
		req.setAttribute("cateItemName", cateItemName);

		String searchKeywordType = "";

		if (!Util.empty(req, "searchKeywordType")) {
			searchKeywordType = Util.getString(req, "searchKeywordType");
		}

		String searchKeyword = "";

		if (!Util.empty(req, "searchKeyword")) {
			searchKeyword = Util.getString(req, "searchKeyword");
		}
		
		
		
		
		int itemsInAPage = 10;
		int totalCount = articleService.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
		int totalPage = (int) Math.ceil(totalCount / (double) itemsInAPage);
		req.setAttribute("totalCount",totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);
		List<Article> articles = articleService.getForPrintListArticles(page, itemsInAPage, cateItemId,
				searchKeywordType, searchKeyword);
		req.setAttribute("articles", articles);

		return "article/list.jsp";
	}
}