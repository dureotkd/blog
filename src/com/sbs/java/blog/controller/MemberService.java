package com.sbs.java.blog.controller;

import java.sql.Connection;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.service.Service;

public class MemberService extends Service {

	private MemberDao memberDao;
	
	public MemberService(Connection dbConn) {
		memberDao = new MemberDao(dbConn);
	}
	public int doActionDojoin(String name,String nickname,String loginId,String loginPw, String email) {
		return memberDao.doActionDojoin(name,nickname,loginId,loginPw,email);
	}
	public boolean isLoginIdJoinable(String loginId) {
		return memberDao.isLoginIdJoinable(loginId);
	}
	public int getMemberIdByLoginInfo(String loginId, String loginPw) {
		return memberDao.getMemberIdByLoginInfo(loginId, loginPw);
	}
	public boolean isNameJoinable(String nickname) {
		return memberDao.isNameJoinable(nickname);
	}
	public boolean isEmailJoinable(String email) {
		return memberDao.isEmailJoinable(email);
	}
	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}
	public Member getMemberId(String toEmail) {
		return memberDao.getMemberId(toEmail);
	}
	public Member getMemberPw(String name, String loginId, String toEmail) {
		return memberDao.getMemberId(name,loginId,toEmail);
	}
	public int doActionMemberPwUpdate(String hex, String toEmail) {
		return memberDao.doActionMemberPwUpdate(hex,toEmail);
	}
	public Member getAllMember() {
		return memberDao.getAllMember();
	}
	public Member getRightMember(String name,String loginId,String toEmail) {
		return memberDao.getRightMember(name,loginId,toEmail);
	}

}