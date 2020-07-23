package com.sbs.java.blog.controller;

import com.sbs.java.blog.dto.Member;
public class Session {
	
	private Member nickName;
	private Member loginedMemberId;
	
	
	public Member getLoginedMember() {
		return loginedMemberId;
	}

	public void setLoginedMember(Member loginedMember,Member loginedMemberNickname) {
		this.loginedMemberId = loginedMember;
		this.nickName = nickName;
	}
	
	public boolean isLogined() {
		return loginedMemberId != null;
	}
	
}
