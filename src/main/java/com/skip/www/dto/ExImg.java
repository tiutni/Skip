package com.skip.www.dto;

public class ExImg {
	
	private int exImgNo;
	private String exImgOriginName;
	private String exImgStoredName;
	private String exImgPath;
	private int exImgSize;
	private int exNo;

	@Override
	public String toString() {
		return "ExImg [exImgNo=" + exImgNo + ", exImgOriginName=" + exImgOriginName + ", exImgStoredName="
				+ exImgStoredName + ", exImgPath=" + exImgPath + ", exImgSize=" + exImgSize + ", exNo=" + exNo + "]";
	}

	public int getExImgNo() {
		return exImgNo;
	}

	public void setExImgNo(int exImgNo) {
		this.exImgNo = exImgNo;
	}

	public String getExImgOriginName() {
		return exImgOriginName;
	}

	public void setExImgOriginName(String exImgOriginName) {
		this.exImgOriginName = exImgOriginName;
	}

	public String getExImgStoredName() {
		return exImgStoredName;
	}

	public void setExImgStoredName(String exImgStoredName) {
		this.exImgStoredName = exImgStoredName;
	}

	public String getExImgPath() {
		return exImgPath;
	}

	public void setExImgPath(String exImgPath) {
		this.exImgPath = exImgPath;
	}

	public int getExImgSize() {
		return exImgSize;
	}

	public void setExImgSize(int exImgSize) {
		this.exImgSize = exImgSize;
	}

	public int getExNo() {
		return exNo;
	}

	public void setExNo(int exNo) {
		this.exNo = exNo;
	}
	

}
