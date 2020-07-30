package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.UUID;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;

public class MemberService extends Service {
	//  attrService 에다가 아무값도 안넣어줌
	private AttrService attrService;
	private MemberDao memberDao;
	
	
	public MemberService(Connection dbConn) {
		memberDao = new MemberDao(dbConn);
		attrService = new AttrService(dbConn);
		System.out.println(attrService);
	}

	public int doActionDojoin(String name, String nickname, String loginId, String loginPw, String email, String a) {
		return memberDao.doActionDojoin(name, nickname, loginId, loginPw, email, a);
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
		return memberDao.getMemberId(name, loginId, toEmail);
	}

	public int doActionMemberPwUpdate(String hex, String toEmail) {
		return memberDao.doActionMemberPwUpdate(hex, toEmail);
	}

	public Member getAllMember() {
		return memberDao.getAllMember();
	}

	public Member getRightMember(String name, String loginId, String toEmail) {
		return memberDao.getRightMember(name, loginId, toEmail);
	}

	public boolean getMemberCode(String code, int loginedMemberId) {
		return memberDao.getMemberCode(code, loginedMemberId);
	}

	public int doActionUpdateCode(int loginedMemberId) {
		return memberDao.doActionUpdateCode(loginedMemberId);
	}

	public boolean getMemberCode2(int loginedMemberId) {
		return memberDao.getMemberCode2(loginedMemberId);
	}
	
	public String genModifyPrivateAuthCode(int actorId) {
		System.out.println(attrService);
		String authCode = UUID.randomUUID().toString();
		attrService.setValue("member__" + actorId + "__extra__modifyPrivateAuthCode", authCode);
		return authCode;
	}

	public boolean isValidModifyPrivateAuthCode(int actorId, String authCode) {
		String authCodeOnDB = attrService.getValue("member__" + actorId + "__extra__modifyPrivateAuthCode");
		
		return authCodeOnDB.equals(authCode);
	}

	public void modify(int actorId, String loginPw) {
		memberDao.modify(actorId, loginPw);
	}

}