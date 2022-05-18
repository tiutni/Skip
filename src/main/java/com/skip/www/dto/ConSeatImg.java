package com.skip.www.dto;

public class ConSeatImg {
	
	private int conSeatImgNo;
	private String conSeatImgOriginName;
	private String conSeatImgStoredName;
	private String conSeatImgPath;
	private int conSeatImgSize;
	private int conNo;
	
	@Override
	public String toString() {
		return "ConSeatImg [conSeatImgNo=" + conSeatImgNo + ", conSeatImgOriginName=" + conSeatImgOriginName
				+ ", conSeatImgStoredName=" + conSeatImgStoredName + ", conSeatImgPath=" + conSeatImgPath
				+ ", conSeatImgSize=" + conSeatImgSize + ", conNo=" + conNo + "]";
	}

	public int getConSeatImgNo() {
		return conSeatImgNo;
	}

	public void setConSeatImgNo(int conSeatImgNo) {
		this.conSeatImgNo = conSeatImgNo;
	}

	public String getConSeatImgOriginName() {
		return conSeatImgOriginName;
	}

	public void setConSeatImgOriginName(String conSeatImgOriginName) {
		this.conSeatImgOriginName = conSeatImgOriginName;
	}

	public String getConSeatImgStoredName() {
		return conSeatImgStoredName;
	}

	public void setConSeatImgStoredName(String conSeatImgStoredName) {
		this.conSeatImgStoredName = conSeatImgStoredName;
	}

	public String getConSeatImgPath() {
		return conSeatImgPath;
	}

	public void setConSeatImgPath(String conSeatImgPath) {
		this.conSeatImgPath = conSeatImgPath;
	}

	public int getConSeatImgSize() {
		return conSeatImgSize;
	}

	public void setConSeatImgSize(int conSeatImgSize) {
		this.conSeatImgSize = conSeatImgSize;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}
	
}
