package com.sbs.java.blog.dto;

import java.util.Map;



public class Member extends Dto {
	private String loginId;
	private String loginPw;
	private String name;
	private String nickname;
	private String email;
	
	
	
	public Member(Map<String, Object> row) {
		super(row);
		this.email = (String) row.get("email");
		this.loginId = (String) row.get("loginId");
		this.loginPw = (String) row.get("loginPw");
		this.name = (String) row.get("name");
		this.nickname = (String) row.get("nickname");
	}
	
	public Member(String loginId, String loginPw, String name, String nickname, String email) {
		this.loginId = loginId;
		this.loginPw = loginPw;
		this.name = name;
		this.nickname = nickname;	
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "Member [loginId=" + loginId + ", loginPw=" + loginPw + ", name=" + name
				+ ", nickname=" + nickname + ", email=" + email + ", getId()=" + getId() + ", getRegDate()="
				+ getRegDate() + ", getExtra()=" + getExtra() + "]";
	}


	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginPw() {
		return loginPw;
	}
	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
