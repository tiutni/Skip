package com.skip.www.dto;

public class UserImg {
	
	private int userImgNo;
	private String userImgOriginName;
	private String userImgStoredName;
	private String userImgPath;
	private int userImgSize;
	private int userNo;

	@Override
	public String toString() {
		return "UserImg [userImgNo=" + userImgNo + ", userImgOriginName=" + userImgOriginName + ", userImgStoredName="
				+ userImgStoredName + ", userImgPath=" + userImgPath + ", userImgSize=" + userImgSize + ", userNo="
				+ userNo + "]";
	}

	public int getUserImgNo() {
		return userImgNo;
	}

	public void setUserImgNo(int userImgNo) {
		this.userImgNo = userImgNo;
	}

	public String getUserImgOriginName() {
		return userImgOriginName;
	}

	public void setUserImgOriginName(String userImgOriginName) {
		this.userImgOriginName = userImgOriginName;
	}

	public String getUserImgStoredName() {
		return userImgStoredName;
	}

	public void setUserImgStoredName(String userImgStoredName) {
		this.userImgStoredName = userImgStoredName;
	}

	public String getUserImgPath() {
		return userImgPath;
	}

	public void setUserImgPath(String userImgPath) {
		this.userImgPath = userImgPath;
	}

	public double getUserImgSize() {
		return userImgSize;
	}

	public void setUserImgSize(int userImgSize) {
		this.userImgSize = userImgSize;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	

}
