package com.skip.www.dto;

public class ConUserLevel {

	private int conUserLevelNo;
	private String userLevel;
	
	@Override
	public String toString() {
		return "ConUserLevel [conUserLevelNo=" + conUserLevelNo + ", userLevel=" + userLevel + "]";
	}
	
	public int getConUserLevelNo() {
		return conUserLevelNo;
	}
	public void setConUserLevelNo(int conUserLevelNo) {
		this.conUserLevelNo = conUserLevelNo;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

}
