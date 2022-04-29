package com.skip.www.dto;

public class QnAImg {

	private int qnaImgNo;
	private String qnaImgOriginName;
	private String qnaImgStoredName;
	private String qnaImgPath;
	private int qnaImgSize;
	private int qnaNo;
	
	@Override
	public String toString() {
		return "QnAImg [qnaImgNo=" + qnaImgNo + ", qnaImgOriginName=" + qnaImgOriginName + ", qnaImgStoredName="
				+ qnaImgStoredName + ", qnaImgPath=" + qnaImgPath + ", qnaImgSize=" + qnaImgSize + ", qnaNo=" + qnaNo
				+ "]";
	}
	
	public int getQnaImgNo() {
		return qnaImgNo;
	}
	public void setQnaImgNo(int qnaImgNo) {
		this.qnaImgNo = qnaImgNo;
	}
	public String getQnaImgOriginName() {
		return qnaImgOriginName;
	}
	public void setQnaImgOriginName(String qnaImgOriginName) {
		this.qnaImgOriginName = qnaImgOriginName;
	}
	public String getQnaImgStoredName() {
		return qnaImgStoredName;
	}
	public void setQnaImgStoredName(String qnaImgStoredName) {
		this.qnaImgStoredName = qnaImgStoredName;
	}
	public String getQnaImgPath() {
		return qnaImgPath;
	}
	public void setQnaImgPath(String qnaImgPath) {
		this.qnaImgPath = qnaImgPath;
	}
	public int getQnaImgSize() {
		return qnaImgSize;
	}
	public void setQnaImgSize(int qnaImgSize) {
		this.qnaImgSize = qnaImgSize;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	
}
