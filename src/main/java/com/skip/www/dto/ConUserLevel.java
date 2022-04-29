package com.skip.www.dto;

public class ConUserLevel {

	private int ConUserLevelNo;
	private String UserLevel;
	
	
	@Override
	public String toString() {
		return "ConUserLevel [ConUserLevelNo=" + ConUserLevelNo + ", UserLevel=" + UserLevel + "]";
	}
	public int getConUserLevelNo() {
		return ConUserLevelNo;
	}
	public void setConUserLevelNo(int conUserLevelNo) {
		ConUserLevelNo = conUserLevelNo;
	}
	public String getUserLevel() {
		return UserLevel;
	}
	public void setUserLevel(String userLevel) {
		UserLevel = userLevel;
	}
}
