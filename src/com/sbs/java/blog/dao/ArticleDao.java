package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.ArticleReply;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class ArticleDao extends Dao {
	private Connection dbConn;

	public ArticleDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId, String searchKeywordType,	String searchKeyword)
	{
		SecSql secSql = new SecSql();
		
		int limitFrom = (page - 1) * itemsInAPage;
		

		secSql.append("SELECT A.* ,");
		secSql.append(" M.image AS extra__writer,");
		secSql.append("M.nickname AS extra__text");
		secSql.append("FROM article AS A");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON A. memberId = M.id ");
		secSql.append("WHERE A.displayStatus = 1 ");
		if (cateItemId != 0) {
			secSql.append("AND cateItemId = ?", cateItemId);
		}
		if (searchKeywordType.equals("title") && searchKeyword.length() > 0) {
			secSql.append("AND title LIKE CONCAT('%%', ? , '%%')", searchKeyword);
		}
		
		secSql.append("ORDER BY A.id DESC ");
		secSql.append("LIMIT ?, ? ", limitFrom, itemsInAPage);
		

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Article> articles = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}

		return articles;
	}

	public int getForPrintListArticlesCount(int cateItemId, String searchKeywordType, String searchKeyword) {
		SecSql secSql = new SecSql();
		
		secSql.append("SELECT COUNT(*) AS cnt ");
		secSql.append("FROM article ");
		secSql.append("WHERE displayStatus = 1 ");
		
		if ( cateItemId != 0 ) {
			secSql.append("AND cateItemId = ? ", cateItemId);
		}
		if ( searchKeywordType.equals("titke") && searchKeyword.length() > 0) {
			secSql.append("AND title LIKE CONCAT('%%', ? , '%%')", searchKeyword);
		}
		
		int count = DBUtil.selectRowIntValue(dbConn, secSql);
		return count;
	}

	public Article getForPrintArticle(int id) {
		SecSql secSql = new SecSql();
		
		secSql.append("SELECT A.* ,");
		secSql.append(" M.nickname AS extra__writer,");
		secSql.append(" M.image AS extra__image");
		secSql.append("FROM article AS A");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON A. memberId = M.id ");
		secSql.append("WHERE A.displayStatus = 1 ");
		secSql.append("AND A.id = ?",id);

		return new Article(DBUtil.selectRow(dbConn, secSql));
	}
	// 밑에가 죽으니 이 전체도 죽음 이 메서드를 준얘한테 따지로감.

	public List<CateItem> getForPrintCateItems() {
		
		SecSql secSql = new SecSql();

		secSql.append("SELECT * ");
		secSql.append("FROM cateItem ");
		secSql.append("WHERE 1 ");
		secSql.append("ORDER BY id ASC ");
		
		// 얘도 죽음
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<CateItem> cateItems = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			cateItems.add(new CateItem(row));
		}

		return cateItems;
	}

	public CateItem getCateItem(int cateItemId) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * ");
		secSql.append("FROM cateItem ");
		secSql.append("WHERE 1 ");
		secSql.append("AND id = ? ", cateItemId);
		
		return new CateItem(DBUtil.selectRow(dbConn, secSql));
	}

	public int doActionDoWrite(String title, String body, int cateItemId, int memberId) {
		
		SecSql secSql = new SecSql();
		secSql.append("INSERT INTO article");
		secSql.append("SET regDate = NOW()");
		secSql.append(", hit = 0 ");
		secSql.append(", updateDate = NOW()");
		secSql.append(", cateItemId = ?",cateItemId);
		secSql.append(", displayStatus = '1' ");
		secSql.append(", title = ? ",title);
		secSql.append(", memberId = ? ",memberId);
		secSql.append(", body = ? ",body);
		return DBUtil.insert(dbConn, secSql);
	}

	public int increaseHit(int id) {
			SecSql sql = SecSql.from("UPDATE article");
			sql.append("SET hit = hit + 1");
			sql.append("WHERE id = ?", id);

			return DBUtil.update(dbConn, sql);
	}

	public int doActionDoModify(String title, String body, int id) {
		//[에러 : No value specified for parameter 1] 파라미터1에 값이 명시되지않음.
		SecSql secSql = new SecSql();
		
		secSql.append("UPDATE article ");
		secSql.append("SET title = ? ",title);
		secSql.append(", body = ? ",body);
		secSql.append("WHERE id = ? ",id);
		
		return DBUtil.update(dbConn, secSql);
	}

	public int doActionDoDelete(int id) {

		SecSql secSql = new SecSql();
		
		secSql.append("DELETE FROM article ");
		secSql.append("WHERE id = ? ",id);
		return DBUtil.update(dbConn, secSql);
	}

	public List<Article> getFortPrintIdAsc(int cateItemId,int page, int itemsInAPage) {
		SecSql secSql = new SecSql();
		int limitFrom = (page - 1) * itemsInAPage;
		secSql.append("SELECT * ");
		secSql.append("FROM article ");
		secSql.append("WHERE displayStatus = 1 ");
		if (cateItemId != 0) {
			secSql.append("AND cateItemId = ?", cateItemId);
		}
		secSql.append("ORDER BY id ASC");
		secSql.append("LIMIT ?, ? ", limitFrom, itemsInAPage);
			
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Article> articles2 = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articles2.add(new Article(row));
		}

		return articles2;
	}

	public int doActionReply(int id,int memberId, String body) {
		SecSql secSql = new SecSql();
		
		secSql.append("INSERT INTO articleReply ");
		secSql.append("SET regDate = NOW() ");
		secSql.append(", updateDate = NOW() ");
		secSql.append(", articleId = ? ",id);
		secSql.append(", memberId = ?",memberId);
		secSql.append(", body = ? ",body);
	
		
		return DBUtil.insert(dbConn, secSql);
	}



	public List<ArticleReply> getForPrintArticleReplys(int id) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT A.*, ");
		secSql.append("M.nickname AS extra__writer,");
		secSql.append("M.image AS extra__image");
		secSql.append("FROM articleReply AS A");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON A. memberId= M.id");
		secSql.append("WHERE articleId = ?",id);
		secSql.append("ORDER BY A.id DESC ");

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<ArticleReply> articleReplys = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articleReplys.add(new ArticleReply(row));
		}
		return articleReplys;
	}

	public int doActionDoReplydelete(int id) {
		SecSql secSql = new SecSql();
		secSql.append("DELETE FROM articleReply ");
		secSql.append("WHERE id = ? " ,id);
		
		return DBUtil.update(dbConn, secSql);
	}

	public int doActionReplyModify(int id,String body) {
		SecSql secSql = new SecSql();
		
		secSql.append("UPDATE articleReply ");
		secSql.append("SET body = ? ",body);
		secSql.append("WHERE id = ? ",id);
		
		return DBUtil.update(dbConn, secSql);
	}

	public int getTotalCount(int id) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT COUNT(*) AS cnt ");
		secSql.append("FROM articleReply ");
		secSql.append("WHERE articleId = ? ",id);
		return DBUtil.selectRowIntValue(dbConn, secSql);
	}

	public List<ArticleReply> getForPrintAllReply() {
		SecSql secSql = new SecSql();
		secSql.append("SELECT A.*, ");
		secSql.append("M.nickname AS extra__writer");
		secSql.append("FROM articleReply AS A");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON A. memberId= M.id");
		secSql.append("WHERE 1");
		secSql.append("ORDER BY A.id DESC ");
		
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<ArticleReply> articleReplys = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articleReplys.add(new ArticleReply(row));
		}
		return articleReplys;
	}

	public List<Article> getForPrintAllArticle() {
		SecSql secSql = new SecSql();
		secSql.append("SELECT A.* ,");
		secSql.append(" M.nickname AS extra__writer");
		secSql.append("FROM article AS A");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON A. memberId = M.id ");
		secSql.append("WHERE A.displayStatus = 1 ");
		secSql.append("ORDER BY A.id DESC ");
		
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Article> articles = new ArrayList<>();
		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}
		return articles;
	}

	public int getAllarticle() {
		SecSql secSql = new SecSql();
		secSql.append("SELECT COUNT(*) ");
		secSql.append("AS cnt FROM article");
		secSql.append("WHERE cateItemId = 1");
		secSql.append("AND displaystatus = 1");
		return DBUtil.selectRowIntValue(dbConn, secSql);
	}

	public Article getArticleFirstId() {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * FROM article");
		secSql.append("ORDER BY id ASC LIMIT 1");
		return new Article(DBUtil.selectRow(dbConn, secSql));
	}

	public Article getArticleLastId() {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * FROM article");
		secSql.append("ORDER BY id DESC LIMIT 1");
		return new Article(DBUtil.selectRow(dbConn, secSql));
	}

	public int getForPrintCatePrivateCnt(int cateItemId) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT COUNT (*)");
		secSql.append("AS cnt FROM article");
		secSql.append("WHERE cateItemId = ? ",cateItemId);
		return DBUtil.selectRowIntValue(dbConn, secSql);
		}

	public List<Article> getForPrintUserArticle(int id) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * FROM article");
		secSql.append("WHERE memberId = ?",id);
		
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Article> articles = new ArrayList<>();
		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}
		return articles;
	}

	public List<ArticleReply> getForPrintUserArticleReplys(int id) {
		SecSql secSql = new SecSql();
		secSql.append("SELECT * FROM articleReply");
		secSql.append("WHERE memberId = ?",id);
		
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<ArticleReply> articleReplys = new ArrayList<>();
		for (Map<String, Object> row:rows) {
			articleReplys.add(new ArticleReply(row));
		}
		return articleReplys;
	}

	public List<Article> getForPrintViewAsc(int cateItemId, int page, int itemsInAPage) {
		SecSql secSql = new SecSql();
		int limitFrom = (page - 1) * itemsInAPage;
		secSql.append("SELECT * ");
		secSql.append("FROM article ");
		secSql.append("WHERE displayStatus = 1 ");
		if (cateItemId != 0) {
			secSql.append("AND cateItemId = ?", cateItemId);
		}
		secSql.append("ORDER BY hit ASC");
		secSql.append("LIMIT ?, ? ", limitFrom, itemsInAPage);
			
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Article> articles = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}

		return articles;
	}
}