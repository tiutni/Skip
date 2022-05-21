package com.skip.www.dto;

public class Pay {

	private int payNo;
	private int orderNo;
	private int paidAmount;
	private String merchantUid;
	private String applyNum;
	
	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", orderNo=" + orderNo + ", paidAmount=" + paidAmount + ", merchantUid="
				+ merchantUid + ", applyNum=" + applyNum + "]";
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
	public int getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(int paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public String getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}
	
}
