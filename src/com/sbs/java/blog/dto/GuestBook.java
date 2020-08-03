package com.sbs.java.blog.dto;

import java.util.Map;

public class GuestBook extends Dto {
	private int host;
	private int guest;
	private String body;
	public GuestBook(Map<String, Object> row) {
		super(row);
		
		this.host = (int) row.get("host");
		this.guest = (int) row.get("guest");
		this.body = (String) row.get("body");
	}
	public int getHost() {
		return host;
	}
	public void setHost(int host) {
		this.host = host;
	}
	public int getGuest() {
		return guest;
	}
	public void setGuest(int guest) {
		this.guest = guest;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	@Override
	public String toString() {
		return "GuestBook [host=" + host + ", guest=" + guest + ", body=" + body + "]";
	}
	
	

}
