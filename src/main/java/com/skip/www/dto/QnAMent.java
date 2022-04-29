package com.skip.www.dto;

import java.util.Date;

public class QnAMent {

	private int qnaMentNo;
	private String adminId;
	private int qnaNo;
	private Date qnaMentDate;
	private String qnaMentContent;
	
	@Override
	public String toString() {
		return "QnAMent [qnaMentNo=" + qnaMentNo + ", adminId=" + adminId + ", qnaNo=" + qnaNo + ", qnaMentDate="
				+ qnaMentDate + ", qnaMentContent=" + qnaMentContent + "]";
	}
	
	public int getQnaMentNo() {
		return qnaMentNo;
	}
	public void setQnaMentNo(int qnaMentNo) {
		this.qnaMentNo = qnaMentNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public Date getQnaMentDate() {
		return qnaMentDate;
	}
	public void setQnaMentDate(Date qnaMentDate) {
		this.qnaMentDate = qnaMentDate;
	}
	public String getQnaMentContent() {
		return qnaMentContent;
	}
	public void setQnaMentContent(String qnaMentContent) {
		this.qnaMentContent = qnaMentContent;
	}
	
}
