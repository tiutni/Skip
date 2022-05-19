package com.skip.www.dto;

import java.util.Date;

public class ConOrderTicket {

	private int conOrderTicketNo;
	private int orderNo;
	private int seatSeq;
	private String conTitle;
	private Date orderDate;
	private String orderStatus;
	private String conImgStoredName;
	private Date conOrderDate;
	private String seatNo;
	
	@Override
	public String toString() {
		return "ConOrderTicket [conOrderTicketNo=" + conOrderTicketNo + ", orderNo=" + orderNo + ", seatSeq=" + seatSeq
				+ ", conTitle=" + conTitle + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus
				+ ", conImgStoredName=" + conImgStoredName + ", ConOrderDate=" + conOrderDate + ", seatNo=" + seatNo
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
	public String getConTitle() {
		return conTitle;
	}
	public void setConTitle(String conTitle) {
		this.conTitle = conTitle;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getConImgStoredName() {
		return conImgStoredName;
	}
	public void setConImgStoredName(String conImgStoredName) {
		this.conImgStoredName = conImgStoredName;
	}
	public Date getConOrderDate() {
		return conOrderDate;
	}
	public void setConOrderDate(Date conOrderDate) {
		this.conOrderDate = conOrderDate;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	
	
	
	
	
}
