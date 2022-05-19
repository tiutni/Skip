package com.skip.www.dto;

import java.util.Date;

public class ExOrderTicket {

	private int exOrderTicketNo;
	private int orderNo;
	private int exNo;
	private int exOrderCount;
	private String exTitle;
	private Date orderDate;
	private String orderStatus;
	private String exImgStoredname;
	private Date exOrderDate;
	
	@Override
	public String toString() {
		return "ExOrderTicket [exOrderTicketNo=" + exOrderTicketNo + ", orderNo=" + orderNo + ", exNo=" + exNo
				+ ", exOrderCount=" + exOrderCount + ", exTitle=" + exTitle + ", orderDate=" + orderDate
				+ ", orderStatus=" + orderStatus + ", exImgStoredname=" + exImgStoredname + ", exOrderDate="
				+ exOrderDate + "]";
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
	public String getExTitle() {
		return exTitle;
	}
	public void setExTitle(String exTitle) {
		this.exTitle = exTitle;
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
	public String getExImgStoredname() {
		return exImgStoredname;
	}
	public void setExImgStoredname(String exImgStoredname) {
		this.exImgStoredname = exImgStoredname;
	}
	public Date getExOrderDate() {
		return exOrderDate;
	}
	public void setExOrderDate(Date exOrderDate) {
		this.exOrderDate = exOrderDate;
	}

	
	
	
	
	
}
