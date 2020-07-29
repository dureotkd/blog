package com.sbs.java.blog.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Dto {
	private int id;
	private String regDate;
	private String updateDate;
	private Map<String, Object> extra;

	public String getRegDateFormat1() {

		String startTime = this.getRegDate();
		// This could be MM/dd/yyyy, you original value is ambiguous
		SimpleDateFormat input = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateValue = input.parse(startTime);
			SimpleDateFormat transFormat = new SimpleDateFormat("MM.dd,EEE");
			String to = transFormat.format(dateValue);
			return to;
		} catch (ParseException e) {
			return this.getRegDate();
		}
	}

	public Dto(Map<String, Object> row) {
		this.id = (int) row.get("id");
		this.regDate = (String) row.get("regDate");
		this.extra = new HashMap<>();
		this.updateDate = (String) row.get("updateDate");
		for (String key : row.keySet()) {
			if (key.startsWith("extra__")) {
				Object value = row.get(key);
				String extraKey = key.substring(7);
				this.extra.put(extraKey, value);
			}
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public Map<String, Object> getExtra() {
		return extra;
	}

	public void setExtra(Map<String, Object> extra) {
		this.extra = extra;
	}
	
	

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "Dto [id=" + id + ", regDate=" + regDate + ", extra=" + extra + "]";
	}

}