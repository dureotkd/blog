package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dao.LetterDao;
import com.sbs.java.blog.dto.Letter;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;

public class LetterService extends Service {
	private LetterDao letterDao;
	
	public LetterService(Connection dbConn) {
		letterDao = new LetterDao(dbConn);
	}

	public  int actionSendLetter(String title, String body ,String sendNickname, String loginedNickname ) {
		return letterDao.actionSendLetter(title,body,sendNickname,loginedNickname);
	}

	public List<Letter> getForPrintListLetters() {
		return letterDao.getForPrintListLetters();
	}
	
	
}
