package com.skip.www.dto;

public class Refund {

	private int refundNo;
	private int payNo;
	private int refundPrice;
	private int refundFee;
	private String refundReason;
	@Override
	public String toString() {
		return "Refund [refundNo=" + refundNo + ", payNo=" + payNo + ", refundPrice=" + refundPrice + ", refundFee="
				+ refundFee + ", refundReason=" + refundReason + "]";
	}
	public int getRefundNo() {
		return refundNo;
	}
	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getRefundPrice() {
		return refundPrice;
	}
	public void setRefundPrice(int refundPrice) {
		this.refundPrice = refundPrice;
	}
	public int getRefundFee() {
		return refundFee;
	}
	public void setRefundFee(int refundFee) {
		this.refundFee = refundFee;
	}
	public String getRefundReason() {
		return refundReason;
	}
	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}
	
	
}
