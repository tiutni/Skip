package com.skip.www.dto;

public class SeatLevel {

	private int seatLevelNo;
	private String seatLevel;
	private int seatPrice;
	
	@Override
	public String toString() {
		return "SeatLevel [seatLevelNo=" + seatLevelNo + ", seatLevel=" + seatLevel + ", seatPrice=" + seatPrice + "]";
	}

	public int getSeatLevelNo() {
		return seatLevelNo;
	}

	public void setSeatLevelNo(int seatLevelNo) {
		this.seatLevelNo = seatLevelNo;
	}

	public String getSeatLevel() {
		return seatLevel;
	}

	public void setSeatLevel(String seatLevel) {
		this.seatLevel = seatLevel;
	}

	public int getSeatPrice() {
		return seatPrice;
	}

	public void setSeatPrice(int seatPrice) {
		this.seatPrice = seatPrice;
	}
	
	
}
