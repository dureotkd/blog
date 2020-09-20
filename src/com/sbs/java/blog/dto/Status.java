package com.sbs.java.blog.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.sbs.java.blog.dto.Status.TIME_MAXIMUM;

public class Status extends Dto {
	private int memberId;
	private int importance;
	private String body;
	private String updateDate;
	private String regDate;
	
	public Status(Map<String, Object> row) {
		super(row);
		this.regDate = (String) row.get("regDate");
		this.updateDate = (String) row.get("updateDate");
		this.body = (String) row.get("body");
		this.memberId = (int) row.get("memberId");
		this.importance = (int) row.get("importance");
	}
	
	public static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}

	public String getRegDateFormat() {

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = null;
		try {
			to = transFormat.parse(this.regDate);
		} catch (ParseException e) {
		}

		long curTime = System.currentTimeMillis();
		long regTime = to.getTime();
		long diffTime = (curTime - regTime) / 1000;

		String msg = null;

		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = diffTime + "초전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분전";
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = diffTime + "시간전";
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.DAY) {
			// day
			msg = diffTime + "일전";
		} else if (diffTime == 0) {
			msg = "1일전";
		}
		else if ((diffTime /= TIME_MAXIMUM.MONTH) < TIME_MAXIMUM.MONTH) {
			// month
			msg = diffTime + "달전";
		} else {
			msg = (diffTime /= TIME_MAXIMUM.MONTH) + "년 전";
		}
		
		return msg;

	}
	
	@Override
	public String toString() {
		return "Status [memberId=" + memberId + ", importance=" + importance + ", body=" + body + ", updateDate="
				+ updateDate + ", regDate=" + regDate + "]";
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getImportance() {
		return importance;
	}

	public void setImportance(int importance) {
		this.importance = importance;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}