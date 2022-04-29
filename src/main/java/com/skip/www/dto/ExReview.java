package com.skip.www.dto;

import java.util.Date;

public class ExReview {
	
	private int exReviewNo;
	private int exNo;
	private int userNo;
	private Date exReviewDate;
	private String exReviewContent;
	private int exReviewStar;

	@Override
	public String toString() {
		return "ExReview [exReviewNo=" + exReviewNo + ", exNo=" + exNo + ", userNo=" + userNo + ", exReviewDate="
				+ exReviewDate + ", exReviewContent=" + exReviewContent + ", exReviewStar=" + exReviewStar + "]";
	}
	
	public int getExReviewNo() {
		return exReviewNo;
	}
	
	public void setExReviewNo(int exReviewNo) {
		this.exReviewNo = exReviewNo;
	}
	
	public int getExNo() {
		return exNo;
	}
	
	public void setExNo(int exNo) {
		this.exNo = exNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public Date getExReviewDate() {
		return exReviewDate;
	}
	
	public void setExReviewDate(Date exReviewDate) {
		this.exReviewDate = exReviewDate;
	}
	
	public String getExReviewContent() {
		return exReviewContent;
	}
	
	public void setExReviewContent(String exReviewContent) {
		this.exReviewContent = exReviewContent;
	}
	
	public double getExReviewStar() {
		return exReviewStar;
	}
	
	public void setExReviewStar(int exReviewStar) {
		this.exReviewStar = exReviewStar;
	}
	

}
