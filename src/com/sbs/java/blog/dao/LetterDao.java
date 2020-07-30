package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class LetterDao {
	private Connection dbConn;
	public LetterDao(Connection dbConn) {
		this.dbConn = dbConn;
	}
	public int actionSendLetter(String title, String body,String sendNickname,String loginedNickname) {
		SecSql secSql = new SecSql();
		
		secSql.append("INSERT INTO letter");
		secSql.append("SET regDate = NOW()");
		secSql.append(", title = ?",title);
		secSql.append(", body = ?",body);
		secSql.append(", sendNickname = ?",sendNickname);
		secSql.append(", fromNickname = ?",loginedNickname);
		return DBUtil.insert(dbConn, secSql);
	}

}
