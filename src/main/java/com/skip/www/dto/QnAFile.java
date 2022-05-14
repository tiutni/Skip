package com.skip.www.dto;

public class QnAFile {

	private int qnaFileNo;
	private String qnaFileOriginName;
	private String qnaFileStoredName;
	private String qnaFilePath;
	private int qnaFileSize;
	private int qnaNo;
	public QnAFile() {
	}
	
	public QnAFile(String qnaFilePath) {
		super();
		this.qnaFilePath = qnaFilePath;
	}

	@Override
	public String toString() {
		return "QnAFile [qnaFileNo=" + qnaFileNo + ", qnaFileOriginName=" + qnaFileOriginName + ", qnaFileStoredName="
				+ qnaFileStoredName + ", qnaFilePath=" + qnaFilePath + ", qnaFileSize=" + qnaFileSize + ", qnaNo=" + qnaNo
				+ "]";
	}
	
	public int getQnaFileNo() {
		return qnaFileNo;
	}
	public void setQnaFileNo(int qnaFileNo) {
		this.qnaFileNo = qnaFileNo;
	}
	public String getQnaFileOriginName() {
		return qnaFileOriginName;
	}
	public void setQnaFileOriginName(String qnaFileOriginName) {
		this.qnaFileOriginName = qnaFileOriginName;
	}
	public String getQnaFileStoredName() {
		return qnaFileStoredName;
	}
	public void setQnaFileStoredName(String qnaFileStoredName) {
		this.qnaFileStoredName = qnaFileStoredName;
	}
	public String getQnaFilePath() {
		return qnaFilePath;
	}
	public void setQnaFilePath(String qnaFilePath) {
		this.qnaFilePath = qnaFilePath;
	}
	public int getQnaFileSize() {
		return qnaFileSize;
	}
	public void setQnaFileSize(int qnaFileSize) {
		this.qnaFileSize = qnaFileSize;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	
}
