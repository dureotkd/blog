package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Letter;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.Util;

public class LetterController extends Controller {
	
	public String getControllerName() {
		return "letter";
	}
	
	public LetterController(Connection dbConn, String actionMethodName) {
		super(dbConn, actionMethodName, req, resp);
		
	}

	@Override
	public String doAction() {
		switch (actionMethodName) {
		case "list":
			return actionLetterList(req,resp);
		case "send":
			return actionLetterSend(req,resp);
		case "doSend":
			return actionDoLetterSend(req,resp);
		case "memberList":
			return actionDoAllMemberViews(req,resp);
		}
		return "";
	}
	
	
	private String actionDoAllMemberViews(HttpServletRequest req, HttpServletResponse resp) {
		
		List<Member> members = memberService.actionDoAllMemberViews();
		req.setAttribute("members", members);
		return	"letter/memberList.jsp";
	}

	private String actionDoLetterSend(HttpServletRequest req, HttpServletResponse resp) {
		
		Member loginedMember = (Member) req.getAttribute("loginedMember");
		String loginedNickname = loginedMember.getNickname();
		String sendNickname = req.getParameter("sendNickname");
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		System.out.println(body);
		
		int am = letterService.actionSendLetter(title,body,sendNickname,loginedNickname);
		
		
		return "html:<script> alert('쪽지가 전송되엇습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}

	private String actionLetterSend(HttpServletRequest req, HttpServletResponse resp) {
		return "letter/send.jsp";
	}

	private String actionLetterList(HttpServletRequest req, HttpServletResponse resp) {
		List<Letter> letters = letterService.getForPrintListLetters();
		req.setAttribute("letters", letters);
		
		return "letter/list.jsp";
	}
	
}
