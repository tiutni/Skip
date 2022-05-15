package com.skip.www.dto;

public class QnAFile {

	private int qnaFileNo;
	private String qnaFileOriginName;
	private String qnaFileStoredName;
	private int qnaNo;
	
	@Override
	public String toString() {
		return "QnAFile [qnaFileNo=" + qnaFileNo + ", qnaFileOriginName=" + qnaFileOriginName + ", qnaFileStoredName="
				+ qnaFileStoredName + ", qnaNo=" + qnaNo + "]";
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

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	
}	