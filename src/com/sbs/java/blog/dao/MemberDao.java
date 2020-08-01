package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Letter;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class MemberDao {
	private static Connection dbConn;
	
	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public int doActionDojoin(String name,String nickname,String loginId,String loginPw,String email,String a,String image) {

		SecSql secSql = new SecSql();

		secSql.append("INSERT INTO member ");
		secSql.append("SET regDate = NOW()");
		secSql.append(", updateDate = NOW()");
		secSql.append(", name = ? ", name);
		secSql.append(", nickname = ? ",nickname);
		secSql.append(", loginId = ? ",loginId);
		secSql.append(", loginPw = ? ",loginPw);
		secSql.append(", email = ? ",email);
		secSql.append(", code = ? ",a);
		secSql.append(", mailStatus = 0 ");
		secSql.append(", image = ? ",image);
		return DBUtil.insert(dbConn, secSql);
	}

	public boolean isLoginIdJoinable(String loginId) {
		SecSql secSql = new SecSql();
		
		secSql.append("SELECT COUNT(*) from member ");
		secSql.append("WHERE loginId = ? ",loginId);
		//전체 행 갯수 가져오기 COUNT(*) 쿼리
		// and loginPw = '%s' 
		return DBUtil.selectRowIntValue(dbConn, secSql) == 0;
	}

	public int getMemberIdByLoginInfo(String loginId, String loginPw) {
		SecSql secSql = new SecSql();
		
		secSql.append("SELECT id");
		secSql.append("FROM member");
		secSql.append("WHERE loginId = ?", loginId);
		secSql.append("AND loginPw = ?", loginPw);
		
		//java.util.ArrayList cannot be cast to com.sbs.java.blog.dto.Member -> 단일값을 배열로  쓰려고 하지마라
		//전체 행 갯수 가져오기 COUNT(*) 쿼리
		// and loginPw = '%s' 
		return DBUtil.selectRowIntValue(dbConn, secSql);
	}

	public boolean isNameJoinable(String nickname) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT COUNT(*) from member ");
		secSql.append("WHERE nickname = ? ",nickname);
		return DBUtil.selectRowIntValue(dbConn, secSql) == 0;
	}

	public boolean isEmailJoinable(String email) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT COUNT(*) from member ");
		secSql.append("WHERE email = ? ",email);
		return DBUtil.selectRowIntValue(dbConn, secSql) == 0;
	}

	public Member getMemberById(int id) {
		SecSql sql = SecSql.from("SELECT *");
		sql.append("FROM member ");
		sql.append("WHERE id = ?", id);

		return new Member(DBUtil.selectRow(dbConn, sql));
	}

	public Member getMemberId(String toEmail) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * FROM member");
		secSql.append("WHERE email");
		secSql.append("LIKE CONCAT ('%', ?, '%')",toEmail);
		
		return new Member(DBUtil.selectRow(dbConn, secSql));
	}

	public Member getMemberId(String name, String loginId, String toEmail) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * FROM member");
		secSql.append("WHERE email ");
		secSql.append("LIKE CONCAT ('%', ?, '%')",toEmail);
		secSql.append("AND name LIKE CONCAT ('%', ?, '%')",name);
		secSql.append("AND loginId LIKE CONCAT ('%', ?, '%')",loginId);
	
		return new Member(DBUtil.selectRow(dbConn, secSql));
	}

	public int doActionMemberPwUpdate(String hex, String toEmail) {

		SecSql secSql = new SecSql();
		secSql.append("UPDATE member");
		secSql.append("SET loginPw = ? ",hex);
		secSql.append("WHERE email = ? ",toEmail);
		return DBUtil.update(dbConn, secSql);
	}

	public List<Member> getAllMember() {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * FROM member");
		List<Map<String,Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Member> members = new ArrayList<>();
		for (Map<String, Object> row : rows) {
			members.add(new Member(row));
		}
		return members;
	}

	public Member getRightMember(String name,String loginId,String toEmail) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * FROM member");
		secSql.append("WHERE name = ?",name);
		secSql.append("AND loginId = ?",loginId);
		secSql.append("AND email = ?",toEmail);
		
		Map<String, Object> row = DBUtil.selectRow(dbConn, secSql);
		
		if ( row.isEmpty() ) {
			return null;
		}
	
		return new Member(row);
	}

	public static int doActionModify(String hex,int id) {
		SecSql secSql = new SecSql();
		
		secSql.append("UPDATE member");
		secSql.append("SET loginPw = ?",hex);
		secSql.append("WHERE id = ?", id);
		
		return DBUtil.update(dbConn, secSql);
	}

	public boolean getMemberCode(String code, int loginedMemberId) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT COUNT(*) from member ");
		secSql.append("WHERE code = ? ",code);
		secSql.append("AND id = ? ",loginedMemberId);
		
		return DBUtil.selectRowIntValue(dbConn, secSql) == 1;
	}

	public int doActionUpdateCode(int loginedMemberId) {
		SecSql secSql = new SecSql();
		
		secSql.append("UPDATE member");
		secSql.append("SET mailStatus = 1");
		secSql.append("WHERE id = ?", loginedMemberId);
		
		
		return DBUtil.update(dbConn, secSql);
	}

	public boolean getMemberCode2(int loginedMemberId) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT COUNT(*) from member ");
		secSql.append("WHERE loginId = ? ",loginedMemberId);
		secSql.append("AND mailStatus = 0");
		return DBUtil.selectRowIntValue(dbConn, secSql) == 0;
	}

	public void modify(int actorId, String encryption) {
		SecSql sql = SecSql.from("UPDATE member");
		sql.append("SET updateDate = NOW()");
		sql.append(", loginPw = ?", encryption);
		sql.append("WHERE id = ?", actorId);
		DBUtil.update(dbConn, sql);
	}

	public Member getAllMember2() {
		SecSql secSql = new SecSql();
		secSql.append("SELECT FROM member");
		
		
		Map<String, Object> row = DBUtil.selectRow(dbConn, secSql);
		
		if ( row.isEmpty() ) {
			return null;
		}
	
		return new Member(row);
		
	}



	
}
