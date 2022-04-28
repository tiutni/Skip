package com.skip.www.dto;

import java.util.Date;

public class Pay {

	private int payNo;
	private int orderNo;
	private int payMethodNo;
	private Date payDate;
	private int payMoney;
	private int couponNo;
	
	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", orderNo=" + orderNo + ", payMethodNo=" + payMethodNo + ", payDate=" + payDate
				+ ", payMoney=" + payMoney + ", couponNo=" + couponNo + "]";
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getPayMethodNo() {
		return payMethodNo;
	}
	public void setPayMethodNo(int payMethodNo) {
		this.payMethodNo = payMethodNo;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public int getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	
}
