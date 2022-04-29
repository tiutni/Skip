package com.skip.www.dto;

public class Wish {
	
	private int wishNo;
	private int userNo;
	private int showType;
	private int conNo;
	private int exNo;

	@Override
	public String toString() {
		return "Wish [wishNo=" + wishNo + ", userNo=" + userNo + ", showType=" + showType + ", conNo=" + conNo
				+ ", exNo=" + exNo + "]";
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
	

}
