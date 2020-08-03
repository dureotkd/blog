package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import com.sbs.java.blog.dto.GuestBook;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.Util;

public class GuestBookController extends Controller {

	public GuestBookController(Connection dbConn, String actionMethodName) {
		super(dbConn, actionMethodName, req, resp);
	}
	
	public void beforeAction() {
		super.beforeAction();
		// 이 메서드는 게시물 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		// 필요없다면 지워도 된다.
	}

	@Override
	public String getControllerName() {
		return "guestBook";
	}

	@Override
	public String doAction() {
		switch(actionMethodName) {		
		case "write":
			return actionGuestBookWrite();
		case "list":
			return actionGuestBookList();
		}
		return "";
	}


	private String actionGuestBookList() {
		int id = Util.getInt(req,"id");
		
		Member member = memberService.actionMemberById(id);
		req.setAttribute("member",member);
		
		List<GuestBook> guestBooks = guestBookService.getForPrintGuestBook(id);
		req.setAttribute("guestBooks",guestBooks);
		return "guestBook/list.jsp";
		
		
	}

	private String actionGuestBookWrite() {	
		int host = Util.getInt(req, "host");
		int guest = Util.getInt(req, "guest");
		String body = req.getParameter("body");
		int gw = guestBookService.actionGuestBookWrite(host,guest,body);
		
		return "html:<script> alert('방명록이 작성되었습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}

}
