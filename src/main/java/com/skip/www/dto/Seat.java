package com.skip.www.dto;

public class Seat {

	private int seatSeq;
	private String seatLevel;
	private int seatPrice;
	private String seatNo;
	private int conRoundNo;
	
	@Override
	public String toString() {
		return "Seat [conRoundNo=" + conRoundNo + ", seatLevel=" + seatLevel + ", seatNo=" + seatNo + ", seatPrice="
				+ seatPrice + ", seatSeq=" + seatSeq + "]";
	}

	public int getSeatSeq() {
		return seatSeq;
	}

	public void setSeatSeq(int seatSeq) {
		this.seatSeq = seatSeq;
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

	public String getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}

	public int getConRoundNo() {
		return conRoundNo;
	}

	public void setConRoundNo(int conRoundNo) {
		this.conRoundNo = conRoundNo;
	}
	
	
}
