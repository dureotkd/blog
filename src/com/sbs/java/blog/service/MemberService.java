package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;
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

	public int doActionDojoin(String name, String nickname, String loginId, String loginPw, String email, String a,String image) {
		return memberDao.doActionDojoin(name, nickname, loginId, loginPw, email, a,image);
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
		Member member = memberDao.getMemberById(id);
		boolean isNeedToChangePasswordForTemp = isNeedToChangePasswordForTemp(member.getId());
		member.getExtra().put("isNeedToChangePasswordForTemp", isNeedToChangePasswordForTemp);
		return member;
	}

	private boolean isNeedToChangePasswordForTemp(int id) {
		return attrService.getValue("member", id, "extra", "useTempPassword").equals("1");
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
		return memberDao.getAllMember2();
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
		String authCode = UUID.randomUUID().toString();
		attrService.setValue("member__" + actorId + "__extra__modifyPrivateAuthCode", authCode);
		return authCode;
	}

	public boolean isValidModifyPrivateAuthCode(int actorId, String authCode) {
		String authCodeOnDB = attrService.getValue("member__" + actorId + "__extra__modifyPrivateAuthCode");
		
		return authCodeOnDB.equals(authCode);
	}

	public void modify(int actorId, String encryption) {
		memberDao.modify(actorId, encryption);
		
		
		attrService.remove("member", actorId, "extra", "useTempPassword");
	}

	public void setValue(Member member) {
		attrService.setValue("member",member.getId(),"extra","useTempPassword","1");
	}

	public boolean isNeedToChangeaPasswordForTemp(int actorId) {
		return attrService.getValue("member", actorId, "extra", "useTempPassword").equals("1");
	}

	public List<Member> actionDoAllMemberViews() {
		return	memberDao.getAllMember();
	}

}