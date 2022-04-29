package com.skip.www.dto;

public class ConImg {
	
	private int conImgNo;
	private String conImgOriginName;
	private String conImgStoredName;
	private String conImgPath;
	private int conImgSize;
	private int conNo;

	@Override
	public String toString() {
		return "ConImg [conImgNo=" + conImgNo + ", conImgOriginName=" + conImgOriginName + ", conImgStoredName="
				+ conImgStoredName + ", conImgPath=" + conImgPath + ", conImgSize=" + conImgSize + ", conNo=" + conNo
				+ "]";
	}

	public int getConImgNo() {
		return conImgNo;
	}

	public void setConImgNo(int conImgNo) {
		this.conImgNo = conImgNo;
	}

	public String getConImgOriginName() {
		return conImgOriginName;
	}

	public void setConImgOriginName(String conImgOriginName) {
		this.conImgOriginName = conImgOriginName;
	}

	public String getConImgStoredName() {
		return conImgStoredName;
	}

	public void setConImgStoredName(String conImgStoredName) {
		this.conImgStoredName = conImgStoredName;
	}

	public String getConImgPath() {
		return conImgPath;
	}

	public void setConImgPath(String conImgPath) {
		this.conImgPath = conImgPath;
	}

	public int getConImgSize() {
		return conImgSize;
	}

	public void setConImgSize(int conImgSize) {
		this.conImgSize = conImgSize;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}
	
	

}
