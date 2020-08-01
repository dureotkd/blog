  
package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.service.MailService;
import com.sbs.java.blog.util.Util;
import java.sql.Connection;
import java.util.Date;
import java.util.Properties;
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class HomeController extends Controller {
	private String mailId;
	private String mailPw;

	public String getControllerName() {
		return "home";
	}
	
	public HomeController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp,String mailId,String mailPw) {
		super(dbConn, actionMethodName, req, resp);
		this.mailId = mailId;
		this.mailPw = mailPw;
	}

	@Override
	public String doAction() {
		switch (actionMethodName) {
		case "main":
			return doActionMain(req, resp);
		case "aboutMe":
			return doActionAboutMe(req, resp);
		case "aboutMe2":
			return doActionAboutMe2(req,resp);
		case "email":
			return doActionEmail(req,resp);
		case "doEmail":
			return doActionDoEmail(req,resp);
		case "mywork":
			return doActionMyWork(req,resp);
		case "mywork2":
			return doActionMyWork2(req,resp);
		case "mywork3":
			return doActionMyWork3(req,resp);
		case "mywork4":
			return doActionmyWork4(req,resp);
		case "mywork5":
			return doActionMyWork5(req,resp);
		}

		return "";
	}

	private String doActionMyWork5(HttpServletRequest req, HttpServletResponse resp) {
		return "home/mywork5.jsp";
	}

	private String doActionAboutMe2(HttpServletRequest req, HttpServletResponse resp) {
		return "home/aboutMe2.jsp";
	}

	private String doActionmyWork4(HttpServletRequest req, HttpServletResponse resp) {
		return "home/mywork4.jsp";
	}

	private String doActionMyWork3(HttpServletRequest req, HttpServletResponse resp) {
		return "home/mywork3.jsp";
	}

	private String doActionMyWork2(HttpServletRequest req, HttpServletResponse resp) {
		return "home/mywork2.jsp";
	}

	private String doActionMyWork(HttpServletRequest req, HttpServletResponse resp) {
		return "home/mywork.jsp";
	}

	private String doActionDoEmail(HttpServletRequest req, HttpServletResponse resp) {
		
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String fromEmail = req.getParameter("fromEmail");
		String toEmail = "dureotkd123@naver.com";// 콤마(,)로 여러개 나열
		
		MailService mailSend = new MailService(mailId,mailPw);
		
		mailSend.sendEmail(subject,content,fromEmail,toEmail);
		
			return "html:<script> alert('이메일이 전송되엇습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}

	private String doActionEmail(HttpServletRequest req, HttpServletResponse resp) {
		return "home/aboutMe.jsp";
	}

	private String doActionAboutMe(HttpServletRequest req, HttpServletResponse resp) {
		return "home/aboutMe.jsp";
	}

	private String doActionMain(HttpServletRequest req, HttpServletResponse resp) {
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
		
		int itemsInAPage = 3;
		int totalCount = articleService.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
		int totalPage = (int) Math.ceil(totalCount / (double) itemsInAPage);
		
		
		List<Article> articles = articleService.getForPrintListArticles(page, itemsInAPage, cateItemId,
				searchKeywordType, searchKeyword);
		List<Article> articles2 = articleService.getFortPrintViewsDESC(cateItemId,page,itemsInAPage);

		
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);
		req.setAttribute("articles", articles);
		req.setAttribute("articles2",articles2);
		
		return "home/main.jsp";
	}

}