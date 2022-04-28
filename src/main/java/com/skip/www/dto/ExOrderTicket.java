package com.skip.www.dto;

public class ExOrderTicket {

	private int exOrderTicketNo;
	private int orderNo;
	private int exNo;
	private int exOrderCount;
	
	@Override
	public String toString() {
		return "ExOrderTicket [exOrderTicketNo=" + exOrderTicketNo + ", orderNo=" + orderNo + ", exNo=" + exNo
				+ ", exOrderCount=" + exOrderCount + "]";
	}
	public int getExOrderTicketNo() {
		return exOrderTicketNo;
	}
	public void setExOrderTicketNo(int exOrderTicketNo) {
		this.exOrderTicketNo = exOrderTicketNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getExNo() {
		return exNo;
	}
	public void setExNo(int exNo) {
		this.exNo = exNo;
	}
	public int getExOrderCount() {
		return exOrderCount;
	}
	public void setExOrderCount(int exOrderCount) {
		this.exOrderCount = exOrderCount;
	}
	
	
	
}
