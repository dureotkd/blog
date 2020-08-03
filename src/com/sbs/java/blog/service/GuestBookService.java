package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;

import com.sbs.java.blog.dao.GuestBookDao;
import com.sbs.java.blog.dto.GuestBook;

public class GuestBookService extends Service {
	
	private GuestBookDao guestBookDao;
	
	public GuestBookService(Connection dbConn) {
			this.guestBookDao = new GuestBookDao(dbConn);
	}

	public int actionGuestBookWrite(int host, int guest, String body) {
			return guestBookDao.actionGuestBookWrite(host,guest,body);
	}

	public List<GuestBook> getForPrintGuestBook(int id) {
		return guestBookDao.getForPrintGuestBook(id);
	}

}
