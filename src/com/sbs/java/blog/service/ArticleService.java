package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dao.ArticleDao;
import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.ArticleReply;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;

public class ArticleService extends Service {

	private ArticleDao articleDao;

	public ArticleService(Connection dbConn) {
		articleDao = new ArticleDao(dbConn);
		System.out.println(articleDao);
	}

	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId, String searchKeywordType, String searchKeyword) {
		return articleDao.getForPrintListArticles(page, itemsInAPage, cateItemId, searchKeywordType, searchKeyword);
	}

	public int getForPrintListArticlesCount(int cateItemId, String searchKeywordType, String searchKeyword) {
		return articleDao.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
	}
	
	public void increaseHit(int id) {
		articleDao.increaseHit(id);
	}

	public Article getForPrintArticle(int id) {
		return articleDao.getForPrintArticle(id);
	}

	// 얘도 죽고 z
	public List<CateItem> getForPrintCateItems() {
		return articleDao.getForPrintCateItems();
	}

	public CateItem getCateItem(int cateItemId) {
		return articleDao.getCateItem(cateItemId);
	}

	public int doActionDoWrite(String title, String body, int cateItemId, int memberId) {
		return articleDao.doActionDoWrite(title,body,cateItemId,memberId);
	}

	public int doActionDoModify(String title, String body, int id) {
		return articleDao.doActionDoModify(title,body,id);
	}

	public int doActionDoDelete(int id) {
		return articleDao.doActionDoDelete(id);
	}

	public List<Article> getFortPrintViewsDESC(int cateItemId,int page,int itemsInAPage) {
		return articleDao.getFortPrintViewsDESC(cateItemId,page,itemsInAPage);
	}

	public int doActionReply(int id,int memberId, String body) {
		return articleDao.doActionReply(id,memberId,body);
	}

	public List<ArticleReply> getForPrintArticleReplys(int id) {
		return articleDao.getForPrintArticleReplys(id);
	}

	public int doActionDoReplydelete(int id) {
		return articleDao.doActionDoReplydelete(id);
	}

	public int doActionReplyModify(int id,String body) {
		return articleDao.doActionReplyModify(id,body);
	}

	public int getTotalCount(int id) {
		return articleDao.getTotalCount(id);
	}

	public List<ArticleReply> getForPrintAllReply() {
		return articleDao.getForPrintAllReply();
	}

	public List<Article> getForPrintAllArticle() {
		return articleDao.getForPrintAllArticle();
	}

	public int getAllarticle() {
		return articleDao.getAllarticle();
	}

	public Article getArticleLastId() {
		return articleDao.getArticleLastId();
	}

	public Article getArticleFirstId() {
		return articleDao.getArticleFirstId();
	}

	public int getForPrintCatePrivateCnt(int cateItemId) {
		return articleDao.getForPrintCatePrivateCnt(cateItemId);
	}

	public List<Article> getForPrintUserArticle(int id) {
		return articleDao.getForPrintUserArticle(id);
	}

	public List<ArticleReply> getForPrintUserArticleReplys(int id) {
		return articleDao.getForPrintUserArticleReplys(id);
	}


}