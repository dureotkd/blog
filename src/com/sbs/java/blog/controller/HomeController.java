  
package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
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
	public String getControllerName() {
		return "home";
	}
	
	public HomeController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	@Override
	public String doAction() {
		switch (actionMethodName) {
		case "main":
			return doActionMain(req, resp);
		case "aboutMe":
			return doActionAboutMe(req, resp);
		case "email":
			return doActionEmail(req,resp);
		case "doEmail":
			return doActionDoEmail(req,resp);
		}

		return "";
	}

	private String doActionDoEmail(HttpServletRequest req, HttpServletResponse resp) {
		
	
		    // 메일 인코딩
		    final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
		    
		    String subject = req.getParameter("subject");
		    String content = req.getParameter("content");
		    String fromEmail = req.getParameter("fromEmail");
		    String fromUsername = req.getParameter("fromUsername");
		    String toEmail = "dureotkd123@naver.com";// 콤마(,)로 여러개 나열
		    
		    final String username = "slqhswmf@gmail.com";
		    final String password = "vplphwieoveypxts";
		    
		    // 메일에 출력할 텍스트
		    StringBuffer sb = new StringBuffer();
		    sb.append(content);
		    String html = sb.toString();
		    
		    // 메일 옵션 설정
		    Properties props = new Properties();    
		    props.put("mail.transport.protocol", "smtp");
		    props.put("mail.smtp.host", "smtp.gmail.com");
		    props.put("mail.smtp.port", "465");
		    props.put("mail.smtp.auth", "true");
		 
		    props.put("mail.smtp.quitwait", "false");
		    props.put("mail.smtp.socketFactory.port", "465");
		    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		    props.put("mail.smtp.socketFactory.fallback", "false");
		    
		    try {
		      // 메일 서버  인증 계정 설정
		      Authenticator auth = new Authenticator() {
		        protected PasswordAuthentication getPasswordAuthentication() {
		          return new PasswordAuthentication(username, password);
		        }
		      };
		      
		      // 메일 세션 생성
		      Session session = Session.getInstance(props, auth);
		      
		      // 메일 송/수신 옵션 설정
		      Message message = new MimeMessage(session);
		      message.setFrom(new InternetAddress(fromEmail, fromUsername));
		      message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
		      message.setSubject(subject);
		      message.setSentDate(new Date());
		      
		      // 메일 콘텐츠 설정
		      Multipart mParts = new MimeMultipart();
		      MimeBodyPart mTextPart = new MimeBodyPart();
		      MimeBodyPart mFilePart = null;
		 
		      // 메일 콘텐츠 - 내용
		      mTextPart.setText(html, bodyEncoding, "html");
		      mParts.addBodyPart(mTextPart);
		            
		      // 메일 콘텐츠 설정
		      message.setContent(mParts);
		      
		      // MIME 타입 설정
		      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
		      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
		      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
		      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
		      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		      CommandMap.setDefaultCommandMap(MailcapCmdMap);
		 
		      // 메일 발송
		      Transport.send( message );
		      
		    } catch ( Exception e ) {
		      e.printStackTrace();
		      
		    }
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

		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);
		List<Article> articles = articleService.getForPrintListArticles(page, itemsInAPage, cateItemId,
				searchKeywordType, searchKeyword);
		req.setAttribute("articles", articles);
		List<Article> articles2 = articleService.getFortPrintViewsDESC(cateItemId,page,itemsInAPage);
		req.setAttribute("articles2",articles2);
		
		
	
		
		
		
		return "home/main.jsp";
	}

}