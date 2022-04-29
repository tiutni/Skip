package com.skip.www.dto;

public class ExUserLevel {

	private int ExUserLevelNo;
	private String UserLevel;
	
	@Override
	public String toString() {
		return "ExUserLevel [ExUserLevelNo=" + ExUserLevelNo + ", UserLevel=" + UserLevel + "]";
	}
	public int getExUserLevelNo() {
		return ExUserLevelNo;
	}
	public void setExUserLevelNo(int exUserLevelNo) {
		ExUserLevelNo = exUserLevelNo;
	}
	public String getUserLevel() {
		return UserLevel;
	}
	public void setUserLevel(String userLevel) {
		UserLevel = userLevel;
	}
}
