package com.skip.www.dto;

import java.util.Date;

public class QnA {

	private int qnaNo;
	private int userNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String qnaMentContent;
	
	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", userNo=" + userNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent
				+ ", qnaDate=" + qnaDate + "]";
	}
	public String getQnaMentContent() {
		return qnaMentContent;
	}
	public void setQnaMentContent(String qnaMentContent) {
		this.qnaMentContent = qnaMentContent;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	
}