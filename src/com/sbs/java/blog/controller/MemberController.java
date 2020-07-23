package com.sbs.java.blog.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.Util;

public class MemberController extends Controller {
	public String getControllerName() {
		return "home";
	}

	// 세션은 서버에 저장되는 각 사용자 ( 브라우저 ) 별 개인 저장소
	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);

	}

	public String doAction() {
		// 스위치문 case 주고
		switch (actionMethodName) {
		case "join":
			return doActionJoin(req, resp);
		case "doJoin":
			return doActionDojoin(req, resp);
		case "doLogin":
			return doActionLogin(req, resp);
		case "login":
			return doActiondoLogin(req, resp);
		case "logOut":
			return doActiondoLogOut(req,resp);
		case "info":
			return doActionInfo(req,resp);
		case "findId":
			return doActionfindId(req,resp);
		case "doFindId":
			return doActiondoFindId(req,resp);
		case "findPw":
			return doActionfindPw(req,resp);
		case "doFindPw":
			return doActiondoFindPw(req,resp);
		case "doModifyMember":
			return doActionModify(req,resp);
		case "doDeleteMember":
			return doActionDelete(req,resp);
		}
		return "";
	}
	private String doActionDelete(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return null;
	}

	private String doActionModify(HttpServletRequest req, HttpServletResponse resp) {
		
		int id = Util.getInt(req, "id");
		String loginPw = req.getParameter("loginPw");
		
		
		// SHA-256 암호화 작업
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 md.update(loginPw.getBytes());
		 String hex = String.format("%064x", new BigInteger(1, md.digest()));
		//
		
		 int memberModify = MemberDao.doActionModify(hex,id);
		
		return"html:<script> alert('수정이 완료되었습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}

	private String doActiondoFindPw(HttpServletRequest req, HttpServletResponse resp) {
		
		
		 StringBuffer temp =new StringBuffer();
         Random rnd = new Random();
         for(int i=0;i<10;i++)
         {
             int rIndex = rnd.nextInt(3);
             switch (rIndex) {
             case 0:
                 // a-z
                 temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                 break;
             case 1:
                 // A-Z
                 temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                 break;
             case 2:
                 // 0-9
                 temp.append((rnd.nextInt(10)));
                 break;
             }
         }
        String a = temp.toString();
		String name = req.getParameter("name");
		String loginId = req.getParameter("loginId");
		String toEmail =req.getParameter("toEmail"); // 콤마(,)로 여러개 나열
		
		// 문제점 -> 3개중 하나로 (우연히 다른회원정보를 입력해서 ) 다르면 경고창이 떠야하는데 null이 뜬다. 
		Member memberSearch = memberService.getRightMember(name,loginId,toEmail);
		
		if ( memberSearch == null ) {
			return "html:<script> alert('정보가 일치하지않습니다.' );   location.href = document.referrer\r\n" +"</script>";
		}
		
		// 비밀번호 암호화 시키기 
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 md.update(a.getBytes());
		 String hex = String.format("%064x", new BigInteger(1, md.digest()));
		 
		 	Member memberPw = memberService.getMemberPw(name,loginId,toEmail);
		 	
		 	int memberPwUpdate = memberService.doActionMemberPwUpdate(hex,toEmail);
		    // 메일 인코딩
		    final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
		    
		    String subject = "안녕하세요 코드마운틴입니다";
		    String fromEmail = "slqhswmf@gmail.com";
		    String fromUsername = "CodeMountain";
		    String content = a;
		    
		    
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
			return "html:<script> alert('귀하에 임시 비밀번호가 담긴 이메일이 전송되었습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}





	private String doActionfindPw(HttpServletRequest req, HttpServletResponse resp) {
		return "member/findPw.jsp";
	}

	private String doActiondoFindId(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
	    String toEmail =req.getParameter("toEmail"); // 콤마(,)로 여러개 나열
	    
	    Member member = memberService.getAllMember();

	    if ( member.getEmail().equals(toEmail) == false ) {
			return "html:<script> alert('회원가입 이력이 없는 이메일입니다.' );   location.href = document.referrer\r\n" +"</script>";	
	    }
	    Member memberId = memberService.getMemberId(toEmail);
	    

	    // 메일 인코딩
	    final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
	    
	    String subject = "안녕하세요 코드마운틴입니다";
	    String fromEmail = "slqhswmf@gmail.com";
	    String fromUsername = "CodeMountain";
	    String content = memberId.getLoginId();
	    
	    
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
		return "html:<script> alert('귀하에 아이디가 담긴 이메일이 전송되었습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}

	private String doActionfindId(HttpServletRequest req, HttpServletResponse resp) {
		return "member/findId.jsp";
	}

	private String doActionInfo(HttpServletRequest req, HttpServletResponse resp) {
	
		return "member/info.jsp";
	}

	private String doActiondoLogOut(HttpServletRequest req, HttpServletResponse resp) {
	
		session.removeAttribute("loginedMemberId");
		// 로그아웃 removeAttribute
		return "html:<script> alert('로그아웃 되었습니다.'); location.replace('login'); </script>";
	}

	private String doActionLogin(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		
		if (loginId.isEmpty()) {
			return "html:<script> alert('아이디를 입력해주세요.'); location.replace('login'); </script>";
		} else if (loginPw.isEmpty()) {
			return "html:<script> alert('비밀번호를 입력해주세요.'); location.replace('login'); </script>";
		}
		
		int loginedMemberId = memberService.getMemberIdByLoginInfo(loginId, loginPw);
		// 여기서 

		if (loginedMemberId <= 0 ) {
			return "html:<script> alert('회원정보가 일치하지 않습니다.'); location.replace('login'); </script>";
		} else {
			session.setAttribute("loginedMemberId", loginedMemberId);
		}

		return "html:<script> alert('로그인 되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String doActiondoLogin(HttpServletRequest req, HttpServletResponse resp) {
		return "member/login.jsp";
	}

	private String doActionDojoin(HttpServletRequest req, HttpServletResponse resp) {
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		String email = req.getParameter("email");
		
		boolean isEmailJoinable = memberService.isEmailJoinable(email);
		if ( isEmailJoinable == false ) {
			return "html:<script> alert('이미 가입된 이메일입니다.'); location.replace('join'); </script>";
		}
		boolean isNameJoinable = memberService.isNameJoinable(nickname);
		if ( isNameJoinable == false ) {
			return "html:<script> alert('중복된 닉네임입니다.'); location.replace('join'); </script>";
		}
		boolean isLoginIdJoinable = memberService.isLoginIdJoinable(loginId);
		// isLoginIdJoinable == false면 중복 아이디
		if (isLoginIdJoinable == false) {
			return "html:<script> alert('중복된 아이디입니다.'); location.replace('join'); </script>";
		}
		
		int rm = memberService.doActionDojoin(name, nickname, loginId, loginPw, email);
		
		
		
		  final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
		    
		  
		  String subject = "안녕하세요 코드마운틴 가입을 환영합니다.";
		    String fromEmail = "slqhswmf@gmail.com";
		    String fromUsername = "CodeMountain";
		    String toEmail = email; // 콤마(,)로 여러개 나열
		    
		    final String username = "slqhswmf@gmail.com";         
		    final String password = "vplphwieoveypxts";
		    
		    // 메일에 출력할 텍스트
		    StringBuffer sb = new StringBuffer();
		    
		    sb.append("<h3>안녕하세요</h3>\n");
		    sb.append("<h4>가입을 축하드립니다.</h4>\n");    
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
		
		return String.format("html:<script> alert('%s님 환영합니다.'); location.replace('../home/main'); </script>", name);
		
	}

	private String doActionJoin(HttpServletRequest req, HttpServletResponse resp) {
		// 이거실행
		return "member/join.jsp";
	}

}