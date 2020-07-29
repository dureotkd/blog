package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.service.ArticleService;
import com.sbs.java.blog.service.AttrService;
import com.sbs.java.blog.service.MemberService;

public abstract class Controller {
	protected Connection dbConn;
	protected String actionMethodName;
	protected static HttpServletRequest req;
	protected static HttpServletResponse resp;
	protected HttpSession session;
	protected ArticleService articleService;
	protected MemberService memberService;
	protected AttrService attrService;

	
	public Controller(Connection dbConn, String actionMethodName, HttpServletRequest req, HttpServletResponse resp) {
		this.dbConn = dbConn;
		this.actionMethodName = actionMethodName;
		this.req = req;
		this.resp = resp;
		session = req.getSession();
		articleService = new ArticleService(dbConn);
		memberService = new MemberService(dbConn);
	}

	public abstract String getControllerName();
	

	
	

	// 얘도 죽고
	public void beforeAction() {
		// 액션 전 실행
		// 이 메서드는 모든 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		int cateArticle = articleService.getAllarticle();

		List<CateItem> cateItems = articleService.getForPrintCateItems();
		req.setAttribute("cateItems", cateItems);
		
		int loginedMemberId = -1;
		boolean isLogined = false;
		Member loginedMember = null;

		if ( session.getAttribute("loginedMemberId") != null ) {
			loginedMemberId = (int)session.getAttribute("loginedMemberId");
			isLogined = true;
			loginedMember = memberService.getMemberById(loginedMemberId);
		}
		req.setAttribute("cateArticle", cateArticle);
		req.setAttribute("loginedMemberId", loginedMemberId);
		req.setAttribute("loginedMember", loginedMember);
		req.setAttribute("isLogined", isLogined);
	}
	
	// 집에서 확인 

	public void afterAction() {
		// 액션 후 실행
	}
	

	public abstract String doAction();
	
	
	public String executeAction() {
		
		String guardRs = doGuard();
		
		// 가드가 널이 아니면 guardRs를 리턴
		
		if (guardRs != null) {
			return guardRs;
		}

		beforeAction();
		String rs = doAction();
		afterAction();

		return rs;
	}

	private String doGuard() {
		// 컨트롤러에서 실행될떄 쿼리가 실행 안되므로 기본적으로article에는 null 값이 들어가 있음.. -> controller 에서는 불가능
		// 지금 article 안에는 null 값이 들어가 있음.
		boolean logined = false;

		int loginedMemberId = -1;
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
			logined = true;
		}
	
		boolean needToLogin = false;

		switch (getControllerName()) {
		case "article":
			switch (actionMethodName) {
			case "write":
			case "doWrite":
			case "modify":
			case "doModify":
			case "doDelete":
			case "replyModify":
			case "reply":
			case "replyDelete":
				needToLogin = true;
				break;
			}
			break;
		case "member":
			break;
		}
		
		if (needToLogin && logined == false) {
			return "html:<script> alert('로그인 후 이용해주세요.'); location.href = '../member/login'; </script>";
		} 
		return null;
	}
}