package com.skip.www.dto;

public class ExUserLevel {

	private int exUserLevelNo;
	private String userLevel;
	
	@Override
	public String toString() {
		return "ExUserLevel [exUserLevelNo=" + exUserLevelNo + ", userLevel=" + userLevel + "]";
	}
	
	public int getExUserLevelNo() {
		return exUserLevelNo;
	}
	public void setExUserLevelNo(int exUserLevelNo) {
		this.exUserLevelNo = exUserLevelNo;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	
}
