package com.sbs.java.blog.dto;

import java.util.Map;

public class ArticleReply extends Dto {
	private int articleId;
	private int memberId;
	private String body;
	
	


	public int getArticleId() {
		return articleId;
	}



	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}



	public String getBody() {
		return body;
	}



	public void setBody(String body) {
		this.body = body;
	}
	
	

	public int getMemberId() {
		return memberId;
	}



	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}



	public ArticleReply(Map<String, Object> row) {
		super(row);

		this.articleId = (int) row.get("articleId"); 
		this.body = (String) row.get("body");
		this.memberId = (int) row.get("memberId");
		
	}

} 