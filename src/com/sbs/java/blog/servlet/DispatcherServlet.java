package com.sbs.java.blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.app.App;

public class DispatcherServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//들어오는 데이터를 이걸로 해석!..
		req.setCharacterEncoding("UTF-8");
		
		String mailId = getServletConfig().getInitParameter("gmailId");
		String mailPw = getServletConfig().getInitParameter("gmailPw");
	
		new App(req, resp,mailId,mailPw).start();
	}
	
	

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}