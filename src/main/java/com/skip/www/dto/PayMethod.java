package com.skip.www.dto;

public class PayMethod {

	private int payMethodNo;
	private String payMethod;
	@Override
	public String toString() {
		return "PayMethod [payMethodNo=" + payMethodNo + ", payMethod=" + payMethod + "]";
	}
	public int getPayMethodNo() {
		return payMethodNo;
	}
	public void setPayMethodNo(int payMethodNo) {
		this.payMethodNo = payMethodNo;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	
	
}
