package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class VisitDao {
	private static Connection dbConn;
	
	public VisitDao(Connection dbConn) {
		dbConn = dbConn;
	}

	public int getVisitTotalCount() {
		SecSql secSql = new SecSql();
		secSql.append("INSERT INTO VISIT");
		secSql.append("(V_DATE) VALUES (sysdate)");
		return DBUtil.insert(dbConn, secSql);
	}

}
