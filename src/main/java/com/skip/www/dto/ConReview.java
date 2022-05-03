package com.skip.www.dto;

import java.util.Date;

public class ConReview {

	private int conReviewNo;
	private int conNo;
	private int userNo;
	private Date conReviewDate;
	private String conReviewContent;
	private int conReviewStar;
	private String userNick;

	@Override
	public String toString() {
		return "ConReview [conReviewNo=" + conReviewNo + ", conNo=" + conNo + ", userNo=" + userNo + ", conReviewDate="
				+ conReviewDate + ", conReviewContent=" + conReviewContent + ", conReviewStar=" + conReviewStar
				+ ", userNick=" + userNick + "]";
	}

	public int getConReviewNo() {
		return conReviewNo;
	}

	public void setConReviewNo(int conReviewNo) {
		this.conReviewNo = conReviewNo;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getConReviewDate() {
		return conReviewDate;
	}

	public void setConReviewDate(Date conReviewDate) {
		this.conReviewDate = conReviewDate;
	}

	public String getConReviewContent() {
		return conReviewContent;
	}

	public void setConReviewContent(String conReviewContent) {
		this.conReviewContent = conReviewContent;
	}

	public double getConReviewStar() {
		return conReviewStar;
	}

	public void setConReviewStar(int conReviewStar) {
		this.conReviewStar = conReviewStar;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	
	
}
