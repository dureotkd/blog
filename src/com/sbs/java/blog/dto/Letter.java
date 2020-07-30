package com.sbs.java.blog.dto;

import java.util.Map;

public class Letter extends Dto {
	private String sendNickname;
	private String fromNickname;
	private int fromId;
	private String title;
	private String body;
	
	public Letter(Map<String, Object> row) {
		super(row);
		
		this.sendNickname = (String) row.get("sendNickname");
		this.fromNickname = (String) row.get("fromNickname");
		this.title = (String) row.get("title");
		this.body = (String) row.get("body");
		
	}
	
	@Override
	public String toString() {
		return "Letter [sendNickname=" + sendNickname + ", fromNickname=" + fromNickname + ", fromId=" + fromId
				+ ", title=" + title + ", body=" + body + "]";
	}

	public String getSendNickname() {
		return sendNickname;
	}


	public void setSendNickname(String sendNickname) {
		this.sendNickname = sendNickname;
	}


	public String getFromNickname() {
		return fromNickname;
	}

	public void setFromNickname(String fromNickname) {
		this.fromNickname = fromNickname;
	}


	public int getFromId() {
		return fromId;
	}


	public void setFromId(int fromId) {
		this.fromId = fromId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getBody() {
		return body;
	}


	public void setBody(String body) {
		this.body = body;
	}

}
