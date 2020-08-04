package com.sbs.java.blog.dto;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Article extends Dto {
	private String updateDate;
	private int cateItemId;
	private int hit;
	private int memberId;
	private String title;
	private String body;
	
	
	String img = null;
	public String getimgTagFormat() {
		Pattern pattern  =  Pattern.compile("[(http(s)?):\\/\\/(www\\.)?a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%_\\+.~#?&//=]*)");
		Matcher match = pattern.matcher(this.getBody());
		
		if ( match.find()) {
			img = match.group(1);
		}
		return img;
	}
	
	
	public String getBodyForXTemplate() {
		return body.replaceAll("(?i)script", "<!--REPLACE:script-->");
	}
	
	public int getHit() {
		return hit;
	}
	
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public Article(Map<String, Object> row) {
		super(row);

		this.updateDate = (String) row.get("updateDate");
		this.cateItemId = (int) row.get("cateItemId");
		this.title = (String) row.get("title");
		this.body = (String) row.get("body");
		this.hit = (int) row.get("hit");
		this.memberId = (int) row.get("memberId");
		
	}



	@Override
	public String toString() {
		return "Article [updateDate=" + updateDate + ", cateItemId=" + cateItemId + ", title=" + title + ", body="
				+ body + ", hit=" + hit + ", dto=" + super.toString() + "]";
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getCateItemId() {
		return cateItemId;
	}

	public void setCateItemId(int cateItemId) {
		this.cateItemId = cateItemId;
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