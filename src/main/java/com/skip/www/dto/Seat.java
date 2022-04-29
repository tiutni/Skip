package com.skip.www.dto;

public class Seat {

	private int seatSeq;
	private int conNo;
	private int seatLevelNo;
	private String seatNo;

	@Override
	public String toString() {
		return "Seat [seatSeq=" + seatSeq + ", conNo=" + conNo + ", seatLevelNo=" + seatLevelNo + ", seatNo=" + seatNo
				+ "]";
	}

	public int getSeatSeq() {
		return seatSeq;
	}

	public void setSeatSeq(int seatSeq) {
		this.seatSeq = seatSeq;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public int getSeatLevelNo() {
		return seatLevelNo;
	}

	public void setSeatLevelNo(int seatLevelNo) {
		this.seatLevelNo = seatLevelNo;
	}

	public String getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	
	
}
