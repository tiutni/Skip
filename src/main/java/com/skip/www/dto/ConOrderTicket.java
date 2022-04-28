package com.skip.www.dto;

public class ConOrderTicket {

	private int conOrderTicketNo;
	private int orderNo;
	private int seatSeq;
	
	@Override
	public String toString() {
		return "ConOrderTicket [conOrderTicketNo=" + conOrderTicketNo + ", orderNo=" + orderNo + ", seatSeq=" + seatSeq
				+ "]";
	}
	public int getConOrderTicketNo() {
		return conOrderTicketNo;
	}
	public void setConOrderTicketNo(int conOrderTicketNo) {
		this.conOrderTicketNo = conOrderTicketNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getSeatSeq() {
		return seatSeq;
	}
	public void setSeatSeq(int seatSeq) {
		this.seatSeq = seatSeq;
	}
	
}
