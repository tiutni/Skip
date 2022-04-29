package com.skip.www.dto;

public class AddressBook {
	
	private int addNo;
	private int userNo;
	private String addName;
	private String addr;
	private String addrZipCode;

	@Override
	public String toString() {
		return "AddressBook [addNo=" + addNo + ", userNo=" + userNo + ", addName=" + addName + ", addr=" + addr
				+ ", addrZipCode=" + addrZipCode + "]";
	}
	
	public int getAddNo() {
		return addNo;
	}
	
	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public String getAddName() {
		return addName;
	}
	
	public void setAddName(String addName) {
		this.addName = addName;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getAddrZipCode() {
		return addrZipCode;
	}
	
	public void setAddrZipCode(String addrZipCode) {
		this.addrZipCode = addrZipCode;
	}
	

}
