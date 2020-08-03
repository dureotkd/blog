package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.GuestBook;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class GuestBookDao extends Dao{
	private Connection dbConn;
	
	public GuestBookDao(Connection dbConn) {
		this.dbConn = dbConn;
	}
	
	public int actionGuestBookWrite(int host, int guest, String body) {
		SecSql secSql = new SecSql();
		secSql.append("INSERT INTO guestBook");
		secSql.append("SET regDate = NOW(),");
		secSql.append("host = ?,",host);
		secSql.append("guest = ?,",guest);
		secSql.append("body = ?",body);
		return  DBUtil.insert(dbConn, secSql);
	}

	public List<GuestBook> getForPrintGuestBook(int id) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT G.*,");
		secSql.append("M.nickname AS extra__writer,");
		secSql.append("M.image AS extra__image");
		secSql.append("FROM guestBook AS G");
		secSql.append("INNER JOIN `member` AS M");
		secSql.append("ON G. `host` = M.id");
		secSql.append("WHERE host = ?",id);
		
		List<Map<String,Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<GuestBook> guestBooks = new ArrayList<>();
		for(Map<String,Object> row : rows) {
			guestBooks.add(new GuestBook(row));
		}
		return guestBooks;
	}

}
