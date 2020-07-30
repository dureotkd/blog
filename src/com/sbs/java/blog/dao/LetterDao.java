package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.Letter;
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
	public List<Letter> getForPrintListLetters() {
		SecSql secSql = new SecSql();
		secSql.append("SELECT L.*,");
		secSql.append("M.nickname AS extra__writer");
		secSql.append("FROM letter AS L");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON L. fromNickname = M.nickname");
		secSql.append("WHERE 1;");

		List<Map<String,Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Letter> letters = new ArrayList<>();
		for (Map<String, Object> row : rows) {
			letters.add(new Letter(row));
		}
		return letters;
	}

}
