package com.sbs.java.blog.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailService {
	Session session;
	final String username;
	final String password;
	
	public MailService(String mailId, String mailPw) {
		this.username = mailId;
		this.password = mailPw;
	}
	
	public void mailStart() {
		Properties props = new Properties();
		props.put("mail.smtp.user", username);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		this.session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
	}

	public void sendWelcomeMail(String memberEmail, String title, String body) {
		this.mailStart();
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("slqhswmf@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(memberEmail));
			message.setSubject(String.format("%s", title));
			message.setContent(String.format("%s", body),"text/html; charset=utf-8");// 글내용을 html타입 charset설정
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void sendFindId(String toEmail, String title, String body) {
		this.mailStart();
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("CodeMountain"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject(String.format("%s", title));
			message.setContent(String.format("%s", body),"text/html; charset=utf-8");// 글내용을 html타입 charset설정
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public void sendFindPw(String toEmail,String title,String a) {
		this.mailStart();
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("CodeMountain"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject(String.format("%s", title));
			message.setContent(String.format("%s", a),"text/html; charset=utf-8");// 글내용을 html타입 charset설정
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sendEmailConfirm(String email, String title, String body2) {
		this.mailStart();
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("CodeMountain"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject(String.format("%s", title));
			message.setContent(String.format("%s", body2),"text/html; charset=utf-8");// 글내용을 html타입 charset설정
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sendEmail(String subject, String content, String fromEmail, String toEmail) {
		this.mailStart();
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("%s",fromEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject(String.format("%s", subject));
			message.setContent(String.format("%s", content),"text/html; charset=utf-8");// 글내용을 html타입 charset설정
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
}