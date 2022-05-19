package com.skip.www.dto;

public class Wish {
	
	private int wishNo;
	private int userNo;
	private int showType;
	private int conNo;
	private int exNo;

	//DTO에만 있는 변수들
	private String conTitle;
	private String conAddress;
	private String conImgStoredName;
	private String exTitle;
	private String exAddress;
	private String exImgStoredName;
	
	@Override
	public String toString() {
		return "Wish [wishNo=" + wishNo + ", userNo=" + userNo + ", showType=" + showType + ", conNo=" + conNo
				+ ", exNo=" + exNo + ", conTitle=" + conTitle + ", conAddress=" + conAddress + ", conImgStoredName="
				+ conImgStoredName + ", exTitle=" + exTitle + ", exAddress=" + exAddress + ", exImgStoredName="
				+ exImgStoredName + "]";
	}
	
	public int getWishNo() {
		return wishNo;
	}
	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getShowType() {
		return showType;
	}
	public void setShowType(int showType) {
		this.showType = showType;
	}
	public int getConNo() {
		return conNo;
	}
	public void setConNo(int conNo) {
		this.conNo = conNo;
	}
	public int getExNo() {
		return exNo;
	}
	public void setExNo(int exNo) {
		this.exNo = exNo;
	}
	public String getConTitle() {
		return conTitle;
	}
	public void setConTitle(String conTitle) {
		this.conTitle = conTitle;
	}
	public String getConAddress() {
		return conAddress;
	}
	public void setConAddress(String conAddress) {
		this.conAddress = conAddress;
	}
	public String getConImgStoredName() {
		return conImgStoredName;
	}
	public void setConImgStoredName(String conImgStoredName) {
		this.conImgStoredName = conImgStoredName;
	}
	public String getExTitle() {
		return exTitle;
	}
	public void setExTitle(String exTitle) {
		this.exTitle = exTitle;
	}
	public String getExAddress() {
		return exAddress;
	}
	public void setExAddress(String exAddress) {
		this.exAddress = exAddress;
	}
	public String getExImgStoredName() {
		return exImgStoredName;
	}
	public void setExImgStoredName(String exImgStoredName) {
		this.exImgStoredName = exImgStoredName;
	}

}
