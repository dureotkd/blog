package com.sbs.java.blog.service;

import java.sql.Connection;

import com.sbs.java.blog.controller.Session;
import com.sbs.java.blog.dao.VisitDao;

public class VisitService extends Service {
	
	private Session session;
	private VisitDao visitDao;
	public VisitService(Connection dbConn) {
		visitDao = new VisitDao(dbConn);
	}
	public int getVisitTotalCount() {
		return visitDao.getVisitTotalCount();
	}
	
}
