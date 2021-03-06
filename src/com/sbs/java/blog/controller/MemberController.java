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
import com.sbs.java.blog.service.MailService;
import com.sbs.java.blog.util.Util;

public class MemberController extends Controller {
	private String mailId;
	private String mailPw;
	
	public String getControllerName() {
		return "home";
	}

	// 세션은 서버에 저장되는 각 사용자 ( 브라우저 ) 별 개인 저장소
	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp,String mailId,String mailPw) {
		super(dbConn, actionMethodName, req, resp);
		
		this.mailId = mailId;
		this.mailPw = mailPw;

	}

	public String doAction() {
		// 스위치문 case 주고
		switch (actionMethodName) {
		case "join":
			return doActionJoin(req, resp); // 회원가입
		case "doJoin":
			return doActionDojoin(req, resp); // 회원가입 실행
		case "doLogin":
			return doActionLogin(req, resp); // 로그인 실행
		case "login":
			return doActiondoLogin(req, resp); // 로그인
		case "logOut":
			return doActiondoLogOut(req,resp); // 로그아웃 실행
		case "info":
			return doActionInfo(req,resp); // 회원정보
		case "userInfo":
			return actionUserInfo(); //  다른사람 정보
		case "infoEmail":
			return actionInfoEmail(req,resp); // 이메일 인증보내기
		case "findId":
			return doActionfindId(req,resp); // 아이디 찾기
		case "doFindId":
			return doActiondoFindId(req,resp); // 아이디 찾기 실행
		case "findPw":
			return doActionfindPw(req,resp); // 비밀번호 찾기
		case "doFindPw":
			return doActiondoFindPw(req,resp); // 비밀번호 찾기 실행
		case "doAuthMail":
			return doActionDoAuthMail(req,resp); // 이메일 인증 확인 
		case "getLoginIdDup":
			return actionGetLoginIdDup(req,resp); // 아이디 중복 확인
		case "getNicknameDup":
			return actionGetNicknameDup(req,resp); // 닉네임 중복 확인
		case "getEmailDup":
			return actionGetEmailDup(req,resp); // 이메일 중복 확인
		case "passwordForPrivate":
			return actionPasswordForPrivate(); // 비밀번호 수정전 비번확인
		case "doPasswordForPrivate":
			return actionDoPasswordForPrivate(); //  비밀번호 수정전 비번확인 실행
		case "modifyPrivate":
			return actionModifyPrivate(); // 비밀번호 수정
		case "doModifyPrivate":
			return actionDoModifyPrivate(); // 비밀번호 수정 실행
		}
		return "";
	}
	private String actionUserInfo() {
		
		int id = Util.getInt(req, "id");
		Member member = memberService.actionMemberById(id);
		req.setAttribute("member",member);
		
		return "member/userInfo.jsp";
	}

	private String actionInfoEmail(HttpServletRequest req, HttpServletResponse resp) {
		
		String code = req.getParameter("code");
		Member loginedMember = (Member) req.getAttribute("loginedMember");
		int loginedMemberId = loginedMember.getId();
		MailService ms = new MailService(mailId,mailPw);
		
		String email = loginedMember.getEmail();
		String title = "안녕하세요 코드마운틴입니다.";
		String msg = "<html><body><a href=" + "https://dureotkd.my.iu.gy/blog/s/member/doAuthMail?code=" + code + ">인증하기</a></body></html>";
		String body = "회원가입 감사합니다." + msg;
		
		ms.sendWelcomeMail(email, title, body);
		
		return "html:<script> alert('인증코드 이메일이 전송되었습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}

	private String actionDoModifyPrivate() {
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		String authCode = req.getParameter("authCode");

		if (memberService.isValidModifyPrivateAuthCode(loginedMemberId, authCode) == false) {
			return String.format(
					"html:<script> alert('비밀번호를 다시 체크해주세요.'); location.replace('../member/passwordForPrivate'); </script>");
		}
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
		 String loginPwEncryption = String.format("%064x", new BigInteger(1, md.digest()));
		//
		 
		memberService.modify(loginedMemberId,loginPwEncryption);
		Member loginedMember = (Member) req.getAttribute("loginedMember");
		loginedMember.setLoginPw(loginPwEncryption); // 크게 의미는 없지만, 의미론적인 면에서 해야 하는

		return String.format("html:<script> alert('개인정보가 수정되었습니다.'); location.replace('../home/main'); </script>");
	}

	private String actionModifyPrivate() {
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		String authCode = req.getParameter("authCode");
		if (memberService.isValidModifyPrivateAuthCode(loginedMemberId, authCode) == false) {
			return String.format(
					"html:<script> alert('비밀번호를 다시 체크해주세요.'); location.replace('../member/passwordForPrivate'); </script>");
		}

		return "member/modifyPrivate.jsp";
	}

	private String actionDoPasswordForPrivate() {
		String loginPw = req.getParameter("loginPwReal");

		Member loginedMember = (Member) req.getAttribute("loginedMember");
		int loginedMemberId = loginedMember.getId();

		if (loginedMember.getLoginPw().equals(loginPw)) {
			String authCode = memberService.genModifyPrivateAuthCode(loginedMemberId);

			return String
					.format("html:<script> location.replace('modifyPrivate?authCode=" + authCode + "'); </script>");
		}

		return String.format("html:<script> alert('비밀번호를 다시 입력해주세요.'); history.back(); </script>");
	}
	
	private String actionPasswordForPrivate() {
		return "member/passwordForPrivate.jsp";
	}


	private String actionGetEmailDup(HttpServletRequest req, HttpServletResponse resp) {
		String email = req.getParameter("email");
		
		boolean isJoinableEmail = memberService.isEmailJoinable(email);
		
		if ( isJoinableEmail) {
			return "json:{\"msg\":\"사용가능 한 이메일 입니다.\", \"resultCode\": \"S-1\", \"loginId\":\"" + email + "\"}"; 
		}  else {
			return "json:{\"msg\":\"이미 사용중인 이메일 입니다.\", \"resultCode\": \"F-1\", \"loginId\":\"" + email + "\"}";
		}
	}

	private String actionGetNicknameDup(HttpServletRequest req, HttpServletResponse resp) {
		String nickname = req.getParameter("nickname");
		
		boolean isJoinableNickname = memberService.isNameJoinable(nickname);
		
		if (isJoinableNickname) {
			return "json:{\"msg\":\"사용가능 한 닉네임 입니다.\", \"resultCode\": \"S-1\", \"loginId\":\"" + nickname + "\"}";
		} else {
			return "json:{\"msg\":\"이미 사용중인 닉네임 입니다.\", \"resultCode\": \"F-1\", \"loginId\":\"" + nickname + "\"}";
		}
	}

	private String actionGetLoginIdDup(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		
		boolean isJoinableLoginId = memberService.isLoginIdJoinable(loginId);
		
		if (isJoinableLoginId) {
			return "json:{\"msg\":\"사용가능 한 아이디 입니다.\", \"resultCode\": \"S-1\", \"loginId\":\"" + loginId + "\"}";
		}else {
			return "json:{\"msg\":\"이미 사용중인 아이디 입니다.\", \"resultCode\": \"F-1\", \"loginId\":\"" + loginId + "\"}";
		}
	}


	private String doActionDoAuthMail(HttpServletRequest req, HttpServletResponse resp) {
		
		String code = req.getParameter("code");
		Member loginedMember = (Member) req.getAttribute("loginedMember");
		int loginedMemberId = loginedMember.getId();
		
		boolean am = memberService.getMemberCode(code,loginedMemberId);
		
		if ( !loginedMember.getCode().equals(code) ) {
			return "html:<script> alert('이메일 인증이 실패하였습니다.' ); location.replace('../home/main')</script>";
		}
		
		memberService.doActionUpdateCode(loginedMemberId);
		
		return  "html:<script> alert('이메일 인증이 완료되었습니다.' ); location.replace('../home/main')</script>";
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
		 
		 	Member member = memberService.getMemberPw(name,loginId,toEmail);
		 	int memberPwUpdate = memberService.doActionMemberPwUpdate(hex,toEmail);
		   
		 	String title = "안녕하세요 코드마운틴입니다.";
		 	MailService findPw = new MailService(mailId,mailPw);
		 	
		 	memberService.setValue(member);
		 	// 임시비밀번호 업데이트시 useTempPassword value 값을 1로 해서  구분하기.
		 	
		 	findPw.sendFindPw(toEmail, title, a);
		 	
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
	    
	    
	    String title = "안녕하세요 코드마운틴입니다.";
	    String body = memberId.getLoginId();
	    
	    MailService findIdMail = new MailService(mailId,mailPw);
		
	    findIdMail.sendFindId(toEmail, title, body);
	    
		return "html:<script> alert('귀하에 아이디가 담긴 이메일이 전송되었습니다.' );   location.href = document.referrer\r\n" +"</script>";
	}

	private String doActionfindId(HttpServletRequest req, HttpServletResponse resp) {
		return "member/findId.jsp";
	}

	private String doActionInfo(HttpServletRequest req, HttpServletResponse resp) {
		
		
		Member loginedMember = (Member) req.getAttribute("loginedMember");
		int loginedMemberId = loginedMember.getId();
		
//		boolean memberCode = memberService.getMemberCode2(loginedMemberId);
//		System.out.println(memberCode);
//		if ( memberCode == false ) {
//			return "html:<script> alert('이메일 인증후 이용asdasddsa가능합니다.'); location.replace('login'); </script>";
//		}
		
		return "member/info.jsp";
	}

	private String doActiondoLogOut(HttpServletRequest req, HttpServletResponse resp) {
	
		session.removeAttribute("loginedMemberId");
		// 로그아웃 removeAttribute
		return "html:<script> alert('로그아웃 되었습니다.'); location.href = document.referrer\r\n;" + " </script>";
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
	
		
		if (loginedMemberId <= 0 ) {
			return "html:<script> alert('회원정보가 일치하지 않습니다.'); location.replace('login'); </script>";
		} 
		
		session.setAttribute("loginedMemberId", loginedMemberId);
		
		//  logiendMemberId  value 값이 .equals 1이면 true ->  임시비밀번호 사용중 
		boolean isNeedToChangePasswordForTemp = memberService.isNeedToChangeaPasswordForTemp(loginedMemberId);
		
		if (isNeedToChangePasswordForTemp) {
			return "html:<script> alert('로그인 되었습니다 \\n[현재 임시패스워드를 사용중입니다 비밀번호를 변경해주세요.]'); location.replace('../home/main'); </script>";
		}
		
		// Member loginedMember = (Member) req.getAttribute("loginedMember");
		
		return "html:<script> alert('로그인 되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String doActiondoLogin(HttpServletRequest req, HttpServletResponse resp) {
		return "member/login.jsp";
	}

	private String doActionDojoin(HttpServletRequest req, HttpServletResponse resp) {
		
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
		String nickname = req.getParameter("nickname");
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		String email = req.getParameter("email");
		String image = req.getParameter("image");
		
		
		if ( loginId.equals("admin")) {
			return "html:<script> alert(' [admin] 아이디는 사용하실 수 없습니다.'); location.replace('join'); </script>";
		}
		
		if ( nickname.equals("admin") || nickname.equals("운영자")) {
			return "html:<script> alert(' [admin,운영자] 닉네임은 사용하실수 없습니다.'); location.replace('join'); </script>"; 
		}
		
		
		String title = "안녕하세요 코드마운틴입니다.";
		int rm = memberService.doActionDojoin(name, nickname, loginId, loginPw, email,a,image);
		MailService ms = new MailService(mailId,mailPw);
		
		String body = "회원가입 감사합니다.";
		
		ms.sendWelcomeMail(email, title, body);
		
		return String.format("html:<script> alert('%s님 환영합니다. Info 에서 이메일인증을 꼭 해주세요'); location.replace('../home/main'); </script>", name);
	}

	private String doActionJoin(HttpServletRequest req, HttpServletResponse resp) {
		// 이거실행
		return "member/join.jsp";
	}

}