package com.skip.www.dto;

import java.util.Date;

public class Bill {

	private int orderNo;
	private int user_no;
	private Date orderDate;
	private String orderStatus;
	private String receiptType;
	@Override
	public String toString() {
		return "Bill [orderNo=" + orderNo + ", user_no=" + user_no + ", orderDate=" + orderDate + ", orderStatus="
				+ orderStatus + ", receiptType=" + receiptType + "]";
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
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
	public String getReceiptType() {
		return receiptType;
	}
	public void setReceiptType(String receiptType) {
		this.receiptType = receiptType;
	}
	
	
}
